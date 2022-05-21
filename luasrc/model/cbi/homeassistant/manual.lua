local m, s, o
local fs = require "nixio.fs"
local jsonc = require "luci.jsonc" or nil
m = Map("homeassistant")
s=m:section(NamedSection,"sample_config","homeassistant")
s.anonymous=true
s.addremove=false
o = s:option(TextValue, "manualconfig")
o.rows = 20
o.wrap = "soft"
o.rmempty = true
o.cfgvalue = function(self, section)
	return fs.readfile("/mnt/mmcblk0p1/domoticz/homeassistant/config/configuration.yaml")
end
o.write = function(self, section, value)
	fs.writefile("/mnt/mmcblk0p1/domoticz/homeassistant/config/configuration.yaml", value:gsub("\r\n", "\n"))
end
--[[ o.validate=function(self, value)
	if jsonc == nil or jsonc.parse(value)~=nil then
		return value
	end
	return nil
end ]]

return m