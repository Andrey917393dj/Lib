function Start(A, B)
    local DefaultColor = Color3.fromRGB(0, 51, 102)
    local IgnoreDuplicates = false
    
    pcall(function()
        if B["ColorTheme"] then
            DefaultColor = B["ColorTheme"]
        end
        if B["IgnoreDuplicates"] then
            IgnoreDuplicates = true 
        end
    end)
    
    if IgnoreDuplicates ~= true then
        for i, v in pairs(game:GetService("CoreGui"):GetChildren()) do
            if v.Name == A then
                v:Destroy() 
            end
        end
    end

    local ScreenGui = Instance.new("ScreenGui")
    local Frame = Instance.new("Frame")
    local Hotbar = Instance.new("Frame")
    local ImageButton = Instance.new("ImageButton")
    local TextLabel = Instance.new("TextLabel")
    local UICorner = Instance.new("UICorner")
    local Buttons = Instance.new("Frame")
    local Handler = Instance.new("ScrollingFrame")
    local UICorner_2 = Instance.new("UICorner")
    local Menus = Instance.new("Frame")
    local UICorner_3 = Instance.new("UICorner")
    local UIListLayout = Instance.new("UIListLayout")
    
    ScreenGui.Name = A
    ScreenGui.Parent = game:GetService("CoreGui")
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    Frame.Parent = ScreenGui
    Frame.BackgroundColor3 = Color3.fromRGB(8, 8, 8)
    Frame.BorderSizePixel = 0
    Frame.Position = UDim2.new(0.311278194, 0, 0.288372099, 0)
    Frame.Size = UDim2.new(0, 501, 0, 273)
    
    Hotbar.Name = "Hotbar"
    Hotbar.Parent = Frame
    Hotbar.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
    Hotbar.BorderSizePixel = 0
    Hotbar.Size = UDim2.new(0, 501, 0, 27)
    
    ImageButton.Parent = Hotbar
    ImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ImageButton.BackgroundTransparency = 1.000
    ImageButton.BorderSizePixel = 0
    ImageButton.Position = UDim2.new(0.944111764, 0, 0.111111104, 0)
    ImageButton.Size = UDim2.new(0, 20, 0, 20)
    ImageButton.Image = "rbxassetid://3944676352"
    
    TextLabel.Parent = Hotbar
    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.BackgroundTransparency = 1.000
    TextLabel.BorderSizePixel = 0
    TextLabel.Position = UDim2.new(0.021956088, 0, 0, 0)
    TextLabel.Size = UDim2.new(0, 159, 0, 27)
    TextLabel.Font = Enum.Font.Gotham
    TextLabel.Text = A
    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.TextSize = 14.000
    TextLabel.TextXAlignment = Enum.TextXAlignment.Left
    
    UICorner.CornerRadius = UDim.new(0, 2)
    UICorner.Parent = Hotbar
    
    Buttons.Name = "Buttons"
    Buttons.Parent = Frame
    Buttons.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
    Buttons.BorderSizePixel = 0
    Buttons.Position = UDim2.new(0, 0, 0.0989011005, 0)
    Buttons.Size = UDim2.new(0, 149, 0, 246)
    
    Handler.Name = "Handler"
    Handler.Parent = Buttons
    Handler.Active = true
    Handler.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Handler.BackgroundTransparency = 1.000
    Handler.BorderSizePixel = 0
    Handler.Position = UDim2.new(0, 0, 0.0243902449, 0)
    Handler.Size = UDim2.new(0, 149, 0, 240)
    Handler.ScrollBarThickness = 0

    UIListLayout.Parent = Handler
    UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Padding = UDim.new(0, 4)
    
    UICorner_2.CornerRadius = UDim.new(0, 2)
    UICorner_2.Parent = Buttons
    
    Menus.Name = "Menus"
    Menus.Parent = Frame
    Menus.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Menus.BackgroundTransparency = 1.000
    Menus.BorderSizePixel = 0
    Menus.Position = UDim2.new(0.297405183, 0, 0.0989011005, 0)
    Menus.Size = UDim2.new(0, 352, 0, 246)
    
    UICorner_3.CornerRadius = UDim.new(0, 2)
    UICorner_3.Parent = Frame

    local Drag = Frame
    local gsCoreGui = game:GetService("CoreGui")
    local gsTween = game:GetService("TweenService")
    local UserInputService = game:GetService("UserInputService")
        local dragging
        local dragInput
        local dragStart
        local startPos
        local function update(input)
            local delta = input.Position - dragStart
            local dragTime = 0.01
            local SmoothDrag = {}
            SmoothDrag.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
            local dragSmoothFunction = gsTween:Create(Drag, TweenInfo.new(dragTime, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), SmoothDrag)
            dragSmoothFunction:Play()
        end
        Drag.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = true
                dragStart = input.Position
                startPos = Drag.Position
                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then
                        dragging = false
                    end
                end)
            end
        end)
        Drag.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
                dragInput = input
            end
        end)
        UserInputService.InputChanged:Connect(function(input)
            if input == dragInput and dragging and Drag.Size then
                update(input)
            end
        end)
    
    ImageButton.MouseButton1Down:Connect(function()
        ScreenGui:Destroy()
    end)

    game:GetService("Players").LocalPlayer:GetMouse().KeyDown:Connect(function(Key)
        if Key == "j" then
            Frame.Visible = not Frame.Visible
        end
    end)
    
    function Destroy(A)
        for i, v in pairs(ScreenGui:GetDescendants()) do
            if string.lower(v.Name) == string.lower(A) then
                v:Destroy() 
            end
        end
    end

    function CreateMenu(A)
        local ScrollingFrame = Instance.new("ScrollingFrame")
        local UIListLayout = Instance.new("UIListLayout")
        
        ScrollingFrame.Parent = Menus
        ScrollingFrame.Name = A
        ScrollingFrame.Active = true
        ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ScrollingFrame.BackgroundTransparency = 1.000
        ScrollingFrame.BorderSizePixel = 0
        ScrollingFrame.Position = UDim2.new(0, 0, 0.024390243, 0)
        ScrollingFrame.Size = UDim2.new(0, 352, 0, 240)
        ScrollingFrame.ScrollBarThickness = 0
        ScrollingFrame.Visible = false
        ScrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
        
        UIListLayout.Parent = ScrollingFrame
        UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
        UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayout.Padding = UDim.new(0, 4)

        local TextButton = Instance.new("TextButton")
        local UICorner = Instance.new("UICorner")
        
        TextButton.Name = A
        TextButton.Parent = Handler
        TextButton.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
        TextButton.BorderSizePixel = 0
        TextButton.Position = UDim2.new(0.0604026839, 0, 0, 0)
        TextButton.Size = UDim2.new(0, 131, 0, 23)
        TextButton.Font = Enum.Font.Gotham
        TextButton.Text = A
        TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextButton.TextSize = 12.000
        
        UICorner.CornerRadius = UDim.new(0, 2)
        UICorner.Parent = TextButton

        TextButton.MouseButton1Down:Connect(function()
            for i, v in pairs(Menus:GetChildren()) do
                if v.Name == TextButton.Text then
                    v.Visible = true
                    else
                        if v:IsA("ScrollingFrame") then
                            v.Visible = false 
                        end
                end
            end
        end)
    end

    function CreateButton(A, B, C)
        local Regular = Instance.new("TextButton")
        local UICorner = Instance.new("UICorner")
        local TextLabel = Instance.new("TextLabel")
        
        Regular.Name = A
        Regular.Parent = Menus[B]
        Regular.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
        Regular.BorderSizePixel = 0
        Regular.Position = UDim2.new(0.0454545468, 0, 0, 0)
        Regular.Size = UDim2.new(0, 336, 0, 23)
        Regular.Font = Enum.Font.SourceSans
        Regular.Text = ""
        Regular.TextColor3 = Color3.fromRGB(255, 255, 255)
        Regular.TextSize = 12.000
        
        UICorner.CornerRadius = UDim.new(0, 2)
        UICorner.Parent = Regular
        
        TextLabel.Parent = Regular
        TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel.BackgroundTransparency = 1.000
        TextLabel.BorderColor3 = Color3.fromRGB(27, 42, 53)
        TextLabel.BorderSizePixel = 0
        TextLabel.Position = UDim2.new(0.0386904776, 0, 0, 0)
        TextLabel.Size = UDim2.new(0, 148, 0, 23)
        TextLabel.Font = Enum.Font.Gotham
        TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel.Text = A
        TextLabel.TextSize = 12.000
        TextLabel.TextXAlignment = Enum.TextXAlignment.Left
        
        Regular.MouseButton1Down:Connect(function()
            pcall(C)    
        end)
    end
    
    function CreateTextBox(A, B, C, D)
        
        local Search = Instance.new("TextButton")
        local UICorner = Instance.new("UICorner")
        local TextLabel = Instance.new("TextLabel")
        local TextBox = Instance.new("TextBox")
        local UICorner_2 = Instance.new("UICorner")
        
        Search.Name = A
        Search.Parent = Menus[B]
        Search.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
        Search.BorderSizePixel = 0
        Search.Position = UDim2.new(0.0454545468, 0, 0, 0)
        Search.Size = UDim2.new(0, 336, 0, 23)
        Search.Font = Enum.Font.SourceSans
        Search.Text = ""
        Search.TextColor3 = Color3.fromRGB(255, 255, 255)
        Search.TextSize = 12.000
        
        UICorner.CornerRadius = UDim.new(0, 2)
        UICorner.Parent = Search
        
        TextLabel.Parent = Search
        TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel.BackgroundTransparency = 1.000
        TextLabel.BorderColor3 = Color3.fromRGB(27, 42, 53)
        TextLabel.BorderSizePixel = 0
        TextLabel.Position = UDim2.new(0.0386904776, 0, 0, 0)
        TextLabel.Size = UDim2.new(0, 148, 0, 23)
        TextLabel.Font = Enum.Font.Gotham
        TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel.Text = A
        TextLabel.TextSize = 12.000
        TextLabel.TextXAlignment = Enum.TextXAlignment.Left
        
        TextBox.Parent = Search
        TextBox.BackgroundColor3 = Color3.fromRGB(6, 6, 6)
        TextBox.Position = UDim2.new(0.565547585, 0, 0.130000234, 0)
        TextBox.Size = UDim2.new(0, 137, 0, 16)
        TextBox.Font = Enum.Font.Gotham
        TextBox.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
        if C["CustomText"] then
            TextBox.PlaceholderText = C["CustomText"]
            else
                TextBox.PlaceholderText = "Text Here"
        end
        TextBox.Text = ""
        TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextBox.TextSize = 10.000
        TextBox.TextWrapped = true
        
        UICorner_2.CornerRadius = UDim.new(0, 4)
        UICorner_2.Parent = TextBox
        
        if table.find(C, "AutoUpdate") then
                TextBox:GetPropertyChangedSignal("Text"):Connect(function()
                    pcall(D, TextBox.Text)   
                end)
            else
                Search.MouseButton1Down:Connect(function()
                    pcall(D, TextBox.Text)
                end)
        end
    end

    function CreateToggle(A, B, C)
        local Toggles = Instance.new("TextButton")
        local UICorner = Instance.new("UICorner")
        local TextLabel = Instance.new("TextLabel")
        local Frame = Instance.new("Frame")
        local UICorner_2 = Instance.new("UICorner")
        
        Toggles.Name = A
        Toggles.Parent = Menus[B]
        Toggles.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
        Toggles.BorderSizePixel = 0
        Toggles.Position = UDim2.new(0.0454545468, 0, 0, 0)
        Toggles.Size = UDim2.new(0, 336, 0, 23)
        Toggles.Font = Enum.Font.SourceSans
        Toggles.Text = ""
        Toggles.TextColor3 = Color3.fromRGB(255, 255, 255)
        Toggles.TextSize = 12.000
        
        UICorner.CornerRadius = UDim.new(0, 2)
        UICorner.Parent = Toggles
        
        TextLabel.Parent = Toggles
        TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel.BackgroundTransparency = 1.000
        TextLabel.BorderColor3 = Color3.fromRGB(27, 42, 53)
        TextLabel.BorderSizePixel = 0
        TextLabel.Position = UDim2.new(0.0386904776, 0, 0, 0)
        TextLabel.Size = UDim2.new(0, 148, 0, 23)
        TextLabel.Font = Enum.Font.Gotham
        TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel.TextSize = 12.000
        TextLabel.Text = A
        TextLabel.TextXAlignment = Enum.TextXAlignment.Left
        
        Frame.Parent = Toggles
        Frame.BackgroundColor3 = Color3.fromRGB(6, 6, 6)
        Frame.Position = UDim2.new(0.758928597, 0, 0.130434781, 0)
        Frame.Size = UDim2.new(0, 72, 0, 16)
        
        UICorner_2.CornerRadius = UDim.new(0, 2)
        UICorner_2.Parent = Frame
        
        local Flag = false
        task.spawn(function()
            while ScreenGui and task.wait() do
                if Flag == true then
                    local ColorTween = {}
                    ColorTween.BackgroundColor3 = DefaultColor
                    local ColorInfo = TweenInfo.new(0.2)
                    local ColorToTween = game:GetService("TweenService"):Create(Frame, ColorInfo, ColorTween)
                    ColorToTween:Play()
                elseif Flag == false then
                    local ColorTween = {}
                    ColorTween.BackgroundColor3 = Color3.fromRGB(6, 6, 6)
                    local ColorInfo = TweenInfo.new(0.2)
                    local ColorToTween = game:GetService("TweenService"):Create(Frame, ColorInfo, ColorTween)
                    ColorToTween:Play()
                end
            end
        end)

        Toggles.MouseButton1Down:Connect(function()
            Flag = not Flag
            pcall(C)
        end)
    end

    function CreateNote(A, B)
        local TextSizeChange = false
        
        if string.len(A) >= 42 then
            TextSizeChange = true
        end

        local TextLabel = Instance.new("TextLabel")
        local TextLabel_2 = Instance.new("TextLabel")
        local UICorner = Instance.new("UICorner")
        
        TextLabel.Name = A
        TextLabel.Parent = Menus[B]
        TextLabel.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
        TextLabel.Size = UDim2.new(0, 336, 0, 23)
        TextLabel.Font = Enum.Font.SourceSans
        TextLabel.Text = ""
        TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
        TextLabel.TextSize = 14.000
        
        TextLabel_2.Parent = TextLabel
        TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel_2.BackgroundTransparency = 1.000
        TextLabel_2.BorderColor3 = Color3.fromRGB(27, 42, 53)
        TextLabel_2.BorderSizePixel = 0
        TextLabel_2.Position = UDim2.new(0.039, 0, 0, 0)
        TextLabel_2.Size = UDim2.new(0, 310, 0, 23)
        TextLabel_2.Font = Enum.Font.Gotham
        TextLabel_2.Text = A
        TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel_2.TextSize = 12.000
        TextLabel_2.TextWrapped = true
        TextLabel_2.TextXAlignment = Enum.TextXAlignment.Left
        TextLabel_2.TextYAlignment = Enum.TextYAlignment.Center

        if TextSizeChange == true then
            TextLabel_2.TextScaled = true
        else
            TextLabel_2.TextScaled = false
        end
        
        UICorner.CornerRadius = UDim.new(0, 2)
        UICorner.Parent = TextLabel
    end

    function CreateTextBoxToggle(A, B, C, D)
        local SearchToggles = Instance.new("TextButton")
        local UICorner = Instance.new("UICorner")
        local TextLabel = Instance.new("TextLabel")
        local TextBox = Instance.new("TextBox")
        local UICorner_2 = Instance.new("UICorner")
        local Frame = Instance.new("Frame")
        local UICorner_3 = Instance.new("UICorner")
        
        SearchToggles.Name = A
        SearchToggles.Parent = Menus[B]
        SearchToggles.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
        SearchToggles.BorderSizePixel = 0
        SearchToggles.Position = UDim2.new(0.0454545468, 0, 0, 0)
        SearchToggles.Size = UDim2.new(0, 336, 0, 23)
        SearchToggles.Font = Enum.Font.SourceSans
        SearchToggles.Text = ""
        SearchToggles.TextColor3 = Color3.fromRGB(255, 255, 255)
        SearchToggles.TextSize = 12.000
        
        UICorner.CornerRadius = UDim.new(0, 2)
        UICorner.Parent = SearchToggles
        
        TextLabel.Parent = SearchToggles
        TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel.BackgroundTransparency = 1.000
        TextLabel.BorderColor3 = Color3.fromRGB(27, 42, 53)
        TextLabel.BorderSizePixel = 0
        TextLabel.Position = UDim2.new(0.0386904776, 0, 0, 0)
        TextLabel.Size = UDim2.new(0, 148, 0, 23)
        TextLabel.Font = Enum.Font.Gotham
        TextLabel.Text = A
        TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel.TextSize = 12.000
        TextLabel.TextXAlignment = Enum.TextXAlignment.Left
        
        TextBox.Parent = SearchToggles
        TextBox.BackgroundColor3 = Color3.fromRGB(6, 6, 6)
        TextBox.Position = UDim2.new(0.416738063, 0, 0.129999578, 0)
        TextBox.Size = UDim2.new(0, 108, 0, 16)
        TextBox.Font = Enum.Font.Gotham
        TextBox.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
        if C["CustomText"] then
            TextBox.PlaceholderText = C["CustomText"]
            else
                TextBox.PlaceholderText = "Text Here"
        end
        TextBox.Text = ""
        TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextBox.TextSize = 10.000
        TextBox.TextWrapped = true
        
        UICorner_2.CornerRadius = UDim.new(0, 2)
        UICorner_2.Parent = TextBox
        
        Frame.Parent = SearchToggles
        Frame.BackgroundColor3 = Color3.fromRGB(6, 6, 6)
        Frame.Position = UDim2.new(0.758928597, 0, 0.130434781, 0)
        Frame.Size = UDim2.new(0, 72, 0, 16)
        
        UICorner_3.CornerRadius = UDim.new(0, 2)
        UICorner_3.Parent = Frame

        local Flag = false
        if table.find(C, "AutoUpdate") then
            SearchToggles.MouseButton1Down:Connect(function()
                Flag = not Flag
            end)

            TextBox:GetPropertyChangedSignal("Text"):Connect(function()
                pcall(D, TextBox.Text)
            end)

            task.spawn(function()
                while ScreenGui and task.wait() do
                    if Flag == true then
                        local ColorTween = {}
                        ColorTween.BackgroundColor3 = DefaultColor
                        local ColorInfo = TweenInfo.new(0.2)
                        local ColorToTween = game:GetService("TweenService"):Create(Frame, ColorInfo, ColorTween)
                        ColorToTween:Play()
                    elseif Flag == false then
                        local ColorTween = {}
                        ColorTween.BackgroundColor3 = Color3.fromRGB(6, 6, 6)
                        local ColorInfo = TweenInfo.new(0.2)
                        local ColorToTween = game:GetService("TweenService"):Create(Frame, ColorInfo, ColorTween)
                        ColorToTween:Play()
                    end
                end
            end)
        else
            SearchToggles.MouseButton1Down:Connect(function()
                Flag = not Flag
            end)

            SearchToggles.MouseButton1Down:Connect(function()
                pcall(D, TextBox.Text)
            end)

            task.spawn(function()
                while ScreenGui and task.wait() do
                    if Flag == true then
                        local ColorTween = {}
                        ColorTween.BackgroundColor3 = DefaultColor
                        local ColorInfo = TweenInfo.new(0.2)
                        local ColorToTween = game:GetService("TweenService"):Create(Frame, ColorInfo, ColorTween)
                        ColorToTween:Play()
                    elseif Flag == false then
                        local ColorTween = {}
                        ColorTween.BackgroundColor3 = Color3.fromRGB(6, 6, 6)
                        local ColorInfo = TweenInfo.new(0.2)
                        local ColorToTween = game:GetService("TweenService"):Create(Frame, ColorInfo, ColorTween)
                        ColorToTween:Play()
                    end
                end
            end)
        end
    end
    
    function CreateSearchBar(A)
        local SearchBar = Instance.new("TextLabel")
        local UICorner = Instance.new("UICorner")
        local TextLabel = Instance.new("TextLabel")
        local TextBox = Instance.new("TextBox")
        local UICorner_2 = Instance.new("UICorner")
        
        SearchBar.Name = "SearchBar"
        SearchBar.Parent = Menus[A]
        SearchBar.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
        SearchBar.BorderSizePixel = 0
        SearchBar.Size = UDim2.new(0, 336, 0, 23)
        SearchBar.Font = Enum.Font.SourceSans
        SearchBar.Text = ""
        SearchBar.TextColor3 = Color3.fromRGB(0, 0, 0)
        SearchBar.TextSize = 14.000
        
        UICorner.CornerRadius = UDim.new(0, 2)
        UICorner.Parent = SearchBar
        
        TextLabel.Parent = SearchBar
        TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel.BackgroundTransparency = 1.000
        TextLabel.BorderColor3 = Color3.fromRGB(27, 42, 53)
        TextLabel.BorderSizePixel = 0
        TextLabel.Position = UDim2.new(0.0386904776, 0, 0, 0)
        TextLabel.Size = UDim2.new(0, 148, 0, 23)
        TextLabel.Font = Enum.Font.Gotham
        TextLabel.Text = "Search"
        TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel.TextSize = 12.000
        TextLabel.TextXAlignment = Enum.TextXAlignment.Left
        
        TextBox.Parent = SearchBar
        TextBox.BackgroundColor3 = Color3.fromRGB(6, 6, 6)
        TextBox.Position = UDim2.new(0.187571391, 0, 0.129999578, 0)
        TextBox.Size = UDim2.new(0, 264, 0, 16)
        TextBox.Font = Enum.Font.Gotham
        TextBox.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
        TextBox.PlaceholderText = "Search Here"
        TextBox.Text = ""
        TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextBox.TextSize = 10.000
        
        UICorner_2.CornerRadius = UDim.new(0, 4)
        UICorner_2.Parent = TextBox
        
        local function VSCKWFV_fake_script() -- TextBox.LocalScript 
        	local script = Instance.new('LocalScript', TextBox)
        
        	local SearchBar = script.Parent
        	local Buttons = Menus[A]
        	
        	SearchBar:GetPropertyChangedSignal'Text':Connect(function()
        		local Search = string.lower(SearchBar.Text)
        		for i, v in pairs(Buttons:GetChildren()) do
        			if v:IsA("GuiButton") then
        				if v ~= SearchBar.Parent then
        					if Search ~= ""  then
        						local Button = string.lower(v.TextLabel.Text)
        						if string.find(Button, Search) then
        							v.Visible = true
        						else
        							v.Visible = false
        						end
        					else
        						v.Visible = true
        					end
        				end
        			end
        		end
        	end)
        end
        coroutine.wrap(VSCKWFV_fake_script)()
    end
    
    function CreateNotification(A, B, C)
        local Sound = "rbxassetid://4835664238"
        local DurationTime = 5
        
        if C then
            if C["CustomSound"] then
                Sound = "rbxassetid://"..tostring(C["CustomSound"]) 
            end
            if C["Duration"] then
                DurationTime = C["Duration"] 
            end
        end
        
        local NotifySound = Instance.new("Sound", game:GetService("Workspace"))
        NotifySound.SoundId = Sound
        NotifySound:Play()
        
        game:GetService("StarterGui"):SetCore("SendNotification", {Title = A, Text = B, Duration = DurationTime})
    end
end
