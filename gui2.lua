-- Credit : Ideo

a = spawnedVeh
---------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------put entity name or hash here---------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------
function things(modelHash)
   stuff = modelHash
end
----------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------this sets delete gun toggle to off --------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------
 deleteGunToggle = false
----------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------this gets info about spawned entity and player----------------------------------------
----------------------------------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()	
  while true do
  if DoesEntityExist(spawnedVeh) and IsEntityAVehicle(spawnedVeh) then 
  a = spawnedVeh
  end
     Citizen.Wait(0) 
	 playerPed = GetPlayerPed(PlayerId())
     playerCoords = GetEntityCoords(GetPlayerPed(PlayerId()), true)
	 playerCoordsX = playerCoords.x
	 playerCoordsY = playerCoords.y
	 playerCoordsZ = playerCoords.z
	 playerHeading = GetEntityHeading(GetPlayerPed(PlayerId()))
	 PlayerRoomKey = GetRoomKeyFromEntity(GetPlayerPed(PlayerId()))
	 playerInteriorID = GetInteriorFromEntity(GetPlayerPed(PlayerId()))
	 entityRoomKey = GetRoomKeyFromEntity(a)
	 entityInteriorID = GetInteriorFromEntity(a)
     entityCoords = GetEntityCoords(closestEntity, true)
	 interiorGroupID = GetInteriorGroupId(entityInteriorID)
     ForceRoomForEntity(a, playerInteriorID, PlayerRoomKey)
	 EntityInterior = GetInteriorFromEntity(a)
	 EntityRoomKey = GetRoomKeyFromEntity(a)
-----------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------this checks if the spawned entity exists and moves it as player pushes buttons---------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------
	if not DoesEntityExist(a) or DoesEntityExist(GetClosestObjectOfType(playerCoordsX, playerCoordsY, playerCoordsZ, 50.0, stuff, 0, 1, 0)) then
	 a = GetClosestObjectOfType(playerCoordsX, playerCoordsY, playerCoordsZ, 50.0, stuff, 0, 1, 0)
    end
    if DoesEntityExist(a) then
     b = ObjToNet(a)	 
--this gets the entity coords
		entityCoords = GetEntityCoords(a)
		entityCoords1 = GetEntityCoords(b)		
--this splits up the coords 
		  entityX = entityCoords.x
		  entityY = entityCoords.y
		  entityZ = entityCoords.z
		  entityX1 = entityCoords1.x
		  entityY1 = entityCoords1.y
		  entityZ1 = entityCoords1.z		  
--this gets the entity rotation
		entityRot = GetEntityRotation(a)
		entityRot1 = GetEntityRotation(b)		
--this splits up the rotation 
		  entityRotX = entityRot.x
	      entityRotY = entityRot.y
		  entityRotZ = entityRot.z
		  entityRotX1 = entityRot1.x
	      entityRotY1 = entityRot1.y
		  entityRotZ1 = entityRot1.z		  
	end
--if left shift is pressed then movement speed is slower
	if IsControlPressed(0, 21) then
      	moveSpeed = 0.01
		moveSpeed1 = 0.2
    else 
        moveSpeed = 0.1
		moveSpeed1 = 1.3
	 end

--this sets "a" to nil if no entity was spawned and no entity of type found near player
      if not DoesEntityExist(a) then
       a = nil
      end
--home key
-- if control "home" key is pressed then it spawns the entity of your choosing	 
	 if IsControlPressed(0, 213) then
	    Citizen.Wait(500)
		 spawnStuff(stuff)
	 end
--left key
-- if control "left" key is pressed then it adds 0.01 to the x coord
	 if DoesEntityExist(a) and IsControlPressed(0, 174) then
	  if frozen == false then 
	    entityX = entityCoords.x + moveSpeed
		--sets the entity's position with result
        SetEntityCoords(a, entityX, entityY, entityZ)
	    entityX1 = entityCoords1.x + moveSpeed
		--sets the entity's position with result
        SetEntityCoords(b, entityX1, entityY1, entityZ1)			
	  end
	 end	 
