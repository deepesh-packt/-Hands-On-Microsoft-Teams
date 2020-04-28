#1
$teamOwnerEmail = "john@funskating.com"
$channelName = "Projects"
#2
Connect-MicrosoftTeams
$teamsWhereIam = Get-Team –User $teamOwner
#3
for ($i=0; $i -lt $teamsWhereIam.length; $i++) {
	#4
	$groupId = $teamsWhereIam[$i].GroupId
	$teamOwners=Get-TeamUser –GroupId $groupId –Role Owner
	#5
	for ($j=0; $j -lt $teamOwners.length; $j++) {
	#6
		if($teamOwners[$j].User –eq $teamOwnerEmail){
			New-TeamChannel –GroupId $groupId –DisplayName $channelName
		}
	}
}
Disconnect-MicrosoftTeams