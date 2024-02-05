--[[
        

        vAIO
            -v


    +Killer Kha`Zix+
    +Lockdown Leona+
    +Lifeless Lissandra+
    +Remorseful Renata+
    +Tasty Teemo+
    +Zesty Zilean+


    +Loaded Lulu+ -BETA




    

->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->

                                /\  /\
                                /  \/  \
                                / /\/ /\ \
                                \ \/ /\/ /
                                \ \/\ \/
                                /\ \/\ \
                                / /\/ /\ \
                            / / / /\ \ \
                        /\  / / / /\ \ \ \  /\
                        /  \/ / / /  \ \ \ \/  \
                        / /\/ / / /    \ \ \/ /\ \
                        \ \/ /\/ /      \ \/ /\/ /
                        \ \/\ \/ /\  /\ \ \/\ \/
                        /\ \/\ \/  \/  \/\ \/\ \
                        / /\/ /\/ /\/ /\/ /\/ /\ \
                    / / / /\/ /\/ /\/ /\/ /\ \ \
                /\  / / / /\ \/\ \/\ \/\ \/\ \ \ \  /\
                /  \/ / / / /\ \/\ \/\ \/\ \ \ \ \ \/  \
                / /\/ / / / / /\/ /\/ /\/ /\ \ \ \ \/ /\ \
                \ \/ /\/ / / / / /\/ /\/ /\ \ \ \ \/ /\/ /
                \ \/\ \/ / / / /\ \/\ \/\ \ \ \ \ \/\ \/
                /\ \/\ \ \ \ \ \/\ \/\ \/ / / / /\ \/\ \
                / /\/ /\ \ \ \ \/ /\/ /\/ / / / / /\/ /\ \
                \ \/ /\ \ \ \ \/ /\/ /\/ /\/ / / / / /\/ /
                \  /\ \ \ \ \ \/\ \/\ \/\ \/ / / / /\  /
                \/  \ \ \ \/\ \/\ \/\ \/\ \/ / / /  \/
                    \ \ \/ /\/ /\/ /\/ /\/ / / /
                        \ \/ /\/ /\/ /\/ /\/ /\/ /
                        \ \/\ \/\  /\  /\ \/\ \/
                        /\ \/\ \ \/  \/ /\ \/\ \
                        / /\/ /\ \      / /\/ /\ \
                        \ \/ /\ \ \    / / / /\/ /
                        \  /\ \ \ \  / / / /\  /
                        \/  \ \ \ \/ / / /  \/
                            \ \ \/ / / /
                                \ \/ /\/ /
                                \ \/\ \/
                                /\ \/\ \
                                / /\/ /\ \
                                \ \/ /\/ /
                                \  /\  /
                                \/  \/

->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->






]]--










--[[
    Keen Kayn -Start
]]--
function KeenKayn()
            --[[
                Keen Kayn
                By: v  
                    Enjoy!
            ]]

            Combo_key = 1
            Clear_key = 3
            Harass_key = 4
            Flee_key = 5
            Script_name = "Keen Kayn"

            --menu
            local test_navigation = menu.get_main_window():push_navigation(Script_name, 10000)
            local my_nav = menu.get_main_window():find_navigation(Script_name)

            --spell configs
            local q_config = g_config:add_bool(true, "Use Q (Combo)")
            local w_config = g_config:add_bool(true, "Use W (Combo)")
            local r_config = g_config:add_bool(true, "Use R (Full Combo)")

            local q_harass_config = g_config:add_bool(true, "Use Q (Harass)")
            local w_harass_config = g_config:add_bool(true, "Use W (Harass)")

            local q_clear_config = g_config:add_bool(true, "Use Q (Clear)")
            local w_clear_config = g_config:add_bool(true, "Use W (Clear)")

            local w_acc_config = g_config:add_int(0, "W Accuracy")

            local health_config = g_config:add_int(0, "R Heal Health Threshhold (%))")
            local rKill_config = g_config:add_bool(true, "Use R to Kill (Combo)")
            local rHeal_config = g_config:add_bool(true, "Use R to Heal Darkin (Combo)")
            local fastExit_config = g_config:add_bool(true, "Fast Ult Exit")

            local Darkin_config = g_config:add_bool(true, "Darkin Mode")
            local Shadow_config = g_config:add_bool(true, "Shadow Mode")

            --draw config


            --sections
            local form_sect = my_nav:add_section("Manual Form Selection")
            local spell_sect = my_nav:add_section("Use Spells in Combo")
            local harass_sect = my_nav:add_section("Use Spells in Harass")
            local clear_sect = my_nav:add_section("Use Spells in Clear")
            local acc_sect = my_nav:add_section("Accuracy Slider")
            local R_sect = my_nav:add_section("R Settings")

            --ui
            local checkboxq = spell_sect:checkbox("Use Q (Combo)", q_config)
            local checkboxw = spell_sect:checkbox("Use W (Combo)", w_config)
            local checkboxr = spell_sect:checkbox("Use R (Full Combo)", r_config)
            checkboxq:set_value(true)
            checkboxw:set_value(true)
            checkboxr:set_value(true)

            local checkbox_harass_q = harass_sect:checkbox("Use Q (Harass)", q_harass_config)
            local checkbox_harass_w = harass_sect:checkbox("Use W (Harass)", w_harass_config)
            checkbox_harass_q:set_value(false)
            checkbox_harass_w:set_value(true)

            local checkbox_clear_q = clear_sect:checkbox("Use Q (Clear)", q_clear_config)
            local checkbox_clear_w = clear_sect:checkbox("Use W (Clear)", w_clear_config)
            checkbox_clear_q:set_value(true)
            checkbox_clear_w:set_value(true)

            local acc_w_slider = acc_sect:slider_int("W Accuracy", w_acc_config, 0, 5, 1)
            acc_w_slider:set_value(3)


            local rKill = R_sect:checkbox("Use R if Killable", rKill_config)
            local rHeal = R_sect:checkbox("Use R to Heal Darkin (Combo)", rHeal_config)
            local fastExit = R_sect:checkbox("Fast Ult Exit", fastExit_config)
            local r_health_slider = R_sect:slider_int("R Heal Health Threshhold (%))", health_config, 0, 100, 1)
            r_health_slider:set_value(35)
            rKill:set_value(true)
            rHeal:set_value(true)
            fastExit:set_value(true)

            local DarkinForm = form_sect:checkbox("I Am Darkin Kayn", Darkin_config)
            local ShadowForm = form_sect:checkbox("I Am Shadow Kayn", Shadow_config)
            ShadowForm:set_value(false)
            DarkinForm:set_value(false)



            function createEnemiesList()
                return features.entity_list:get_enemies()
            end

            function createEnemyMinionsList()
                return features.entity_list:get_enemy_minions()
            end

            function getDistance(from,to)
                return from:dist_to(to)
            end


            local mySpells = {
                qBase = {
                    lastCast = 0,
                    manaCost = {50 , 50 , 50 , 50 , 50},
                    spell = g_local:get_spell_book():get_spell_slot(e_spell_slot.q),
                    spellSlot = e_spell_slot.q,
                    Range = 550, -- test values, total
                    Width = 300, -- q width
                    Speed = 1450,-- scales with ms, need to calc
                    Level = 0,
                    Base = {75, 95, 115, 135, 155},
                    adRatio = (g_local:get_bonus_attack_damage() * 0.65),
                    CastTime = 0,
                    coolDown = {7 , 6.5 , 6 , 5.5 , 5},
                },
                
                wBase = {
                    lastCast = 0,
                    manaCost = {60, 65, 70, 75, 80},
                    spell = g_local:get_spell_book():get_spell_slot(e_spell_slot.w),
                    spellSlot = e_spell_slot.w,
                    Range = 680,
                    Speed = 2250, --test
                    Width = 225,
                    Level = 0,
                    Base = {90, 135, 180, 225, 270},
                    CastTime = 0.55,
                    adRatio = (g_local:get_bonus_attack_damage() * 1.3),
                    coolDown = {13, 12, 11, 10, 9}
                },
                wShadow = {
                    lastCast = 0,
                    manaCost = {60, 65, 70, 75, 80},
                    spell = g_local:get_spell_book():get_spell_slot(e_spell_slot.w),
                    spellSlot = e_spell_slot.w,
                    Range = 900,
                    Speed = 2250, --test
                    Width = 225,
                    Level = 0,
                    Base = {90, 135, 180, 225, 270},
                    CastTime = 0,
                    adRatio = (g_local:get_bonus_attack_damage() * 1.3),
                    coolDown = {13, 12, 11, 10, 9}

                },

                rBase = {
                    lastCast = 0,
                    manaCost = {100, 100, 100},
                    spell = g_local:get_spell_book():get_spell_slot(e_spell_slot.r),
                    spellSlot = e_spell_slot.r,
                    Range =  550,
                    Level = 0,
                    Base = g_local:get_spell_book():get_spell_slot(e_spell_slot.r).level * 100 + 50,
                    CastTime = 0,
                    adRatio = (g_local:get_bonus_attack_damage() * 1.75),
                    coolDown = {120, 100, 80}, 

                },
                rShadow = {
                    lastCast = 0,
                    manaCost = {100, 100, 100},
                    spell = g_local:get_spell_book():get_spell_slot(e_spell_slot.r),
                    spellSlot = e_spell_slot.r,
                    Range =  750,
                    Level = 0,
                    Base = g_local:get_spell_book():get_spell_slot(e_spell_slot.r).level * 100 + 50,
                    CastTime = 0,
                    adRatio = (g_local:get_bonus_attack_damage() * 1.75),
                    coolDown = {120, 100, 80}, 
                },
                rDarkin = {
                    lastCast = 0,
                    manaCost = {100, 100, 100},
                    spell = g_local:get_spell_book():get_spell_slot(e_spell_slot.r),
                    spellSlot = e_spell_slot.r,
                    Range =  550,
                    Level = 0,
                    CastTime = 0,
                    coolDown = {120, 100, 80}, 
                },
            }

            function mySpells:refreshSpells()
                self['qBase'].Level = g_local:get_spell_book():get_spell_slot(e_spell_slot.q).level
                self['qBase'].spell = g_local:get_spell_book():get_spell_slot(e_spell_slot.q)
                self['qBase'].spellSlot = e_spell_slot.q

                self['wBase'].Level = g_local:get_spell_book():get_spell_slot(e_spell_slot.w).level
                self['wBase'].spell = g_local:get_spell_book():get_spell_slot(e_spell_slot.w)
                self['wBase'].spellSlot = e_spell_slot.w
                self['wShadow'].Level = g_local:get_spell_book():get_spell_slot(e_spell_slot.w).level
                self['wShadow'].spell = g_local:get_spell_book():get_spell_slot(e_spell_slot.w)
                self['wShadow'].spellSlot = e_spell_slot.w

                self['rBase'].Level = g_local:get_spell_book():get_spell_slot(e_spell_slot.r).level
                self['rBase'].spell = g_local:get_spell_book():get_spell_slot(e_spell_slot.r)
                self['rBase'].spellSlot = e_spell_slot.r
                self['rShadow'].Level = g_local:get_spell_book():get_spell_slot(e_spell_slot.r).level
                self['rShadow'].spell = g_local:get_spell_book():get_spell_slot(e_spell_slot.r)
                self['rShadow'].spellSlot = e_spell_slot.r
                self['rDarkin'].Level = g_local:get_spell_book():get_spell_slot(e_spell_slot.r).level
                self['rDarkin'].spell = g_local:get_spell_book():get_spell_slot(e_spell_slot.r)
                self['rDarkin'].spellSlot = e_spell_slot.r
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
                print(self[spell].Range)
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


            --kaynslayready
            --kaynassready      0_0
            --[[function FormCheck()
                FirstForm = nil
                FirstFormTime = nil
                FinalForm = nil

                if g_input:is_key_pressed(74) then
                    print(tostring( FirstForm))
                    print(tostring( FirstFormTime))
                    print(tostring( FinalForm))
                end

                if FirstForm == nil and FirstFormTime == nil then
                    for i, buff in pairs(features.buff_cache:get_all_buffs(g_local.index)) do
                        if features.buff_cache:get_buff(g_local.index, "kaynslayready") then
                            FirstForm = "Darkin"
                            FirstFormTime = g_time
                        end
                        return FirstFormTime
                    end
                return FirstForm
                end
                
                if FirstForm == nil and FirstFormTime == nil then
                    for i, buff in pairs(features.buff_cache:get_all_buffs(g_local.index)) do
                        if features.buff_cache:get_buff(g_local.index, "kaynassready") then
                            FirstForm = "Shadow"
                            FirstFormTime = g_time
                        end
                        return FirstFormTime
                    end
                return FirstForm
                end



                if FinalForm == nil then
                    if FirstForm == "Darkin" and g_time > FirstFormTime + 478 then
                        if features.buff_cache:get_buff(g_local.index, "kaynslayready") then
                            FinalForm = "Shadow"
                            return FinalForm
                        end
                    end
                end
                if FinalForm == nil then
                    if FirstForm == "Shadow" and g_time > FirstFormTime + 478 then
                        if features.buff_cache:get_buff(g_local.index, "kaynassready") then
                            FinalForm = "Darkin"
                            return FinalForm
                        end
                    end
                end

            end]]--



            function shadowDamage()
                local percentBonus = 0
                if g_local.level == 1 then percentBonus = 0.080
                elseif g_local.level == 2 then percentBonus = 0.092
                elseif g_local.level == 3 then percentBonus = 0.105
                elseif g_local.level == 4 then percentBonus = 0.118
                elseif g_local.level == 5 then percentBonus = 0.131
                elseif g_local.level == 6 then percentBonus = 0.144
                elseif g_local.level == 7 then percentBonus = 0.157
                elseif g_local.level == 8 then percentBonus = 0.170
                elseif g_local.level == 9 then percentBonus = 0.183
                elseif g_local.level == 10 then percentBonus = 0.196
                elseif g_local.level == 11 then percentBonus = 0.209
                elseif g_local.level == 12 then percentBonus = 0.222
                elseif g_local.level == 13 then percentBonus = 0.235
                elseif g_local.level == 14 then percentBonus = 0.248
                elseif g_local.level == 15 then percentBonus = 0.261
                elseif g_local.level == 16 then percentBonus = 0.274
                elseif g_local.level == 17 then percentBonus = 0.287
                elseif g_local.level == 18 then percentBonus = 0.300
                end
                return percentBonus
            end

            FarmInRange = {}
            function Cache_Farm()
            local farmTable = features.entity_list:get_all()
                for i, obj_farm in ipairs(farmTable) do
                    if obj_farm:get_object_name() ~= nil and obj_farm:is_targetable() == true and obj_farm:is_dead() == false and obj_farm ~= nil
                    and not obj_farm:is_ally() == true
                    and (obj_farm.attack_range == 110 or
                    obj_farm.attack_range == 300 or
                    obj_farm.attack_range == 550 or
                    obj_farm.attack_range == 500 or
                    obj_farm.attack_range == 955 or
                    obj_farm.attack_range == 250 or
                    obj_farm.attack_range == 150 or
                    obj_farm.attack_range == 100 or
                    obj_farm.attack_range == 200 or
                    obj_farm.attack_range == 175) then
                        if obj_farm:dist_to_local() <= 900 and obj_farm:is_alive() == true and obj_farm.health > 5 
                        and not features.buff_cache:get_buff(obj_farm.index, "camprespawncountdownhidden") and not features.buff_cache:get_buff(obj_farm.index, "camprespawncountdownvisible") then
                            if obj_farm:get_object_name() ~= "SRU_CampRespawnMarker" or
                            obj_farm:get_object_name() ~= "Sru_CrabWard" or
                            obj_farm:get_object_name() ~= "turret" or
                            obj_farm:get_object_name() ~= "JammerDeviceobj" or
                                obj_farm:get_object_name() ~= "YellowTrinketobj" or
                                obj_farm:get_object_name() ~= "BlueTrinketobj" or
                                obj_farm:get_object_name() ~= "Zoeobj" or
                                obj_farm:get_object_name() ~= "Hexgate_Exitobj" or
                                obj_farm:get_object_name() ~= "Hexgateobj"
                                then
                                local exists = 0
                                    if #FarmInRange > 0 then
                                        for ii, alive in pairs(FarmInRange) do
                                            if alive.idx == obj_farm.index then
                                                exists = 1
                                            end
                                        end
                                    end
                                    if exists == 0 then
                                        table.insert(FarmInRange, {idx = obj_farm.index})
                                    end
                            end
                        end
                    end
                end
                for i, farm in pairs(FarmInRange) do
                local farmObj = features.entity_list:get_by_index(farm.idx)
                    if farmObj == nil then
                        table.remove(FarmInRange, i)
                    elseif not farmObj:is_alive() == true or farmObj.health <= 5 then
                        table.remove(FarmInRange, i)
                    elseif farmObj:dist_to_local() > 900 then
                        table.remove(FarmInRange, i)
                    elseif farmObj:is_invalid_object() == true then
                        table.remove(FarmInRange, i)
                    elseif farmObj:is_visible() == false then
                        table.remove(FarmInRange, i)
                    end
                end

            end



            function mySpells:qBaseSpell()
                local mode = features.orbwalker:get_mode()
                local target = features.target_selector:get_default_target()


                if (mode == Combo_key and checkboxq:get_value() == true) or (mode == Harass_key and checkbox_harass_q:get_value() == true) then
                    for i, enemy in pairs(features.entity_list:get_enemies()) do
                        for j, buff in pairs(features.buff_cache:get_all_buffs(enemy.index)) do
                            if features.buff_cache:get_buff(enemy.index, "kaynrhost") then
                                return false
                            end
                        end
                    end
                end

                if (mode == Combo_key and checkboxq:get_value() == true) or (mode == Harass_key and checkbox_harass_q:get_value() == true) then
                    if target ~= nil and getDistance(g_local.position, target.position) <= self['qBase'].Range then
                        if self:canCast('qBase') and features.orbwalker:is_in_attack() == false then
                            local qHit = features.prediction:predict(target.index, self['qBase'].Range, self['qBase'].Speed, self['qBase'].Width, 0, g_local.position)
                            if qHit.valid and qHit.hitchance >= 2 then
                                g_input:cast_spell(e_spell_slot.q, qHit.position)
                            end
                        end
                    end
                end

                if mode == Clear_key and checkbox_clear_q:get_value() == true then
                    for i, farm in pairs(FarmInRange) do
                        local farmObj = features.entity_list:get_by_index(farm.idx)
                        if farmObj ~= nil and farmObj:is_alive() == true and farmObj:is_visible() == true and farmObj:is_invalid_object() == false and #FarmInRange > 0 then
                            if self:canCast('qBase') and features.orbwalker:is_in_attack() == false and farmObj:dist_to_local() <= self["qBase"].Range then
                                g_input:cast_spell(e_spell_slot.q , farmObj.position)
                                return true
                            end
                        end
                    end
                end
            end

            function mySpells:wBaseSpell()
                local mode = features.orbwalker:get_mode()
                local target = features.target_selector:get_default_target()

                if (mode == Combo_key and checkboxw:get_value() == true) or (mode == Harass_key and checkbox_harass_w:get_value() == true) then
                    for i, enemy in pairs(features.entity_list:get_enemies()) do
                        for j, buff in pairs(features.buff_cache:get_all_buffs(enemy.index)) do
                            if features.buff_cache:get_buff(enemy.index, "kaynrhost") then
                                return false
                            end
                        end
                    end
                end


                if (mode == Combo_key and checkboxw:get_value() == true) or (mode == Harass_key and checkbox_harass_w:get_value() == true) then
                    if target ~= nil and getDistance(g_local.position, target.position) <= self['wBase'].Range then
                        if self:canCast('wBase') then 
                            local wHit = features.prediction:predict(target.index, self['wBase'].Range, self['wBase'].Speed, self['wBase'].Width, 0, g_local.position)
                            g_input:cast_spell(e_spell_slot.w, wHit.position)
                            features.orbwalker:set_cast_time(0.55)
                            return true
                        end
                    end
                end

                if features.orbwalker:get_mode() == Clear_key and checkbox_clear_w:get_value() == true then
                    for i, farm in pairs(FarmInRange) do
                        local farmObj = features.entity_list:get_by_index(farm.idx)
                        if farmObj ~= nil and farmObj:is_alive() ==true and farmObj:is_visible() == true and farmObj:is_invalid_object() == false and #FarmInRange > 0 then
                            if self:canCast('wBase') and features.orbwalker:is_in_attack() == false and farmObj:dist_to_local() <= self['wBase'].Range then
                                g_input:cast_spell(e_spell_slot.w , farmObj.position)
                                features.orbwalker:set_cast_time(0.55)
                                return true
                            end
                        end
                    end
                end
            end
            function mySpells:wShadowSpell()
                local mode = features.orbwalker:get_mode()
                local target = features.target_selector:get_default_target()

                if (mode == Combo_key and checkboxw:get_value() == true) or (mode == Harass_key and checkbox_harass_w:get_value() == true) then
                    for i, enemy in pairs(features.entity_list:get_enemies()) do
                        for j, buff in pairs(features.buff_cache:get_all_buffs(enemy.index)) do
                            if features.buff_cache:get_buff(enemy.index, "kaynrhost") then
                                return false
                            end
                        end
                    end
                end

                if (mode == Combo_key and checkboxw:get_value() == true) or (mode == Harass_key and checkbox_harass_w:get_value() == true) then
                    if target ~= nil and getDistance(g_local.position, target.position) <= self['wShadow'].Range then
                        if self:canCast('wShadow') then 
                            local wHit = features.prediction:predict(target.index, self['wShadow'].Range, self['wShadow'].Speed, self['wShadow'].Width, 0, g_local.position)
                            if wHit.valid and wHit.hitchance >= acc_w_slider:get_value() then
                            g_input:cast_spell(e_spell_slot.w, wHit.position)
                            return true
                            end
                        end
                    end
                end

                if features.orbwalker:get_mode() == Clear_key and checkbox_clear_w:get_value() == true then
                    for i, farm in pairs(FarmInRange) do
                        local farmObj = features.entity_list:get_by_index(farm.idx)
                        if farmObj ~= nil and farmObj:is_alive() ==true and farmObj:is_visible() == true and farmObj:is_invalid_object() == false and #FarmInRange > 0 then
                            if self:canCast('wBase') and features.orbwalker:is_in_attack() == false and farmObj:dist_to_local() <= self['wShadow'].Range then
                                g_input:cast_spell(e_spell_slot.w , farmObj.position)
                                return true
                            end
                        end
                    end
                end
            end

            -- kaynrenemymark, kaynrhost
            function mySpells:rBaseSpell()
                local mode = features.orbwalker:get_mode()
                local target = features.target_selector:get_default_target()
                local rEnter = g_time


                --Full Combo
                if mode == Combo_key and g_input:is_key_pressed(17) and checkboxr:get_value() == true then
                    if self:canCast('rBase') then
                        if target ~= nil then
                            for i, enemy in pairs(features.entity_list:get_enemies()) do
                                for j, buff in pairs(features.buff_cache:get_all_buffs(enemy.index)) do
                                    if features.buff_cache:get_buff(enemy.index, "kaynrenemymark") ~= nil and not features.buff_cache:get_buff(enemy.index, "kaynrhost") then
                                        g_input:cast_spell(e_spell_slot.r, enemy)
                                        features.orbwalker:set_cast_time(0.75)
                                    end
                                end
                            end
                        end
                    end
                end

                --ult kill
                if mode == Combo_key and rKill:get_value() == true then
                    if self:canCast('rBase') then
                        if target ~= nil then
                            for i, enemy in pairs(features.entity_list:get_enemies()) do
                                for j, buff in pairs(features.buff_cache:get_all_buffs(enemy.index)) do
                                    if features.buff_cache:get_buff(enemy.index, "kaynrenemymark") ~= nil and not features.buff_cache:get_buff(enemy.index, "kaynrhost") then
                                        local totalDamage = (self['rBase'].Base + self['rBase'].adRatio) + (enemy.total_armor / (enemy.total_armor + 100))
                                        --print("total damage =" .. totalDamage)
                                        if enemy.health < (totalDamage - 60) then
                                            g_input:cast_spell(e_spell_slot.r, enemy)
                                            features.orbwalker:set_cast_time(0.75)
                                            local rEnter = g_time
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
                --ult kill fast exit
                if mode == Combo_key and rKill:get_value() == true then
                    if g_local:get_spell_book():get_spell_slot(e_spell_slot.r):get_name() == "KaynRJumpOut" then
                        g_input:send_key_event(82, 0)
                        g_input:send_key_event(82, 1)
                    end
                end

            end
            function mySpells:rDarkinSpell()
                local mode = features.orbwalker:get_mode()
                local target = features.target_selector:get_default_target()


                --full combo
                if mode == Combo_key and g_input:is_key_pressed(17) and checkboxr:get_value() == true then
                    if self:canCast('rDarkin') then
                        if target ~= nil then
                            for i, enemy in pairs(features.entity_list:get_enemies()) do
                                for j, buff in pairs(features.buff_cache:get_all_buffs(enemy.index)) do
                                    if features.buff_cache:get_buff(enemy.index, "kaynrenemymark") ~= nil and not features.buff_cache:get_buff(enemy.index, "kaynrhost") then
                                        g_input:cast_spell(e_spell_slot.r, enemy)
                                        features.orbwalker:set_cast_time(0.75)
                                    end
                                end
                            end
                        end
                    end
                end

                --for heal
                if mode == Combo_key and rHeal:get_value() == true then
                    if self:canCast('rDarkin') then
                        if target ~= nil then
                            for i, enemy in pairs(features.entity_list:get_enemies()) do
                                for j, buff in pairs(features.buff_cache:get_all_buffs(enemy.index)) do
                                    if features.buff_cache:get_buff(enemy.index, "kaynrenemymark") ~= nil and not features.buff_cache:get_buff(enemy.index, "kaynrhost") then
                                        if ((g_local.health / g_local.max_health) * 100) <= r_health_slider:get_value() then
                                            g_input:cast_spell(e_spell_slot.r, enemy)
                                            features.orbwalker:set_cast_time(0.75)
                                        end
                                    end
                                end
                            end
                        end
                    end
                end

                --Ult kill
                if mode == Combo_key and rKill:get_value() == true then
                    if self:canCast('rDarkin') then
                        if target ~= nil then
                            for i, enemy in pairs(features.entity_list:get_enemies()) do
                                for j, buff in pairs(features.buff_cache:get_all_buffs(enemy.index)) do
                                    if features.buff_cache:get_buff(enemy.index, "kaynrenemymark") ~= nil and not features.buff_cache:get_buff(enemy.index, "kaynrhost") then
                                        local totalDamage = (enemy.max_health * ((0.15 + (0.13 * (g_local.bonus_attack/100)))) + (enemy.total_armor / (enemy.total_armor + 100)))
                                        --print("total damage =" .. totalDamage)
                                        if enemy.health < (totalDamage - 80) then
                                            g_input:cast_spell(e_spell_slot.r, enemy)
                                            features.orbwalker:set_cast_time(0.75)
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
                --ult kill fast exit
                if mode == Combo_key and (rKill:get_value() == true or fastExit:get_value() == true) then
                    if g_local:get_spell_book():get_spell_slot(e_spell_slot.r):get_name() == "KaynRJumpOut" then
                        g_input:send_key_event(82, 0)
                        g_input:send_key_event(82, 1)
                    end
                end
            end
            function mySpells:rShadowSpell()
                local mode = features.orbwalker:get_mode()
                local target = features.target_selector:get_default_target()

                
                --full combo
                if mode == Combo_key and g_input:is_key_pressed(17) and checkboxr:get_value() == true then
                    if self:canCast('rShadow') then
                        if target ~= nil then
                            for i, enemy in pairs(features.entity_list:get_enemies()) do
                                for j, buff in pairs(features.buff_cache:get_all_buffs(enemy.index)) do
                                    if features.buff_cache:get_buff(enemy.index, "kaynrenemymark") ~= nil and not features.buff_cache:get_buff(enemy.index, "kaynrhost") then
                                        g_input:cast_spell(e_spell_slot.r, enemy)
                                        features.orbwalker:set_cast_time(0.75)
                                    end
                                end
                            end
                        end
                    end
                end

                --ult kill
                if mode == Combo_key and rKill:get_value() == true then
                    if self:canCast('rShadow') then
                        if target ~= nil then
                            for i, enemy in pairs(features.entity_list:get_enemies()) do
                                for j, buff in pairs(features.buff_cache:get_all_buffs(enemy.index)) do
                                    if features.buff_cache:get_buff(enemy.index, "kaynrenemymark") ~= nil and not features.buff_cache:get_buff(enemy.index, "kaynrhost") then
                                        local totalDamageR = (self['rShadow'].Base + self['rShadow'].adRatio) + (enemy.total_armor / (enemy.total_armor + 100))
                                        shadowDamage()
                                        local percent = shadowDamage()
                                        local bonusDamage = ((self['rShadow'].Base + self['rShadow'].adRatio) + (enemy.total_armor / (enemy.total_armor + 100)) * percent) + (enemy.total_mr / (enemy.total_mr + 100))
                                        local completeDamageR = totalDamageR + bonusDamage
                                        --print("total damage =" .. completeDamageR)
                                        if enemy.health < (completeDamageR - 80) then
                                            g_input:cast_spell(e_spell_slot.r, enemy)
                                            features.orbwalker:set_cast_time(0.75)
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
                --ult kill fast exit
                if mode == Combo_key and rKill:get_value() == true then
                    if g_local:get_spell_book():get_spell_slot(e_spell_slot.r):get_name() == "KaynRJumpOut" then
                        g_input:send_key_event(82, 0)
                        g_input:send_key_event(82, 1)
                    end
                end

            end


            cheat.register_module({
                champion_name = "Kayn",
                spell_q = function()
                    mySpells:qBaseSpell()
                end,
                spell_w = function()

                    if FinalForm == "Shadow" then
                        mySpells:wShadowSpell()
                    end
                    if FinalForm == nil or FinalForm == "Darkin" then
                        mySpells:wBaseSpell()
                    end
                    --manual check if something breaks
                    if ShadowForm:get_value() == false then
                        mySpells:wBaseSpell()
                    end
                    if ShadowForm:get_value() == true then
                        mySpells:wShadowSpell()
                    end
                end,
                spell_r = function()
                    if FinalForm == nil then
                        mySpells:rBaseSpell()
                    end
                    if FinalForm == "Shadow" then
                        mySpells:rShadowSpell()
                    end
                    if FinalForm == "Darkin" then
                        mySpells:rDarkinSpell()
                    end
                    
                    --manual check if something breaks
                    if DarkinForm:get_value() == false and ShadowForm:get_value() == false then
                        mySpells:rBaseSpell()
                    end
                    if ShadowForm:get_value() == true then
                        mySpells:rShadowSpell()
                    end
                    if DarkinForm:get_value() == true then
                        mySpells:rDarkinSpell()
                    end
                end,
                get_priorities = function()
                    return {
                    "spell_r",
                    "spell_q",
                    "spell_w"
                    }
                end
            })
            cheat.register_callback("feature", Cache_Farm)
end
--[[
    Keen Kayn -End
]]--

--[[
    Killer Kha`Zix -Start
]]--
function KillerKhazix()
 --[[

                    Killer Kha`Zix
                        By: v
                            Enjoy!

                            Changelog:
                            7/23/22
                            Started Killer Kha'Zix

                            7/26/22
                            Finished Killer Kha`zix

                            08/20/22
                            Actually finished Killer Khazix dont listen to the update above ffs
                            ]]--



                            Combo_key = 1
                            Clear_key = 3
                            Harass_key = 4
                            Q_range, Q_windup = 325, 0.25
                            Q_cost = 20
                            W_range, W_speed, W_width, W_windup = 1025, 1700, 140 / 2, 0.25
                            W_cost = g_local:get_spell_book():get_spell_slot(e_spell_slot.w).level * 5 + 50
                            E_cost = 50
                            E_range, E_speed, E_width = 700, 1100, 150 / 2
                            R_cost = 100
                            Script_name = "Killer Kha'Zix"
                            
                            
                            
                            local test_navigation = menu.get_main_window():push_navigation(Script_name, 10000)
                            
                            local q_config = g_config:add_bool(true, "Use Q (Combo)")
                            local w_config = g_config:add_bool(true, "Use W (Combo)")
                            local e_config = g_config:add_bool(true, "Use E (Combo)")
                            local r_config = g_config:add_bool(true, "Use R (Combo)")
                            
                            local r_gap_close_config = g_config:add_bool(true, "Use R (Gap Close)")
                            local prefer_e_config = g_config:add_bool(true, "Use E First?")
                            local prediction_e_config = g_config:add_bool(true, "Use Prediction For E?")
                            local e_distance_config = g_config:add_int(0, "E Minimum Distance")
                            
                            local debug_config = g_config:add_bool(true, "Debug?")
                            
                            local num_nmeR = g_config:add_int(2, "R If Enemies")
                            local num_nmeE = g_config:add_int(2, "E If Enemies <")
                            
                            local q_harass_config = g_config:add_bool(true, "Use Q (Harass)")
                            local w_harass_config = g_config:add_bool(true, "Use W (Harass)")
                            local e_harass_config = g_config:add_bool(true, "Use E (Harass)")
                            
                            local q_clear_config = g_config:add_bool(true, "Use Q (Clear)")
                            local w_clear_config = g_config:add_bool(true, "Use W (Clear)")
                            local e_clear_config = g_config:add_bool(true, "Use E (Clear)")
                            
                            local w_acc_config = g_config:add_int(0, "W Accuracy")
                            local e_acc_config = g_config:add_int(0, "E Accuracy")
                            
                            local q_drawings_config = g_config:add_bool(true, "Q Drawings")
                            local w_drawings_config = g_config:add_bool(true, "W Drawings")
                            local e_drawings_config = g_config:add_bool(true, "E Drawings")
                            local r_drawings_config = g_config:add_bool(true, "R Drawings")
                            
                            local my_nav = menu.get_main_window():find_navigation(Script_name)
                            
                            local spell_sect = my_nav:add_section("Use Spells in Combo")
                            local harass_sect = my_nav:add_section("Use Spells in Harass")
                            local clear_sect = my_nav:add_section("Use Spells in Clear")
                            local acc_sect = my_nav:add_section("Accuracy Slider")
                            local misc_sect = my_nav:add_section("Misc.")
                            local debug_sect = my_nav:add_section("Debug?!")
                            local draw_sect = my_nav:add_section("Drawings")
                            local enemies_sect = my_nav:add_section("Enemies")
                            
                            
                            
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
                            local checkbox_harass_e = harass_sect:checkbox("Use E (Harass)", e_harass_config)
                            checkbox_harass_q:set_value(true)
                            checkbox_harass_w:set_value(true)
                            checkbox_harass_e:set_value(false)
                            
                            local checkbox_clear_q = clear_sect:checkbox("Use Q (Clear)", q_clear_config)
                            local checkbox_clear_w = clear_sect:checkbox("Use W (Clear)", w_clear_config)
                            local checkbox_clear_e = clear_sect:checkbox("Use E (Clear)", e_clear_config)
                            checkbox_clear_q:set_value(true)
                            checkbox_clear_w:set_value(false)
                            checkbox_clear_e:set_value(false)
                            
                            local checkbox_gap_close_r = misc_sect:checkbox("Use R (Gap Close)", r_gap_close_config)
                            local checkbox_prefer_e = misc_sect:checkbox("Use E First", prefer_e_config)
                            local checkbox_prediction_e = misc_sect:checkbox("Use Prediction For E", prediction_e_config)
                            local e_distance_slider = misc_sect:slider_int("E Minimum Distance", e_distance_config, 0, 900, 1)
                            checkbox_gap_close_r:set_value(true)
                            checkbox_prefer_e:set_value(true)
                            checkbox_prediction_e:set_value(false)
                            e_distance_slider:set_value(300)
                            
                            local acc_w_slider = acc_sect:slider_int("W Accuracy", w_acc_config, 0, 5, 1)
                            local acc_e_slider = acc_sect:slider_int("E Accuracy", e_acc_config, 0, 5, 1)
                            acc_w_slider:set_value(2)
                            acc_e_slider:set_value(1)
                            
                            local rslider = enemies_sect:slider_int("R if Enemies >=", num_nmeR, 1, 5, 1)
                            local eslider = enemies_sect:slider_int("E if Enemies <=", num_nmeE, 1, 5, 1)
                            rslider:set_value(2)
                            eslider:set_value(2)
                            
                            local checkbox_debug = debug_sect:checkbox("Print Statements", debug_config)
                            checkbox_debug:set_value(false)
                            
                            local checkbox_q_drawings = draw_sect:checkbox("Draw Q Range", q_drawings_config)
                            local checkbox_w_drawings = draw_sect:checkbox("Draw W Range", w_drawings_config)
                            local checkbox_e_drawings = draw_sect:checkbox("Draw E Range", e_drawings_config)
                            checkbox_q_drawings:set_value(false)
                            checkbox_w_drawings:set_value(false)
                            checkbox_e_drawings:set_value(false)
                            
                            
                            
                            function Prints(str)
                                local dbg = 1
                                if dbg == 1 and checkbox_debug:get_value() == true then
                                    print(str)
                                end
                            end
                            
                            
                            
                            
                            
                            --Evo Names:KhazixQEvo, KhazixWEvo, KhazixEEvo, KhazixREvo
                            -- Only really need to check Q and E
                            function EvoCheckQ()
                                if g_local.level == 6 or g_local.level == 11 or g_local.level == 16 then
                                    for i, buff in pairs(features.buff_cache:get_all_buffs(g_local.index)) do
                                        if buff.name == "KhazixQEvo" then
                                            Prints("Q Evo found")
                                            Q_range = 375
                                            return Q_range
                                        else
                                            Prints("Q Evo not found")
                                            Q_range = 325
                                            return Q_range
                                        end
                                    end
                                end
                            end
                            function EvoCheckE()
                                if g_local.level == 6 or g_local.level == 11 or g_local.level == 16 then
                                    for i, buff in pairs(features.buff_cache:get_all_buffs(g_local.index)) do
                                        if buff.name == "KhazixEEvo" then
                                            Prints("E Evo found")
                                            E_range = 900
                                            return E_range
                                        else
                                            Prints("E Evo not found")
                                            E_range = 700
                                            return E_range
                                        end
                                    end
                                end
                            end
                            
                            function NumEnemiesInRange(range)
                                Prints("Enemies around")
                                local numAround = 0
                                for _,entity in pairs(features.entity_list:get_enemies()) do
                                    if  entity ~= nil and not entity:is_invisible() and entity:is_alive() and entity.position:dist_to(g_local.position) <= range  then
                                        numAround = numAround + 1
                                    end
                                end
                                Prints("Enemies around end")
                                return numAround
                            end
                            
                            --draws
                            
                            cheat.register_callback("render", function()
                                if checkbox_q_drawings:get_value() == true and g_local:get_spell_book():get_spell_slot(e_spell_slot.q):is_ready() then
                                  purple = color:new(201, 7, 245)
                                  g_render:circle_3d(g_local.position, purple, Q_range, 2, 100, 2)
                                end
                            end)
                            cheat.register_callback("render", function()
                                if checkbox_w_drawings:get_value() == true and g_local:get_spell_book():get_spell_slot(e_spell_slot.w):is_ready() then
                                  green = color:new(0, 255, 21)
                                  g_render:circle_3d(g_local.position, green, W_range, 2, 100, 2)
                                end
                            end)
                            cheat.register_callback("render", function()
                                if checkbox_e_drawings:get_value() == true and g_local:get_spell_book():get_spell_slot(e_spell_slot.e):is_ready() then
                                  blue = color:new(76, 0, 255)
                                  g_render:circle_3d(g_local.position, blue, E_range, 2, 100, 2)
                                end
                            end)
                            
                            
                            FarmInRange = {}
                            function Cache_Farm()
                            Prints("(Start)Cf enter at: " ..  #FarmInRange)
                            local farmTable = features.entity_list:get_all()
                                for i, obj_farm in ipairs(farmTable) do
                                    if obj_farm:get_object_name() ~= nil and obj_farm:is_targetable() == true and obj_farm:is_dead() == false and obj_farm ~= nil
                                    and not obj_farm:is_ally() == true
                                    and (obj_farm.attack_range == 110 or
                                    obj_farm.attack_range == 300 or
                                    obj_farm.attack_range == 550 or
                                    obj_farm.attack_range == 500 or
                                    obj_farm.attack_range == 955 or
                                    obj_farm.attack_range == 250 or
                                    obj_farm.attack_range == 150 or
                                    obj_farm.attack_range == 100 or
                                    obj_farm.attack_range == 200 or
                                    obj_farm.attack_range == 175) then
                                        if obj_farm:dist_to_local() <= 900 and obj_farm:is_alive() == true and obj_farm.health > 1 and not features.buff_cache:get_buff(obj_farm.index, "camprespawncountdownhidden") and not features.buff_cache:get_buff(obj_farm.index, "camprespawncountdownvisible") then
                                            if obj_farm:get_object_name() ~= "SRU_CampRespawnMarker" or obj_farm:get_object_name() ~= "Sru_CrabWard" or obj_farm:get_object_name() ~= "turret" then
                                                local exists = 0
                                                    if #FarmInRange > 0 then
                                                        for ii, alive in pairs(FarmInRange) do
                                                            if alive.idx == obj_farm.index then
                                                                exists = 1
                                                            end
                                                        end
                                                    end
                                                    if exists == 0 then
                                                        Prints("Cf entering at: " ..  #FarmInRange)
                                                        table.insert(FarmInRange, {idx = obj_farm.index})
                                                        Prints("Cf entered at: " ..  #FarmInRange)
                                                    end
                                            end
                                        end
                                    end
                                end
                                for i, farm in pairs(FarmInRange) do
                                local farmObj = features.entity_list:get_by_index(farm.idx)
                                    if farmObj == nil then
                                        table.remove(FarmInRange, i)
                                    elseif not farmObj:is_alive() == true or farmObj.health <= 1 then
                                        table.remove(FarmInRange, i)
                                    elseif farmObj:dist_to_local() > 900 then
                                        table.remove(FarmInRange, i)
                                    elseif farmObj:is_invalid_object() == true then
                                        table.remove(FarmInRange, i)
                                    elseif farmObj:is_visible() == false then
                                        table.remove(FarmInRange, i)
                                    end
                                end
                            
                            end
                            
                            
                            cheat.register_module(
                                {
                                    champion_name = "Khazix",
                            
                                    spell_q = function()
                                        
                                        local target = features.target_selector:get_default_target()
                            
                                        Prints("Q Start")
                            
                                        EvoCheckQ()
                            
                                        if Q_cost > g_local.mana then
                                            Prints("Not enough mana for Q")
                                            return false
                                        end
                                        if g_local:get_spell_book():get_spell_slot(e_spell_slot.q):is_ready() == false then
                                            Prints("Q Not Ready")
                                            return false
                                        end
                            
                                        if g_local:is_alive() == true then EvoCheckQ()
                                        end
                            
                            
                                            if target ~= nil and features.orbwalker:is_attackable(target.index, Q_range, true) then
                                                if features.orbwalker:get_mode() == Combo_key and checkboxq:get_value() == true and features.orbwalker:is_in_attack() == false then
                                                    Prints("Casting Q (combo)")
                                                    Prints("Q_Range ==" ..  Q_range )
                                                    g_input:cast_spell(e_spell_slot.q, target.network_id)
                                                    features.orbwalker:set_cast_time(0.25)
                                                    Prints("Casted Q (combo)")
                                                    EvoCheckQ()
                                                    return true
                                                elseif features.orbwalker:get_mode() == Harass_key and checkbox_harass_q:get_value() == true and features.orbwalker:is_in_attack() == false then
                                                    Prints("Casting Q (harass)")
                                                    Prints("Q_Range ==" ..  Q_range )
                                                    g_input:cast_spell(e_spell_slot.q, target.network_id)
                                                    features.orbwalker:set_cast_time(0.25)
                                                    Prints("Casted Q (harass)")
                                                    EvoCheckQ()
                                                    return true
                                                end
                                            end
                            
                            
                                                --Clear
                                                if features.orbwalker:get_mode() == Clear_key and checkbox_clear_q:get_value() == true then
                                                    for i, farm in pairs(FarmInRange) do
                                                        local farmObj = features.entity_list:get_by_index(farm.idx)
                                                        if farmObj ~= nil and farmObj:is_alive() ==true and farmObj:is_visible() == true and farmObj:is_invalid_object() == false and #FarmInRange > 0 then
                                                            if g_local:get_spell_book():get_spell_slot(e_spell_slot.q):is_ready() == true and features.orbwalker:is_in_attack() == false then
                                                                Prints("Casting Q (farm)")
                                                                print(farmObj.index)
                                                                g_input:cast_spell(e_spell_slot.q , farmObj)
                                                                Prints("Casted Q (farm) at " ..farmObj.index)
                                                                return true
                                                            end
                                                        end
                                                    end
                                                end
                            
                                    end,
                            
                            
                            
                                    spell_w = function()
                            
                                        local target = features.target_selector:get_default_target()
                                        W_range, W_speed, W_width, W_windup = 1025, 1700, 140 / 2, 0.25
                                        W_cost = g_local:get_spell_book():get_spell_slot(e_spell_slot.w).level * 5 + 50
                            
                            
                                        Prints("W Start")
                            
                                        if W_cost > g_local.mana then
                                            Prints("Not enough mana for W")
                                            return false
                                        end
                                        if g_local:get_spell_book():get_spell_slot(e_spell_slot.w):is_ready() == false then
                                            Prints("W Not Ready")
                                            return false
                                        end
                            
                            
                                        if target ~= nil and features.orbwalker:is_attackable(target.index, W_range, true) then
                                            local wHit = features.prediction:predict(target.index, W_range, W_speed, W_width, W_windup, g_local.position)
                                            local badMinion = features.prediction:minion_in_line(g_local.position, wHit.position, W_width, -1)
                                            Prints("Getting W hit prediction")
                                            if features.orbwalker:get_mode() == Combo_key and checkboxw:get_value() == true then
                                                if (wHit.valid and wHit.hitchance >= acc_w_slider:get_value()) and badMinion == false and checkbox_prefer_e:get_value() == false then
                                                    Prints("Casting W (combo)")
                                                    g_input:cast_spell(e_spell_slot.w, wHit.position)
                                                    features.orbwalker:set_cast_time(0.25)
                                                    Prints("Casted W (combo)")
                                                    return true
                                                elseif checkbox_prefer_e:get_value() == true then
                                                    if g_local:get_spell_book():get_spell_slot(e_spell_slot.e):is_ready() == true then
                                                        Prints("Wait for E!")
                                                        return false
                                                    elseif g_local:get_spell_book():get_spell_slot(e_spell_slot.e):is_ready() == false then
                                                        Prints("Casting W (combo)")
                                                        g_input:cast_spell(e_spell_slot.w, wHit.position)
                                                        features.orbwalker:set_cast_time(0.25)
                                                        Prints("Casted W (combo)")
                                                        return true
                                                    end
                                            elseif features.orbwalker:get_mode() == Harass_key and checkbox_harass_w:get_value() == true then
                                                if (wHit.valid and wHit.hitchance >= acc_w_slider:get_value()) then
                                                    Prints("Casting W (harass)")
                                                    g_input:cast_spell(e_spell_slot.w, wHit.position)
                                                    features.orbwalker:set_cast_time(0.25)
                                                    Prints("Casted W (harass)")
                                                    return true
                                                    end
                                                end
                                            end
                                        end
                            
                                        
                                        --Clear, prefer heal
                                        
                                        if features.orbwalker:get_mode() == Clear_key and checkbox_clear_w:get_value() == true then
                                            for i, farm in pairs(FarmInRange) do
                                                local farmObj = features.entity_list:get_by_index(farm.idx)
                                                if farmObj ~= nil and farmObj:is_alive() ==true and farmObj:is_visible() == true and farmObj:is_invalid_object() == false and #FarmInRange > 0 then
                                                    if g_local:get_spell_book():get_spell_slot(e_spell_slot.w):is_ready() == true and (g_local.health / g_local.max_health) * 100 <= 90 then
                                                        Prints("Casting W (farm)")
                                                        g_input:cast_spell(e_spell_slot.w , farmObj.position)
                                                        print(farmObj.index)
                                                        Prints("Casted W (farm) at " ..farmObj.index)
                                                        return true
                                                    end
                                                end
                                            end
                                        end
                                        
                                    end,
                            
                                    spell_e = function()
                                        local target = features.target_selector:get_default_target()
                                        
                            
                                        Prints("E Start")
                                        EvoCheckE()

                                        if E_cost > g_local.mana then
                                            Prints("Not enough mana for E")
                                            return false
                                        end
                                        if g_local:get_spell_book():get_spell_slot(e_spell_slot.e):is_ready() == false then
                                            Prints("E Not Ready")
                                            return false
                                        end
                            
                            
                                        if g_local:is_alive() == true then EvoCheckE()
                                        end
                            
                                        if target ~= nil and features.orbwalker:is_attackable(target.index, E_range, true) then
                                            local Enum = NumEnemiesInRange(E_range)
                                            Prints("Enemeies around (E) = " .. Enum)
                                            local eHit = features.prediction:predict(target.index, E_range, E_speed, E_width, 0, g_local.position)
                                            Prints("Getting E hit prediction")
                                            if checkbox_prediction_e:get_value() == true and Enum <= eslider:get_value() then
                                                if features.orbwalker:get_mode() == Combo_key and checkboxe:get_value() == true then
                                                    if (eHit.valid and eHit.hitchance >= acc_e_slider:get_value()) and eHit.position:dist_to(g_local.position) >= e_distance_slider:get_value() then
                                                        Prints("E_Range ==" ..  E_range )
                                                        Prints("Casting E (combo)")
                                                        g_input:cast_spell(e_spell_slot.e, eHit.position)
                                                        features.orbwalker:set_cast_time(0.25)
                                                        Prints("Casted E (combo)")
                                                        EvoCheckE()
                                                        return true
                                                    elseif features.orbwalker:get_mode() == Harass_key and checkbox_harass_e:get_value() == true then
                                                        if (eHit.valid and eHit.hitchance >= acc_e_slider:get_value()) then
                                                            Prints("E_Range ==" ..  E_range )
                                                            Prints("Casting E (harass)")
                                                            g_input:cast_spell(e_spell_slot.e, eHit.position)
                                                            features.orbwalker:set_cast_time(0.25)
                                                            Prints("Casted E (harass)")
                                                            EvoCheckE()
                                                            return true
                                                            end
                                                        end
                                                    end
                                                end
                                            if checkbox_prediction_e:get_value() == false and Enum <= eslider:get_value() then
                                                if features.orbwalker:get_mode() == Combo_key and checkboxe:get_value() == true then
                                                    if target.position:dist_to(g_local.position) <= E_range and target.position:dist_to(g_local.position) >= e_distance_slider:get_value() then
                                                        Prints("E_Range ==" ..  E_range )
                                                        Prints("Casting E No Pred (combo)")
                                                        g_input:cast_spell(e_spell_slot.e, target.position)
                                                        features.orbwalker:set_cast_time(0.25)
                                                        Prints("Casted E (combo)")
                                                        EvoCheckE()
                                                        return true
                                                    end
                                                elseif features.orbwalker:get_mode() == Harass_key and checkbox_harass_e:get_value() == true then
                                                    if target.position:dist_to(g_local.position) <= E_range and target.position:dist_to(g_local.position) >= e_distance_slider:get_value() then
                                                        Prints("E_Range ==" ..  E_range )
                                                        Prints("Casting E No Pred (harass)")
                                                        g_input:cast_spell(e_spell_slot.e, target.position)
                                                        features.orbwalker:set_cast_time(0.25)
                                                        Prints("Casted E (harass)")
                                                        EvoCheckE()
                                                        return true
                                                    end
                                                end
                                            end
                                        end
                            
                            
                            
                                        --Clear 
                                        if features.orbwalker:get_mode() == Clear_key and checkbox_clear_e:get_value() == true then
                                            for i, farm in pairs(FarmInRange) do
                                                local farmObj = features.entity_list:get_by_index(farm.idx)
                                                if farmObj ~= nil and farmObj:is_alive() ==true and farmObj:is_visible() == true and farmObj:is_invalid_object() == false and #FarmInRange > 0 then
                                                    if g_local:get_spell_book():get_spell_slot(e_spell_slot.e):is_ready() == true then
                                                        Prints("Casting E (farm)")
                                                        print(farmObj)
                                                        g_input:cast_spell(e_spell_slot.e , farmObj.position)
                                                        Prints("Casted E (farm) at " ..farmObj.index)
                                                        return true
                                                    end
                                                end
                                            end
                                        end
                            
                                    end,
                            
                                    spell_r = function()
                                        local target = features.target_selector:get_default_target()
                            
                            
                                        Prints("R Start")
                            
                                        if R_cost > g_local.mana then
                                            Prints("Not enough mana for R")
                                            return false
                                        end
                                        if g_local:get_spell_book():get_spell_slot(e_spell_slot.r):is_ready() == false then
                                            Prints("R Not Ready")
                                            return false
                                        end
                            
                            
                                        if target ~= nil and features.orbwalker:is_attackable(target.index, 500, true) then
                                            local Rnum = NumEnemiesInRange(500)
                                            Prints("Enemies around (500 units) = " .. Rnum)
                                                if Rnum >= rslider:get_value() then
                                                    if checkboxr:get_value() == true and features.orbwalker:get_mode() == Combo_key then
                                                        if g_local:get_spell_book():get_spell_slot(e_spell_slot.q):is_ready() == true and target.position:dist_to(g_local.position) <= E_range and g_local:get_spell_book():get_spell_slot(e_spell_slot.e):is_ready() == true then
                                                            Prints("E First, unless manual R")
                                                            return false
                                                        elseif g_local:get_spell_book():get_spell_slot(e_spell_slot.q):is_ready() == false and features.buff_cache:is_immobile(g_local.index) == false then
                                                            if g_local:get_spell_book():get_spell_slot(e_spell_slot.e):is_ready() == false then
                                                                Prints("Buy Time with R")
                                                                g_input:cast_spell(e_spell_slot.r)
                                                                return true
                                                            end
                                                            elseif g_local:get_spell_book():get_spell_slot(e_spell_slot.e):is_ready() == true then
                                                                Prints("E First, unless manual R")
                                                                return false
                                                            end
                                                        end
                                                    end
                                        end
                            
                            
                                            --Gap Close, no E
                                            if features.orbwalker:get_mode() == Combo_key and checkboxr:get_value() == true and checkbox_gap_close_r:get_value() == true and target ~= nil then
                                                if g_local:get_spell_book():get_spell_slot(e_spell_slot.q):is_ready() == true and target.position:dist_to(g_local.position) <= Q_range then
                                                    if target.movement_speed < g_local.movement_speed then
                                                        Prints("Target close, no Auto R")
                                                        return false
                                                    end
                                                elseif g_local:get_spell_book():get_spell_slot(e_spell_slot.q):is_ready() == true and target.position:dist_to(g_local.position) >= Q_range + 50 then
                                                    if target.movement_speed >= g_local.movement_speed then
                                                        Prints("Casting R (combo, gap close)")
                                                        g_input:cast_spell(e_spell_slot.r)
                                                        Prints("Casted R (combo, gap close)")
                                                        return true
                                                    end
                                                end
                                            end
                            
                                    end,
                            
                            
                                    
                                    get_priorities = function()
                                        return {
                                            "spell_e",
                                            "spell_q",
                                            "spell_w",
                                            "spell_r"
                                        }
                                    end
                                }
                            )
                            cheat.register_callback("feature", Cache_Farm)
end
--[[
    Killer Kha`Zix -End
]]--

--[[
    Lockdown Leona -Start
]]--
function LockdownLeona()
                            --[[
                            Leona by V
                                using to learn Hatcher/KyosukeFarts formatting/tables/etc. 
                                might not release. 
                                97% credit to him tbh
                        ]]

                        Script_name = "Lockdown Leona"
                        Combo_key = 1
                        Clear_key = 3
                        Harass_key = 4



                        --menu
                        local test_navigation = menu.get_main_window():push_navigation(Script_name, 10000)
                        local my_nav = menu.get_main_window():find_navigation(Script_name)
                        --spell configs
                        local q_config = g_config:add_bool(true, "Use Q (Combo)")
                        local w_config = g_config:add_bool(true, "Use W (Combo)")
                        local e_config = g_config:add_bool(true, "Use E (Combo)")
                        local r_config = g_config:add_bool(true, "Use R (Combo)")

                        local q_harass_config = g_config:add_bool(true, "Use Q (Harass)")
                        local w_harass_config = g_config:add_bool(true, "Use W (Harass)")

                        local e_acc_config = g_config:add_int(0, "E Accuracy")
                        local r_acc_config = g_config:add_int(0, "R Accuracy")

                        local num_nmeR = g_config:add_int(2, "R If Enemies Hit >=")

                        local debug_config = g_config:add_bool(true, "Debug?")

                        --draw config
                        local w_drawings_config = g_config:add_bool(true, "W Drawings")
                        local e_drawings_config = g_config:add_bool(true, "E Drawings")
                        local r_drawings_config = g_config:add_bool(true, "R Drawings")

                        --sections
                        local spell_sect = my_nav:add_section("Use Spells in Combo")
                        local harass_sect = my_nav:add_section("Use Spells in Harass")
                        local acc_sect = my_nav:add_section("Accuracy Slider")
                        local draw_sect = my_nav:add_section("Drawings")
                        local enemies_sect = my_nav:add_section("Enemies")
                        local debug_sect = my_nav:add_section("Debug?!")

                        --ui 
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

                        local checkbox_debug = debug_sect:checkbox("Print Statements", debug_config)
                        checkbox_debug:set_value(false)


                        local checkbox_w_drawings = draw_sect:checkbox("Draw W Range", w_drawings_config)
                        local checkbox_e_drawings = draw_sect:checkbox("Draw E Range", e_drawings_config)
                        local checkbox_r_drawings = draw_sect:checkbox("Draw R Range", r_drawings_config)
                        checkbox_w_drawings:set_value(false)
                        checkbox_e_drawings:set_value(false)
                        checkbox_r_drawings:set_value(false)

                        --draws
                        -- instead of num can use self[spell].Range[self[spell].Level]
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

                        function Prints(str)
                            local dbg = 1
                            if dbg == 1 and checkbox_debug:get_value() == true then
                                print(str)
                            end
                        end

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
                            print(self[spell].Range)
                            if target.position:dist_to(g_local.position) <= self[spell].Range then
                                return true
                            else
                                return false
                            end
                        end


                        --function not used, clean way of writing pred
                        function mySpells:predPosition(spell,target)
                            local pred = features.prediction:predict(target.index, self[spell].Range, self[spell].Speed, self[spell].Width, self[spell].CastTime, g_local.position)
                            return pred
                        end



                        function NumEnemiesInRangeTarget(range)
                            Prints("Enemies around Target")
                            local target = features.target_selector:get_default_target()
                            local numAround = 0
                            for _,entity in pairs(features.entity_list:get_enemies()) do
                                if  entity ~= nil and not entity:is_invisible() and entity:is_alive() and entity.position:dist_to(target.position) <= range  then
                                    numAround = numAround + 1
                                end
                            end
                            Prints("Enemies around Target end")
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
                            local mode = features.orbwalker:get_mode()
                            local target = features.target_selector:get_default_target()
                            if mode == Combo_key and checkboxe:get_value() == true then
                                if target ~= nil and getDistance(g_local.position, target.position) <= self['e'].Range then
                                    local eHit = features.prediction:predict(target.index, self['e'].Range, self['e'].Speed, self['e'].Width, 0, g_local.position)
                                    if eHit.valid and eHit.hitchance >= acc_e_slider:get_value() then
                                        g_input:cast_spell(e_spell_slot.e, eHit.position)
                                    end
                                end
                            end
                        end



                        function mySpells:rSpell()
                            local mode = features.orbwalker:get_mode()
                            local target = features.target_selector:get_default_target()
                            if mode == Combo_key and checkboxr:get_value() == true then
                                if target ~= nil and getDistance(g_local.position, target.position) <= self['r'].Range then
                                    local RnumTarget = NumEnemiesInRangeTarget(325)
                                    Prints("Enemeies around (R) = " .. RnumTarget)
                                    if RnumTarget >= rslider:get_value() then
                                        if target.position:dist_to(g_local.position) <= self['r'].Range and target ~= g_local then
                                            local rHit = features.prediction:predict(target.index, self['r'].Range, self['r'].Speed, self['r'].Radius, 0, g_local.position)
                                            if rHit.valid and rHit.hitchance >= acc_r_slider:get_value() then
                                                g_input:cast_spell(e_spell_slot.r, rHit.position)
                                            end
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
--[[
    Lockdown Leona -End
]]--

--[[
    Lifeless Lissandra -Start
]]--
function LifelessLissandra()
 --[[

                    +Lifeless Lissandra+
                        By: v
                            Enjoy!

                            Changelog:
                            9/7/22
                            Started Lifeless Lissandra

                            Q/W done; add Q splash logic?
                    

                            ]]--


                            Combo_key = 1
                            Clear_key = 3
                            Harass_key = 4
                            Script_name = "Lifeless Lissandra"
                            target = features.target_selector:get_default_target()
                            Q_cost = g_local:get_spell_book():get_spell_slot(e_spell_slot.q).level * 5 + 50
                            Q_range, Q_speed, Q_width, Q_windup = 710 , 2200, 150 / 2, 0.25
                            W_cost = 40
                            W_width = 900 / 2
                            E_cost = g_local:get_spell_book():get_spell_slot(e_spell_slot.e).level * 5 + 75
                            E_range, E_speed, E_width, E_windup = 1025 , 1000, 250 / 2, 0.25
                            R_cost = 100
                            R_range = 550
                            R_width = 225
                            
                            
                            
                            local test_navigation = menu.get_main_window():push_navigation(Script_name, 10000)
                            
                            local q_config = g_config:add_bool(true, "Use Q (Combo)")
                            local w_config = g_config:add_bool(true, "Use W (Combo)")
                            local e_config = g_config:add_bool(true, "Use E (Combo)")
                            local r_config = g_config:add_bool(true, "Use R (Combo)")
                            
                            local prediction_e_config = g_config:add_bool(true, "Use Prediction For E?")
                            local e_distance_config = g_config:add_int(0, "E Minimum Distance")
                            
                            local debug_config = g_config:add_bool(true, "Debug?")
                            
                            local num_nmeR = g_config:add_int(2, "R If Enemies")
                            local num_nmeW = g_config:add_int(2, "W If Enemies")
                            local num_nmeE = g_config:add_int(2, "E If Enemies <")
                            
                            local q_harass_config = g_config:add_bool(true, "Use Q (Harass)")
                            local w_harass_config = g_config:add_bool(true, "Use W (Harass)")
                            
                            local q_clear_config = g_config:add_bool(true, "Use Q (Clear)")
                            
                            local q_acc_config = g_config:add_int(0, "Q Accuracy")
                            local e_acc_config = g_config:add_int(0, "E Accuracy")
                            
                            local q_drawings_config = g_config:add_bool(true, "Q Drawings")
                            local w_drawings_config = g_config:add_bool(true, "W Drawings")
                            local e_drawings_config = g_config:add_bool(true, "E Drawings")
                            local r_drawings_config = g_config:add_bool(true, "R Drawings")
                            
                            local health_config = g_config:add_int(0, "R Health Threshhold (%)")
                            
                            local r_self_config = g_config:add_bool(true, "Use R (Self)")
                            
                            local my_nav = menu.get_main_window():find_navigation(Script_name)
                            
                            local spell_sect = my_nav:add_section("Use Spells in Combo")
                            local harass_sect = my_nav:add_section("Use Spells in Harass")
                            local clear_sect = my_nav:add_section("Use Spells in Clear")
                            local acc_sect = my_nav:add_section("Accuracy Slider")
                            local health_sect = my_nav:add_section("R Health Threshold")
                            local misc_sect = my_nav:add_section("Misc.")
                            local debug_sect = my_nav:add_section("Debug?!")
                            local draw_sect = my_nav:add_section("Drawings")
                            local enemies_sect = my_nav:add_section("Enemies")
                            
                            
                            
                            local checkboxq = spell_sect:checkbox("Use Q (Combo)", q_config)
                            local checkboxw = spell_sect:checkbox("Use W (Combo)", w_config)
                            local checkboxe = spell_sect:checkbox("Use E (Combo)", e_config)
                            local checkboxr = spell_sect:checkbox("Use R (Combo)", r_config)
                            checkboxq:set_value(true)
                            checkboxw:set_value(true)
                            checkboxe:set_value(true)
                            checkboxr:set_value(true)
                            
                            local checkboxrself = health_sect:checkbox("Use R (Self)", r_self_config)
                            checkboxrself:set_value(true)
                            
                            local checkbox_harass_q = harass_sect:checkbox("Use Q (Harass)", q_harass_config)
                            local checkbox_harass_w = harass_sect:checkbox("Use W (Harass)", w_harass_config)
                            checkbox_harass_q:set_value(true)
                            checkbox_harass_w:set_value(true)
                            
                            
                            local checkbox_clear_q = clear_sect:checkbox("Use Q (Clear)", q_clear_config)
                            checkbox_clear_q:set_value(true)
                            
                            local checkbox_prediction_e = misc_sect:checkbox("Use Prediction For E", prediction_e_config)
                            checkbox_prediction_e:set_value(false)
                            
                            
                            local acc_q_slider = acc_sect:slider_int("Q Accuracy", e_acc_config, 0, 5, 1)
                            local acc_e_slider = acc_sect:slider_int("E Accuracy", e_acc_config, 0, 5, 1)
                            acc_q_slider:set_value(1)
                            acc_e_slider:set_value(1)
                            
                            local rslider = enemies_sect:slider_int("R if Enemies >=", num_nmeR, 1, 5, 1)
                            local eslider = enemies_sect:slider_int("E if Enemies <=", num_nmeE, 1, 5, 1)
                            local wslider = enemies_sect:slider_int("W if Enemies >=", num_nmeW, 1, 5, 1)
                            rslider:set_value(2)
                            eslider:set_value(2)
                            wslider:set_value(1)
                            
                            local r_health_slider = health_sect:slider_int("R Health Threshhold (%)", health_config, 0, 100, 1)
                            r_health_slider:set_value(20)
                            
                            local checkbox_debug = debug_sect:checkbox("Print Statements", debug_config)
                            checkbox_debug:set_value(false)
                            
                            local checkbox_q_drawings = draw_sect:checkbox("Draw Q Range", q_drawings_config)
                            local checkbox_w_drawings = draw_sect:checkbox("Draw W Range", w_drawings_config)
                            local checkbox_e_drawings = draw_sect:checkbox("Draw E Range", e_drawings_config)
                            local checkbox_r_drawings = draw_sect:checkbox("Draw R Range", r_drawings_config)
                            checkbox_q_drawings:set_value(false)
                            checkbox_w_drawings:set_value(false)
                            checkbox_e_drawings:set_value(false)
                            checkbox_r_drawings:set_value(false)
                            
                            
                            
                            
                            
                            
                            function Prints(str)
                                local dbg = 1
                                if dbg == 1 and checkbox_debug:get_value() == true then
                                    print(str)
                                end
                            end
                            
                            
                            cheat.register_callback("render", function()
                                if checkbox_q_drawings:get_value() == true and g_local:get_spell_book():get_spell_slot(e_spell_slot.q):is_ready() then
                                  purple = color:new(201, 7, 245)
                                  g_render:circle_3d(g_local.position, purple, Q_range, 2, 100, 2)
                                end
                            end)
                            --Q splash
                            cheat.register_callback("render", function()
                                if checkbox_q_drawings:get_value() == true and g_local:get_spell_book():get_spell_slot(e_spell_slot.q):is_ready() then
                                  darkpurple = color:new(57, 0, 70)
                                  g_render:circle_3d(g_local.position, purple, 825, 2, 100, 2)
                                end
                            end)
                            cheat.register_callback("render", function()
                                if checkbox_w_drawings:get_value() == true and g_local:get_spell_book():get_spell_slot(e_spell_slot.w):is_ready() then
                                  green = color:new(0, 255, 21)
                                  g_render:circle_3d(g_local.position, green, 900, 2, 100, 2)
                                end
                            end)
                            cheat.register_callback("render", function()
                                if checkbox_e_drawings:get_value() == true and g_local:get_spell_book():get_spell_slot(e_spell_slot.e):is_ready() then
                                  blue = color:new(76, 0, 255)
                                  g_render:circle_3d(g_local.position, blue, E_range, 2, 100, 2)
                                end
                            end)
                            cheat.register_callback("render", function()
                                if checkbox_e_drawings:get_value() == true and g_local:get_spell_book():get_spell_slot(e_spell_slot.e):is_ready() then
                                  blue = color:new(76, 0, 255)
                                  g_render:circle_3d(g_local.position, blue, R_range, 2, 100, 2)
                                end
                            end)
                            
                            FarmInRange = {}
                            function Cache_Farm()
                            Prints("(Start)Cf enter at: " ..  #FarmInRange)
                            local farmTable = features.entity_list:get_all()
                                for i, obj_farm in ipairs(farmTable) do
                                    if obj_farm:get_object_name() ~= nil and obj_farm:is_targetable() == true and obj_farm:is_dead() == false and obj_farm ~= nil
                                    and not obj_farm:is_ally() == true
                                    and (obj_farm.attack_range == 110 or
                                    obj_farm.attack_range == 300 or
                                    obj_farm.attack_range == 550 or
                                    obj_farm.attack_range == 500 or
                                    obj_farm.attack_range == 955 or
                                    obj_farm.attack_range == 250 or
                                    obj_farm.attack_range == 150 or
                                    obj_farm.attack_range == 100 or
                                    obj_farm.attack_range == 200 or
                                    obj_farm.attack_range == 175) then
                                        if obj_farm:dist_to_local() <= 710 and obj_farm:is_alive() == true and obj_farm.health > 1 and not features.buff_cache:get_buff(obj_farm.index, "camprespawncountdownhidden") and not features.buff_cache:get_buff(obj_farm.index, "camprespawncountdownvisible") then
                                            if obj_farm:get_object_name() ~= "SRU_CampRespawnMarker" or obj_farm:get_object_name() ~= "Sru_CrabWard" or obj_farm:get_object_name() ~= "turret" then
                                                local exists = 0
                                                    if #FarmInRange > 0 then
                                                        for ii, alive in pairs(FarmInRange) do
                                                            if alive.idx == obj_farm.index then
                                                                exists = 1
                                                            end
                                                        end
                                                    end
                                                    if exists == 0 then
                                                        Prints("Cf entering at: " ..  #FarmInRange)
                                                        table.insert(FarmInRange, {idx = obj_farm.index})
                                                        Prints("Cf entered at: " ..  #FarmInRange)
                                                    end
                                            end
                                        end
                                    end
                                end
                                for i, farm in pairs(FarmInRange) do
                                local farmObj = features.entity_list:get_by_index(farm.idx)
                                    if farmObj == nil then
                                        table.remove(FarmInRange, i)
                                    elseif not farmObj:is_alive() == true or farmObj.health <= 1 then
                                        table.remove(FarmInRange, i)
                                    elseif farmObj:dist_to_local() > 710 then
                                        table.remove(FarmInRange, i)
                                    elseif farmObj:is_invalid_object() == true then
                                        table.remove(FarmInRange, i)
                                    elseif farmObj:is_visible() == false then
                                        table.remove(FarmInRange, i)
                                    end
                                end
                            
                            end
                            
                            
                            function NumEnemiesInRange(range)
                                Prints("Enemies around")
                                local numAround = 0
                                for _,entity in pairs(features.entity_list:get_enemies()) do
                                    if  entity ~= nil and not entity:is_invisible() and entity:is_alive() and entity.position:dist_to(g_local.position) <= range  then
                                        numAround = numAround + 1
                                    end
                                end
                                Prints("Enemies around end")
                                return numAround
                            end
                            
                            
                            function NumEnemiesInRangeTarget(range)
                                Prints("Enemies around Target")
                                local target = features.target_selector:get_default_target()
                                local numAround = 0
                                for _,entity in pairs(features.entity_list:get_enemies()) do
                                    if  entity ~= nil and not entity:is_invisible() and entity:is_alive() and entity.position:dist_to(target.position) <= range  then
                                        numAround = numAround + 1
                                    end
                                end
                                Prints("Enemies around Target end")
                                return numAround
                            end
                            
                            
                            cheat.register_module(
                                {
                                    champion_name = "Lissandra",
                            
                                    spell_q = function()
                                        
                                        local target = features.target_selector:get_default_target()
                            
                                        Prints("Q Start")
                            
                            
                                        if Q_cost > g_local.mana then
                                            Prints("Not enough mana for Q")
                                            return false
                                        end
                                        if g_local:get_spell_book():get_spell_slot(e_spell_slot.q):is_ready() == false then
                                            Prints("Q Not Ready")
                                            return false
                                        end
                            
                                        if target ~= nil and features.orbwalker:is_attackable(target.index, Q_range, true) then
                                            local qHit = features.prediction:predict(target.index, Q_range, Q_speed, Q_width, Q_windup, g_local.position)
                                            local badMinion = features.prediction:minion_in_line(g_local.position, qHit.position, Q_width, -1)
                                            Prints("Getting Q hit prediction")
                                            if features.orbwalker:get_mode() == Combo_key and checkboxq:get_value() == true then
                                                if (qHit.valid and qHit.hitchance >= acc_q_slider:get_value()) and badMinion == false then
                                                    Prints("Casting Q (combo)")
                                                    g_input:cast_spell(e_spell_slot.q, qHit.position)
                                                    features.orbwalker:set_cast_time(0.25)
                                                    Prints("Casted Q (combo)")
                                                    return true
                                                end
                                            elseif features.orbwalker:get_mode() == Harass_key and checkbox_harass_q:get_value() == true then
                                                if (qHit.valid and qHit.hitchance >= acc_q_slider:get_value()) then
                                                    Prints("Casting Q (harass)")
                                                    g_input:cast_spell(e_spell_slot.q, qHit.position)
                                                    features.orbwalker:set_cast_time(0.25)
                                                    Prints("Casted Q (harass)")
                                                    return true
                                                end
                                            end
                                        end
                                        --Clear
                                        if features.orbwalker:get_mode() == Clear_key and checkbox_clear_q:get_value() == true then
                                            for i, farm in pairs(FarmInRange) do
                                                local farmObj = features.entity_list:get_by_index(farm.idx)
                                                if farmObj ~= nil and farmObj:is_alive() ==true and farmObj:is_visible() == true and farmObj:is_invalid_object() == false and #FarmInRange > 0 then
                                                    if g_local:get_spell_book():get_spell_slot(e_spell_slot.q):is_ready() == true and features.orbwalker:is_in_attack() == false then
                                                        Prints("Casting Q (farm)")
                                                        print(farmObj.index)
                                                        g_input:cast_spell(e_spell_slot.q , farmObj.position)
                                                        Prints("Casted Q (farm) at " ..farmObj.index)
                                                        return true
                                                    end
                                                end
                                            end
                                        end
                            
                                    end,
                            
                            
                            
                                    spell_w = function()
                            
                                        local target = features.target_selector:get_default_target()
                            
                                        Prints("W Start")
                            
                                        if W_cost > g_local.mana then
                                            Prints("Not enough mana for W")
                                            return false
                                        end
                                        if g_local:get_spell_book():get_spell_slot(e_spell_slot.w):is_ready() == false then
                                            Prints("W Not Ready")
                                            return false
                                        end
                                        
                                        if target ~= nil and target.position:dist_to(g_local.position) <= W_width then
                                            local Wnum = NumEnemiesInRange(450)
                                            if Wnum >= wslider:get_value() then
                                                if checkboxw:get_value() == true and features.orbwalker:get_mode() == Combo_key then
                                                    g_input:cast_spell(e_spell_slot.w)
                                                    return true
                                                end
                                            end
                                        end
                                    end,
                            
                                    spell_e = function()
                                        local target = features.target_selector:get_default_target()
                                        
                            --LissandraE buff name for recast
                            
                                        Prints("E Start")

                                        if E_cost > g_local.mana then
                                            Prints("Not enough mana for E")
                                            return false
                                        end
                                        if g_local:get_spell_book():get_spell_slot(e_spell_slot.e):is_ready() == false then
                                            Prints("E Not Ready")
                                            return false
                                        end
                            
                                        for i, buff in pairs(features.buff_cache:get_all_buffs(g_local.index)) do
                                            if buff.name == "LissandraE" then
                                                Prints("E already cast")
                                                return false
                                            end
                                        end
                            
                                        if target ~= nil and features.orbwalker:is_attackable(target.index, E_range, true) then
                                            local Enum = NumEnemiesInRange(E_range)
                                            Prints("Enemeies around (E) = " .. Enum)
                                            local eHit = features.prediction:predict(target.index, E_range, E_speed, E_width, 0, g_local.position)
                                            Prints("Getting E hit prediction")
                                            if checkbox_prediction_e:get_value() == true and Enum <= eslider:get_value() then
                                                if features.orbwalker:get_mode() == Combo_key and checkboxe:get_value() == true then
                                                    if (eHit.valid and eHit.hitchance >= acc_e_slider:get_value()) then
                                                        Prints("Casting E (combo)")
                                                        g_input:cast_spell(e_spell_slot.e, eHit.position)
                                                        features.orbwalker:set_cast_time(0.25)
                                                        Prints("Casted E (combo)")
                                                        return true
                                                    end
                                                end
                                            end
                                            if checkbox_prediction_e:get_value() == false and Enum <= eslider:get_value() then
                                                if features.orbwalker:get_mode() == Combo_key and checkboxe:get_value() == true then
                                                    if target.position:dist_to(g_local.position) <= E_range then
                                                        Prints("E_Range ==" ..  E_range )
                                                        Prints("Casting E No Pred (combo)")
                                                        g_input:cast_spell(e_spell_slot.e, target.position)
                                                        features.orbwalker:set_cast_time(0.25)
                                                        Prints("Casted E (combo)")
                                                        return true
                                                    end
                                                end
                                            end
                                        end
                            
                                    end,
                            
                                    spell_r = function()
                                        local target = features.target_selector:get_default_target()
                            
                            
                                        Prints("R Start")
                            
                                        if R_cost > g_local.mana then
                                            Prints("Not enough mana for R")
                                            return false
                                        end
                                        if g_local:get_spell_book():get_spell_slot(e_spell_slot.r):is_ready() == false then
                                            Prints("R Not Ready")
                                            return false
                                        end
                            
                            
                                         --self (save yourself)
                                        if checkboxr:get_value() == true and features.orbwalker:get_mode() == Combo_key or features.orbwalker:get_mode() == Harass_key or features.orbwalker:get_mode() == Clear_key or features.orbwalker:get_mode() == 0  then
                                                    if checkboxrself:get_value() == true and (g_local.health / g_local.max_health) * 100 <= r_health_slider:get_value() and g_local.health ~= 0 then
                                                            Prints("R on self")
                                                            g_input:cast_spell(e_spell_slot.r, g_local.position)
                                                            Prints("Casted R on self")
                                                            return true
                                                    end
                                        end
                            
                                        --self (dmg enemies)
                                        if target ~= nil and features.orbwalker:is_attackable(target.index, R_range, true) then
                                            local Rnum = NumEnemiesInRange(400)
                                            Prints("Enemeies around (R) = " .. Rnum)
                                            if Rnum >= rslider:get_value() then
                                                if features.orbwalker:get_mode() == Combo_key and checkboxr:get_value() == true and checkboxrself:get_value() == true then
                                                    if target.position:dist_to(g_local.position) <= R_range then
                                                        Prints("Casting R ( dmg combo self)")
                                                        g_input:cast_spell(e_spell_slot.r, g_local.position)
                                                        Prints("Casting R ( dmg combo self)")
                                                        return true
                                                    end
                                                end
                                            end
                                        end
                            
                                        --target (Casting R ( dmg combo)
                                        if target ~= nil and features.orbwalker:is_attackable(target.index, R_range, true) then
                                            local RnumTarget = NumEnemiesInRangeTarget(R_range)
                                            Prints("Enemeies around (R) = " .. RnumTarget)
                                            if RnumTarget >= rslider:get_value() then
                                                if features.orbwalker:get_mode() == Combo_key and checkboxr:get_value() == true then
                                                    if target.position:dist_to(g_local.position) <= R_range and target ~= g_local then
                                                        Prints("Casting R ( dmg combo target)")
                                                        g_input:cast_spell(e_spell_slot.r, target)
                                                        Prints("Casting R ( dmg combo target)")
                                                        return true
                                                    end
                                                end
                                            end
                                        end
                            
                                    end,
                            
                            
                                    
                                    get_priorities = function()
                                        return {
                                            "spell_q",
                                            "spell_e",
                                            "spell_w",
                                            "spell_r"
                                        }
                                    end
                                }
                            )
                            cheat.register_callback("feature", Cache_Farm)

end
--[[
        Lifeless Lissandra -End
]]--

--[[
        +Loaded Lulu+ -Start
]]--
function LoadedLulu()
                                                    --[[

                                Loaded Lulu
                                    By: v
                                        Enjoy!

                                        Changelog:
                                        7/14/22
                                        9/10/22 rewriting lulu logic

                            ]] --

                            Combo_key = 1
                            Clear_key = 3
                            Harass_key = 4
                            Flee_key = 5
                            Script_name = "Loaded Lulu"

                            --menu
                            local test_navigation = menu.get_main_window():push_navigation(Script_name, 10000)
                            local my_nav = menu.get_main_window():find_navigation(Script_name)


                            --spell configs
                            local q_config = g_config:add_bool(true, "Use Q (Combo)")
                            local w_config = g_config:add_bool(true, "Use W (Combo)")
                            local e_config = g_config:add_bool(true, "Use E (Combo)")
                            local r_config = g_config:add_bool(true, "Use R (Combo)")

                            local q_harass_config = g_config:add_bool(true, "Use Q (Harass)")
                            local w_harass_config = g_config:add_bool(true, "Use W (Harass)")
                            local e_harass_config = g_config:add_bool(true, "Use E (Harass)")

                            local w_pref_enemy_config = g_config:add_bool(true, "W Pref Enemy")
                            local w_pref_ally_config = g_config:add_bool(true, "W Pref Ally")
                            local w_pref_self_config = g_config:add_bool(true, "W Pref Self")
                            local e_pref_enemy_config = g_config:add_bool(true, "E Pref Enemy")
                            local e_pref_ally_config = g_config:add_bool(true, "E Pref Ally")
                            local e_pref_self_config = g_config:add_bool(true, "E Pref Self")


                            local health_config = g_config:add_int(0, "R Health Threshhold (%)")

                            local q_acc_config = g_config:add_int(0, "Q Accuracy")

                            local num_nmeR = g_config:add_int(2, "R If Enemies Hit >=")

                            local debug_config = g_config:add_bool(true, "Debug?")

                            --draw config
                            local pix_drawings_config = g_config:add_bool(true, "Pix (Q) Drawings")
                            local q_drawings_config = g_config:add_bool(true, "Q Drawings")
                            local w_drawings_config = g_config:add_bool(true, "W Drawings")
                            local e_drawings_config = g_config:add_bool(true, "E Drawings")
                            local r_drawings_config = g_config:add_bool(true, "R Drawings")

                            --sections
                            local spell_sect = my_nav:add_section("Use Spells in Combo")
                            local harass_sect = my_nav:add_section("Use Spells in Harass")
                            local acc_sect = my_nav:add_section("Accuracy Slider")

                            local draw_sect = my_nav:add_section("Drawings")
                            local enemies_sect = my_nav:add_section("Enemies")
                            local debug_sect = my_nav:add_section("Debug?!")

                            local pref_sect = my_nav:add_section("Spell Pref.")

                            --ui
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
                            local checkbox_harass_e = harass_sect:checkbox("Use E (Harass)", e_harass_config)
                            checkbox_harass_q:set_value(true)
                            checkbox_harass_w:set_value(true)
                            checkbox_harass_e:set_value(true)

                            local acc_q_slider = acc_sect:slider_int("Q Accuracy", q_acc_config, 0, 5, 1)
                            acc_q_slider:set_value(2)

                            local rslider = enemies_sect:slider_int("R If Enemies Hit >=", num_nmeR, 1, 5, 1)
                            rslider:set_value(1)

                            local checkbox_debug = debug_sect:checkbox("Print Statements", debug_config)
                            checkbox_debug:set_value(false)

                            local checkbox_pix_drawings = draw_sect:checkbox("Draw Pix (Q) Range", pix_drawings_config)
                            local checkbox_q_drawings = draw_sect:checkbox("Draw Q Range", q_drawings_config)
                            local checkbox_w_drawings = draw_sect:checkbox("Draw W Range", w_drawings_config)
                            local checkbox_e_drawings = draw_sect:checkbox("Draw E Range", e_drawings_config)
                            checkbox_pix_drawings:set_value(false)
                            checkbox_q_drawings:set_value(false)
                            checkbox_w_drawings:set_value(false)
                            checkbox_e_drawings:set_value(false)


                            local w_pref_enemy = pref_sect:checkbox("Pref W Enemy", w_pref_enemy_config)
                            local w_pref_ally = pref_sect:checkbox("Pref W Ally", w_pref_ally_config)
                            local w_pref_self = pref_sect:checkbox("Pref W Self", w_pref_self_config)
                            local e_pref_enemy = pref_sect:checkbox("Pref E Enemy", e_pref_enemy_config)
                            local e_pref_ally = pref_sect:checkbox("Pref E Ally", e_pref_ally_config)
                            local e_pref_self = pref_sect:checkbox("Pref E Self", e_pref_self_config)
                            w_pref_enemy:set_value(false)
                            w_pref_ally:set_value(true)
                            w_pref_self:set_value(false)
                            e_pref_enemy:set_value(false)
                            e_pref_ally:set_value(true)
                            e_pref_self:set_value(false)

                            local r_health_slider = pref_sect:slider_int("R Health Threshhold (%)", health_config, 0, 100, 1)
                            r_health_slider:set_value(35)


                            --Nenny Range DB for prio
                            RangeDB = {
                                aatrox = {Range = 625, Prio = 3}, --adc 5, mid 4,  fighter 3, support 2, tnak 1
                                ahri = {Range = 880, Prio = 4},
                                akali = {Range = 825, Prio = 4},
                                alistar = {Range = 700, Prio = 1},
                                amumu = {Range = 1100, Prio = 1},
                                anivia = {Range = 1075, Prio = 4},
                                annie = {Range = 625, Prio = 4},
                                aphelios = {Range =650, Prio = 5},
                                ashe = {Range = 1200, Prio = 5},
                                aurelionsol = {Range = 1500, Prio = 4},
                                azir = {Range = 740, Prio = 4},
                                bard = {Range = 950, Prio = 2},
                                blitzcrank = {Range = 1150, Prio = 2},
                                brand = {Range = 1050, Prio = 3},
                                braum = {Range = 1000, Prio = 1},
                                caitlyn = {Range = 1250, Prio = 5},
                                camille = {Range = 650, Prio = 3},
                                cassiopeia = {Range = 850, Prio = 4},
                                chogath = {Range = 950, Prio = 3},
                                corki = {Range = 1500, Prio = 5},
                                darius ={Range = 535, Prio = 1},
                                diana = {Range = 900, Prio = 4},
                                draven = {Range = 1050, Prio = 5},
                                drmundo = {Range = 975, Prio = 1},
                                ekko = {Range = 1175, Prio = 4},
                                elise = {Range = 850, Prio = 3},
                                evelynn = {Range = 800, Prio = 3},
                                ezreal = {Range = 1150, Prio = 5},
                                fiddlesticks = {Range = 850, Prio = 3},
                                fiora = {Range = 750, Prio = 3},
                                fizz = {Range = 1300, Prio = 4},
                                galio = {Range = 825, Prio = 3},
                                gangplank = {Range = 625, Prio = 3}, -- UPDATE FOR E enventually
                                garen = {Range = 400, Prio = 1},
                                gnar = {Range = 1125, Prio = 3},
                                gragas = {Range = 850, Prio = 2},
                                graves = {Range = 800, Prio = 3},
                                hecarim = {Range = 350, Prio = 3},
                                heimerdinger = {Range = 1325, Prio = 4},
                                illaoi = {Range = 850, Prio = 3},
                                irelia = {Range = 950, Prio = 3},
                                ivern = {Range = 1075, Prio = 1},
                                janna = {Range = 1750, Prio = 2},
                                jarvaniv = {Range = 860, Prio = 2},
                                jax = {Range = 700, Prio = 3},
                                jayce = {Range = 1600, Prio = 3},
                                jhin = {Range = 1750, Prio = 5}, -- TEST A LOT
                                jinx = {Range = 1450, Prio = 5},
                                kaisa = {Range = 1750, Prio = 5}, -- TEST A LOT
                                kalista = {Range = 1150, Prio = 5},
                                karma = {Range = 950, Prio = 2},
                                kharthus = {Range = 875, Prio = 4},
                                kassadin = {Range = 600, Prio = 4},
                                katarina = {Range = 725, Prio = 4},
                                kayle = {Range = 900, Prio = 4},
                                kayn = {Range = 700, Prio = 3},
                                kennen = {Range = 1050, Prio = 3},
                                khazix = {Range = 1000, Prio = 3 },
                                kindred = {Range = 560, Prio = 4}, --TEST A LOT
                                kled = {Range = 800, Prio = 2},
                                kogmaw = {Range = 1800, Prio = 5},
                                leblanc ={Range = 925, Prio = 4},
                                leesin = {Range = 1100, Prio = 3},
                                leona = {Range = 875, Prio = 1},
                                lilia = {Range = 500, Prio = 3}, --test a lot
                                lissandra = {Range = 1025, Prio = 4},
                                lucian = {Range = 900, Prio = 5},
                                lulu = {Range = 925, Prio = 2},
                                lux = {Range = 1175, Prio = 4},
                                malphite = {Range = 1000, Prio = 1},
                                malzahar = {Range = 900, Prio = 4},
                                maokai = {Range = 600, Prio = 1},
                                masteryi = {Range = 600, Prio = 3},
                                missfortune = {Range = 1000, Prio = 5},
                                mordekaiser = {Range = 900, Prio = 3},
                                morgana = {Range = 1250, Prio = 2},
                                nami = {Range = 875, Prio = 2},
                                nasus = {Range = 700, Prio = 2},
                                nautilus = {Range = 925, Prio = 1},
                                neeko = {Range = 1000, Prio = 4},
                                nidalee = {Range = 1500, Prio = 3},
                                nocturne = {Range = 1200, Prio = 3},
                                nunu = {Range =  625, Prio = 2}, --CHECK NAME IN GAME
                                olaf = {Range = 1000, Prio = 3},
                                orianna = {Range = 825, Prio = 4},
                                ornn = {Range = 800, Prio = 1},
                                pantheon = {Range = 1200, Prio = 3},
                                poppy = {Range = 430, Prio = 2},
                                pyke = {Range = 1100, Prio = 3},
                                qiyana = {Range = 925, Prio = 4},
                                quinn = {Range = 1025, Prio = 3},
                                rakan = {Range = 850, Prio = 2},
                                reksai = {Range = 1625, Prio = 3},
                                rell = {Range = 700, Prio = 1},
                                rengar = {Range = 1000, Prio = 4},
                                riven = {Range = 900, Prio = 3},
                                rumble = {Range = 825, Prio = 4},
                                ryze = {Range = 1000, Prio = 4},
                                samira = {Range = 950, Prio = 5},
                                sejuani = {Range = 650, Prio = 1},
                                senna = {Range = 975, Prio = 5 }, -- TEST A LOT
                                seraphine = {Range = 900, Prio = 4},
                                sett = {Range = 790, Prio = 3},
                                shaco = {Range = 625, Prio = 2},
                                shen = {Range = 600, Prio = 1},
                                shyvana = {Range = 925, Prio = 3},
                                singed = {Range = 1000, Prio = 1},
                                sion = {Range = 750, Prio = 1},
                                sivir = {Range = 1250, Prio = 5},
                                skarner = {Range = 1000, Prio = 3},
                                sona = {Range = 825, Prio = 2},
                                soraka = {Range = 810, Prio = 4},
                                swain = {Range = 850, Prio = 3},
                                sylas = {Range = 850, Prio = 4},
                                syndra = {Range = 800, Prio = 4},
                                tahmkench = {Range = 900, Prio = 1},
                                taliyah = {Range = 1000, Prio = 4},
                                talon = {Range = 650, Prio = 4},
                                taric = {Range = 610, Prio = 1},
                                teemo = {Range = 680, Prio = 4},
                                thresh = {Range = 1100, Prio = 2},
                                tristana = {Range = 900, Prio = 5},
                                trundle = {Range =  650, Prio = 2},
                                tryndamere = {Range = 660, Prio = 3},
                                twistedfate = {Range = 1450, Prio = 4},
                                twitch = {Range = 950, Prio = 5},
                                udyr = {Range =  800, Prio = 3}, --test
                                urgot = {Range = 800, Prio = 2}, 
                                varus = {Range = 1525, Prio = 5},
                                vayne = {Range = 550, Prio = 5},
                                veigar = {Range = 900, Prio = 4},
                                velkoz = {Range = 1550, Prio = 4}, -- 1100 is q IF ult is too hight
                                vi = {Range = 725, Prio = 3}, 
                                viktor = {Range = 1150, Prio = 4}, --- IMPORTANT TO TEST ASAP NEED HELP
                                vladimir = {Range = 600, Prio = 3},
                                volibear = {Range = 1200, Prio = 3},
                                warwick = {Range = 350, Prio = 3},
                                monkeyking = {Range =  650, Prio = 3},
                                xayah = {Range = 1100, Prio = 5},
                                xerath = {Range = 1400, Prio = 4}, 
                                xinzhao = {Range = 900, Prio = 3},
                                yasuo = {Range = 1000, Prio = 4},
                                yone = {Range = 1000, Prio = 4}, --- might need tweaking
                                yorick = {Range = 700, Prio = 1},
                                yuumi = {Range = 1100, Prio = 1}, --test as target
                                zac = {Range = 800, Prio = 1},
                                zed = {Range = 900, Prio = 4}, --- WILL NEED WORK 
                                ziggs =  {Range = 850, Prio = 4},
                                zilean = {Range = 900, Prio = 2},
                                zoe = {Range = 1600, Prio = 4},
                                zyra = {Range = 1100, Prio = 2},
                                zeri =  {Range = 1500, Prio = 5}
                            }


                            -- Debug function thanks to pingpongpow
                            function Prints(str)
                                local dbg = 1
                                if dbg == 1 and checkbox_debug:get_value() == true then
                                    print(str)
                                end
                            end




                            --[[
                                TS <3 Nenny start
                                adding/editing for ally prio
                            ]]--

                            local TSsection = my_nav:add_section("Enemy Priorities")
                            local allyTSsection = my_nav:add_section("Ally Priorities")

                            local champLowercase = nil

                            local function get_prio(name)
                                local lowerName =  string.lower(name)
                                if RangeDB[lowerName] ~= nil then return RangeDB[lowerName].Prio else return 1 end
                            end

                            --Enemy prio
                            local enemyChampName = {}

                            for i, enemy in pairs(features.entity_list:get_enemies()) do

                                enemyChampName[i] = enemy.champion_name.text

                            end
                            if enemyChampName [1] ~= nil then 
                                Champ1Conf = g_config:add_int(get_prio(enemyChampName[1]),enemyChampName[1])
                                Champ1 = TSsection:slider_int(enemyChampName[1] , Champ1Conf,         1,        5,     1)

                            end
                            if enemyChampName [2] ~= nil then 
                                Champ2Conf = g_config:add_int(get_prio(enemyChampName[2]),enemyChampName[2])
                                Champ2 = TSsection:slider_int(enemyChampName[2] , Champ2Conf,         1,        5,     1)
                            end
                            if enemyChampName [3] ~= nil then 
                                Champ3Conf = g_config:add_int(get_prio(enemyChampName[3]),enemyChampName[3])
                                Champ3 = TSsection:slider_int(enemyChampName[3] , Champ3Conf,         1,        5,     1)
                            end
                            if enemyChampName [4] ~= nil then 
                                Champ4Conf = g_config:add_int(get_prio(enemyChampName[4]),enemyChampName[4])
                                Champ4 = TSsection:slider_int(enemyChampName[4], Champ4Conf,         1,        5,     1)
                            end
                            if enemyChampName [5] ~= nil then 
                                Champ5Conf = g_config:add_int(get_prio(enemyChampName[5]),enemyChampName[5])
                                Champ5 = TSsection:slider_int(enemyChampName[5] , Champ5Conf,         1,        5,     1)
                            end

                            enemy_priority = {}
                            local function update_priority_enemy()

                                if enemyChampName[1] ~= nil then enemy_priority[1] = Champ1:get_value()  end
                                if enemyChampName[2] ~= nil then enemy_priority[2] = Champ2:get_value()  end
                                if enemyChampName[3] ~= nil then enemy_priority[3] = Champ3:get_value()  end
                                if enemyChampName[4] ~= nil then enemy_priority[4] = Champ4:get_value()  end
                                if enemyChampName[5] ~= nil then enemy_priority[5] = Champ5:get_value()  end
                            end




                            --Ally Prio
                            local allyChampName = {}

                            for i, ally in pairs(features.entity_list:get_allies()) do
                                if ally:is_hero() then
                                    allyChampName[i] = ally.champion_name.text
                                end
                            end
                            if allyChampName [1] ~= nil then 
                                allyChamp1Conf = g_config:add_int(get_prio(allyChampName[1]),allyChampName[1])
                                allyChamp1 = allyTSsection:slider_int(allyChampName[1] , allyChamp1Conf,         1,        5,     1)

                            end
                            if allyChampName [2] ~= nil then 
                                allyChamp2Conf = g_config:add_int(get_prio(allyChampName[2]),allyChampName[2])
                                allyChamp2 = allyTSsection:slider_int(allyChampName[2] , allyChamp2Conf,         1,        5,     1)
                            end
                            if allyChampName [3] ~= nil then 
                                allyChamp3Conf = g_config:add_int(get_prio(allyChampName[3]),allyChampName[3])
                                allyChamp3 = allyTSsection:slider_int(allyChampName[3] , allyChamp3Conf,         1,        5,     1)
                            end
                            if allyChampName [4] ~= nil then 
                                allyChamp4Conf = g_config:add_int(get_prio(allyChampName[4]),allyChampName[4])
                                allyChamp4 = allyTSsection:slider_int(allyChampName[4], allyChamp4Conf,         1,        5,     1)
                            end
                            if allyChampName [5] ~= nil then 
                                allyChamp5Conf = g_config:add_int(get_prio(allyChampName[5]),allyChampName[5])
                                allyChamp5 = allyTSsection:slider_int(allyChampName[5] , allyChamp5Conf,         1,        5,     1)
                            end

                            ally_priority = {}

                            local function update_priority_ally()

                                if allyChampName[1] ~= nil then ally_priority[1] = allyChamp1:get_value()  end
                                if allyChampName[2] ~= nil then ally_priority[2] = allyChamp2:get_value()  end
                                if allyChampName[3] ~= nil then ally_priority[3] = allyChamp3:get_value()  end
                                if allyChampName[4] ~= nil then ally_priority[4] = allyChamp4:get_value()  end
                                if allyChampName[5] ~= nil then ally_priority[5] = allyChamp5:get_value()  end
                            end


                            --[[
                                TS <3 Nenny end
                            ]]--


                            function get_target()
                                update_priority_enemy()
                                EnemyTarget = nil
                                local prio = 0

                                for i, enemy in ipairs(features.entity_list:get_enemies()) do
                                    if not features.target_selector:is_bad_target(enemy.index) then
                                        if g_local.position:dist_to(enemy.position) < 2000 then
                                            if enemy_priority[i] ~= 0 then 
                                                if enemy_priority[i] > prio then
                                                prio = enemy_priority[i] 
                                                EnemyTarget = enemy
                                                end
                                            end
                                        end
                                    end
                                end
                                return EnemyTarget
                                
                            end

                            function get_target_ally()
                                update_priority_ally()
                                AllyTarget = nil
                                local prio = 0

                                for i, ally in ipairs(features.entity_list:get_allies()) do
                                    if ally:is_alive() and ally.health > 1 and ally:is_hero() and not ally:is_invalid_object() then
                                        if g_local.position:dist_to(ally.position) < 2000 then
                                            if ally_priority[i] ~= 0 then 
                                                if ally_priority[i] > prio then
                                                prio = ally_priority[i] 
                                                AllyTarget = ally
                                                end
                                            end
                                        end
                                    end
                                end
                                return AllyTarget
                                
                            end



                            function NumEnemiesInRange(range)
                                Prints("Enemies around")
                                local numAround = 0
                                for _,entity in pairs(features.entity_list:get_enemies()) do
                                    if  entity ~= nil and not entity:is_invisible() and entity:is_alive() and entity.position:dist_to(g_local.position) <= range  then
                                        numAround = numAround + 1
                                    end
                                end
                                Prints("Enemies around end")
                                return numAround
                            end
                            function NumEnemiesInRangeTarget(range)
                                Prints("Enemies around Target")
                                update_priority_ally()
                                get_target_ally()
                                local target = AllyTarget
                                local numAround = 0
                                for _,entity in pairs(features.entity_list:get_enemies()) do
                                    if  entity ~= nil and not entity:is_invisible() and entity:is_alive() and entity.position:dist_to(target.position) <= range  then
                                        numAround = numAround + 1
                                    end
                                end
                                Prints("Enemies around Target end")
                                return numAround
                            end



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
                                    manaCost = {50 , 55 , 60 , 65 , 70},
                                    spell = g_local:get_spell_book():get_spell_slot(e_spell_slot.q),
                                    spellSlot = e_spell_slot.q,
                                    Range = 950,
                                    Width = 120,
                                    Speed = 1450,
                                    Level = 0,
                                    Base = {70, 105, 140, 175, 210},
                                    CastTime = 0.25,
                                    coolDown = {7 , 7 , 7 , 7 , 7},
                                },
                                
                                w = {
                                    lastCast = 0,
                                    manaCost = {65, 65, 65, 65, 65},
                                    spell = g_local:get_spell_book():get_spell_slot(e_spell_slot.w),
                                    spellSlot = e_spell_slot.w,
                                    Range = 650,
                                    Speed = 2250,
                                    Level = 0,
                                    CastTimeEnemy = 0.2419,
                                    CastTimeAlly = 0,
                                    coolDown = {17, 16, 15, 14, 13}
                                },
                                e = {
                                    lastCast = 0,
                                    manaCost = {60, 65, 70, 75, 80},
                                    spell = g_local:get_spell_book():get_spell_slot(e_spell_slot.e),
                                    spellSlot = e_spell_slot.e,
                                    Range = 650,
                                    Level = 0,
                                    CastTime = 0,
                                    coolDown = {8, 8, 8, 8, 8}
                            },
                                r = {
                                    lastCast = 0,
                                    manaCost = {100, 100, 100},
                                    spell = g_local:get_spell_book():get_spell_slot(e_spell_slot.r),
                                    spellSlot = e_spell_slot.r,
                                    Range =  900,
                                    Radius = 400,
                                    Level = 0,
                                    CastTime = 0,
                                    coolDown = {120, 100, 80}, 
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
                                print(self[spell].Range)
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







                            function mySpells:wSpellEnemy()
                                local mode = features.orbwalker:get_mode()
                                if (mode == Combo_key and checkboxw:get_value() == true) or (mode == Harass_key and checkbox_harass_w:get_value() == true) then
                                    if features.orbwalker:is_in_attack() == false then
                                        if self:canCast('w') then
                                            if w_pref_enemy:get_value() == true then
                                                update_priority_enemy()
                                                get_target()
                                                local target = EnemyTarget
                                                print("enemy target == " .. target.champion_name.text)
                                                if target ~= nil and getDistance(g_local.position, target.position) <= self['w'].Range then
                                                    g_input:cast_spell(e_spell_slot.w, EnemyTarget)
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                            function mySpells:wSpellAlly()
                                local mode = features.orbwalker:get_mode()
                                if (mode == Combo_key and checkboxw:get_value() == true) or (mode == Harass_key and checkbox_harass_w:get_value() == true) then
                                    if self:canCast('w') then
                                        if w_pref_ally:get_value() == true then
                                            update_priority_ally()
                                            get_target_ally()
                                            local target = AllyTarget
                                            print("Ally target == " .. target.champion_name.text)
                                            if target ~= nil and target:is_ally() and not target == g_local and getDistance(g_local.position, target.position) <= self['w'].Range then
                                                local Wnum = NumEnemiesInRange(650)
                                                if Wnum >= 1 then
                                                    g_input:cast_spell(e_spell_slot.w, AllyTarget)
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                            function mySpells:wSpellSelf()
                                local mode = features.orbwalker:get_mode()
                                if (mode == Combo_key and checkboxw:get_value() == true) or (mode == Harass_key and checkbox_harass_w:get_value() == true) then
                                    if self:canCast('w') then
                                        if w_pref_self:get_value() == true then
                                            local target = g_local
                                            print("g_local target == " .. target.champion_name.text)
                                            if target ~= nil and target:is_ally() and getDistance(g_local.position, target.position) <= self['w'].Range then
                                                local Wnum = NumEnemiesInRange(900)
                                                if Wnum >= 1 then
                                                    g_input:cast_spell(e_spell_slot.w, g_local)
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                            --[[function mySpells:wSpellCancel()
                                if (mode == Combo_key and checkboxw:get_value() == true) or (mode == Harass_key and checkbox_harass_w:get_value() == true) then
                                    if self:canCast('w') then
                                        for i, enemy in pairs(features.entity_list:get_enemies()) do
                                            if getDistance(enemy.position, target.position) <= self['w'].Range then


                            end--]]









                            function mySpells:eSpellEnemy()
                                local mode = features.orbwalker:get_mode()
                                if (mode == Combo_key and checkboxe:get_value() == true) or (mode == Harass_key and checkbox_harass_e:get_value() == true) then
                                    if self:canCast('e') then
                                        if e_pref_enemy:get_value() == true then
                                            update_priority_enemy()
                                            get_target()
                                            local target = EnemyTarget
                                            print("enemy target == " .. target.champion_name.text)
                                            if target ~= nil and getDistance(g_local.position, target.position) <= self['e'].Range then
                                                g_input:cast_spell(e_spell_slot.e, EnemyTarget)
                                            end
                                        end
                                    end
                                end

                            end
                            function mySpells:eSpellAlly()
                                local mode = features.orbwalker:get_mode()
                                if (mode == Combo_key and checkboxe:get_value() == true) or (mode == Harass_key and checkbox_harass_e:get_value() == true) then
                                    if self:canCast('e') then
                                        if e_pref_ally:get_value() == true then
                                            update_priority_ally()
                                            get_target_ally()
                                            local target = AllyTarget
                                            print("ally target == " .. target.champion_name.text)
                                            for i, enemy in pairs(features.entity_list:get_enemies()) do
                                                if getDistance(enemy.position, target.position) <= 2000 then
                                                    if enemy:get_spell_book():get_spell_cast_info():get_target_index() == target.index or enemy:get_spell_book():get_spell_cast_info():get_target_index() ~= nil or features.evade:is_position_safe(target.position, false) == false then
                                                        print("enemies target = " .. enemy:get_spell_book():get_spell_cast_info():get_target_index())
                                                        print("AllyTarget = " .. target.index)
                                                        if target ~= nil and target:is_ally() and getDistance(g_local.position, target.position) <= self['e'].Range then
                                                            g_input:cast_spell(e_spell_slot.e, target)
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                            function mySpells:eSpellSelf()
                                local mode = features.orbwalker:get_mode()
                                if (mode == Combo_key and checkboxe:get_value() == true) or (mode == Harass_key and checkbox_harass_e:get_value() == true) then
                                    if self:canCast('e') then
                                        if e_pref_self:get_value() == true then
                                            update_priority_ally()
                                            get_target_ally()
                                            local target = g_local
                                            print("g_local target == " .. target.champion_name.text)
                                            if target ~= nil and target:is_ally() and getDistance(g_local.position, target.position) <= self['e'].Range then
                                                for i, enemy in pairs(features.entity_list:get_enemies()) do
                                                    if getDistance(enemy.position, target.position) <= 2000 then
                                                        if enemy:get_spell_book():get_spell_cast_info():get_target_index() == target.index or enemy:get_spell_book():get_spell_cast_info():get_target_index() ~= nil or features.evade:is_position_safe(g_local.position, false) == false then
                                                            print("enemies target = " .. enemy:get_spell_book():get_spell_cast_info():get_target_index())
                                                            print("AllyTarget = " .. target.index)
                                                            if target ~= nil and target:is_ally() and getDistance(g_local.position, target.position) <= self['e'].Range then
                                                                g_input:cast_spell(e_spell_slot.e, target)
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end











                            function mySpells:qSpell()
                                local mode = features.orbwalker:get_mode()
                                
                                if (mode == Combo_key and checkboxq:get_value() == true) or (mode == Harass_key and checkbox_harass_q:get_value() == true) then
                                    if features.orbwalker:is_in_attack() == false and features.evade:is_active() == false then
                                        if self:canCast('q') then
                                            local target = features.target_selector:get_default_target()
                                            if target ~= nil and getDistance(g_local.position, target.position) < self['q'].Range then
                                                local qHit = features.prediction:predict(target.index, self['q'].Range, self['q'].Speed, self['q'].Width, 0, g_local.position)
                                                if (qHit.valid and qHit.hitchance >= acc_q_slider:get_value()) then
                                                    g_input:cast_spell(e_spell_slot.q, qHit.position)
                                                end
                                            end
                                        end
                                    end
                                end

                                if (mode == Combo_key and checkboxq:get_value() == true) or (mode == Harass_key and checkbox_harass_q:get_value() == true) then
                                    if features.orbwalker:is_in_attack() == false and features.evade:is_active() == false then
                                        if self:canCast('q') then
                                            local target = features.target_selector:get_default_target()
                                            if target ~= nil and getDistance(g_local.position, target.position) >= self['q'].Range then
                                                for i, obj in pairs(features.entity_list:get_all()) do
                                                    if obj:dist_to_local() <= 1950 then
                                                        if obj:get_object_name() == "LuluFaerie" then
                                                            local qHit2 = features.prediction:predict(target.index, self['q'].Range, self['q'].Speed, self['q'].Width, 0, obj.position)
                                                            if (qHit2.valid and qHit2.hitchance >= acc_q_slider:get_value()) and getDistance(target.position, obj.position) < self['q'].Range then
                                                                g_input:cast_spell(e_spell_slot.q, qHit2.position)
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end


                            end

                            function mySpells:wSpell()
                                if w_pref_enemy:get_value() == true then
                                    mySpells:wSpellEnemy()
                                end
                                if w_pref_ally:get_value() == true then
                                    mySpells:wSpellAlly()
                                end
                                if w_pref_self:get_value() == true then
                                    mySpells:wSpellSelf()
                                end
                            end

                            function mySpells:eSpell()
                                if e_pref_enemy:get_value() == true then
                                    mySpells:eSpellEnemy()
                                end
                                if e_pref_ally:get_value() == true then
                                    mySpells:eSpellAlly()
                                end
                                if e_pref_self:get_value() == true then
                                    mySpells:eSpellSelf()
                                end
                            end



                            function mySpells:rSpell()
                                local mode = features.orbwalker:get_mode()

                                --R for peel (ally)
                                if mode == Combo_key and checkboxr:get_value() == true then
                                    if self:canCast('r') then
                                        update_priority_ally()
                                        get_target_ally()
                                        local target = AllyTarget
                                        if target ~= nil and target:is_ally() and not target:is_local() and getDistance(g_local.position, target.position) <= self['r'].Range then
                                        local Rnum = NumEnemiesInRangeTarget(380)
                                            if Rnum >= rslider:get_value() then
                                                g_input:cast_spell(e_spell_slot.r, target)
                                            end
                                        end
                                    end
                                end
                                --R for health (ally)
                                if mode == Combo_key and checkboxr:get_value() == true then
                                    if self:canCast('r') then
                                        update_priority_ally()
                                        get_target_ally()
                                        local target = AllyTarget
                                        if target ~= nil and target:is_ally() and not target:is_local() and getDistance(g_local.position, target.position) <= self['r'].Range then
                                            if NumEnemiesInRangeTarget(900) >= 1 then
                                                if features.evade:is_position_safe(target.position, false) == false and (target.health / target.max_health) * 100 <= r_health_slider:get_value() and target.health ~= 0 then
                                                    g_input:cast_spell(e_spell_slot.r, target)
                                                end
                                            end
                                        end
                                    end
                                end



                                --R for health (self)
                                if mode == Combo_key or Harass_key or Flee_key and checkboxr:get_value() == true then
                                    if self:canCast('r') then
                                        if (g_local.health / g_local.max_health) * 100 <= r_health_slider:get_value() and g_local.health ~= 0 then
                                            if NumEnemiesInRange(900) >= 1 then
                                                for i, enemy in pairs(features.entity_list:get_enemies()) do
                                                    if getDistance(enemy.position, g_local.position) <= 2000 then
                                                        if enemy:get_spell_book():get_spell_cast_info():get_target_index() == g_local.index or enemy:get_spell_book():get_spell_cast_info():get_target_index() ~= nil then
                                                            if features.evade:is_position_safe(g_local.position, false) == false then
                                                                g_input:cast_spell(e_spell_slot.r, g_local.position)
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                                --R for peel (Self)
                                if mode == Combo_key and checkboxr:get_value() == true then
                                    if self:canCast('r') then
                                        local Rnum = NumEnemiesInRange(380)
                                        print("RNum ==" .. Rnum)
                                        if Rnum >= rslider:get_value() then
                                            g_input:cast_spell(e_spell_slot.r, g_local.position)
                                        end
                                    end
                                end





                            end


                            --draws
                            cheat.register_callback("render", function()
                                if checkbox_q_drawings:get_value() == true and g_local:get_spell_book():get_spell_slot(e_spell_slot.q):is_ready() then
                                purple = color:new(201, 7, 245)
                                g_render:circle_3d(g_local.position, purple, self['q'].Range, 2, 100, 2)
                                end
                            end)
                            --Q Pix
                            cheat.register_callback("render", function()
                                if checkbox_pix_drawings:get_value() == true and g_local:get_spell_book():get_spell_slot(e_spell_slot.q):is_ready() then
                                    for i, obj in pairs(features.entity_list:get_all()) do
                                        if obj:dist_to_local() <= 1950 then
                                            if obj:get_object_name() == "LuluFaerie" then
                                                purple = color:new(201, 7, 245)
                                                g_render:circle_3d(obj.position, purple, 825, 2, 100, 2)
                                            end
                                        end
                                    end
                                end
                            end)
                            cheat.register_callback("render", function()
                                if checkbox_w_drawings:get_value() == true and g_local:get_spell_book():get_spell_slot(e_spell_slot.w):is_ready() then
                                green = color:new(0, 255, 21)
                                g_render:circle_3d(g_local.position, green, self['w'].Range, 2, 100, 2)
                                end
                            end)
                            cheat.register_callback("render", function()
                                if checkbox_e_drawings:get_value() == true and g_local:get_spell_book():get_spell_slot(e_spell_slot.e):is_ready() then
                                blue = color:new(76, 0, 255)
                                g_render:circle_3d(g_local.position, blue, self['e'].Range, 2, 100, 2)
                                end
                            end)

                            cheat.register_callback("pre-feature", get_target)
                            cheat.register_callback("pre-feature", get_target_ally)

                            cheat.register_module(
                                {
                                    champion_name = "Lulu",

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
                                        "spell_e",
                                        "spell_w",
                                        "spell_q",
                                        "spell_r",
                                        }
                                    end
                                }
                            )

end
--[[
    +Loaded Lulu -End
]]--

--[[
    Remorseful Renata -Start
]]--
function RemorsefulRenata()
                --[[

                Remorseful Renata
                    By: v
                        Enjoy!

                        Changelog:
                        7/12
                        Started Remorseful Renata
                        Finished Remorseful Renata

                        7/16
                        Added minion check for q1
            ]] --

            --variables
            Combo_key = 1
            Clear_key = 3
            Harass_key = 4
            Renata = g_local
            Q_range, Q_speed, Q_width, Q_windup = 900, 1450, 140 / 2, 0.25
            q1HitTarget = nil
            elseTarget = nil
            Q2_range, Q2_speed, Q2_width, Q2_windup = 325, 1450, 140 / 2, 0.25
            Q_cost = 80
            W_range = 800
            W_cost = 80
            E_cost = g_local:get_spell_book():get_spell_slot(e_spell_slot.e).level * 10 + 60
            E_range, E_speed, E_width, E_windup = 800, 1450, 225 / 2, 0.25
            R_cost = 100
            R_range, R_speed, R_width, R_windup = 2000, 650, 1000 / 2, 0.75
            target = features.target_selector:get_default_target()
            danger_range = 800
            Script_name = "Remorseful Renata"

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
            local q_drawings_config = g_config:add_bool(true, "Q Drawings")
            local w_drawings_config = g_config:add_bool(true, "W Drawings")
            local e_drawings_config = g_config:add_bool(true, "E Drawings")
            local r_drawings_config = g_config:add_bool(true, "R Drawings")

            local my_nav = menu.get_main_window():find_navigation(Script_name)

            local spell_sect = my_nav:add_section("Use Spells in Combo")
            local harass_sect = my_nav:add_section("Use Spells in Harass")
            local health_sect = my_nav:add_section("W Health Threshold")
            local acc_sect = my_nav:add_section("Accuracy Slider")
            local r_sect = my_nav:add_section("Auto R Config")
            local debug_sect = my_nav:add_section("Debug?!")
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

            local drawings_sect = my_nav:add_section("Drawings")
            local checkbox_q_drawings = drawings_sect:checkbox("Draw Q Range", q_drawings_config)
            local checkbox_w_drawings = drawings_sect:checkbox("Draw W Range", w_drawings_config)
            local checkbox_e_drawings = drawings_sect:checkbox("Draw E Range", e_drawings_config)
            local checkbox_r_drawings = drawings_sect:checkbox("Draw R Range", r_drawings_config)
            checkbox_q_drawings:set_value(true)
            checkbox_w_drawings:set_value(false)
            checkbox_e_drawings:set_value(true)
            checkbox_r_drawings:set_value(true)



            -- Debug function thanks to pingpongpow
            function Prints(str)
                local dbg = 1
                if dbg == 1 and checkbox_debug:get_value() == true then
                    print(str)
                end
            end



            --For W
            function NumAlliesAroundMe()
                local numAround = 0
                for _, ally in pairs(features.entity_list:get_allies()) do
                    if ally ~= nil and ally:is_alive() and ally.position:dist_to(g_local.position) <= W_range then
                        numAround = numAround + 1
                    end
                end
                return numAround
            end

            function NumEnemiesInRange(range)
                Prints("num around r")
                local numAround = 0
                for _,entity in pairs(features.entity_list:get_enemies()) do
                    if  entity ~= nil and not entity:is_invisible() and entity:is_alive() and entity.position:dist_to(g_local.position) <= range  then
                        numAround = numAround + 1
                    end
                end
                Prints("num around r - end")
                return numAround
            end

            --Thanks @pingpongpow for the poly explanation. This shit above my paygrade
            --Also thanks to Riot Games for making Renata Ult nearly copy and paste from Nami

            function Vec3_Rotate(c , p, angle) -- Center, Point, Angle
                angle = angle * (math.pi/180)
                local rotatedX = math.cos(angle) * (p.x - c.x) - math.sin(angle) * (p.z - c.z) + c.x
                local rotatedZ = math.sin(angle) * (p.x - c.x) + math.cos(angle) * (p.z - c.z) + c.z
                return vec3:new(rotatedX, p.y ,rotatedZ)
            end

            function Rectangle_Polygon(start_pos, target_pos, width, range)
                local pol = {}  
                local temp = Vec3_Extend(start_pos,target_pos, width/2)
                pol[1] = Vec3_Rotate(start_pos,temp,90)
                pol[2] = Vec3_Rotate(start_pos,temp,-90)
                temp = Vec3_Extend(target_pos,start_pos, range)
                local temp2 = Vec3_Extend(temp,target_pos, width/2)
                pol[3] = Vec3_Rotate(temp,temp2,90)
                pol[4] = Vec3_Rotate(temp,temp2,-90)
                return pol
            end

            function Vec3_Extend(a,b, dist) 
                local distance = a:dist_to(b) 
                local offset = dist / distance 
                local dir = vec3:new((a.x - b.x), b.y, (a.z - b.z)) 
                local newPos = vec3:new((a.x + dir.x*offset), b.y, (a.z + dir.z*offset)) 
                return newPos end

            function isInsidePolygon(point, polygon)
                local oddNodes = false
                local j = #polygon
                for i = 1, j do
                    if (polygon[i].z < point.z and polygon[j].z >= point.z or polygon[j].z < point.z and polygon[i].z >= point.z) then
                        if (polygon[i].x + ( point.z - polygon[i].z ) / (polygon[j].z - polygon[i].z) * (polygon[j].x - polygon[i].x) < point.x) then
                            oddNodes = not oddNodes;
                        end
                    end
                    j = i;
                end
                return oddNodes
            end

            function getEnimiesHitBy(poly)
                local n = 0
                for _,entity in pairs(features.entity_list:get_enemies()) do
                    if entity ~= nil and not entity:is_invisible() and entity:is_alive() then
                        local inside = isInsidePolygon(entity.position, poly)
                        if inside then
                            Prints("ult the ".. entity:get_object_name())
                            n = n + 1
                        end
                    end
                end
                return n
            end

            function q_buff()
                local enemies = features.entity_list:get_enemies()
                Prints("Checking for Q Recast")
                    for i, enemy in pairs(features.entity_list:get_enemies()) do
                        if features.buff_cache:get_buff(enemy.index, "RenataQ") ~= nil then
                            Prints("Q Hit")
                            return true
                        end
                    end
            end
            function qTarget()
                for i, obj in pairs(features.entity_list:get_all()) do
                    if obj:get_object_name() ~= nil and obj:is_hero() == true and obj:is_enemy() == true and obj:is_alive() == true then
                        if features.buff_cache:get_buff(obj.index, "RenataQ") ~= nil then
                            obj = q1HitTarget
                            return q1HitTarget
                        else 
                            obj = elseTarget
                            return elseTarget
                        end
                    end   
                end
            end

            function clearQ1Targets()
                if g_local:get_spell_book():get_spell_slot(e_spell_slot.q):is_ready() == false then
                    q1HitTarget = nil
                    return q1HitTarget
                end
            end
            function clear_elseTargets()
                if g_local:get_spell_book():get_spell_slot(e_spell_slot.q):is_ready() == false then
                    elseTarget = nil
                    return elseTarget
                end
            end


            --draws
            cheat.register_callback("render", function()
                if checkbox_q_drawings:get_value() == true then
                Q_range = 900
                purple = color:new(201, 7, 245)
                g_render:circle_3d(g_local.position, purple, Q_range, 2, 100, 2)
                end
            end)

            cheat.register_callback("render", function()
                if checkbox_w_drawings:get_value() == true then
                W_range = 800
                mag = color:new(245, 7, 110)
                g_render:circle_3d(g_local.position, mag, W_range, 2, 100, 2)
                end
            end)
            cheat.register_callback("render", function()
                if checkbox_e_drawings:get_value() == true then
                E_range = 800
                blue = color:new(76, 0, 255)
                g_render:circle_3d(g_local.position, blue, E_range, 2, 100, 2)
                end
            end)
            cheat.register_callback("render", function()
                if checkbox_r_drawings:get_value() == true then
                R_range = 2000
                red = color:new(255, 0, 0)
                g_render:circle_3d(g_local.position, red, R_range, 2, 100, 2)
                end
            end)


            cheat.register_module(
                {
                    champion_name = "Renata",

                    spell_q = function()
                        Q_range, Q_speed, Q_width, Q_windup = 900, 1450, 140 / 2, 0.25
                        Q2_range, Q2_speed, Q2_width, Q2_windup = 325, 1450, 140 / 2, 0.25 
                        Q_cost = 80
                        local target = features.target_selector:get_default_target()
                        Prints("Q Start")

                        if Q_cost > g_local.mana then
                            Prints("Not enough mana for Q")
                            return false
                        end
                        if g_local:get_spell_book():get_spell_slot(e_spell_slot.q):is_ready() == false then
                            Prints("Q Not Ready")
                            return false
                        end
                        if q_buff() == true then
                            Prints("Q Hit, Stop func")
                            return false
                        end



                        if target ~= nil and target ~= q1HitTarget and features.orbwalker:is_attackable(target.index, Q_range, true) and q_buff() ~= true then
                            local qHit = features.prediction:predict(target.index, Q_range, Q_speed, Q_width, Q_windup, g_local.position)
                            local badMinion = features.prediction:minion_in_line(g_local.position, qHit.position, 70, -1)
                            Prints("Getting Q hit prediction")
                            if features.orbwalker:get_mode() == Combo_key and checkboxq:get_value() == true then
                                if (qHit.valid and qHit.hitchance >= acc_q_slider:get_value()) and badMinion == false then
                                    Prints("Casting Q (combo)")
                                    g_input:cast_spell(e_spell_slot.q, qHit.position)
                                    features.orbwalker:set_cast_time(0.25)
                                    Prints("Casted Q (combo)")
                                    return true
                                end
                            elseif features.orbwalker:get_mode() == Harass_key and checkbox_harass_q:get_value() == true and badMinion == false then
                                if (qHit.valid and qHit.hitchance >= acc_q_slider:get_value()) then
                                    Prints("Casting Q (harass)")
                                    g_input:cast_spell(e_spell_slot.q, qHit.position)
                                    features.orbwalker:set_cast_time(0.25)
                                    Prints("Casted Q (harass)")
                                    return true
                                end
                            end
                        elseif target ~= nil and target == q1HitTarget then
                            qtarget()
                            if q1HitTarget:dist_to(elseTarget) <= Q2_range then
                                local q2Hit = features.prediction:predict(elseTarget.index, Q2_range, Q2_speed, Q2_width, Q2_windup, q1HitTarget.position)
                                local target = elseTarget
                                if features.orbwalker:get_mode() == Combo_key and checkboxq:get_value() == true then
                                    if (q2Hit.valid) then
                                        Prints("Casting Q2 (combo)")
                                        g_input:cast_spell(e_spell_slot.q, q2Hit.position)
                                        features.orbwalker:set_cast_time(0.25)
                                        Prints("Casted Q2 (combo)")
                                        return true
                                    end
                                elseif features.orbwalker:get_mode() == Harass_key and checkbox_harass_q:get_value() == true then
                                    if q2Hit.valid then
                                        Prints("Casting Q2 (harass)")
                                        g_input:cast_spell(e_spell_slot.q, q2Hit.position)
                                        features.orbwalker:set_cast_time(0.25)
                                        Prints("Casted Q2 (harass)")
                                        return true
                                    end
                                end

                            end
                        end


                    end,



                    spell_w = function()
                        local target = features.target_selector:get_default_target()
                        W_range = 800
                        W_cost = 80
                        danger_range = 800


                        Prints("W Start")

                        if W_cost > g_local.mana then
                            Prints("Not enough mana for W")
                            return false
                        end
                        if g_local:get_spell_book():get_spell_slot(e_spell_slot.w):is_ready() == false then
                            Prints("W Not Ready")
                            return false
                        end

                        local num = NumAlliesAroundMe() - 1
                        Prints("Allies around me   " .. num)
                        if num > 0 then
                            for _, ally in pairs(features.entity_list:get_allies()) do
                                if ally ~= nil and ally:is_alive() and ally:is_hero() == true and ally ~= g_local and checkboxw:get_value() == true then
                                    if features.orbwalker:get_mode() == Combo_key then
                                        Prints("W start finding ally")
                                        if ally.position:dist_to(g_local.position) <= W_range then
                                            Prints("W finding ally in danger")
                                            if ((ally.health) / (ally.max_health)) * 100 <= w_health_slider:get_value() then 
                                                if ally.position:dist_to(target.position) <= ally.attack_range or ally.position:dist_to(target.position) <= danger_range then
                                                    Prints("Casting W")
                                                    g_input:cast_spell(e_spell_slot.w, ally.network_id)
                                                    Prints("Casted W on Ally")
                                                    return true
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end

                        if checkbox_w_self:get_value() == true and features.orbwalker:get_mode() == Combo_key or features.orbwalker:get_mode() == Harass_key then
                                    if (g_local.health / g_local.max_health) * 100 <= w_health_slider:get_value() and
                                        g_local.health ~= 0 then
                                            Prints("W on self")
                                            g_input:cast_spell(e_spell_slot.w, g_local.position)
                                            Prints("Casted W on self")
                                            return true
                                    end
                        end

                    end,

                    spell_e = function()
                        local target = features.target_selector:get_default_target()
                        E_cost = g_local:get_spell_book():get_spell_slot(e_spell_slot.e).level * 10 + 60
                        E_range, E_speed, E_width, E_windup = 800, 1450, 225 / 2, 0.25

                        Prints("E Start")

                        if E_cost > g_local.mana then
                            Prints("Not enough mana for E")
                            return false
                        end
                        if g_local:get_spell_book():get_spell_slot(e_spell_slot.e):is_ready() == false then
                            Prints("E Not Ready")
                            return false
                        end

                        if target ~= nil and features.orbwalker:is_attackable(target.index, E_range, true) then
                            local eHit = features.prediction:predict(target.index, E_range, E_speed, E_width, E_windup, g_local.position)
                            Prints("Getting E hit prediction")
                            if features.orbwalker:get_mode() == Combo_key and checkboxe:get_value() == true then
                                if (eHit.valid and eHit.hitchance >= acc_e_slider:get_value()) then
                                    Prints("Casting E (combo)")
                                    g_input:cast_spell(e_spell_slot.e, eHit.position)
                                    features.orbwalker:set_cast_time(0.25)
                                    Prints("Casted E (combo)")
                                    return true
                                end
                            elseif features.orbwalker:get_mode() == Harass_key and checkbox_harass_e:get_value() == true then
                                if (eHit.valid and eHit.hitchance >= acc_e_slider:get_value()) then
                                    Prints("Casting E (harass)")
                                    g_input:cast_spell(e_spell_slot.e, eHit.position)
                                    features.orbwalker:set_cast_time(0.25)
                                    Prints("Casted E (harass)")
                                    return true
                                end
                            end
                        end

                    end,

                    spell_r = function()
                        local target = features.target_selector:get_default_target()
                        R_range, R_speed, R_width, R_windup = 2000, 650, 1000 / 2, 0.75

                        Prints("R Start")

                        if R_cost > g_local.mana then
                            Prints("Not enough mana for R")
                            return false
                        end
                        if g_local:get_spell_book():get_spell_slot(e_spell_slot.r):is_ready() == false then
                            Prints("R Not Ready")
                            return false
                        end

                        if features.orbwalker:get_mode() == Combo_key then
                        Prints("Do Ult Combo?")
                        local num = NumEnemiesInRange(R_range)
                        Prints("In range:" .. num)
                        if num > 0 then
                            local rHit = features.prediction:predict(target.index, R_range, R_speed, R_width, R_windup, g_local.position) 
                            if (rHit.valid and rHit.hitchance > 1.0) then
                                Prints("r pred doing rect")
                                local poly = Rectangle_Polygon(g_local.position, target.position, R_width, R_range)
                                Prints("r get x hit by rect ")
                                local num = getEnimiesHitBy(poly)
                                if num >= rslider:get_value() then
                                    g_input:cast_spell(e_spell_slot.r, rHit.position)
                                    Prints("Casted R (Combo)")
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
--[[
    Remorseful Renata -End
]]--

--[[
    Tasty Teemo -Start
]]--
function TastyTeemo()
                    --[[

                    Tasty Teemo LUA
                        By: v
                            Enjoy!

                            Changelog:
                            6/5/22
                            Tasty Teemo v1.lua 
                            -Rewriting Shiddy Teemo into Tasty Teemo


                ]]--


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
                Script_name = "Tasty Teemo"



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


                local debug_sect = my_nav:add_section("Debug?!")
                local checkbox_debug = debug_sect:checkbox("Print Statements", debug_config)
                checkbox_debug:set_value(false)



                function Prints(str)
                    local dbg = 1
                    if dbg == 1 and checkbox_debug:get_value() == true then
                        print(str)
                    end
                end

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
                                Prints("Not enough mana for Q")
                                return false
                            end
                            if g_local:get_spell_book():get_spell_slot(e_spell_slot.q):is_ready() == false then
                                Prints("Q Not Ready")
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
                                        print("Assist Casting Q")
                                    else
                                        print("No Assist Cast Q")
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
                                Prints("Casting Q (combo) on target with best metrics in range")
                                g_input:cast_spell(e_spell_slot.q, bestTarget.network_id)
                                features.orbwalker:set_cast_time(0.25)
                                Prints("Casted Q (combo)")
                                return true
                            end
                            
                            
                            if target ~= nil and features.orbwalker:is_attackable(target.index, Q_range, true) then
                                if features.orbwalker:get_mode() == Harass_key and checkbox_harass_q:get_value() == true and features.orbwalker:should_reset_aa() == true then
                                    Prints("Casting Q (harass)")
                                    g_input:cast_spell(e_spell_slot.q, target.network_id)
                                    features.orbwalker:set_cast_time(0.25)
                                    Prints("Casted Q (harass)")
                                    return true
                                end
                            end

                    end,


                    spell_w = function()
                        local target = features.target_selector:get_default_target()



                            if W_cost > g_local.mana then
                                Prints("Not enough mana for W")
                                return false
                            end
                            if g_local:get_spell_book():get_spell_slot(e_spell_slot.w):is_ready() == false then
                                Prints("W Not Ready")
                                return false
                            end
                        
                            if checkboxwevade:get_value() == true then
                                if features.evade:is_active() and features.evade:is_position_safe(g_local.position, false) then
                                    Prints("Casting W (Evade)")
                                    g_input:cast_spell(e_spell_slot.w)
                                    Prints("Casted W (Evade)")
                                    return true
                                end
                            end

                            if checkboxwantigapclose:get_value() == true and features.orbwalker:get_mode() == Combo_key or features.orbwalker:get_mode() == Harass_key then
                            local antigapclosetarget = features.target_selector:get_antigapclose_target(400)
                                if antigapclosetarget ~= nil then
                                    if getDistance(antigapclosetarget.position, g_local.position) <= 400 then
                                        Prints("Casting W (AntiGapClose)")
                                        g_input:cast_spell(e_spell_slot.w)
                                        Prints("Casted W (AntiGapClose)")
                                        return true
                                    end
                                end
                            end

                            if target ~= nil and features.orbwalker:is_attackable(target.index, Q_range, true) then
                                if features.orbwalker:get_mode() == Combo_key and checkboxw:get_value() == true and g_local.movement_speed < target.movement_speed then 
                                    Prints("Casting W (combo)")
                                    g_input:cast_spell(e_spell_slot.w)
                                    Prints("Casted W (combo)")
                                    return true
                                end
                            end

                            if target ~= nil and features.orbwalker:is_attackable(target.index, Q_range, true) then    
                                if features.orbwalker:get_mode() == Flee_key and checkbox_flee_w:get_value() == true and g_local.movement_speed < target.movement_speed then
                                    Prints("Casting W (flee)")
                                    g_input:cast_spell(e_spell_slot.w)
                                    Prints("Casted W (flee)")
                                    return true
                                end
                            end

                    end,

                    spell_r = function()
                        local target = features.target_selector:get_default_target()



                            if R_cost > g_local.mana then
                                Prints("Not enough mana for R")
                                return false
                            end
                            if g_local:get_spell_book():get_spell_slot(e_spell_slot.r):is_ready() == false then
                                Prints("R Not Ready")
                                return false
                            end
                        
                            if checkboxrantigapclose:get_value() == true and features.orbwalker:get_mode() == Combo_key or features.orbwalker:get_mode() == Harass_key then
                                local antigapclosetarget = features.target_selector:get_antigapclose_target(400)
                                if antigapclosetarget ~= nil then
                                    Prints("Casting R (AntiGapClose)")
                                    g_input:cast_spell(e_spell_slot.r, antigapclosetarget.path_end)
                                    Prints("Casted R (AntiGapClose)")
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
--[[
    Tasty Teemo -End
]]--

--[[
    Zesty Zilean -Start
]]--
function ZestyZilean()
                    --[[

                    Zesty Zilean
                        By: v
                            Enjoy!

                            Changelog:
                            6/8/22
                            Zesty Zilean.lua 
                            -Started writing Zesty Zilean
                            q done, w done

                            6/9/22 
                            - Cleaned up spell code
                            - Started menu (from pingpongpow)

                            6/11/22
                            - Added num allies function (from pingpongpow)
                            - Finished menu
                            - Started R logic (almost done)

                            6/12/22
                            - Finished R logic
                            - Harass
                            - Menu additions
                                --Released Zesty Zilean.lua (v1)
                                        -Added E on enemy (ally logic soon)
                                

                            To do:
                                Add Mana sliders for Combo and Harass
                                Minion checks for q,w,q combo (stun)?
                                Smart mode / heal for R (@SX)
                ]] --

                --variables
                Combo_key = 1
                Clear_key = 3
                Harass_key = 4
                Q_range, Q_speed, Q_width, Q_windup = 900, 1100, 350 / 2, 0.25
                Q_cost = g_local:get_spell_book():get_spell_slot(e_spell_slot.q).level * 5 + 55
                W_cost = 35
                E_cost = 50
                E_range = 500
                R_cost = g_local:get_spell_book():get_spell_slot(e_spell_slot.r).level * 25 + 100
                R_range = 900
                Script_name = "Zesty Zilean"

                -- Pasting pingpongpow's menu and editing for zil
                local test_navigation = menu.get_main_window():push_navigation(Script_name, 10000)

                local q_config = g_config:add_bool(true, "Use Q (Combo)")
                local w_config = g_config:add_bool(true, "Use W (Combo)")
                local e_config = g_config:add_bool(true, "Use E (Combo)")
                local r_config = g_config:add_bool(true, "Use R (Combo)")
                local q_drawings_config = g_config:add_bool(true, "Q Drawings")
                local e_drawings_config = g_config:add_bool(true, "E Drawings")
                local r_drawings_config = g_config:add_bool(true, "R Drawings")
                local my_nav = menu.get_main_window():find_navigation(Script_name)

                local spell_sect = my_nav:add_section("Use Spells in Combo")
                local checkboxq = spell_sect:checkbox("Use Q (Combo)", q_config)
                local checkboxw = spell_sect:checkbox("Use W (Combo)", w_config)
                local checkboxe = spell_sect:checkbox("Use E (Combo)", e_config)
                local checkboxr = spell_sect:checkbox("Use R (Combo)", r_config)
                checkboxq:set_value(true)
                checkboxw:set_value(true)
                checkboxe:set_value(true)
                checkboxr:set_value(true)

                local q_harass_config = g_config:add_bool(true, "Use Q (Harass)")
                local w_harass_config = g_config:add_bool(true, "Use W (Harass)")
                local harass_sect = my_nav:add_section("Use Spells in Harass")
                local checkbox_harass_q = harass_sect:checkbox("Use Q (Harass)", q_harass_config)
                local checkbox_harass_w = harass_sect:checkbox("Use W (Harass)", w_harass_config)
                checkbox_harass_q:set_value(true)
                checkbox_harass_w:set_value(false)

                local acc_sect = my_nav:add_section("Accuracy Slider")
                local acc_config = g_config:add_int(0, "Q Accuracy")
                local acc_q_slider = acc_sect:slider_int("Q Accuracy", acc_config, 0, 5, 1)
                acc_q_slider:set_value(2)

                local health_sect = my_nav:add_section("R Health Threshold")
                local health_config = g_config:add_int(0, "R Health Threshhold (%)")
                local r_health_slider = health_sect:slider_int("R Health Threshhold (%)", health_config, 0, 100, 1)
                r_health_slider:set_value(20)

                local debug_config = g_config:add_bool(true, "Debug?")
                local debug_sect = my_nav:add_section("Debug?!")
                local checkbox_debug = debug_sect:checkbox("Print Statements", debug_config)
                checkbox_debug:set_value(false)

                local drawings_sect = my_nav:add_section("Drawings")
                local checkbox_q_drawings = drawings_sect:checkbox("Draw Q Range", q_drawings_config)
                local checkbox_e_drawings = drawings_sect:checkbox("Draw E Range", e_drawings_config)
                local checkbox_r_drawings = drawings_sect:checkbox("Draw R Range", r_drawings_config)
                checkbox_q_drawings:set_value(true)
                checkbox_e_drawings:set_value(true)
                checkbox_r_drawings:set_value(true)


                -- Debug function thanks to pingpongpow
                function Prints(str)
                    local dbg = 1
                    if dbg == 1 and checkbox_debug:get_value() == true then
                        print(str)
                    end
                end




                function NumAlliesAroundMe()
                    local numAround = 0
                    for _, ally in pairs(features.entity_list:get_allies()) do
                        if ally ~= nil and ally:is_alive() and ally.position:dist_to(g_local.position) <= R_range then
                            numAround = numAround + 1
                        end
                    end
                    return numAround
                end



                --draws
                cheat.register_callback("render", function()
                    if checkbox_q_drawings:get_value() == true then
                    Q_range = 900
                    cyan = color:new(0, 221, 255)
                    g_render:circle_3d(g_local.position, cyan, Q_range, 2, 100, 2)
                    end
                end)
                cheat.register_callback("render", function()
                    if checkbox_e_drawings:get_value() == true then
                    E_range = 500
                    blue = color:new(76, 0, 255)
                    g_render:circle_3d(g_local.position, blue, E_range, 2, 100, 2)
                    end
                end)
                cheat.register_callback("render", function()
                    if checkbox_r_drawings:get_value() == true then
                    R_range = 900
                    yellow = color:new(255, 251, 0)
                    g_render:circle_3d(g_local.position, yellow, R_range, 2, 100, 2)
                    end
                end)


                cheat.register_module(
                    {
                        champion_name = "Zilean",
                        spell_q = function()
                            local target = features.target_selector:get_default_target()

                            Prints("Q Start")

                            if Q_cost > g_local.mana then
                                Prints("Not enough mana for Q")
                                return false
                            end
                            if g_local:get_spell_book():get_spell_slot(e_spell_slot.q):is_ready() == false then
                                Prints("Q Not Ready")
                                return false
                            end


                            Q_range, Q_speed, Q_width, Q_windup = 900, 1100, 350 / 2, 0.25

                            if target ~= nil and features.orbwalker:is_attackable(target.index, Q_range, true) then
                                local qHit =
                                    features.prediction:predict(target.index, Q_range, Q_speed, Q_width, Q_windup, g_local.position)
                                Prints("Getting Q hit prediction")
                                if features.orbwalker:get_mode() == Combo_key and checkboxq:get_value() == true then
                                    if (qHit.valid and qHit.hitchance >= acc_q_slider:get_value()) then
                                        Prints("Casting Q (combo)")
                                        g_input:cast_spell(e_spell_slot.q, qHit.position)
                                        features.orbwalker:set_cast_time(0.25)
                                        Prints("Casted Q (combo)")
                                        return true
                                    end
                                elseif features.orbwalker:get_mode() == Harass_key and checkbox_harass_q:get_value() == true then
                                    if (qHit.valid and qHit.hitchance >= acc_q_slider:get_value()) then
                                        Prints("Casting Q (harass)")
                                        g_input:cast_spell(e_spell_slot.q, qHit.position)
                                        features.orbwalker:set_cast_time(0.25)
                                        Prints("Casted Q (harass)")
                                        return true
                                    end
                                end
                            end
                        end,



                        spell_w = function()
                            W_cost = 35
                            local target = features.target_selector:get_default_target()

                            Prints("W Start")

                            if W_cost > g_local.mana then
                                Prints("Not enough mana for W")
                                return false
                            end
                            if g_local:get_spell_book():get_spell_slot(e_spell_slot.q):is_ready() then
                                Prints("Q is ready, no W")
                                return false
                            end
                            if g_local:get_spell_book():get_spell_slot(e_spell_slot.w):is_ready() == false then
                                Prints("W Not Ready")
                                return false
                            end



                            if features.orbwalker:get_mode() == Combo_key and checkboxw:get_value() == true and target ~= nil then
                                Prints("Casting W (combo)")
                                g_input:cast_spell(e_spell_slot.w, nil)
                                Prints("Casted W (combo)")
                                return true
                            elseif
                                features.orbwalker:get_mode() == Harass_key and checkbox_harass_w:get_value() == true and target ~= nil
                            then
                                Prints("Casting W (harass)")
                                g_input:cast_spell(e_spell_slot.w, nil)
                                Prints("Casted W (harass)")
                                return true
                            end
                        end,

                        spell_e = function()
                            E_cost = 50
                            E_range = 500

                            Prints("E Start")

                            if E_cost > g_local.mana then
                                Prints("Not enough mana for E")
                                return false
                            end
                            if g_local:get_spell_book():get_spell_slot(e_spell_slot.e):is_ready() == false then
                                Prints("E Not Ready")
                                return false
                            end



                            --[[ convert to E logic for teammates?
                                
                            local num = NumAlliesAroundMe() - 1
                            Prints("Allies around me   " .. num)
                            if num > 0 then
                                for _, ally in pairs(features.entity_list:get_allies()) do
                                    if ally ~= nil and ally:is_alive() and ally:is_hero() == true and checkboxr:get_value() == true then
                                        if features.orbwalker:get_mode() == Combo_key then
                                            Prints("R start finding ally")
                                            if ally.position:dist_to(g_local.position) <= R_range then
                                                Prints("R finding ally in danger")
                                                if ((ally.health) / (ally.max_health)) * 100 <= r_health_slider:get_value() then
                                                    Prints("Casting R")
                                                    g_input:cast_spell(e_spell_slot.r, ally.network_id)
                                                    Prints("Casted R on Ally")
                                                    return true
                                                end
                                            end
                                        end
                                    end
                                end
                            end]]--


                            local target = features.target_selector:get_default_target()

                            if checkboxe:get_value() == true and features.orbwalker:get_mode() == Combo_key then
                                if target ~= nil and features.orbwalker:is_attackable(target.index, E_range, true) then
                                    Prints("Casting E (combo, enemy)")
                                    g_input:cast_spell(e_spell_slot.e, target.network_id)
                                    Prints("Casted E (combo, enemy)")
                                    return true
                                end
                            end

                            --To add?
                            -- if features.prediction:predict_health(g_local, 0.15, true) < g_local.health then

                        end,

                        spell_r = function()
                            R_cost = g_local:get_spell_book():get_spell_slot(e_spell_slot.r).level * 25 + 100
                            R_range = 900

                            Prints("R Start")

                            if R_cost > g_local.mana then
                                Prints("Not enough mana for R")
                                return false
                            end
                            if g_local:get_spell_book():get_spell_slot(e_spell_slot.r):is_ready() == false then
                                Prints("R Not Ready")
                                return false
                            end



                            local num = NumAlliesAroundMe() - 1
                            Prints("Allies around me   " .. num)
                            if num > 0 then
                                for _, ally in pairs(features.entity_list:get_allies()) do
                                    if ally ~= nil and ally:is_alive() and ally:is_hero() == true and checkboxr:get_value() == true then
                                        if features.orbwalker:get_mode() == Combo_key then
                                            Prints("R start finding ally")
                                            if ally.position:dist_to(g_local.position) <= R_range then
                                                Prints("R finding ally in danger")
                                                if ((ally.health) / (ally.max_health)) * 100 <= r_health_slider:get_value() then
                                                    Prints("Casting R")
                                                    g_input:cast_spell(e_spell_slot.r, ally.network_id)
                                                    Prints("Casted R on Ally")
                                                    return true
                                                end
                                            end
                                        end
                                    end
                                end
                            end

                            -- To add?
                            -- if features.prediction:predict_health(ally, 0.15, true) < ally.health then

                            if
                            checkboxr:get_value() == true and features.orbwalker:get_mode() == Combo_key or features.orbwalker:get_mode() == Harass_key or features.orbwalker:get_mode() == Clear_key or features.orbwalker:get_mode() == 0  then
                                        if (g_local.health / g_local.max_health) * 100 <= r_health_slider:get_value() and
                                            g_local.health ~= 0 then
                                                Prints("R on self")
                                                g_input:cast_spell(e_spell_slot.r, g_local.position)
                                                Prints("Casted R on self")
                                                return true
                                        end
                            end

                            --To add?
                            -- if features.prediction:predict_health(g_local, 0.15, true) < g_local.health then

                        end,


                        
                        get_priorities = function()
                            return {
                                "spell_e",
                                "spell_q",
                                "spell_w",
                                "spell_r"
                            }
                        end
                    }
                )

end
--[[
    Zesty Zilean -End
]]--


LoadDBG = 1
function LoadPrints(str)
    if LoadDBG == 1 then
        print(str)
    end
end

Champion = g_local.champion_name.text
if Champion == "Kayn" then
    KeenKayn()
    LoadPrints("+Keen Kayn+ -- Loading")
    LoadDBG = 0
end
if Champion == "Khazix" then
    KillerKhazix()
    LoadPrints("+Killer Kha`zix+ -- Loading")
    LoadDBG = 0
end
if Champion == "Leona" then
    LockdownLeona()
    LoadPrints("+Lockdown Leona+ -- Loading")
    LoadDBG = 0
end
if Champion == "Lissandra" then
    LifelessLissandra()
    LoadPrints("+Lifeless Lissandra+ -- Loading")
    LoadDBG = 0
end
if Champion == "Lulu" then
    LoadedLulu()
    LoadPrints("+Loaded Lulu+ -- Loading")
    LoadDBG = 0
end
if Champion == "Renata" then
  RemorsefulRenata()
  LoadPrints("+Remorseful Renata+ -- Loading")
  LoadDBG = 0
end
if Champion == "Teemo" then
  TastyTeemo()
  LoadPrints("+Tasty Teemo+ -- Loading")
  LoadDBG = 0
end
if Champion == "Zilean" then
  ZestyZilean()
  LoadPrints("+Zesty Zilean+ -- Loading")
  LoadDBG = 0
end
if Champion == nil or not "Renata" or not "Teemo" or not "Zilean" or not "Khazix" or not "Lissandra" or not "Leona" or not "Lulu" or not "Kayn" then
    LoadPrints("Champion Not Supported in vAIO.")
    LoadDBG = 0
end