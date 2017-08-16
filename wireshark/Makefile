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
include $(INCLUDE_DIR)/nls.mk

define Package/wireshark
  SECTION:=net
  CATEGORY:=Network
  TITLE:=wireshark
  DEPENDS:=+libpcap +libgcrypt +glib2 +libiconv-full +libpthread
endef

#PKG_FIXUP:=autoreconf

#TARGET_CFLAGS += -D_GNU_SOURCE -fPIC thread.c -static -lpthread -lc -lgcc_eh \

TARGET_CFLAGS += -D_GNU_SOURCE -fPIC \
	-I$(STAGING_DIR)/usr/lib/libintl/include \
	-I$(STAGING_DIR)/usr/libiconv/include \
	-I$(STAGING_DIR)/usr/include/pcap

TARGET_LDFLAGS += -ldl \
	-L$(STAGING_DIR)/usr/lib/libintl/lib \
	-L$(STAGING_DIR)/usr/lib/libiconv/lib \
	-L$(TOOLCHAIN_DIR)/usr/lib -L$(TOOLCHAIN_DIR)/lib -Wl,-rpath=$(TOOLCHAIN_DIR)/lib

define Package/wireshark/description
 wireshark captures network traffic
endef

define Build/Configure
	cd $(PKG_BUILD_DIR) && CFLAGS="$(TARGET_CFLAGS)" LDFLAGS="$(TARGET_LDFLAGS)" ./autogen.sh \
	--host=$(ARCH) --target=$(GNU_TARGET_NAME) $(TARGET_CONFIGURE_OPTS) \
	&& CFLAGS="$(TARGET_CFLAGS)" LDFLAGS="$(TARGET_LDFLAGS)" ./configure \
	--host=$(ARCH) --target=$(GNU_TARGET_NAME) $(TARGET_CONFIGURE_OPTS) \
	--enable-wireshark=no \
	--enable-tshark=yes \
	--enable-editcap=no \
	--enable-capinfos=no \
	--enable-captype=no \
	--enable-mergecap=no \
	--enable-reordercap=no \
	--enable-text2pcap=no \
	--enable-dftest=no \
	--enable-randpkt=no \
	--enable-rawshark=no \
	--enable-sharkd=no \
	--enable-androiddump=no \
	--enable-randpktdump=no \
	--enable-udpdump=no \
	--with-pcap=$(STAGING_DIR)/usr \
	--with-lua=no \
	--with-plugins=no
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR)/tools/lemon CC_FOR_BUILD="$(HOSTCC)"
	touch $(PKG_BUILD_DIR)/version.h
	$(MAKE) -j9 -C $(PKG_BUILD_DIR)/wsutil
	$(MAKE) -j9 -C $(PKG_BUILD_DIR)/wiretap
	$(MAKE) -j9 -C $(PKG_BUILD_DIR)/caputils
	$(MAKE) -j9 -C $(PKG_BUILD_DIR)/ui/cli
	$(MAKE) -j9 -C $(PKG_BUILD_DIR)/ui
	$(MAKE) -j9 -C $(PKG_BUILD_DIR)/writecap
	$(MAKE) -j9 -C $(PKG_BUILD_DIR) dumpcap
	$(MAKE) -j9 -C $(PKG_BUILD_DIR)/capchild
	$(MAKE) -j9 -C $(PKG_BUILD_DIR)/epan STAGING_DIR_HOST=$(STAGING_DIR_HOST)
	$(MAKE) -j9 -C $(PKG_BUILD_DIR) tshark LIBS="$(STAGING_DIR)/usr/lib/libpcap.a $(ICONV_PREFIX)/lib/libiconv.a"
endef

define Package/wireshark/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/dumpcap $(1)/usr/sbin/dumpcap
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/tshark $(1)/usr/sbin/tshark
endef

$(eval $(call BuildPackage,wireshark))
