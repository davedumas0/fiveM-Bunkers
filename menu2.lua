function things1(stuff)
 things(stuff)
spawnStuff(stuff)
end
		Citizen.Trace("stage 1 complete")		
local options = 
{
    x = 0.51,
    y = 0.2,
    width = 0.22,
    height = 0.04,
    scale = 0.4,
    font = 0,
    menu_title = "Main obj Menu",
    menu_subtitle = "Categories",
    color_r = 30,
    color_g = 144,
    color_b = 255,
}

function Notify(text)
    SetNotificationTextEntry('STRING')
    AddTextComponentString(text)
    DrawNotification(false, false)
end

function drawTxt(x,y ,width,height,scale, text, r,g,b,a, outline)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    if(outline)then
        SetTextOutline()
    end
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 1, 1, -1)
end

function Main()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
	Notify("Press ~r~F5 ~w~to ~g~open~w~/~r~close~w~!")
    options.menu_title = "my menyoo"
    options.menu_subtitle = "~o~main menu"
    ClearMenu()
    Menu.addButton("~y~veh spawn ~b~menu", "vehSpawnMenu", nil)
	Menu.addButton("~y~TBA ~b~menu", "things2", "my name")
	Menu.addButton("~y~TBA ~b~menu", "things2", "is")
end

function things2(stuff) 
Citizen.Trace(tostring(stuff))
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsControlJustReleased(1, 166) then -- INPUT_CELLPHONE_DOWN
          Main() -- Menu to draw
          Menu.hidden = not Menu.hidden -- Hide/Show the menu
        end
          Menu.renderGUI(options) -- Draw menu on each tick if Menu.hidden = false
     end       
end)

function vehSpawnMenu()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
	Notify("Press ~r~F5 ~w~to ~g~open~w~/~r~close~w~!")
    options.menu_title = "Veh Spawn Menu"
    options.menu_subtitle = "choose a veh type"
    ClearMenu()
	Menu.addButton("boats", "vehBoatsSpawnMenu", nil)
	Menu.addButton("~g~BACK TO MAIN MENU", "Main", nil)	
end

function vehBoatsSpawnMenu()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
	Notify("Press ~r~F5 ~w~to ~g~open~w~/~r~close~w~!")
    options.menu_title = "Veh Boats Spawn Menu"
    options.menu_subtitle = "choose a veh to spawn"
	
    ClearMenu()
	Menu.addButton("~g~spawn dinghy ~b~menu", "vehSpawnDinghyMenu", nil)
	Menu.addButton("~g~spawn dinghy ~b~menu", "vehSpawnDinghy2Menu", nil)
	Menu.addButton("~g~BACK", "vehSpawnMenu", nil)
	Menu.addButton("~g~BACK TO MAIN MENU", "Main", nil)	
end

function vehSpawnDinghyMenu()
    RequestModel(1033245328)
	
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
	Notify("Press ~r~F5 ~w~to ~g~open~w~/~r~close~w~!")
    options.menu_title = "~y~Veh boat Spawn menu"
    options.menu_subtitle = "Spawn Boat"
    ClearMenu()	
	Menu.addButton("~g~spawn dinghy", "things1", 1033245328)
	Menu.addButton("~g~move dinghy", "moveDinghy", nil)
	Menu.addButton("~b~disable collision ~r~dinghy", "setCollisionStuff", true)
	Menu.addButton("~b~enable collision ~b~dinghy", "setCollisionStuff", false)	
	Menu.addButton("~r~delete object", "deleteStuff", nil)
	Menu.addButton("~g~back", "vehBoatsSpawnMenu", nil)
	Menu.addButton("~g~BACK TO MAIN MENU", "Main", nil)	
end
function vehSpawnDinghy2Menu()
    RequestModel(276773164)
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
	Notify("Press ~r~F5 ~w~to ~g~open~w~/~r~close~w~!")
    options.menu_title = "~y~Veh boat Spawn menu"
    options.menu_subtitle = "Spawn Boat"
    ClearMenu()	
	
	Menu.addButton("~g~spawn dinghy2", "spawnStuff", 276773164)
	Menu.addButton("~b~disable collision ~r~dinghy2", "setCollisionStuff", true)
	Menu.addButton("~b~enable collision ~b~dinghy2", "setCollisionStuff", false)	
	Menu.addButton("~r~delete object", "deleteStuff", nil)	
	Menu.addButton("~g~back", "vehBoatsSpawnMenu", nil)
	Menu.addButton("~g~BACK TO MAIN MENU", "Main", nil)	
end

function moveDinghy()
	Notify("use arrow keys to move obj ~n~Press [ ] keys to rotate on Y~n~ Press - = keys to rotate on X")
	Notify("Press NUM- NUM+ to change heading ~n~ Press pgUP PgDOWN to change hight")
	Notify("~r~enter ~w~to freeze ")
    options.menu_title = "~y~move menu"
    options.menu_subtitle = "move object"
    ClearMenu()
	freezeStuff()
	Menu.addButton("~b~unfreeze ~y~Dinghy", "moveDinghy0", nil)
    Menu.addButton("~g~back", "vehSpawnDinghyMenu", nil) 	
	Menu.addButton("~g~BACK TO MAIN MENU", "Main", nil)	
end
function moveDinghy0()
	Notify("use arrow keys to move obj ~n~Press [ ] keys to rotate on Y~n~ Press - = keys to rotate on X")
	Notify("Press NUM- NUM+ to change heading ~n~ Press pgUP PgDOWN to change hight")
	Notify("~r~enter ~w~to freeze ")
    options.menu_title = "~y~move menu"
    options.menu_subtitle = "move object"
    ClearMenu()
	Menu.addButton("~b~freeze ~y~advanced case", "moveDinghy", nil)
    unfreezeStuff()   	
	
end
