local RestoreNPCPanelW, RestoreNPCPanelH = RX(400), RY(250)
local isAnimating = true

net.Receive("OpenNPCSangMenu", function()
    local ply = LocalPlayer()
    local entity = net.ReadEntity()

    local NPCBloodPanel = vgui.Create("DFrame")
    NPCBloodPanel:SetSize(0,0)
    NPCBloodPanel:SetTitle("")
    NPCBloodPanel:SetVisible(true)
    NPCBloodPanel:SetDraggable(false)
    NPCBloodPanel:ShowCloseButton(false)
    NPCBloodPanel:MakePopup()
    NPCBloodPanel:Center()

    NPCBloodPanel:SizeTo(RestoreNPCPanelW, RestoreNPCPanelH, 1.8, 0, 0.1, function()
        isAnimating = false
    end)

    NPCBloodPanel.Think = function(self)
        self:Center()
    end

    NPCBloodPanelCloseButton = vgui.Create("DButton", NPCBloodPanel)
    NPCBloodPanelCloseButton:SetSize(RX(30),RY(30))
    NPCBloodPanelCloseButton:SetPos(RestoreNPCPanelW - 35, 5)
    NPCBloodPanelCloseButton:SetText("")

    NPCBloodPanelCloseButton.Paint = function(self, w, h)
        draw.RoundedBox(5, 0, 0, w, h, Color(255, 80, 80, 255)) 
        draw.SimpleText("r", "Marlett", 15, 15, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end

    NPCBloodPanelCloseButton.DoClick = function()
        if IsValid(NPCBloodPanel) then
            NPCBloodPanel:Remove()
        end
    end

    NPCBloodPanelAcceptMission = vgui.Create("DButton", NPCBloodPanel)
    NPCBloodPanelAcceptMission:SetSize(RX(150), RY(50))
    NPCBloodPanelAcceptMission:SetPos(RestoreNPCPanelW / 2 - 150 / 2, 150)
    NPCBloodPanelAcceptMission:SetText("")

    NPCBloodPanelAcceptMission.Paint = function(self, w, h)
        local buttonColor = LocalPlayer():getDarkRPVar("money") >= NPC_MEDIC.PriceWithoutMedecin and Color(0, 255, 0) or Color(255, 0, 0)
        draw.RoundedBox(5, 0, 0, w, h, buttonColor)
        local TextSizeW, TextSizeH = surface.GetTextSize("Accepter")

        surface.SetFont(NPC_MEDIC:Font(30))
        surface.SetTextColor(Color(255,255,255))
        surface.SetTextPos(NPCBloodPanelAcceptMission:GetWide() / 2.5 - TextSizeW / 4, NPCBloodPanelAcceptMission:GetTall() / 3.5 - TextSizeH / 2.5)
        surface.DrawText("Accepter")
    end

    NPCBloodPanelAcceptMission.DoClick = function()
        net.Start("StartMission")
        net.WriteEntity(entity)
        net.SendToServer()
        NPCBloodPanel:Remove()
    end
    

    NPCBloodPanel.Paint = function(self, w, h)
        draw.RoundedBox(10, 0, 0, w, h, Color(23, 23, 23, 245))
    
        surface.SetFont("Trebuchet24")
    
        local isFirefighterInTown = false
    
        if NPC_MEDIC.ExpansiveIfMedicInTown then
            for _, v in ipairs(player.GetAll()) do
                if v:Team() == NPC_MEDIC.TeamsToCheck then
                    isFirefighterInTown = true
                    break
                end
            end
        end

        if isFirefighterInTown then
            draw.SimpleText("Vous soignez coûte " .. NPC_MEDIC.PriceWithMedecin .. NPC_MEDIC.Devise, NPC_MEDIC:Font(35), w / 2, 70, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            draw.SimpleText(NPC_MEDIC.Text, "Trebuchet24", w / 2, 95, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        else
            draw.SimpleText("Vous soignez coûte " .. NPC_MEDIC.PriceWithoutMedecin .. NPC_MEDIC.Devise, NPC_MEDIC:Font(35), w / 2, 70, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            --draw.SimpleText("car aucun pompier n'est en ville", "Trebuchet24", w / 2, 95, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end
    end
    
end)