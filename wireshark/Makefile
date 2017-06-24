include $(TOPDIR)/rules.mk

PKG_NAME:=wireshark
PKG_VERSION:=2017-06-24-bb20b159f35455c41a8f077724f685508e0823b6
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_URL:=https://code.wireshark.org/review/wireshark
PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=bb20b159f35455c41a8f077724f685508e0823b6
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

CC="$(TARGET_CC)"

include $(INCLUDE_DIR)/package.mk

define Package/wireshark
  SECTION:=net
  CATEGORY:=Network
  TITLE:=wireshark
  DEPENDS:=+libpcap
endef

PKG_FIXUP:=autoreconf

define Package/wireshark/description
 wireshark captures network traffic
endef

#define Build/Configure
#	echo $(TARGET_CONFIGURE_OPTS) && cd $(PKG_BUILD_DIR) && CFLAGS="$(TARGET_CFLAGS)" autoreconf -fi && ./configure $(TARGET_CONFIGURE_OPTS)
#endef

#define Build/Configure
#	cd $(PKG_BUILD_DIR) && CFLAGS="$(TARGET_CFLAGS)" autoreconf -fi && ./configure $(TARGET_CONFIGURE_OPTS)
#endef

define Build/Compile
endef

define Package/wireshark/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) ./src/wireshark $(1)/usr/sbin/wireshark
endef

$(eval $(call BuildPackage,wireshark))
