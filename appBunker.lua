

ClearPrints()




-----------------------------------------------------------
--**************************************************------
--*************this is the button states*************---
--***************can only be set  to 0, 1, 2 *******------
----------------------------------------------------------

--setup button
 button1state  = 2
--resupply button
 button2state  = 2
--research button
 button3state  = 2
--manage staff button
 button4state  = 2
--buy upgrades button
 button5state  = 2
--shut down business
 button6state  = 2
--restart business
 button7state  = 2
--sell stock button
 button8state  = 2
--fast track research button
 button9state  = 2
 --buy supplies button
 button10state = 2
--buy upgrades buttons
 button11state = 2
--
 button12state = 2
 button13state = 2
 button14state = 2
----------------------------------------------------------
--=======================================================

-----------------------------------------------------------
--**************************************************------
--*************this is the bunker stats *************---
--***you will want to play with different numbers***------
----------------------------------------------------------
status = 1
stock = 0
research = 0
supplies = 0
earnings = 0
sold = 0
resuppliy = 0
sellBlain = 0
sellLos = 0
units = 0
researchOf = 0
researchresearch = 420
----------------------------------------------------------
--========================================================

----------------------------------------------------------
--***some functions you dont need to worry about these***--
-----------------------------------------------------------
function Notify(text)
    SetNotificationTextEntry('STRING')
    AddTextComponentString(text)
    DrawNotification(false, false)
end
function drawTxt(x, y, width, height, scale, text, r, g, b, a, outline)
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
	DisplayHelpTextFromStringLabel(0, 1, 1, 1000)
	
end
-------------------------------------------------------------------
--=================================================================

-------------------------------------------------------------------
----------------------**scaleform testing**------------------------
-------------------------------------------------------------------

ii = 0
function hideMiniMapStuff()
	HideHelpTextThisFrame()
	HideHudAndRadarThisFrame()
	HideScriptedHudComponentThisFrame(19)
	HideHudComponentThisFrame(4)
	HideHudComponentThisFrame(5)
	HideHudComponentThisFrame(13)
	HideHudComponentThisFrame(3)
end

	local disable = true
    local disable2 = true
	
function setDisruptionStats()
          PushScaleformMovieFunctionParameterBool(true) 
	 	  PushScaleformMovieFunction(scaleform, "SET_STATS")
------------------UNKNOWN-------------------		  
----------------logged in as-------------		  
		  Citizen.InvokeNative(0xE234F0FBDDB9340A, GetPlayerName(PlayerId()))
		  PushScaleformMovieFunctionParameterInt(PlayerId())
----------------picture of bunker-----------		  
		  Citizen.InvokeNative(0xE234F0FBDDB9340A, "UA_BUNKER_TXD_"..ii)
		   ii = ii + 1
-------------text under bunker pic----------		  
		  Citizen.InvokeNative(0xE234F0FBDDB9340A, "just some text")		 		  
-------set location text------		  
		  Citizen.InvokeNative(0xE234F0FBDDB9340A, "some more text")
-------set business status ----
--possible options are {0 = unowned, 1 = active, 2 = inactive - pendind restart, 3 = suspended, 4 = inactive - pending set up}		  
		  PushScaleformMovieFunctionParameterInt(status)
-------set stock level (0-100%)--------		  
		  PushScaleformMovieFunctionParameterInt(stock)
-------set research progress (0-100%)---		  
		  PushScaleformMovieFunctionParameterInt(research)
-------set supplies level (0-100%)------		  
		  PushScaleformMovieFunctionParameterInt(supplies)
-------set total earnings in $$------		 
		  PushScaleformMovieFunctionParameterInt(earnings)
-------set total number of items sold---------		  
		  PushScaleformMovieFunctionParameterInt(sold)
-------set resuppliy success rate (0-100%)---		  
		  PushScaleformMovieFunctionParameterInt(resuppliy)
------set sell success rate(blain county) (0-100%)------	  
		  PushScaleformMovieFunctionParameterInt(sellBlain)
