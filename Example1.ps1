#1
$teamName = "Project Y"
$teamDescription = "The new generation of electric skateboards"
$teamOwner = "joao@funskating.com"
$teamVisibility = "Private"
$teamEditMessagesPolicy = $false
$teamDeliteMessagesPolicy = $false
#2
$teamChannels = @(“Procedures", “Legal")
#3
$teamMembers = @(“josh@funskating.com", “adele@funskating.com")
#4
Connect-MicrosoftTeams
#5
$teamDetails=New-Team -DisplayName $teamName -Description $teamDescription -Owner $teamOwner -Visibility $teamVisibility -AllowUserEditMessages $teamEditMessagesPolicy -AllowOwnerDeleteMessages $teamDeliteMessagesPolicy
#6
for ($i=0; $i -lt $teamChannels.length; $i++) {
	New-TeamChannel -GroupId $teamDetails.GroupId -DisplayName $teamChannels[$i]
}
#7
for ($i=0; $i -lt $teamMembers.length; $i++) {
	Add-TeamUser -GroupId $teamDetails.GroupId -User $teamMembers[$i] -role "Member"
}
Disconnect-MicrosoftTeams