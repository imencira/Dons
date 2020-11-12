import groovy.json.*

def sout = new StringBuilder(), serr = new StringBuilder()

// recuperation du jeton d'authentification à l'org cible username
def username = args[0]
def cmd = "sfdx force:org:display --json -u $username"
def proc = cmd.execute()
proc.consumeProcessOutput(sout, serr)
proc.waitForOrKill(10000)
println "Res command display org info> $sout error> $serr"
// recup du jeton dans la trame json
def jsonSlurper = new JsonSlurper()
def object = jsonSlurper.parseText(sout.toString())
//println object.result.accessToken
println object.result.instanceUrl

// recupération des identifiants des delegations
def listeDls = new StringBuilder()
ProcessBuilder builder = new ProcessBuilder("sfdx", "force:data:soql:query", "-q", "SELECT Id FROM D_l_gation__c", "-u", username, "-r", "csv")
builder.redirectErrorStream(true) 
Process process = builder.start()
InputStream stdout = process.getInputStream ()
BufferedReader reader = new BufferedReader (new InputStreamReader(stdout)) 
def i = 0
while ((line = reader.readLine ()) != null) {
   if (i == 0 || i == 1) {
   } else {
       if (i == 2) {
           listeDls.append(line)
       } else {
           listeDls.append(",").append(line)
       }
   }
   i++
}
println "Liste des DLs $listeDls"

// recuperation des identifiants des DR
def listeDrs = new StringBuilder()
builder = new ProcessBuilder("sfdx", "force:data:soql:query", "-q", "SELECT Id FROM Direction_R_gionale__c", "-u", username, "-r", "csv")
builder.redirectErrorStream(true) 
process = builder.start()
stdout = process.getInputStream ()
reader = new BufferedReader (new InputStreamReader(stdout)) 
i = 0
while ((line = reader.readLine ()) != null) {
   if (i == 0 || i == 1) {
   } else {
       if (i == 2) {
           listeDrs.append(line)
       } else {
           listeDrs.append(",").append(line)
       }
   }
   i++
}
println "Liste des DRs $listeDrs"


def hostname = object.result.instanceUrl

// Utilisation API composite + jeton pour delete des DL en un coup
if (listeDls.length() > 0 && !"Your query returned no results.".equals(listeDls.toString())) {
    def deleteReq = new URL("$hostname/services/data/v46.0/composite/sobjects?ids=" + listeDls).openConnection();
    deleteReq.setRequestMethod("DELETE")
    deleteReq.setRequestProperty("Authorization", "Bearer $object.result.accessToken")
    def deleteReqRC = deleteReq.getResponseCode();
    println(deleteReqRC);
    if (deleteReqRC.equals(200)) {
    } else {
        throw new Exception("FAILURE: Error response: \n${deleteReqRC}")
    }
}

// Utilisation API composite + jeton pour delete des DR en un coup
if (listeDrs.length() > 0 && !"Your query returned no results.".equals(listeDrs.toString())) {
    def deleteReq = new URL("$hostname/services/data/v46.0/composite/sobjects?ids=" + listeDrs).openConnection();
    deleteReq.setRequestMethod("DELETE")
    deleteReq.setRequestProperty("Authorization", "Bearer $object.result.accessToken")
    def deleteReqRC = deleteReq.getResponseCode();
    println(deleteReqRC);
    if (deleteReqRC.equals(200)) {
    } else {
        throw new Exception("FAILURE: Error response: \n${deleteReqRC}")
    }
}

// Itere sur les json des DR/DL pour creation, avec API composite
new File("./datas").listFiles().each { def f ->
    println f.name
    if (f.file && f.name.endsWith('.json') && f.name.startsWith('creation_dl')) {
        println(f)

        def post = new URL("$hostname/services/data/v46.0/composite/").openConnection();

        def message = f.text
        
        post.setRequestMethod("POST")
        post.setDoOutput(true)
        post.setRequestProperty("Content-Type", "application/json")
        post.setRequestProperty("Authorization", "Bearer $object.result.accessToken")
        post.getOutputStream().write(message.getBytes("UTF-8"));
        def postRC = post.getResponseCode();
        println(postRC);
        if (postRC.equals(200)) {
            println(post.getInputStream().getText());
        } else {
            throw new Exception("FAILURE: Error response: \n${postRC.statusLine}")
        }
    }
}