------set sell success rate(los santos) (0-100%)------		  
		  PushScaleformMovieFunctionParameterInt(sellLos)
------set number of units manufactered------- 		  
		  PushScaleformMovieFunctionParameterInt(units)
------set number of research projects of total completed---		  
		  PushScaleformMovieFunctionParameterInt(researchOf)
------set number of total research projects-------
		 PushScaleformMovieFunctionParameterInt(researchresearch)
-------UNKNOWN------
		 PushScaleformMovieFunctionParameterInt(staff)		       		  
	       PopScaleformMovieFunctionVoid()
		  if ii >=12 then
		   ii = 0
		  end
end	
function enableControlActions()

-------input group "INPUTGROUP_LOOK "---------
----control name "INPUT_MULTIPLAYER_INFO"-----

	  EnableControlAction(1, 20, 1)
--------------button/key "z"------------------
--******************************************--
-------input group "INPUTGROUP_LOOK "---------
-------control name "INPUT_PICKUP"------------

	  EnableControlAction(1, 38, 1)
--------------button/key "e"------------------
--******************************************--
-------input group "INPUTGROUP_LOOK "---------
--------control name "INPUT_COVER"------------	  

	  EnableControlAction(1, 44, 1)
--------------button/key "q"------------------
--******************************************--
-------input group "INPUTGROUP_LOOK "---------
--control name "INPUT_FRONTEND_DOWN "--

	  EnableControlAction(2, 187, 1)
--------------button/key "down"------------------
--******************************************--
-------input group "INPUTGROUP_LOOK "---------
--control name "INPUT_FRONTEND_UP"--

	  EnableControlAction(2, 188, 1)
--------------button/key "up"------------------
--******************************************--
-------input group "INPUTGROUP_LOOK "---------
--control name "INPUT_FRONTEND_RIGHT_AXIS_X "--

	  EnableControlAction(2, 197, 1)
--------------button/key "p"------------------
--******************************************--
-------input group "INPUTGROUP_LOOK "---------
--control name "INPUT_FRONTEND_RIGHT_AXIS_Y"--

	  EnableControlAction(2, 198, 1)
--------------button/key "p"------------------
--******************************************--
-------input group "INPUTGROUP_LOOK "---------
------control name "INPUT_FRONTEND_PAUSE"-----

	  EnableControlAction(2, 199, 1)
--------------button/key "p"------------------
--******************************************--
--******************************************--
-------input group "INPUTGROUP_LOOK "---------
------control name "INPUT_FRONTEND_LB"--------  

	  EnableControlAction(2, 201, 1)
----button/key "left controller button"-------
--******************************************--
-------input group "INPUTGROUP_LOOK "---------
------control name "INPUT_FRONTEND_RB"--------	  

	  EnableControlAction(2, 202, 1)
-----button/key "right controller button"-----
-------input group "INPUTGROUP_LOOK "---------
------control name "INPUT_FRONTEND_LB"--------  

	  EnableControlAction(2, 205, 1)
----button/key "left controller button"-------
--******************************************--
-------input group "INPUTGROUP_LOOK "---------
------control name "INPUT_FRONTEND_RB"--------	  

	  EnableControlAction(2, 206, 1)
-----button/key "right controller button"-----
--******************************************--
-------input group "INPUTGROUP_LOOK "---------
------control name "INPUT_FRONTEND_RB"--------	  

	  EnableControlAction(2, 207, 1)
-----button/key "right controller button"-----
--******************************************--
-------input group "INPUTGROUP_LOOK "---------
------control name "INPUT_FRONTEND_RB"--------	  

	  EnableControlAction(2, 208, 1)
-----button/key "right controller button"-----
--******************************************--	  
-------input group "INPUTGROUP_LOOK "---------
------control name "INPUT_CURSOR_ACCEPT"------

	  EnableControlAction(2, 237, 1)
---------button/key "left mouse button"-------
--******************************************--	  
-------input group "INPUTGROUP_LOOK "---------
------control name "INPUT_CURSOR_CANCEL"------	  

	  EnableControlAction(2, 238, 1)
