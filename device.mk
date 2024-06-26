#
# Copyright (C) 2021 The Android Open Source Project
#           (C) 2022-2023 Paranoid Android
#
# SPDX-License-Identifier: Apache-2.0
#

# A/B
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=ext4 \
    POSTINSTALL_OPTIONAL_vendor=true

PRODUCT_PACKAGES += \
    android.hardware.boot@1.1-impl-qti \
    android.hardware.boot@1.1-impl-qti.recovery \
    android.hardware.boot@1.1-service \
    checkpoint_gc \
    otapreopt_script \
    update_engine \
    update_engine_sideload \
    update_verifier

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_yupik_qssi/audio_policy_configuration.xml

PRODUCT_ODM_PROPERTIES += \
    aaudio.mmap_policy=1 \
    persist.vendor.audio.speaker.prot.enable=false \
    persist.vendor.audio.vbat.enabled=false \
    persist.vendor.audio.bcl.enabled=false \
    ro.vendor.audio.sdk.fluencetype=fluence \
    vendor.audio.offload.track.enable=false \
    vendor.audio.adm.buffering.ms=6 \
    vendor.audio.hal.output.suspend.supported=false \
    vendor.audio.feature.dynamic_ecns.enable=false \
    vendor.audio.feature.spkr_prot.enable=false \
    vendor.audio.feature.power_mode.enable=false \
    vendor.audio.offload.buffer.size.kb=256

PRODUCT_VENDOR_PROPERTIES += \
    ro.config.vc_call_vol_default=9 \
    ro.config.vc_call_vol_steps=11

# Bluetooth
PRODUCT_SYSTEM_EXT_PROPERTIES += \
    persist.vendor.btstack.enable.lpa=true

PRODUCT_VENDOR_PROPERTIES += \
    persist.sys.fflag.override.settings_bluetooth_hearing_aid=true \
    persist.vendor.qcom.bluetooth.a2dp_offload_cap=sbc-aptx-aptxtws-aptxhd-aac-ldac-aptxadaptiver2 \
    persist.vendor.qcom.bluetooth.a2dp_mcast_test.enabled=false \
    persist.vendor.qcom.bluetooth.aac_frm_ctl.enabled=true \
    persist.vendor.qcom.bluetooth.aac_vbr_ctl.enabled=true \
    persist.vendor.qcom.bluetooth.aptxadaptiver2_1_support=true \
    persist.vendor.qcom.bluetooth.enable.swb=true \
    persist.vendor.qcom.bluetooth.enable.swbpm=true \
    persist.vendor.qcom.bluetooth.scram.enabled=false \
    persist.vendor.qcom.bluetooth.twsp_state.enabled=false

# Camera
$(call inherit-product-if-exists, vendor/xiaomi/camera/miuicamera.mk)

PRODUCT_PACKAGES += \
    android.hardware.camera.provider@2.4-impl \
    android.hardware.camera.provider@2.4-service_64 \
    libcamera2ndk_vendor \
    libion.vendor \
    vendor.qti.hardware.camera.device@1.0.vendor \
    vendor.qti.hardware.camera.postproc@1.0.vendor

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/camera/st_license.lic:$(TARGET_COPY_OUT_VENDOR)/etc/camera/st_license.lic

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.raw.xml

PRODUCT_SYSTEM_PROPERTIES += \
    ro.miui.notch=1 \
    ro.product.mod_device=lisa_global

PRODUCT_VENDOR_PROPERTIES += \
    camera.disable_zsl_mode=1 \
    ro.hardware.camera=xiaomi

# Dalvik
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)

# Device Settings
PRODUCT_PACKAGES += \
    XiaomiParts

# Display / Graphics
TARGET_GRALLOC_HANDLE_HAS_NO_RESERVED_SIZE := true

PRODUCT_PACKAGES += \
    disable_configstore \
    lights.lisa

