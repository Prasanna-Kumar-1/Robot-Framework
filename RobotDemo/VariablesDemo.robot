*** Settings ***
Documentation    Variable Demo
...              Scalar variables start with $ prefix and should be considered a single value.
...              The @ prefix is similar to the * (expansion or unpacking) operator in Python.
Library    Collections    

*** Variables ***

*** Test Cases ***
Lists Lists Lists
   #Create List can be used to Create a List
   # After it is created, the returned list can be assigned to ${Scalar} and @{List} variables
   
   ${list}=    Create List    a    b    c
   
   #Set Variable : Used for setting scalar variables. 
   #               it can be used for converting a scalar variable containing a list to a list variable or 
   #               to multiple scalar variables. 
   
   @{also_list}=     Set Variable   a   b   c
   One List      ${also_list}
   
   #Passing entire List as an argument
   Many Values   @{list}
   
   Many Values   d   e   @{also_list}
   ${a} =    Create List    a
   @{bc} =    Set Variable    b    c
   Log ABC    ${a}    @{bc}

*** Keywords ***
One List
   [Arguments]    ${li}
   Log Many    @{li}
   #the below statement converts
   Log    Printing as a List from "One List"
   #Observe $   
   Log         ${li}
   
Many Values
   [Arguments]   @{li}
   Log Many    @{li}
   Log    Printing as a List from "Many Values"
   #Observe $   
   Log         ${li}

Log ABC
   [Arguments]    ${a}    @{bc}
   Log   ${a}
   
   #Accessing first element of a List. Need to use $ to access individual element
   Log   ${bc}[0]
   
   #Accessing secnond element of a List. 
   Log   ${bc}[1]