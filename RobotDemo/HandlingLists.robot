*** Settings ***
Documentation    This Demo demonstrates using keywords from the Collections library.
...              List variables are created using Create List keyword from the BuiltIn Library.
...              This also demonstrates how to extend Robot Framework using Evaluate keyword to implement
...              small snippets of embedded Python code.

Library          Collections

*** Variables ***

*** Test Cases ***
Testing List of Numbers
    # Scalar variables start with $ prefix
    # Expanded list variables start with @ prefix
    
    #Evaluate   :    Evaluates the given expression in Python and returns the results.
    #                expression is evaluated in Python as explained in `Evaluating expressions`.
    
    #                "modules" argument can be used to specify a comma separated list of Python modules to be imported and 
    #                added to the evaluation namespace.
    
    ${randlist}=    Evaluate    random.sample(range(1, 20), 5)    modules=random
    ${itemcount} =    Get Length    ${randlist}
    ${numbers} =    Create List    @{randlist}
    Log List    ${numbers}
    Sort List    ${numbers}
    Log List    ${numbers}

Testing List Of Letters
    ${letters} =    Create List    a    b    c
    ${matches} =    Count Values In List    ${letters}    c
    Log List    ${letters}
    List Should Contain Value        ${letters}    b
    List Should Not Contain Value    ${letters}    z
    Remove Values From List    ${letters}    a    c
    Log List    ${letters}
    Append To List    ${letters}    z    x    j    f
    Sort List    ${letters}
    Log List    ${letters}