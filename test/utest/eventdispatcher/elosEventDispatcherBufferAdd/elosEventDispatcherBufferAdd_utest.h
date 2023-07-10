// SPDX-License-Identifier: MIT
#pragma once

#include <cmocka_extensions/cmocka_extensions.h>

#include "elos/eventbuffer/eventbuffer.h"
#include "elos/eventdispatcher/eventdispatcher.h"

#define _EVENTBUFFER_ENTRIES 3

typedef struct elosUnitTestState {
    elosEventDispatcher_t eventDispatcher;
    elosEventProcessor_t eventProcessor;
    elosEventBuffer_t eventBuffer[_EVENTBUFFER_ENTRIES];
} elosUnitTestState_t;

TEST_CASE_FUNC_PROTOTYPES(testElosEventDispatcherBufferAddErrFunc)
TEST_CASE_FUNC_PROTOTYPES(testElosEventDispatcherBufferAddErrMutex)
TEST_CASE_FUNC_PROTOTYPES(testElosEventDispatcherBufferAddErrParam)
TEST_CASE_FUNC_PROTOTYPES(testElosEventDispatcherBufferAddSuccess)
