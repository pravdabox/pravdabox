include $(TOPDIR)/rules.mk

PKG_NAME:=driftnet
PKG_VERSION:=2017-08-08-7602b53
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_URL:=https://github.com/deiv/driftnet
PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=7602b53f65bd67483ddaf25ab4870a28c5c7d1fb
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

CC="$(TARGET_CC)"

include $(INCLUDE_DIR)/package.mk

define Package/driftnet
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Driftnet
  DEPENDS:=+libpcap
endef

PKG_FIXUP:=autoreconf

define Package/driftnet/description
 Driftnet watches network traffic and displays images
endef

#define Build/Configure
#	echo $(TARGET_CONFIGURE_OPTS) && cd $(PKG_BUILD_DIR) && CFLAGS="$(TARGET_CFLAGS)" autoreconf -fi && ./configure $(TARGET_CONFIGURE_OPTS)
#endef

#cd $(PKG_BUILD_DIR) && CFLAGS="$(TARGET_CFLAGS)" autoreconf -fi && ./configure $(TARGET_CONFIGURE_OPTS)
define Build/Configure
	cd $(PKG_BUILD_DIR) && CFLAGS="$(TARGET_CFLAGS)" autoreconf -fi && ./configure --disable-display --host=$(ARCH) $(TARGET_CONFIGURE_OPTS)
endef

define Build/Compile
	cd $(PKG_BUILD_DIR) && CFLAGS="$(TARGET_CFLAGS)" make
endef

define Package/driftnet/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/driftnet $(1)/usr/sbin/driftnet
endef

$(eval $(call BuildPackage,driftnet))
