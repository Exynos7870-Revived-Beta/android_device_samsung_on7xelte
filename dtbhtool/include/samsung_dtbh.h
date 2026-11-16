/* tools/mkbootimg/samsung_dtbh.h
**
** Copyright 2017, The LineageOS Project
** Copyright (C) 2026 samsungexynos7870
**
** Licensed under the Apache License, Version 2.0 (the "License");
** you may not use this file except in compliance with the License.
** You may obtain a copy of the License at
**
**     http://www.apache.org/licenses/LICENSE-2.0
**
** Unless required by applicable law or agreed to in writing, software
** distributed under the License is distributed on an "AS IS" BASIS,
** WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
** See the License for the specific language governing permissions and
** limitations under the License.
*/

#ifndef _SAMSUNG_DTBH_H_
#define _SAMSUNG_DTBH_H_

#define DTBH_MAGIC         "DTBH"
#define DTBH_VERSION       2
#define DTBH_MODEL         "ON7XE"
#define DTBH_PLATFORM      "android"
#define DTBH_SUBTYPE       "samsung"
#define DTBH_PLATFORM_CODE 0x000050a6
#define DTBH_SUBTYPE_CODE  0x217584da

#define DT_HEADER_PHYS_SIZE 12
#define DT_ENTRY_PHYS_SIZE (sizeof(uint32_t) * 8)

#endif // _SAMSUNG_DTBH_H_
