*** Comments ***
# SPDX-License-Identifier: MIT


*** Settings ***
Documentation       A test suite to check missing blacklist filter

Resource            ../../elosd-keywords.resource
Resource            ../../keywords.resource
Library             ../../libraries/TemplateConfig.py
Library             ../../libraries/ElosKeywords.py

Suite Setup         Run Keywords    Connect To Target And Log In
...                 AND             Ensure Elosd Is Started
Suite Teardown      Close All Connections


*** Variables ***
${BLACKLIST_FILTER}     ${EMPTY}
@{PROCESS_FILTER}       1 0 EQ    # all processes are unauthorized


*** Test Cases ***
01_Test_Missing_Blacklist_Filter    # robocop: disable=not-capitalized-test-case-title
    [Documentation]    Blacklist filter is missing

    Given A Blacklist Filter Is Missing
    When Unauthorized Process Tries To Publish A Blacklisted Event
    Then A Blacklist Failed Event Is Published
    [Teardown]    Reset Elosd Config


*** Keywords ***
A Blacklist Filter Is Missing
    [Documentation]    Set blacklist filter missing in config

    Ensure Elosd Is Stopped
    Set Config From Template
    ...    EventBlacklist=${BLACKLIST_FILTER}
    ...    authorizedProcesses=${PROCESS_FILTER}
    Ensure Elosd Is Started

Unauthorized Process Tries To Publish A Blacklisted Event
    [Documentation]    An elos client tries to publish a black listed event and fails

    ${rc}    Execute And Log    elosc -p '{"messageCode": 2010}'    ${RETURN_RC}
    Executable Returns An Error    ${rc}

A Blacklist Failed Event Is Published
    [Documentation]    Attempt to publish a event and appling the black list
    ...                fails will lead to a blacklist failed (501) event if
    ...                client is unauthorized.

    ${stdout}    ${rc}    Execute And Log
    ...    elosc -f ".event.messageCode 501 EQ"
    ...    ${RETURN_STDOUT}
    ...    ${RETURN_RC}
    Should Contain    ${stdout}    2010
    Executable Returns No Errors    ${rc}    Blacklisted event not filtered out by blacklist filter
