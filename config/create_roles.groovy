import groovy.json.*

def sout = new StringBuilder(), serr = new StringBuilder()

def username = args[1]

// recupération des identifiants des delegations
ProcessBuilder builder = new ProcessBuilder("sfdx", "force:data:tree:import", "-f", "./datas/roles/UserRole.json", "-u", username)
builder.redirectErrorStream(true) 
Process process = builder.start()
InputStream stdout = process.getInputStream ()
BufferedReader reader = new BufferedReader (new InputStreamReader(stdout)) 
while ((line = reader.readLine ()) != null) {
    sout.append(line)
}
println "Result $sout"
