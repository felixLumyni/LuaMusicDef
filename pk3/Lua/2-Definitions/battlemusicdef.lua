local loaded_this_def = false

local function loadmusicdef()
	if loaded_this_def then return end
	if not LUAMUSICDEF then return end

	loaded_this_def = true

	LUAMUSICDEF.add("BMAPNT", {
		Title = "Egg Reverie",
		Source = "Sonic Mania",
		Authors = "Tee Lopes",
		Event = true
	})
	
	LUAMUSICDEF.add("BSHDWN", {
		Title = "Back to Mad",
		Authors = "Texas F.",
		Event = true
	})
end

--uncomment this in your mod!
--addHook("AddonLoaded", loadmusicdef)
loadmusicdef()