--right key
-- if control "right" key is pressed then it subtract's 0.01 from the x coord
	 if DoesEntityExist(a) and IsControlPressed(0, 175) then
	  if frozen == false then	 
	    --entityCoords = GetEntityCoords(a)
	    entityX = entityCoords.x - moveSpeed
		--sets the entity's position with result
        SetEntityCoords(a, entityX, entityY, entityZ)
	    --entityCoords = GetEntityCoords(a)
	    entityX1 = entityCoords1.x - moveSpeed
		--sets the entity's position with result
        SetEntityCoords(b, entityX1, entityY1, entityZ1)			
	  end
	 end
--pageup
-- if control "pageUp" key is pressed then it adds 0.01 to the z coord
	 if DoesEntityExist(a) and IsControlPressed(0, 10) then
	  if frozen == false then
		entityZ = entityCoords.z + moveSpeed
--sets the entity's position with result
        SetEntityCoords(a, entityX, entityY, entityZ)
		entityZ1 = entityCoords1.z + moveSpeed
--sets the entity's position with result
        SetEntityCoords(b, entityX1, entityY1, entityZ1)			
	  end
	 end
--pagedown
-- if control "pageDown" key is pressed then it subtract's 0.01 from the z coord
	 if DoesEntityExist(a) and IsControlPressed(0, 11) then
	  if frozen == false then	 
		entityZ = entityCoords.z - moveSpeed
--sets the entity's position with result
        SetEntityCoords(a, entityX, entityY, entityZ)
		entityZ1 = entityCoords1.z - moveSpeed
--sets the entity's position with result
        SetEntityCoords(b, entityX1, entityY1, entityZ1)		
	 end
	end
--up key
-- if control "up" key is pressed then it subtract's 0.01 from the y coord
	 if DoesEntityExist(a) and IsControlPressed(0, 27) then
	  if frozen == false then	 
		entityY = entityCoords.y - moveSpeed	 
--sets the entity's position with result
       	SetEntityCoords(a, entityX, entityY, entityZ)
		entityY1 = entityCoords1.y - moveSpeed	 
--sets the entity's position with result
       	SetEntityCoords(b, entityX1, entityY1, entityZ1)		
	  end
	 end
--down key
-- if control "down" key is pressed then it adds 0.01 to the y coord
	 if DoesEntityExist(a) and IsControlPressed(0, 173) then
	  if frozen == false then	 
		entityY = entityCoords.y + moveSpeed
        SetEntityCoords(a, entityX, entityY, entityZ)
		entityY1 = entityCoords1.y + moveSpeed
        SetEntityCoords(b, entityX1, entityY1, entityZ1)			
	  end
	 end

	 --leftshift AND "E"
-- if left shift AND "E" key are pressed then it deletes the entity
--and any other entity close to the player with the same hashkey
	 if IsControlPressed(0, 21) and IsControlPressed(0, 38) then
	    if DoesEntityExist(a) or DoesEntityExist(closestEntity) then 
	     deleteStuff()
	    end 
	 end
--numberpad "+" key
-- if numberpad "+" key is pressed then it adds 0.1 to the entity's heading(spins the thing)
	 if DoesEntityExist(a) and IsControlPressed(0, 96) then
	  if frozen == false then	 
	    entityRotZ = entityRotZ + moveSpeed1	  
--sets the entity's heading with result
		SetEntityRotation(a, entityRotX, entityRotY, entityRotZ)
	    entityRotZ1 = entityRotZ1 + moveSpeed1	  
--sets the entity's heading with result
		SetEntityRotation(b, entityRotX1, entityRotY1, entityRotZ1)		
	  end
	 end
