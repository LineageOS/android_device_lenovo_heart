#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from sm8150-common
$(call inherit-product, device/lenovo/sm8150-common/common.mk)

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay \
    $(LOCAL_PATH)/overlay-lineage

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.nfc.ese.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.ese.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.hcef.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hcef.xml \
    frameworks/native/data/etc/android.hardware.nfc.uicc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.uicc.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/com.nxp.mifare.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.nxp.mifare.xml

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml \
    $(LOCAL_PATH)/audio/mixer_paths_tavil.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_tavil.xml \
    $(LOCAL_PATH)/audio/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info.xml

# Init
PRODUCT_PACKAGES += \
    init.device.rc \
    init.system.qcom.rc

# Misc
PRODUCT_PACKAGES += \
    libchrome \
    libchrome.vendor

# NFC
PRODUCT_PACKAGES += \
    android.hardware.nfc-service.nxp \
    com.android.nfc_extras \
    Tag

# Power
$(call soong_config_set,qtipower,tap_to_wake_node,/sys/devices/virtual/touch/tp_dev/gesture_on)

# Sensors
PRODUCT_PACKAGES += \
    android.hardware.sensors@2.0.vendor

# Slider handler
PRODUCT_PACKAGES += \
    KeyHandler

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Inherit the proprietary files
$(call inherit-product, vendor/lenovo/heart/heart-vendor.mk)
