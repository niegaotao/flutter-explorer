//
//  CAPI.h
//  iOSApp-Swift
//
//  Created by 聂高涛 on 2022/1/11.
//

#ifndef CAPI_h
#define CAPI_h

#include <stdio.h>

const void * _Nullable swift_getTypeByMangledNameInContext(
                                                           const char * _Nullable typeNameStart,
                                                           int typeNameLength,
                                                           const void * _Nullable context,
                                                           const void * _Nullable const * _Nullable genericArgs);

const void * _Nullable swift_allocObject(
                                         const void *_Nullable type,
                                         int requiredSize,
                                         int requoredAligmentMask);

#endif /* CAPI_h */