PRODUCT_ODM_PROPERTIES += \
    persist.sys.sf.color_mode=0 \
    ro.surface_flinger.set_display_power_timer_ms=1000 \
    ro.surface_flinger.set_idle_timer_ms=500 \
    ro.surface_flinger.set_touch_timer_ms=800 \
    ro.surface_flinger.use_content_detection_for_refresh_rate=true

PRODUCT_SYSTEM_PROPERTIES += \
    ro.sf.force_hwc_brightness=1

PRODUCT_VENDOR_PROPERTIES += \
    debug.sf.disable_backpressure=1 \
    persist.sys.sf.native_mode=258 \
    ro.gfx.driver.1=com.qualcomm.qti.gpudrivers.lahaina.api30 \
    ro.vendor.display.dither=true \
    ro.vendor.display.mi_calib.enable=true \
    ro.vendor.display.sensortype=2 \
    ro.vendor.histogram.enable=true \
    ro.vendor.xiaomi.bl.poll=true \
    vendor.display.qdcm.mode_combine=2

# Doze
PRODUCT_PACKAGES += \
    ParanoidDoze

PRODUCT_SYSTEM_EXT_PROPERTIES += \
    ro.sensor.pickup=xiaomi.sensor.pickup \
    ro.sensor.pickup.lower.value=2

# DPM
PRODUCT_VENDOR_PROPERTIES += \
    persist.vendor.dpm.feature=1 \
    persist.vendor.dpm.idletimer.mode=default \
    persist.vendor.dpm.nsrm.bkg.evt=3955 \
    persist.vendor.dpmhalservice.enable=1

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@1.4-service.clearkey \
    android.hardware.drm@1.3.vendor

PRODUCT_VENDOR_PROPERTIES += \
    drm.service.enabled=true

# Fastboot
PRODUCT_PACKAGES += \
    fastbootd

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.1-service

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml

PRODUCT_VENDOR_PROPERTIES += \
    ro.hardware.fingerprint=fpc \
    persist.vendor.sys.fp.vendor=fpc

# Firmware
$(call inherit-product-if-exists, vendor/xiaomi/firmware/lisa/config.mk)

# FRP
PRODUCT_VENDOR_PROPERTIES += \
    ro.frp.pst=/dev/block/bootdevice/by-name/frp

# FUSE
PRODUCT_SYSTEM_PROPERTIES += \
    persist.sys.fuse.passthrough.enable=true

# GPS
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/gps/flp.conf:$(TARGET_COPY_OUT_VENDOR)/etc/flp.conf \
    $(LOCAL_PATH)/configs/gps/gps.conf:$(TARGET_COPY_OUT_VENDOR)/etc/gps.conf

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl-qti \
    android.hardware.health@2.1-service

# HWUI
PRODUCT_VENDOR_PROPERTIES += \
    debug.hwui.use_hint_manager=true \
    debug.hwui.target_cpu_time_percent=30

# Incremental FS
PRODUCT_VENDOR_PROPERTIES += \
    ro.incremental.enable=1

# Init
PRODUCT_PACKAGES += \
    fstab.qcom \
    init.lisa.perf.rc \
    init.lisa.rc \
    init.mi.usb.sh \
    init.sensors_fix.sh \
    init.target.rc \
    ueventd.lisa.rc

# IR
PRODUCT_PACKAGES += \
    android.hardware.ir@1.0-impl \
    android.hardware.ir@1.0-service

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.consumerir.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.consumerir.xml

# Kernel
KERNEL_MODULES_INSTALL := dlkm
KERNEL_MODULES_OUT := $(OUT_DIR)/target/product/lisa/$(KERNEL_MODULES_INSTALL)/lib/modules

# Keymaster
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0.vendor \
    android.hardware.keymaster@4.1.vendor

PRODUCT_VENDOR_PROPERTIES += \
    ro.crypto.dm_default_key.options_format.version=2 \
    ro.crypto.volume.metadata.method=dm-default-key \
    vendor.gatekeeper.disable_spu=true

# Keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/keylayout/gpio-keys.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/gpio-keys.kl \
    $(LOCAL_PATH)/configs/keylayout/lahaina-yupikqrd-snd-card_Button_Jack.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/lahaina-yupikqrd-snd-card_Button_Jack.kl

# Namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Neural networks
PRODUCT_PACKAGES += \
    android.hardware.neuralnetworks@1.3.vendor

# Overlays
PRODUCT_PACKAGES += \
    AOSPALisaFrameworksOverlay \
    AOSPALisaSystemUIOverlay \
    LisaCNSettingsProviderOverlay \
    LisaCNWifiOverlay \
    LisaCarrierConfigOverlay \
    LisaFrameworksOverlay \
    LisaGLSettingsProviderOverlay \
    LisaGLWifiOverlay \
    LisaINSettingsProviderOverlay \
    LisaINWifiOverlay \
    LisaNfcOverlay \
    LisaSettingsOverlay \
    LisaSystemUIOverlay \
    LisaWifiOverlay \
    NoCutoutOverlay

# Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init/fstab.qcom:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.qcom \
    $(LOCAL_PATH)/init/fstab.qcom:$(TARGET_COPY_OUT_RECOVERY)/root/first_stage_ramdisk/fstab.qcom \
    $(LOCAL_PATH)/init/fstab.qcom:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/first_stage_ramdisk/fstab.qcom

# Platform
TARGET_BOARD_PLATFORM := lahaina

# Project ID Quota
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# QC common
TARGET_COMMON_QTI_COMPONENTS := all

# QTEE
PRODUCT_VENDOR_PROPERTIES += \
    persist.vendor.qteeconnector.retrying_interval=30 \
    persist.vendor.qteeconnector.retrying_timeout=2000

# Radio
PRODUCT_VENDOR_PROPERTIES += \
    persist.vendor.radio.add_power_save=1 \
    persist.vendor.radio.atfwd.start=true \
    persist.vendor.radio.data_ltd_sys_ind=true \
    persist.vendor.radio.dynamic_load_mbn=3 \
    persist.vendor.radio.dynamic_sar=1 \
    persist.vendor.radio.enable_temp_dds=true \
    persist.vendor.radio.force_ltd_sys_ind=1 \
    persist.vendor.radio.force_on_dc=true \
    persist.vendor.radio.hidl_dev_service=true \
    persist.vendor.radio.manual_nw_rej_ct=1 \
    persist.vendor.radio.report_codec=1

# Sensors
PRODUCT_PACKAGES += \
    android.hardware.sensors@2.0-service.multihal \
    libsensorndkbridge

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepdetector.xml

PRODUCT_VENDOR_PROPERTIES += \
    persist.vendor.sensors.allow_non_default_discovery=true \
    persist.vendor.sensors.enable.mag_filter=true \
    persist.vendor.sensors.on_change_sample_period=true \
    persist.vendor.sensors.sync_request=true

# Shipping API
PRODUCT_SHIPPING_API_LEVEL := 30

# Thermal
PRODUCT_VENDOR_PROPERTIES += \
    vendor.sys.thermal.data.path=/data/vendor/thermal/

# USB
ifneq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_VENDOR_PROPERTIES += \
    persist.vendor.usb.config=mtp,adb
endif

# Vendor blobs
$(call inherit-product, vendor/xiaomi/lisa/lisa-vendor.mk)

# Verified Boot
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.verified_boot.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.verified_boot.xml

# Vibrator
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/excluded-input-devices.xml:$(TARGET_COPY_OUT_VENDOR)/etc/excluded-input-devices.xml

# VNDK
PRODUCT_COPY_FILES += \
    prebuilts/vndk/v33/arm64/arch-arm64-armv8-a/shared/vndk-core/libstagefright_foundation.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libstagefright_foundation-v33.so
