ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- Arme en item
RegisterNetEvent("ArmurieBuilder:GiveWeapon")
AddEventHandler('ArmurieBuilder:GiveWeapon', function(JobName, WeaponName, ArmuriePaid, price, WeaponLabel, ammo)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    local Job = xPlayer.getJob().name
    local GetMoney = xPlayer.getMoney()
    if Job == JobName then
        if not ArmuriePaid then 
            xPlayer.addInventoryItem(WeaponName, ammo)
        else
            if GetMoney >= price then
                xPlayer.addInventoryItem(WeaponName, ammo)
                xPlayer.removeMoney(price)
                TriggerClientEvent("esx:showNotification", _src, ("Vous venez d'acheter un %s pour ~g~%s$"):format(WeaponLabel, price))
            else 
                TriggerClientEvent("esx:showNotification", _src, "~r~Vous n'avez pas assez d'argent sur vous")
            end
        end
    else
        DropPlayer(_src, "~r~Le cheat n'est pas bon")
    end
end)


RegisterNetEvent("GiveAccessory")
AddEventHandler("GiveAccessory", function(ArmuriePaid ,Label,  Item, Count, price)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    local GetMoney = xPlayer.getMoney()
    if not ArmuriePaid then
        xPlayer.addInventoryItem(Item, ammo)
    else
        if GetMoney >= price then
            xPlayer.addInventoryItem(Item, Count)
            xPlayer.removeMoney(price)
            TriggerClientEvent("esx:showNotification", _src, ("Vous venez d'acheter un %s pour ~g~%s$"):format(Label, price))
        else 
            TriggerClientEvent("esx:showNotification", _src, "~r~Vous n'avez pas assez d'argent sur vous")
        end
    end
end)

-- Arme basic
-- RegisterNetEvent("ArmurieBuilder:GiveWeapon")
-- AddEventHandler('ArmurieBuilder:GiveWeapon', function(JobName, WeaponName, ArmuriePaid, price, WeaponLabel, ammo)
--     local _src = source 
--     local xPlayer = ESX.GetPlayerFromId(_src)
--     local Job = xPlayer.getJob().name
--     local GetMoney = xPlayer.getMoney()
--     if Job == JobName then
--         if not ArmuriePaid then 
--             xPlayer.addWeapon(WeaponName, ammo)
--         else
--             if GetMoney >= price then
--                 xPlayer.addWeapon(WeaponName, ammo)
--                 xPlayer.removeMoney(price)
--                 TriggerClientEvent("esx:showNotification", _src, ("Vous venez d'acheter un %s pour ~g~%s$"):format(WeaponLabel, price))
--             else 
--                 TriggerClientEvent("esx:showNotification", _src, "~r~Vous n'avez pas assez d'argent sur vous")
--             end
--         end
--     else
--         DropPlayer(_src, "~r~Le cheat n'est pas bon")
--     end
-- end)

