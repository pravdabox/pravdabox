include $(TOPDIR)/rules.mk

PKG_NAME:=webinterface
PKG_VERSION:=0.16.2
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/webinterface
  SECTION:=administration
  CATEGORY:=Pravdabox
  TITLE:=Pravdabox Webinterface
endef

PKG_BUILD_DEPENDS:=golang

GOPATH:=$(STAGING_DIR)/host/go

define Package/webinterface/description
 Pravdabox Webinterface.
endef

define Build/Configure
endef

define Build/Compile
	$(STAGING_DIR)/host/usr/local/go/bin/go get -v -u -ldflags '-linkmode external -extldflags -static -w' github.com/pravdabox/webinterface
endef

define Package/webinterface/install
	$(INSTALL_DIR) $(1)/opt/pravdabox
	$(CP) -rv $(GOPATH)/bin/webinterface $1/opt/pravdabox/

	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/webinterface.init $(1)/etc/init.d/webinterface
endef

$(eval $(call BuildPackage,webinterface))
