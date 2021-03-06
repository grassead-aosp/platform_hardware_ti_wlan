LOCAL_PATH:= $(call my-dir)

#
# Calibrator
#
include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
        nvs.c \
        misc_cmds.c \
        calibrator.c \
        plt.c \
        ini.c

LOCAL_CFLAGS := -DCONFIG_LIBNL20
LOCAL_C_INCLUDES := \
    $(LOCAL_PATH)

ifneq ($(wildcard external/libnl),)
LOCAL_C_INCLUDES += external/libnl/include
else
LOCAL_C_INCLUDES += external/libnl-headers
endif

ifneq ($(wildcard external/libnl),)
LOCAL_SHARED_LIBRARIES += libnl
else
LOCAL_STATIC_LIBRARIES := libnl_2
endif

LOCAL_MODULE_TAGS := eng
LOCAL_MODULE := calibrator

include $(BUILD_EXECUTABLE)

#
# UIM Application
#
#include $(CLEAR_VARS)

#LOCAL_C_INCLUDES:= \
#    $(LOCAL_PATH)/uim_rfkill/ \
#    external/bluetooth/bluez/

#LOCAL_SRC_FILES:= \
#    uim_rfkill/uim.c
#LOCAL_CFLAGS:= -g -c -W -Wall -O2 -D_POSIX_SOURCE
#LOCAL_SHARED_LIBRARIES:= libnetutils
#LOCAL_MODULE_TAGS := eng
#LOCAL_MODULE:=uim-util

#include $(BUILD_EXECUTABLE)
