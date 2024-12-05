util.AddNetworkString("NPC_MEDIC:UpdateCache")
util.AddNetworkString("IndicateDropoffPosition")
util.AddNetworkString("OpenNPCSangMenu")
util.AddNetworkString("StartMission")

net.Receive("NPC_MEDIC:UpdateCache", function(_, pPlayer)

	if not IsValid(pPlayer) then return end
	
	local iCurTime = CurTime()
	if (pPlayer.iNPC_MEDICCooldown or 0) > iCurTime then return end
	pPlayer.iNPC_MEDICCooldown = iCurTime + 1

	NPC_MEDIC.Cache = net.ReadTable()
	print("[NPC_MEDIC] Server cache updated!")

end)