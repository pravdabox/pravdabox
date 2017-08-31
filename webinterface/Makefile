include $(TOPDIR)/rules.mk

PKG_NAME:=webinterface
PKG_VERSION:=0.1.0
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/webinterface
  SECTION:=administration
  CATEGORY:=Pravdabox
  TITLE:=Pravdabox Webinterface
  DEPENDS:=+golang
endef

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
endef

$(eval $(call BuildPackage,webinterface))
