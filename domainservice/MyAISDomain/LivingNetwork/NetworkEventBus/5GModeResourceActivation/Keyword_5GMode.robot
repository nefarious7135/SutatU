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
Resource          ../../Valiables/CommonValiable/CommonValiable.robot
Resource          ../../Keyword/SecureCRT.robot
Resource          ../../Keyword/Common.robot
Resource          ../../Keyword/MongoDB.robot
*** Keywords ***
CheckResultAndInsertDataByCellId
    [Arguments]    ${DBName}    ${CollectionName}    ${JsonInsert}    ${cellId}
    IF    "${cellId}" == ""
    InsertDataFromJson    ${DBName}    ${CollectionName}    ${JsonInsert}
    ELSE
    BuiltIn.Log Many    ${cellId}
    END

QueryDataReturn5GMode
    [Arguments]    ${DBName}    ${CollectionName}    ${JsonParamiter}
    ConnectMongoDB    ${DBName}
    ${5GMode}    Retrieve MongoDB Records With Desired Fields    ${DBName}    ${CollectionName}    ${JsonParamiter}    5GMode    True    False
    ${5GMode}    Replace String    ${5GMode}    '    ${SPACE}
    ${5GMode}    Remove String    ${5GMode}    dict_items([( _id
    ${5GMode}    Remove String    ${5GMode}    , ObjectId(
    ${5GMode}    Remove String    ${5GMode}    )])
    BuiltIn.Log Many    ${5GMode}
    IF    "${5GMode}" == ""
    ${5GMode}    Set Variable    ${EMPTY}
    ELSE
    ${Split5GMode}=    Split String    ${5GMode}
    ${5GMode}    Set Variable    ${Split5GMode[5]}
    BuiltIn.Log Many    ${5GMode}
    END
    [Return]    ${5GMode}

QueryDataReturnCurrent5GModeEnabler
    [Arguments]    ${DBName}    ${CollectionName}    ${JsonParamiter}
    ConnectMongoDB    ${DBName}
    ${Current5GModeEnabler}    Retrieve MongoDB Records With Desired Fields    ${DBName}    ${CollectionName}    ${JsonParamiter}    current5GModeEnabler    True    False
    ${Current5GModeEnabler}    Replace String    ${Current5GModeEnabler}    '    ${SPACE}
    ${Current5GModeEnabler}    Remove String    ${Current5GModeEnabler}    dict_items([( _id
    ${Current5GModeEnabler}    Remove String    ${Current5GModeEnabler}    , ObjectId(
    ${Current5GModeEnabler}    Remove String    ${Current5GModeEnabler}    )])
    BuiltIn.Log Many    ${Current5GModeEnabler}
    IF    "${Current5GModeEnabler}" == ""
    ${Current5GModeEnabler}    Set Variable    ${EMPTY}
    ELSE
    ${SplitCurrent5GModeEnabler}=    Split String    ${Current5GModeEnabler}
    ${Current5GModeEnabler}    Set Variable    ${SplitCurrent5GModeEnabler[5]}
    BuiltIn.Log Many    ${Current5GModeEnabler}
    END
    [Return]    ${Current5GModeEnabler}

QueryDataReturnbyCellId
    [Arguments]    ${DBName}    ${CollectionName}    ${JsonParamiter}
    ConnectMongoDB    ${DBName}
    ${cellId}    Retrieve MongoDB Records With Desired Fields    ${DBName}    ${CollectionName}    ${JsonParamiter}    cellId    True    False
    ${cellId}    Replace String    ${cellId}    '    ${SPACE}
    ${cellId}    Remove String    ${cellId}    dict_items([( _id
    ${cellId}    Remove String    ${cellId}    , ObjectId(
    ${cellId}    Remove String    ${cellId}    )])
    BuiltIn.Log Many    ${cellId}
    IF    "${cellId}" == ""
    ${cellId}    Set Variable    ${EMPTY}
    ELSE
    ${SplitcellId}=    Split String    ${cellId}
    ${cellId}    Set Variable    ${SplitcellId[5]}
    BuiltIn.Log Many    ${cellId}
    END
    [Return]    ${cellId}

DeleteDataFromCellId
    [Arguments]    ${DBName}    ${CollectionName}    ${cellId}
    [Documentation]    ${DBName} = DataBaseName Ex.mfaf_neb
    ...    ${CollectionName} = CollectionName Ex.livingNetworkMSISDN
    ...    ${cellId} = DataBaseName Ex.{xxxxxxxxxxx}
    ...
    ...
    ...    Ex. DelectDataFromID ${DBName} ${CollectionName} ${cellId}
    ${cellId}    Set Variable    {"cellId":"${cellId}"}
    Remove Mongodb Records    ${DBName}    ${CollectionName}    ${cellId}

SetLogNull_NSB
    [Arguments]    ${Command_Name}    ${pathLog}
    ${filename}    SSHLibrary.Execute Command    find ${pathLog}/ -type f -mmin -5 -prune | grep ${Command_Name} |cut -d '/' -f8
    log    ${filename}
    IF    "${filename}" != ""
    SSHLibrary.Execute Command    echo "" > ${pathLog}/${filename}
    Sleep    2
    END   

ProduceKafka5GMode
    [Arguments]    ${cmdDeleteMassage}    ${cmdProduce}    ${produce}
    [Documentation]    ${cmdDeleteMassage} --> ลบ message
    ...    ${cmdProduce} --> คำสั่ง produce
    ...    ${produce} --> message ที่ต้องการ produce
    #เช็ค path ปัจจุบัน
    ${pwd}    SSHLibrary.Execute Command    pwd
    log    ${pwd}
    #ลบ message ก่อนหน้าออกไปก่อน
    # ${stdout}    SSHLibrary.Write    ${cmdDeleteMassage}
    Comment    sleep    5
    #run คำสัง produce
    ${stdout}    SSHLibrary.Write    ${cmdProduce}    loglevel=DEBUG
    sleep    3
    #ใส่ข้อมูล produce
    SSHLibrary.Write    ${produce}    loglevel=DEBUG
    log    ${produce}