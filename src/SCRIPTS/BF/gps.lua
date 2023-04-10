local MSP_SET_GPS_HOME_POINT = 256

local function setGpsHome(lat, lon)
    local payload = { MSP_SET_GPS_HOME_POINT, lat, lon } -- MSP_SET_HOME_POS command with lat and lon as arguments
    protocol.mspSend(payload)
end

local function showInputDialog()
    local lat = textinput("Enter latitude", "")
    local lon = textinput("Enter longitude", "")

    if lat and lon then
        setGpsHome(tonumber(lat), tonumber(lon))
    end
end

local function run(event)
    if event == EVT_VIRTUAL_ENTER then
        showInputDialog()
    end
end

return { run = run }