LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_CPP_EXTENSION := .cpp .cc
LOCAL_MODULE    := CLEOMod
LOCAL_SRC_FILES := main.cpp mod/logger.cpp mod/config.cpp libcleo.cpp cleo201_refactor.cpp cleo4opcodes.cpp cleo5opcodes.cpp cleomath.cpp mini-scanf-cleo/c_scan.c

LOCAL_CFLAGS += -O2 -mfloat-abi=softfp -DNDEBUG -std=c11 -DAML_CLEO
LOCAL_CXXFLAGS += -O2 -mfloat-abi=softfp -DNDEBUG -std=c++17

LOCAL_LDLIBS := -llog
# No NDK r21, o Clang reconhece a biblioteca de filesystem quando passada via -L com a pasta interna de toolchains
LOCAL_LDFLAGS += -L$(NDK_ROOT)/toolchains/llvm/prebuilt/linux-x86_64/sysroot/usr/lib/arm-linux-androideabi -lc++fs

include $(BUILD_SHARED_LIBRARY)