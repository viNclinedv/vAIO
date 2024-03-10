--[[

    [vAIO]
    by -v
    Discord @viNclinedv
    
]]--

local vAIO_VERSION = "1.5"
local vAIO_LUA_NAME = "vAIO.lua"
local REPO_BASE_URL = "https://raw.githubusercontent.com/viNclinedv/vAIO/main/"
local vAIO_REPO_SCRIPT_PATH = REPO_BASE_URL .. vAIO_LUA_NAME
local vAIO_LOGO_NAME = "vAIO_Logo.png"
local vAIO_LOGO_PATH = REPO_BASE_URL .. "Assets/" .. vAIO_LOGO_NAME
local vUTILS_LUA_NAME = "vUtils.lua"
local vUTILS_REPO_BASE_URL = "https://raw.githubusercontent.com/viNclinedv/vUtils/main/"
local vUTILS_REPO_SCRIPT_PATH = vUTILS_REPO_BASE_URL .. vUTILS_LUA_NAME

local needsReloadAfterUpdate = false
local needsSlottedReloadAfterUpdate = false
local skipUpdate = true


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
local function download_image(url, output_path)
    local curl_command = string.format('curl.exe -s -L -o "%s" "%s"', output_path, url)
    
    local result, exit, code = os.execute(curl_command)
    
    local file = io.open(output_path, "rb")
    if file then
        print("[vAIO]Logo downloaded and saved successfully at: " .. output_path)
        file:close()
        return true
    else
        print("Failed to open the downloaded file: " .. output_path)
        return false
    end
end
local function replace_current_file_with_latest_version(latest_version_script)
    if skipUpdate == true then print("Skipping Update for vAIO") end

    if skipUpdate == false then
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
end
local function check_for_update()
    local latest_script_content = fetch_url(vAIO_REPO_SCRIPT_PATH)
    local remote_version = latest_script_content:match('local vAIO_VERSION = "(%d+%.%d+)"')

    if skipUpdate == true then print("Skipping Update for vAIO") end

    if skipUpdate == false then

        if not latest_script_content then
            print("Failed to fetch [vAIO] for update check.")
            return
        end
    end

    if skipUpdate == false then
        if not remote_version then
            print("Failed to extract version from the latest [vAIO] content.")
            return
        end
    end

    if skipUpdate == false then
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
end
local function check_for_prereqs()
    local resources_path = cheat:get_resource_path()
    local vUtils_path = resources_path:gsub("resources$", "lua\\lib\\" .. vUTILS_LUA_NAME)
    local vUtils_file = io.open(vUtils_path, "r")
    if not vUtils_file then
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
        vUtils_file:close()
        print("[vUtils] found.")
    end

    local logo_path = resources_path:gsub("resources$", "lua\\lib\\" .. vAIO_LOGO_NAME)
    local logo_file = io.open(logo_path, "rb")
    if not logo_file then
        print("[vAIO]Logo not found. Downloading...")
        if download_image(vAIO_LOGO_PATH, logo_path) then
            print("[vAIO]Logo downloaded and saved successfully.")
        else
            print("Failed to download [vAIO]Logo.")
        end
    else
        logo_file:close()
        print("[vAIO]Logo found.")
    end
    
    local fonts = {
        --{name = "Queensides", url = REPO_BASE_URL .. "Assets/Queensides.ttf", path = resources_path:gsub("resources$", "fonts\\Queensides.ttf")},
        --{name = "QueensidesLight", url = REPO_BASE_URL .. "Assets/QueensidesLight.ttf", path = resources_path:gsub("resources$", "fonts\\QueensidesLight.ttf")},
        --{name = "QueensidesMedium", url = REPO_BASE_URL .. "Assets/QueensidesMedium.ttf", path = resources_path:gsub("resources$", "fonts\\QueensidesMedium.ttf")},
    }

    for _, font in ipairs(fonts) do
        local font_file = io.open(font.path, "r")
        if not font_file then
            print("[" .. font.name .. "] font not found. Downloading...")
            local content = fetch_url(font.url)
            if content then
                local file, errorMessage = io.open(font.path, "w")
                if file then
                    file:write(content)
                    file:close()
                    print("[" .. font.name .. "] font downloaded and saved successfully.")
                    needsSlottedReloadAfterUpdate = true
                else
                    print("Failed to save [" .. font.name .. "] font. Error: ", errorMessage)
                end
            else
                print("Failed to download [" .. font.name .. "] font.")
            end
        else
            font_file:close()
            print("[" .. font.name .. "] font found.")
        end
    end

