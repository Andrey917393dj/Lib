loadstring(game:HttpGetAsync("https://icebear.lol/StandUpright/LIB.txt"))()

local Workspace = game.Workspace

OpenLibrary("Arctic")

AddMenu("Home")
AddText("Discord: https://discord.gg/mGfgkPN37X", "Home")
AddText("Contact: Polarrr#1912", "Home")

AddMenu("LocalPlayer")
AddButton("Open Stand Storage", "LocalPlayer", function()
    game:GetService("Workspace").Map.NPCs.admpn.Done:FireServer()
end)

AddButton("Use Stand Arrow", "LocalPlayer", function()
    if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Stand Arrow") then
        game:GetService("Players").LocalPlayer.Character.Humanoid:EquipTool(game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Stand Arrow"))
        game:GetService("Players").LocalPlayer.Character:WaitForChild("Stand Arrow"):WaitForChild("Use"):FireServer()
    end
end)

AddButton("Use Charged Arrow", "LocalPlayer", function()
    if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Charged Arrow") then
        game:GetService("Players").LocalPlayer.Character.Humanoid:EquipTool(game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Charged Arrow"))
        game:GetService("Players").LocalPlayer.Character:WaitForChild("Charged Arrow"):WaitForChild("Use"):FireServer()
    end
end)

AddButton("Use Requiem Arrow", "LocalPlayer", function()
    if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Requiem Arrow") then
        game:GetService("Players").LocalPlayer.Character.Humanoid:EquipTool(game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Requiem Arrow"))
        game:GetService("Players").LocalPlayer.Character:WaitForChild("Requiem Arrow"):WaitForChild("Use"):FireServer()
    end
end)

AddButton("Use Rokakaka", "LocalPlayer", function()
    if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rokakaka") then
        game:GetService("Players").LocalPlayer.Character.Humanoid:EquipTool(game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rokakaka"))
        game:GetService("Players").LocalPlayer.Character:WaitForChild("Rokakaka"):WaitForChild("Use"):FireServer()
    end
end)

AddButton("Use Rotten Rokakaka", "LocalPlayer", function()
    if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rotten Rokakaka") then
        game:GetService("Players").LocalPlayer.Character.Humanoid:EquipTool(game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rotten Rokakaka"))
        game:GetService("Players").LocalPlayer.Character:WaitForChild("Rotten Rokakaka"):WaitForChild("Use"):FireServer()
    end
end)

local AutoUmbrella = false
AddToggle("Auto Umbrella", "LocalPlayer", function()
    AutoUmbrella = not AutoUmbrella
    
    if AutoUmbrella then
        while AutoUmbrella == true and task.wait() do
            pcall(function()
                if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Umbrella") and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Umbrella") then
                    game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart")
                    game:GetService("Players").LocalPlayer.Character.Humanoid:EquipTool(game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Umbrella"))
                end
            end)
        end
    end
end)

local AntiAFK = false
AddToggle("Anti AFK", "LocalPlayer", function()
    AntiAFK = not AntiAFK
end)

local VirtualUser = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:Connect(function()
    if AntiAFK == true then
        VirtualUser:Button2Down(Vector2.new(0, 0), game:GetService("Workspace").CurrentCamera.CFrame)
        task.wait(1)
        VirtualUser:Button2Up(Vector2.new(0, 0), game:GetService("Workspace").CurrentCamera.CFrame)
    end
end)

AddMenu("Shops")
AddText("Selling", "Shops")
local SellKetchup = false
AddToggle("Auto Sell Ketchup", "Shops", function()
    SellKetchup = not SellKetchup
    
    if SellKetchup then
        game:GetService("ReplicatedStorage").Events.SellKetchup:FireServer("Lots")
        while SellKetchup and task.wait() do
            pcall(function()
            game:GetService("Players").LocalPlayer.Backpack:WaitForChild("Ketchup")
            game:GetService("ReplicatedStorage").Events.SellKetchup:FireServer("Lots")
            end)
        end
    end
end)

AddBar("Shops", {})

AddText("Autobuy Only Works For Level 200+", "Shops", {})
local Amount = 0
AddTextBox("Count", "Shops", {CustomText = "Amount"}, function(A)
    if tonumber(A) then
        if tonumber(A) >= 1 then
            Amount = tonumber(A)
            CreateNotification("Arctic", "Amount Set To : "..tostring(Amount), {})
        else
            CreateNotification("Arctic", "Please Set The Number Above 0+", {})
        end
    end
end)

local AllItems = {"Rokakaka", "New Rokakaka", "Requiem Arrow", "Stand Arrow", "Dio's Diary", "Charged Arrow"}
for i = 1, #AllItems do
    task.spawn(function()
        local Item = AllItems[i]
        local Event = game:GetService("ReplicatedStorage").Events["SM_Event"]
        AddButton("Purchase: "..Item, "Shops", function()
            local OldPos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.NPCs.StockMarket.Head.CFrame * CFrame.new(0, 3, 0)
            Event:FireServer("Buy", Item, Amount)
            task.wait(0.5)
            fireproximityprompt(game:GetService("Workspace").Map.NPCs.StockMarket.TalkToPrompt)
            task.wait(0.5)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = OldPos
            firesignal(game:GetService("Players")["polar_eXDAVH"].PlayerGui.newStockMarketGUI["SM_Frame"].ExitButton.MouseButton1Click)
        end)
    end)
end

local AllMovesets = {}
local ClearMoves = {}

AddMenu("Farm Settings")
AddText("Movesets", "Farm Settings")
AddButton("Refresh Movesets", "Farm Settings", function()
    for i = 1, #ClearMoves do
        pcall(function()
            Delete(ClearMoves[i])
        end)
    end

    AllMovesets = {}

    for i, v in ipairs(game.Players.LocalPlayer.Character.StandEvents:GetChildren()) do
        if v:IsA("RemoteEvent") and v.Name ~= "Summon" then
            table.insert(ClearMoves, v.Name)
            task.spawn(function()
                local Move = false
                AddToggle(v.Name, "Farm Settings", function()
                    Move = not Move
                    if Move then
                        table.insert(AllMovesets, v.Name)
                    else
                        table.remove(AllMovesets, table.find(AllMovesets, v.Name))
                    end
                end)
            end)
        end
    end
end)

local UseCustomMoves = false
AddToggle("Use Custom Moves", "Farm Settings", function()
    UseCustomMoves = not UseCustomMoves
end)

AddBar("Farm Settings", {})

AddMenu("Boss Farm")
AddText("Settings", "Boss Farm")

local BossDistance = 4
AddTextBox("Distance", "Boss Farm", {}, function(Input)
    BossDistance = tonumber(Input)
end)

local BossUnderneath = false
AddToggle("Underneath", "Boss Farm", function()
    BossUnderneath = not BossUnderneath
end)

AddBar("Boss Farm", {})

local FarmJOH = false
AddToggle("Farm: Jotaro Over Heaven", "Boss Farm", function()
    FarmJOH = not FarmJOH

    if FarmJOH then
        while FarmJOH and task.wait() do
            repeat task.wait() until game.Workspace.Living:FindFirstChild("Jotaro Over Heaven")

            if FarmJOH then
                repeat
                    task.wait()
                    pcall(function()
                        if UseCustomMoves == false then
                            for i, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.CDgui.fortnite:GetChildren()) do
                                if v:IsA("Frame") and v.Textt.Text == "Punch" then
                                    -- Polar Was Here!
                                else
                                    game:GetService("Players").LocalPlayer.Character.StandEvents.M1:FireServer()
                                end
                            end
                        else
                            if game.Players.LocalPlayer.Character.MoveCD.Value == false then
                                local SelectedMove = AllMovesets[math.random(1, #AllMovesets)]
                                for i, v in ipairs(game.Players.LocalPlayer.Character.StandEvents:GetChildren()) do
                                    if v.Name == SelectedMove then
                                        v:FireServer(true)
                                    end
                                end
                            end
                        end

                        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Aura").Value == false then
                            game:GetService("Players").LocalPlayer.Character.StandEvents.Summon:FireServer()
                        end
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Stand") and game:GetService("Players").LocalPlayer.Character:FindFirstChild("Stand"):FindFirstChild("HumanoidRootPart") then
                            game:GetService("Players").LocalPlayer.Character.Stand:FindFirstChild("HumanoidRootPart").CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
                        end
                        
                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                        if BossUnderneath then
                            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Living:FindFirstChild("Jotaro Over Heaven"):WaitForChild("HumanoidRootPart").CFrame * CFrame.new(0, -BossDistance, BossDistance, 1, 0, 0, 1)
                        else
                            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Living:FindFirstChild("Jotaro Over Heaven"):WaitForChild("HumanoidRootPart").CFrame * CFrame.new(0, 0, BossDistance)
                        end
                    end)
                until FarmJOH == false or not game.Workspace.Living:FindFirstChild("Jotaro Over Heaven")
            end
        end
    end
end)

local FarmJJ = false
AddToggle("Farm: Johnny Joestar", "Boss Farm", function()
    FarmJJ = not FarmJJ

    if FarmJJ then
        while FarmJJ and task.wait() do
            repeat task.wait() until game.Workspace.Living:FindFirstChild("JohnnyJoestar")

            if FarmJJ then
                repeat
                    task.wait()
                    pcall(function()
                        if UseCustomMoves == false then
                            for i, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.CDgui.fortnite:GetChildren()) do
                                if v:IsA("Frame") and v.Textt.Text == "Punch" then
                                    -- Polar Was Here!
                                else
                                    game:GetService("Players").LocalPlayer.Character.StandEvents.M1:FireServer()
                                end
                            end
                        else
                            if game.Players.LocalPlayer.Character.MoveCD.Value == false then
                                local SelectedMove = AllMovesets[math.random(1, #AllMovesets)]
                                for i, v in ipairs(game.Players.LocalPlayer.Character.StandEvents:GetChildren()) do
                                    if v.Name == SelectedMove then
                                        v:FireServer(true)
                                    end
                                end
                            end
                        end

                        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Aura").Value == false then
                            game:GetService("Players").LocalPlayer.Character.StandEvents.Summon:FireServer()
                        end
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Stand") and game:GetService("Players").LocalPlayer.Character:FindFirstChild("Stand"):FindFirstChild("HumanoidRootPart") then
                            game:GetService("Players").LocalPlayer.Character.Stand:FindFirstChild("HumanoidRootPart").CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
                        end
                        
                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                        if BossUnderneath then
                            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Living:FindFirstChild("JohnnyJoestar"):WaitForChild("HumanoidRootPart").CFrame * CFrame.new(0, -BossDistance, BossDistance, 1, 0, 0, 1)
                        else
                            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Living:FindFirstChild("JohnnyJoestar"):WaitForChild("HumanoidRootPart").CFrame * CFrame.new(0, 0, BossDistance)
                        end
                    end)
                until FarmJJ == false or not game.Workspace.Living:FindFirstChild("JohnnyJoestar")
            end
        end
    end
end)

local FarmAJP4 = false
AddToggle("Farm: Jotaro Part 4", "Boss Farm", function()
    FarmAJP4 = not FarmAJP4

    if FarmAJP4 then
        while FarmAJP4 and task.wait() do
            repeat task.wait() until game.Workspace.Living:FindFirstChild("Alternate Jotaro Part 4")

            if FarmAJP4 then
                repeat
                    task.wait()
                    pcall(function()
                        if UseCustomMoves == false then
                            for i, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.CDgui.fortnite:GetChildren()) do
                                if v:IsA("Frame") and v.Textt.Text == "Punch" then
                                    -- Polar Was Here!
                                else
                                    game:GetService("Players").LocalPlayer.Character.StandEvents.M1:FireServer()
                                end
                            end
                        else
                            if game.Players.LocalPlayer.Character.MoveCD.Value == false then
                                local SelectedMove = AllMovesets[math.random(1, #AllMovesets)]
                                for i, v in ipairs(game.Players.LocalPlayer.Character.StandEvents:GetChildren()) do
                                    if v.Name == SelectedMove then
                                        v:FireServer(true)
                                    end
                                end
                            end
                        end

                        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Aura").Value == false then
                            game:GetService("Players").LocalPlayer.Character.StandEvents.Summon:FireServer()
                        end
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Stand") and game:GetService("Players").LocalPlayer.Character:FindFirstChild("Stand"):FindFirstChild("HumanoidRootPart") then
                            game:GetService("Players").LocalPlayer.Character.Stand:FindFirstChild("HumanoidRootPart").CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
                        end
                        
                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                        if BossUnderneath then
                            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Living:FindFirstChild("Alternate Jotaro Part 4"):WaitForChild("HumanoidRootPart").CFrame * CFrame.new(0, -BossDistance, BossDistance, 1, 0, 0, 1)
                        else
                            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Living:FindFirstChild("Alternate Jotaro Part 4"):WaitForChild("HumanoidRootPart").CFrame * CFrame.new(0, 0, BossDistance)
                        end
                    end)
                until FarmAJP4 == false or not game.Workspace.Living:FindFirstChild("Alternate Jotaro Part 4")
            end
        end
    end
end)

AddMenu("Lair Farm")
AddText("Selected Lair NPC: None", "Lair Farm")
AddButton("Tutorial", "Lair Farm", function()
    CreateNotification("Arctic", "Step 1 (Quest Selection), Stand Near Lair NPC And Press 'Select Lair NPC'", {})
end)

AddBar("Lair Farm", {})

local SelectedLairNPC
local SelectedLairNPCText = "None"
AddButton("Select Lair NPC", "Lair Farm", function()
    for i, v in pairs(Workspace.Map.NPCs:GetChildren()) do
        if v:FindFirstChild("HumanoidRootPart") then
            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude < 15 then
                EditString("Selected Lair NPC: "..SelectedLairNPCText, "Selected Lair NPC: "..v.Head:FindFirstChild("Main").Text.Text)
                
                SelectedLairNPC = v
                SelectedLairNPCText = v.Head:FindFirstChild("Main").Text.Text
            end
        end
    end
end)

AddBar("Lair Farm", {})

local LairDistance = 4
AddText("Farming Position", "Lair Farm")
AddTextBox("Set Distance: ", "Lair Farm", {CustomText = "Default: 4"}, function(Input)
    LairDistance = tonumber(Input)
end)

local Underneath = false
AddToggle("Underneath", "Lair Farm", function()
    Underneath = not Underneath
end)

AddBar("Lair Farm", {})

function TriggerLair()
    local Done
    for i, v in pairs(SelectedLairNPC:GetChildren()) do
        if v.Name == "Done" then
            Done = v
        end
    end
    
    if Done then
        Done:FireServer()
    else
        CreateNotification("Arctic", "Error Grabbing Remote 2", {})
    end
end

local ShortPause = false
AddToggle("Use Pausing", "Lair Farm", function()
	ShortPause = not ShortPause
end)

local PauseTimer = 1
AddTextBox("Pause Length", "Lair Farm", {}, function(Input)
    PauseTimer = tonumber(Input)
end)

AddBar("Lair Farm", {})

local StartLairFarming = false
AddToggle("Begin Lair Farm", "Lair Farm", function()
    StartLairFarming = not StartLairFarming
    
    if StartLairFarming then
        if SelectedLairNPC then
            while StartLairFarming and task.wait() do
                pcall(function()
                    repeat
                        TriggerLair()
                        task.wait()
                    until game:GetService("Workspace").Living:FindFirstChild("Boss")

                    if ShortPause == true then
                		task.wait(PauseTimer)	
                	end

                    repeat
                        task.wait()
                        pcall(function()
                            if UseCustomMoves == false then
                                for i, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.CDgui.fortnite:GetChildren()) do
                                    if v:IsA("Frame") and v.Textt.Text == "Punch" then
                                        -- Polar Was Here!
                                    else
                                        game:GetService("Players").LocalPlayer.Character.StandEvents.M1:FireServer()
                                    end
                                end
                            else
                                if game.Players.LocalPlayer.Character.MoveCD.Value == false then
                                    local SelectedMove = AllMovesets[math.random(1, #AllMovesets)]
                                    for i, v in ipairs(game.Players.LocalPlayer.Character.StandEvents:GetChildren()) do
                                        if v.Name == SelectedMove then
                                            v:FireServer(true)
                                        end
                                    end
                                end
                            end

                            if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Aura").Value == false then
                                game:GetService("Players").LocalPlayer.Character.StandEvents.Summon:FireServer()
                            end
                            if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Stand") and game:GetService("Players").LocalPlayer.Character:FindFirstChild("Stand"):FindFirstChild("HumanoidRootPart") then
                                game:GetService("Players").LocalPlayer.Character.Stand:FindFirstChild("HumanoidRootPart").CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
                            end
                            
                            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                            Workspace.Living:FindFirstChild("Boss").Humanoid.Health = 0
                            if Underneath then
                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Living:FindFirstChild("Boss"):FindFirstChild("HumanoidRootPart").CFrame * CFrame.new(0, -LairDistance, LairDistance, 1, 0, 0, 1)
                            else
                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Living:FindFirstChild("Boss"):FindFirstChild("HumanoidRootPart").CFrame * CFrame.new(0, 0, LairDistance)
                            end
                        end)
                    until not Workspace.Living:FindFirstChild("Boss") or StartLairFarming == false
                        
                    if ShortPause == true then
                		task.wait(PauseTimer)	
                	end
                end)
            end
        else
            CreateNotification("Arctic", "You Are Missing A Step! Please Check Tutorial Then Re-Enable!")
        end
    end
end)

AddMenu("Quest Farm")
AddText("Selected Quest NPC: None", "Quest Farm")
AddText("Selected NPC: None", "Quest Farm")

AddButton("Tutorial", "Quest Farm", function()
    CreateNotification("Arctic", "Step 1 (Quest Selection), Stand Near Quest NPC And Press 'Select Quest NPC'", {})
    task.wait(5)
    CreateNotification("Arctic", "Step 2 (NPC Selection), Stand Near NPC To Kill And Press 'Select NPC", {})
end)

local SelectedQuestNPC
local SelectedQuestNPCText = "None"
local SelectedNPC = "None"
AddBar("Quest Farm", {})

AddButton("Select Quest NPC", "Quest Farm", function()
    for i, v in pairs(Workspace.Map.NPCs:GetChildren()) do
        if v:FindFirstChild("HumanoidRootPart") then
            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude < 15 then
                EditString("Selected Quest NPC: "..SelectedQuestNPCText, "Selected Quest NPC: "..v.Head:FindFirstChild("Main").Text.Text)
                
                SelectedQuestNPC = v
                SelectedQuestNPCText = v.Head:FindFirstChild("Main").Text.Text
            end
        end
    end
end)

AddButton("Select NPC", "Quest Farm", function()
    for i, v in pairs(Workspace.Living:GetChildren()) do
        if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("AI") then
            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude < 15 then
                EditString("Selected NPC: "..SelectedNPC, "Selected NPC: "..v.Name)
                
                SelectedNPC = v.Name
            end
        end
    end
end)

local OnlyFarmNPC = false
AddToggle("Only Farm NPC", "Quest Farm", function()
    OnlyFarmNPC = not OnlyFarmNPC
end)

AddBar("Quest Farm", {})

local QuestDistance = 4
AddText("Farming Position", "Quest Farm")
AddTextBox("Set Distance: ", "Quest Farm", {CustomText = "Default: 4"}, function(Input)
    QuestDistance = tonumber(Input)
end)

local QUnderneath = false
AddToggle("Underneath", "Quest Farm", function()
    QUnderneath = not QUnderneath
end)

AddBar("Quest Farm", {})

local function TriggerQuest()
    local QuestDone
    local Done
    for i, v in pairs(SelectedQuestNPC:GetChildren()) do
        if v.Name == "QuestDone" then
            QuestDone = v
        elseif v.Name == "Done" then
            Done = v
        end
    end
    
    if QuestDone then
        QuestDone:FireServer()
    else
        CreateNotification("Arctic", "Error Grabbing Remote 1", {})
    end
    
    if Done then
        Done:FireServer()
    else
        CreateNotification("Arctic", "Error Grabbing Remote 2", {})
    end
end

local StartQuestFarming = false
AddToggle("Begin Quest Farm", "Quest Farm", function()
    StartQuestFarming = not StartQuestFarming
    
    if StartQuestFarming then
        if SelectedQuestNPC and SelectedNPC ~= "None" or OnlyFarmNPC == true and SelectedNPC ~= "None" then
            while StartQuestFarming and task.wait() do
                pcall(function()
                    for i, v in pairs(Workspace.Living:GetChildren()) do
                        if v.Name == SelectedNPC and v.Humanoid.Health ~= 0 then
                            if OnlyFarmNPC == false then
                                TriggerQuest()
                            end
                            repeat
                                task.wait()
                                if UseCustomMoves == false then
                                    for i, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.CDgui.fortnite:GetChildren()) do
                                        if v:IsA("Frame") and v.Textt.Text == "Punch" then
                                            -- Polar Was Here!
                                        else
                                            game:GetService("Players").LocalPlayer.Character.StandEvents.M1:FireServer()
                                        end
                                    end
                                else
                                    if game.Players.LocalPlayer.Character.MoveCD.Value == false then
                                        local SelectedMove = AllMovesets[math.random(1, #AllMovesets)]
                                        for i, v in ipairs(game.Players.LocalPlayer.Character.StandEvents:GetChildren()) do
                                            if v.Name == SelectedMove then
                                                v:FireServer(true)
                                            end
                                        end
                                    end
                                end
                                
	                            if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Stand") and game:GetService("Players").LocalPlayer.Character:FindFirstChild("Stand"):FindFirstChild("HumanoidRootPart") then
	                                game:GetService("Players").LocalPlayer.Character.Stand:FindFirstChild("HumanoidRootPart").CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
	                            end
                                
                                if QUnderneath then
                                    game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = v:FindFirstChild("HumanoidRootPart").CFrame * CFrame.new(0, -6, QuestDistance, 1, 0, 0, 1)
                                else
                                    game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = v:FindFirstChild("HumanoidRootPart").CFrame * CFrame.new(0, 0, QuestDistance)
                                end
                                game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                                if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Aura").Value == false then
                                    game:GetService("Players").LocalPlayer.Character.StandEvents.Summon:FireServer()
                                end
                            until v.Humanoid.Health == 0 or StartQuestFarming == false
                            
                            if OnlyFarmNPC == false then
                                TriggerQuest()
                            end
                            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0, 0, 1000))
                            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0, 10, 0))
                        end
                    end
                end)
            end
        else
            CreateNotification("Arctic", "You Are Missing A Step! Please Check Tutorial Then Re-Enable!")
        end
    end
end)

AddMenu("Item Farm")

AddText("Farm Methods", "Item Farm")
AddBar("Item Farm", {})

local FarmMethod = 0
AddText("Current Method: None", "Item Farm")

AddButton("Instant", "Item Farm", function()
    if FarmMethod == 2 then
        EditString("Current Method: Legit", "Current Method: Instant")
    elseif FarmMethod == 0 then
        EditString("Current Method: None", "Current Method: Instant")
    end
    FarmMethod = 1
end)

AddButton("Legit", "Item Farm", function()
    if FarmMethod == 1 then
        EditString("Current Method: Instant", "Current Method: Legit")
    elseif FarmMethod == 0 then
        EditString("Current Method: None", "Current Method: Legit")
    end
    FarmMethod = 2
end)

AddBar("Item Farm", {})

local StartFarming = false
AddToggle("Start Farming", "Item Farm", function()
    StartFarming = not StartFarming
    
    if StartFarming then
        if FarmMethod == 1 or FarmMethod == 2 then
            if FarmMethod == 1 then
                for i, v in pairs(Workspace.Vfx:GetChildren()) do
                    if v:IsA("Tool") then
                        if v:FindFirstChildOfClass("MeshPart") then
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v:FindFirstChildOfClass("MeshPart").CFrame 
                        elseif v:FindFirstChildOfClass("Part") then
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v:FindFirstChildOfClass("Part").CFrame 
                        end
                        local ProximityPrompt
                        for i, v2 in pairs(v:GetDescendants()) do
                            if v2:IsA("ProximityPrompt") then
                                ProximityPrompt = v2
                            end
                        end
                        fireproximityprompt(ProximityPrompt)
                    end
                end
                
                while StartFarming == true and task.wait() do
                    pcall(function()
                        for i, v in pairs(Workspace.Vfx:GetChildren()) do
                            if v:IsA("Tool") then
                                if v:FindFirstChildOfClass("MeshPart") then
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v:FindFirstChildOfClass("MeshPart").CFrame 
                                elseif v:FindFirstChildOfClass("Part") then
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v:FindFirstChildOfClass("Part").CFrame 
                                end
                                local ProximityPrompt
                                for i, v2 in pairs(v:GetDescendants()) do
                                    if v2:IsA("ProximityPrompt") then
                                        ProximityPrompt = v2
                                    end
                                end
                                fireproximityprompt(ProximityPrompt)
                            end
                        end
                    end)
                end
            end
            
            if FarmMethod == 2 then
                game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 30
                pcall(function()
                    for i, v in pairs(Workspace.Vfx:GetChildren()) do
                        if v:IsA("Tool") then
                            local WalkTo
                            if v:FindFirstChildOfClass("MeshPart") then
                                WalkTo = v:FindFirstChildOfClass("MeshPart").CFrame 
                            elseif v:FindFirstChildOfClass("Part") then
                                WalkTo = v:FindFirstChildOfClass("Part").CFrame 
                            end
                            
                            local ProximityPrompt
                            for i, v2 in pairs(v:GetDescendants()) do
                                if v2:IsA("ProximityPrompt") then
                                    ProximityPrompt = v2
                                end
                            end
                            
                            local PathfindingService = game:GetService("PathfindingService")
                            local Path = PathfindingService:CreatePath()
                            Path:ComputeAsync(game.Players.LocalPlayer.Character.HumanoidRootPart.Position, WalkTo.Position)
                            
                            local agentParams = {
                                AgentCanJump = true,
                            }
                            
                            local Waypoints = Path:GetWaypoints(agentParams)
                            
                            local RunAnimation = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game.Players.LocalPlayer.Character.SprintHandler.SprintAnim)
                            RunAnimation:Play()
                            
                            for i, Waypoint in pairs(Waypoints) do
                                game.Players.LocalPlayer.Character.Humanoid:MoveTo(Waypoint.Position)
                                
                                if Waypoint.Action == Enum.PathWaypointAction.Jump then
                                    game.Players.LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                                end
                                
                                game.Players.LocalPlayer.Character.Humanoid.MoveToFinished:Wait()
                            end
                            
                            RunAnimation:Stop()
                            fireproximityprompt(ProximityPrompt)
                        end
                    end
                end)
                
                while StartFarming == true and task.wait() do
                    pcall(function()
                        for i, v in pairs(Workspace.Vfx:GetChildren()) do
                            if v:IsA("Tool") then
                                local WalkTo
                                if v:FindFirstChildOfClass("MeshPart") then
                                    WalkTo = v:FindFirstChildOfClass("MeshPart").CFrame 
                                elseif v:FindFirstChildOfClass("Part") then
                                    WalkTo = v:FindFirstChildOfClass("Part").CFrame 
                                end
                                
                                local ProximityPrompt
                                for i, v2 in pairs(v:GetDescendants()) do
                                    if v2:IsA("ProximityPrompt") then
                                        ProximityPrompt = v2
                                    end
                                end
                                
                                local PathfindingService = game:GetService("PathfindingService")
                                local Path = PathfindingService:CreatePath()
                                Path:ComputeAsync(game.Players.LocalPlayer.Character.HumanoidRootPart.Position, WalkTo.Position)
                                
                                local agentParams = {
                                    AgentCanJump = true,
                                }
                                
                                local Waypoints = Path:GetWaypoints(agentParams)
                                
                                local RunAnimation = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game.Players.LocalPlayer.Character.SprintHandler.SprintAnim)
                                RunAnimation:Play()
                                
                                for i, Waypoint in pairs(Waypoints) do
                                    game.Players.LocalPlayer.Character.Humanoid:MoveTo(Waypoint.Position)
                                    
                                    if Waypoint.Action == Enum.PathWaypointAction.Jump then
                                        game.Players.LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                                    end
                                    
                                    game.Players.LocalPlayer.Character.Humanoid.MoveToFinished:Wait()
                                end
                                
                                RunAnimation:Stop()
                                fireproximityprompt(ProximityPrompt)
                            end
                        end
                    end)
                end
            end
        else
            CreateNotification("Arctic", "Select A Farm Method, And Re-Enable!", {})
        end
    else
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
    end
end)

AddMenu("Teleports")

AddBar("Teleports", {})

AddTextBox("Teleport To", "Teleports", {CustomText = "Player Name"}, function(A)
    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[Fill(A)].Character.HumanoidRootPart.CFrame
    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Stand") then
        game:GetService("Players").LocalPlayer.Character:FindFirstChild("Stand").HumanoidRootPart.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
    end
end)

AddTextBox("Teleport Above To : ", "Teleports", {CustomText = "Player Name"}, function(A)
    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[Fill(A)].Character.HumanoidRootPart.CFrame * CFrame.new(0, 25, 0)
    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Stand") then
        game:GetService("Players").LocalPlayer.Character:FindFirstChild("Stand").HumanoidRootPart.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
    end
end)

AddBar("Teleports", {})

AddButton("D4C Dimension", "Teleports", function()
    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(11927.1, -3.28935, -4488.59)
    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Stand") then
        game:GetService("Players").LocalPlayer.Character:FindFirstChild("Stand").HumanoidRootPart.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
    end
end)

AddButton("Rarity Boards", "Teleports", function()
    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-658.979, 67.0282, -451.495)
    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Stand") then
        game:GetService("Players").LocalPlayer.Character:FindFirstChild("Stand").HumanoidRootPart.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
    end
end)

AddButton("Stand Storage Room", "Teleports", function()
    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-393.893, 23.5808, -280.786)
    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Stand") then
        game:GetService("Players").LocalPlayer.Character:FindFirstChild("Stand").HumanoidRootPart.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
    end
end)

AddButton("Inner Sanctum", "Teleports", function()
    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(27877.87109375, 27.233600616455078, -147.72268676757812)
    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Stand") then
        game:GetService("Players").LocalPlayer.Character:FindFirstChild("Stand").HumanoidRootPart.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
    end
end)

AddButton("Mud Pit", "Teleports", function()
    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(17.0716, 66.9873, -246.13)
    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Stand") then
        game:GetService("Players").LocalPlayer.Character:FindFirstChild("Stand").HumanoidRootPart.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
    end
end)

AddButton("Hamon Dealer", "Teleports", function()
    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-801.427, 66.5359, -735.121)
    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Stand") then
        game:GetService("Players").LocalPlayer.Character:FindFirstChild("Stand").HumanoidRootPart.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
    end
end)

AddButton("Vehicle Man", "Teleports", function()
    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-187.042, 78.4486, -1076.25)
    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Stand") then
        game:GetService("Players").LocalPlayer.Character:FindFirstChild("Stand").HumanoidRootPart.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
    end
end)

