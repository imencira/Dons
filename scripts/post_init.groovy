import groovy.json.*

def beforePushToScratchOrg(final String sfdxCommand, final String username , final String accessToken, final String urlInstance , final String workspaceDirectory) {
  // Get outputroles
 // Abandonne par Etienne
 // importRoles(sfdxCommand, username , workspaceDirectory)
  //println("Output Role : $outputRoles")
}

def afterPushToScratchOrg(final String sfdxCommand, final String username,final String accessToken,final String urlInstance , final String workspaceDirectory){
  // Get identifier delegation
    def listDls = retrieveIdentifierDelegation(sfdxCommand, username)
    println("ListDls : " + listDls)

    // Get identifier direction regionale
    def listDrs = retrieveIdentifierDirRegionale(sfdxCommand, username)
    println("ListDrs : " + listDrs)

    // Delete all list dls
    deleteAllListDls(listDls, urlInstance, accessToken)
    println("Delete all listDls")

    // Delete all list drs
    deleteAllListDrs(listDrs, urlInstance, accessToken)
    println("Delete all listDrs")

    // Create all dls drs
    creationAllDlsDrs(urlInstance, accessToken , workspaceDirectory)

    // Assign permset
    assignPermset(sfdxCommand, username)
}


def importRoles(final String sfdxCommand, final String username , final String workspaceDirectory){
    def sout = new StringBuilder(), serr = new StringBuilder()

    // recupération des identifiants des delegations
    ProcessBuilder builder = new ProcessBuilder(sfdxCommand, "force:data:tree:import", "-f", "$workspaceDirectory/config/datas/roles/UserRole.json", "-u", username)
    builder = builder.redirectErrorStream(true) 
    Process process = builder.start()
    def exitProcess = process.waitFor()
    if (exitProcess == 0){
        println("Import role works with success")
    }else{
      error "Error in importing roles"
    }
    /*
    return sout.toString();*/
  }

// recupération des identifiants des delegations
def retrieveIdentifierDelegation(String sfdxCommand,String username){
    def listDls = new StringBuilder()

    ProcessBuilder builder = new ProcessBuilder(sfdxCommand, "force:data:soql:query", "-q", "SELECT Id FROM D_l_gation__c", "-u", username, "-r", "csv")
    builder.redirectErrorStream(true)

    Process process = builder.start()
    def exitProcess = process.waitFor()
    if (exitProcess == 0){
        InputStream stdout = process.getInputStream ()
        BufferedReader reader = new BufferedReader (new InputStreamReader(stdout))

        def i = 0
        while ((line = reader.readLine ()) != null) {
          if (i != 0) {
            if (i == 1) {
              listDls.append(line)
            } else {
              listDls.append(",").append(line)
            }
          } 
        i++
       }
        println "Liste des DLs $listDls"
   
     }else{
       error "Error in retrieving delegation"
     }
    
  }

  
  // Recuperation des identifiants de 
  def retrieveIdentifierDirRegionale(String sfdxCommand,String username){
      // recuperation des identifiants des DR
    def listDrs = new StringBuilder()
    ProcessBuilder builder = new ProcessBuilder(sfdxCommand, "force:data:soql:query", "-q", "SELECT Id FROM Direction_R_gionale__c", "-u", username, "-r", "csv")
    builder.redirectErrorStream(true) 
    Process process = builder.start()
    InputStream stdout = process.getInputStream ()
    BufferedReader reader = new BufferedReader (new InputStreamReader(stdout)) 
    i = 0
    while ((line = reader.readLine ()) != null) {
      if (i != 0) {
        if (i == 1) {
           listDrs.append(line)
       } else {
           listDrs.append(",").append(line)
       }

      } 
      i++
     }
     println "Liste des DRs $listDrs"
     return listDrs.toString()
  }

 
  def deleteAllListDls(final String listDls, final String urlInstance, final String accessToken){
    // Utilisation API composite + jeton pour delete des DL en un coup
    if (listDls != null && listDls.length() > 0) {
      def deleteReq = new URL("$urlInstance/services/data/v46.0/composite/sobjects?ids=" + listDls).openConnection();
      deleteReq.setRequestMethod("DELETE")
      deleteReq.setRequestProperty("Authorization", "Bearer $accessToken")
      def deleteReqRC = deleteReq.getResponseCode();
      println(deleteReqRC);
      if (deleteReqRC.equals(200)) {
      } else {
          throw new Exception("FAILURE: Error response: \n${deleteReqRC.statusLine}")
      }
    }
  }

  
  def deleteAllListDrs(final String listDrs, final String urlInstance, final String accessToken){
    // Utilisation API composite + jeton pour delete des DR en un coup
    if (listDrs != null && listDrs.length() > 0) {
        def deleteReq = new URL("$urlInstance/services/data/v46.0/composite/sobjects?ids=" + listDrs).openConnection();
        deleteReq.setRequestMethod("DELETE")
        deleteReq.setRequestProperty("Authorization", "Bearer $accessToken")
        def deleteReqRC = deleteReq.getResponseCode();
        println(deleteReqRC);
        if (deleteReqRC.equals(200)) {
        } else {
          throw new Exception("FAILURE: Error response: \n${deleteReqRC.statusLine}")
        }
    }
  }

  def creationAllDlsDrs(final String urlInstance, final String accessToken, final String workspaceDirectory){
      // Itere sur les json des DR/DL pour creation, avec API composite
      new File("$workspaceDirectory/config/datas").listFiles().each { def f ->
        if (f.file && f.name.endsWith('.json') && !f.name.endsWith("UserRole.json")) {

          def post = new URL("$urlInstance/services/data/v46.0/composite/").openConnection()
          post.setRequestMethod("POST")
          post.setDoOutput(true)
          post.setRequestProperty("Content-Type", "application/json")
          post.setRequestProperty("Authorization", "Bearer $accessToken")
          post.getOutputStream().write(f.text.getBytes("UTF-8"));
          def postRC = post.getResponseCode();
          if (postRC.equals(200)) {
              println("Create all drsdl from file $f.name")
          } else {
              throw new Exception("FAILURE: Error response: \n${postRC.statusLine} from file $file.name")
          }
      }
     }
  }

  def assignPermset(final String sfdxCommand , final String username){
       ProcessBuilder builder = new ProcessBuilder(sfdxCommand, "force:user:permset:assign", "-n", "SacemDons", "-u", username)
       builder.redirectErrorStream(true) 
       Process process = builder.start()
       def exitProcess = process.waitFor()
       if (exitProcess == 0){
           println("The permset SacemDons is assigned for user $username")
       }else{
           error "Error in assigning the permset SacemDons"
       }

  }

// Necessary for the pipeline Jenkins
return this