*** Test Cases ***
*** Keywords ***
UpdateMongoDB_livingNetwork5GModePackage
    [Arguments]    ${DBName}    ${CollectionName}    ${QueryData}    ${UpdateData}
    ConnectMongoDB    ${DBName}
    Comment    ${QueryData}    Set Variable    ${QueryData}
    Comment    ${UpdateData}    Set Variable    ${UpdateData}
    ${QueryData}    BuiltIn.Evaluate    ${QueryData}
    ${UpdateData}    BuiltIn.Evaluate    ${UpdateData}
    Log    ${QueryData}
    Log    ${UpdateData}
    Comment    ${UpdateData_New}    Set Variable    {"$set": {"in_use" : true}}
    ${Result}    Retrieve And Update One Mongodb Record    ${DBName}    ${CollectionName}    ${QueryData}    ${UpdateData}
    BuiltIn.Log Many    &{Result[0]}
    BuiltIn.Log To Console    Update Success