AddButton("Testing Zone", "Teleports", function()
    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(19999.3, 100.155, -730.726)
    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Stand") then
        game:GetService("Players").LocalPlayer.Character:FindFirstChild("Stand").HumanoidRootPart.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
    end
end)

AddButton("Bad Gi Spawn", "Teleports", function()
    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-687.604736328125, 67.03131866455078, -837.9588623046875)
    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Stand") then
        game:GetService("Players").LocalPlayer.Character:FindFirstChild("Stand").HumanoidRootPart.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
    end
end)

AddButton("Scary Monster Cave", "Teleports", function()
    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-683.89794921875, 67.03133392333984, -1039.75634765625)
    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Stand") then
        game:GetService("Players").LocalPlayer.Character:FindFirstChild("Stand").HumanoidRootPart.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
    end
end)

AddButton("Sewer", "Teleports", function()
    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-5308.6455078125, -450.83184814453125, -3815.388427734375)
    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Stand") then
        game:GetService("Players").LocalPlayer.Character:FindFirstChild("Stand").HumanoidRootPart.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
    end
end)

AddButton("Yoshikage Kira Spawn", "Teleports", function()
    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-446.5094299316406, 67.03131103515625, -995.3768310546875)
    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Stand") then
        game:GetService("Players").LocalPlayer.Character:FindFirstChild("Stand").HumanoidRootPart.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
    end
