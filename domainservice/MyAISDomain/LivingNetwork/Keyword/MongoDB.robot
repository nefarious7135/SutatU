*** Settings ***
Library           SSHLibrary
Library           DatabaseLibrary
Library           psycopg2
Library           RobotMongoDBLibrary.Insert
Library           RobotMongoDBLibrary.Update
Library           RobotMongoDBLibrary.Find
Library           RobotMongoDBLibrary.Delete
Library           pymongo
Library           BuiltIn
Library           String
Library           OperatingSystem
Library           MongoDBLibrary
Resource          ../Valiables/CommonValiable/CommonValiable.robot
Resource          Common.robot
Resource          SecureCRT.robot
*** Keywords ***
QueryDataReturnJson
    [Arguments]    ${DBName}    ${CollectionName}    ${JsonParamiter}
    [Documentation]    ${DBName} = DataBaseName Ex.mfaf_neb
    ...    ${CollectionName} = CollectionName Ex.livingNetworkMSISDN
    ...    ${JsonParamiter} = DataBaseName Ex.{"xxxx":"xxxxxxx"}
    ...
    ...
    ...    Ex. ${json} QueryDataReturnJson ${DBName} ${CollectionName} ${JsonParamiter}
    ConnectMongoDB    ${DBName}
    ${jsondata}    Retrieve MongoDB Records With Desired Fields    ${DBName}    ${CollectionName}    ${JsonParamiter}    _id    False    True
    BuiltIn.Log Many    ${jsondata[0]}
    [Return]    ${jsondata[0]}

ConnectMongoDB
    [Arguments]    ${DBName}
    [Documentation]    ${DBName} = DataBaseName Ex.mfaf_neb
    Connect To MongoDB    mongodb://mfafApp:Ais%402023@10.138.42.185:25000,10.138.42.189:25000,10.138.42.186:25000/?authSource=${DBName}&replicaSet=replSet01

InsertDataFromJson
    [Arguments]    ${DBName}    ${CollectionName}    ${JsonInsert}
    [Documentation]    ${DBName} = DataBaseName Ex.mfaf_neb
    ...    ${CollectionName} = CollectionName Ex.livingNetworkMSISDN
    ...    ${JsonInsert} = DataBaseName Ex.{"xxxx":"xxxxxxx"}
    ...
    ...
    ...    Ex. InsertDataFromJson ${DBName} ${CollectionName} ${JSONINSERT}
    ${Data_insert}    Set Variable    ${JsonInsert}
    ConnectMongoDB    ${DBName}
    ${data_result}    Save Mongodb Records    ${DBName}    ${CollectionName}    ${Data_insert}
    log    ${data_result}
    BuiltIn.Log To Console    Insert Success

DeleteDataFromID
    [Arguments]    ${DBName}    ${CollectionName}    ${ID}
    [Documentation]    ${DBName} = DataBaseName Ex.mfaf_neb
    ...    ${CollectionName} = CollectionName Ex.livingNetworkMSISDN
    ...    ${ID} = DataBaseName Ex.{xxxxxxxxxxx}
    ...
    ...
    ...    Ex. DelectDataFromID ${DBName} ${CollectionName} ${ID}
    ${ID}    Set Variable    {"_id":"${ID}"}
    Remove Mongodb Records    ${DBName}    ${CollectionName}    ${ID}

DeleteDataFromMsisdn
    [Arguments]    ${DBName}    ${CollectionName}    ${msisdn}
    [Documentation]    ${DBName} = DataBaseName Ex.mfaf_neb
    ...    ${CollectionName} = CollectionName Ex.livingNetworkMSISDN
    ...    ${ID} = DataBaseName Ex.{xxxxxxxxxxx}
    ...
    ...
    ...    Ex. DelectDataFromID ${DBName} ${CollectionName} ${msisdn}
    ${msisdn}    Set Variable    {"msisdn":"${msisdn}"}
    Remove Mongodb Records    ${DBName}    ${CollectionName}    ${msisdn}    

