include $(TOPDIR)/rules.mk

PKG_NAME:=engine
PKG_VERSION:=0.19.2
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/engine
  SECTION:=administration
  CATEGORY:=Pravdabox
  TITLE:=Pravdabox Engine
  DEPENDS:=+isc-dhcp-server-ipv4 +grep
endef

define Package/engine/description
 A collection of scripts that run pravdabox.
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/engine/install
	# engine init
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/engine.init $(1)/etc/init.d/engine

	# place configs for initial run
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DATA) ./files/network.config $(1)/etc/config/network
	$(INSTALL_DATA) ./files/dns.config $(1)/etc/config/dhcp
	$(INSTALL_DATA) ./files/resolv.conf.pravdabox $(1)/etc/resolv.conf.pravdabox
	$(INSTALL_DATA) ./files/hosts $(1)/etc/hosts
	$(INSTALL_DATA) ./files/dhcpd.conf $(1)/etc/dhcpd.conf

	# place configs to override restore during upgrade
	$(INSTALL_DIR) $(1)/opt/pravdabox/config
	$(INSTALL_DATA) ./files/network.config $(1)/opt/pravdabox/config/network
	$(INSTALL_DATA) ./files/dns.config $(1)/opt/pravdabox/config/dns.config
	$(INSTALL_DATA) ./files/resolv.conf.pravdabox $(1)/opt/pravdabox/config/resolv.conf.pravdabox
	$(INSTALL_DATA) ./files/hosts $(1)/opt/pravdabox/config/hosts
	$(INSTALL_DATA) ./files/dhcpd.conf $(1)/opt/pravdabox/config/dhcpd.conf

	# filters
	$(INSTALL_DIR) $(1)/opt/pravdabox/filters
	$(INSTALL_BIN) ./files/filters.init $(1)/etc/init.d/filters
	$(INSTALL_BIN) ./files/filters/dns $(1)/opt/pravdabox/filters/dns
	$(INSTALL_BIN) ./files/filters/connections $(1)/opt/pravdabox/filters/connections
	$(INSTALL_BIN) ./files/filters/forms $(1)/opt/pravdabox/filters/forms
	$(INSTALL_BIN) ./files/filters/passwords $(1)/opt/pravdabox/filters/passwords
	$(INSTALL_BIN) ./files/filters/cookies $(1)/opt/pravdabox/filters/cookies
	$(INSTALL_BIN) ./files/filters/images $(1)/opt/pravdabox/filters/images
	$(INSTALL_BIN) ./files/filters/urls $(1)/opt/pravdabox/filters/urls
	$(INSTALL_BIN) ./files/filters/firmwareupgrade $(1)/opt/pravdabox/filters/firmwareupgrade

	# helpers
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) ./files/dns_lookup.sh $(1)/usr/bin/dns_lookup
endef

$(eval $(call BuildPackage,engine))
