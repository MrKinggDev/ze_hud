-- Delete the base HUD
local hide = {
    ["CHudHealth"] = true,
    ["CHudBattery"] = true,
}
hook.Add("HUDShouldDraw", "HideHUD", function(name)
    if hide[name] then return false end
end)

local HideElementsTable = {
	["DarkRP_HUD"] = false,
    ["DarkRP_Hungermod"] = true,
	["DarkRP_EntityDisplay"] = false,
	["DarkRP_ZombieInfo"] = false,
	["DarkRP_LocalPlayerHUD"] = true,
	["DarkRP_Agenda"] = true
}



hook.Add("HUDPaint","vx_hud",function()


local health = LocalPlayer():Health()
if health < 0 then health = 0 elseif health > 100 then health = 100 end
local armor = LocalPlayer():Armor()
if armor < 0 then armor = 0 elseif armor > 100 then armor = 100 end
local food = LocalPlayer():getDarkRPVar("Energy")



		

local wanted = LocalPlayer():getDarkRPVar("wanted")
local money = LocalPlayer():getDarkRPVar("money")
local salary = LocalPlayer():getDarkRPVar("salary")
local username = LocalPlayer():GetName()


local Avatar = vgui.Create( "AvatarImage", Panel )
Avatar:SetSize( 55, 55 )
Avatar:SetPos( 16, 979 )
Avatar:SetPlayer( LocalPlayer(), 64 )

draw.RoundedBox(0, 10, ScrH() - 111, 350, 100, Color(0, 0, 0, 150))

draw.RoundedBox(0, 105, ScrH() - 97, health * 2.5, 15, Color(255, 100, 62, 255))

draw.RoundedBox(0, 10, ScrH() - 12, 350, 6, Color(0, 0, 0, 225))

draw.RoundedBox(0, 10, ScrH() - 117, 290, 6, Color(0, 0, 0, 225))

draw.RoundedBox(0, 360, ScrH() - 111, 6, 105, Color(0, 0, 0, 225))

draw.RoundedBox(0, 300, ScrH() - 117, 66, 6, Color(0, 0, 0, 225))

draw.RoundedBox(0, 4, ScrH() - 117, 6, 111, Color(0, 0, 0, 225))


surface.SetMaterial(Material("materials/heart.png"))
surface.SetDrawColor(255,255,255,255)
surface.DrawTexturedRect(5 + 80, ScrH() - 97, 15, 15)

draw.RoundedBox(0, 105, ScrH() - 79, food * 2.5, 15, Color(1, 142, 8, 255))

surface.SetMaterial(Material("materials/burger.png"))
surface.SetDrawColor(255,255,255,255)
surface.DrawTexturedRect(5 + 80, ScrH() - 79, 15, 15)

draw.RoundedBox(0, 105, ScrH() - 61, armor * 2.5, 15, Color(31, 126, 208, 255)) 

surface.SetMaterial(Material("materials/armor.png"))
surface.SetDrawColor(255,255,255,255)
surface.DrawTexturedRect(10 + 75, ScrH() - 61, 15, 15)


draw.SimpleText("Argent : "..money.." $", "police-2", 175, ScrH() - 35, Color(242, 241, 239, 255))

draw.SimpleText(" "..username.." ", "police-2", 8, ScrH() - 35, Color(242, 241, 239, 255))



end)

surface.CreateFont( "police-1", {
	font = "Roboto", 
	extended = false,
	size = 14,
	weight = 400,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
})

surface.CreateFont( "police-2", {
	font = "Roboto", 
	extended = false,
	size = 20,
	weight = 400,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
})

surface.CreateFont( "police-3", {
	font = "Roboto", 
	extended = false,
	size = 65,
	weight = 400,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
})

surface.CreateFont( "police-4", {
	font = "Roboto", 
	extended = false,
	size = 30,
	weight = 400,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
})

local function HideElements( element )
	if HideElementsTable[ element ] then
		return false
	end
end
hook.Add( "HUDShouldDraw", "HideElements", HideElements )