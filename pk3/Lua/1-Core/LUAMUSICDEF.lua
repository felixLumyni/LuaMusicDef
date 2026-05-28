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
    LUAMUSICDEF[key] = value
end