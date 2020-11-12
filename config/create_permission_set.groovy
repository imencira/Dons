import groovy.json.*

def sout = new StringBuilder(), serr = new StringBuilder()

def username = args[1]

// recupération des identifiants des delegations
// sfdx force:user:permset:assign -n SacemDons -u test-qefa56ndj1pf@example.com
ProcessBuilder builder = new ProcessBuilder("sfdx", "force:user:permset:assign", "-n", "SacemDons", "-u", username)
builder.redirectErrorStream(true) 
Process process = builder.start()
InputStream stdout = process.getInputStream ()
BufferedReader reader = new BufferedReader (new InputStreamReader(stdout)) 
while ((line = reader.readLine ()) != null) {
    sout.append(line)
}
println "Result $sout"

