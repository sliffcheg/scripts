Clear-Host
$users=Get-ADObject -Filter * -Properties homedirectory,SamAccountName,CanonicalName | where {$_.homedirectory -match "servername1"} | Select-Object * -ExpandProperty SamAccountName
foreach ($user in $users){
Set-ADUser $user.SamAccountName -HomeDirectory \\servername2\$user 
}