-----button/key "right mouse button"-----
--******************************************--
-------input group "INPUTGROUP_LOOK "---------
------control name "INPUT_CURSOR_SCROLL_UP"------	  

	  EnableControlAction(2, 242, 1)
-----button/key "right mouse button"-----
--******************************************--	
-------input group "INPUTGROUP_LOOK "---------
------control name "INPUT_CURSOR_SCROLL_DOWN"------	  

	  EnableControlAction(2, 241, 1)
-----button/key "right mouse button"-----
--******************************************--		  
end	

bvar = 0.0
enableControlActions()
function enableMouse()
 PushScaleformMovieFunction(scaleform, "SET_MOUSE_INPUT")
 PushScaleformMovieFunctionParameterFloat(GetDisabledControlNormal(2, 239))
 PushScaleformMovieFunctionParameterFloat(GetDisabledControlNormal(2, 240))
 PushScaleformMovieFunctionParameterInt(-1)
 PopScaleformMovieFunctionVoid()
 if HasNamedScaleformMovieLoaded("DISRUPTION_LOGISTICS")   then
  
 PushScaleformMovieFunction(scaleform, "SET_BUTTON_STATES")
 PushScaleformMovieFunctionParameterInt(button1state )
 PushScaleformMovieFunctionParameterInt(button2state )
 PushScaleformMovieFunctionParameterInt(button3state )
 PushScaleformMovieFunctionParameterInt(button4state ) 
 PushScaleformMovieFunctionParameterInt(button5state )
 PushScaleformMovieFunctionParameterInt(button6state )
 PushScaleformMovieFunctionParameterInt(button7state )
 PushScaleformMovieFunctionParameterInt(button8state )
 PushScaleformMovieFunctionParameterInt(button9state )
 PushScaleformMovieFunctionParameterInt(button10state)
 PushScaleformMovieFunctionParameterInt(button11state)
 PushScaleformMovieFunctionParameterInt(button12state)
 PushScaleformMovieFunctionParameterInt(button13state)
 PushScaleformMovieFunctionParameterInt(button14state)
 PopScaleformMovieFunctionVoid() 
 end 
 --setDisruptionStats()
 --IsControlJustPressed(2, 242)         
  if IsControlJustPressed(2, 242) and bvar >0 then
   bvar = 0.0
  elseif IsControlJustPressed(2, 241) and bvar <200 then
   bvar = 200.0
  end
 

 PushScaleformMovieFunction(scaleform, "SET_ANALOG_STICK_INPUT")
 PushScaleformMovieFunctionParameterBool(false)
 PushScaleformMovieFunctionParameterInt(0)
 PushScaleformMovieFunctionParameterFloat(bvar)          			
 PopScaleformMovieFunctionVoid()
end	

function things(scaleforms)
    if disable == false  then		
      scaleform = RequestScaleformMovie(scaleforms)
     if HasScaleformMovieLoaded(scaleform) then		 
	  Set_2dLayer(4)		  
      enableMouse()	  
	  hideMiniMapStuff()	  
 	 end
	end		
end

