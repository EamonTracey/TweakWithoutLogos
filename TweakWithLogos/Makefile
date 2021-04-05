ARCHS = arm64 arm64e

TARGET := iphone:clang:latest
INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = TweakWithLogos

TweakWithLogos_FILES = Tweak.x
TweakWithLogos_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
