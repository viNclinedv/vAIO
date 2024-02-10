--[[vAIO]]--
--[[by -v]]--
--[[Discord @viNclinedv]]--

--local vUtils = require "lib.vUtils"




local vAIO_VERSION = "1.0"
local vAIO_LUA_NAME = "vAIO.lua"
local vAIO_REPO_BASE_URL = "https://raw.githubusercontent.com/viNclinedv/vAIO/main/"
local vAIO_REPO_SCRIPT_PATH = vAIO_REPO_BASE_URL .. vAIO_LUA_NAME

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
    local current_file_path = resources_path:gsub("resources$", "lua/" .. vAIO_LUA_NAME)
    local file, errorMessage = io.open(current_file_path, "w")
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
    local remote_version = latest_script_content:match("local vAIO_VERSION = \"(%d+%.%d+)\"")
    if not remote_version then
        print("Failed to extract version from the latest [vAIO] content.")
        return
    end
    print("Local version: " .. vAIO_VERSION .. ", Remote version: " .. remote_version)
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
check_for_update()



function vLeona()

                        Script_name = "vLeona"
                        Combo_key = 1
                        Clear_key = 3
                        Harass_key = 4




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


                        cheat.register_callback("render", function()
                            if checkbox_w_drawings:get_value() == true and g_local:get_spell_book():get_spell_slot(e_spell_slot.w):is_ready() then
                            darkpurple = color:new(57, 0, 70)
                            g_render:circle_3d(g_local.position, purple, 450, 2, 100, 2)
                            end
                        end)
                        cheat.register_callback("render", function()
                            if checkbox_e_drawings:get_value() == true and g_local:get_spell_book():get_spell_slot(e_spell_slot.e):is_ready() then
                            green = color:new(0, 255, 21)
                            g_render:circle_3d(g_local.position, green, 900, 2, 100, 2)
                            end
                        end)
                        cheat.register_callback("render", function()
                            if checkbox_e_drawings:get_value() == true and g_local:get_spell_book():get_spell_slot(e_spell_slot.e):is_ready() then
                            blue = color:new(76, 0, 255)
                            g_render:circle_3d(g_local.position, blue, 1200, 2, 100, 2)
                            end
                        end)


                        function createEnemiesList()
                            return features.entity_list:get_enemies()
                        end

                        function createEnemyMinionsList()
                            return features.entity_list:get_enemy_minions()
                        end

                        function getTargetMr(target)
                            --return 100 / (target.MR+100)
                            return 100 / (target.total_mr + 100)
                        end

                        function getTargetArmor(target)
                            --return 100 / (target.armor+100)
                            return 100 / (target.total_armor + 100)
                        end

                        function getDistance(from,to)
                            return from:dist_to(to)
                        end


                        local mySpells = {
                            q = {
                                lastCast = 0,
                                manaCost = {35 , 40 , 45 , 50 , 55},
                                spell = g_local:get_spell_book():get_spell_slot(e_spell_slot.q),
                                spellSlot = e_spell_slot.q,
                                Range = 125,
                                Level = 0,
                                Base = {10, 35, 60, 85, 110},
                                CastTime = 0,
                                coolDown = {14 , 13 , 12 , 11 , 10},
                            },
                            
                            w = {
                                lastCast = 0,
                                manaCost = {60, 60, 60, 60, 60 },
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
                                manaCost = {60, 60, 60, 60, 60 },
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
                                Range =  1200,
                                Radius = 175,
                                Radius2 = 325,
                                Speed = 1300,
                                Level = 0,
                                CastTime = 0.25,
                            }
                        }
                        function mySpells:refreshSpells()
                            self['q'].Level = g_local:get_spell_book():get_spell_slot(e_spell_slot.q).level
                            self['q'].spell = g_local:get_spell_book():get_spell_slot(e_spell_slot.q)
                            self['q'].spellSlot = e_spell_slot.q

                            self['w'].Level = g_local:get_spell_book():get_spell_slot(e_spell_slot.w).level
                            self['w'].spell = g_local:get_spell_book():get_spell_slot(e_spell_slot.w)
                            self['w'].spellSlot = e_spell_slot.w

                            self['e'].Level = g_local:get_spell_book():get_spell_slot(e_spell_slot.e).level
                            self['e'].spell = g_local:get_spell_book():get_spell_slot(e_spell_slot.e)
                            self['e'].spellSlot = e_spell_slot.e

                            self['r'].Level = g_local:get_spell_book():get_spell_slot(e_spell_slot.r).level
                            self['r'].spell = g_local:get_spell_book():get_spell_slot(e_spell_slot.r)
                            self['r'].spellSlot = e_spell_slot.r
                        end


                        function mySpells:isSpellReady(spell)
                            if self[spell].spell:is_ready() then
                                return true
                            else
                                return false
                            end
                        end


                        function mySpells:haveEnoughMana(spell)
                            if g_local.mana >= self[spell].manaCost[self[spell].Level] then
                                return true
                            else
                                return false
                            end
                        end


                        function mySpells:canCast(spell)
                            self:refreshSpells()
                            if self:isSpellReady(spell) and self:haveEnoughMana(spell) then
                                return true
                            else
                                return false
                            end
                        end




                        function mySpells:isSpellInRange(spell,target)
                            if target.position:dist_to(g_local.position) <= self[spell].Range then
                                return true
                            else
                                return false
                            end
                        end

                        function mySpells:predPosition(spell,target)
                            local pred = features.prediction:predict(target.index, self[spell].Range, self[spell].Speed, self[spell].Width, self[spell].CastTime, g_local.position)
                            return pred
                        end



                        function NumEnemiesInRangeTarget(range)
                            local target = features.target_selector:get_default_target()
                            local numAround = 0
                            for _,entity in pairs(features.entity_list:get_enemies()) do
                                if  entity ~= nil and not entity:is_invisible() and entity:is_alive() and entity.position:dist_to(target.position) <= range  then
                                    numAround = numAround + 1
                                end
                            end
                            return numAround
                        end




                        function mySpells:qSpell()
                            local mode = features.orbwalker:get_mode()
                            local target = features.target_selector:get_default_target()
                            if (mode == Combo_key and checkboxq:get_value() == true) or (mode == Harass_key and checkbox_harass_q:get_value() == true) then
                                if target ~= nil and getDistance(g_local.position, target.position) <= 125 then
                                    if self:canCast('q') then 
                                        if not features.orbwalker:should_reset_aa() then
                                            g_input:cast_spell(e_spell_slot.q)
                                            features.orbwalker:reset_aa_timer()
                                        end
                                    end
                                end
                            end
                        end

                        function mySpells:wSpell()
                            local mode = features.orbwalker:get_mode()
                            local target = features.target_selector:get_default_target()
                            if (mode == Combo_key and checkboxw:get_value() == true) or (mode == Harass_key and checkbox_harass_w:get_value() == true) then
                                if target ~= nil and getDistance(g_local.position, target.position) <= self['w'].Width then
                                    if self:canCast('w') then 
                                        g_input:cast_spell(e_spell_slot.w)
                                    end
                                end
                            end
                        end

                        function mySpells:eSpell()

                        if self:canCast('e') then
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
                                    low = 0,
                                }

                                
                                for _, hitchanceLevel in ipairs({e_hitchance.immobile, e_hitchance.very_high, e_hitchance.high, e_hitchance.medium, e_hitchance.low}) do
                                    for _, entity in pairs(features.entity_list:get_enemies()) do
                                        if entity ~= nil and not entity:is_invisible() and entity:is_alive() and getDistance(g_local.position, entity.position) <= self['e'].Range then
                                            local pred = features.prediction:predict(entity.index, self['e'].Range, self['e'].Speed, self['e'].Width, self['e'].CastTime, g_local.position)
                                            if pred.valid and pred.hitchance >= hitchanceLevel then
                                                local distanceToCursor = getDistance(cursorPos, entity.position)
                                                if distanceToCursor < shortestCursorDistance or (pred.hitchance > bestHitchance and distanceToCursor <= shortestCursorDistance) then
                                                    bestHitchance = pred.hitchance
                                                    shortestCursorDistance = distanceToCursor
                                                    bestTarget = entity
                                                end
                                            end
                                        end
                                    end
                                    if bestTarget then break end
                                end
                                if bestTarget then
                                    g_input:cast_spell(e_spell_slot.e, bestTarget.position)
                                else
                                end
                            end
                        end


                            local mode = features.orbwalker:get_mode()
                            if mode == Combo_key and checkboxe:get_value() == true then
                                local eRange = self['e'].Range + 150
                                local bestTarget = nil
                                local highestMetric = -1
                                

                                for _, target in pairs(features.entity_list:get_enemies()) do
                                    if target ~= nil and not target:is_invisible() and target:is_alive() and getDistance(g_local.position, target.position) <= eRange then
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
                                
                                if bestTarget and self:canCast('e') then
                                    local eHit = features.prediction:predict(bestTarget.index, self['e'].Range, self['e'].Speed, self['e'].Width, 0, g_local.position)
                                    if eHit.valid and eHit.hitchance >= acc_e_slider:get_value() then
                                        g_input:cast_spell(e_spell_slot.e, eHit.position)
                                    end
                                end
                            end
                        end


                        function mySpells:rSpell()
                            local mode = features.orbwalker:get_mode()

                            if self:canCast('r') then
                                if checkbox_assist_cast_r:get_value() == true and g_input:is_key_pressed(82) then
                                    local cursorPos = g_input:get_cursor_position_game()
                                    local bestTarget = nil
                                    local bestHitchance = -1
                                    local shortestCursorDistance = math.huge
                            
                                    local target = features.target_selector:get_default_target()   
                                    local RnumTarget = NumEnemiesInRangeTarget(325)
                            
                                    if RnumTarget >= rslider:get_value() then
                                        for _, entity in pairs(features.entity_list:get_enemies()) do
                                            if entity ~= nil and not entity:is_invisible() and entity:is_alive() and getDistance(g_local.position, entity.position) <= self['r'].Range then
                                                local pred = features.prediction:predict(entity.index, self['r'].Range, self['r'].Speed, self['r'].Radius, 0, g_local.position)
                                                if pred.valid and pred.hitchance >= bestHitchance then
                                                    local distanceToCursor = getDistance(cursorPos, entity.position)
                                                    if distanceToCursor < shortestCursorDistance or (pred.hitchance > bestHitchance and distanceToCursor <= shortestCursorDistance) then
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
                            end
                            
                            
                            


                            if mode == Combo_key and checkboxr:get_value() == true and g_input:is_key_pressed(17) then
                                local rRange = self['r'].Range
                                local bestTarget = nil
                                local highestMetric = -1
                                
                                for _, target in pairs(features.entity_list:get_enemies()) do
                                    if target ~= nil and not target:is_invisible() and target:is_alive() and getDistance(g_local.position, target.position) <= rRange then
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
                                    local rHit = features.prediction:predict(bestTarget.index, self['r'].Range, self['r'].Speed, self['r'].Radius, 0, g_local.position)
                                    if rHit.valid and rHit.hitchance >= acc_r_slider:get_value() then
                                        g_input:cast_spell(e_spell_slot.r, rHit.position)
                                        return
                                    end
                                end
                            end
                        
                            if mode == Combo_key and checkboxr:get_value() == true then
                                local RnumTarget = NumEnemiesInRangeTarget(325)
                                if RnumTarget >= rslider:get_value() then
                                    local target = features.target_selector:get_default_target()
                                    if target and target.position:dist_to(g_local.position) <= self['r'].Range then
                                        local rHit = features.prediction:predict(target.index, self['r'].Range, self['r'].Speed, self['r'].Radius, 0, g_local.position)
                                        if rHit.valid and rHit.hitchance >= acc_r_slider:get_value() then
                                            g_input:cast_spell(e_spell_slot.r, rHit.position)
                                        end
                                    end
                                end
                            end
                        end



                        cheat.register_module({
                            champion_name = "Leona",
                            spell_q = function()
                                mySpells:qSpell()
                            end,
                            spell_w = function()
                                mySpells:wSpell()
                            end,
                            spell_e = function()
                                mySpells:eSpell()
                            end ,
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
                        })
end

function vTeemo()
                --variables
                Combo_key = 1
                Clear_key = 3
                Harass_key = 4
                Flee_key = 5
                Q_range = 680
                Q_cost = g_local:get_spell_book():get_spell_slot(e_spell_slot.q).level * 5 + 65
                W_cost = 40
                R_speed, R_width, R_windup = 1000, 160, 0.25
                R_range = g_local:get_spell_book():get_spell_slot(e_spell_slot.r).level * 250 + 150
                R_cost = 75
                Script_name = "vTeemo"



                local test_navigation = menu.get_main_window():push_navigation(Script_name, 10000)

                local q_config = g_config:add_bool(true, "Use Q (Combo)")
                local w_config = g_config:add_bool(true, "Use W (Combo)")
                local q_harass_config = g_config:add_bool(true, "Use Q (Harass)")
                local w_harass_config = g_config:add_bool(true, "Use W (Harass)")
                local w_flee_config = g_config:add_bool(true, "Use W (Flee)")
                local w_evade_config = g_config:add_bool(true, "Use W (Evade)")
                local q_drawings_config = g_config:add_bool(true, "Q Drawings")
                local debug_config = g_config:add_bool(true, "Debug?")
                local wantigapclose_config = g_config:add_bool(true, "W Anti Gap Close")
                local rantigapclose_config = g_config:add_bool(true, "R Anti Gap Close")

                local my_nav = menu.get_main_window():find_navigation(Script_name)

                local spell_sect = my_nav:add_section("Use Spells in Combo")
                local checkboxq = spell_sect:checkbox("Use Q (Combo)", q_config)
                local checkboxw = spell_sect:checkbox("Use W (Combo)", w_config)
                

                checkboxq:set_value(true)
                checkboxw:set_value(true)


                local harass_sect = my_nav:add_section("Use Spells in Harass")
                local checkbox_harass_q = harass_sect:checkbox("Use Q (Harass)", q_harass_config)
                local checkbox_harass_w = harass_sect:checkbox("Use W (Harass)", w_harass_config)
                checkbox_harass_q:set_value(true)
                checkbox_harass_w:set_value(false)



                local flee_sect = my_nav:add_section("Use Spells in Flee")
                local checkbox_flee_w = flee_sect:checkbox("Use W (Flee)", w_flee_config)
                local checkboxwevade = flee_sect:checkbox("Use W (Evade)", w_evade_config)
                checkbox_flee_w:set_value(true)
                checkboxwevade:set_value(true)

                local antigapclose_sect = my_nav:add_section("AntiGapClose")
                local checkboxrantigapclose = antigapclose_sect:checkbox("Use R", rantigapclose_config)
                local checkboxwantigapclose = antigapclose_sect:checkbox("Use W", wantigapclose_config)
                checkboxrantigapclose:set_value(true)
                checkboxwantigapclose:set_value(true)

                local drawings_sect = my_nav:add_section("Drawings")
                local checkbox_q_drawings = drawings_sect:checkbox("Draw Q Range", q_drawings_config)
                checkbox_q_drawings:set_value(true)



                function getDistance(from,to)
                    return from:dist_to(to)
                end


                cheat.register_callback("render", function()
                    if checkbox_q_drawings:get_value() == true then
                    Q_range = 680
                    purple = color:new(201, 7, 245)
                    g_render:circle_3d(g_local.position, purple, Q_range, 2, 100, 2)
                    end
                end)


                cheat.register_module({
                    champion_name = "Teemo",


                    spell_q = function()
                        local target = features.target_selector:get_default_target()



                            if Q_cost > g_local.mana then
                                return false
                            end
                            if g_local:get_spell_book():get_spell_slot(e_spell_slot.q):is_ready() == false then
                                return false
                            end


                            --Assist Q
                            if Q_cost < g_local.mana then
                                if g_input:is_key_pressed(81) then
                                    local cursorPos = g_input:get_cursor_position_game()
                                    local shortestDistance = math.huge
                                    local closestEnemy = nil
                            
                                    for _, entity in pairs(features.entity_list:get_enemies()) do
                                        if entity ~= nil and not entity:is_invisible() and entity:is_alive() then
                                            local distanceToCursor = getDistance(cursorPos, entity.position)
                            
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
                            end
                            


                            local highestMetric = 0
                            local extendedRange = Q_range + 200
                            for _, target in pairs(features.entity_list:get_enemies()) do
                                if target ~= nil and features.orbwalker:is_attackable(target.index, extendedRange, true) then
                                    local targetMetric = target.attack_speed + (target.bonus_attack + target.base_attack)
                                    if targetMetric > highestMetric then
                                        highestMetric = targetMetric
                                        bestTarget = target
                                    end
                                end
                            end
                            if bestTarget ~= nil and features.orbwalker:get_mode() == Combo_key and checkboxq:get_value() == true and features.orbwalker:should_reset_aa() == true then
                                g_input:cast_spell(e_spell_slot.q, bestTarget.network_id)
                                features.orbwalker:set_cast_time(0.25)
                                return true
                            end
                            
                            
                            if target ~= nil and features.orbwalker:is_attackable(target.index, Q_range, true) then
                                if features.orbwalker:get_mode() == Harass_key and checkbox_harass_q:get_value() == true and features.orbwalker:should_reset_aa() == true then
                                    g_input:cast_spell(e_spell_slot.q, target.network_id)
                                    features.orbwalker:set_cast_time(0.25)
                                    return true
                                end
                            end

                    end,


                    spell_w = function()
                        local target = features.target_selector:get_default_target()



                            if W_cost > g_local.mana then
                                return false
                            end
                            if g_local:get_spell_book():get_spell_slot(e_spell_slot.w):is_ready() == false then
                                return false
                            end
                        
                            if checkboxwevade:get_value() == true then
                                if features.evade:is_active() and features.evade:is_position_safe(g_local.position, false) then
                                    g_input:cast_spell(e_spell_slot.w)
                                    return true
                                end
                            end

                            if checkboxwantigapclose:get_value() == true and features.orbwalker:get_mode() == Combo_key or features.orbwalker:get_mode() == Harass_key then
                            local antigapclosetarget = features.target_selector:get_antigapclose_target(400)
                                if antigapclosetarget ~= nil then
                                    if getDistance(antigapclosetarget.position, g_local.position) <= 400 then
                                        g_input:cast_spell(e_spell_slot.w)
                                        return true
                                    end
                                end
                            end

                            if target ~= nil and features.orbwalker:is_attackable(target.index, Q_range, true) then
                                if features.orbwalker:get_mode() == Combo_key and checkboxw:get_value() == true and g_local.movement_speed < target.movement_speed then 
                                    g_input:cast_spell(e_spell_slot.w)
                                    return true
                                end
                            end

                            if target ~= nil and features.orbwalker:is_attackable(target.index, Q_range, true) then    
                                if features.orbwalker:get_mode() == Flee_key and checkbox_flee_w:get_value() == true and g_local.movement_speed < target.movement_speed then
                                    g_input:cast_spell(e_spell_slot.w)
                                    return true
                                end
                            end

                    end,

                    spell_r = function()
                        local target = features.target_selector:get_default_target()



                            if R_cost > g_local.mana then
                                return false
                            end
                            if g_local:get_spell_book():get_spell_slot(e_spell_slot.r):is_ready() == false then
                                return false
                            end
                        
                            if checkboxrantigapclose:get_value() == true and features.orbwalker:get_mode() == Combo_key or features.orbwalker:get_mode() == Harass_key then
                                local antigapclosetarget = features.target_selector:get_antigapclose_target(400)
                                if antigapclosetarget ~= nil then
                                    g_input:cast_spell(e_spell_slot.r, antigapclosetarget.path_end)
                                    return true
                                end
                            end


                    end,

                    get_priorities = function()
                    return{
                        "spell_q",
                        "spell_w",
                        "spell_r"
                    }
                    end
                    
                    })

end



LoadDBG = 1
function LoadPrints(str)
    if LoadDBG == 1 then
        print(str)
    end
end
local championModules = {
    Leona = vLeona,
    Teemo = vTeemo,
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