function logInButton() 		  
 if HasNamedScaleformMovieLoaded("DISRUPTION_LOGISTICS") then
  
  if IsControlJustPressed(2, 237) and vVar == nil then
    setDisruptionStats()
       PushScaleformMovieFunction(scaleform, "GET_CURRENT_ROLLOVER")
	 inputeventSelect = PopScaleformMovieFunction()
  selectionBool = Citizen.InvokeNative(0x768FF8961BA904D6, getCurrentSelection)
   ScreenIDBool = Citizen.InvokeNative(0x768FF8961BA904D6, getCurrentScreenID)
   vVar = Citizen.InvokeNative(0x2DE7EFA66B906036, getCurrentSelection)
   nVar = Citizen.InvokeNative(0x2DE7EFA66B906036, getCurrentScreenID)
 	 
	PushScaleformMovieFunction(scaleform, "APP_IS_DEACTIVATED")
	 isAppActivated = PopScaleformMovieFunction()
	 isAppActivated2 = Citizen.InvokeNative(0x768FF8961BA904D6, inputeventSelect)
	 isAppActivated3 = Citizen.InvokeNative(0x2DE7EFA66B906036, inputeventSelect)
	 Citizen.Trace("isAppActivated "..tostring(isAppActivated2))	
    
	Citizen.Trace("page "..tostring(page))
	   Citizen.Trace("selectionBool: "..tostring(selectionBool).." ScreenIDBool: "..tostring(ScreenIDBool).." get current selection: "..tostring(vVar).." get current screenID: "..tostring(nVar))  
   PushScaleformMovieFunction(scaleform, "GET_CURRENT_ROLLOVER")
   getCurrentSelection = PopScaleformMovieFunction()
   PushScaleformMovieFunction(scaleform, "GET_CURRENT_SCREEN_ID")
   getCurrentScreenID = PopScaleformMovieFunction() 
   CallScaleformMovieFunctionFloatParams(scaleform, "SET_INPUT_EVENT", 201.0, -1, -1, -1, -1)
      CallScaleformMovieFunctionFloatParams(scaleform, "SET_INPUT_EVENT", 201.0, -1, -1, -1, -1)
      
   else
    vVar = nil
	nvar = nil
	--page - nil
  end
  --[[
  if IsControlJustPressed(2, 238) then    
    Citizen.Trace("ControlJustPressed 02")
	Citizen.Trace("page "..tostring(page))   
  end 
  --]]
 end
end
       




function randomDisruptionLogisticsStats()
  stock = GetRandomIntInRange(0, 100)
  research = GetRandomIntInRange(0, 100)
  supplies = GetRandomIntInRange(0, 100)
  earnings = GetRandomIntInRange(0, 1000000)
  sold = GetRandomIntInRange(0, 10000)
  resuppliy = GetRandomIntInRange(0, 100)
  sellBlain = GetRandomIntInRange(0, 100)
  sellLos = GetRandomIntInRange(0, 100) 
  units = GetRandomIntInRange(0, 10000)
  researchOf = GetRandomIntInRange(0, 420)
