#
# Copyright (C) 2024 The Android Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Release name
PRODUCT_RELEASE_NAME := SM-J260GU

# Inherit from AOSP base
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

# Inherit TWRP/Omni common
$(call inherit-product, vendor/omni/config/common.mk)

## Device identifier
PRODUCT_DEVICE := j2corey20lte
PRODUCT_NAME := omni_j2corey20lte
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-J260GU
PRODUCT_MANUFACTURER := samsung
