net.Receive("StartMission", function(len, ply)
    if not ply or not ply:IsValid() then return end

    local entity = net.ReadEntity()
    if not entity or not entity:IsValid() then return end

    if entity:GetClass() != "npc_blood" then  return end

    if ply:GetPos():Distance(entity:GetPos()) > 200 then return end

    local cost
    local MedicEnVille = false

    if NPC_MEDIC.ExpansiveIfMedicInTown then
        for _, v in ipairs(player.GetAll()) do
            if v:Team() == NPC_MEDIC.TeamsToCheck then
                MedicEnVille = true
                break
            end
        end
    end

    if MedicEnVille then
        cost = NPC_MEDIC.PriceWithMedecin
    else
        cost = NPC_MEDIC.PriceWithoutMedecin
    end

    if ply:canAfford(cost) then
        ply:addMoney(-cost)
        ply:SetHealth(100)
        ply:ChatPrint("Vous avez été soigné pour " .. cost .. "€!")
    else
        ply:ChatPrint("Vous n'avez pas suffisamment d'argent pour vous faire soigner!")
    end
end)