end
researchStatsSet = false
function setDisruptionResearchStats()		  
		 researchStatsSet = true

         PushScaleformMovieFunction(scaleform, "SET_RESEARCH")
		 PushScaleformMovieFunctionParameterInt(1000)
		 PushScaleformMovieFunctionParameterInt(25)
		 Citizen.InvokeNative(0xE234F0FBDDB9340A, "UA_UNLOCK_1")
		 PushScaleformMovieFunctionParameterInt(2)
		 PushScaleformMovieFunctionParameterInt(2)
		 PopScaleformMovieFunctionVoid()
         PushScaleformMovieFunction(scaleform, "ADD_RESEARCH")
		 PushScaleformMovieFunctionParameterInt(250)
		 PushScaleformMovieFunctionParameterInt(75)
		 PushScaleformMovieFunctionParameterInt(1)
		 PushScaleformMovieFunctionParameterInt(1)
		 PushScaleformMovieFunctionParameterString("some text")
		 PushScaleformMovieFunctionParameterInt(1)
		 PushScaleformMovieFunctionParameterInt(100)
		 PopScaleformMovieFunctionVoid()
		 PushScaleformMovieFunction(scaleform, "ADD_RESEARCH_UNLOCKABLE")
		 PushScaleformMovieFunctionParameterInt(2)
		 Citizen.InvokeNative(0xE234F0FBDDB9340A, "UA_UNLOCK_1_LOCKED") 
         BeginTextComponent("RES_UNLCK_T_1RES_UNLCK_LCK")
		 EndTextComponent()
         BeginTextComponent("RES_UNLCK_D_1RES_UNLCK_LCK")
		 EndTextComponent()
		 PopScaleformMovieFunctionVoid()
		 PushScaleformMovieFunction(scaleform, "ADD_RESEARCH_UNLOCKABLE")
		 PushScaleformMovieFunctionParameterInt(1)		 
		 Citizen.InvokeNative(0xE234F0FBDDB9340A, "UA_UNLOCK_2_LOCKED")		 
         BeginTextComponent("RES_UNLCK_LCK")
		 EndTextComponent()
         BeginTextComponent("RES_UNLCK_LCK")
		 EndTextComponent()
		 PushScaleformMovieFunctionParameterInt(1)
		 PopScaleformMovieFunctionVoid()
		 PushScaleformMovieFunction(scaleform, "ADD_RESEARCH_UNLOCKABLE")
		 PushScaleformMovieFunctionParameterInt(1)		 
		 Citizen.InvokeNative(0xE234F0FBDDB9340A, "UA_UNLOCK_3_LOCKED")		 
         BeginTextComponent("RES_UNLCK_LCK")
		 EndTextComponent()
         BeginTextComponent("RES_UNLCK_LCK")
		 EndTextComponent()
		 PushScaleformMovieFunctionParameterInt(2)
		 PopScaleformMovieFunctionVoid()
		 PushScaleformMovieFunction(scaleform, "ADD_RESEARCH_UNLOCKABLE")
		 PushScaleformMovieFunctionParameterInt(1)		 
		 Citizen.InvokeNative(0xE234F0FBDDB9340A, "UA_UNLOCK_4_LOCKED")		 
         BeginTextComponent("RES_UNLCK_LCK")
		 EndTextComponent()
         BeginTextComponent("RES_UNLCK_LCK")
		 EndTextComponent()
		 PushScaleformMovieFunctionParameterInt(3)
		 PopScaleformMovieFunctionVoid()
		 PushScaleformMovieFunction(scaleform, "ADD_RESEARCH_UNLOCKABLE")
		 PushScaleformMovieFunctionParameterInt(1)		 
		 Citizen.InvokeNative(0xE234F0FBDDB9340A, "UA_UNLOCK_5_LOCKED")		 
         BeginTextComponent("RES_UNLCK_LCK")
		 EndTextComponent()
         BeginTextComponent("RES_UNLCK_LCK")
		 EndTextComponent()
		 PushScaleformMovieFunctionParameterInt(4)
		 PopScaleformMovieFunctionVoid()
		 PushScaleformMovieFunction(scaleform, "ADD_RESEARCH_UNLOCKABLE")
		 PushScaleformMovieFunctionParameterInt(1)		 
		 Citizen.InvokeNative(0xE234F0FBDDB9340A, "UA_UNLOCK_6_LOCKED")		 
         BeginTextComponent("RES_UNLCK_LCK")
		 EndTextComponent()
         BeginTextComponent("RES_UNLCK_LCK")
		 EndTextComponent()
		 PushScaleformMovieFunctionParameterInt(5)
		 PopScaleformMovieFunctionVoid()
		 PushScaleformMovieFunction(scaleform, "ADD_RESEARCH_UNLOCKABLE")
		 PushScaleformMovieFunctionParameterInt(1)		 
		 Citizen.InvokeNative(0xE234F0FBDDB9340A, "UA_UNLOCK_7_LOCKED")		 
         BeginTextComponent("RES_UNLCK_LCK")
		 EndTextComponent()
         BeginTextComponent("RES_UNLCK_LCK")
		 EndTextComponent()
		 PushScaleformMovieFunctionParameterInt(6)
		 PopScaleformMovieFunctionVoid()
		 PushScaleformMovieFunction(scaleform, "ADD_RESEARCH_UNLOCKABLE")
		 PushScaleformMovieFunctionParameterInt(1)		 
		 Citizen.InvokeNative(0xE234F0FBDDB9340A, "UA_UNLOCK_8_LOCKED")		 
         BeginTextComponent("RES_UNLCK_LCK")
		 EndTextComponent()
         BeginTextComponent("RES_UNLCK_LCK")
		 EndTextComponent()
		 PushScaleformMovieFunctionParameterInt(7)
		 PopScaleformMovieFunctionVoid()
		 PushScaleformMovieFunction(scaleform, "ADD_RESEARCH_UNLOCKABLE")
		 PushScaleformMovieFunctionParameterInt(1)		 
		 Citizen.InvokeNative(0xE234F0FBDDB9340A, "UA_UNLOCK_9_LOCKED")		 
         BeginTextComponent("RES_UNLCK_LCK")
		 EndTextComponent()
         BeginTextComponent("RES_UNLCK_LCK")
		 EndTextComponent()
		 PushScaleformMovieFunctionParameterInt(8)
		 PopScaleformMovieFunctionVoid()
		 PushScaleformMovieFunction(scaleform, "ADD_RESEARCH_UNLOCKABLE")
		 PushScaleformMovieFunctionParameterInt(1)		 
		 Citizen.InvokeNative(0xE234F0FBDDB9340A, "UA_UNLOCK_10_LOCKED")		 
         BeginTextComponent("RES_UNLCK_LCK")
		 EndTextComponent()
         BeginTextComponent("RES_UNLCK_LCK")
		 EndTextComponent()
		 PushScaleformMovieFunctionParameterInt(9)
		 PopScaleformMovieFunctionVoid()
		 PushScaleformMovieFunction(scaleform, "ADD_RESEARCH_UNLOCKABLE")
		 PushScaleformMovieFunctionParameterInt(1)		 
		 Citizen.InvokeNative(0xE234F0FBDDB9340A, "UA_UNLOCK_11_LOCKED")		 
         BeginTextComponent("RES_UNLCK_LCK")
		 EndTextComponent()
         BeginTextComponent("RES_UNLCK_LCK")
		 EndTextComponent()
		 PushScaleformMovieFunctionParameterInt(10)
		 PopScaleformMovieFunctionVoid()
		 PushScaleformMovieFunction(scaleform, "ADD_RESEARCH_UNLOCKABLE")
		 PushScaleformMovieFunctionParameterInt(1)		 
		 Citizen.InvokeNative(0xE234F0FBDDB9340A, "UA_UNLOCK_12_LOCKED")		 
         BeginTextComponent("RES_UNLCK_LCK")
		 EndTextComponent()
         BeginTextComponent("RES_UNLCK_LCK")
		 EndTextComponent()
		 PushScaleformMovieFunctionParameterInt(11)
		 PopScaleformMovieFunctionVoid()		 		 		 		 		 		 
		
