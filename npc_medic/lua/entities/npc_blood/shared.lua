ENT.Base = "base_ai"
ENT.Type = "ai"

ENT.PrintName = "NPC Medic"
ENT.Author    = "Dydy"
ENT.Category  = "Didi.IN7"

ENT.Spawnable      = true
ENT.AdminSpawnable = true

ENT.AutomaticFrameAdvance = true

function ENT:SetAutomaticFrameAdvance(bUsingAnim)
	self.AutomaticFrameAdvance = bUsingAnim
end