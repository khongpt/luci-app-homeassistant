module("luci.controller.homeassistant",package.seeall)

function index()
  if not nixio.fs.access("/etc/config/homeassistant")then
return
end

entry({"admin","system"}, firstchild(), "system", 45).dependent = false

entry({"admin", "system", "homeassistant"},firstchild(), _("Homeassistant")).dependent = false

entry({"admin", "system", "homeassistant", "general"},cbi("homeassistant/settings"), _("Base Setting"), 1)
entry({"admin", "system", "homeassistant", "log"},form("homeassistant/info"), _("home-assistant.log"), 2)
entry({"admin", "system", "homeassistant", "manual"},cbi("homeassistant/manual"), _("configuration.yaml"), 3)

entry({"admin","system","homeassistant","status"},call("act_status"))
end

function act_status()
local e={}
  e.running=luci.sys.call("ps | grep 'hass' | grep -v 'hass-configurator' | grep -v 'grep' |  cut -d' ' -f2 > /dev/null")==0
  luci.http.prepare_content("application/json")
  luci.http.write_json(e)
end