end

function setDisruptionResupply()
 PushScaleformMovieFunction(scaleform, "SET_RESUPPLIES")
  PushScaleformMovieFunctionParameterInt(10000)
  PushScaleformMovieFunctionParameterInt(2)
  PushScaleformMovieFunctionParameterInt(2)
  PushScaleformMovieFunctionParameterInt(50000)

  
end
function setDisruptionUpgrades()
 PushScaleformMovieFunction(scaleform, "SET_UPGRADES")
 PushScaleformMovieFunctionParameterInt(2000)
 PushScaleformMovieFunctionParameterInt(1)
 PushScaleformMovieFunctionParameterInt(2000)
 PushScaleformMovieFunctionParameterInt(1)
 PushScaleformMovieFunctionParameterInt(2000)
 PushScaleformMovieFunctionParameterInt(1)
 PushScaleformMovieFunctionParameterInt(100)
 PushScaleformMovieFunctionParameterInt(100)
 PushScaleformMovieFunctionParameterInt(100)
end

function randompage()
 ranNum = GetRandomIntInRange(0, 12)
  
  if ranNum == 0 then
   return "WWW_LIFEINVADER_COM"
  end
  if ranNum == 1 then
   return "WWW_WARSTOCK_D_CACHE_D_AND_D_CARRY_COM"
  end   
  if ranNum == 2 then
   return "WWW_EPSILONPROGRAM_COM"
  end     
  if ranNum == 3 then
   return "WWW_LCN_D_EXCHANGE_COM_S_STOCK_VIEW"
  end  
  if ranNum == 4 then
   return "WWW_DOCKTEASE_COM"
  end 
  if ranNum == 5 then
   return "WWW_ELITASTRAVEL_COM"
  end
  if ranNum == 6 then
   return "WWW_THEREALITYMILL_COM"
  end 
  if ranNum == 7 then
   return "WWW_THECHILDRENOFTHEMOUNTAIN_COM"
  end
  if ranNum == 8 then
   return "WWW_BENNYSORIGINALMOTORWORKS_COM"
  end 
  if ranNum == 9 then
   return "WWW_SOUTHERNSANANDREASSUPERAUTOS_COM"
  end
  if ranNum == 10 then
   return "WWW_PANDMCYCLES_COM"
  end
  if ranNum == 11 then
   return "WWW_LEGENDARYMOTORSPORT_NET"
  end 
  if ranNum == 12 then
   return "WWW_EYEFIND_INFO/search+media"
  end 
