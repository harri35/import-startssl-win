import-startssl-win
===================

Windows PowerShell script to help with Java and the StartSSL CA certificates. 
This is a PowerShell version of the script at https://github.com/erasmospunk/import-startssl

In order for this to work:
1) You need to edit the script and add the correct Java path to "$javaPath". 
Sorry, on Windows there can be a lot of different Java installs and automatic detection doesn't usually work out as the user  needs the certificates to be added to a specific Java install.

2) You need to allow PowerShell to run the script. Upen a new PowerShell in admin mode and set: 
	Set-ExecutionPolicy Bypass

After the script has successfully executed you can restore the setting by:
	Set-ExecutionPolicy Restricted
	

