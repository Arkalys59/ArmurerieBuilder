ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


CreateThread(function()
    while true do
        local interval = 500
        local PlayerPos = GetEntityCoords(PlayerPedId())
        for k,v in pairs(ArmurerieBuilder) do 
            local dest = v.PointArme
            local dist = #(PlayerPos-dest)
            if dist <= 10 then
                interval = 0
                if ESX.PlayerData.job.name == v.JobName then
                    DrawMarker(6,dest, 0.0, 0.0, 0.0, -90.0, -90.0, -90.0, 1.0, 1.0, 1.0, 255, 0, 0, 55555, false, false, 2, false, false, false, false)
                    if dist <= 3 then 
                        ESX.ShowHelpNotification(v.HelpTextArme)
                        if IsControlJustPressed(1, 51) then
                            OpenMenuArmurerieBuilder(v)
                        end
                    end
                end
            end
            local destAccessoire = v.PointAccessoire
            local distAccessoire = #(PlayerPos-destAccessoire)
            if distAccessoire <= 10 then
                interval = 0
                if ESX.PlayerData.job.name == v.JobName then
                    DrawMarker(6,destAccessoire, 0.0, 0.0, 0.0, -90.0, -90.0, -90.0, 1.0, 1.0, 1.0, 255, 0, 0, 55555, false, false, 2, false, false, false, false)
                    if distAccessoire <= 3 then 
                        ESX.ShowHelpNotification(v.HelpTextAccessoire)
                        if IsControlJustPressed(1, 51) then
                            OpenMenuAccessoire(v)
                        end
                    end
                end
            end
        end
        Wait(interval) 
    end
end)


local OpenAccessoire = false 
MenuAccessoire = RageUI.CreateMenu("Armurerie", " ")
MenuAccessoire.Closed = function()
    OpenAccessoire = false 
end

function OpenMenuAccessoire(infos)
    if OpenAccessoire then
        OpenAccessoire = false 
        RageUI.Visible(MenuAccessoire, false)
        return
    else
        OpenAccessoire = true
        RageUI.Visible(MenuAccessoire, true)
        CreateThread(function()
            while OpenAccessoire do 
            RageUI.IsVisible(MenuAccessoire, function()
                for k,v in pairs(infos.Accesoire) do 
                    if not infos.ArmuriePaid then 
                        RageUI.Button(v.Label, nil, {}, true, {
                            onSelected = function()
                                TriggerServerEvent("GiveAccessory", infos.ArmuriePaid, v.Label, v.Item, v.Count)
                            end
                        })
                    else
                        RageUI.Button(v.Label.." | ~g~Prix :~s~ "..v.price.."$", nil, {RightLabel = "→→"}, true, {
                            onSelected = function()
                                TriggerServerEvent("GiveAccessory", infos.ArmuriePaid, v.Label, v.Item, v.Count, v.price)
                            end
                        })
                    end
                end
            end)
            Wait(0)
            end
        end)
    end
end



local OpenArmurerieBuilder = false 
MenuArmurerieBuilder = RageUI.CreateMenu("Armurerie", " ")
MenuArmurerieBuilder.Closed = function()
    OpenArmurerieBuilder = false 
end

function OpenMenuArmurerieBuilder(infos)
    if OpenArmurerieBuilder then
        OpenArmurerieBuilder = false 
        RageUI.Visible(MenuArmurerieBuilder, false)
        return
    else
        OpenArmurerieBuilder = true
        RageUI.Visible(MenuArmurerieBuilder, true)
        CreateThread(function()
            while OpenArmurerieBuilder do 
                RageUI.IsVisible(MenuArmurerieBuilder, function()
                RageUI.Separator(("Entreprise : ~b~%s"):format(infos.JobLabel))
                RageUI.Line()
                    for i = 1, #infos.Arme do
                        local v = infos.Arme[i]
                        if not infos.ArmuriePaid then 
                            if v.category ~= nil then 
                                RageUI.Separator(v.category)
                            else
                                RageUI.Button(v.WeaponLabel, nil, {}, true, {
                                    onSelected = function()
                                        TriggerServerEvent("ArmurieBuilder:GiveWeapon", infos.JobName, v.WeaponName, infos.ArmuriePaid, v.price, v.WeaponLabel, v.ammo)
                                    end
                                })
                            end
                        else
                            if v.category ~= nil then 
                                RageUI.Separator(v.category)
                            else
                                RageUI.Button(v.WeaponLabel.." | ~g~Prix :~s~"..v.price.."$", nil, {RightLabel = "→→"}, true, {
                                    onSelected = function()
                                        TriggerServerEvent("ArmurieBuilder:GiveWeapon", infos.JobName, v.WeaponName, infos.ArmuriePaid, v.price, v.WeaponLabel, v.ammo)
                                    end
                                })
                            end
                        end
                        if infos.Gilet then 
                            RageUI.Line()
                            RageUI.Button("Petit gilet par balle", nil, {}, true, {
                                onSelected = function()
                                    SetPedArmour(PlayerPedId(), 100)
                                end
                            })
                            RageUI.Button("Grand gilet par balle", nil, {}, true, {
                                onSelected = function()
                                    SetPedArmour(PlayerPedId(), 200)
                                end
                            })
                        end
                    end
                end)
            Wait(0)
            end
        end)
    end
end