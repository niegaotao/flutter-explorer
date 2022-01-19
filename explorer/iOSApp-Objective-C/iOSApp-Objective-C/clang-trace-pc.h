//
//  clang-trace-pc.h
//  iOSApp-Objective-C
//
//  Created by 聂高涛 on 2022/1/18.
//

#include "clang-trace-pc.h"

#include <stdint.h>
#include <stdio.h>
#include <sanitizer/coverage_interface.h>
#include <stdint.h>
#include <stdio.h>
#include <sanitizer/coverage_interface.h>
#import <dlfcn.h>
#import <libkern/OSAtomic.h>


typedef struct{
    void *pc;
    void *next;
}SYNode;

static OSQueueHead symbolList = OS_ATOMIC_QUEUE_INIT;


void __sanitizer_cov_trace_pc_guard_init(uint32_t *start, uint32_t *stop) {
//    static uint64_t N;  // Counter for the guards.
//    if (start == stop || *start) return;  // Initialize only once.
//    printf("INIT: %p %p\n", start, stop);
//    for (uint32_t *x = start; x < stop; x++)
//    *x = ++N;
}

void __sanitizer_cov_trace_pc_guard(uint32_t *guard) {

    if (!*guard) return;
    void *PC = __builtin_return_address(0);


    SYNode *node = malloc(sizeof(SYNode));
    *node = (SYNode){PC, NULL};

    OSAtomicEnqueue(&symbolList, node, offsetof(SYNode, next));
    
    Dl_info info;
    dladdr(PC, &info);
    printf("fname=%s\nfbase=%p\nsname=%s\nsaddr=%p\n\n", info.dli_fname, info.dli_fbase, info.dli_sname, info.dli_saddr);
}

