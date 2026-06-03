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
    local tbl = {}
    
    assert(type(key) == "string", "Key must be a string.")
    assert(type(title) == "string", "Title must be a string.")
    if authors == "" then authors = nil end
    if source == "" then source = nil end
    if bpm == "" then bpm = nil end
    if event == "" then event = nil end

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