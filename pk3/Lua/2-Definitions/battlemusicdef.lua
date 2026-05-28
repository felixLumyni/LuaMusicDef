local battledefsloaded = false

local function battlecheck()
	if battledefsloaded or not LUAMUSICDEF then
		return
	end
	if CBW_Battle and CBW_Battle.VersionNumber and CBW_Battle.VersionNumber >= 10 then
		battledefsloaded = true
		LUAMUSICDEF.add("BMAPNT", {
			Title = "Egg Reverie",
			Source = "Sonic Mania",
			Authors = "Tee Lopes",
			Event = true
		})
		
		LUAMUSICDEF.add("BSHDWN", {
			Title = "Back to Mad",
			Authors = "Texas Faggott",
			Event = true
		})
	end
end
addHook("AddonLoaded", battlecheck)

battlecheck()