LOCAL_PATH := $(call my-dir)

# Importa estaticamente o módulo de filesystem do próprio NDK r21
include $(CLEAR_VARS)
LOCAL_MODULE := c++fs_static
LOCAL_SRC_FILES := $(NDK_ROOT)/sources/cxx-stl/llvm-libc++/libs/$(TARGET_ARCH_ABI)/libc++fs.a
include $(PREBUILT_STATIC_LIBRARY)

# Compilador do seu Mod
include $(CLEAR_VARS)
LOCAL_CPP_EXTENSION := .cpp .cc
LOCAL_MODULE    := CLEOMod
LOCAL_SRC_FILES := main.cpp mod/logger.cpp mod/config.cpp libcleo.cpp cleo201_refactor.cpp cleo4opcodes.cpp cleo5opcodes.cpp cleomath.cpp mini-scanf-cleo/c_scan.c
LOCAL_CFLAGS += -O2 -mfloat-abi=softfp -DNDEBUG -std=c11 -DAML_CLEO
LOCAL_CXXFLAGS += -O2 -mfloat-abi=softfp -DNDEBUG -std=c++17

LOCAL_STATIC_LIBRARIES := c++fs_static
LOCAL_LDLIBS := -llog

include $(BUILD_SHARED_LIBRARY)