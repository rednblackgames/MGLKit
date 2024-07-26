ARCHS := arm64
TARGET := iphone:clang:latest:13.0
FOR_RELEASE := true

include $(THEOS)/makefiles/common.mk
# TARGET_CODESIGN = fastPathSign

FRAMEWORK_NAME = MGLKit

MGLKit_FILES = MGLContext.mm MGLDisplay.mm MGLKView.mm MGLKViewController.mm MGLLayer.mm MGLKit.mm
MGLKit_CFLAGS = -fobjc-arc -Iinclude -DGL_GLEXT_PROTOTYPES -DGLES_SILENCE_DEPRECATION -std=c++11
MGLKit_LDFLAGS = -FFrameworks -rpath @executable_path/Frameworks -Wl,-reexport_framework,libGLESv2
MGLKit_FRAMEWORKS = libEGL libGLESv2

MGLKit_PUBLIC_HEADERS = MGLContext.h MGLKView.h MGLKitPlatform.h MGLKViewController.h MGLLayer.h MGLKit.h include/*

MGLKit_RESOURCE_DIRS = res

include $(THEOS_MAKE_PATH)/framework.mk