--numberpad "-" key
-- if numberpad "-" key is pressed then it subtract's 0.1 from the entity's heading(spins the thing)
	 if DoesEntityExist(a) and IsControlPressed(0, 97) then
	  if frozen == false then
        entityRotZ = entityRotZ - moveSpeed1			
		--sets the entity's heading with result
		SetEntityRotation(a, entityRotX, entityRotY, entityRotZ)
        entityRotZ1 = entityRotZ1 - moveSpeed1			
		--sets the entity's heading with result
		SetEntityRotation(b, entityRotX1, entityRotY1, entityRotZ1)		
	  end
	 end
	 --the "[" key
     if DoesEntityExist(a) and IsControlPressed(0, 39) then
	  if frozen == false then
        --entityRot = GetEntityRotation(a)
	    entityRotY = entityRotY + moveSpeed1
		--sets the entity's rotation with result
		SetEntityRotation(a, entityRotX, entityRotY, entityRotZ)
        --entityRot = GetEntityRotation(a)
	    entityRotY1 = entityRotY1 + moveSpeed1
		--sets the entity's rotation with result
		SetEntityRotation(b, entityRotX1, entityRotY1, entityRotZ1)		
	  end
	 end
	 -- the "]" key
     if (DoesEntityExist(a) and IsControlPressed(0, 40)) then
	  if frozen == false then		
        --entityRot = GetEntityRotation(a)		
	    entityRotY = entityRotY - moveSpeed1 		
		--sets the entity's rotation with result
		SetEntityRotation(a, entityRotX, entityRotY, entityRotZ)
	        --entityRot = GetEntityRotation(a)		
	    entityRotY1 = entityRotY1 - moveSpeed1 		
		--sets the entity's rotation with result
		SetEntityRotation(b, entityRotX1, entityRotY1, entityRotZ1)	
	  end
	 end
	 -- the "-" key
     if (DoesEntityExist(a) and IsControlPressed(0, 84)) then
	  if frozen == false then
        --entityRot = GetEntityRotation(a)		
	    entityRotX = entityRotX - moveSpeed1 		
		--sets the entity's rotation with result
		SetEntityRotation(a, entityRotX, entityRotY, entityRotZ)
	        --entityRot = GetEntityRotation(a)		
	    entityRotX1 = entityRotX1 - moveSpeed1 		
		--sets the entity's rotation with result
		SetEntityRotation(b, entityRotX1, entityRotY1, entityRotZ1)	
	  end
	 end
	 -- the "=" key
     if (DoesEntityExist(a) and IsControlPressed(0, 83)) then
	  if frozen == false then		
        --entityRot = GetEntityRotation(a)		
	    entityRotX = entityRotX + moveSpeed1 		
		--sets the entity's rotation with result
		SetEntityRotation(a, entityRotX, entityRotY, entityRotZ)
	        --entityRot = GetEntityRotation(a)		
	    entityRotX1 = entityRotX1 + moveSpeed1 		
		--sets the entity's rotation with result
		SetEntityRotation(b, entityRotX1, entityRotY1, entityRotZ1)	
	  end
	 end	 
    end
end)

function deleteStuff()

 --this delete's the entity that was spawned or 
 --any close by entity with the the same hash key 
 if DoesEntityExist(closestEntity) and not DoesEntityExist(a) then
 --closestEntity = NetworkGetNetworkIdFromEntity(closestEntity)    
 SetEntityAsMissionEntity(closestEntity,true,true) 
 DeleteObject(closestEntity)
 end
 if DoesEntityExist(a) then
  --a = NetworkGetNetworkIdFromEntity(a)
  SetEntityAsMissionEntity(a,true,true)
  DeleteObject(a)
 end 
 if DoesEntityExist(spawnedVeh) then

 SetEntityAsMissionEntity(spawnedVeh,true,true)
 DeleteVehicle(spawnedVeh)
 DeleteEntity(spawnedVeh)
 end
 if DoesEntityExist(spawnPed) or DoesEntityExist(closestPed) then
 SetEntityAsMissionEntity(spawnPed,true,true)
 SetEntityAsMissionEntity(closestPed,true,true)
 DeletePed(spawnPed)
 end
end
-- this sets the entity's transparency
function invisibleStuff()
 SetEntityAsMissionEntity(a, true, true)
  SetEntityAlpha(a, 255)
