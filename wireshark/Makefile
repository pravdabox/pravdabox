include $(TOPDIR)/rules.mk

PKG_NAME:=wireshark
PKG_VERSION:=2.4.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_URL:=https://code.wireshark.org/review/wireshark
PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=wireshark-2.4.0
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

CC="$(TARGET_CC)"

include $(INCLUDE_DIR)/package.mk

define Package/wireshark
  SECTION:=net
  CATEGORY:=Network
  TITLE:=wireshark
  DEPENDS:=+libpcap +libgcrypt +glib2
endef

#PKG_FIXUP:=autoreconf

define Package/wireshark/description
 wireshark captures network traffic
endef

#define Build/Configure
#	echo $(TARGET_CONFIGURE_OPTS) && cd $(PKG_BUILD_DIR) && CFLAGS="$(TARGET_CFLAGS)" autoreconf -fi && ./configure $(TARGET_CONFIGURE_OPTS)
#endef

define Build/Configure
	cd $(PKG_BUILD_DIR) && CFLAGS="$(TARGET_CFLAGS)" ./autogen.sh --host=$(ARCH) --target=$(GNU_TARGET_NAME) $(TARGET_CONFIGURE_OPTS) && ./configure --enable-wireshark=no --enable-tshark=yes --enable-editcap=no --enable-capinfos=no --enable-captype=no --enable-mergecap=no --enable-reordercap=no --enable-text2pcap=no --enable-dftest=no --enable-randpkt=no --enable-dumpcap=no --enable-rawshark=no --enable-sharkd=no --enable-androiddump=no --enable-randpktdump=no --enable-udpdump=no --with-pcap=no
endef

define Build/Compile
endef

define Package/wireshark/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) ./src/wireshark $(1)/usr/sbin/wireshark
endef

$(eval $(call BuildPackage,wireshark))
