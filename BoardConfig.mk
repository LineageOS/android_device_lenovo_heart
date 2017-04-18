#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from sm8150-common
include device/lenovo/sm8150-common/BoardConfigCommon.mk

BOARD_VENDOR := lenovo

DEVICE_PATH := device/lenovo/heart

# Assertions
TARGET_OTA_ASSERT_DEVICE := heart

# HIDL
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest.xml

# Kernel
TARGET_KERNEL_CONFIG += vendor/lenovo/heart.config
TARGET_KERNEL_SOURCE := kernel/lenovo/sm8150

# Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Vendor Security patch level
VENDOR_SECURITY_PATCH := 2020-03-01

# Inherit the proprietary files
include vendor/lenovo/heart/BoardConfigVendor.mk
