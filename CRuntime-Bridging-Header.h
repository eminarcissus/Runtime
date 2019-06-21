//
//  CRuntime-Bridging-Header.h
//  Runtime
//
//  Created by Tim Lee on 2019/06/22.
//

#ifndef CRuntime_Bridging_Header_h
#define CRuntime_Bridging_Header_h

const void * _Nullable swift_getTypeByMangledNameInContext(
                                                           const char * _Nullable typeNameStart,
                                                           int typeNameLength,
                                                           const void * _Nullable context,
                                                           const void * _Nullable const * _Nullable genericArgs);

const void * _Nullable swift_allocObject(
                                         const void * _Nullable type,
                                         int requiredSize,
                                         int requiredAlignmentMask);


#endif /* CRuntime_Bridging_Header_h */