end
function unfreezeStuff()
  FreezeEntityPosition(a, false)
   frozen = false  
end
function freezeStuff()
    FreezeEntityPosition(a, true)
	 frozen = true
end
function setCollisionStuff(bool)
  if bool == false then
	SetEntityCollision(a, true, true)
  end
  if bool == true then
    SetEntityCollision(a, false, false)
  end 
end

----------------------------
--this is the ACTUAL spawner
function spawnStuff(stuff)
Citizen.CreateThread(function() 
--this requests the model of what is to be spawned
	if not HasModelLoaded(stuff) then
	 Citizen.Wait(0)
	 RequestModel(stuff)
--if model is a veh then spawn a veh	 
	end
	if IsModelAVehicle(stuff) then 
	 spawnedVeh = VehToNet(CreateVehicle(stuff, playerCoordsX, playerCoordsY, playerCoordsZ, playerHeading, 0, 0, 0))
	 --a = spawnedVeh
	end
--spawn the object	
	--a = ObjToNet(CreateObjectNoOffset(stuff, playerCoordsX+1, playerCoordsY+1, playerCoordsZ, 1, 0, 0))
	setCollisionStuff(true)
    freezeStuff()
  SetEntityHeading(a, playerHeading)
end)
end

    SetSwimMultiplierForPlayer(dude5, 1.49)
	SetRunSprintMultiplierForPlayer(dude5, 1.49) 
RequestScaleformMovie("instructional_buttons")

--------------------------------------------------------------------------------------------------
----------------------this gets a player if they are not the current player-----------------------
--------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
     
     currentPlayerName = GetPlayerName(PlayerId())
     temp3 = {currentPlayerName, handle}
     temp0 = GetPlayerPed(PlayerId())
     temp1 = -1
	 while temp1 <=3 do
	  Citizen.Wait(10000)
      temp2 = IntToPlayerindex(temp1)
	   if GetPlayerPed(temp2) ~= temp0 then 
	        
	   end	
	   if DoesEntityExist(GetPlayerPed(temp2)) then 
	    playerModel = GetEntityModel(GetPlayerPed(temp2))
	   if not HasModelLoaded(playerModel) then 
	    RequestModel(playerModel)
	   end
	    name =  GetPlayerName(temp2)
	   else 
	   name = GetPlayerName(temp2)
	   end	   
	  
	  handle = NetworkHandleFromPlayer(temp1, 13)
	  temp1 = temp1+1
	  if temp1 >= 3 then 
	    temp1 = -1
	  end
	 end   
end)




--------------------------------------------------------------------------------------------------------------------
-- Graphic Functions
--------------------------------------------------------------------------------------------------------------------

Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, 
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, 
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}



Menu = {}
Menu.GUI = {}
Menu.buttonCount = 0
Menu.selection = 0
Menu.hidden = true
MenuTitle = "Menu"

function Menu.addButton(name, func,args)

	local yoffset = 0.3
	local xoffset = 0
	local xmin = 0.0
	local xmax = 0.2
	local ymin = 0.05
	local ymax = 0.05
	Menu.GUI[Menu.buttonCount+1] = {}
	Menu.GUI[Menu.buttonCount+1]["name"] = name
	Menu.GUI[Menu.buttonCount+1]["func"] = func
	Menu.GUI[Menu.buttonCount+1]["args"] = args
	Menu.GUI[Menu.buttonCount+1]["active"] = false
	Menu.GUI[Menu.buttonCount+1]["xmin"] = xmin + xoffset
	Menu.GUI[Menu.buttonCount+1]["ymin"] = ymin * (Menu.buttonCount + 0.01) +yoffset
	Menu.GUI[Menu.buttonCount+1]["xmax"] = xmax 
	Menu.GUI[Menu.buttonCount+1]["ymax"] = ymax 
	Menu.buttonCount = Menu.buttonCount+1
end


