-- Clear fonts cache after a screen size change
hook.Add("OnScreenSizeChanged", "NPC_MEDIC:OnScreenSizeChanged", function()
	NPC_MEDIC.Fonts = {}
end)