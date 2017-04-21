Clear-Host
$users=Get-ADObject -Filter * -Properties homedirectory,SamAccountName,CanonicalName | where {$_.homedirectory -match "bs09msk"} | Select-Object * -ExpandProperty SamAccountName
foreach ($user in $users){
Set-ADUser $user.SamAccountName -HomeDirectory \\fs16msk\$user 
}
