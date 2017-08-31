include $(TOPDIR)/rules.mk

PKG_NAME:=websocketd
PKG_VERSION:=0.2.2
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/websocketd
  SECTION:=administration
  CATEGORY:=Pravdabox
  TITLE:=Websocketd
endef

PKG_BUILD_DEPENDS:=golang

GOPATH:=$(STAGING_DIR)/host/go

define Package/websocketd/description
 WebSockets the UNIX way.
endef

define Build/Configure
endef

define Build/Compile
	$(STAGING_DIR)/host/usr/local/go/bin/go get -v -u -ldflags '-linkmode external -extldflags -static -w' github.com/joewalnes/websocketd
endef

define Package/websocketd/install
	$(INSTALL_DIR) $(1)/opt/pravdabox
	$(CP) -rv $(GOPATH)/bin/websocketd $1/opt/pravdabox/
endef

$(eval $(call BuildPackage,websocketd))
