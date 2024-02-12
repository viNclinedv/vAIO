--[[

    [vAIO]
    by -v
    Discord @viNclinedv
    
]]--

local vAIO_VERSION = "1.2"
local vAIO_LUA_NAME = "vAIO.lua"
local vAIO_REPO_BASE_URL = "https://raw.githubusercontent.com/viNclinedv/vAIO/main/"
local vAIO_REPO_SCRIPT_PATH = vAIO_REPO_BASE_URL .. vAIO_LUA_NAME
local vUTILS_LUA_NAME = "vUtils.lua"
local vUTILS_REPO_BASE_URL = "https://raw.githubusercontent.com/viNclinedv/vUtils/main/"
local vUTILS_REPO_SCRIPT_PATH = vUTILS_REPO_BASE_URL .. vUTILS_LUA_NAME
local needsReloadAfterUpdate = false


local function fetch_url(url)
    local handle = io.popen("curl -s -H 'Cache-Control: no-cache' " .. url)
    if not handle then
        print("Failed to fetch URL: " .. url)
        return nil
    end
    local content = handle:read("*a")
    handle:close()
    return content
end

local function replace_current_file_with_latest_version(latest_version_script)
    local resources_path = cheat:get_resource_path()
    local vAIO_path = resources_path:gsub("resources$", "lua/" .. vAIO_LUA_NAME)
    local file, errorMessage = io.open(vAIO_path, "w")
    if not file then
        print("Failed to open the current file for writing. Error: ", errorMessage)
        return false
    end
    file:write(latest_version_script)
    file:close()
    return true
end

local function check_for_update()
    local latest_script_content = fetch_url(vAIO_REPO_SCRIPT_PATH)
    if not latest_script_content then
        print("Failed to fetch [vAIO] for update check.")
        return
    end

    local remote_version = latest_script_content:match('local vAIO_VERSION = "(%d+%.%d+)"')
    if not remote_version then
        print("Failed to extract version from the latest [vAIO] content.")
        return
    end

    if remote_version and remote_version > vAIO_VERSION then
        if replace_current_file_with_latest_version(latest_script_content) then
            print("Update successful. Please reload [vAIO].")
            needsReloadAfterUpdate = true
        else
            print("Failed to update [vAIO].")
        end
    else
        print("You are running the latest version of [vAIO].")
    end
end



local function check_for_prereqs()
    local resources_path = cheat:get_resource_path()
    local vUtils_path = resources_path:gsub("resources$", "lua\\lib\\" .. vUTILS_LUA_NAME)
    local file = io.open(vUtils_path, "r")
    if not file then
        print("[vUtils] not found. Downloading...")
        local content = fetch_url(vUTILS_REPO_SCRIPT_PATH)
        if content then
            local file, errorMessage = io.open(vUtils_path, "w")
            if file then
                file:write(content)
                file:close()
                print("[vUtils] downloaded and saved successfully.")
            else
                print("Failed to save [vUtils]. Error: ", errorMessage)
            end
        else
            print("Failed to download [vUtils].")
        end
    else
        file:close()
        print("[vUtils] found.")
    end
end

check_for_update()
check_for_prereqs()
local vUtils = require("vUtils")

cheat.on("renderer.draw", function()
    if needsReloadAfterUpdate then
        local currentColor = vUtils.updateRGBColor()
        g_render:text(vec2:new(2000, 500),color:new(currentColor.r, currentColor.g, currentColor.b, currentColor.a), "Update successful! Reload [vAIO]", nil, 45)
    end
end)