QueryDataReturnID
    [Arguments]    ${DBName}    ${CollectionName}    ${JSON}
    ConnectMongoDB    ${DBName}
    ${ID}    Retrieve MongoDB Records With Desired Fields    ${DBName}    ${CollectionName}    ${JSON}    _id    True    False
    ${ID}    Replace String    ${ID}    '    ${SPACE}
    ${ID}    Remove String    ${ID}    dict_items([( _id
    ${ID}    Remove String    ${ID}    , ObjectId(
    BuiltIn.Log Many    ${ID}
    IF    "${ID}" == ""
    ${ID}    Set Variable    ${EMPTY}
    ELSE
    ${SplitID}=    Split String    ${ID}
    ${ID}    Set Variable    ${SplitID[0]}
    BuiltIn.Log Many    ${ID}
    END
    [Return]    ${ID}

QueryDataReturnMsisdn
    [Arguments]    ${DBName}    ${CollectionName}    ${msisdn}
    ConnectMongoDB    ${DBName}
    ${msisdn2}    Remove String    ${msisdn}    {"
    ${msisdn2}    Remove String Using Regexp    ${msisdn2}    ".*}
    ${msisdn}    Retrieve MongoDB Records With Desired Fields    ${DBName}    ${CollectionName}    ${msisdn}    ${msisdn2}    True    False
    # ${msisdn}    Retrieve MongoDB Records With Desired Fields    ${DBName}    ${CollectionName}    ${msisdn}    msisdn    True    False
    ${msisdn}    Replace String    ${msisdn}    '    ${SPACE}
    ${msisdn}    Remove String    ${msisdn}    dict_items([( _id
    ${msisdn}    Remove String    ${msisdn}    , ObjectId(
    BuiltIn.Log Many    ${msisdn}
    IF    "${msisdn}" == ""
    ${msisdn}    Set Variable    ${EMPTY}
    ELSE
    ${Splitmsisdn}=    Split String    ${msisdn}
    ${msisdn}    Set Variable    ${Splitmsisdn[5]}
    BuiltIn.Log Many    ${msisdn}
    END
    [Return]    ${msisdn}

DelectDataFromMsisdn
    [Arguments]    ${DBName}    ${CollectionName}    ${msisdn}
    [Documentation]    ${DBName} = DataBaseName Ex.mfaf_neb
    ...    ${CollectionName} = CollectionName Ex.livingNetworkMSISDN
    ...    ${msisdn} = DataBaseName Ex.{xxxxxxxxxxx}
    ...
    ...
    ...    Ex. DelectDataFromID ${DBName} ${CollectionName} ${msisdn}
    ${msisdn}    Set Variable    {"msisdn":"${msisdn}"}
    Remove Mongodb Records    ${DBName}    ${CollectionName}    ${msisdn}

QueryDataReturnCellId
    [Arguments]    ${DBName}    ${CollectionName}    ${JsonParamiter}
    [Documentation]    ${DBName} = DataBaseName Ex.mfaf_neb
    ...    ${CollectionName} = CollectionName Ex.livingNetworkMSISDN
    ...    ${JsonParamiter} = DataBaseName Ex.{"xxxx":"xxxxxxx"}
    ...
    ...
    ...    Ex. ${json} QueryDataReturnJson ${DBName} ${CollectionName} ${JsonParamiter}
    ConnectMongoDB    ${DBName}
    Comment    ${msisdn}    Retrieve MongoDB Records With Desired Fields    ${DBName}    ${CollectionName}    ${JsonParamiter}    msisdn    False    True
    ${cellId}    Retrieve MongoDB Records With Desired Fields    ${DBName}    ${CollectionName}    ${JsonParamiter}    properties.CGI_HEX    False    True
    ${cellId_String}    BuiltIn.Convert To String    ${CellId}
    ${cellId}    Replace String    ${cellId_String}    '    ${SPACE}
    ${cellId}    Remove String    ${cellId}    [{ properties : { CGI_HEX :
    ${cellId}    Remove String    ${cellId}    }}]
    ${cellId}    Remove String    ${cellId}    ${SPACE}
    [Return]    ${cellId}

QueryDataReturnCellIdNew
    [Arguments]    ${DBName}    ${CollectionName}    ${JsonParamiter}
    [Documentation]    ${DBName} = DataBaseName Ex.mfaf_neb    Owner : sutat
    ...    ${CollectionName} = CollectionName Ex.livingNetworkMSISDN
    ...    ${JsonParamiter} = DataBaseName Ex.{"xxxx":"xxxxxxx"}
    ...
    ...
    ...    Ex. ${json} QueryDataReturnJson ${DBName} ${CollectionName} ${JsonParamiter}
    ConnectMongoDB    ${DBName}
    Comment    ${msisdn}    Retrieve MongoDB Records With Desired Fields    ${DBName}    ${CollectionName}    ${JsonParamiter}    msisdn    False    True
    ${cellId}    Retrieve MongoDB Records With Desired Fields    ${DBName}    ${CollectionName}    ${JsonParamiter}    cellId    False    True
    ${cellId_String}    BuiltIn.Convert To String    ${CellId}
    ${cellId}    Replace String    ${cellId_String}    '    ${SPACE}
    ${cellId}    Remove String    ${cellId}    [{ cellId :  
    ${cellId}    Remove String    ${cellId}    }]
    ${cellId}    Remove String    ${cellId}    ${SPACE}
    log    cellId=${cellId}    console=yes
    [Return]    ${cellId}    

CheckDataReturnCellId   
    [Arguments]    ${DBName}    ${CollectionName}    ${cellId}
    [Documentation]    ${DBName} = DataBaseName Ex.mfaf_neb    Owner : sutat
    ...    ${CollectionName} = CollectionName Ex.livingNetworkMSISDN
    ...    ${cellId} = DataBaseName Ex.{xxxxxxxxxxx}
    ...
    ...
    ...    Ex. DelectDataFromID ${DBName} ${CollectionName} ${cellId}
    ${cellId}    Set Variable    {"properties.CGI_HEX" : "${cellId}"}
    ${cellId}    Retrieve MongoDB Records With Desired Fields    ${DBName}    ${CollectionName}    ${cellId}    properties.CGI_HEX    False    True
    ${cellId_String}    BuiltIn.Convert To String    ${CellId}
    ${cellId}    Replace String    ${cellId_String}    '    ${SPACE}
    ${cellId}    Remove String    ${cellId}    [{ properties : { CGI_HEX :
    ${cellId}    Remove String    ${cellId}    }}]
    ${cellId}    Remove String    ${cellId}    ${SPACE}
    log    properties.CGI_HEX=${cellId}    console=yes
    [Return]    ${cellId}

## For publicId
QueryDataReturnpublicId
    [Arguments]    ${DBName}    ${CollectionName}    ${publicId}
    ConnectMongoDB    ${DBName}
    ${publicId}    Retrieve MongoDB Records With Desired Fields    ${DBName}    ${CollectionName}    ${publicId}    publicId    True    False
    ${publicId}    Replace String    ${publicId}    '    ${SPACE}
    ${publicId}    Remove String    ${publicId}    dict_items([( _id
    ${publicId}    Remove String    ${publicId}    , ObjectId(
    BuiltIn.Log Many    ${publicId}
    IF    "${publicId}" == ""
    ${publicId}    Set Variable    ${EMPTY}
    ELSE
    ${SplitpublicId}=    Split String    ${publicId}
    ${publicId}    Set Variable    ${SplitpublicId[5]}
    BuiltIn.Log Many    ${publicId}
    END
    [Return]    ${publicId}

DelectDataFrompublicId
    [Arguments]    ${DBName}    ${CollectionName}    ${publicId}
    [Documentation]    ${DBName} = DataBaseName Ex.mfaf_neb
    ...    ${CollectionName} = CollectionName Ex.livingNetworkPublicId
    ...    ${publicId} = DataBaseName Ex.{xxxxxxxxxxx}
    ...
    ...
    ...    Ex. DelectDataFromID ${DBName} ${CollectionName} ${publicId}
    ${publicId}    Set Variable    {"publicId":"${publicId}"}
    Remove Mongodb Records    ${DBName}    ${CollectionName}    ${publicId}
