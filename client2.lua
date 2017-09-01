
local bunkerModel = 1696520608
-- Credit : Ideo

--------------------------------------------------------------------------------------------------------------------
-- Graphic Functions
--------------------------------------------------------------------------------------------------------------------
local options = {
    x = 0.1,
    y = 0.2,
    width = 0.2,
    height = 0.04,
    scale = 0.4,
    font = 0,
    menu_title = "Model Menu",
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
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

------------------------------------------------------------------------
--------------------------bunker map blips------------------------------
------------------------------------------------------------------------
 ownBunker = true

local bunkerCoords = {
  --{n = 1, x=-3058.714, y=3329.19, z=12.5844},
  --{n = 2, x=24.43542, y=2959.705, z=58.35517},
  --{n = 3, x=481.0465, y=2995.135, z=43.96672},
  --{n = 4, x=848.6175, y=2996.567, z=45.81612},
  --{n = 5, x=2126.785, y=3335.04, z=48.21422},
  --{n = 6, x=2493.654, y=3140.399, z=51.28789},
  --{n = 7, x=1823.961, y=4708.14, z=42.4991},
  --{n = 8, x=-783.0755, y=5934.686, z=24.31475},
  {n = 9, x=-3180.466, y=1374.192, z=19.9597},
  --{n = 10, x=-783.0755, y=5934.686, z=24.31475},
  --{n = 11, x=1570.372, y=2254.549, z=78.89397},
 -- {n = 12, x=-391.3216, y=4363.728, z=58.65862}
}
local bunkerSet = "standard_bunker_set"
local bunkerSetPrintPress = "counterfeit_standard_equip"
local bunkerSetInterior = "interior_basic"
local bunkerSetMeth = "meth_lab_basic"
local bunkerSetCoke = "coke_cut_01"
local bunkerSetWeed = "weed_growtha_stage1"


-----------------------------------------------------------------------
--------------------load bunker interior and doors---------------------
----------------------------------------------------------------------- 
function LoadBunkers()
  -- Interiors 
  RequestIpl("grdlc_int_01_shell")
  RequestIpl("gr_grdlc_int_01")
  RequestIpl("gr_grdlc_int_02")
  RequestIpl("gr_entrance_placement")
  RequestIpl("gr_grdlc_interior_placement")
  RequestIpl("gr_grdlc_interior_placement_interior_0_grdlc_int_01_milo_")
  RequestIpl("gr_grdlc_interior_placement_interior_1_grdlc_int_02_milo_")
  -- Outside
  RequestIpl("gr_case0_bunkerclosed")
  RequestIpl("gr_case1_bunkerclosed")
  RequestIpl("gr_case2_bunkerclosed")
  RequestIpl("gr_case3_bunkerclosed")
  RequestIpl("gr_case4_bunkerclosed")
  RequestIpl("gr_case5_bunkerclosed")
  RequestIpl("gr_case6_bunkerclosed")
  RequestIpl("gr_case7_bunkerclosed")
  RequestIpl("gr_case9_bunkerclosed")
  RequestIpl("gr_case10_bunkerclosed")
  RequestIpl("gr_case11_bunkerclosed")  
end
local a = nil
--local bunkerInterior = GetInteriorFromEntity(a)
local bunkerRoomKey = GetRoomKeyFromEntity(a)

Citizen.CreateThread(function()
  for _, item in pairs(bunkerCoords) do
    Citizen.Trace("Adding coords\n")
    item.blip = AddBlipForCoord(item.x, item.y, item.z)
    SetBlipSprite(item.blip, 350)
    SetBlipAsShortRange(item.blip, false)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Bunker")
    EndTextCommandSetBlipName(item.blip)
  end
  LoadBunkers()
  rmky = GetKeyForEntityInRoom(PlayerPedId())
end)

Citizen.CreateThread(function()
     temp0 = GetPlayerPed(-1)
     temp1 = 0
	 index = tostring(temp1)
	 players = {} 
	 while temp1 <=5 do
      Citizen.Wait(0)
      temp2 = IntToPlayerindex(temp1)	  
	   if GetPlayerPed(temp2) ~= temp0 then 	      
	   end		   	   
	   if DoesEntityExist(GetPlayerPed(temp2)) then    
	    name = GetPlayerName(temp2)
		index = tostring(temp2)
		players[index] = name
	   else 
	   name = GetPlayerName(temp2)	   
	   end	   
	  temp1 = temp1+1	  	  	    
       
		 --playerIndex1 = temp2
		-- playerName1 = name		
	  if temp1 >= 5 then 
	    temp1 = 0
	  end
	 end 
     if not name == GetPlayerName(PlayerId()) then
      name2 = name
	  playerIndex1 = temp2
	 end 
	 if GetInteriorFromEntity(GetPlayerPed(temp2)) == 258561 then 
	  temp3 = temp2
	 end	 		 
end)

-----------------------------------------------------------------------------
--------------------------marker creation------------------------------------
-----------------------------------------------------------------------------
--this draws all the markers on the ground
function createMarker()
  Citizen.CreateThread(function() 
    players = {}  
    while true do
      Citizen.Wait(0)

    bunkerInterior = GetInteriorAtCoordsWithType(938.3077, -3196.112, -100.0,"gr_grdlc_int_02")
	interiorValid = IsValidInterior(bunkerInterior)
	if not rmky == 0 then
	    --ForceRoomForEntity(PlayerPedId(), rmky)
    end


    DrawMarker(1, 888.4329, -3206.185, -99.1861, 0.0, 0.0, 0.0, 0.0, 0.0, 2.5, 2.5, 2.5, 2.5, 200, 233, 0, 150, 0, 0, 2, 0, 0, 0, false )
	--this draws the enter marker
      DrawMarker(1, -3153.622, 1376.978, 16.193, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 0.52, 255, 255, 0, 150, 0, 0, 2, 0, 0, 0, false )
	--this draws the exit marker
	  DrawMarker(1, 894.797, -3244.699, -98.258, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 0.52, 255, 255, 0, 150, 0, 0, 2, 0, 0, 0, false )
	    if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1), false), 894.797, -3244.699, -98.258) < 1.0 and IsControlPressed(0, 38) then
	      if IsPedInVehicle(PlayerPedId(), GetVehiclePedIsIn(PlayerPedId(), false), false) then		
		    SetEntityCoords(GetVehiclePedIsIn(PlayerPedId(), false), -3145.574, 1374.651, 18.46523)
		    ForceRoomForEntity(GetVehiclePedIsIn(PlayerPedId(), false), 258561, -995756533)
		   else 
		    SetEntityCoords(GetPlayerPed(-1), -3145.574, 1374.651, 18.46523)
		    ForceRoomForEntity(PlayerPedId(), 258561, -1116396409)
	       end
	   end	   
	  --this draws the marker to enter the "MOC"
	  DrawMarker(1, 848.4579, -3242.338, -99.69917, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 0.52, 0, 255, 255, 150, 0, 0, 2, 0, 0, 0, false )
      if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1), true), 848.4579, -3242.338, -99.69917) < 5.8 and IsControlPressed(0, 38) then
	    SetEntityCoords(GetPlayerPed(-1), 1103.5620, -3000.00, -40.00)
	  end
	  --this draws the marker to return to bunker from the "MOC"
	  	  DrawMarker(1, 1102.645, -2986.465, -39.99833, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 0.52, 0, 255, 255, 150, 0, 0, 2, 0, 0, 0, false )
      if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1), true), 1102.645, -2986.465, -38.99833) < 3.8 and IsControlPressed(0, 38) then
	    SetEntityCoords(GetPlayerPed(-1), -3153.622, 1376.978, 16.193)
		if not IsInteriorReady(258561)then 
		 --SetNetworkIdSyncToPlayer(1, 0, 0)
		end
		-- Citizen.Wait(1)
	    SetEntityCoords(GetPlayerPed(-1), 885.982, -3245.716, -98.278)
		--SetNetworkIdExistsOnAllMachines(PlayerPedId(), 0)
		--SetEntityVisible(GetPlayerPed(-1), false, 0)

	  end
	  --this requests the sounds for the bunker door
	  if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1), true), -3153.622, 1376.978, 16.193) < 5.8  then
	  RequestStreamedScript("Door_Open_Long", "DLC_GR_Bunker_Door_Sounds")
	    LoadStream("Door_Open_Long", "DLC_GR_Bunker_Door_Sounds")
	    
	  end
	   rmky = GetRoomKeyFromEntity(PlayerPedId())
	   interiorID = GetInteriorFromEntity(GetPlayerPed(-1))
	   --if player in close to the marker it will tp player into the bunker and start the animation
	  if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1), true), -3153.622, 1376.978, 16.193) < 5.8 and IsControlPressed(0, 38) then
	    PlayStreamFrontend()
	    PlaySoundFrontend(-1, "Door_Open_Long", "DLC_GR_Bunker_Door_Sounds", 1)
		enterAnim = true
        Citizen.Wait(0)
      if IsPedInVehicle(PlayerPedId(), GetVehiclePedIsIn(PlayerPedId(), false), false) then 	   
	    TaskVehicleDriveToCoord(GetPlayerPed(-1), GetVehiclePedIsIn(PlayerPedId(), false), -3188.031, 1373.702, 16.806, 3.0, 1.0, GetHashKey(GetEntityModel(GetVehiclePedIsIn(PlayerPedId(), false))), 16777216, 17.0, false)
	  else
	    TaskGoStraightToCoord(PlayerPedId(), -3188.031, 1373.702, 16.806, 1.0, 8000, 88.617, 0.0)
	  end
        Citizen.Wait(8000)
         DoScreenFadeOut(1000)
		Citizen.Wait(1000)
	  end
	end
  end)
