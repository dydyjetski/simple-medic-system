AddCSLuaFile("shared.lua")
AddCSLuaFile("cl_init.lua")

include("shared.lua")

function ENT:Initialize()
    self:SetModel(NPC_MEDIC.Model)
    self:SetHullType(HULL_HUMAN)
	self:SetHullSizeNormal()
	self:SetNPCState(NPC_STATE_SCRIPT)
	self:SetSolid(SOLID_BBOX)
	self:CapabilitiesAdd(CAP_ANIMATEDFACE)
	self:SetUseType(SIMPLE_USE)
	self:DropToFloor()
	self:SetMaxYawSpeed(90)
end

function ENT:OnTakeDamage()
    return false
end

function ENT:Use(ply, caller, useType, value)
	net.Start("OpenNPCSangMenu")
    net.WriteEntity(self)
	net.Send(ply)
end