function Menu.updateSelection() 
	if IsControlJustPressed(1, Keys["DOWN"]) then 
		if(Menu.selection < Menu.buttonCount -1 ) then
			Menu.selection = Menu.selection +1
		else
			Menu.selection = 0
		end		
		PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
	elseif IsControlJustPressed(1, Keys["TOP"]) then
		if(Menu.selection > 0)then
			Menu.selection = Menu.selection -1
		else
			Menu.selection = Menu.buttonCount-1
		end	
		PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
	elseif IsControlJustPressed(1, Keys["NENTER"])  then
		MenuCallFunction(Menu.GUI[Menu.selection +1]["func"], Menu.GUI[Menu.selection +1]["args"])
		PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
	--elseif IsControlJustPressed(1, Keys["BACKSPACE"])  then
	--		MenuCallFunction(Menu.GUI[Menu.selection -1]["func"], Menu.GUI[Menu.selection -1]["args"])
	--		PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
	end
	local iterator = 0
	for id, settings in ipairs(Menu.GUI) do
		Menu.GUI[id]["active"] = false
		if(iterator == Menu.selection ) then
			Menu.GUI[iterator +1]["active"] = true
		end
		iterator = iterator +1
	end
end

function Menu.renderGUI(options)
	if not Menu.hidden then
		Menu.renderButtons(options)
		Menu.updateSelection()
	end
end

function Menu.renderBox(xMin,xMax,yMin,yMax,color1,color2,color3,color4)
	DrawRect(xMin, yMin,xMax, yMax, color1, color2, color3, color4);
end

function Menu:setTitle(options)
	SetTextFont(1)
	SetTextProportional(0)
	SetTextScale(1.0, 1.0)
	SetTextColour(255, 255, 255, 255)
	SetTextDropShadow(0, 0, 0, 0,255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(1)
	SetTextEntry("STRING")
	AddTextComponentString(options.menu_title)
	DrawText(options.x, options.y)
end

function Menu:setSubTitle(options)
	SetTextFont(2)
	SetTextProportional(0)
	SetTextScale(options.scale +0.1, options.scale +0.1)
	SetTextColour(255, 255, 255, 255)
	SetTextEntry("STRING")
	AddTextComponentString(options.menu_subtitle)
	DrawRect(options.x,(options.y +0.08),options.width,options.height,options.color_r,options.color_g,options.color_b,150)
	DrawText(options.x - options.width/2 + 0.005, (options.y+ 0.08) - options.height/2 + 0.0028)

	SetTextFont(0)
	SetTextProportional(0)
	SetTextScale(options.scale, options.scale)
	SetTextColour(255, 255, 255, 255)
	SetTextDropShadow(0, 0, 0, 0,255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(0)
	SetTextEntry("STRING")
	AddTextComponentString(options.rightText)
	DrawText((options.x + options.width/2 - 0.0385) , options.y + 0.067)
end

function Menu:drawButtons(options)
	local y = options.y + 0.12

	for id, settings in pairs(Menu.GUI) do
		SetTextFont(0)
		SetTextProportional(0)
		SetTextScale(options.scale, options.scale)
		if(settings["active"]) then
			SetTextColour(0, 0, 0, 255)
		else
			SetTextColour(255, 255, 255, 255)
		end
		SetTextCentre(0)
		SetTextEntry("STRING")
		AddTextComponentString(settings["name"])
		if(settings["active"]) then
			DrawRect(options.x,y,options.width,options.height,255,255,255,255)
		else
			DrawRect(options.x,y,options.width,options.height,0,0,0,150)
		end
		DrawText(options.x - options.width/2 + 0.005, y - 0.04/2 + 0.0028)
		y = y + 0.04
	end
end

function Menu.renderButtons(options)

	Menu:setTitle(options)
	Menu:setSubTitle(options)
	Menu:drawButtons(options)

end

--------------------------------------------------------------------------------------------------------------------

function ClearMenu()
	--Menu = {}
	Menu.GUI = {}
	Menu.buttonCount = 0
	Menu.selection = 0
end

function MenuCallFunction(fnc, arg)
	_G[fnc](arg)
end
