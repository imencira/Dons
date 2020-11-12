#!groovy
import groovy.json.JsonSlurperClassic

/*
Ajout du permission-set MARIO_DONS sur le user Mario 
Ce script doit être lancé par un utilisateur déjà authentifié via web ou jwt sur l'org cible 
*/

def method(targetOrg) {
    def sout = new StringBuilder(), serr = new StringBuilder()
    def proc

    proc = ['sfdx', 'force:data:record:get', '-s', 'PermissionSet', '-w', "Name=MARIO_DONS", '--json', '-u', targetOrg].execute()
    proc.consumeProcessOutput(sout, serr)
    proc.waitForOrKill(10000)
    println "GET PermSet out> $sout err> $serr"        

    def jsonSlurper = new JsonSlurperClassic()
    robj = jsonSlurper.parseText(sout.toString())
    if (robj.status != 0) { error 'PermSet retrieve failed: ' + robj.message }
    PERMISSIONSET_ID = robj.result.Id

    println "PermSet Id= $PERMISSIONSET_ID"

    proc = ['sfdx', 'force:data:record:get', '-s', 'User', '-w', "Firstname=Admin LastName=Mario", '--json', '-u', targetOrg].execute()
    sout = new StringBuilder()
    serr = new StringBuilder()
    proc.consumeProcessOutput(sout, serr)
    proc.waitForOrKill(10000)
    println "GET USER mario out> $sout err> $serr"        

    jsonSlurper = new JsonSlurperClassic()
    robj = jsonSlurper.parseText(sout.toString())
    if (robj.status != 0) { error 'user mario retrieve failed: ' + robj.message }
    USER_ID = robj.result.Id        

    // Ajout du permissionset sur le user jenkins-ci
    proc = ['sfdx', 'force:data:record:create', '-s', 'PermissionSetAssignment', '-v', "AssigneeId=$USER_ID PermissionSetId=$PERMISSIONSET_ID", '-u', targetOrg].execute()
    sout = new StringBuilder()
    serr = new StringBuilder()
    proc.consumeProcessOutput(sout, serr)
    proc.waitForOrKill(10000)
    println "CREATE PermissionSet Assignment out> $sout err> $serr"
}

static main(args) {
    if (args) {
        println "IN " + args
        "${args.head()}"( *args.tail() )
    }
}
