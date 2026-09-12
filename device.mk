#
# Copyright (C) 2019 The LineageOS Project
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
#

DEVICE_PATH := device/samsung/on7xelte


# Launch Android API level
PRODUCT_SHIPPING_API_LEVEL := 23

# Bootanimation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

# Graphics
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi
PRODUCT_AAPT_PREBUILT_DPI := xxhdpi xhdpi hdpi

# Bluetooth hal
PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.0-impl \
    android.hardware.bluetooth@1.0-service

# Bluetooth audio
PRODUCT_PACKAGES += \
    android.hardware.bluetooth.audio@2.0-impl \
    audio.bluetooth.default

# A2DP
PRODUCT_PACKAGES += \
  audio.a2dp.default \
  android.hardware.bluetooth.a2dp@1.0-impl \
  android.hardware.bluetooth.a2dp@1.0-service

# Tests
PRODUCT_PACKAGES_ENG += \
  QSensorTest

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.1 \
    android.hardware.biometrics.common \
    android.hardware.biometrics.face@1.0

# Fingerprint Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml

# GPS configs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/gps/gps_debug.conf:$(TARGET_COPY_OUT_VENDOR)/etc/gps.conf \
    $(LOCAL_PATH)/configs/gps/gps_debug.conf:$(TARGET_COPY_OUT_VENDOR)/etc/gps_debug.conf \
    $(LOCAL_PATH)/configs/gps/gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/gps.xml

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(DEVICE_PATH)/overlay

# Ramdisk
PRODUCT_PACKAGES += \
    mobicore.rc \
    init.wifi_device.rc

# Shims
PRODUCT_PACKAGES += \
    libbauthtzcommon_shim

# Wifi
PRODUCT_PACKAGES += \
    android.hardware.wifi@1.0-service \
    hostapd \
    libwifi-hal \
    libwpa_client \
    wificond \
    wifiloader \
    wifilogd \
    wlutil \
    wpa_supplicant \
    wpa_supplicant.conf

#hostpad
PRODUCT_PACKAGES += \
    android.hardware.wifi.hostapd@1.0

#wifi
PRODUCT_PACKAGES += \
    android.hardware.wifi@1.4

#supplicant
PRODUCT_PACKAGES += \
    android.hardware.wifi.supplicant@1.3

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/wifi/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf \
    $(DEVICE_PATH)/configs/wifi/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf

# Audio
TARGET_DEVICE_HAS_OSS_AUDIO_HAL := true
TARGET_DEVICE_HAS_PREBUILT_AUDIO_HAL := false
TARGET_DEVICE_HAS_A6LTE_AUDIO_HAL := false
TARGET_DEVICE_HAS_M10LTE_AUDIO_HAL := false
TARGET_DEVICE_HAS_TFA_AMP := false

# Properties
-include $(DEVICE_PATH)/system_prop.mk

# Inherit from common
$(call inherit-product, device/samsung/universal7870-common/device-common.mk)

# $(call inherit-product, device/samsung/universal7870-common/device-prebuilt_bsp-vndk.mk)

$(call inherit-product-if-exists, vendor/samsung/on7xelte/on7xelte-vendor.mk)
