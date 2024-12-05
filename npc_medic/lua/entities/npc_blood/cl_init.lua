include("shared.lua")

function ENT:Draw()
    self:DrawModel()
	self:ResetSequence("idle_all_01")
    if self:GetPos():Distance(LocalPlayer():GetPos()) < 500 then
        local Ang = self:GetAngles()

        Ang:RotateAroundAxis(Ang:Forward(), 90)
        Ang:RotateAroundAxis(Ang:Right(), -90)
    
        cam.Start3D2D(self:GetPos() + self:GetUp() * 79, Angle(0, LocalPlayer():EyeAngles().y - 90, 90), 0.25)

            surface.SetDrawColor(255, 255, 255)
            surface.DrawOutlinedRect(-50, -15, 100, 30, 2)

            surface.SetDrawColor(0, 0, 0, 128)
            surface.DrawRect(-50, -13, 100, 26)		

            draw.SimpleText("Médecin", "Trebuchet24", 0, -2, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        cam.End3D2D()
    end
end