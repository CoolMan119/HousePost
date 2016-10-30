-- HousePost Server
-- Made by houseofkraft

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
