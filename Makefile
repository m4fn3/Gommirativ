THEOS_DEVICE_IP = localhost
THEOS_DEVICE_PORT = 22

ifeq ($(RELEASE),1)
FINALPACKAGE = 1
endif

ifeq ($(ROOTLESS),1)
THEOS_PACKAGE_SCHEME=rootless
endif

SDK_PATH = $(THEOS)/sdks/iPhoneOS14.5.sdk/
SYSROOT = $(SDK_PATH)

TARGET := iphone:clang:latest:7.0
INSTALL_TARGET_PROCESSES = Mirrativ

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = gommirativ

gommirativ_FILES = Tweak.xm
gommirativ_CFLAGS = -fobjc-arc
gommirativ_FRAMEWORKS = UIKit Foundation

include $(THEOS_MAKE_PATH)/tweak.mk

SUBPROJECTS += gommirativ-pref
include $(THEOS_MAKE_PATH)/aggregate.mk