end)

AddButton("Dio's Rock", "Teleports", function()
    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-37.414466857910156, 92.30691528320312, -804.2440185546875)
    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Stand") then
        game:GetService("Players").LocalPlayer.Character:FindFirstChild("Stand").HumanoidRootPart.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
    end
end)

AddButton("Gyro Zeppeli", "Teleports", function()
    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(57.21436309814453, 66.80048370361328, -216.83428955078125)
    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Stand") then
        game:GetService("Players").LocalPlayer.Character:FindFirstChild("Stand").HumanoidRootPart.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
    end
end)

AddBar("Teleports", {})
AddText("NPC's", "Teleports")

for i, v in ipairs(game:GetService("Workspace").Map.NPCs:GetChildren()) do
    task.spawn(function()
        if v:FindFirstChild("Head") and v:FindFirstChild("Head"):FindFirstChild("Main") and v:FindFirstChild("Head"):FindFirstChild("Sub") then
            AddButton(v.Head.Main.Text.Text.." ["..v.Head.Sub.Text.Text.."]", "Teleports", function()
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.Head.Position + Vector3.new(0, 3, 0))
            end)
        end
    end)
end

AddMenu("Stand Farm")

AddSearchBar("Stand Farm")

AddBar("Stand Farm", {})
AddText("Checking Configuration", "Stand Farm")

