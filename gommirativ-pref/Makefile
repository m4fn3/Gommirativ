TARGET := iphone:clang:latest:7.0

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = gommirativ-pref

gommirativ-pref_FILES = XXXRootListController.m
gommirativ-pref_FRAMEWORKS = UIKit Foundation
gommirativ-pref_PRIVATE_FRAMEWORKS = Preferences
gommirativ-pref_INSTALL_PATH = /Library/PreferenceBundles
gommirativ-pref_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk
