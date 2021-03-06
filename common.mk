#Common headers
common_includes := hardware/qcom/display/libgralloc
common_includes += hardware/qcom/display/libgenlock
common_includes += hardware/qcom/display/liboverlay
common_includes += hardware/qcom/display/libcopybit
common_includes += hardware/qcom/display/libqdutils
common_includes += hardware/qcom/display/libhwcomposer
common_includes += hardware/qcom/display/libexternal
common_includes += hardware/qcom/display/libqservice

ifeq ($(TARGET_USES_POST_PROCESSING),true)
    common_flags     += -DUSES_POST_PROCESSING
    common_includes += $(TARGET_OUT_HEADERS)/pp/inc
endif


#Common libraries external to display HAL
common_libs := liblog libutils libcutils libhardware

#Common C flags
common_flags := -DDEBUG_CALC_FPS -Wno-missing-field-initializers

ifeq ($(ARCH_ARM_HAVE_NEON),true)
    common_flags += -D__ARM_HAVE_NEON
endif

ifeq ($(TARGET_BOARD_PLATFORM), msm8974)
    common_flags += -DVENUS_COLOR_FORMAT
    common_flags += -DMDSS_TARGET
endif

common_deps  :=
kernel_includes :=

# Executed only on QCOM BSPs
ifeq ($(TARGET_USES_QCOM_BSP),true)
    common_flags += -DQCOM_BSP
    common_deps += $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr
    kernel_includes += $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/include
endif