local StandCheck = false
AddToggle("Enable Stand Check", "Stand Farm", function()
    StandCheck = not StandCheck
end)

local AttributeCheck = false
AddToggle("Enable Attribute Check", "Stand Farm", function()
    AttributeCheck = not AttributeCheck
end)

local SplitChecking = false
AddToggle("Split Checking", "Stand Farm", function()
    SplitChecking = not SplitChecking
end)

AddBar("Stand Farm", {})
AddText("Extra Settings", "Stand Farm")

local UseStandArrows = true
local UseChargedArrows = false
local UseKarsMask = false
AddButton("Use Stand Arrows", "Stand Farm", function()
    UseStandArrows = true
    UseChargedArrows = false
    UseKarsMask = false
end)

AddButton("Use Charged Arrows", "Stand Farm", function()
    UseStandArrows = false
    UseChargedArrows = true
    UseKarsMask = false
end)

AddButton("Use Kars Mask", "Stand Farm", function()
    UseStandArrows = false
    UseChargedArrows = false
    UseKarsMask = true
end)

local AutoBuyArrows = false
AddToggle("Auto Buy Selected Arrows", "Stand Farm", function()
    AutoBuyArrows = not AutoBuyArrows
end)

local AutoBuyRokakaka = false
AddToggle("Auto Buy Rokakaka", "Stand Farm", function()
    AutoBuyRokakaka = not AutoBuyRokakaka
end)