function vLeona()
    Script_name = "vLeona"
    local test_navigation = menu.get_main_window():push_navigation(Script_name, 10000)
    local my_nav = menu.get_main_window():find_navigation(Script_name)

    local q_config = g_config:add_bool(true, "Use Q (Combo)")
    local w_config = g_config:add_bool(true, "Use W (Combo)")
    local e_config = g_config:add_bool(true, "Use E (Combo)")
    local r_config = g_config:add_bool(true, "Use R (Combo)")
    local q_harass_config = g_config:add_bool(true, "Use Q (Harass)")
    local w_harass_config = g_config:add_bool(true, "Use W (Harass)")
    local e_acc_config = g_config:add_int(2, "E Accuracy") 
    local r_acc_config = g_config:add_int(2, "R Accuracy") 
    local num_nmeR = g_config:add_int(2, "R If Enemies Hit >=")
    local assist_cast_e_config = g_config:add_bool(true, "Assist Cast E")
    local assist_cast_r_config = g_config:add_bool(true, "Assist Cast R")
    local debug_config = g_config:add_bool(false, "Debug")
    local e_draw_config = g_config:add_bool(false, "E Drawings")
    local r_draw_config = g_config:add_bool(false, "R Drawings")
    local watermark_draw_config = g_config:add_bool(false, "Watermark Drawings")

    local spell_sect = my_nav:add_section("Use Spells in Combo")
    local harass_sect = my_nav:add_section("Use Spells in Harass")
    local acc_sect = my_nav:add_section("Accuracy Selection")
    local enemies_sect = my_nav:add_section("Enemies")
    local assist_cast_sect = my_nav:add_section("Assist Cast")
    local debug_sect = my_nav:add_section("Debug")
    local draw_sect = my_nav:add_section("Drawings")

    local checkboxq = spell_sect:checkbox("Use Q (Combo)", q_config)
    local checkboxw = spell_sect:checkbox("Use W (Combo)", w_config)
    local checkboxe = spell_sect:checkbox("Use E (Combo)", e_config)
    local checkboxr = spell_sect:checkbox("Use R (Combo)", r_config)
    checkboxq:set_value(true)
    checkboxw:set_value(true)
    checkboxe:set_value(true)
    checkboxr:set_value(true)

    local checkbox_harass_q = harass_sect:checkbox("Use Q (Harass)", q_harass_config)
    local checkbox_harass_w = harass_sect:checkbox("Use W (Harass)", w_harass_config)
    checkbox_harass_q:set_value(true)
    checkbox_harass_w:set_value(true)

    local rslider = enemies_sect:slider_int("R If Enemies Hit >=", num_nmeR, 1, 5, 1)
    rslider:set_value(2)

    local checkbox_assist_cast_e = assist_cast_sect:checkbox("Assist Cast E", assist_cast_e_config)
    local checkbox_assist_cast_r = assist_cast_sect:checkbox("Assist Cast R", assist_cast_r_config)
    checkbox_assist_cast_e:set_value(true)
    checkbox_assist_cast_r:set_value(true)

    local checkbox_debug = debug_sect:checkbox("Debug", debug_config)
    checkbox_debug:set_value(false)

    local checkboxwatermarkdraw = draw_sect:checkbox("Draw Watermark", watermark_draw_config)
    local checkboxedraw = draw_sect:checkbox("Draw E Range", e_draw_config)
    local checkboxrdraw = draw_sect:checkbox("Draw R Range", r_draw_config)
    checkboxwatermarkdraw:set_value(true)
    checkboxedraw:set_value(true)
    checkboxrdraw:set_value(true)

    local acc_e_select = acc_sect:select("E Accuracy", e_acc_config, {
        "Low",
        "Medium",
        "High",
        "Very High",
        "Immobile",
    })
    local acc_r_select = acc_sect:select("R Accuracy", r_acc_config, {
        "Low",
        "Medium",
        "High",
        "Very High",
        "Immobile",
    })


    local mySpells = {
        q = {
            lastCast = 0,
            manaCost = {35, 40, 45, 50, 55},
            spell = g_local:get_spell_book():get_spell_slot(e_spell_slot.q),
            spellSlot = e_spell_slot.q,
            Range = 125,
            Level = 0,
            Base = {10, 35, 60, 85, 110},
            CastTime = 0,
            coolDown = {14, 13, 12, 11, 10}
        },
        w = {
            lastCast = 0,
            manaCost = {60, 60, 60, 60, 60},
            spell = g_local:get_spell_book():get_spell_slot(e_spell_slot.w),
            spellSlot = e_spell_slot.w,
            Width = 450,
            Speed = 2500,
            Level = 0,
            CastTime = 0,
            coolDown = {14, 13, 12, 11, 10}
        },
        e = {
            lastCast = 0,
            manaCost = {60, 60, 60, 60, 60},
            spell = g_local:get_spell_book():get_spell_slot(e_spell_slot.e),
            spellSlot = e_spell_slot.e,
            Range = 900,
            Width = 140,
            Speed = 2000,
            Level = 0,
            CastTime = 0.25,
            coolDown = {12, 10.5, 9, 7.5, 6}
        },
        r = {
            lastCast = 0,
            manaCost = {100, 100, 100},
            spell = g_local:get_spell_book():get_spell_slot(e_spell_slot.r),
            spellSlot = e_spell_slot.r,
            Range = 1200,
            Radius = 175,
            Radius2 = 325,
            Width = 325,
            Speed = 1300,
            Level = 0,
            CastTime = 0.25
        }
    }

    function debugUpdate() 
        vUtils.debug = checkbox_debug:get_value() and 1 or 0
    end
    cheat.register_callback("feature", debugUpdate)

    cheat.on("renderer.draw", function()
        local currentColor = vUtils.updateRGBColor()
        if checkboxwatermarkdraw:get_value() == true then
            g_render:text(vec2:new(10, 10), color:new(currentColor.r, currentColor.g, currentColor.b, currentColor.a), "[vLeona]", nil, 30)
        end

        if checkboxedraw:get_value() == true then
            if vUtils.canCast(mySpells, "e") == true then
                g_render:circle_3d(g_local.position, color:new(currentColor.r, currentColor.g, currentColor.b, currentColor.a), mySpells["e"].Range, 2, 360, 2)
            end
        end

        if checkboxrdraw:get_value() == true then
            if vUtils.canCast(mySpells, "r") == true then
                g_render:circle_3d(g_local.position, color:new(currentColor.r, currentColor.g, currentColor.b, currentColor.a), mySpells["r"].Range, 2, 360, 2)
            end
        end

    end)

    function mySpells:qSpell()
        if vUtils.canCast(mySpells, "q") == false then
            vUtils.Prints("Cant Cast Q - Cooldown or Mana Constraint")
            return
        end
        target = features.target_selector:get_default_target()
        mode = features.orbwalker:get_mode()
        
    
        if (mode == vUtils.Combo_key and checkboxq:get_value() == true) or (mode == vUtils.Harass_key and checkbox_harass_q:get_value() == true) then
            if target ~= nil then
                vUtils.Prints("Target Acquired for Q Spell")
                if vUtils.getDistance(g_local.position, target.position) <= mySpells.q.Range then
                    vUtils.Prints("Target within Q Range")
                    if not features.orbwalker:should_reset_aa() then
                        g_input:cast_spell(e_spell_slot.q)
                        features.orbwalker:reset_aa_timer()
                        vUtils.Prints("Casting Q on Target")
                    else
                        vUtils.Prints("Q Cast Aborted - AA Reset Condition Not Met")
                    end
                else
                    vUtils.Prints("Target out of Q Range")
                end
            else
                vUtils.Prints("No Valid Target for Q Spell")
            end
        else
            if mode == vUtils.Combo_key then
                vUtils.Prints("Q Spell Skipped - Combo Mode Checkbox Unchecked or Not in Combo Mode")
            elseif mode == vUtils.Harass_key then
                vUtils.Prints("Q Spell Skipped - Harass Mode Checkbox Unchecked or Not in Harass Mode")
            end
        end
    end
    

    function mySpells:wSpell()
        if vUtils.canCast(mySpells, "w") == false then
            vUtils.Prints("Cant Cast W - Cooldown or Mana Constraint")
            return
        end
        
        target = features.target_selector:get_default_target()
        mode = features.orbwalker:get_mode()
        
    
        if (mode == vUtils.Combo_key and checkboxw:get_value() == true) or
           (mode == vUtils.Harass_key and checkbox_harass_w:get_value() == true) then
            if target ~= nil then
                vUtils.Prints("Target Acquired for W Spell")
                if vUtils.getDistance(g_local.position, target.position) <= mySpells['w'].Width then
                    g_input:cast_spell(e_spell_slot.w)
                    vUtils.Prints("Casting W on Target within Width")
                else
                    vUtils.Prints("Target out of W Width Range")
                end
            else
                vUtils.Prints("No Valid Target for W Spell")
            end
        else
            if mode == vUtils.Combo_key then
                vUtils.Prints("W Spell Skipped - Combo Mode Checkbox Unchecked or Not in Combo Mode")
            elseif mode == vUtils.Harass_key then
                vUtils.Prints("W Spell Skipped - Harass Mode Checkbox Unchecked or Not in Harass Mode")
            end
        end
    end
    

    function mySpells:eSpell()
        if vUtils.canCast(mySpells, "e") == false then
            vUtils.Prints("Cannot Cast E - Spell on Cooldown or Insufficient Mana")
            return
        end
        
        target = features.target_selector:get_default_target()
        mode = features.orbwalker:get_mode()
        
    
        if checkbox_assist_cast_e:get_value() == true and g_input:is_key_pressed(69) then
            local cursorPos = g_input:get_cursor_position_game()
            vUtils.Prints("Assist Cast E Key Pressed - Searching for Target")
            local bestTarget = nil
            local bestHitchance = -1
            local shortestCursorDistance = math.huge
    
            for _, hitchanceLevel in ipairs({4, 3, 2, 1, 0}) do
                for _, entity in pairs(features.entity_list:get_enemies()) do
                    if entity ~= nil and not entity:is_invisible() and entity:is_alive() and
                       vUtils.getDistance(g_local.position, entity.position) <= mySpells["e"].Range then
                        local pred = vUtils.predPosition(mySpells, "e", entity)
                        if pred.valid and pred.hitchance >= hitchanceLevel then
                            local distanceToCursor = vUtils.getDistance(cursorPos, entity.position)
                            if distanceToCursor < shortestCursorDistance or
                               (pred.hitchance > bestHitchance and distanceToCursor <= shortestCursorDistance) then
                                bestHitchance = pred.hitchance
                                shortestCursorDistance = distanceToCursor
                                bestTarget = entity
                            end
                        end
                    end
                end
                if bestTarget then
                    vUtils.Prints("Best Target Found for Assist Cast E - Hitchance: " .. tostring(bestHitchance))
                    break
                end
            end
            if bestTarget then
                g_input:cast_spell(e_spell_slot.e, bestTarget.position)
                vUtils.Prints("Casting E on Assist Cast Target")
            else
                vUtils.Prints("No Suitable Target Found for Assist Cast E")
            end
        end
    
        if mode == vUtils.Combo_key and checkboxe:get_value() == true then
            vUtils.Prints("E Spell in Combo Mode - Searching for Target")
            local eRange = mySpells["e"].Range + 150
            local bestTarget = nil
            local highestMetric = -1
    
            for _, target in pairs(features.entity_list:get_enemies()) do
                if target ~= nil and not target:is_invisible() and target:is_alive() and
                   vUtils.getDistance(g_local.position, target.position) <= eRange then
                    local totalAttackSpeed = target.attack_speed
                    local totalAttackDamage = target.base_attack + target.bonus_attack
                    local combinedMetric = (totalAttackSpeed * 0.5) + (totalAttackDamage * 0.5)
                    if combinedMetric > highestMetric then
                        highestMetric = combinedMetric
                        bestTarget = target
                    end
                end
            end
    
            if bestTarget then
                local eHit = vUtils.predPosition(mySpells, "e", bestTarget)
                if eHit.valid and eHit.hitchance >= acc_e_select:get_value() then
                    g_input:cast_spell(e_spell_slot.e, eHit.position)
                    vUtils.Prints("Casting E in Combo Mode on Target with High Metric")
                else
                    vUtils.Prints("Combo Mode E Cast Aborted - Hitchance or Prediction Invalid")
                end
            else
                vUtils.Prints("No Suitable Target Found for E Spell in Combo Mode")
            end
        end
    end
    

    function mySpells:rSpell()
        if vUtils.canCast(mySpells, "r") == false then
            vUtils.Prints("Cannot Cast R - Spell on Cooldown or Insufficient Mana")
            return
        end
        
        target = features.target_selector:get_default_target()
        mode = features.orbwalker:get_mode()
    
        local bestTarget = nil
        local highestMetric = -1
    
        if mode == vUtils.Combo_key and checkboxr:get_value() == true and g_input:is_key_pressed(17) then
            vUtils.Prints("R Spell in Combo Mode with CTRL Key Pressed - Searching for Target")
            
            for _, target in pairs(features.entity_list:get_enemies()) do
                if target ~= nil and not target:is_invisible() and target:is_alive() and
                vUtils.getDistance(g_local.position, target.position) <= mySpells["r"].Range then
                    local totalAttackSpeed = target.attack_speed
                    local totalAttackDamage = target.base_attack + target.bonus_attack
                    local combinedMetric = (totalAttackSpeed * 0.5) + (totalAttackDamage * 0.5)
                    
                    if combinedMetric > highestMetric then
                        highestMetric = combinedMetric
                        bestTarget = target
                    end
                end
            end
            
            if bestTarget then
                local rHit = vUtils.predPosition(mySpells, "r", bestTarget)
                if rHit.valid and rHit.hitchance >= acc_r_select:get_value() then
                    g_input:cast_spell(e_spell_slot.r, rHit.position)
                    vUtils.Prints("Casting R in Combo Mode with CTRL Key Pressed on Target with High Metric")
                else
                    vUtils.Prints("Combo Mode R Cast Aborted - Invalid Prediction or Hitchance Too Low")
                end
            else
                vUtils.Prints("No Suitable Target Found for R Spell in Combo Mode with CTRL Key Pressed")
            end
        end

        if checkbox_assist_cast_r:get_value() == true and g_input:is_key_pressed(82) then
            vUtils.Prints("Assist Cast R Key Pressed - Searching for Target")
            local cursorPos = g_input:get_cursor_position_game()
            local bestTarget = nil
            local bestHitchance = -1
            local shortestCursorDistance = math.huge
            local RnumTarget = vUtils.NumEnemiesInRangeTarget(325)
    
            if RnumTarget >= rslider:get_value() then
                vUtils.Prints("Sufficient Targets within Range for R Spell")
                for _, entity in pairs(features.entity_list:get_enemies()) do
                    if entity ~= nil and not entity:is_invisible() and entity:is_alive() and
                       vUtils.getDistance(g_local.position, entity.position) <= mySpells["r"].Range then
                        local pred = vUtils.predPosition(mySpells, "r", entity)
                        if pred.valid and pred.hitchance >= bestHitchance then
                            local distanceToCursor = vUtils.getDistance(cursorPos, entity.position)
                            if distanceToCursor < shortestCursorDistance or
                               (pred.hitchance > bestHitchance and distanceToCursor <= shortestCursorDistance) then
                                bestHitchance = pred.hitchance
                                shortestCursorDistance = distanceToCursor
                                bestTarget = entity
                            end
                        end
                    end
                end
                if bestTarget then
                    g_input:cast_spell(e_spell_slot.r, bestTarget.position)
                    vUtils.Prints("Casting R on Assist Cast Target with Best Hitchance")
                    return
                else
                    vUtils.Prints("No Suitable Target Found for Assist Cast R")
                end
            else
                vUtils.Prints("Not Enough Targets within Range for R Spell")
            end
        end
    
        if mode == vUtils.Combo_key and checkboxr:get_value() == true then
            vUtils.Prints("Combo Mode Activated for R Spell")
            local RnumTarget = vUtils.NumEnemiesInRangeTarget(325)
            if RnumTarget >= rslider:get_value() then
                vUtils.Prints("Checking Targets for R Spell in Combo Mode")
                if target and vUtils.getDistance(g_local.position, target.position) <= mySpells["r"].Range then
                    local rHit = vUtils.predPosition(mySpells, "r", target)
                    if rHit.valid and rHit.hitchance >= acc_r_select:get_value() then
                        g_input:cast_spell(e_spell_slot.r, rHit.position)
                        vUtils.Prints("Casting R in Combo Mode on Target with High Hitchance")
                        return
                    else
                        vUtils.Prints("Combo Mode R Cast Aborted - Invalid Prediction or Hitchance Too Low")
                    end
                else
                    vUtils.Prints("No Suitable Target Found for R Spell in Combo Mode")
                end
            else
                vUtils.Prints("Not Enough Targets for R Spell Activation in Combo Mode")
            end
        end

        

    end

    

    cheat.register_module(
        {
            champion_name = "Leona",
            spell_q = function()
                mySpells:qSpell()
            end,
            spell_w = function()
                mySpells:wSpell()
            end,
            spell_e = function()
                mySpells:eSpell()
            end,
            spell_r = function()
                mySpells:rSpell()
            end,
            get_priorities = function()
                return {
                    "spell_r",
                    "spell_e",
                    "spell_w",
                    "spell_q"
                }
            end
        }
    )