end

createMarker()
	EnableInteriorProp(258561,"standard_bunker_set")
    EnableInteriorProp(258561,"Bunker_Style_C")
    EnableInteriorProp(258561,"Office_Upgrade_set")
    EnableInteriorProp(258561,"Gun_schematic_set")
	EnableInteriorProp(258561,"security_upgrade")
	EnableInteriorProp(258561,"gun_range_lights")
	EnableInteriorProp(258561,"gun_locker_upgrade")
    RefreshInterior(258561)  

Citizen.CreateThread(function()
----------------------------------------------------------------------------
----------------------------cutscene stuff 1--------------------------------
-----------------------------(spawn stuff)----------------------------------
    while true do
     Citizen.Wait(0)

	if DoesObjectOfTypeExistAtCoords(-3153.622, 1376.978, 16.193, 50.0, 913755451, 0, 1, 0) and enterAnim == true then
       bunkerClosedDoor = GetClosestObjectOfType(-3153.622, 1376.978, 16.193, 50.0, 913755451, 0, 1, 0)
	     SetEntityAlpha(bunkerClosedDoor,0, true)
		 FreezeEntityPosition(bunkerClosedDoor, true)
		 SetEntityCollision(bunkerClosedDoor, false, true)
	   bunkerRotaion = GetEntityRotation(bunkerClosedDoor, 2, 1)
	     bunkerRotaionX = bunkerRotaion.x
		 bunkerRotaionY = bunkerRotaion.y
		 bunkerRotaionZ = bunkerRotaion.z
	     bunkerClosedDoorCoords = GetEntityCoords(bunkerClosedDoor)
	     bunkerClosedDoorCoordsX = bunkerClosedDoorCoords.x
		 bunkerClosedDoorCoordsY = bunkerClosedDoorCoords.y
		 bunkerClosedDoorCoordsZ = bunkerClosedDoorCoords.z
	     bunkerHeading = GetEntityHeading(bunkerClosedDoor)
		 RequestModel(-1855746761)
	     bunkerDoorBottom = CreateObjectNoOffset(-1855746761, bunkerClosedDoorCoordsX, bunkerClosedDoorCoordsY, bunkerClosedDoorCoordsZ)	   
		  SetEntityRotation(bunkerDoorBottom, bunkerClosedDoorCoordsX, bunkerClosedDoorCoordsY, bunkerClosedDoorCoordsZ, 2, true)
		  SetEntityHeading(bunkerDoorBottom, bunkerHeading)		  
	    bunkerDoorBottomCoords = GetEntityCoords(bunkerDoorBottom)
	     bunkerDoorBottomCoordsX = bunkerDoorBottomCoords.x 
		 bunkerDoorBottomCoordsY = bunkerDoorBottomCoords.y 
		 bunkerDoorBottomCoordsZ = bunkerDoorBottomCoords.z
		 bunkerDoorBottomRot = GetEntityRotation(bunkerDoorBottom, 2, 1)
		 bunkerDoorBottomRotX = bunkerDoorBottomRot.x 
		 bunkerDoorBottomRotY = bunkerDoorBottomRot.y
		 bunkerDoorBottomRotZ = bunkerDoorBottomRot.z
		 bunkerDoorBottomHeading = GetEntityHeading(bunkerDoorBottom)

	end	
-----------------------------------------------------------------------	
--------------------------cutscene stuff 2-----------------------------
---------------------------(camera stuff)------------------------------
	--this creates the cut scene cam
	if enterAnim == true then  
	bunkerEnterCam = CreateCam("DEFAULT_SCRIPTED_CAMERA", 1)
	  SetCamParams(bunkerEnterCam, -3168.725, 1372.125, 17.90084, -0.6113692, -0.7532815, 52.60472, 50.0, 0, 1, 1, 2)
	  -- this is the 1st position of the cut scene cam
	  SetGameplayCamRelativeHeading(-140.1253)
      SetCamActive(bunkerEnterCam, true)
	RenderScriptCams(true, 0, 600, 1, 0, 0)
	
	bunkerDoorTop = CreateObjectNoOffset(-884803471, -3191.19, 1373.341, 17.5628)
	SetEntityHeading(bunkerDoorTop, GetEntityHeading(bunkerDoorBottom))
      entityRot1 = GetEntityRotation(bunkerDoorTop, 2, 1)
	  entityRotX = entityRot1.x
	  entityRotY = entityRot1.y
      entityRotZ = entityRot1.z

	  --this sets the door top to closed position/rotation
	  SetEntityRotation(bunkerDoorTop, entityRotX, entityRotY +20, entityRotZ, 2, 1)
	  --this is supposed to move the bunker door top like an animation from closed to open
	   bunkerMove = 0

	   Citizen.Wait(100)
	   -- this adds 1 to the variable that will subtract from the bunker boor top's rotation Y axis
 ----------------------------------------------------------------------------------------------------
---------------------------------------bunker door animation-----------------------------------------
----------------------------------------------------------------------------------------------------- 
	  while bunkerMove < 20 do 	    
		SetEntityRotation(bunkerDoorTop, entityRotX, entityRotY +20 - bunkerMove, entityRotZ, 2, 1)
	   bunkerMove = bunkerMove + 1
	    Citizen.Wait(100)	    
	  end
 	  if bunkerMove >= 18 then
	    StopStream()
		Citizen.Wait(10)
	    RequestStreamedScript("Door_Open_Limit", "DLC_GR_Bunker_Door_Sounds")
	    LoadStream("Door_Open_Limit", "DLC_GR_Bunker_Door_Sounds")
		PlayStreamFrontend()
        PlaySoundFrontend(-1, "Door_Open_Limit", "DLC_GR_Bunker_Door_Sounds", 1)      	
	  end
	  --this turns off the 1st cam to cange position
	  Citizen.Wait(0)	  
	  RenderScriptCams(false, 1, 1000, 1, 0, 0)
	  SetCamActive(bunkerEnterCam, false)
	  --this is the 2nd position of the cut scene cam
	  SetCamParams(bunkerEnterCam, -3184.147, 1366.103, 19.897, 0, 0, 315.0, 50.0, 0, 1, 1, 2)	  
	  SetGameplayCamRelativeHeading(53.90472)
      SetCamActive(bunkerEnterCam, true)
	  --TaskGoStraightToCoord(PlayerPedId(), -3188.031, 1373.702, 16.806, 1.0, 8000, 88.617, 0.0)
	  RenderScriptCams(true, 1, 1000, 1, 0, 0)
	   Citizen.Wait(8000)	   	   
        if IsPedInVehicle(PlayerPedId(), GetVehiclePedIsIn(PlayerPedId(), false), false) then	
		 SetEntityCoords(GetVehiclePedIsIn(PlayerPedId(), false), 885.982, -3245.716, -98.278)
		 --ForceRoomForEntity(GetVehiclePedIsIn(PlayerPedId(), false), 258561, -995756533)
        else

		 	EnableInteriorProp(258561,"standard_bunker_set")
            EnableInteriorProp(258561,"Bunker_Style_C")
            EnableInteriorProp(258561,"Office_Upgrade_set")
            EnableInteriorProp(258561,"Gun_schematic_set")
        	EnableInteriorProp(258561,"security_upgrade")
	        EnableInteriorProp(258561,"gun_range_lights")
	        EnableInteriorProp(258561,"gun_locker_upgrade")
            RefreshInterior(258561)
		 SetEntityCoords(GetPlayerPed(-1), 894.797, -3244.699, -96.258)
		 
        end	   
	  RenderScriptCams(false, 0, 3000, 1, 0, 0)
	    Citizen.Wait(700)
        DoScreenFadeIn(1000)	
       Citizen.Wait(2000)
	  
	  enterAnim = false
	else
        SetEntityAlpha(bunkerClosedDoor,255, true)
		FreezeEntityPosition(bunkerClosedDoor, false)
		SetEntityCollision(bunkerClosedDoor, true, true)
        SetEntityAsMissionEntity(bunkerDoorTop)
		DeleteEntity(bunkerDoorTop)
		SetEntityAsMissionEntity(bunkerDoorBottom)
		DeleteEntity(bunkerDoorBottom)
        
	end
----------------------------------------------------------------------------- 
---------------------------inside MOC----------------------------------------
-----------------------------------------------------------------------------
    if not HasModelLoaded(GetHashKey("gr_prop_gr_trailer_monitor_03"))then 
	    RequestModel(GetHashKey("gr_prop_gr_trailer_monitor_03"))
	end
	if not HasModelLoaded(-2083549178) then
	  RequestModel(-2083549178)
	end
    if DoesEntityExist(GetClosestObjectOfType(1102.596, -3001.493,-40.00575, 2.0, -2083549178, 0, 0, 0)) then 
	 mocIntCarMod = GetClosestObjectOfType(1102.596, -3001.493,-40.00575, 2.0, -2083549178, 0, 0, 0)
	 SetObjectTextureVariant(mocIntCarMod, 7)
	end	 	
    if not DoesEntityExist(mocIntCarMod) then
       mocIntCarMod = CreateObjectNoOffset(-2083549178, 1102.596, -3001.493,-40.00575, 0, 1, 0)
       SetEntityRotation(mocIntCarMod, -0, -0, -0.1030985)
	   SetEntityHeading(mocIntCarMod, 359.89691162109)	   
	   FreezeEntityPosition(mocIntCarMod, 1)
	   SetEntityCollision(mocIntCarMod, true, true)
	   SetObjectTextureVariant(mocIntCarMod, 7)
	else
	SetObjectTextureVariant(mocIntCarMod, 7)
    end
	if not HasModelLoaded(-2104782239) then
	  RequestModel(-2104782239)
	end
	
        if DoesEntityExist(GetClosestObjectOfType(1102.572, -3009.447, -39.98857, 2.0, -2104782239, 0, 0, 0)) then 
		 mocIntCommand = GetClosestObjectOfType(1102.572, -3009.447, -39.98857, 2.0, -2104782239, 0, 0, 0)
		end
    	if not DoesEntityExist(mocIntCommand) then
         mocIntCommand = CreateObjectNoOffset(-2104782239, 1102.572, -3009.447, -39.98857, 0, 1, 0)
         SetEntityRotation(mocIntCommand, -0, -0, -0.2033111)
	     SetEntityHeading(mocIntCommand, 359.79669189453)	   
	     FreezeEntityPosition(mocIntCommand, 1)
	     SetEntityCollision(mocIntCommand, true, true)
	     SetObjectTextureVariant(mocIntCommand, 7)
		else 
		 SetObjectTextureVariant(mocIntCommand, 7)
        end
        if DoesEntityExist(GetClosestObjectOfType(1102.189, -3009.409, -39.97825, 2.0, -901846631, 0, 0, 0)) then 
		 mocIntClosedDoor = GetClosestObjectOfType(1102.189, -3009.409, -39.97825, 2.0, -901846631, 0, 0, 0)
		end	   
       if not DoesEntityExist(mocIntClosedDoor) then
         mocIntClosedDoor = CreateObjectNoOffset(-901846631, 1102.189, -3009.409, -39.97825, 0, 1, 0)
         SetEntityRotation(mocIntClosedDoor, -0, -0, -179.9231)
	     SetEntityHeading(mocIntClosedDoor, 180.07693481445)	   
	     FreezeEntityPosition(mocIntClosedDoor, 1)
	     SetEntityCollision(mocIntClosedDoor, true, true)
	     SetObjectTextureVariant(mocIntClosedDoor, 7)
		else 
		 SetObjectTextureVariant(mocIntClosedDoor, 7)
        end
 		
	    if not DoesEntityExist(mocMonitor3) then
	     mocMonitor3 = CreateObjectNoOffset(GetHashKey("gr_prop_gr_trailer_monitor_03"), 1106.366, -3008.03, -40.01062, 0, 1, 0)     	   
	     SetEntityRotation(mocMonitor3, -0, -0, 97.5754)
		 SetEntityHeading(mocMonitor3, 97.575401306152)
		 FreezeEntityPosition(mocMonitor3, 1)
        end  
		
-----------------------------------------------------------------------------
------------------------inside the bunker------------------------------------
-----------------------------------------------------------------------------
	 if not HasModelLoaded(-769147461)then 	    
	    RequestModel(-769147461)
	  end	 
	 if not HasModelLoaded(GetHashKey("s_m_m_scientist_01"))then 	    
	    RequestModel(GetHashKey("s_m_m_scientist_01"))
	  end	 
	 --request the MOC trailer
	 if not HasModelLoaded(1502869817) then  
	  RequestModel(1502869817)
	 end
	 --request the MOC truck
     if not HasModelLoaded(GetHashKey("hauler2")) then  
	  RequestModel(GetHashKey("hauler2"))
	 end
      if DoesEntityExist(GetClosestVehicle(890.708, -3236.804, -98.8961, 1.0, -769147461)) then
	    buggyB = GetClosestVehicle(890.708, -3236.804, -98.8961, 1.0, -769147461)
	            SetNetworkIdExistsOnAllMachines(NetworkGetNetworkIdFromEntity(buggyB), 0)
				NetworkSetEntityVisibleToNetwork(buggyB, 0)
	            SetVehicleExtra(buggyB, 2, true)
	            SetVehicleExtra(buggyB, 3, true)
	            SetVehicleExtra(buggyB, 1, true)
	            ForceRoomForEntity(buggyB, 258561, -1116396409)
	  end
      if DoesEntityExist(GetClosestVehicle(890.708, -3236.804, -98.8961, 1.0, -769147461)) then
	    buggyA = GetClosestVehicle(887.824, -3236.251, -98.8946, 1.0, -769147461)
	            SetNetworkIdExistsOnAllMachines(NetworkGetNetworkIdFromEntity(buggyA), 0)
	            NetworkSetEntityVisibleToNetwork(buggyA, 0)
	            SetVehicleExtra(buggyA, 2, false)
	            SetVehicleExtra(buggyA, 3, false)
	            SetVehicleExtra(buggyA, 1, false)
	            ForceRoomForEntity(buggyA, 258561, -1116396409)
	  end  
	  if not DoesEntityExist(buggyB) then       
	   buggyB = CreateVehicle(-769147461, 890.708, -3236.804, -98.8961, 0.0, 0, 0)	   
	            SetNetworkIdExistsOnAllMachines(NetworkGetNetworkIdFromEntity(buggyB), 1)
				NetworkSetEntityVisibleToNetwork(buggyB, 0)
	            SetVehicleExtra(buggyB, 2, true)
				SetVehicleExtra(buggyB, 3, true)
				SetVehicleExtra(buggyB, 1, true)
				ForceRoomForEntity(buggyB, 258561, -1116396409)
     end
	  if not DoesEntityExist(buggyA) then
       buggyA = CreateVehicle(-769147461, 887.824, -3236.251, -98.8946, 0.0, 0, 0)
	            SetNetworkIdExistsOnAllMachines(NetworkGetNetworkIdFromEntity(buggyA), 0)
				NetworkSetEntityVisibleToNetwork(buggyA, 0)
  	            SetVehicleExtra(buggyA, 1, false)
	            SetVehicleExtra(buggyA, 2, false)
				SetVehicleExtra(buggyA, 3, false)
				--ForceRoomForEntity(buggyA, 258561, -1116396409)
     end
	 
      if DoesEntityExist(GetClosestVehicle(890.708, -3236.804, -98.8961, 30.0, GetHashKey("hauler2"), 131078)) then
	   mocTruck = GetClosestVehicle(834.2265, -3234.795, -98.4865, 30.0, GetHashKey("hauler2"), 131078)
		     SetNetworkIdExistsOnAllMachines(NetworkGetNetworkIdFromEntity(mocTruck), 0)
             NetworkUnregisterNetworkedEntity(NetworkGetNetworkIdFromEntity(mocTruck))
			 NetworkSetEntityVisibleToNetwork(mocTruck, 0)
	         SetEntityCollision(mocTruck, true, false)
	  end
	  
      if DoesEntityExist(GetClosestVehicle(834.2265, -3234.795, -98.4865, 30.0, 1502869817, 131078)) then
		mocTrailer = GetClosestVehicle(842.6267, -3239.217, -96.8499, 30.0, 1502869817, 131078)
		     SetNetworkIdExistsOnAllMachines(NetworkGetNetworkIdFromEntity(mocTrailer), 0)
             NetworkUnregisterNetworkedEntity(NetworkGetNetworkIdFromEntity(mocTrailer))
			 NetworkSetEntityVisibleToNetwork(mocTrailer, 0)
	         SetEntityCollision(mocTrailer, true, false)
	  end
	  if not DoesEntityExist(mocTrailer) then
        mocTrailer = CreateVehicle(1502869817, 842.6267, -3239.217, -96.8499, 62.28, 0, 0)
		     SetNetworkIdExistsOnAllMachines(NetworkGetNetworkIdFromEntity(mocTrailer), 0)
             NetworkUnregisterNetworkedEntity(NetworkGetNetworkIdFromEntity(mocTrailer))
			 NetworkSetEntityVisibleToNetwork(mocTrailer, 0)
	         SetEntityCollision(mocTrailer, true, false)
      end	 
	  if not DoesEntityExist(mocTruck) then
        mocTruck = CreateVehicle(GetHashKey("hauler2"), 834.2265, -3234.795, -98.4865, 62.28, 0, 0)
		    SetNetworkIdExistsOnAllMachines(NetworkGetNetworkIdFromEntity(mocTruck), 0)
            NetworkUnregisterNetworkedEntity(NetworkGetNetworkIdFromEntity(mocTruck))
			NetworkSetEntityVisibleToNetwork(mocTruck, 0)
	        SetVehicleOnGroundProperly(mocTruck)
      end
    if DoesEntityExist(mocTrailer) and DoesEntityExist(mocTruck) then 
	  if not IsVehicleAttachedToTrailer(mocTruck) then
	   AttachVehicleToTrailer(mocTruck, mocTrailer, 1.0)
	  end
	end 
	 if not DoesEntityExist(bunkPedC) then
	   bunkPedC = CreatePed(26, GetHashKey("s_m_m_scientist_01"), 889.994, -3201.95, -98.1963, 100.0, 0, false)
       PlaceObjectOnGroundProperly(bunkPedC)
	            SetEntityNoCollisionEntity(GetPlayerPed(playerID), bunkPedC, 0)
       	        SetNetworkIdExistsOnAllMachines(bunkPedC, 0)
				NetworkUnregisterNetworkedEntity(bunkPedC)
				NetworkSetEntityVisibleToNetwork(bunkPedC, 0)
                				
	   FreezeEntityPosition(bunkPedC, 0)
     end
     if not DoesEntityExist(bunkPedB) then
	   bunkPedB = CreatePed(26, GetHashKey("s_m_m_scientist_01"), 893.9716, -3201.912, -98.19622, 33.884, 0, false)
       PlaceObjectOnGroundProperly(bunkPedB)
	            SetEntityNoCollisionEntity(GetPlayerPed(playerID), bunkPedB, 0)
       	        SetNetworkIdExistsOnAllMachines(bunkPedB, 0)
				NetworkUnregisterNetworkedEntity(bunkPedB)
				NetworkSetEntityVisibleToNetwork(bunkPedB, 0)
	   FreezeEntityPosition(bunkPedB, 0)
     end
     if not DoesEntityExist(bunkPedD) then
	   bunkPedD = CreatePed(26, GetHashKey("s_m_m_scientist_01"), 893.9716, -3201.912, -98.19622, 33.884, 0, false)
       PlaceObjectOnGroundProperly(bunkPedD)
	            SetEntityNoCollisionEntity(GetPlayerPed(playerID), bunkPedD, 0)
       	        SetNetworkIdExistsOnAllMachines(bunkPedD, 0)
				NetworkUnregisterNetworkedEntity(bunkPedD)
				NetworkSetEntityVisibleToNetwork(bunkPedD, 0)
	   FreezeEntityPosition(bunkPedD, 0)
     end
     if not DoesEntityExist(bunkPedA) then
	    bunkPedA = CreatePed(26, GetHashKey("s_m_m_scientist_01"), 885.606, -3199.558, -98.196, 33.884, 0, false)
       PlaceObjectOnGroundProperly(bunkPedA)
	   --GiveWeaponToPed(bunkPedA, 961495388, 0, true, true)
       TaskPlayAnim(bunkPedA, "anim@amb@machinery@lathe@", "unload_01_amy_skater_01", 1.0, 1.0, 1000, 0, 0, 0, 0, 0)
	            SetEntityNoCollisionEntity(GetPlayerPed(playerID), bunkPedA, 0)
       	        SetNetworkIdExistsOnAllMachines(bunkPedA, 0)
				NetworkUnregisterNetworkedEntity(bunkPedA)
				NetworkSetEntityVisibleToNetwork(bunkPedA, 0)	   
	   FreezeEntityPosition(bunkPedA, 0)
     end
	 
	 if not DoesEntityExist(modShopBunkerPed) then 
	  if not HasModelLoaded(921328393)then 	    
	    RequestModel(921328393)
	  end  
	 modShopBunkerPed = CreatePed(26, 921328393, 834.137, -3244.638, -98.699, -18.0, 0, false) 
	 end
	end
end)