local Webhook = ""
AddTextBox("Set Webhook", "Stand Farm", {}, function(Input)
    Webhook = Input
end)

local EnableWebhook = false
AddToggle("Enable Webhook", "Stand Farm", function()
    EnableWebhook = not EnableWebhook
end)

AddBar("Stand Farm", {})
AddText("Stands", "Stand Farm")

local WhitelistedStands = {}
local WhitelistedAttributes = {}

local Ignore = {"The Universe Over Heaven", "Shinjitsu Tenjпї…пѕЌ no uchпї…пѕ«", "The Waifu: Over Heaven From Your Biazarre Adventure", "Rapture", "True Star Platinum: The World", "Diego's The World: High Voltage", "True Star Platinum: The World", "Premier Macho", "Stab Platinum: The World", "King Crimson Requiem", "Silver Chariot Requiem", "Eclispe Dio's The World Over Heaven", "Headless Star Platinum", "Tusk Act 2", "Tusk Act 3", "Star Platinum The World: Requiem", "Tusk Act 4", "Star Platinum OVA Over Heaven", "Star Platinum The World", "Star Platinum Over Heaven", "Crazy Diamond: Over Heaven", "The World's Greatest High", "C-Moon", "Shadow The World", "Main In Heaven", "Silver Chariot Requiem OVA", "The World OVA Over Heaven", "Kars", "Cauldron Black", "Stab Platinum", "Dio's The World Over Heaven", "The World Over Heaven", "Halal Goku", "Gold Experience Requiem Requiem", "Gold Experience Requiem", "Killer Queen Bites The Dust", "Celebratory Soft & Wet", "Anubis", "The World Alternate Universe: Executioner", "The World Alternate Universe: Electrocutioner", "King Crimson: Requiem", "Brainy's The World", "TAMIH", "ABDSTW", "Made In Hell", "Jotaro's Star Platinum Over Heaven", "The World Over Heaven OVA", "Golden Experience: Reality Bender", "Ultimate Life Form", "Ben", "Made In Heaven", "Snowglobe Made In Heaven", "Premier Macho Requiem", "Halal Vegeta", "HalalGoku", "IBM", "Festive The World", "The Universe", "Dirty Deeds Done Dirt Cheap: Love Train"}
local Created = {}

