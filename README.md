# luci-app-homeassistant

luci-app-homeassistant
Luci app manage homeassistant configuration/setting (homeassistant on domorouter - domo3g)

# install

    cd package/feeds/
    git clone https://github.com/khongpt/luci-app-homeassistant.git
    
    
        ** remove line 150 in Makefile package homeassistant b/c of conflic file /etc/init.d/homeassistant provided by luci-app-homeassistant
        ** $(INSTALL_BIN) ./files/homeassistant $(1)/etc/init.d

        ** remove line 45 in Makefile package hass-configurator with same reasons as above
        **	$(INSTALL_BIN) ./files/hass-configurator $(1)/etc/init.d