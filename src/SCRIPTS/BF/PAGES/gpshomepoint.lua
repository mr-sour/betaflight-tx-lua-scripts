local template = assert(loadScript(radio.template))()
local margin = template.margin
local indent = template.indent
local lineSpacing = template.lineSpacing
local tableSpacing = template.tableSpacing
local sp = template.listSpacing.field
local yMinLim = radio.yMinLimit
local x = margin
local y = yMinLim - lineSpacing
local inc = { x = function(val) x = x + val return x end, y = function(val) y = y + val return y end }
local labels = {}
local fields = {}

if apiVersion >= 1.41 then
    fields[#fields + 1] = { t = "latitude",        x = x,          y = inc.y(lineSpacing), sp = x + sp, min = -90.9999999, max = 90.9999999, vals = { 16 } }
    fields[#fields + 1] = { t = "longitude",       x = x,          y = inc.y(lineSpacing), sp = x + sp, min = -180.9999999, max = 180.9999999, vals = { 1, 2 } }
end

return {
   read        = 257, -- MSP_GPS_HOMEPOINT
   write       = 256, -- MSP_SET_GPS_HOMEPOINT
   title       = "GPS HomePoint",
   reboot      = false,
   eepromWrite = true,
   minBytes    = 16,
   labels      = labels,
   fields      = fields,
}
