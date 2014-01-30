$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/goclever/rkr70sdk/rkr70sdk-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/goclever/rkr70sdk/overlay

LOCAL_PATH := device/goclever/rkr70sdk
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel \
    $(LOCAL_PATH)/rk292xnand_ko.ko:root/rk292xnand_ko.ko \
    $(LOCAL_PATH)/init:root/init

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

PRODUCT_PROPERTY_OVERRIDES += ro.sf.lcd_density=120 \
	sf.power.control=2073600 \
	ro.sf.fakerotation=true \
	ro.sf.hwrotation=270 \
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
	dalvik.vm.dexopt-data-only=1 \

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \

$(call inherit-product, frameworks/native/build/tablet-dalvik-heap.mk)

PRODUCT_NAME := full_rkr70sdk
PRODUCT_DEVICE := rkr70sdk
