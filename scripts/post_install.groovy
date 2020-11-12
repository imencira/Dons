import groovy.json.*

def afterInstallMainPackage(final String sfdxCommand, final String username, final String workspaceDirectory){
    // Deploy profiles
    deployMetadata(sfdxCommand, username , workspaceDirectory)

    // Deploy folder meta pushed => les process builder
    deployFolderMetaPushed(sfdxCommand, username , workspaceDirectory)
}


/**
 ** Method to deploy profile
 */
def deployMetadata(final String sfdxCommand, final String username, final String workspaceDirectory){
    def sout = new StringBuilder(), serr = new StringBuilder()
    ProcessBuilder builder = new ProcessBuilder(sfdxCommand, "force:source:deploy", "-m", "\"Profile, CustomNotificationType\"", "-u", username, "-l", "RunSpecifiedTests", "-r", "SendEmailTest","--json")
    builder.directory(new File(workspaceDirectory))
    builder.redirectErrorStream(true)

    Process process = builder.start()
    def exitProcess = process.waitFor()
    process.consumeProcessOutput(sout, serr)
    if (exitProcess == 0){
        println("The profiles has been deployed successfully")
    }else{
        error("Impossible to deploy profiles due to the status : ${exitProcess} and error ${sout}")
    }  

}

/**
 * Method to deploy folder meta pushed.
 */
def deployFolderMetaPushed(final String sfdxCommand, final String username, final String workspaceDirectory){
    def sout = new StringBuilder(), serr = new StringBuilder()
    ProcessBuilder builder = new ProcessBuilder(sfdxCommand, "force:source:deploy", "-p", "folder_meta_pushed", "-u", username, "-l", "RunSpecifiedTests", "-r", "SendEmailTest","--json")
    builder.directory(new File(workspaceDirectory))
    builder.redirectErrorStream(true)

    Process process = builder.start()
    def exitProcess = process.waitFor()
    if (exitProcess == 0){
        println("The flow has been deployed successfully")
    }else{
        error("Impossible to deploy flow due to the status : ${exitProcess} and error : ${sout}")
    }   
}


// Necessary for the pipeline Jenkins
return this