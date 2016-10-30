-- HousePost Client
-- Made by houseofkraft

-- Functions

if term.isColor() == false then
  printError("HousePost requires a Advanced Computer!")
  error()
end

local function findServer()
  rednet.broadcast("serverlookup")
  id, message = rednet.receive(1)
  if message == "sucess" then
    return tostring(id)
  else
    return nil
  end
end

local function init()
  term.setBackgroundColor(colors.red)
  term.clear()
  term.setCursorPos(1,1)
  term.setTextColor(colors.white)
  print("Finding Server...")
  local server = findServer()
  if server == nil then
    term.setBackgroundColor(colors.black)
    term.clear()
    term.setCursorPos(1,1)
    printError("No servers detected!")
    error()
  end 
  print("Server Found! ID: "..server)
end
  
-- Side list
local sides = {
  -- We will use these sides when it comes to the modem checking part
  "top",
  "bottom",
  "left",
  "right",
  "front",
  "back"
}
-- Images
main = paintutils.loadImage("/images/main")

-- Stores if the images folder exists in a variable
imgExists = fs.exists("/images/")

-- Checks if the images folder exists
if imgExists == false then
  -- Image folder does not exist
  printError("Image files not detected, Try re-installing!")
  error()
end
term.setBackgroundColor(colors.red)
term.clear()
term.setCursorPos(1,1)
paintutils.drawImage(main,1,1)
sleep(2)
term.clear()
term.setCursorPos(1,1)

local modemFound = false
for _,s in ipairs(sides) do
  if peripheral.getType(s) == "modem" then -- If the current side has a modem on it
    modemFound = true
    rednet.open(s)
  else
    -- Do nothing
    end
end
    
if modemFound then
  init()
else
  printError("No modem detected!")
  error()
end
  