end


check_for_update()
check_for_prereqs()
local vUtils = require("vUtils")

cheat.on("features.run", function()
        vUtils.menu()
end)
cheat.on("renderer.draw", function()
    if needsReloadAfterUpdate then
        g_render:text(vec2:new(2000, 500),color:new(vUtils.currentColor.r, vUtils.currentColor.g, vUtils.currentColor.b, vUtils.currentColor.a), "Update successful! Reload [vAIO]", nil, 45)
    end
    if needsSlottedReloadAfterUpdate then
        g_render:text(vec2:new(2000, 500),color:new(vUtils.currentColor.r, vUtils.currentColor.g, vUtils.currentColor.b, vUtils.currentColor.a), "Critical assets donwloaded! Please Restart Slotted.CC", nil, 45)
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

        local resources_path = cheat:get_resource_path()
        local logo_path = resources_path:gsub("resources$", "lua\\lib\\" .. vAIO_LOGO_NAME)
        local logo = g_render:load_texture_from_file(logo_path)


        if checkboxwatermarkdraw:get_value() == true then
            vUtils.text(13.2, 137, "[vLeona]", "QueensidesMedium", 30, true)
            if logo ~= nil then
                g_render:image(vec2:new(-60, -50), vec2:new(240, 240), logo)
            end
        end

        if checkboxedraw:get_value() == true then
            if vUtils.canCast(mySpells, "e") == true then
                vUtils.circle_3d(g_local.position, mySpells["e"].Range, 2, 2.25, true )
            end
        end

        if checkboxrdraw:get_value() == true then
            if vUtils.canCast(mySpells, "r") == true then
                vUtils.circle_3d(g_local.position, mySpells["r"].Range, 2, 2.25, true )
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
        --testing multihit and poly/rectangle draws
       --[[ if vUtils.canCast(mySpells, "e") == true then
            
            vUtils.getMultihitPosition(mySpells["e"].Range, mySpells["e"].Speed, mySpells["e"].Width, 0 )
        end]]--
        
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
                bestTarget = nil
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
                    bestTarget = nil
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
                    bestTarget = nil
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
                    bestTarget = nil
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

function vRenata()
    Script_name = "vRenata"
    

    --Renata Q hit on enemy debuff name = RenataQ

    local test_navigation = menu.get_main_window():push_navigation(Script_name, 10000)

    local q_config = g_config:add_bool(true, "Use Q (Combo)")
    local w_config = g_config:add_bool(true, "Use W (Combo)")
    local e_config = g_config:add_bool(true, "Use E (Combo)")
    local r_config = g_config:add_bool(true, "Use R (Combo)")
    local debug_config = g_config:add_bool(true, "Debug?")
    local num_nmeR = g_config:add_int(2, "R If Enemies")
    local q_harass_config = g_config:add_bool(true, "Use Q (Harass)")
    local e_harass_config = g_config:add_bool(true, "Use E (Harass)")
    local acc_config = g_config:add_int(0, "Q Accuracy")
    local e_acc_config = g_config:add_int(0, "E Accuracy")
    local health_config = g_config:add_int(0, "W Health Threshhold (%)")
    local w_self_config = g_config:add_bool(true, "W Self?")

    local my_nav = menu.get_main_window():find_navigation(Script_name)

    local spell_sect = my_nav:add_section("Use Spells in Combo")
    local harass_sect = my_nav:add_section("Use Spells in Harass")
    local health_sect = my_nav:add_section("W Health Threshold")
    local acc_sect = my_nav:add_section("Accuracy Slider")
    local r_sect = my_nav:add_section("Auto R Config")
    local debug_sect = my_nav:add_section("Debug?!")

    local checkboxq = spell_sect:checkbox("Use Q (Combo)", q_config)
    local checkboxw = spell_sect:checkbox("Use W (Combo)", w_config)
    local checkboxe = spell_sect:checkbox("Use E (Combo)", e_config)
    local checkboxr = spell_sect:checkbox("Use R (Combo)", r_config)
    checkboxq:set_value(true)
    checkboxw:set_value(true)
    checkboxe:set_value(true)
    checkboxr:set_value(true)



    local checkbox_harass_q = harass_sect:checkbox("Use Q (Harass)", q_harass_config)
    local checkbox_harass_e = harass_sect:checkbox("Use E (Harass)", e_harass_config)
    checkbox_harass_q:set_value(true)
    checkbox_harass_e:set_value(false)



    local acc_q_slider = acc_sect:slider_int("Q Accuracy", acc_config, 0, 5, 1)
    local acc_e_slider = acc_sect:slider_int("E Accuracy", e_acc_config, 0, 5, 1)
    acc_q_slider:set_value(2)
    acc_e_slider:set_value(2)


    local rslider = r_sect:slider_int("R if it will hit X enemies", num_nmeR, 1, 5, 1)


    local w_health_slider = health_sect:slider_int("W Health Threshhold (%)", health_config, 0, 100, 1)
    w_health_slider:set_value(35)

    local checkbox_w_self = health_sect:checkbox("W Self?", w_self_config)
    checkbox_w_self:set_value(true)

    local checkbox_debug = debug_sect:checkbox("Print Statements", debug_config)
    checkbox_debug:set_value(false)







    local function q_buff()
        for _, enemy in pairs(features.entity_list:get_enemies()) do
            if features.buff_cache:get_buff(enemy.index, "RenataQ") ~= nil then
                return true
            end
        end
        return false
    end
    
    local function qTarget()
        for _, obj in pairs(features.entity_list:get_all()) do
            if obj:is_hero() and obj:is_enemy() and obj:is_alive() then
                if features.buff_cache:get_buff(obj.index, "RenataQ") ~= nil then
                    return obj
                end
            end   
        end
        return nil
    end


    local mySpells = {
        q = {
            lastCast = 0,
            manaCost = 80,
            spell = g_local:get_spell_book():get_spell_slot(e_spell_slot.q),
            spellSlot = e_spell_slot.q,
            Range = 900,
            Width = 140,
            Speed = 1450,
            Level = 0,
            CastTime = 0.25,
        },
        q2 = {
            lastCast = 0,
            manaCost = 0,
            spell = g_local:get_spell_book():get_spell_slot(e_spell_slot.q),
            spellSlot = e_spell_slot.q,
            Range = 275,
            Width = 140,
            Speed = 1450,
            Level = 0,
            CastTime = 0.25,
        },
        w = {
            lastCast = 0,
            manaCost = 80,
            spell = g_local:get_spell_book():get_spell_slot(e_spell_slot.w),
            spellSlot = e_spell_slot.w,
            Range = 800,
            Level = 0,
            CastTime = 0,
        },
        e = {
            lastCast = 0,
            manaCost = {70, 80, 90, 100, 110},
            spell = g_local:get_spell_book():get_spell_slot(e_spell_slot.e),
            spellSlot = e_spell_slot.e,
            Range = 800,
            Width = 220,
            targetRadius = 225,
            selfRadius = 325,
            Speed = 1450,
            Level = 0,
            CastTime = 0.25,
        },
        r = {
            lastCast = 0,
            manaCost = 100,
            spell = g_local:get_spell_book():get_spell_slot(e_spell_slot.r),
            spellSlot = e_spell_slot.r,
            Range = 2000,
            Width = 500,
            Speed = 800,
            Level = 0,
            CastTime = 0.75,
        }
    }


    cheat.register_module(
        {
            champion_name = "Renata",

            spell_q = function()
                local target = features.target_selector:get_default_target()
                local mode = features.orbwalker:get_mode()
            
                if not vUtils.canCast(mySpells, "q") then
                    vUtils.Prints("Q Spell: Not available for casting (cooldown or mana)")
                    return
                end
            --NEED TO FIX THISS
                -- Check for initial Q cast logic
                if not q_buff() and target then
                    local qHit = vUtils.predPosition(mySpells, "q", target)
                    local badMinion = vUtils.MinionInLine(mySpells, "q", qHit.position)
            
                    if qHit.valid and qHit.hitchance >= acc_q_slider:get_value() and not badMinion then
                        if (mode == vUtils.Combo_key and checkboxq:get_value()) or (mode == vUtils.Harass_key and checkbox_harass_q:get_value()) then
                            vUtils.Prints("Casting Q")
                            g_input:cast_spell(mySpells.q.spellSlot, qHit.position)
                            features.orbwalker:set_cast_time(mySpells.q.CastTime)
                            vUtils.Prints("Casted Q")
                            return true
                        end
                    end
                elseif q_buff() then
                    -- Adjusted Recast Q logic to check for range to the target with the Q buff
                    local qBuffedTarget = qTarget() -- This should get the target that has the Q buff
                    if qBuffedTarget then
                        for _, obj in pairs(features.entity_list:get_all()) do
                            if obj:is_hero() and obj:is_enemy() and obj:is_alive() and features.buff_cache:get_buff(obj.index, "RenataQ") == nil then
                                local distanceToQBuffedTarget = vUtils.getDistance(obj.position, qBuffedTarget.position)
                                if distanceToQBuffedTarget <= mySpells.q2.Range then
                                    local q2Hit = vUtils.predPosition(mySpells, "q", obj) -- Use prediction for recasting Q
                                    if q2Hit.valid and q2Hit.hitchance >= acc_q_slider:get_value() then
                                        if (mode == vUtils.Combo_key and checkboxq:get_value()) or (mode == vUtils.Harass_key and checkbox_harass_q:get_value()) then
                                            vUtils.Prints("Recasting Q to new target within range of Q-buffed target")
                                            g_input:cast_spell(mySpells.q.spellSlot, q2Hit.position)
                                            features.orbwalker:set_cast_time(mySpells.q.CastTime)
                                            vUtils.Prints("Recasted Q to new target")
                                            return true
                                        end
                                    end
                                    break -- Once a valid target is found and attempted for recast, exit the loop
                                end
                            end
                        end
                    end
                end
            end,
            
            



            spell_w = function()
                local target = features.target_selector:get_default_target()
                local mode = features.orbwalker:get_mode()
            
                -- Check if W spell can be cast
                if not vUtils.canCast(mySpells, "w") then
                    vUtils.Prints("W Spell: Not available for casting (cooldown or mana)")
                    return
                end
            
                -- Check for allies around the local player and excluding self from the count
                local numAlliesAround = vUtils.NumAlliesInRange(mySpells.w.Range) - 1
                vUtils.Prints("Allies around me: " .. numAlliesAround)
            
                if numAlliesAround > 0 and checkboxw:get_value() then
                    for _, ally in pairs(features.entity_list:get_allies()) do
                        if ally and ally:is_alive() and ally:is_hero() and ally ~= g_local then
                            local allyHealthPercentage = (ally.health / ally.max_health) * 100
                            local distanceToAlly = vUtils.getDistance(g_local.position, ally.position)
                            local distanceToTarget = vUtils.getDistance(ally.position, target.position)
            
                            if mode == vUtils.Combo_key and distanceToAlly <= mySpells.w.Range and allyHealthPercentage <= w_health_slider:get_value() then
                                if distanceToTarget <= ally.attack_range or distanceToTarget <= danger_range then
                                    vUtils.Prints("Casting W on Ally")
                                    g_input:cast_spell(mySpells.w.spellSlot, ally.network_id)
                                    vUtils.Prints("Casted W on Ally")
                                    return true
                                end
                            end
                        end
                    end
                end
            
                -- Cast W on self if the checkbox for self-casting is checked and the player's health is below the threshold
                if checkbox_w_self:get_value() and (mode == vUtils.Combo_key or mode == vUtils.Harass_key) then
                    local selfHealthPercentage = (g_local.health / g_local.max_health) * 100
                    if selfHealthPercentage <= w_health_slider:get_value() and g_local.health ~= 0 then
                        vUtils.Prints("Casting W on self")
                        g_input:cast_spell(mySpells.w.spellSlot, g_local.network_id)
                        vUtils.Prints("Casted W on self")
                        return true
                    end
                end
            end,
            

            spell_e = function()
                local target = features.target_selector:get_default_target()
                local mode = features.orbwalker:get_mode()
            
                if not vUtils.canCast(mySpells, "e") then
                    vUtils.Prints("E Spell: Not available for casting (cooldown or mana)")
                    return
                end
            
                if target and vUtils.isSpellInRange(mySpells, "e", target) then
                    local eHit = vUtils.predPosition(mySpells, "e", target)
                    vUtils.Prints("Getting E hit prediction")
            
                    if (eHit.valid and eHit.hitchance >= acc_e_slider:get_value()) then
                        if (features.orbwalker:get_mode() == vUtils.Combo_key and checkboxe:get_value()) or
                           (features.orbwalker:get_mode() == vUtils.Harass_key and checkbox_harass_e:get_value()) then
                            local action = features.orbwalker:get_mode() == vUtils.Combo_key and "combo" or "harass"
                            vUtils.Prints("Casting E (" .. action .. ")")
                            g_input:cast_spell(mySpells.e.spellSlot, eHit.position)
                            features.orbwalker:set_cast_time(mySpells.e.CastTime)
                            vUtils.Prints("Casted E (" .. action .. ")")
                            return true
                        end
                    end
                end
            end,
            

            spell_r = function()

                local target = features.target_selector:get_default_target()
                local mode = features.orbwalker:get_mode()
            
                if not vUtils.canCast(mySpells, "r") then
                    vUtils.Prints("R Spell: Not available for casting (cooldown or mana)")
                    return
                end
                
                    if features.orbwalker:get_mode() == vUtils.Combo_key then
                        vUtils.Prints("Do Ult Combo?")
                        local numEnemiesInRange = vUtils.NumEnemiesInRange(mySpells.r.Range)
                        vUtils.Prints("In range: " .. numEnemiesInRange)
                
                        if numEnemiesInRange > 0 and target then
                            local rHit = vUtils.predPosition(mySpells, "r", target)
                            if rHit.valid and rHit.hitchance > 1.0 then -- Assuming hitchance > 1.0 means a high probability hit
                                vUtils.Prints("R pred doing rect")
                                local poly = vUtils.Rectangle_Polygon(g_local.position, target.position, mySpells.r.Width, mySpells.r.Range)
                                vUtils.Prints("R get x hit by rect")
                                local numHits = vUtils.getEnimiesHitBy(poly)
                                if numHits >= rslider:get_value() then
                                    g_input:cast_spell(mySpells.r.spellSlot, rHit.position)
                                    vUtils.Prints("Casted R (Combo)")
                                    return true
                                end
                            end
                        end
                    end
            end,
                


            
            get_priorities = function()
                return {
                    "spell_q",
                    "spell_r",
                    "spell_e",
                    "spell_w"
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
        local resources_path = cheat:get_resource_path()
        local logo_path = resources_path:gsub("resources$", "lua\\lib\\" .. vAIO_LOGO_NAME)
        local logo = g_render:load_texture_from_file(logo_path)


        if checkboxwatermarkdraw:get_value() == true then
            vUtils.text(vec2:new(13.2, 137), color:new(vUtils.currentColor.r, vUtils.currentColor.g, vUtils.currentColor.b, vUtils.currentColor.a), "[vTeemo]", "QueensidesMedium", 30)
            if logo ~= nil then
                g_render:image(vec2:new(-60, -50), vec2:new(240, 240), logo)
            end
        end

        if checkboxqdraw:get_value() == true then
            if vUtils.canCast(mySpells, "q") == true then
                vUtils.circle_3d(g_local.position, mySpells["q"].Range, 2, 2.25, true )
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
    Renata = vRenata,
    Teemo = vTeemo
}
Champion = g_local.champion_name.text
if championModules[Champion] then
    championModules[Champion]()
    LoadPrints("[v" .. Champion .. "] -- Loading from [vAIO]")
    LoadDBG = 0
else
    LoadPrints("Champion Not Supported in [vAIO].")
    LoadDBG = 0
end
