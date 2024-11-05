local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()

local Window = Library.CreateLib("Name", "RJTheme3") 
local Tab = Window:NewTab("TabName")
local Section = Tab:NewSection("Section Name")
local items_count = {}
local plr = game:GetService("Players").LocalPlayer
local local_plr_living
local GlobArcState
local GlobSellerState
local GlobItemsCollectorState
for i,v in pairs(game:GetService("Workspace").Living:GetChildren()) do
    if v.Name == plr.Name then
        local_plr_living = v --local name obtain
        break
    end
end


Section:NewLabel("Test")


Section:NewToggle("Arcade roll", "ButtonInfo", function(ArcState)
    GlobArcState = ArcState
    if GlobArcState then
        print("Auto arcade roller is On")
    end
    while GlobArcState do
        Npc_dialogue("Item Machine","Option1", "Dialogue1")
        wait(0.2)
        if not GlobArcState then
            print("Auto arcade roller is Off")
            break
        end
    end
end)



Section:NewButton("Backpack print", "ButtonInfo", function()
    items_count = Items_counter()
    for i in ipairs(items_count) do
        print(items_count[i].id, items_count[i].count)
    end
end)


Section:NewButton("Sell 1 item", "ButtonInfo", function()
    Npc_dialogue("Merchant", "Option1", "Dialogue5")
end)


Section:NewButton("Sell all items", "ButtonInfo", function()
    Npc_dialogue("Merchant", "Option2", "Dialogue5")
end)


Section:NewToggle("ToggleSeller", "ToggleInfo", function(SellerState)
    GlobSellerState = SellerState
    local PickedItemUp
    if GlobSellerState then
        print("Seller is On")
    end

    while GlobSellerState do
        items_count = Items_counter()
        wait(0.5)
        for i,v in pairs(items_count) do
            wait(0.01)
            if v.count > 8 and v.id ~= "Christmas Present" then
                PickedItemUp = v.id
                print(PickedItemUp)
                wait(0.01)
                break
            end
        end
        
        for i,v in pairs(plr.Backpack:GetChildren()) do
            if v.Name == PickedItemUp and PickedItemUp ~= nil then
                print(v.Name, "Found! Selling...")
                v.Parent = local_plr_living
                Npc_dialogue("Merchant", "Option2", "Dialogue5")
                PickedItemUp = nil
                break
            end
        end

        if not GlobSellerState then
            print("Seller is Off")
            break
        end
    end
end)


Section:NewToggle("ToggleItemsCollector", "ToggleInfo", function(ItemsCollectorState)
    GlobItemsCollectorState = ItemsCollectorState
    if GlobItemsCollectorState then
        print("ItemsCollector is On")
    end
    while GlobItemsCollectorState do
        ItemPart = Find_item_model()
        print(ItemPart.MeshPart.CFrame)
        Teleport_player_to(ItemPart.MeshPart.CFrame)
        wait(1)
        Press_E(ItemPart)
        wait(4)
        -- ItemPart.Name = "ModelDel"
        if not GlobItemsCollectorState then
            print("ItemsCollector is Off")
            break
        end
    end

end)


function Press_E(Item)
    for i,v in pairs(Item:GetChildren()) do
        if v.name == "ProximityPrompt" then
            local Event = v.RemoteEvent
            Event:FireServer()
		end
	end
    Event:FireServer()
    wait(2)

end


function Find_item_model()
    local ItemsOnServer = 0
    ItemsOnServer = 0
    -- game:GetService("Workspace")["Item_Spawns"].Items:WaitForChild("Model")
    while true do
        for i,v in pairs(game:GetService("Workspace")["Item_Spawns"].Items:GetChildren()) do
            ItemsOnServer = ItemsOnServer + 1
        end
        wait(0.01)
        if ItemsOnServer ~= 0 then
            print("ItemsOnServer", ItemsOnServer)
            break
        end
    end 


    for i,v in pairs(game:GetService("Workspace")["Item_Spawns"].Items:GetChildren()) do
        return v
    end
end


function Find_ESP_part()
    for i,v in pairs(game:GetService("Workspace").ESP_Parts:GetChildren()) do
        if v.itemName_Billboard.itenName.Text == "Rokakaka" then
            return v
        end
    end
end


function Teleport_player_to(CFrame)
    local_plr_living.HumanoidRootPart.CFrame = CFrame
end


function Npc_dialogue(Npc, Option, Dialogue)
    local A_1 = "EndDialogue"
    local A_2 =
    {
        ["NPC"] = Npc, 
        ["Option"] = Option, 
        ["Dialogue"] = Dialogue
    }

    local Event = game:GetService("Workspace").Living:WaitForChild(plr.Name).RemoteEvent
    Event:FireServer(A_1, A_2)
end


function Items_counter()
    local result = {}
    for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        result[i] = {id=v.Name}
    end
    local t, old_result = {}, result
    result = {} 
    for _, v in ipairs(old_result) do
        local h = v.id..'\0'
        v = t[h] or table.insert(result, v) or v
        t[h], v.count = v, (v.count or 0) + 1
    end
    return result
end