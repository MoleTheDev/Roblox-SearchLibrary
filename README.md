# Roblox-SearchLibrary
Roblox Luau Search Gui Library

# Documentation
#### Importing:
This works in Roblox Executors only.
```lua
local SearchingLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/MoleTheDev/Roblox-SearchLibrary/main/SearchLibrary.lua"))()
```
**NOTE**If you want to use it in Roblox Studio (to skid it), copy the source code and put it in a localscript
#### Args
```lua
SearchingLib:CreateWindow(is_draggable, pos)
<object> SearchingLib:CreateWindow(<Boolean <true> <false> >, <UDim2>)
```
This just creates the main gui without any things inside it

```lua
SearchingLib:CreateItem(name, text, callback)
<object> SearchingLib:CreateItem(<string>, <string>, <function>)
```
This creates a button inside the UIListLayout which can be searchable

#### Example
```lua
local SearchingLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/MoleTheDev/Roblox-SearchLibrary/main/SearchLibrary.lua"))()

local window = SearchingLib:CreateWindow(true, "0, 0, 0")
local button1 = SearchingLib:CreateItem("button123", "click me", function()
	print("test")
end)

local button2 = SearchingLib:CreateItem("button123123", "click me 2", function()
	print("ok")
end)
```
