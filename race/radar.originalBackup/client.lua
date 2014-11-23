local sx,sy = guiGetScreenSize()
local posx = sy * 0.05
local posy = sy * 0.725
local height = sy * 0.225
local centerleft = posx + height / 2
local centertop = posy + height / 2
local blipsize = height / 16
local lpsize = height / 8
local range = 180
local derwirklichespieler = getLocalPlayer()
local lp = getLocalPlayer()

function findRotation(x1,y1,x2,y2)
  local t = -math.deg(math.atan2(x2-x1,y2-y1))
  if t < 0 then t = t + 360 end
  return t
end

function getDistanceRotation(x, y, dist, angle)
  local a = math.rad(90 - angle)
  local dx = math.cos(a) * dist
  local dy = math.sin(a) * dist
  return x+dx, y+dy
end

local huntersonly = false

setTimer(
function()
	huntersonly = true
	for id, player in ipairs(getElementsByType("player")) do
		if getElementData(player, "state") == "alive" then
			if getPedOccupiedVehicle(player) and getElementModel(getPedOccupiedVehicle(player)) ~= 425 then
				huntersonly = false
			end
		end
	end
	local target = getCameraTarget()
	if target and getElementType(target) == "vehicle" then
		lp = getVehicleOccupant(target)
	else
		lp = getLocalPlayer()
	end
end,1000,0)

