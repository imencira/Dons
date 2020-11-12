import groovy.json.*

def username = args[1]
def email = args[0]

// parse les couples user -> role
def jsonUsersRoles = new JsonSlurper()
def dataUsersRoles = jsonUsersRoles.parse(new File("./datas/users/roles/users_roles.json"))
println "users-roles=$dataUsersRoles"

new File("./datas/users").listFiles().each { def f ->
    println f.name
    if (f.file && f.name.endsWith('.json')) {
        println(f)

        def sout = new StringBuilder(), serr = new StringBuilder()

        // creation du user
        ProcessBuilder builder = new ProcessBuilder("sfdx",
                                            "force:user:create", "--definitionfile", "./datas/users/" + f.name,
                                            "email=$email",
                                            "-u", username)
        builder.redirectErrorStream(true)
        Process process = builder.start()
        InputStream stdout = process.getInputStream ()
        BufferedReader reader = new BufferedReader (new InputStreamReader(stdout))
        while ((line = reader.readLine ()) != null) {
            sout.append(line)
        }
        println "Result=$sout"
        def id = sout.substring(sout.indexOf('[') + 1, sout.indexOf(']'))
        def firstIndex = sout.indexOf('"') + 1;
        def userLogin = sout.substring(firstIndex, sout.indexOf('"', firstIndex))
        println "Id=$id, userLogin=$userLogin"

        // recup du alias,...
        def jsonUser = new JsonSlurper()
        def dataUser = jsonUser.parse(f)
        def alias = dataUser.Alias;
        println "alias=$alias"

        // recup du role en fonction de l'alias
        for (int i = 0; i < dataUsersRoles.size(); i++) {            
            if (dataUsersRoles[i].alias.equals(alias)) {
                def userRole = dataUsersRoles[i].role;
                
                println "role=$userRole"

                sout = new StringBuilder()
                serr = new StringBuilder()

                builder = new ProcessBuilder("sfdx",
                                                    "force:apex:execute", "-u", username)
                builder.redirectErrorStream(true) 
                process = builder.start()

                OutputStream stdin = process.getOutputStream()
                stdout = process.getInputStream ()

                BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(stdin))
                def sb = new StringBuilder()
                sb.append("List<User> users = [SELECT Id FROM User WHERE Id = '$id'];\n")
                sb.append("List<UserRole> roles = [SELECT Id FROM UserRole WHERE Name = '$userRole'];\n")
                sb.append("if (!users.isEmpty() && !roles.isEmpty()) {\n")
                sb.append("    users[0].UserRoleId = roles[0].Id;\n")
                sb.append("    update users[0];\n")
                sb.append("}\n")

                writer.write(sb.toString())
                writer.flush()
                writer.close()

                reader = new BufferedReader (new InputStreamReader(stdout)) 
                while ((line = reader.readLine ()) != null) {
                    sout.append(line)
                }
                println "Result=$sout"
                break
            }
        }

        sout = new StringBuilder()
        serr = new StringBuilder()

        // recup du password
        cmd = "sfdx force:org:display --json -u $userLogin"
        proc = cmd.execute()
        proc.consumeProcessOutput(sout, serr)
        proc.waitForOrKill(10000)
        println "Res command display org info> $sout error> $serr"
        jsonSlurper = new JsonSlurper()
        object = jsonSlurper.parseText(sout.toString())
        def password = object.result.password
        println "password=$password"
    }
}
