rawset(_G, "LUAMUSICDEF", {}) --yeah.

LUAMUSICDEF[-1] = {
    Title = "Unknown title",
    Authors = {"Unknown author"},
    Source = "Unknown source",
    BPM = 0,
    Event = false
}

if not (devparm) then
    return
end

--example
local LMD = LUAMUSICDEF
LMD["GFZ1"] = {
    Title = "Greenflower Zone Act 1",
    Authors = {"clairebun", "Shane_Strife", "DrTapeworm", "DemonTomatoDave"},
    Source = "Sonic Robo Blast 2",
    BPM = 132
}
LMD["GFZ2"] = {
    Title = "Hurry up! (Test)",
    Event = true
}
LMD["AACZ"] = {
    Title = "Chaos Angel Zone (Test)",
}
LMD["AAC2"] = {
    Title = "Chaos Angel Zone Act 2 (Test)",
    Event = true
}