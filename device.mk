#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Cryptfshw
TARGET_EXCLUDE_CRYPTFSHW := true

# Gatekeeper
TARGET_USES_DEVICE_SPECIFIC_GATEKEEPER := true

# Keymaster
TARGET_USES_DEVICE_SPECIFIC_KEYMASTER := true

# Vibrator
TARGET_USES_DEVICE_SPECIFIC_VIBRATOR := true

# Inherit from mithorium-common
$(call inherit-product, device/xiaomi/mithorium-common/mithorium.mk)
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

# Overlays
PRODUCT_PACKAGES += \
    xiaomi_pine_overlay \
    xiaomi_olive_overlay \
    xiaomi_olive_overlay_Snap \
    xiaomi_olive_overlay_SystemUI

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Boot animation
TARGET_SCREEN_HEIGHT := 1440
TARGET_SCREEN_WIDTH := 720

# Dynamic Partitions
PRODUCT_BUILD_SUPER_PARTITION := false
PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_RETROFIT_DYNAMIC_PARTITIONS := true

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.consumerir.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.consumerir.xml \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_olive/android.hardware.fingerprint.xml

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_platform_info_intcodec.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_intcodec.xml \
    $(LOCAL_PATH)/audio/pine_mixer_paths_sdm439_pm8953.xml:$(TARGET_COPY_OUT_VENDOR)/etc/pine_mixer_paths_sdm439_pm8953.xml \
    $(LOCAL_PATH)/audio/olive_mixer_paths_sdm439_pm8953.xml:$(TARGET_COPY_OUT_VENDOR)/etc/olive_mixer_paths_sdm439_pm8953.xml

# Camera
PRODUCT_PACKAGES += \
    camera.msm8937

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.1-service.xiaomi_mi439 \
    android.hardware.biometrics.fingerprint@2.2

# Input
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/uinput-fpc.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/uinput-fpc.kl \
    $(LOCAL_PATH)/keylayout/uinput-goodix.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/uinput-goodix.kl

# Recovery
PRODUCT_COPY_FILES += \
    vendor/xiaomi/Mi439/proprietary/vendor/bin/hvdcp_opti:$(TARGET_COPY_OUT_RECOVERY)/root/system/bin/hvdcp_opti

# Rootdir
PRODUCT_PACKAGES += \
    fstab.qcom_ramdisk \
    init.xiaomi.device.rc \
    init.xiaomi.device.sh

# Sensors
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sensors/pine___def_qcomdev.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/pine___def_qcomdev.conf \
    $(LOCAL_PATH)/configs/sensors/olive__def_qcomdev.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/olive__def_qcomdev.conf

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Vibrator
PRODUCT_PACKAGES += \
    android.hardware.vibrator@1.3-service.xiaomi_mi439

# Inherit from vendor blobs
ifeq ($(TARGET_KERNEL_VERSION),4.19)
$(call inherit-product, vendor/xiaomi/Mi439_4_19/Mi439_4_19-vendor.mk)
else
$(call inherit-product, vendor/xiaomi/Mi439/Mi439-vendor.mk)
endif

# EXTRA: MiuiCamera
ifneq ($(wildcard vendor/miuicamera/config.mk),)
$(call inherit-product, vendor/miuicamera/config.mk)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/miuicam/pine.xml:$(TARGET_COPY_OUT_VENDOR)/etc/device_features/pine.xml \
    $(LOCAL_PATH)/configs/miuicam/olive.xml:$(TARGET_COPY_OUT_VENDOR)/etc/device_features/olive.xml \
    $(LOCAL_PATH)/configs/miuicam/olive.xml:$(TARGET_COPY_OUT_VENDOR)/etc/device_features/olivelite.xml \
    $(LOCAL_PATH)/configs/miuicam/olive.xml:$(TARGET_COPY_OUT_VENDOR)/etc/device_features/olivewood.xml
endif
