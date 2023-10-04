ifeq ($(RELEASE),1)
	FINALPACKAGE = 1
endif

ifeq ($(ROOTLESS),1)
	THEOS_PACKAGE_SCHEME=rootless
endif

ARCHS := arm64

TARGET := iphone:clang:latest:7.0

SDK_PATH = $(THEOS)/sdks/iPhoneOS14.5.sdk/
SYSROOT = $(SDK_PATH)

INSTALL_TARGET_PROCESSES = Mirrativ

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Gommirativ
ifeq ($(ROOTLESS),1)
	Gommirativ_FILES = rootless.xm
else
	Gommirativ_FILES = rootful.xm
endif
Gommirativ_CFLAGS = -fobjc-arc
Gommirativ_FRAMEWORKS = UIKit Foundation


include $(THEOS_MAKE_PATH)/tweak.mk
