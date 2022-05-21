
a=Map("homeassistant",translate("Homeassistant"),translate("Setting for Openwrt HomeAssistant"))
a:section(SimpleSection).template  = "homeassistant/homeassistant_status"

t=a:section(NamedSection,"sample_config","homeassistant")
t.anonymous=true
t.addremove=false

e=t:option(Flag,"enabled",translate("Enable"))
e.default=0
e.rmempty=false


return a