end


Citizen.CreateThread(function()


 while true do
 





  if selectionBool and ScreenIDBool then 

   if vVar == 2 and nVar == 2 then
     PushScaleformMovieFunction(scaleform, "SHOW_SCREEN")
	 PushScaleformMovieFunctionParameterInt(1)
	 PopScaleformMovieFunctionVoid()
	 --setDisruptionStats()	 
	 page = 1
   end
   if vVar == 3 then
     PushScaleformMovieFunction(scaleform, "SHOW_SCREEN")
	 PushScaleformMovieFunctionParameterInt(2)
	 PopScaleformMovieFunctionVoid()
	 setDisruptionResupply()	 
	 page = 2
   end
   if vVar == 4 then
    if researchStatsSet == false then
     setDisruptionResearchStats()
	end
     PushScaleformMovieFunction(scaleform, "SHOW_SCREEN")
	 PushScaleformMovieFunctionParameterInt(3)
	 --PopScaleformMovieFunctionVoid()
	 page = 3
   end
   if vVar == 21 then
     PushScaleformMovieFunction(scaleform, "SHOW_SCREEN")
	 PushScaleformMovieFunctionParameterInt(7)
     --PopScaleformMovieFunctionVoid()
	 page = 7
   end
   if vVar == 5 then
     PushScaleformMovieFunction(scaleform, "SHOW_SCREEN")
	 PushScaleformMovieFunctionParameterInt(4)
	 --PopScaleformMovieFunctionVoid()
	 --setDisruptionResearchStats()
	 page = 4
   end
   if vVar == 6 then
     PushScaleformMovieFunction(scaleform, "SHOW_SCREEN")
	 PushScaleformMovieFunctionParameterInt(5)
	 --setDisruptionResearchStats()
	 page = 5
   end 
   if vVar == 13 then
   --setDisruptionResearchStats()
	 page = 5
   end 
   if vVar == 14 then
   --setDisruptionResearchStats()
	 page = 5
   end
   if vVar == 15 then
   --setDisruptionResearchStats()
   
	 page = 5
   end   
     if vVar == 16 and nVar == 4 then
      staff = 0
   end
   if vVar == 17 and nVar == 4 then
   --setDisruptionResearchStats()
      staff = 1
   end
   if vVar == 18 and nVar == 4 then
   --setDisruptionResearchStats()
    staff = 2
   end   
  end 
  --PopScaleformMovieFunctionVoid()
  if IsControlPressed(2, 44) and disable == false then
   if page ~= 1  then
     PushScaleformMovieFunction(scaleform, "SHOW_SCREEN")
	 PushScaleformMovieFunctionParameterInt(1)
	 --PopScaleformMovieFunctionVoid()
	 page = 1
   end 
  end
	Citizen.Wait(0)	




	
     playerPed = GetPlayerPed(PlayerId())
     playerCoords = GetEntityCoords(GetPlayerPed(PlayerId()), true) 
     if GetDistanceBetweenCoords(playerCoords, 908.404, -3207.314, -97.187) < 2.8 then
	  PlaySoundFrontend()
	--setDisruptionResearchStats()
      DisplayHelpText("Use ~INPUT_PICKUP~ to ~y~open business")
	 end
	 if GetDistanceBetweenCoords(playerCoords, 908.404, -3207.314, -97.187) < 2.8 and IsControlJustPressed(1, 38) then	 
	  
	  disable = not disable
      randomDisruptionLogisticsStats()
	  --setDisruptionResearchStats()	  
     elseif GetDistanceBetweenCoords(playerCoords, 908.404, -3207.314, -97.187) > 2.8 then
	  disable = true
	 end
	 if IsControlJustPressed(1, 20) then
	  disable2 = not disable2   
	 end
	 if IsControlJustPressed(1, 38) then	 
	  overlayAToggle = not overlayAToggle
	  
	 end	 
     if disable == true then
	  disruptScreen = true
      SetScaleformMovieAsNoLongerNeeded(scaleform)
      page = 0
	  researchStatsSet = false
	   --setDisruptionResearchStats()
     end	
    if disable == false then
	 disruptScreen = false
      things("DISRUPTION_LOGISTICS")
       DrawScaleformMovieFullscreen(scaleform, 255, 25, 100, 255, 0)	 
	   
		if page == 0 and vVar == 1 then
          		
		 --PopScaleformMovieFunctionVoid()
		 
		
		end
		if page == 2 then		 
         --setDisruptionResearchStats()
		 --setDisruptionStats()
		end	
		if page == 3 then		 
         --setDisruptionResearchStats()
		 --setDisruptionStats()
		end	
		if page == 7 then		 
        -- setDisruptionResearchStats()
		 --setDisruptionStats()
		end	
		if page == 4 then		 
         --setDisruptionResearchStats()
		 --setDisruptionStats()
		end	
		if page == 5 then		 
         -- setDisruptionResearchStats()
          --setDisruptionStats()	 
		end			
	
	  logInButton()      	  			 	
	end	
	if disable2 == false then
	 things("web_browser")
	 
	end			
end
--setDisruptionResearchStats()
end)
--setDisruptionResearchStats()
disruptScreen = false
Citizen.CreateThread(function()
 while true do
  Citizen.Wait(0)
	 playerPed = GetPlayerPed(PlayerId())
     playerCoords = GetEntityCoords(playerPed, true)
     
	 if GetInteriorFromEntity(playerPed) == 258561 and disruptScreen == false then
	  RequestStreamedTextureDict("Prop_Screen_GR_Disruption", 0)
	   if HasStreamedTextureDictLoaded("Prop_Screen_GR_Disruption") then
        if not IsNamedRendertargetRegistered("gr_bunker_laptop_01a") then
	     RegisterNamedRendertarget("gr_bunker_laptop_01a", 0)
        end 
		if not Citizen.InvokeNative(0x4EC4357A34845D4A, -424277613) then
		 LinkNamedRendertarget(-424277613)
		 disruptScreen = true
		end
	   end
	end
	
    if GetInteriorFromEntity(playerPed) == 258561 and disruptScreen == true then
     bunkerLaptopRenderTargetId = GetNamedRendertargetRenderId("gr_bunker_laptop_01a")
	 SetTextRenderId(bunkerLaptopRenderTargetId)
	 SetScreenDrawPosition(73, 73)
     Citizen.InvokeNative(0x61BB1D9B3A95D802, 4)
     Citizen.InvokeNative(0xC6372ECD45D73BCD, 1)
     DrawSprite("Prop_Screen_GR_Disruption", "Prop_Screen_GR_Disruption", 0.5, 0.5, 1.0, 1.0, 0.0, 255, 255, 255, 255)
	 ScreenDrawPositionEnd()
	 SetTextRenderId(GetDefaultScriptRendertargetRenderId())
    end
    --if disruptScreen == false then
     --SetTextRenderId(GetDefaultScriptRendertargetRenderId())
    --end	
 
 end
end)
