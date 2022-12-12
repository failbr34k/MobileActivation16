
#iOS 13.x and 14.x 
TARGET := iPhone:clang:16.0b4:15.5
SDKVERSION = 16.0b4

ARCHS = arm64 arm64e
VALID_ARCHS = arm64 arm64e
	


SYSROOT = $(THEOS)/sdks/iPhoneOS16.0b4.sdk
TWEAK_NAME = madlib16


madlib16_LIBRARIES = MobileGestalt FDR ReverseProxyDevice System.B System
madlib16_PRIVATEFRAMEWORKS = MobileActivation CoreTelephony
madlib16_FRAMEWORKS = Security Foundation CoreFoundation
madlib16_CODESIGN_FLAGS = -Sentitlements.xml
madlib16_FILES = Tweak.xm
madlib16_CFLAGS += -fobjc-arc -Wno-deprecated-declarations $(IMPORTS) -DTHEOS -Wno-incompatible-pointer-types -Wno-format -Wno-protocol
#madlib16_LDFLAGS = -lz -L. -v -force_load ./libcapstone.5.dylib
include ~/theos/makefiles/common.mk
include ~/theos/makefiles/tweak.mk
include ~/theos/makefiles/aggregate.mk
include ~/theos/makefiles/framework.mk
include ~/theos/makefiles/library.mk
