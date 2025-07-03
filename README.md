# 🚀 FiveM Drug Script – ESX + OX Inventory Compatible

Ce script ajoute un système de drogues immersif et modulable pour votre serveur FiveM basé sur **ESX** et **ox_inventory**. Les joueurs peuvent acheter, utiliser et ressentir différents effets visuels et physiques selon la drogue consommée.

---

## 📦 Fonctionnalités

- ✅ Intégration complète avec `ox_inventory`
- ✅ Intégration complète avec `ox_target`
- ✅ Compatible ESX (`exports['es_extended']:getSharedObject()`)
- ✅ Interface utilisateur via `ox_lib` (menus, progress bars, etc.)
- ✅ 4 drogues personnalisées :
  - **Turbozen** : effet visuel désorientant
  - **RageRush** : boost de vitesse
  - **DreamWeed** : hallucinations visuelles
  - **Nocturna** : caméra instable et animations étranges
- ✅ Menu d’achat interactif via NPC
- ✅ Animation et effets synchronisés
- ✅ Configuration facile via `config.lua` et `shared/items.lua`

---

## 👤 Interaction avec le PNJ
Le joueur s’approche du dealer (coordonnées configurables)

Vise avec ox target 

Choisit une drogue à acheter (confirmation requise)

L’item est ajouté à l’inventaire

---

## 🧾 Dépendances

Assurez-vous d’avoir les ressources suivantes :
- [ox_target](https://overextended.dev/ox_target)
- [ox_inventory](https://overextended.dev/ox_inventory/)
- [ox_lib](https://overextended.dev/ox_lib/)
- [es_extended](https://github.com/esx-framework/es_extended)

---

## 🛠️ Installation

1. **Placez le dossier du script** dans votre répertoire `resources/` (par ex. `resources/[local]/fivem_drogues`)
2. Ajoutez cette ligne dans votre `server.cfg` :
   ```bash
   ensure ynk_drugDealer

---

## 🔐 Licence
Ce script est open-source. Merci de respecter l’auteur original si vous le modifiez ou redistribuez. Aucune revente non autorisée.
