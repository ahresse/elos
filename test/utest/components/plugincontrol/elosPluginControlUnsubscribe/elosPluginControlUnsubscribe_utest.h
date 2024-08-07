// SPDX-License-Identifier: MIT
#pragma once

#include <cmocka_extensions/cmocka_extensions.h>
#include <elos/plugincontrol/plugincontrol.h>

#include "elos/plugincontrol/types.h"

typedef struct elosPluginTest {
    elosPluginControl_t plugin;
} elosPluginTest_t;

TEST_CASE_FUNC_PROTOTYPES(elosTestElosPluginControlUnsubscribeErrInvalidParameter)
TEST_CASE_FUNC_PROTOTYPES(elosTestElosPluginControlUnsubscribeSuccess)
