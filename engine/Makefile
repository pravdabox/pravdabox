include $(TOPDIR)/rules.mk

PKG_NAME:=engine
PKG_VERSION:=0.1.0
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/engine
  SECTION:=administration
  CATEGORY:=Pravdabox
  TITLE:=Pravdabox Engine
  DEPENDS:=+isc-dhcp-server-ipv4
endef

define Package/engine/description
 A collection of scripts that run pravdabox.
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/engine/install
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/engine.init $(1)/etc/init.d/engine

	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DATA) ./files/network.config $(1)/etc/config/network
	$(INSTALL_DATA) ./files/dhcpd.conf $(1)/etc/dhcpd.conf
endef

$(eval $(call BuildPackage,engine))
