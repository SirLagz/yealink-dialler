#Yealink Dialler
#GPL3

#Phone Username / Password
[string]$userName = 'admin'
[string]$userPassword = 'admin'

#Phone IP Address
$ipPhone = "x.x.x.x"

#Phone SIP Account
$sipPhone = "account@host"

#Title of Window
$title = 'Dial'

#Prompt
$msg   = 'Enter Number to call:'

[void][Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic')
$text = [Microsoft.VisualBasic.Interaction]::InputBox($msg, $title)
$text = $text -replace '\s','' #Strip whitespace
[securestring]$secStringPassword = ConvertTo-SecureString $userPassword -AsPlainText -Force
[pscredential]$credObject = New-Object System.Management.Automation.PSCredential ($userName, $secStringPassword)
Invoke-WebRequest -Uri "http://$ipPhone/servlet?key=number=$text&outgoing_uri=$sipPhone" -Credential $credObject
