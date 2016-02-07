# Copyright (C) 2014 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# inherit from common msm8660
-include device/samsung/msm8660-common/BoardConfigCommon.mk

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := MSM8660_SURF

# Kernel
BOARD_KERNEL_BASE := 0x40400000
TWRP_RECOVERY:= false
ifeq ($(TWRP_RECOVERY),true)
BOARD_KERNEL_CMDLINE := androidboot.hardware=qcom usb_id_pin_rework=true no_console_suspend=true androidboot.selinux=permissive
else
BOARD_KERNEL_CMDLINE := androidboot.hardware=qcom usb_id_pin_rework=true no_console_suspend=true
endif
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x01400000
TARGET_KERNEL_SOURCE := kernel/samsung/msm8660-common
TARGET_KERNEL_CROSS_COMPILE_PREFIX := arm-linux-androideabi-

# Recovery
TARGET_RECOVERY_DEVICE_DIRS := device/samsung/celox-common
ifeq ($(TWRP_RECOVERY),true)
TARGET_RECOVERY_FSTAB := device/samsung/celox-common/recovery/twrp.fstab
else
TARGET_RECOVERY_FSTAB := device/samsung/celox-common/rootdir/etc/fstab.qcom
endif
TARGET_USERIMAGES_USE_F2FS := true
BOARD_HAS_NO_MISC_PARTITION := true
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_SUPPRESS_EMMC_WIPE := true

# TWRP
DEVICE_RESOLUTION := 480x800
TW_THEME := portrait_mdpi
TW_BRIGHTNESS_PATH := /sys/devices/platform/msm_fb.196609/leds/lcd-backlight/brightness
