include $(TOPDIR)/rules.mk

PKG_NAME:=golang
PKG_VERSION:=1.9
PKG_RELEASE:=1

PKG_SOURCE:=go1.9.linux-amd64.tar.gz
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_URL:=https://storage.googleapis.com/golang
PKG_MD5SUM:=84b51207cdd227248ec4e60cc5e2fa79
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/golang
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=Golang
endef

define Package/golang/description
 Go is an open source programming language that makes it easy to build simple, reliable, and efficient software.
endef

define Package/golang/install
	$(INSTALL_DIR) $(STAGING_DIR_HOSTPKG)/usr/local
	$(CP) -rv $(PKG_BUILD_DIR)/../go $(STAGING_DIR_HOSTPKG)/usr/local/
endef

define Build/Configure
endef

define Build/Compile
endef

$(eval $(call BuildPackage,golang))
