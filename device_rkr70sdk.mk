$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/goclever/rkr70sdk/rkr70sdk-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/goclever/rkr70sdk/overlay
VENDOR_PATH := vendor/goclever/rkr70sdk
LOCAL_PATH := device/goclever/rkr70sdk
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

# Ramdisk
PRODUCT_COPY_FILES += \
	$(LOCAL_KERNEL):kernel \
	$(LOCAL_PATH)/ramdisk/init.rc:root/init.rc \
	$(LOCAL_PATH)/ramdisk/init.rk2928board.rc:root/init.rk2928board.rc \
	$(LOCAL_PATH)/ramdisk/init.rk2928board.usb.rc:root/init.rk2928board.usb.rc \
	$(LOCAL_PATH)/ramdisk/init.recovery.rk2928board.rc:root/init.recovery.rk2928board.rc \
	$(LOCAL_PATH)/ramdisk/ueventd.rk2928board.rc:root/ueventd.rk2928board.rc \
	$(VENDOR_PATH)/proprietary/rk292xnand_ko.ko:root/rk292xnand_ko.ko

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_PROPERTY_OVERRIDES += ro.sf.lcd_density=120 \
    ro.product.usbfactory=rockchip_usb \
    sys.hwc.compose_policy=0 \
	sf.power.control=2073600 \
	ro.sf.fakerotation=true \
	ro.sf.hwrotation=0 \
	wifi.interface=wlan0 \
	ro.rk.screenoff_time=60000 \
	ro.rk.def_brightness=110 \
	ro.rk.bt_enable=false \
	rild.libargs=-d_/dev/ttyUSB1 \
	ril.pppchannel=/dev/ttyUSB2 \
	rild.libpath=/system/lib/libril-rk29-dataonly.so \
	ril.function.dataonly=1 \
	dalvik.vm.dexopt-flags=m=y \
	dalvik.vm.jniopts=warnonly \
    ro.opengles.version=131072 \
    libc.debug.malloc=10

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml

# Publish that we support the live wallpaper feature.
PRODUCT_PACKAGES += \
	LiveWallpapers \
	LiveWallpapersPicker \
	MagicSmokeWallpapers \
	HoloSpiralWallpaper \
	Email

PRODUCT_PACKAGES += \
	VisualizationWallpapers \
	librs_jni \
	libjni_pinyinime \
	hostapd_rtl

PRODUCT_PACKAGES += \
    power.rk2928board \
    sensors.rk2928board \
    gralloc.rk2928board \
    hwcomposer.rk2928board \
    lights.rk2928board \
    camera.rk2928board \
    gpu.rk2928board \
    akmd \
    drmservice \
    LegacyCamera \
    charger \
	charger_res_images

# audio lib
PRODUCT_PACKAGES += \
    audio_policy.rk2928board \
    audio.primary.rk2928board

PRODUCT_PACKAGES += \
    com.android.future.usb.accessory
    
PRODUCT_COPY_FILES += \
    $(VENDOR_PATH)/proprietary/system/etc/vold.fstab:system/etc/vold.fstab     
    
# EXT4 Support
PRODUCT_PACKAGES += \
	make_ext4fs \
	e2fsck \
	mkdisfs \
	mke2fs \
	tune2fs \
	resize2fs

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mass_storage
	
$(call inherit-product, frameworks/native/build/tablet-dalvik-heap.mk)

PRODUCT_NAME := full_rkr70sdk
PRODUCT_DEVICE := rkr70sdk
