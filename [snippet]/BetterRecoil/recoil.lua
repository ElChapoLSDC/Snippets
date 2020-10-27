local recoils = {
	[453432689] = 5.3, -- PISTOL
	[3219281620] = 5.3, -- PISTOL MK2
	[1593441988] = 5.2, -- COMBAT PISTOL
	[584646201] = 0.0, -- AP PISTOL
	[2578377531] = 5.6, -- PISTOL .50
	[324215364] = 5.2, -- MICRO SMG
	[736523883] = 5.1, -- SMG
	[2024373456] = 5.1, -- SMG MK2
	[4024951519] = 5.1, -- ASSAULT SMG
	[3220176749] = 5.2, -- ASSAULT RIFLE
	[961495388] = 5.2, -- ASSAULT RIFLE MK2
	[2210333304] = 5.1, -- CARBINE RIFLE
	[4208062921] = 5.1, -- CARBINE RIFLE MK2
	[2937143193] = 5.1, -- ADVANCED RIFLE
	[2634544996] = 5.1, -- MG
	[2144741730] = 5.1, -- COMBAT MG
	[3686625920] = 5.1, -- COMBAT MG MK2
	[487013001] = 5.4, -- PUMP SHOTGUN
	[1432025498] = 5.35, -- PUMP SHOTGUN MK2
	[2017895192] = 5.7, -- SAWNOFF SHOTGUN
	[3800352039] = 5.4, -- ASSAULT SHOTGUN
	[2640438543] = 5.2, -- BULLPUP SHOTGUN
	[911657153] = 5.1, -- STUN GUN
	[100416529] = 5.5, -- SNIPER RIFLE
	[205991906] = 5.7, -- HEAVY SNIPER
	[177293209] = 5.6, -- HEAVY SNIPER MK2
	[856002082] = 5.2, -- REMOTE SNIPER
	[2726580491] = 5.0, -- GRENADE LAUNCHER
	[1305664598] = 5.0, -- GRENADE LAUNCHER SMOKE
	[2982836145] = 5.0, -- RPG
	[1752584910] = 5.0, -- STINGER
	[1119849093] = 5.01, -- MINIGUN
	[3218215474] = 5.2, -- SNS PISTOL
	[1627465347] = 5.1, -- GUSENBERG
	[3231910285] = 5.2, -- SPECIAL CARBINE
	[-1768145561] = 5.15, -- SPECIAL CARBINE MK2
	[3523564046] = 5.5, -- HEAVY PISTOL
	[2132975508] = 5.2, -- BULLPUP RIFLE
	[-2066285827] = 5.15, -- BULLPUP RIFLE MK2
	[137902532] = 5.4, -- VINTAGE PISTOL
	[2828843422] = 5.7, -- MUSKET
	[984333226] = 5.2, -- HEAVY SHOTGUN
	[3342088282] = 5.3, -- MARKSMAN RIFLE
	[1785463520] = 5.25, -- MARKSMAN RIFLE MK2
	[1672152130] = 5, -- HOMING LAUNCHER
	[1198879012] = 5.9, -- FLARE GUN
	[171789620] = 5.2, -- COMBAT PDW
	[3696079510] = 5.9, -- MARKSMAN PISTOL
	[1834241177] = 4.4, -- RAILGUN
	[3675956304] = 5.3, -- MACHINE PISTOL
	[3249783761] = 5.6, -- REVOLVER
	[-879347409] = 5.6, -- REVOLVER MK2
	[4019527611] = 5.7, -- DOUBLE BARREL SHOTGUN
	[1649403952] = 5.3, -- COMPACT RIFLE
	[317205821] = 5.2, -- AUTO SHOTGUN
	[125959754] = 5.5, -- COMPACT LAUNCHER
	[3173288789] = 5.1, -- MINI SMG		
}



Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if IsPedShooting(PlayerPedId()) and not IsPedDoingDriveby(PlayerPedId()) then
			local _,wep = GetCurrentPedWeapon(PlayerPedId())
			_,cAmmo = GetAmmoInClip(PlayerPedId(), wep)
			if recoils[wep] and recoils[wep] ~= 0 then
				tv = 0
				if GetFollowPedCamViewMode() ~= 4 then
					repeat 
						Wait(0)
						p = GetGameplayCamRelativePitch()
						SetGameplayCamRelativePitch(p+0.1, 0.2)
						tv = tv+0.1
					until tv >= recoils[wep]
				else
					repeat 
						Wait(0)
						p = GetGameplayCamRelativePitch()
						if recoils[wep] > 0.1 then
							SetGameplayCamRelativePitch(p+0.6, 1.2)
							tv = tv+0.6
						else
							SetGameplayCamRelativePitch(p+0.016, 0.333)
							tv = tv+0.1
						end
					until tv >= recoils[wep]
				end
			end
		end
	end
end)
