#
# Copyright (C) 2024 The Android Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/samsung/j2corey20lte

# Architecture - 32-bit only
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a53
TARGET_USES_64_BIT_BINDER := true

# Platform
TARGET_BOARD_PLATFORM := msm8937
TARGET_BOARD_PLATFORM_GPU := qcom-adreno308
TARGET_BOOTLOADER_BOARD_NAME := msm8937
TARGET_NO_BOOTLOADER := true

# Kernel - Prebuilt (Header V0, DTB embedded, ZIMAGE+gzip)
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
BOARD_PREBUILT_DTBIMAGE_DIR := $(DEVICE_PATH)/prebuilt
BOARD_KERNEL_SEPARATED_DT := false
TARGET_KERNEL_ARCH := arm

# Kernel configs (confirmed from boot.img header)
BOARD_KERNEL_CMDLINE := console=null androidboot.hardware=qcom \
    msm_rtb.filter=0x237 ehci-hcd.park=3 \
    androidboot.bootdevice=7824900.sdhci \
    lpm_levels.sleep_disabled=1 \
    androidboot.selinux=permissive
BOARD_KERNEL_BASE        := 0x80000000
BOARD_KERNEL_PAGESIZE    := 2048
BOARD_KERNEL_OFFSET      := 0x00008000
BOARD_RAMDISK_OFFSET     := 0x02000000
BOARD_SECOND_OFFSET      := 0x00f00000
BOARD_TAGS_OFFSET        := 0x01e00000
BOARD_NAME               := SRPTA06A001KU

# Partition Sizes (confirmed from /proc/partitions)
BOARD_BOOTIMAGE_PARTITION_SIZE         := 33554432
BOARD_RECOVERYIMAGE_PARTITION_SIZE     := 33554432
BOARD_SYSTEMIMAGE_PARTITION_SIZE       := 1518338048
BOARD_USERDATAIMAGE_PARTITION_SIZE     := 13470002176
BOARD_CACHEIMAGE_PARTITION_SIZE        := 73400320
BOARD_PERSISTIMAGE_PARTITION_SIZE      := 33554432
BOARD_VENDORIMAGE_PARTITION_SIZE       := 260046848
BOARD_ODMIMAGE_PARTITION_SIZE          := 50331648
BOARD_FLASH_BLOCK_SIZE                 := 131072

# File System
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := false
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4

# Recovery
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
BOARD_SUPPRESS_SECURE_ERASE := true

# TWRP Flags
TW_THEME := portrait_mdpi
TW_SCREEN_BLANK_ON_BOOT := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_USE_TOOLBOX := true
TW_EXTRA_LANGUAGES := false
TW_DEFAULT_LANGUAGE := en

# Samsung Specific
TW_HAS_DOWNLOAD_MODE := true
TW_NO_REBOOT_BOOTLOADER := true
TW_MTP_DEVICE := /dev/mtp_usb
TW_HAS_MTP := true
BOARD_HAS_SAMSUNG_SEANDROID := true

# Storage
TW_INTERNAL_STORAGE_PATH := "/data/media/0"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"

# Brightness (synaptics touchscreen confirmed from device info)
TW_MAX_BRIGHTNESS := 255
TW_DEFAULT_BRIGHTNESS := 162
TW_BRIGHTNESS_PATH := /sys/class/leds/lcd-backlight/brightness

# Crypto - disabled (Android 8.1 FDE footer)
TW_INCLUDE_CRYPTO := false

# Debug
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true
