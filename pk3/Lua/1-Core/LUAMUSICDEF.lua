rawset(_G, "LUAMUSICDEF", {}) --yeah.

LUAMUSICDEF[-1] = {
    Title = "Unknown title",
    Authors = {"Unknown author"},
    Source = "Unknown source",
    BPM = 0,
    Event = false
}

LUAMUSICDEF.add = function(key, value)
    assert(type(key) == "string", "Key must be a string.")
    assert(type(value) == "table", "Value must be a table.")
    assert(value.Title, "Value must contain a Title field.")
    LUAMUSICDEF[key:upper()] = value
end

--Example: lmd_localadd GFZ2 "cool song" "cool author" "cool game"
--Only key and title are mandatory
LUAMUSICDEF.localadd = function(player, key, title, authors, source, bpm, event)
    if not (key and title) then
        CONS_Printf(player, 'Usage (only key and title are mandatory): lmd_localadd <tunes/lump> <title> <authors> <source> <bpm> <extra>\n')
        CONS_Printf(player, 'Example: lmd_localadd GFZ1 "Cool Song" "" "Cool Game"')
        CONS_Printf(player, 'TIP: This can be executed from a TXT file!')
        return
    end
    
    if authors == "" then authors = nil end
    if source == "" then source = nil end
    if bpm == "" then bpm = nil end
    if event == "" then event = nil end
    
    local tbl = {}
    tbl.Title = title
    tbl.Authors = authors
    tbl.Source = source
    if type(bpm) == "string" then
        tbl.BPM = tonumber(bpm) or 0
    end
    tbl.Event = event

    LUAMUSICDEF.add(key, tbl)
end

COM_AddCommand("lmd_localadd", LUAMUSICDEF.localadd, COM_LOCAL)