rotationRotator = 0
addEventHandler("onClientHUDRender", getRootElement(), 
function()
	showPlayerHudComponent("radar", false)
	local px, py, pz = getElementPosition(lp)
    local pr = getPedRotation(lp)
    local cx,cy,_,tx,ty = getCameraMatrix()
    local north = findRotation(cx,cy,tx,ty)

	dxDrawImage(sx*0.01,sy*0.7,sx*0.05,sy*0.03, "logo.png")
	dxDrawImage(posx,posy,height,height, "radar/img/radar.png")
	dxDrawImage(posx,posy,height,height, "radar/img/north.png", north)
	if getElementData(derwirklichespieler, "radarNotRender") then
	else
		local r,g,b,a = 255,255,255,255
		for id, object in pairs(getElementsByType("object")) do
			local ox, oy, oz = getElementPosition(object)
			local dist = getDistanceBetweenPoints2D(px,py,ox,oy)
			if dist <= range then
				if getElementModel(object) == 8838 then
					local rotx,roty,rotz = getElementRotation(object)
					local angle = 180-north + findRotation(px,py,ox,oy)
					local cblipx, cblipy = getDistanceRotation(0, 0, height*(dist/range)/2, angle)
					local blipsizex = blipsize*1.8*math.abs(math.cos(math.rad(roty)))
					local blipsizey = blipsize*0.22*math.abs(math.cos(math.rad(rotx)))
					if blipsizex < 0.2 then
						blipsizex = 0.2
					end
					if blipsizey < 0.2 then
						blipsizey = 0.2
					end
					local blipx = centerleft+cblipx-blipsizex/2
					local blipy = centertop+cblipy-blipsizey/2
					img = "radar/img/smallshadedark.png"
					dxDrawImage(blipx, blipy, blipsizex, blipsizey, img, north-rotz, 0, 0, tocolor(r,g,b,a))
				elseif getElementModel(object) == 8557 then
					local rotx,roty,rotz = getElementRotation(object)
					local angle = 180-north + findRotation(px,py,ox,oy)
					local cblipx, cblipy = getDistanceRotation(0, 0, height*(dist/range)/2, angle)
					local blipsizex = blipsize*1.8*math.abs(math.cos(math.rad(roty)))
					local blipsizey = blipsize*0.22*math.abs(math.cos(math.rad(rotx)))
					if blipsizex < 0.2 then
						blipsizex = 0.2
					end
					if blipsizey < 0.2 then
						blipsizey = 0.2
					end
					local blipx = centerleft+cblipx-blipsizex/2
					local blipy = centertop+cblipy-blipsizey/2
					img = "radar/img/shadedark.png"
					dxDrawImage(blipx, blipy, blipsizex, blipsizey, img, north-rotz, 0, 0, tocolor(r,g,b,a))
				elseif getElementModel(object) == 8558 then
					local rotx,roty,rotz = getElementRotation(object)
					local angle = 180-north + findRotation(px,py,ox,oy)
					local cblipx, cblipy = getDistanceRotation(0, 0, height*(dist/range)/2, angle)
					local blipsizex = blipsize*1.8*math.abs(math.cos(math.rad(roty)))
					local blipsizey = blipsize*0.22*math.abs(math.cos(math.rad(rotx)))
					if blipsizex < 0.2 then
						blipsizex = 0.2
					end
					if blipsizey < 0.2 then
						blipsizey = 0.2
					end
					local blipx = centerleft+cblipx-blipsizex/2
					local blipy = centertop+cblipy-blipsizey/2
					img = "radar/img/shadedark.png"
					dxDrawImage(blipx, blipy, blipsizex, blipsizey, img, north-rotz, 0, 0, tocolor(r,g,b,a))
				elseif getElementModel(object) == 3458 then
					local rotx,roty,rotz = getElementRotation(object)
					local angle = 180-north + findRotation(px,py,ox,oy)
					local cblipx, cblipy = getDistanceRotation(0, 0, height*(dist/range)/2, angle)
					local blipsizex = blipsize*1.8*math.abs(math.cos(math.rad(roty)))
					local blipsizey = blipsize*0.22*math.abs(math.cos(math.rad(rotx)))
					if blipsizex < 0.2 then
						blipsizex = 0.2
					end
					if blipsizey < 0.2 then
						blipsizey = 0.2
					end
					local blipx = centerleft+cblipx-blipsizex/2
					local blipy = centertop+cblipy-blipsizey/2
					img = "radar/img/shade.png"
					dxDrawImage(blipx, blipy, blipsizex, blipsizey, img, north-rotz, 0, 0, tocolor(r,g,b,a))
				elseif getElementModel(object) == 18450 then
					local rotx,roty,rotz = getElementRotation(object)
					local angle = 180-north + findRotation(px,py,ox,oy)
					local cblipx, cblipy = getDistanceRotation(0, 0, height*(dist/range)/2, angle)
					local blipsizex = blipsize*3.65*math.abs(math.cos(math.rad(roty)))
					local blipsizey = blipsize*1*math.abs(math.cos(math.rad(rotx)))
					if blipsizex < 0.1 then
						blipsizex = 0.1
					end
					if blipsizey < 0.2 then
						blipsizey = 0.2
					end
					local blipx = centerleft+cblipx-blipsizex/2
					local blipy = centertop+cblipy-blipsizey/2
					img = "radar/img/road.png"
					dxDrawImage(blipx, blipy, blipsizex, blipsizey, img, north-rotz+0, 0, 0, tocolor(r,g,b,a))
				elseif getElementModel(object) == 16430 then
					local rotx,roty,rotz = getElementRotation(object)
					local angle = 180-north + findRotation(px,py,ox,oy)
					local cblipx, cblipy = getDistanceRotation(0, 0, height*(dist/range)/2, angle)
					local blipsizex = blipsize*7.1*math.abs(math.cos(math.rad(roty)))
					local blipsizey = blipsize*1*math.abs(math.cos(math.rad(rotx)))
					if blipsizex < 0.3 then
						blipsizex = 0.3
					end
					if blipsizey < 0.4 then
						blipsizey = 0.4
					end
					local blipx = centerleft+cblipx-blipsizex/2
					local blipy = centertop+cblipy-blipsizey/2
					img = "radar/img/road.png"
					dxDrawImage(blipx, blipy, blipsizex, blipsizey, img, north-rotz+0, 0, 0, tocolor(r,g,b,a))
				elseif getElementModel(object) == 7657 then
					local rotx,roty,rotz = getElementRotation(object)
					local rotx,roty,rotz = rotx-90,roty,rotz
					local angle = 180-north + findRotation(px,py,ox,oy)
					local cblipx, cblipy = getDistanceRotation(0, 0, height*(dist/range)/2, angle)
					local blipsizex = blipsize*1*math.abs(math.cos(math.rad(roty)))
					local blipsizey = blipsize*0.25*math.abs(math.cos(math.rad(rotx)))
					if blipsizex < 0.2 then
						blipsizex = 0.2
					end
					if blipsizey < 0.2 then
						blipsizey = 0.2
					end
					local blipx = centerleft+cblipx-blipsizex/2
					local blipy = centertop+cblipy-blipsizey/2
					img = "radar/img/plasticgate.png"
					local as = 70
					dxDrawImage(blipx, blipy, blipsizex, blipsizey, img, north-rotz, 0, 0, tocolor(r,g,b,as))
				end
			end
		end
	end
	for i, v in pairs(getElementsByType("blip")) do
		local bx, by, bz = getElementPosition(v)
		local dist = getDistanceBetweenPoints2D(px,py,bx,by)
		if dist > range then
			dist = tonumber(range)
		end
		local angle = 180-north + findRotation(px,py,bx,by)
        local cblipx, cblipy = getDistanceRotation(0, 0, height*(dist/range)/2, angle)
		local blipsiz = blipsize/2
        local blipx = centerleft+cblipx-blipsiz/2
        local blipy = centertop+cblipy-blipsiz/2
--		local yoff = 0
		local r,g,b,a = 255,255,255,255
		r,g,b,_ = getBlipColor(v)
		local img = "radar/img/white.png"
		dxDrawImage(blipx, blipy, blipsiz, blipsiz, img, north, 0, 0, tocolor(r,g,b,a))
	end
	for id, player in ipairs(getElementsByType("player")) do
		local veh = getPedOccupiedVehicle(player)
		if getElementData(player, "state") == "alive" or getElementData(player, "state") == "funarea" and veh and player ~= lp and getElementRotation(veh) and getElementPosition(veh) then
			local _,_,rot = getElementRotation(veh)
			local ex, ey, ez = getElementPosition(veh)
			local dist = getDistanceBetweenPoints2D(px,py,ex,ey)
			if dist > range then
				dist = tonumber(range)
			end
			local angle = 180-north + findRotation(px,py,ex,ey)
            local cblipx, cblipy = getDistanceRotation(0, 0, height*(dist/range)/2, angle)
            local blipx = centerleft+cblipx-blipsize/2
            local blipy = centertop+cblipy-blipsize/2
--			local yoff = 0
			local r,g,b,a = 255,255,255,255
			if getPlayerTeam(player) then
				r,g,b = getTeamColor( getPlayerTeam(player) )
			end
			local img = "radar/img/blip.png"
			if (ez - pz) >= 5 then
				img = "radar/img/blipup.png"
			elseif (ez - pz) <= -5 then
				img = "radar/img/blipdown.png"
			end
			if tonumber(getElementModel(veh)) == 425 then
				--r, g, b, a = 255, 0, 0, 200
				img = "radar/img/hunter.png"
			end
			dxDrawImage(blipx, blipy, blipsize, blipsize, img, north-rot+45, 0, 0, tocolor(r,g,b,a))
			if img == "radar/img/hunter.png" then
			rotationRotator = rotationRotator + 1.25
			dxDrawImage(blipx, blipy, blipsize, blipsize, "radar/img/rotor.png", north-rot+45+rotationRotator, 0, 0)
			end
		end
	end
	--Health
	local vehicle = getPedOccupiedVehicle(lp)
	if vehicle then 
		local healthColor = getElementHealth(vehicle)/4
		local healthHeight = healthColor/250
		local health = getElementHealth(vehicle)
		local health = math.max(health - 250, 0)/750
		local color = tocolor(255-healthColor,healthColor/1.5 ,0,255)
		if healthColor < 40 then 
			local number = math.random(0,1)
			if number == 1 then 
				alpha = 255
			else 
				alpha = 0
			end
			color = tocolor(255-healthColor,healthColor/1.5 ,0,alpha)
		end
		dxDrawImage(centerleft - lpsize/2, centertop - lpsize/2, lpsize,lpsize, "radar/img/local.png", north-pr,0,0,tocolor(255-healthColor,healthColor/1.5 ,0,255))
	end
end
)