for i, v in ipairs(game:GetService("ReplicatedStorage").StandNameConvert:GetChildren()) do
    if v:IsA("StringValue") and not table.find(Created, v.Value) and not table.find(Ignore, v.Value) then
        task.spawn(function()
            table.insert(Created, v.Value)

            AddToggle(v.Value, "Stand Farm", function()
                if table.find(WhitelistedStands, v.Value) then
                    table.remove(WhitelistedStands, table.find(WhitelistedStands, v.Value))
                else
                    table.insert(WhitelistedStands, v.Value)
                end
            end)
        end)
    end
end

AddBar("Stand Farm", {})
AddText("Attributes", "Stand Farm")

for i, v in ipairs(game:GetService("Workspace").Map.ChancesBoards.AttributeChances.newSurface.ScrollFrame:GetChildren()) do
    if v:IsA("TextLabel") then
        task.spawn(function()
            local Attribute = string.split(v.Text, " ")
            Attribute = Attribute[1]
        
            if Attribute == "Glass" then
                Attribute = "Glass Cannon"
            end

            AddToggle(Attribute, "Stand Farm", function()
                if table.find(WhitelistedAttributes, Attribute) then
                    table.remove(WhitelistedAttributes, table.find(WhitelistedAttributes, Attribute))
                else
                    table.insert(WhitelistedAttributes, Attribute)
                end
            end)
        end)
    end
