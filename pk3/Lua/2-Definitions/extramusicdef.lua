local loaded_this_def = false

local function loadmusicdef()
	if loaded_this_def then return end
	if not LUAMUSICDEF then return end
	
	LUAMUSICDEF.add("_PINCH", {
		Title = "Hurry up!",
		Alttitle = "Overtime!!",
		Authors = "clairebun",
		Event = true
	})

	LUAMUSICDEF.add("_OVRTM", {
		Title = "Overtime!!",
		Authors = "clairebun",
		Event = true
	})

	LUAMUSICDEF.add("CHPASS", {
		Title = "Success!",
		Authors = "clairebun",
		Event = true
	})

	LUAMUSICDEF.add("CHFAIL", {
		Title = "Failure",
		Authors = "clairebun",
		Event = true
	})
end

--uncomment this in your mod!
--addHook("AddonLoaded", loadmusicdef)
loadmusicdef()
