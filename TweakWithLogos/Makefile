ARCHS = arm64 arm64e

TARGET := iphone:clang:latest
INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = TweakWithLogos

TweakWithLogos_FILES = $(shell find Logos -name "*.x")
TweakWithLogos_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
