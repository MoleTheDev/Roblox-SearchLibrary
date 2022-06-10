local SearchGui = Instance.new("ScreenGui")
local ScrollingMain = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local SearchBar = Instance.new("TextBox")
local Items = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local button = Instance.new("TextButton")
local UIStroke = Instance.new("UIStroke")

local Library = {}

function Library:CreateWindow(is_draggable, pos)
	SearchGui.Name = "SearchGui"
	SearchGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
	SearchGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	ScrollingMain.Name = "ScrollingMain"
	ScrollingMain.Parent = SearchGui
	ScrollingMain.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	if pos == "normal" then
		ScrollingMain.Position = UDim2.new(0.0894160569, 0, 0.293785602, 0)
	else
		ScrollingMain.Position = UDim2.new(pos)
	end
	ScrollingMain.Size = UDim2.new(0, 228, 0, 251)

	UICorner.Parent = ScrollingMain
	UICorner.CornerRadius = UDim.new(0, 4)

	UIStroke.Parent = ScrollingMain
	UIStroke.Thickness = 1
	UIStroke.Color = Color3.fromRGB(255, 74, 74)

	if is_draggable == true then
		ScrollingMain.Active = true
		ScrollingMain.Draggable = true
	elseif is_draggable == false then
		ScrollingMain.Active = false
		ScrollingMain.Draggable = false
	end

	SearchBar.Name = "SearchBar"
	SearchBar.Parent = ScrollingMain
	SearchBar.AnchorPoint = Vector2.new(0.5, 0)
	SearchBar.BackgroundColor3 = Color3.fromRGB(37, 37, 37)
	SearchBar.BorderColor3 = Color3.fromRGB(32, 32, 32)
	SearchBar.BorderSizePixel = 2
	SearchBar.Position = UDim2.new(0.5, 0, 0.0250000004, 0)
	SearchBar.Size = UDim2.new(0.949999988, 0, 0.075000003, 0)
	SearchBar.ZIndex = 2
	SearchBar.Font = Enum.Font.SourceSans
	SearchBar.PlaceholderColor3 = Color3.fromRGB(102, 102, 102)
	SearchBar.PlaceholderText = "Search"
	SearchBar.Text = ""
	SearchBar.TextColor3 = Color3.fromRGB(204, 204, 204)
	SearchBar.TextScaled = true
	SearchBar.TextSize = 14.000
	SearchBar.TextWrapped = true

	Items.Name = "Items"
	Items.Parent = ScrollingMain
	Items.Active = true
	Items.AnchorPoint = Vector2.new(0.5, 0)
	Items.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Items.BackgroundTransparency = 1.000
	Items.BorderSizePixel = 0
	Items.Position = UDim2.new(0.5, 0, 0.125, 0)
	Items.Size = UDim2.new(0.949999988, 0, 0.851095736, 5)
	Items.ScrollBarThickness = 0

	UIListLayout.Parent = Items
	UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIListLayout.Padding = UDim.new(0, 5)


	local searchBar = SearchBar
	local items = Items

	local function UpdateResults()
		local search = string.lower(searchBar.Text)
		for i, v in	 pairs(items:GetChildren()) do
			if v:IsA("GuiButton") then
				if search ~= "" then
					local item = string.lower(v.Text)
					if string.find(item, search) then
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

	searchBar.Changed:Connect(UpdateResults)
end

function Library:CreateItem(name, text, callback)

	local new_button = button:Clone()

	new_button.Name = tostring(name)
	new_button.Parent = Items
	new_button.AnchorPoint = Vector2.new(0.5, 0)
	new_button.BackgroundColor3 = Color3.fromRGB(37, 37, 37)
	new_button.BorderColor3 = Color3.fromRGB(32, 32, 32)
	new_button.BorderSizePixel = 2
	new_button.Position = UDim2.new(0.5, 0, 0.0250000004, 0)
	new_button.Size = UDim2.new(1, 0, 0.0500000007, -5)
	new_button.ZIndex = 2
	new_button.Font = Enum.Font.SourceSans
	new_button.Text = tostring(text)
	new_button.TextColor3 = Color3.fromRGB(204, 204, 204)
	new_button.TextScaled = true
	new_button.TextSize = 14.000
	new_button.TextWrapped = true

	new_button.MouseButton1Down:Connect(callback)
end

return Library
