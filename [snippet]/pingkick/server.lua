-- CONFIG --

-- Ping Limit
pingLimit = 1800

-- CODE --

RegisterServerEvent("ls_???????_dc_checkMyPingBro")
AddEventHandler("ls_???????_dc_checkMyPingBro", function()
	ping = GetPlayerPing(source)
	if ping >= pingLimit then
		DropPlayer(source, "Le ping est trop élevé (Limite: " .. pingLimit .. " Votre ping: " .. ping .. ")")
	end
end)