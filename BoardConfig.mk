
# Copyright (C) 2019-2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#
-include device/lenovo/sm8150-common/BoardConfigCommon.mk

BOARD_VENDOR := lenovo

DEVICE_PATH := device/lenovo/heart

# Assertions
TARGET_BOARD_INFO_FILE ?= $(DEVICE_PATH)/board-info.txt
TARGET_OTA_ASSERT_DEVICE := heart

# HIDL
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest.xml

# Kernel
TARGET_KERNEL_CONFIG := lineage_heart_defconfig
TARGET_KERNEL_CLANG_COMPILE := true
TARGET_KERNEL_SOURCE := kernel/lenovo/sm8150

# NFC
TARGET_USES_NQ_NFC := true

# Power
TARGET_TAP_TO_WAKE_NODE := "/sys/devices/virtual/touch/tp_dev/double_tap_enable"

# Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Inherit from the proprietary version
-include vendor/lenovo/heart/BoardConfigVendor.mk
