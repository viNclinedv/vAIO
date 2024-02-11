--[[

    [vAIO]
    by -v
    Discord @viNclinedv
    
]]--

local vAIO_VERSION = "1.0"
local vAIO_LUA_NAME = "vAIO.lua"
local vAIO_REPO_BASE_URL = "https://raw.githubusercontent.com/viNclinedv/vAIO/main/"
local vAIO_REPO_SCRIPT_PATH = vAIO_REPO_BASE_URL .. vAIO_LUA_NAME
local vUTILS_LUA_NAME = "vUtils.lua"
local vUTILS_REPO_BASE_URL = "https://raw.githubusercontent.com/viNclinedv/vUtils/main/"
local vUTILS_REPO_SCRIPT_PATH = vUTILS_REPO_BASE_URL .. vUTILS_LUA_NAME

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
    print("Local [vAIO] version: " .. vAIO_VERSION .. ", Remote [vAIO] version: " .. remote_version)
    if remote_version and remote_version > vAIO_VERSION then
        print("Updating from version " .. vAIO_VERSION .. " to " .. remote_version)
        if replace_current_file_with_latest_version(latest_script_content) then
            print("Update successful. Please reload [vAIO].")
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

    local e_acc_config = g_config:add_int(0, "E Accuracy")
    local r_acc_config = g_config:add_int(0, "R Accuracy")

    local num_nmeR = g_config:add_int(2, "R If Enemies Hit >=")

    local assist_cast_e_config = g_config:add_bool(true, "Assist Cast E")
    local assist_cast_r_config = g_config:add_bool(true, "Assist Cast R")

    local w_drawings_config = g_config:add_bool(true, "W Drawings")
    local e_drawings_config = g_config:add_bool(true, "E Drawings")
    local r_drawings_config = g_config:add_bool(true, "R Drawings")

    local spell_sect = my_nav:add_section("Use Spells in Combo")
    local harass_sect = my_nav:add_section("Use Spells in Harass")
    local acc_sect = my_nav:add_section("Accuracy Slider")
    local draw_sect = my_nav:add_section("Drawings")
    local enemies_sect = my_nav:add_section("Enemies")
    local assist_cast_sect = my_nav:add_section("Assist Cast")

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

    local acc_e_slider = acc_sect:slider_int("E Accuracy", e_acc_config, 0, 5, 1)
    local acc_r_slider = acc_sect:slider_int("R Accuracy", r_acc_config, 0, 5, 1)
    acc_e_slider:set_value(2)
    acc_r_slider:set_value(2)

    local rslider = enemies_sect:slider_int("R If Enemies Hit >=", num_nmeR, 1, 5, 1)
    rslider:set_value(2)

    local checkbox_assist_cast_e = assist_cast_sect:checkbox("Assist Cast E", assist_cast_e_config)
    local checkbox_assist_cast_r = assist_cast_sect:checkbox("Assist Cast R", assist_cast_r_config)
    checkbox_assist_cast_e:set_value(true)
    checkbox_assist_cast_r:set_value(true)

    local checkbox_w_drawings = draw_sect:checkbox("Draw W Range", w_drawings_config)
    local checkbox_e_drawings = draw_sect:checkbox("Draw E Range", e_drawings_config)
    local checkbox_r_drawings = draw_sect:checkbox("Draw R Range", r_drawings_config)
    checkbox_w_drawings:set_value(false)
    checkbox_e_drawings:set_value(false)
    checkbox_r_drawings:set_value(false)

    cheat.register_callback(
        "render",
        function()
            if
                checkbox_w_drawings:get_value() == true and
                    g_local:get_spell_book():get_spell_slot(e_spell_slot.w):is_ready()
             then
                darkpurple = color:new(57, 0, 70)
                g_render:circle_3d(g_local.position, purple, 450, 2, 100, 2)
            end
        end
    )
    cheat.register_callback(
        "render",
        function()
            if
                checkbox_e_drawings:get_value() == true and
                    g_local:get_spell_book():get_spell_slot(e_spell_slot.e):is_ready()
             then
                green = color:new(0, 255, 21)
                g_render:circle_3d(g_local.position, green, 900, 2, 100, 2)
            end
        end
    )
    cheat.register_callback(
        "render",
        function()
            if
                checkbox_e_drawings:get_value() == true and
                    g_local:get_spell_book():get_spell_slot(e_spell_slot.e):is_ready()
             then
                blue = color:new(76, 0, 255)
                g_render:circle_3d(g_local.position, blue, 1200, 2, 100, 2)
            end
        end
    )

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

    function mySpells:qSpell()
        if vUtils.canCast(mySpells, "q") == false then
            return
        end
        target = features.target_selector:get_default_target()
        mode = features.orbwalker:get_mode()

        if
            (target == vUtils.Combo_key and checkboxq:get_value() == true) or
                (target == vUtils.Harass_key and checkbox_harass_q:get_value() == true)
         then
            if target ~= nil and vUtils.getDistance(g_local.position, target.position) <= mySpells.q.Range then
                if not features.orbwalker:should_reset_aa() then
                    g_input:cast_spell(e_spell_slot.q)
                    features.orbwalker:reset_aa_timer()
                end
            end
        end
    end

    function mySpells:wSpell()
        if vUtils.canCast(mySpells, "w") == false then
            return
        end
        target = features.target_selector:get_default_target()
        mode = features.orbwalker:get_mode()

        if
            (target == vUtils.Combo_key and checkboxw:get_value() == true) or
                (target == vUtils.Harass_key and checkbox_harass_w:get_value() == true)
         then
            if target ~= nil and vUtils.getDistance(g_local.position, target.position) <= mySpells.w.Width then
                g_input:cast_spell(e_spell_slot.w)
            end
        end
    end

    function mySpells:eSpell()
        if vUtils.canCast(mySpells, "e") == false then
            return
        end
        target = features.target_selector:get_default_target()
        mode = features.orbwalker:get_mode()

        if checkbox_assist_cast_e:get_value() == true and g_input:is_key_pressed(69) then
            local cursorPos = g_input:get_cursor_position_game()
            local bestTarget = nil
            local bestHitchance = -1
            local shortestCursorDistance = math.huge

            local e_hitchance = {
                immobile = 4,
                very_high = 3,
                high = 2,
                medium = 1,
                low = 0
            }

            for _, hitchanceLevel in ipairs(
                {e_hitchance.immobile, e_hitchance.very_high, e_hitchance.high, e_hitchance.medium, e_hitchance.low}
            ) do
                for _, entity in pairs(features.entity_list:get_enemies()) do
                    if
                        entity ~= nil and not entity:is_invisible() and entity:is_alive() and
                            vUtils.getDistance(g_local.position, entity.position) <= mySpells["e"].Range
                     then
                        local pred = vUtils.predPosition(mySpells, "e", entity)
                        if pred.valid and pred.hitchance >= hitchanceLevel then
                            local distanceToCursor = vUtils.getDistance(cursorPos, entity.position)
                            if
                                distanceToCursor < shortestCursorDistance or
                                    (pred.hitchance > bestHitchance and distanceToCursor <= shortestCursorDistance)
                             then
                                bestHitchance = pred.hitchance
                                shortestCursorDistance = distanceToCursor
                                bestTarget = entity
                            end
                        end
                    end
                end
                if bestTarget then
                    break
                end
            end
            if bestTarget then
                g_input:cast_spell(e_spell_slot.e, bestTarget.position)
            end
        end

        if mode == vUtils.Combo_key and checkboxe:get_value() == true then
            local eRange = mySpells["e"].Range + 150
            local bestTarget = nil
            local highestMetric = -1

            for _, target in pairs(features.entity_list:get_enemies()) do
                if
                    target ~= nil and not target:is_invisible() and target:is_alive() and
                        vUtils.getDistance(g_local.position, target.position) <= eRange
                 then
                    local totalAttackSpeed = target.attack_speed
                    local totalAttackDamage = target.base_attack + target.bonus_attack
                    local weightAS = 0.5
                    local weightAD = 0.5
                    local combinedMetric = (totalAttackSpeed * weightAS) + (totalAttackDamage * weightAD)

                    if combinedMetric > highestMetric then
                        highestMetric = combinedMetric
                        bestTarget = target
                    end
                end
            end

            if bestTarget then
                local eHit = vUtils.predPosition(mySpells, "e", bestTarget)
                if eHit.valid and eHit.hitchance >= acc_e_slider:get_value() then
                    g_input:cast_spell(e_spell_slot.e, eHit.position)
                end
            end
        end
    end

    function mySpells:rSpell()
        if vUtils.canCast(mySpells, "r") == false then
            return
        end
        target = features.target_selector:get_default_target()
        mode = features.orbwalker:get_mode()

        if checkbox_assist_cast_r:get_value() == true and g_input:is_key_pressed(82) then
            local cursorPos = g_input:get_cursor_position_game()
            local bestTarget = nil
            local bestHitchance = -1
            local shortestCursorDistance = math.huge
            local RnumTarget = vUtils.NumEnemiesInRangeTarget(325)

            if RnumTarget >= rslider:get_value() then
                for _, entity in pairs(features.entity_list:get_enemies()) do
                    if
                        entity ~= nil and not entity:is_invisible() and entity:is_alive() and
                            vUtils.getDistance(g_local.position, entity.position) <= mySpells["r"].Range
                     then
                        local pred = vUtils.predPosition(mySpells, "r", entity)
                        if pred.valid and pred.hitchance >= bestHitchance then
                            local distanceToCursor = vUtils.getDistance(cursorPos, entity.position)
                            if
                                distanceToCursor < shortestCursorDistance or
                                    (pred.hitchance > bestHitchance and distanceToCursor <= shortestCursorDistance)
                             then
                                bestHitchance = pred.hitchance
                                shortestCursorDistance = distanceToCursor
                                bestTarget = entity
                            end
                        end
                    end
                end
                if bestTarget then
                    g_input:cast_spell(e_spell_slot.r, bestTarget.position)
                    return
                end
            end
        end

        if mode == vUtils.Combo_key and checkboxr:get_value() == true and g_input:is_key_pressed(17) then
            local rRange = mySpells["r"].Range
            local bestTarget = nil
            local highestMetric = -1

            for _, target in pairs(features.entity_list:get_enemies()) do
                if
                    target ~= nil and not target:is_invisible() and target:is_alive() and
                        vUtils.getDistance(g_local.position, target.position) <= rRange
                 then
                    local totalAttackSpeed = target.attack_speed
                    local totalAttackDamage = target.bonus_attack + target.base_attack
                    local weightAS = 0.5
                    local weightAD = 0.5
                    local combinedMetric = (totalAttackSpeed * weightAS) + (totalAttackDamage * weightAD)

                    if combinedMetric > highestMetric then
                        highestMetric = combinedMetric
                        bestTarget = target
                    end
                end
            end

            if bestTarget then
                local rHit = vUtils.predPosition(mySpells, "r", bestTarget)
                if rHit.valid and rHit.hitchance >= acc_r_slider:get_value() then
                    g_input:cast_spell(e_spell_slot.r, rHit.position)
                    return
                end
            end
        end

        if mode == vUtils.Combo_key and checkboxr:get_value() == true then
            local RnumTarget = vUtils.NumEnemiesInRangeTarget(325)
            if RnumTarget >= rslider:get_value() then
                if target and vUtils.getDistance(g_local.position, target.position) <= mySpells["r"].Range then
                    local rHit = vUtils.predPosition(mySpells, "r", target)
                    if rHit.valid and rHit.hitchance >= acc_r_slider:get_value() then
                        g_input:cast_spell(e_spell_slot.r, rHit.position)
                    end
                end
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
    local drawings_sect = my_nav:add_section("Drawings")

    local q_config = g_config:add_bool(true, "Use Q in Combo")
    local w_config = g_config:add_bool(true, "Use W in Combo", true)
    local q_harass_config = g_config:add_bool(true, "Use Q in Harass")
    local w_harass_config = g_config:add_bool(false, "Use W in Harass")
    local w_flee_config = g_config:add_bool(true, "Use W in Flee")
    local w_evade_config = g_config:add_bool(true, "Use W to Evade")
    local q_drawings_config = g_config:add_bool(true, "Draw Q Range")
    local w_antigapclose_config = g_config:add_bool(true, "W Anti-Gapclose")
    local r_antigapclose_config = g_config:add_bool(true, "R Anti-Gapclose")
    local assist_cast_q_config = g_config:add_bool(true, "Assist Cast Q")

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

    local checkbox_q_drawings = drawings_sect:checkbox("Draw Q Range", q_drawings_config)
    checkbox_q_drawings:set_value(true)

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

    cheat.register_callback(
        "render",
        function()
            if checkbox_q_drawings:get_value() then
                local color = color:new(201, 7, 245)
                g_render:circle_3d(g_local.position, color, mySpells.q.Range, 2, 100, 2)
            end
        end
    )

    cheat.register_module(
        {
            champion_name = "Teemo",
            spell_q = function()
                if vUtils.canCast(mySpells, "q") == false then
                    return
                end
                target = features.target_selector:get_default_target()
                mode = features.orbwalker:get_mode()

                if g_input:is_key_pressed(81) and checkbox_assist_cast_q:get_value() == true then
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
                    else
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
                if
                    bestTarget ~= nil and mode == vUtils.Combo_key and checkbox_q_combo:get_value() == true and
                        features.orbwalker:should_reset_aa() == true
                 then
                    g_input:cast_spell(e_spell_slot.q, bestTarget.network_id)
                    features.orbwalker:set_cast_time(0.25)
                    return true
                end

                if target ~= nil and features.orbwalker:is_attackable(target.index, mySpells["q"].Range, true) then
                    if
                        mode == vUtils.Harass_key and checkbox_q_harass:get_value() == true and
                            features.orbwalker:should_reset_aa() == true
                     then
                        g_input:cast_spell(e_spell_slot.q, target.network_id)
                        features.orbwalker:set_cast_time(0.25)
                        return true
                    end
                end
            end,
            spell_w = function()
                if vUtils.canCast(mySpells, "w") == false then
                    return
                end
                target = features.target_selector:get_default_target()
                mode = features.orbwalker:get_mode()

                if checkbox_w_evade:get_value() == true then
                    if features.evade:is_active() and features.evade:is_position_safe(g_local.position, false) then
                        g_input:cast_spell(e_spell_slot.w)
                        return true
                    end
                end

                if
                    checkbox_w_antigapclose:get_value() == true and target == vUtils.Combo_key or
                        target == vUtils.Harass_key
                 then
                    local antigapclosetarget = features.target_selector:get_antigapclose_target(400)
                    if antigapclosetarget ~= nil then
                        if vUtils.getDistance(antigapclosetarget.position, g_local.position) <= 400 then
                            g_input:cast_spell(e_spell_slot.w)
                            return true
                        end
                    end
                end

                if target ~= nil and features.orbwalker:is_attackable(target.index, mySpells["q"].Range, true) then
                    if
                        mode == vUtils.Combo_key and checkbox_w_combo:get_value() == true and
                            g_local.movement_speed < target.movement_speed
                     then
                        g_input:cast_spell(e_spell_slot.w)
                        return true
                    end
                end

                if target ~= nil and features.orbwalker:is_attackable(target.index, mySpells["q"].Range, true) then
                    if
                        mode == vUtils.Flee_key and checkbox_w_flee:get_value() == true and
                            g_local.movement_speed < target.movement_speed
                     then
                        g_input:cast_spell(e_spell_slot.w)
                        return true
                    end
                end
            end,
            spell_r = function()
                if vUtils.canCast(mySpells, "r") == false then
                    return
                end
                target = features.target_selector:get_default_target()
                mode = features.orbwalker:get_mode()

                if
                    checkbox_r_antigapclose:get_value() == true and target == vUtils.Combo_key or
                        target == vUtils.Harass_key
                 then
                    local antigapclosetarget = features.target_selector:get_antigapclose_target(400)
                    if antigapclosetarget ~= nil then
                        g_input:cast_spell(e_spell_slot.r, antigapclosetarget.path_end)
                        return true
                    end
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
