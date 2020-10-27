local BlockedExplosions = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 21, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38}

AddEventHandler(
  "explosionEvent",
  function(sender, ev)
    for _, v in ipairs(BlockedExplosions) do
      if ev.explosionType == v then
        CancelEvent()
		
		--Revive--
		Wait(2000)
		TriggerClientEvent(‘esx_ambulancejob:revive’, sender)
		local xPlayers = ESX.GetPlayers()

		for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		TriggerClientEvent(‘esx_ambulancejob:revive’, xPlayer)
		end
		--Fin Revive--
		
        return
      end
    end
  end
)

