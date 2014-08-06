LOCAL_PATH := $(call my-dir)

ifneq ($(filter hercules skyrocket celoxdcm t769,$(TARGET_DEVICE)),)
include $(call all-subdir-makefiles,$(LOCAL_PATH))
endif