------------------------------------------------------------------------------------------
----------------party time is just a bunch of girls dancing on fridays--------------------
------------------------------------------------------------------------------------------
function partyTime()
  Citizen.CreateThread(function()
  partyPeds = {"a_f_y_beach_01", "csb_stripper_01", "csb_stripper_02", "a_f_y_juggalo_01"}
    while true do
	Citizen.Wait(0)
	 if not HasModelLoaded(GetHashKey(partyPeds[1])) then
	  RequestModel(GetHashKey(partyPeds[1]))
	 end
	 if not HasModelLoaded(GetHashKey(partyPeds[2])) then
	  RequestModel(GetHashKey(partyPeds[2]))
	 end
	 if not HasModelLoaded(GetHashKey(partyPeds[3])) then
	  RequestModel(GetHashKey(partyPeds[3]))
	 end
	 if not HasModelLoaded(GetHashKey(partyPeds[4])) then
	  RequestModel(GetHashKey(partyPeds[4]))
	 end
	  if not DoesEntityExist(partyPed0) then 
	   partyPed0 = CreatePed(5, GetHashKey(partyPeds[1]), 904.9504, -3225.118, -98.2738, 0.0, 0, 0)
       	SetPedComponentVariation(partyPed0, 3, 2, 0)
	  end
	  if not DoesEntityExist(partyPed1) then 
	  partyPed1 = CreatePed(5, GetHashKey(partyPeds[2]),909.3971, -3221.369, -98.26151, 0.0, 0, 0)
        SetPedComponentVariation(partyPed1, 3, 2, 0)
	  end
	  if not DoesEntityExist(partyPed2) then 
	  partyPed2 = CreatePed(5, GetHashKey(partyPeds[3]), 901.5885, -3225.548, -98.27573, 0.0, 0, 0)
        SetPedComponentVariation(partyPed2, 3, 2, 0)	  
	  end
	  if not DoesEntityExist(partyPed3) then 
	  partyPed3 = CreatePed(5, GetHashKey(partyPeds[4]), 900.417, -3216.832, -98.232, 0.0, 0, 0)
	  
        SetPedComponentVariation(partyPed3, 3, 2, 0)	 
		
	  end
	 
	end  
  end)
