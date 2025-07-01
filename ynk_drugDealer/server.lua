RegisterNetEvent('payDrugs')
AddEventHandler('payDrugs', function (price, item, amount)
    xPlayer =  ESX.GetPlayerFromId(source)

    playerMoney = xPlayer.getMoney()

    if playerMoney  < price then
        print("tu na pas assez de thune ")
        return
    end

    xPlayer.removeMoney(price * amount)
    exports.ox_inventory:AddItem(source, item, amount)


    print("la somme de : "..price.." a ete retracter ")
    print("item suivant a ete ajouter : "..item..' en quantite : '..amount)
end)


RegisterNetEvent('ox_inventory:useItem')
AddEventHandler('ox_inventory:useItem', function(itemName)
    local src = source
    print("[DEBUG] Item utilisé:", itemName)

    if itemName == 'turbozen' then
        exports.ox_inventory:RemoveItem(src, 'turbozen', 1)

    elseif itemName == 'ragerush' then
        exports.ox_inventory:RemoveItem(src, 'ragerush', 1)

    elseif itemName == 'dreamweed' then
        exports.ox_inventory:RemoveItem(src, 'dreamweed', 1)

    elseif itemName == 'nocturna' then
        exports.ox_inventory:RemoveItem(src, 'nocturna', 1)
    else
        print("[DEBUG] Item non géré:", itemName)
    end
end)
