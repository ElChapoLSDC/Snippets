RegisterServerEvent("ls_???????_dc_kickForBeingAnAFKDouchebag")
AddEventHandler("ls_???????_dc_kickForBeingAnAFKDouchebag", function()
	DropPlayer(source, "Vous avez été AFK trop longtemps.")
end)