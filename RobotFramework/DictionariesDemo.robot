*** Settings ***
Documentation    
...              This program demonstrates using keywords from BuiltIn and Collections libraries.
...              Dictionary variables are created using keywords from the BuiltIn Library.
...              BuiltIn library also has keywords for creating dictionaries, checking length or count and
...              checking membership.
Library          Collections

*** Variables ***


*** Test Cases ***
Dictionary Testing
    &{dict1} =    Create Dictionary    team=Sydney Tuskers
    &{dict2} =    Create Dictionary    stadium=Sydney    nickname=SCG
    # merge dictionaries, if keys appear multiple times final value will be used.
    &{dict} =     Create Dictionary    &{dict1}    &{dict2}    
    Should Be True    ${dict} == {'team': 'Sydney Tuskers', 'stadium': 'Sydney', 'nickname': 'SCG'}
    # demonstrate dot access
    Should Be Equal    ${dict.stadium}     Sydney
    Should Be Equal    ${dict.nickname}    SCG
    Should Not Be Equal    ${dict.nickname}    MCG
    Dictionary Should Contain Key    ${dict}    nickname
    Dictionary Should Contain Value    ${dict}    SCG
    ${val} =    Pop From Dictionary    ${dict}    nickname
    # use $ variable prefix to access dictionary as a single, scalar value
    Log    ${dict}
    # use & variable prefix to expand the dictionary into key-value pairs
    Log Many    &{dict}
    Log Dictionary    ${dict}