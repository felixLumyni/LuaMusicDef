local enabled = CV_RegisterVar{
	name = "lmd",
	flags = CV_LOCAL,
	PossibleValue = CV_OnOff,
	defaultvalue = "On"
}

local isHoldingTab = false
addHook("KeyDown", function(key)
    if key.num == input.gameControlToKeyNum(GC_SCORES) then
        isHoldingTab = true
    end
end)

addHook("KeyUp", function(key)
    if key.num == input.gameControlToKeyNum(GC_SCORES) then
        isHoldingTab = false
    end
end)

local displayMusic = nil
local displayTime = 0
local MAXTIME = 5*TICRATE
local TRANSITIONTIME = TICRATE
local render = function(v, p)
    if not (enabled.value) then
        return
    end
    if p and p == secondarydisplayplayer then
        return
    end
    local currentMusic
    if mapmusname then
        currentMusic = mapmusname:upper()
    end
    if displayTime > 0 then
        displayTime = displayTime - (displayMusic ~= currentMusic and 2 or 1)
    elseif currentMusic ~= nil and displayMusic ~= currentMusic then
        displayMusic = currentMusic
        if LUAMUSICDEF and LUAMUSICDEF[displayMusic] then
            displayTime = MAXTIME
        end
    end
    if (displayTime > 0 or isHoldingTab) and LUAMUSICDEF and LUAMUSICDEF[displayMusic] then
        local x = 320
        local y = 240*3/4
        local trans = V_HUDTRANS
        local animate = ease.outquint
        local anim_percent
        if isHoldingTab then
            anim_percent = FRACUNIT
        elseif displayTime > MAXTIME-TRANSITIONTIME then
            anim_percent = FRACUNIT / TRANSITIONTIME * abs(displayTime-MAXTIME)
        else
            anim_percent = FRACUNIT / TRANSITIONTIME * min(TRANSITIONTIME, displayTime)
        end
        local newX = animate(anim_percent, 320+x, x)

        local currentDef = LUAMUSICDEF[displayMusic]
        local time = (isHoldingTab and leveltime or displayTime)
        local bgframe = (time/2)%16
        local bg = v.cachePatch("MusicDef_BarAni"..bgframe+1)
        local color = currentDef.Event and v.getColormap(nil, SKINCOLOR_ORANGE) or nil
        v.draw(newX-(bg.width), y-(bg.height/2), bg, trans|V_SNAPTORIGHT, color)
        newX=newX-16
        local itemname = currentDef.Event and "Record" or "MusicNote"
        local frame = (time/5)%4
        local icon = v.cachePatch(itemname.."_"..1+frame)
        v.draw(newX, y-(icon.height)+3, icon, trans|V_SNAPTORIGHT, color)
        y=y-5
        local title = currentDef.Title or LUAMUSICDEF[-1].Title
        local font = title:len() > 24 and "thin-right" or "right"
        v.drawString(newX, y, title, trans|V_ALLOWLOWERCASE|V_SNAPTORIGHT, font)
        local extratext
        local usingAuthors
        if isHoldingTab then
            extratext = currentDef.Authors or currentDef.Source or LUAMUSICDEF[-1].Authors
            usingAuthors = currentDef.Authors ~= nil
        else
            extratext = currentDef.Source or currentDef.Authors or LUAMUSICDEF[-1].Source
            usingAuthors = currentDef.Source == nil and currentDef.Authors ~= nil
        end

        if type(extratext) == "table" then
            extratext = table.concat(extratext, ", ")
        end

        local textcolor = usingAuthors and V_GRAYMAP or V_YELLOWMAP
        font = extratext:len() > 24 and "thin-right" or "right"
        v.drawString(newX, y-8, extratext, trans|textcolor|V_ALLOWLOWERCASE|V_SNAPTORIGHT, font)
    end
end
hud.add(render, "game")
hud.add(render, "scores")
hud.add(render, "intermission")