end

AddBar("Stand Farm", {})

function NextMove()
    local CheckCurrentStand = game.Players.LocalPlayer.PlayerGui.PlayerGUI.ingame.Stats.StandName:FindFirstChild("Name_").TextLabel.Text
    local CheckCurrentAttribute = game.Players.LocalPlayer.Data.Attri.Value
    if CheckCurrentStand == "None" then
        local Arrow = "Stand Arrow"
        if UseStandArrows then
            Arrow = "Stand Arrow"
        elseif UseChargedArrows then
            Arrow = "Charged Arrow"
        elseif UseKarsMask then
            Arrow = "Kars Mask"
        end

        if game.Players.LocalPlayer.Backpack:FindFirstChild(Arrow) then
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack:FindFirstChild(Arrow))
            repeat task.wait() until game.Players.LocalPlayer.Character:FindFirstChild(Arrow)
            repeat
                game.Players.LocalPlayer.Character:FindFirstChild(Arrow):Activate()
                game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("UseItem"):FireServer()
            
                task.wait(0.5)
            until game.Players.LocalPlayer.PlayerGui.PlayerGUI.ingame.Stats.StandName:FindFirstChild("Name_").TextLabel.Text ~= "None"
        else
            if AutoBuyArrows then
                if UseArrow then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.NPCs.MerchantAU.HumanoidRootPart.CFrame
                    task.wait(0.5)
                    game:GetService("ReplicatedStorage").Events.BuyItem:FireServer("MerchantAU", "Option4")
                    task.wait(0.5)
                elseif UseChargedArrow then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.NPCs.Merchant120.HumanoidRootPart.CFrame
                    task.wait(0.5)
                    game:GetService("ReplicatedStorage").Events.BuyItem:FireServer("Merchantlvl120", "Option2")
                    task.wait(0.5)
                end
            end
        end
    else
        if game.Players.LocalPlayer.Backpack:FindFirstChild("Rokakaka") then
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack:FindFirstChild("Rokakaka"))
            repeat task.wait() until game.Players.LocalPlayer.Character:FindFirstChild("Rokakaka")
            repeat
                game.Players.LocalPlayer.Character:FindFirstChild("Rokakaka"):Activate()
                game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("UseItem"):FireServer()
                
                task.wait(0.5)
            until game.Players.LocalPlayer.Data.Stand.Value == "None"
        else
            if AutoBuyRokakaka == true then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.NPCs.MerchantAU.HumanoidRootPart.CFrame
                task.wait(0.5)
                game:GetService("ReplicatedStorage").Events.BuyItem:FireServer("MerchantAU", "Option2")
                task.wait(0.5)
            end
        end
    end
