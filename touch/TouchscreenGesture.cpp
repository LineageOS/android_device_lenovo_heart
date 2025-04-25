/*
 * SPDX-FileCopyrightText: The LineageOS Project
 * SPDX-License-Identifier: Apache-2.0
 */

#define LOG_TAG "TouchscreenGestureService"

#include "TouchscreenGesture.h"
#include <android-base/logging.h>
#include <fstream>

namespace aidl {
namespace vendor {
namespace lineage {
namespace touch {

const std::map<int32_t, TouchscreenGesture::GestureInfo> TouchscreenGesture::kGestureInfoMap = {
    {0, {251, "Two fingers down swipe", "/sys/class/touch/tp_dev/double_swipe_enable"}},
    {1, {253, "Left arrow", "/sys/class/touch/tp_dev/right_arrow_enable"}},
    {2, {254, "Right arrow", "/sys/class/touch/tp_dev/left_arrow_enable"}},
    {3, {252, "Up arrow", "/sys/class/touch/tp_dev/down_arrow_enable"}},
    {4, {255, "Down arrow", "/sys/class/touch/tp_dev/up_arrow_enable"}},
    {5, {66, "One finger up swipe", "/sys/class/touch/tp_dev/down_swipe_enable"}},
    {6, {64, "One finger down swipe", "/sys/class/touch/tp_dev/up_swipe_enable"}},
    {7, {247, "Letter M", "/sys/class/touch/tp_dev/letter_m_enable"}},
    {8, {250, "Letter O", "/sys/class/touch/tp_dev/letter_o_enable"}},
};


ndk::ScopedAStatus TouchscreenGesture::getSupportedGestures(std::vector<Gesture>* _aidl_return) {
    std::vector<Gesture> gestures;

    for (const auto& entry : kGestureInfoMap) {
        gestures.push_back({entry.first, entry.second.name, entry.second.keycode});
    }

    *_aidl_return = gestures;
    return ndk::ScopedAStatus::ok();
}

ndk::ScopedAStatus TouchscreenGesture::setGestureEnabled(const Gesture& gesture, bool enabled) {
    const auto entry = kGestureInfoMap.find(gesture.id);
    if (entry == kGestureInfoMap.end()) {
        return ndk::ScopedAStatus::fromExceptionCode(EX_UNSUPPORTED_OPERATION);
    }

    std::ofstream file(entry->second.path);
    file << (enabled ? "1" : "0");
    LOG(DEBUG) << "Wrote file " << entry->second.path << " fail " << file.fail();

    return ndk::ScopedAStatus::ok();
}

}  // namespace touch
}  // namespace lineage
}  // namespace vendor
}  // namespace aidl
