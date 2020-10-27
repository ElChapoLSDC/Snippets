checkRate = 1000

Citizen.CreateThread(function()
	while true do
		Wait(checkRate)

		TriggerServerEvent("ls_???????_dc_checkMyPingBro")
	end
end)