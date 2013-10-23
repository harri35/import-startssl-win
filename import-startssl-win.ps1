##Edit the javaPath variable!
##
## For Gradle users - "gradle -version" can help to pick out the Java Gradle is using
## For Eclipse users - base path should be the same one you see (and have checked) from Eclipse -> Window -> Preferences -> Java -> Installed JREs
##
$javaPath = "D:\dev\Java\jdk1.7\jre\lib\security\cacerts"
## PS: This may or may not be this one "Get-Childitem env:JAVA_HOME"

## The following should be ok and should not need any editing
$scriptPath = split-path -parent $MyInvocation.MyCommand.Definition
$client = new-object System.Net.WebClient

echo "Downloading .."
$client.DownloadFile("http://www.startssl.com/certs/ca.crt","$scriptPath\ca.crt")
$client.DownloadFile("http://www.startssl.com/certs/sub.class1.server.ca.crt","$scriptPath\sub.class1.server.ca.crt")
$client.DownloadFile("http://www.startssl.com/certs/sub.class2.server.ca.crt","$scriptPath\sub.class2.server.ca.crt")
$client.DownloadFile("http://www.startssl.com/certs/sub.class3.server.ca.crt","$scriptPath\sub.class3.server.ca.crt")
$client.DownloadFile("http://www.startssl.com/certs/sub.class4.server.ca.crt","$scriptPath\sub.class4.server.ca.crt")

echo "Registering .."
keytool -import -trustcacerts -keystore $javaPath -storepass changeit -noprompt -alias startcom.ca -file ca.crt
keytool -import -trustcacerts -keystore $javaPath -storepass changeit -noprompt -alias startcom.ca.sub.class1 -file sub.class1.server.ca.crt
keytool -import -trustcacerts -keystore $javaPath -storepass changeit -noprompt -alias startcom.ca.sub.class2 -file sub.class2.server.ca.crt
keytool -import -trustcacerts -keystore $javaPath -storepass changeit -noprompt -alias startcom.ca.sub.class3 -file sub.class3.server.ca.crt
keytool -import -trustcacerts -keystore $javaPath -storepass changeit -noprompt -alias startcom.ca.sub.class4 -file sub.class4.server.ca.crt


echo "Deleting temp files .."
rm "$scriptPath\ca.crt"
rm "$scriptPath\sub.class1.server.ca.crt"
rm "$scriptPath\sub.class2.server.ca.crt"
rm "$scriptPath\sub.class3.server.ca.crt"
rm "$scriptPath\sub.class4.server.ca.crt"
