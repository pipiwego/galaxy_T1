local component = require("component")
local event = require("event")
local sides = require("sides")

local rs = component.redstone
local m = component.modem

m.open(1000)
m.setStrength(1)

print("Checking...")
if (m.isWireless() == true) then
    print("[OK]Wireless")
    print("-Wireless strength is", m.getStrength())
end

if (m.isOpen(1000) == true) then
    print("[OK]Port")
    print("-Listen on 1000")
end

while (true) do
    local _, _, from, port, _, message = event.pull("modem_message")
    if (message == "on") then
        rs.setOutput(sides.top, 15)
        rs.setOutput(sides.left, 15)
        rs.setOutput(sides.right, 15)
        print("Door opened")
        os.sleep(3)
        rs.setOutput(sides.top, 0)
        rs.setOutput(sides.left, 0)
        rs.setOutput(sides.right, 0)

    end
end
