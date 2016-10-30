-- HousePost Server
-- Made by houseofkraft

-- Functions
local function init()
  while true do
    id, message, info = rednet.receive()
    if message == "serverlookup" then
      rednet.send(id, "sucess")
    end
  end
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

local modemFound = false
for _,s in ipairs(sides) do
  if peripheral.getType(s) == "modem" then -- If the current side has a modem on it
    modemFound = true
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