end

local StandFarm = false
AddToggle("Begin Stand Farm", "Stand Farm", function()
    StandFarm = not StandFarm

    if StandFarm then
        while StandFarm and task.wait() do
            local CurrentStand = game.Players.LocalPlayer.PlayerGui.PlayerGUI.ingame.Stats.StandName:FindFirstChild("Name_").TextLabel.Text
            local CurrentAttribute = game.Players.LocalPlayer.Data.Attri.Value

            local Check1 = false
            local Check2 = false

            if table.find(WhitelistedStands, CurrentStand) then
                Check1 = true
            end
            if table.find(WhitelistedAttributes, CurrentAttribute) then
                Check2 = true
            end

            if SplitChecking == true then
                if Check1 == true or Check2 == true then
                    break
                end
            else
                if StandCheck == true and AttributeCheck == false then
                    if Check1 == true then 
                        if EnableWebhook == true then
                            local Username = game.Players.LocalPlayer.Name
                            local PlayerStand = game.Players.LocalPlayer.Data.Stand.Value
                            local PlayerAttribute = game.Players.LocalPlayer.Data.Attri.Value

                            local Data = {
                                ["content"] = "@everyone```\nUsername: "..Username.."\nStand: "..PlayerStand.."\nAttribute: "..PlayerAttribute.."```",
                            }
                            local NewData = game:GetService("HttpService"):JSONEncode(Data)
                            local Headers = {
                                ["content-type"] = "application/json"
                            }
                            local Request = http_request or request or HttpPost or syn.request
                            local Embed = {Url = Webhook, Body = NewData, Method = "POST", Headers = Headers}
                            Request(Embed)
                        end

                        break
                    end
                elseif StandCheck == false and AttributeCheck == true then
                    if Check2 == true then
                        if EnableWebhook == true then
                            local Username = game.Players.LocalPlayer.Name
                            local PlayerStand = game.Players.LocalPlayer.Data.Stand.Value
                            local PlayerAttribute = game.Players.LocalPlayer.Data.Attri.Value

                            local Data = {
                                ["content"] = "@everyone```\nUsername: "..Username.."\nStand: "..PlayerStand.."\nAttribute: "..PlayerAttribute.."```",
                            }
                            local NewData = game:GetService("HttpService"):JSONEncode(Data)
                            local Headers = {
                                ["content-type"] = "application/json"
                            }
                            local Request = http_request or request or HttpPost or syn.request
                            local Embed = {Url = Webhook, Body = NewData, Method = "POST", Headers = Headers}
                            Request(Embed)
                        end

                        break
                    end
                elseif StandCheck == true and AttributeCheck == true then
                    if Check1 == true and Check2 == true then
                        if EnableWebhook == true then
                            local Username = game.Players.LocalPlayer.Name
                            local PlayerStand = game.Players.LocalPlayer.Data.Stand.Value
                            local PlayerAttribute = game.Players.LocalPlayer.Data.Attri.Value

                            local Data = {
                                ["content"] = "@everyone```\nUsername: "..Username.."\nStand: "..PlayerStand.."\nAttribute: "..PlayerAttribute.."```",
                            }
                            local NewData = game:GetService("HttpService"):JSONEncode(Data)
                            local Headers = {
                                ["content-type"] = "application/json"
                            }
                            local Request = http_request or request or HttpPost or syn.request
                            local Embed = {Url = Webhook, Body = NewData, Method = "POST", Headers = Headers}
                            Request(Embed)
                        end

                        break
                    end
                end
            end

            NextMove()
        end
    end
end)
