include $(TOPDIR)/rules.mk

PKG_NAME:=geolocation
PKG_VERSION:=0.2.1
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/geolocation
  SECTION:=administration
  CATEGORY:=Pravdabox
  TITLE:=Pravdabox Geolocation Database
  DEPENDS:=+mysql-server +xz
endef

define Package/geolocation/description
 A local ip to location database
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/geolocation/install
	# geolocation init
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/geolocation.init $(1)/etc/init.d/geolocation

	$(INSTALL_DIR) $(1)/opt/pravdabox/config
	$(INSTALL_DATA) ./files/my.cnf $(1)/opt/pravdabox/config/my.cnf

endef
#	$(INSTALL_DIR) $(1)/opt/pravdabox
#	$(INSTALL_DATA) ./files/ip2location_db5.sql.xz $(1)/opt/pravdabox/ip2location_db5.sql.xz

$(eval $(call BuildPackage,geolocation))