end

function vTeemo()
    Script_name = "vTeemo"
    local test_navigation = menu.get_main_window():push_navigation(Script_name, 10000)
    local my_nav = menu.get_main_window():find_navigation(Script_name)

    local spell_sect = my_nav:add_section("Use Spells in Combo")
    local harass_sect = my_nav:add_section("Use Spells in Harass")
    local flee_sect = my_nav:add_section("Use Spells in Flee")
    local antigapclose_sect = my_nav:add_section("Anti-Gapclose")
    local assist_cast_sect = my_nav:add_section("Assist Cast")
    local debug_sect = my_nav:add_section("Debug")
    local draw_sect = my_nav:add_section("Drawings")

    local q_config = g_config:add_bool(true, "Use Q in Combo")
    local w_config = g_config:add_bool(true, "Use W in Combo", true)
    local q_harass_config = g_config:add_bool(true, "Use Q in Harass")
    local w_harass_config = g_config:add_bool(false, "Use W in Harass")
    local w_flee_config = g_config:add_bool(true, "Use W in Flee")
    local w_evade_config = g_config:add_bool(true, "Use W to Evade")
    local w_antigapclose_config = g_config:add_bool(true, "W Anti-Gapclose")
    local r_antigapclose_config = g_config:add_bool(true, "R Anti-Gapclose")
    local assist_cast_q_config = g_config:add_bool(true, "Assist Cast Q")
    local debug_config = g_config:add_bool(false, "Debug")
    local q_draw_config = g_config:add_bool(false, "Q Drawings")
    local watermark_draw_config = g_config:add_bool(false, "Watermark Drawings")

    local checkbox_q_combo = spell_sect:checkbox("Use Q (Combo)", q_config)
    local checkbox_w_combo = spell_sect:checkbox("Use W (Combo)", w_config)
    checkbox_q_combo:set_value(true)
    checkbox_w_combo:set_value(true)

    local checkbox_q_harass = harass_sect:checkbox("Use Q (Harass)", q_harass_config)
    local checkbox_w_harass = harass_sect:checkbox("Use W (Harass)", w_harass_config)
    checkbox_q_harass:set_value(true)
    checkbox_w_harass:set_value(false)

    local checkbox_w_flee = flee_sect:checkbox("Use W (Flee)", w_flee_config)
    local checkbox_w_evade = flee_sect:checkbox("Use W to Evade", w_evade_config)
    checkbox_w_flee:set_value(true)
    checkbox_w_evade:set_value(true)

    local checkbox_w_antigapclose = antigapclose_sect:checkbox("Use W", w_antigapclose_config)
    local checkbox_r_antigapclose = antigapclose_sect:checkbox("Use R", r_antigapclose_config)
    checkbox_w_antigapclose:set_value(true)
    checkbox_r_antigapclose:set_value(true)

    local checkbox_assist_cast_q = assist_cast_sect:checkbox("Assist Cast Q", assist_cast_q_config)
    checkbox_assist_cast_q:set_value(true)

    local checkbox_debug = debug_sect:checkbox("Debug", debug_config)
    checkbox_debug:set_value(false)

    local checkboxwatermarkdraw = draw_sect:checkbox("Draw Watermark", watermark_draw_config)
    local checkboxqdraw = draw_sect:checkbox("Draw Q Range", q_draw_config)
    checkboxwatermarkdraw:set_value(true)
    checkboxqdraw:set_value(true)


    function debugUpdate() 
        vUtils.debug = checkbox_debug:get_value() and 1 or 0
    end
    cheat.register_callback("feature",debugUpdate)

    cheat.on("renderer.draw", function()
        local currentColor = vUtils.updateRGBColor()
        if checkboxwatermarkdraw:get_value() == true then
            g_render:text(vec2:new(10, 10), color:new(currentColor.r, currentColor.g, currentColor.b, currentColor.a), "[vTeemo]", nil, 30)
        end

        if checkboxqdraw:get_value() == true then
            if vUtils.canCast(mySpells, "q") == true then
                g_render:circle_3d(g_local.position, color:new(currentColor.r, currentColor.g, currentColor.b, currentColor.a), mySpells["q"].Range, 2, 360, 2)
            end
        end

    end)

    local mySpells = {
        q = {
            Range = 680,
            spell = g_local:get_spell_book():get_spell_slot(e_spell_slot.q),
            spellSlot = e_spell_slot.q,
            manaCost = {70, 75, 80, 85, 90}
        },
        w = {
            manaCost = 40,
            spell = g_local:get_spell_book():get_spell_slot(e_spell_slot.w),
            spellSlot = e_spell_slot.w
        },
        r = {
            Range = function()
                return g_local:get_spell_book():get_spell_slot(e_spell_slot.r).level * 250 + 150
            end,
            manaCost = 75,
            Speed = 1000,
            Width = 160,
            CastTime = 0.25,
            spell = g_local:get_spell_book():get_spell_slot(e_spell_slot.r),
            spellSlot = e_spell_slot.r
        }
    }


    cheat.register_module(
        {
            champion_name = "Teemo",
            spell_q = function()
                if vUtils.canCast(mySpells, "q") == false then
                    vUtils.Prints("Q Spell: Not available for casting (cooldown or mana)")
                    return
                end
            
                target = features.target_selector:get_default_target()
                mode = features.orbwalker:get_mode()
            
                if g_input:is_key_pressed(81) and checkbox_assist_cast_q:get_value() == true then
                    vUtils.Prints("Q Spell: Assist cast mode activated")
                    local cursorPos = g_input:get_cursor_position_game()
                    local shortestDistance = math.huge
                    local closestEnemy = nil
            
                    for _, entity in pairs(features.entity_list:get_enemies()) do
                        if entity ~= nil and not entity:is_invisible() and entity:is_alive() then
                            local distanceToCursor = vUtils.getDistance(cursorPos, entity.position)
                            if distanceToCursor < shortestDistance then
                                closestEnemy = entity
                                shortestDistance = distanceToCursor
                            end
                        end
                    end
            
                    if closestEnemy ~= nil then
                        g_input:cast_spell(e_spell_slot.q, closestEnemy.network_id)
                        vUtils.Prints("Q Spell: Cast on closest enemy to cursor")
                    else
                        vUtils.Prints("Q Spell: No enemies close to cursor found")
                    end
                end
            
                local highestMetric = 0
                local extendedRange = mySpells["q"].Range + 200
                for _, target in pairs(features.entity_list:get_enemies()) do
                    if target ~= nil and features.orbwalker:is_attackable(target.index, extendedRange, true) then
                        local targetMetric = target.attack_speed + (target.bonus_attack + target.base_attack)
                        if targetMetric > highestMetric then
                            highestMetric = targetMetric
                            bestTarget = target
                        end
                    end
                end
            
                if bestTarget ~= nil and mode == vUtils.Combo_key and checkbox_q_combo:get_value() == true and
                   features.orbwalker:should_reset_aa() == true then
                    g_input:cast_spell(e_spell_slot.q, bestTarget.network_id)
                    features.orbwalker:set_cast_time(0.25)
                    vUtils.Prints("Q Spell: Cast in combo mode on target with highest metric")
                    return true
                end
            
                if target ~= nil and features.orbwalker:is_attackable(target.index, mySpells["q"].Range, true) then
                    if mode == vUtils.Harass_key and checkbox_q_harass:get_value() == true and
                       features.orbwalker:should_reset_aa() == true then
                        g_input:cast_spell(e_spell_slot.q, target.network_id)
                        features.orbwalker:set_cast_time(0.25)
                        vUtils.Prints("Q Spell: Cast in harass mode on attackable target")
                        return true
                    end
                end
            
                vUtils.Prints("Q Spell: No conditions met for casting")
            end,
            
            spell_w = function()
                if vUtils.canCast(mySpells, "w") == false then
                    vUtils.Prints("W Spell: Not available for casting (cooldown or mana)")
                    return
                end
            
                target = features.target_selector:get_default_target()
                mode = features.orbwalker:get_mode()
            
                if checkbox_w_evade:get_value() == true then
                    if features.evade:is_active() and features.evade:is_position_safe(g_local.position, false) then
                        g_input:cast_spell(e_spell_slot.w)
                        vUtils.Prints("W Spell: Cast for evasion")
                        return true
                    end
                end
            
                if checkbox_w_antigapclose:get_value() == true and (target == vUtils.Combo_key or target == vUtils.Harass_key) then
                    local antigapclosetarget = features.target_selector:get_antigapclose_target(400)
                    if antigapclosetarget ~= nil and vUtils.getDistance(antigapclosetarget.position, g_local.position) <= 400 then
                        g_input:cast_spell(e_spell_slot.w)
                        vUtils.Prints("W Spell: Cast for anti-gapclose")
                        return true
                    end
                end
            
                if target ~= nil and features.orbwalker:is_attackable(target.index, mySpells["q"].Range, true) then
                    if mode == vUtils.Combo_key and checkbox_w_combo:get_value() == true and g_local.movement_speed < target.movement_speed then
                        g_input:cast_spell(e_spell_slot.w)
                        vUtils.Prints("W Spell: Cast in combo mode to match target's speed")
                        return true
                    end
                end
            
                if target ~= nil and features.orbwalker:is_attackable(target.index, mySpells["q"].Range, true) then
                    if mode == vUtils.Flee_key and checkbox_w_flee:get_value() == true and g_local.movement_speed < target.movement_speed then
                        g_input:cast_spell(e_spell_slot.w)
                        vUtils.Prints("W Spell: Cast in flee mode for speed advantage")
                        return true
                    end
                end
            
                vUtils.Prints("W Spell: No conditions met for casting")
            end,
            
            spell_r = function()
                if vUtils.canCast(mySpells, "r") == false then
                    vUtils.Prints("R Spell: Not available for casting (cooldown or mana)")
                    return
                end
            
                target = features.target_selector:get_default_target()
                mode = features.orbwalker:get_mode()
            
                if checkbox_r_antigapclose:get_value() == true and (target == vUtils.Combo_key or target == vUtils.Harass_key) then
                    local antigapclosetarget = features.target_selector:get_antigapclose_target(400)
                    if antigapclosetarget ~= nil then
                        g_input:cast_spell(e_spell_slot.r, antigapclosetarget.path_end)
                        vUtils.Prints("R Spell: Cast for anti-gapclose on " .. antigapclosetarget.name)
                        return true
                    else
                        vUtils.Prints("R Spell: No suitable targets found for anti-gapclose")
                    end
                else
                    vUtils.Prints("R Spell: Anti-gapclose condition not met or disabled")
                end
            end,
            
            get_priorities = function()
                return {
                    "spell_q",
                    "spell_w",
                    "spell_r"
                }
            end
        }
    )
end

LoadDBG = 1
function LoadPrints(str)
    if LoadDBG == 1 then
        print(str)
    end
end
local championModules = {
    Leona = vLeona,
    Teemo = vTeemo
}
Champion = g_local.champion_name.text
if championModules[Champion] then
    championModules[Champion]()
    LoadPrints("+" .. Champion .. "+ -- Loading from [vAIO]")
    LoadDBG = 0
else
    LoadPrints("Champion Not Supported in [vAIO].")
    LoadDBG = 0
end
