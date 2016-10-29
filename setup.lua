local files = {
    [1] = {
        "client",
        "https://raw.githubusercontent.com/CoolMan119/HousePost/master/client.lua"
    }  
}
if term.isColor() == false then
   print("Sorry, But you need an Advanced PC to run this!")
else
term.setBackgroundColor(colors.red)
term.clear()
term.setCursorPos(18,8)
print("HousePost")
term.setCursorPos(11,10)
print("A Fast, Simple, and Secure OS")
term.setCursorPos(21,16)
term.setBackgroundColor(colors.lightGray)
print("Install")
while true do
local event, side, x, y = os.pullEvent("mouse_click")
if x >= 21 and x < 28 and y == 16 then
   term.clear()
   shell.run("mkdir", "System")
   term.setCursorPos(1,1)
   textutils.slowPrint("Installing HousePost...")
   local req
   local code
   local file
   for k,v in pairs(files) do
       print(v[1])
       req = http.get(v[2])
       if req ~= nil then
       code = req.readAll()
       req.close()
       else
       print("Failed!")
   end
   
   file = fs.open(v[1], "w")
   file.write(code)
   file.close()
end
print("Sucessfully installed HousePost!")
print("Rebooting...")
os.sleep(1)
os.reboot()
