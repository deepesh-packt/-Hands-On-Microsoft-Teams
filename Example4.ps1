#1
Import-ModuleSkypeOnlineConnector
$credentials = Get-Credential
$sfbSession = New-CsOnlineSession -Credential $credentials
Import-PSSession $sfbSession
#2
$usersEmails= @("peter@funskating.com", "maria@funskating.com")
#3
for ($i=0; $i -lt $usersEmails.length; $i++) {
	Grant-CsTeamsAppSetupPolicy -identity $usersEmails[$i] -PolicyName "Company App"
}