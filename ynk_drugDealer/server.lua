RegisterNetEvent('payDrugs')
AddEventHandler('payDrugs', function (price, item, amount)
    xPlayer =  ESX.GetPlayerFromId(source)

    playerMoney = xPlayer.getMoney()

    if playerMoney  < price then
        print("tu na pas assez de thune ")
        return
    end

    xPlayer.removeMoney(price)
    xPlayer.addInventoryItem(item, amount)

    print("la somme de : "..price.." a ete retracter ")
    print("item suivant a ete ajouter : "..item..' en quantite : '..amount)
end)