end
function partyTimeOver()
  Citizen.CreateThread(function()
  
    while true do
	Citizen.Wait(0)

	  if DoesEntityExist(partyPed0) then 
	   SetEntityAsMissionEntity(partyPed0)
	   DeletePed(partyPed0)
	   SetModelAsNoLongerNeeded(GetHashKey(partyPeds[1]))
	  end
	  if DoesEntityExist(partyPed1) then 
	   SetEntityAsMissionEntity(partyPed1)
       DeletePed(partyPed1)
	   SetModelAsNoLongerNeeded(GetHashKey(partyPeds[2]))
	  end
	  if DoesEntityExist(partyPed2) then 
       SetEntityAsMissionEntity(partyPed2)
	   DeletePed(partyPed2)
	   SetModelAsNoLongerNeeded(GetHashKey(partyPeds[3]))
	  end
	  if not DoesEntityExist(partyPed3) then 	 
		SetEntityAsMissionEntity(partyPed3)
		DeletePed(partyPed3)
		--SetModelAsNoLongerNeeded(GetHashKey(partyPeds[4]))
	  end
	 
	end  
  end)
end
if (GetClockDayOfWeek() == 5 or GetClockDayOfWeek() == 6) or GetClockDayOfWeek() == 7 then 
partyTime()
 else 
partyTimeOver()
end

LoadBunkers()
-----------------------------------------------------------------
----makes players invisible to each other while in the bunker----
-----------------------------------------------------------------
Citizen.CreateThread(function()
EnableMpDlcMaps(1)
 while true do
 Citizen.Wait(0)
--Citizen.Trace(tostring(dave))
 for i = 0, 25 do
  if DoesEntityExist(GetPlayerPed(i)) and not PlayerId() == i then
    playerID = i	  
 end
 end 
  end
end)



		
