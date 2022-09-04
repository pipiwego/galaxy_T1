local component = require("component")
local event = require("event")
local sides = require("sides")

local rs = component.redstone
local m = component.modem

m.open(1000)
m.setStrength(1)

print("This is controller. \nChecking...")
if (m.isWireless() == true) then
    print("[OK]Wireless")
    print("-Wireless strength is", m.getStrength())
end

if (m.isOpen(1000) == true) then
    print("[OK]Port")
    print("-Listen on 1000")
end

while (true) do
    
    if (io.read()=="114514") then
        m.broadcast(1000,"on")
        print("-")
    end
end
