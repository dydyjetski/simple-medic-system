NPC_MEDIC.Config = {}

NPC_MEDIC.Devise = "$" -- Devise utilisée pour les prix

NPC_MEDIC.Model = "models/player/breen.mdl" -- Model du NPC

NPC_MEDIC.PriceWithoutMedecin = 5000 -- Prix si aucun joueur n'est dans la team spécifiée ci-dessous

NPC_MEDIC.ExpansiveIfMedicInTown = true -- Si true, le prix sera augmenté si un joueur est dans la team spécifiée ci-dessous

NPC_MEDIC.PriceWithMedecin = 40000 -- Prix si un joueur est dans la team spécifiée ci-dessous

NPC_MEDIC.TeamsToCheck = TEAM_DRONE -- Team à vérifier si un joueur est dedans pour augmenter le prix

NPC_MEDIC.Text = "car un pompier est en ville" -- Texte à afficher dans le NPC si un joueur est dans la team spécifiée ci-dessous