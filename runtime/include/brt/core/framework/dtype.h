//===- dtype.h ------------------------------------------------*--- C++ -*-===//
//
// Copyright 2022 ByteDance Ltd. and/or its affiliates. All rights reserved.
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
//===----------------------------------------------------------------------===//

#pragma once

#include "brt/core/common/common.h"
#include "brt/core/common/string_view.h"
#include <cstdint>
#include <half/half.hpp>
#include <limits>
#include <type_traits>

namespace brt {
enum class DTypeEnum : uint32_t {
  Invalid = 0,
  Float32 = 1,
  Int32 = 2,
  Int64 = 3,
  UInt8 = 4,
  UInt32 = 5,
  Float16 = 6,
  BFloat16 = 7,
  Float64 = 8,
  Bool = 9,
  StringView = 10,
  Int8 = 11,
  Int16 = 12,
  UInt16 = 13,
  UInt64 = 14,
  LastDType,
  Unsupported = LastDType,
};

template <DTypeEnum dtype_enum> struct DTypeTraits;
template <typename ctype> struct ctype_to_dtype;

namespace dtype {
template <typename T, typename SFINAE = void> struct DTypeTraitsImpl;
template <typename T>
struct DTypeTraitsImpl<T,
                       std::enable_if_t<std::numeric_limits<T>::is_specialized>>
    : public std::numeric_limits<T> {
  using impl = std::numeric_limits<T>;

  static constexpr T lower_bound() noexcept {
    return impl::has_infinity ? -impl::infinity() : impl::lowest();
  }

  static constexpr T upper_bound() noexcept {
    return impl::has_infinity ? impl::infinity() : impl::max();
  }
};

template <> struct DTypeTraitsImpl<StringView, void> {};
} // namespace dtype

#define BRT_DEF_DTYPE_TRAITS_FROM_CTYPE(dtype_enum, ctype)                     \
  template <>                                                                  \
  struct DTypeTraits<DTypeEnum::dtype_enum>                                    \
      : public dtype::DTypeTraitsImpl<ctype> {                                 \
    using type_t = ctype;                                                      \
    static_assert(std::is_trivially_copyable<ctype>::value &&                  \
                  std::is_standard_layout<ctype>::value);                      \
  };                                                                           \
  template <> struct ctype_to_dtype<ctype> {                                   \
    static constexpr DTypeEnum value = DTypeEnum::dtype_enum;                  \
  };

BRT_DEF_DTYPE_TRAITS_FROM_CTYPE(Float32, float)
BRT_DEF_DTYPE_TRAITS_FROM_CTYPE(Int32, int32_t)
BRT_DEF_DTYPE_TRAITS_FROM_CTYPE(Int64, int64_t)
BRT_DEF_DTYPE_TRAITS_FROM_CTYPE(UInt8, uint8_t)
BRT_DEF_DTYPE_TRAITS_FROM_CTYPE(UInt32, uint32_t)
BRT_DEF_DTYPE_TRAITS_FROM_CTYPE(Float64, double)
BRT_DEF_DTYPE_TRAITS_FROM_CTYPE(Float16, half_float::half)
BRT_DEF_DTYPE_TRAITS_FROM_CTYPE(Bool, bool)
BRT_DEF_DTYPE_TRAITS_FROM_CTYPE(StringView, StringView)
BRT_DEF_DTYPE_TRAITS_FROM_CTYPE(Int8, int8_t)
BRT_DEF_DTYPE_TRAITS_FROM_CTYPE(Int16, int16_t)
BRT_DEF_DTYPE_TRAITS_FROM_CTYPE(UInt16, uint16_t)
BRT_DEF_DTYPE_TRAITS_FROM_CTYPE(UInt64, uint64_t)

#undef BRT_DEF_DTYPE_TRAITS_FROM_CTYPE

template <typename ctype>
inline constexpr DTypeEnum dtype_enum_v = ctype_to_dtype<ctype>::value;

inline size_t GetDTypeByte(DTypeEnum dtype) {
  switch (dtype) {
#define Case(D)                                                                \
  case DTypeEnum::D: {                                                         \
    return sizeof(DTypeTraits<DTypeEnum::D>::type_t);                          \
  }
    Case(Float32);
    Case(Int32);
    Case(Int64);
    Case(UInt8);
    Case(UInt32);
    Case(Float64);
    Case(Float16);
    Case(Bool);
    Case(StringView);
    Case(Int8);
    Case(Int16);
    Case(UInt16);
    Case(UInt64);
#undef Case
  default: {
    BRT_THROW("invalid brt dtype");
  }
  }
}

} // namespace brt
