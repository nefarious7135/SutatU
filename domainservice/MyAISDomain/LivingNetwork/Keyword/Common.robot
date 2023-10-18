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
Resource          MongoDB.robot
Resource          SecureCRT.robot
Library           DateTime
Library           JSONLibrary
Library           Collections
Resource          Stat.robot
*** Keywords ***
VerifyDataConsume
    [Arguments]    ${Data_Actual}    ${Data_Expect}
    [Documentation]    ${Data_Actual} | ${Data_Expect}
    ...
    ...
    ...
    ...    ${Data_Expect} = Expect
    BuiltIn.Should Be Equal    ${Data_Actual}    ${Data_Expect}    #ตอนนี้มันมี ESC ติดมา ไปหาวิธีเอา ESC ออกแล้วค่อยกลับมาใช้
    Comment    BuiltIn.Should Contain    ${Data_Actual}    ${Data_Expect}

VerifyData
    [Arguments]    ${Data_Actual}    ${Data_Expect}
    [Documentation]    Owner : Sutat
    ...    ${Data_Actual} | ${Data_Expect}
    ...
    ...    ${Data_Expect} = Expect
    BuiltIn.Should Be Equal As Strings   ${Data_Actual}    ${Data_Expect}     

VerifyMongoDB
    [Arguments]    ${Data_Actual}    ${Data_Expect}
    [Documentation]    ${Data_Actual} | ${Data_Expect}
    ...
    ...
    ...
    ...    ${Data_Expect} = Expect
    ${Data_Expect}    BuiltIn.Evaluate    ${Data_Expect}
    BuiltIn.Should Be Equal    ${Data_Actual}    ${Data_Expect}

CheckResultAndInsertDelectData
    [Arguments]    ${DBName}    ${CollectionName}    ${JsonInsert}    ${ID}
    IF    "${ID}" == ""
    InsertDataFromJson    ${DBName}    ${CollectionName}    ${JsonInsert}
    ELSE
    DeleteDataFromID    ${DBName}    ${CollectionName}    ${ID}
    InsertDataFromJson    ${DBName}    ${CollectionName}    ${JsonInsert}
    END

CurrentDate
    ${CurrentDate}    SSHLibrary.Execute Command    date +"%Y%m%d"
    [Return]    ${CurrentDate}

CurrentDateFromLibrary
    ${CurrentDate}    DateTime.Get Current Date
    ${date}    ${time} =    String.Split String    ${CurrentDate}    ${SPACE}    1
    ${date}    String.Replace String    ${date}    -    ${EMPTY}
    [Return]    ${date}

CurrentDateAndTime
    ${CurrentDateAndTime}    SSHLibrary.Execute Command    date +"%Y%m%d:%H%M"
    [Return]    ${CurrentDateAndTime}

CurrentDateAndTime+1hour
    ${CurrentDateAndTime+1hour}    SSHLibrary.Execute Command    date -d '1 hour' "+%Y%m%d:%H%M"
    [Return]    ${CurrentDateAndTime+1hour}

CurrentDateAndTimeNow
    ${CurrentDateAndTimeNow}    SSHLibrary.Execute Command    date +"%Y%m%d:%H%M%S"
    [Return]    ${CurrentDateAndTimeNow}

GetExpireDateFromJson
    [Arguments]    ${Jsondata}
    [Documentation]    ${Jsondata} ข้อมูลที่มาจาก DB
    ...
    ...    ค่าที่ได้จาก return
    ...    ${JsondataexpireDate} ==> 20230425:143300 | ${JsondataexpireDateTime} ==> 20230425:1433
    ${Jsondata}    BuiltIn.Convert To String    ${Jsondata}
    ${JsondataexpireDate}    Get Regexp Matches    ${Jsondata}    expireDate....(...............)    1
    ${JsondataexpireDate}    Replace String Using Regexp    ${JsondataexpireDate}[0]    ([|]|')    ${EMPTY}
    ${JsondataexpireDateTime}    Get Substring    ${JsondataexpireDate}    \    13
    [Return]    ${JsondataexpireDate}    ${JsondataexpireDateTime}

CurrentDateAndTime+1hour-1min
    ${CurrentDateAndTime+1hour-1min}    SSHLibrary.Execute Command    date -d '1 hour -1 min' "+%Y%m%d:%H%M"
    [Return]    ${CurrentDateAndTime+1hour-1min}

CheckResultAndDelectDataByMsisdn
    [Arguments]    ${DBName}    ${CollectionName}    ${msisdn}
    IF    "${msisdn}" == ""
    BuiltIn.Log Many    ${msisdn}
    ELSE
    DeleteDataFromID    ${DBName}    ${CollectionName}    ${msisdn}
    END

CheckResultAndInsertDataByMsisdn
    [Arguments]    ${DBName}    ${CollectionName}    ${JsonInsert}    ${msisdn}
    IF    "${msisdn}" == ""
    InsertDataFromJson    ${DBName}    ${CollectionName}    ${JsonInsert}
    ELSE
    BuiltIn.Log Many    ${msisdn}
    END

UpdateHeaderJson
    [Arguments]    ${PathHeader}    ${FileName}    ${orgService}    ${session}    ${transaction}
    BuiltIn.Log    ${PathHeader}
    ${file}    JSONLibrary.Load json from file    ${PathHeader}\\${FileName}
    ${json}    JSONLibrary.update value to json    ${file}    $..orgService    ${orgService}
    ${json}    JSONLibrary.update value to json    ${file}    $..session    ${session}
    ${json}    JSONLibrary.update value to json    ${file}    $..transaction    ${transaction}
    JSONLibrary.Dump JSON to file    ${PathHeader}\\${FileName}    ${json}
    BuiltIn.Log    ${json}
    [Return]    ${json}

UpdateHeaderDataProduce
    [Arguments]    ${jsonProduce}    ${Header}
    ${jsonProduce}    BuiltIn.Set Variable    ${jsonProduce}
    Comment    ${jsonProduce}    Split String    ${jsonProduce}    :{
    Comment    BuiltIn.Log Many    ${jsonProduce}
    Comment    ${jsonProduce}    BuiltIn.Set Variable    ${jsonProduce[3]}
    Comment    ${jsonProduce}    Remove String    ${jsonProduce}    }
    Comment    BuiltIn.Log Many    ${jsonProduce}
    Comment    ${jsonProduce}    BuiltIn.Set Variable    {${jsonProduce}}
    BuiltIn.Log Many    ${jsonProduce}
    ${Header}    BuiltIn.Set Variable    ${Header}
    ${Header}    Convert JSON To String    ${Header}
    ${json_str}=    Convert JSON To String    ${jsonProduce}
    BuiltIn.Log Many    ${jsonProduce}
    ${Value1}    Replace String    ${Header}    }}    },"body":${jsonProduce}}    count=1
    BuiltIn.Log Many    ${Value1}
    ${jsonProduceHeader}    BuiltIn.Set Variable    ${Value1}
    BuiltIn.Log Many    ${jsonProduce}
    [Return]    ${jsonProduceHeader}

ChangeSchema
    [Arguments]    ${header}    ${body}    ${session}    ${transaction}
    ${header_produce_json}    JSONLibrary.Convert String To Json    {${header},${body}}
    ${header}    JSONLibrary.Update Value To Json    ${header_produce_json}    $..session    ${session}
    ${header}    JSONLibrary.Update Value To Json    ${header}    $..transaction    ${transaction}
    ${sorted}    Get Dictionary Items    ${header}
    ${new_schema}    JSONLibrary.Convert Json To String    ${sorted}
    ${new_schema}    String.Replace String    ${new_schema}    ${SPACE}    ${EMPTY}
    Log    ${new_schema}
    [Return]    ${new_schema}

VerifyStat
    [Arguments]    ${Command_Name}    ${pathLog}
    ${filename}    SSHLibrary.Execute Command    find ${pathLog}/stat/ -type f -mmin -5 -prune | grep ${Command_Name} |cut -d '/' -f8
    log    ${filename}
    ${result}    SSHLibrary.Execute Command    less ${pathLog}/stat/${filename}
    Log    ${result}
    [Return]    ${result}

VerifyStatByCommand
    [Arguments]    ${Number_TestCase}    ${DOS_Stat}    ${ServiceNameAPP}    ${Status}
    [Documentation]    Format : VerifyStatByCommand | \ ${Number_TestCase} |${DOS_Stat} | ${ServiceNameAPP} | ${Status}
    ...
    ...    *Example :*
    ...    VerifyStatByCommand | TST_Fx_1_1_001 | nsb-network-status-problem | service-network-status-problem-may | Success
    ...
    ...    --------------------------------------------------------------------------------------------
    ...
    ...    ${DOS_Stat} : เอามาจาก Config ค่าของ stat.dos
    ...
    ...    ${ServiceNameAPP} : ชื่อ App ที่ใช้เทส
    ...
    ...    *********************************************************
    ...
    ...    ${Status} : Status ของเคสนั้น สามารถใส่ได้ตามรายละเอียดด้านล่าง
    ...    F2 : Success หรือ Error หรือ Success_DB40400 หรือ Error_Missing_Invalid
    ...    F3 : Success หรือ ERROR หรือ ERROR_NOTFOUND_DB หรือ ERROR_MISSING_INVALID
    ...    F4 : Success หรือ Error_DB40400 หรือ Error_Consume \ หรือ Error_Null
    ...    F5 : Success หรือ Error
    ...    F11 : Success หรือ Error หรือ Success_DB40400 หรือ Error_DB40400
    ...    F12 : Success หรือ Error
    ...    F13 : Success หรือ ERROR_CONSUME หรือ ERROR_DB40400 หรือ ERROR_DB20000
    #เช็ค path ปัจจุบัน
    ${pwd}    SSHLibrary.Execute Command    pwd
    log    ${pwd}
    #Find : F/Number_Testcase
    ${F}    Split String    ${Number_TestCase}    _
    Comment    ${F}    Fetch From Right    ${F}[1]    _
    ${F}    Set Variable    ${F}[1]
    Log    ${F}
    ${result}    SSHLibrary.Execute Command    less /LOCAL-NAS/livingnetwork/nsb/log_mfaf/TestResult/${F}/${Number_TestCase}/${Number_TestCase}.stat
    Log    ${result}
    ${DomainService}    Set Variable    ${DefineListDOS['${DOS_Stat}']}
    Log    ${DomainService}
    ${Status}    String.Convert To Upper Case    ${Status}
    IF    "${DomainService}"=="SetCountMode"
    Stat.StatSetCountMode    ${result}    ${DOS_Stat}    ${ServiceNameAPP}    ${Status}
    ELSE IF    "${DomainService}"=="CheckAgreeTC"
    Stat.StatCheckAgreeTC    ${result}    ${DOS_Stat}    ${ServiceNameAPP}    ${Status}
    ELSE IF    "${DomainService}"=="NetworkStatus"
    Stat.StatNetworkStatus    ${result}    ${DOS_Stat}    ${ServiceNameAPP}    ${Status}
    ELSE IF    "${DomainService}"=="NetworkStatusProblem"
    Stat.StatNetworkStatusProblem    ${result}    ${DOS_Stat}    ${ServiceNameAPP}    ${Status}
    ELSE IF    "${DomainService}"=="SetAgreeTC"
    Stat.StatSetAgreeTC    ${result}    ${DOS_Stat}    ${ServiceNameAPP}    ${Status}
    ELSE IF    "${DomainService}"=="CheckProfile"
    Stat.StatCheckProfile    ${result}    ${DOS_Stat}    ${ServiceNameAPP}    ${Status}
    ELSE IF    "${DomainService}"=="SetRating"
    Stat.StatSetRating    ${result}    ${DOS_Stat}    ${ServiceNameAPP}    ${Status}
    END

VerifyLogDetail
    [Arguments]    ${DataProduce}    ${ComponentName}    ${ResultCode}    ${F}    ${Number_TestCase}    ${Expectconsume}    ${ExpectDBrequestUpdate}    ${ExpectDBResponseRead}    ${ExpectProduce}    ${NameResAC}    ${ResultCodeReadDB}
    ${Log}    SSHLibrary.Execute Command    less /LOCAL-NAS/livingnetwork/nsb/log_mfaf/TestResult/${F}/${Number_TestCase}/${Number_TestCase}.log
    ${AC}    SSHLibrary.Execute Command    less /home/serveradm/http_mockup/configs/response/${NameResAC}/${Number_TestCase}.json
    Log    ${Log}
    ${dataproduce}    BuiltIn.Set Variable    ${DataProduce}
    ${ResultCodereq}    BuiltIn.Set Variable    ${ResultCode}
    ${ResultCodeDB}    BuiltIn.Set Variable    ${ResultCodeReadDB}
    ${ComponentNamereq}    BuiltIn.Set Variable    ${ComponentName}
    BuiltIn.Log    ${dataproduce}
    ${dataproducejs}    JSONLibrary.Convert String To Json    ${dataproduce}
    ${dataproduceMsisdn}    JSONLibrary.Get Value From Json    ${dataproducejs}    $..msisdn
    ${dataproduceBroker}    JSONLibrary.Get Value From Json    ${dataproducejs}    $..broker
    ${dataproduceChannel}    JSONLibrary.Get Value From Json    ${dataproducejs}    $..channel
    ${dataproduceDevice}    JSONLibrary.Get Value From Json    ${dataproducejs}    $..device
    ${dataproduceDevice}    Convert To String    ${dataproduceDevice}
    ${dataproduceDevice}    Replace String    ${dataproduceDevice}    \'    \"
    ${dataproduceDevice}    Remove String    ${dataproduceDevice}    "    ${EMPTY}
    ${dataproduceDevice}    Remove String    ${dataproduceDevice}    [    ${EMPTY}
    ${dataproduceDevice}    Remove String    ${dataproduceDevice}    ]    ${EMPTY}
    ${dataproduceDevice}    Replace String    ${dataproduceDevice}    ,    ,
    ${dataproduceDevice}    Remove String    ${dataproduceDevice}    ${SPACE}
    ${dataproduceSessionId}    JSONLibrary.Get Value From Json    ${dataproducejs}    $..session
    ${dataproduceTransactionId}    JSONLibrary.Get Value From Json    ${dataproducejs}    $..transaction
    ${dataproduceUseCase}    JSONLibrary.Get Value From Json    ${dataproducejs}    $..useCase
    ${dataproduceUseCaseStep}    JSONLibrary.Get Value From Json    ${dataproducejs}    $..useCaseStep
    Comment    ${dataproduceUser}    JSONLibrary.Get Value From Json    ${dataproducejs}    $..user
    BuiltIn.Log    ${dataproduceMsisdn}
    ${JsonLog}    BuiltIn.Set Variable    [${Log}]
    ${dataremove1}    String.Remove String    ${JsonLog}    ${SPACE}
    BuiltIn.Log    ${dataremove1}
    ${dataremove3}    String.Remove String    ${dataremove1}    \\
    BuiltIn.Log    ${dataremove3}
    ${dataremove4}    String.Remove String    ${dataremove3}    \\
    BuiltIn.Log    ${dataremove4}
    ${dataremove2}    String.Remove String    ${dataremove4}    \n
    BuiltIn.Log    ${dataremove2}
    ${dataremove2}    String.Remove String    ${dataremove2}    rn
    BuiltIn.Log    ${dataremove2}
    ${dataremove2}    String.Remove String    ${dataremove2}    ${SPACE}
    ${dataremove}    String.Replace String    ${dataremove2}    }{    },{    count=-1
    BuiltIn.Log    ${dataremove}
    ${dataresult}    String.Replace String    ${dataremove}    },]    }]
    ${dataresult}    String.Replace String    ${dataresult}    "{    {
    ${dataresult}    String.Replace String    ${dataresult}    }"    }
    ${dataresult}    String.Replace String    ${dataresult}    {null}    null
    ${dataresult}    String.Replace String    ${dataresult}    {{"msisdn":"${dataproduceMsisdn[0]}"}}}    {"msisdn":"${dataproduceMsisdn[0]}"}}
    BuiltIn.Log    ${dataresult}
    ${dataresult}    JSONLibrary.Convert String To Json    ${dataresult}
    ${ListlogResult}    JSONLibrary.Get Value From Json    ${dataresult}    $..appName
    ${LengthOfItem}    Get Length    ${ListlogResult}
    ${Action}    JSONLibrary.Get Value From Json    ${dataresult}    $..action
    ${Broker}    JSONLibrary.Get Value From Json    ${dataresult}    $..broker
    ${Channel}    JSONLibrary.Get Value From Json    ${dataresult}    $..channel
    ${Device}    JSONLibrary.Get Value From Json    ${dataresult}    $..device
    BuiltIn.Log    ${Device}
    ${SessionId}    JSONLibrary.Get Value From Json    ${dataresult}    $..sessionId
    ${TransactionId}    JSONLibrary.Get Value From Json    ${dataresult}    $..transactionId
    ${UseCase}    JSONLibrary.Get Value From Json    ${dataresult}    $..useCase
    ${UseCaseStep}    JSONLibrary.Get Value From Json    ${dataresult}    $..useCaseStep
    ${Message}    JSONLibrary.Get Value From Json    ${dataresult}    $..message
    ${RecordType}    JSONLibrary.Get Value From Json    ${dataresult}    $..recordType
    ${SubAction}    JSONLibrary.Get Value From Json    ${dataresult}    $..subAction
    ${ResultCode}    JSONLibrary.Get Value From Json    ${dataresult}    $..resultCode
    ${ComponentName}    JSONLibrary.Get Value From Json    ${dataresult}    $..componentName
    ${AppResultCode}    JSONLibrary.Get Value From Json    ${dataresult}    $..appResultCode
    ${CountResultcode}    Get Length    ${ResultCode}
    ${Count}    BuiltIn.Set Variable    0
    FOR    ${Index}    IN RANGE    ${LengthOfItem}
        IF    ${Index} != ${LengthOfItem}-1
            IF    "${Action[${Index}]}" == "[CONSUMING]"
                BuiltIn.Log    "CONSUMING"
                ${Msisdn}    JSONLibrary.Get Value From Json    ${dataresult}    $..message.msisdn
                BuiltIn.Should Be Equal    "${Broker[${Index}]}"    "${dataproduceBroker[0]}"
                BuiltIn.Should Be Equal    "${Channel[${Index}]}"    "${dataproduceChannel[0]}"
                BuiltIn.Should Be Equal    "${Device[${Index}]}"    "${dataproduceDevice}"
                BuiltIn.Should Be Equal    "${SessionId[${Index}]}"    "${dataproduceSessionId[0]}"
                BuiltIn.Should Be Equal    "${TransactionId[${Index}]}"    "${dataproduceTransactionId[0]}"
                BuiltIn.Should Be Equal    "${UseCase[${Index}]}"    "${dataproduceUseCase[0]}"
                BuiltIn.Should Be Equal    "${UseCaseStep[${Index}]}"    "${dataproduceUseCaseStep[0]}"
                BuiltIn.Should Be Equal    "${Msisdn[${Index}]}"    "${dataproduceMsisdn[0]}"
                BuiltIn.Should Be Equal    "${RecordType[${Index}]}"    "detail"
                BuiltIn.Log    "CONSUMING Success"
            END
            IF    "${Action[${Index}]}" == "[HTTP_REQUEST]"
                BuiltIn.Log    "HTTP_REQUEST"
                ${Msisdn}    JSONLibrary.Get Value From Json    ${dataresult}    $..message.msisdn
                BuiltIn.Should Be Equal    "${Broker[${Index}]}"    "${dataproduceBroker[0]}"
                BuiltIn.Should Be Equal    "${Channel[${Index}]}"    "${dataproduceChannel[0]}"
                BuiltIn.Should Be Equal    "${Device[${Index}]}"    "${dataproduceDevice}"
                BuiltIn.Should Be Equal    "${SessionId[${Index}]}"    "${dataproduceSessionId[0]}"
                BuiltIn.Should Be Equal    "${TransactionId[${Index}]}"    "${dataproduceTransactionId[0]}"
                BuiltIn.Should Be Equal    "${UseCase[${Index}]}"    "${dataproduceUseCase[0]}"
                BuiltIn.Should Be Equal    "${UseCaseStep[${Index}]}"    "${dataproduceUseCaseStep[0]}"
                BuiltIn.Should Be Equal    "${Msisdn[0]}"    "${dataproduceMsisdn[0]}"
                BuiltIn.Should Be Equal    "${RecordType[${Index}]}"    "detail"
                BuiltIn.Should Be Equal    "${SubAction[${Index}]}"    "POST:package"
                Comment    BuiltIn.Should Be Equal    ${ResultCode[${Count}]}    ${ResultCodereq}
                ${Count} =    Evaluate    ${Count} + 1
                BuiltIn.Log    "HTTP_REQUEST Success"
            END
            IF    "${Action[${Index}]}" == "[HTTP_RESPONSE]"
                BuiltIn.Log    "HTTP_RESPONSE"
                ${Msisdn}    JSONLibrary.Get Value From Json    ${dataresult}    $..message.msisdn
                BuiltIn.Should Be Equal    "${Broker[${Index}]}"    "${dataproduceBroker[0]}"
                BuiltIn.Should Be Equal    "${Channel[${Index}]}"    "${dataproduceChannel[0]}"
                BuiltIn.Should Be Equal    "${Device[${Index}]}"    "${dataproduceDevice}"
                BuiltIn.Should Be Equal    "${SessionId[${Index}]}"    "${dataproduceSessionId[0]}"
                BuiltIn.Should Be Equal    "${TransactionId[${Index}]}"    "${dataproduceTransactionId[0]}"
                BuiltIn.Should Be Equal    "${UseCase[${Index}]}"    "${dataproduceUseCase[0]}"
                BuiltIn.Should Be Equal    "${UseCaseStep[${Index}]}"    "${dataproduceUseCaseStep[0]}"
                BuiltIn.Should Be Equal    "${Msisdn[0]}"    "${dataproduceMsisdn[0]}"
                BuiltIn.Should Be Equal    "${RecordType[${Index}]}"    "detail"
                BuiltIn.Log    ${AC}
                BuiltIn.Log    "HTTP_RESPONSE Success"
            END
            IF    "${Action[${Index}]}" == "[DB_REQUEST]"
                BuiltIn.Log    "DB_REQUEST"
                ${Msisdn}    JSONLibrary.Get Value From Json    ${dataresult}    $..message.msisdn
                BuiltIn.Should Be Equal    "${Broker[${Index}]}"    "${dataproduceBroker[0]}"
                BuiltIn.Should Be Equal    "${Channel[${Index}]}"    "${dataproduceChannel[0]}"
                BuiltIn.Should Be Equal    "${Device[${Index}]}"    "${dataproduceDevice}"
                BuiltIn.Should Be Equal    "${SessionId[${Index}]}"    "${dataproduceSessionId[0]}"
                BuiltIn.Should Be Equal    "${TransactionId[${Index}]}"    "${dataproduceTransactionId[0]}"
                BuiltIn.Should Be Equal    "${UseCase[${Index}]}"    "${dataproduceUseCase[0]}"
                BuiltIn.Should Be Equal    "${UseCaseStep[${Index}]}"    "${dataproduceUseCaseStep[0]}"
                BuiltIn.Should Be Equal    "${RecordType[${Index}]}"    "detail"
                IF    "${SubAction[${Index}]}" == "READ"
                    BuiltIn.Log    "DB_REQUEST[READ]"
                    BuiltIn.Should Be Equal    "${Msisdn[0]}"    "${dataproduceMsisdn[0]}"
                    BuiltIn.Should Be Equal    "${ResultCode[${Index}]}"    "${ResultCodeDB}"
                    ${Count} =    Evaluate    ${Count} + 1
                    BuiltIn.Log    "DB_REQUEST[READ] Success"
                END
                IF    "${SubAction[${Index}]}" == "UPDATE"
                    BuiltIn.Log    "DB_REQUEST[UPDATE]"
                    ${Document}    JSONLibrary.Get Value From Json    ${dataresult}    $..message.document
                    BuiltIn.Should Be Equal    "${Msisdn[0]}"    "${dataproduceMsisdn[0]}"
                    Log    ${Document}
                    IF    "${ComponentNamereq}" == "nsb-set-count-mode"
                        ${ExpectDBrequestUpdate}    JsonUpdatedateCountChangeModeCommon    ${ExpectDBrequestUpdate}
                        Log    "${ExpectDBrequestUpdate}"
                        ${ExpectDBrequestUpdate}    UpdateJsonExpect    ${ExpectDBrequestUpdate}
                        ${Document}    Convert To String    ${Document[0]}
                        ${Document}    Remove String    ${Document}    ${SPACE}
                        ${Document}    Replace String    ${Document}    \'    \"
                        ${Document}    Replace String    ${Document}    False    false
                        ${Document}    Replace String    ${Document}    True    true
                        BuiltIn.Should Be Equal    ${Document}    ${ExpectDBrequestUpdate}
                    ELSE
                        ${ExpectDBrequestUpdate}    JsonUpdatedateCountChangeModeCommon    ${ExpectDBrequestUpdate}
                        Log    "${ExpectDBrequestUpdate}"
                        ${ExpectDBrequestUpdate}    UpdateJsonExpect    ${ExpectDBrequestUpdate}
                        ${Document}    Convert To String    ${Document[0]}
                        ${Document}    Remove String    ${Document}    ${SPACE}
                        ${Document}    Replace String    ${Document}    \'    \"
                        ${Document}    Replace String    ${Document}    False    false
                        ${Document}    Replace String    ${Document}    True    true
                        BuiltIn.Should Be Equal    ${Document}    ${ExpectDBrequestUpdate}
                    END
                    BuiltIn.Log    "DB_REQUEST[UPDATE] Success"
                END
            END
            IF    "${Action[${Index}]}" == "[DB_RESPONSE]"
                BuiltIn.Log    "DB_RESPONSE"
                ${Msisdn}    JSONLibrary.Get Value From Json    ${dataresult}    $..message.msisdn
                BuiltIn.Should Be Equal    "${Broker[${Index}]}"    "${dataproduceBroker[0]}"
                BuiltIn.Should Be Equal    "${Channel[${Index}]}"    "${dataproduceChannel[0]}"
                BuiltIn.Should Be Equal    "${Device[${Index}]}"    "${dataproduceDevice}"
                BuiltIn.Should Be Equal    "${SessionId[${Index}]}"    "${dataproduceSessionId[0]}"
                BuiltIn.Should Be Equal    "${TransactionId[${Index}]}"    "${dataproduceTransactionId[0]}"
                BuiltIn.Should Be Equal    "${UseCase[${Index}]}"    "${dataproduceUseCase[0]}"
                BuiltIn.Should Be Equal    "${UseCaseStep[${Index}]}"    "${dataproduceUseCaseStep[0]}"
                BuiltIn.Should Be Equal    "${RecordType[${Index}]}"    "detail"
                Comment    BuiltIn.Should Be Equal    ${ResultCode[${Count}]}    ${ResultCodereq}
                ${Count} =    Evaluate    ${Count} + 1
                IF    "${SubAction[${Index}]}" == "READ"
                    BuiltIn.Log    "DB_RESPONSE[READ]"
                    Log    ${Message[${Index}]}
                    BuiltIn.Log    "DB_RESPONSE[READ] Success"
                END
                IF    "${SubAction[${Index}]}" == "UPDATE"
                    BuiltIn.Log    "DB_RESPONSE[UPDATE]"
                    Log    ${Message[${Index}]}
                    BuiltIn.Log    "DB_RESPONSE[UPDATE] Success"
                END
            END
            IF    "${Action[${Index}]}" == "[PRODUCING]"
                BuiltIn.Log    "PRODUCING"
                ${Msisdn}    JSONLibrary.Get Value From Json    ${dataresult}    $..message.msisdn
                BuiltIn.Should Be Equal    "${Broker[${Index}]}"    "${dataproduceBroker[0]}"
                BuiltIn.Should Be Equal    "${Channel[${Index}]}"    "${dataproduceChannel[0]}"
                BuiltIn.Should Be Equal    "${Device[${Index}]}"    "${dataproduceDevice}"
                BuiltIn.Should Be Equal    "${SessionId[${Index}]}"    "${dataproduceSessionId[0]}"
                BuiltIn.Should Be Equal    "${TransactionId[${Index}]}"    "${dataproduceTransactionId[0]}"
                BuiltIn.Should Be Equal    "${UseCase[${Index}]}"    "${dataproduceUseCase[0]}"
                BuiltIn.Should Be Equal    "${UseCaseStep[${Index}]}"    "${dataproduceUseCaseStep[0]}"
                BuiltIn.Should Be Equal    "${RecordType[${Index}]}"    "detail"
                BuiltIn.Should Be Equal    "${SubAction[${Index}]}"    "N/A"
                Comment    BuiltIn.Should Be Equal    ${ResultCode[${Count}]}    ${ResultCodereq}
                ${Count} =    Evaluate    ${Count} + 1
                ${Consume}    Convert Json To String    ${Message[${Index}]}
                ${Consume}    Remove String    ${Consume}    ${SPACE}
                ${Expectconsume}    Remove String    ${Expectconsume}    ${SPACE}
                BuiltIn.Should Be Equal    ${Consume}    ${Expectconsume}
                BuiltIn.Log    "PRODUCING Success"
            END
            IF    "${Action[${Index}]}" == "[EXCEPTION]-Success"
                BuiltIn.Log    "[EXCEPTION]-Success"
                ${Msisdn}    JSONLibrary.Get Value From Json    ${dataresult}    $..message.msisdn
                BuiltIn.Should Be Equal    "${Broker[${Index}]}"    "${dataproduceBroker[0]}"
                BuiltIn.Should Be Equal    "${Channel[${Index}]}"    "${dataproduceChannel[0]}"
                BuiltIn.Should Be Equal    "${Device[${Index}]}"    "${dataproduceDevice}"
                BuiltIn.Should Be Equal    "${SessionId[${Index}]}"    "${dataproduceSessionId[0]}"
                BuiltIn.Should Be Equal    "${TransactionId[${Index}]}"    "${dataproduceTransactionId[0]}"
                BuiltIn.Should Be Equal    "${UseCase[${Index}]}"    "${dataproduceUseCase[0]}"
                BuiltIn.Should Be Equal    "${UseCaseStep[${Index}]}"    "${dataproduceUseCaseStep[0]}"
                BuiltIn.Should Be Equal    "${RecordType[${Index}]}"    "detail"
                BuiltIn.Should Be Equal    "${SubAction[${Index}]}"    "N/A"
                Comment    BuiltIn.Should Be Equal    ${ResultCode[${Count}]}    ${ResultCodereq}
                ${Count} =    Evaluate    ${Count} + 1
            END
        ELSE
            BuiltIn.Log    "summary"
            BuiltIn.Should Be Equal    "${Broker[${Index}]}"    "${dataproduceBroker[0]}"
            BuiltIn.Should Be Equal    "${Channel[${Index}]}"    "${dataproduceChannel[0]}"
            BuiltIn.Should Be Equal    "${Device[${Index}+1]}"    "${dataproduceDevice}"
            BuiltIn.Should Be Equal    "${SessionId[${Index}]}"    "${dataproduceSessionId[0]}"
            BuiltIn.Should Be Equal    "${TransactionId[${Index}]}"    "${dataproduceTransactionId[0]}"
            BuiltIn.Should Be Equal    "${UseCase[${Index}]}"    "${dataproduceUseCase[0]}"
            BuiltIn.Should Be Equal    "${UseCaseStep[${Index}]}"    "${dataproduceUseCaseStep[0]}"
            BuiltIn.Should Be Equal    "${RecordType[${Index}]}"    "summary"
            BuiltIn.Should Be Equal    ${AppResultCode[0]}    ${ResultCodereq}
        END
    END

JsonUpdatedateCountChangeModeCommon
    [Arguments]    ${JsonDatadateCountChangeMode}
    #GetCurrentDate
    ${CurrentDate}    Get Current Date
    ${CurrentDate}    Split String    ${CurrentDate}    ${SPACE}
    ${CurrentDate}    Remove String    ${CurrentDate}[0]    -
    Log    ${CurrentDate}
    #Update Value
    ${JsonDatadateCountChangeMode}    Replace String    ${JsonDatadateCountChangeMode}    {{nowdate}}    ${CurrentDate}
    Log    ${JsonDatadateCountChangeMode}
    [Return]    ${JsonDatadateCountChangeMode}

UpdateJsonExpect
    [Arguments]    ${Json}
    ${Json}    BuiltIn.Set Variable    ${Json}
    ${Json}    JSONLibrary.Convert String To Json    ${Json}
    log    ${Json}
    ${Msisdn}    JSONLibrary.Get Value From Json    ${Json}    $..msisdn
    ${isUsingFupPackage}    JSONLibrary.Get Value From Json    ${Json}    $..isUsingFupPackage
    ${networkType}    JSONLibrary.Get Value From Json    ${Json}    $..networkType
    ${currentMode}    JSONLibrary.Get Value From Json    ${Json}    $..currentMode
    ${packageName}    JSONLibrary.Get Value From Json    ${Json}    $..packageName
    ${packageExpireTime}    JSONLibrary.Get Value From Json    ${Json}    $..packageExpireTime
    ${productSequenceId}    JSONLibrary.Get Value From Json    ${Json}    $..productSequenceId
    ${initialAmount}    JSONLibrary.Get Value From Json    ${Json}    $..initialAmount
    ${remainingAmount}    JSONLibrary.Get Value From Json    ${Json}    $..remainingAmount
    ${countChangeMode}    JSONLibrary.Get Value From Json    ${Json}    $..countChangeMode
    ${dateCountChangeMode}    JSONLibrary.Get Value From Json    ${Json}    $..dateCountChangeMode
    ${JsonFomatExpectDb}    BuiltIn.Set Variable    ${JsonFomatExpectDb}
    ${JsonFomatExpectDb}    JSONLibrary.Convert String To Json    ${JsonFomatExpectDb}
    log    ${JsonFomatExpectDb}
    ${JsonFomatExpectDb}=    JSONLibrary.Update Value To Json    ${JsonFomatExpectDb}    $..msisdn    ${Msisdn[0]}
    ${JsonFomatExpectDb}=    JSONLibrary.Update Value To Json    ${JsonFomatExpectDb}    $..isUsingFupPackage    ${isUsingFupPackage[0]}
    ${JsonFomatExpectDb}=    JSONLibrary.Update Value To Json    ${JsonFomatExpectDb}    $..networkType    ${networkType[0]}
    ${JsonFomatExpectDb}=    JSONLibrary.Update Value To Json    ${JsonFomatExpectDb}    $..currentMode    ${currentMode[0]}
    ${JsonFomatExpectDb}=    JSONLibrary.Update Value To Json    ${JsonFomatExpectDb}    $..packageName    ${packageName[0]}
    ${JsonFomatExpectDb}=    JSONLibrary.Update Value To Json    ${JsonFomatExpectDb}    $..packageExpireTime    ${packageExpireTime[0]}
    ${JsonFomatExpectDb}=    JSONLibrary.Update Value To Json    ${JsonFomatExpectDb}    $..productSequenceId    ${productSequenceId[0]}
    ${JsonFomatExpectDb}=    JSONLibrary.Update Value To Json    ${JsonFomatExpectDb}    $..initialAmount    ${initialAmount[0]}
    ${JsonFomatExpectDb}=    JSONLibrary.Update Value To Json    ${JsonFomatExpectDb}    $..remainingAmount    ${remainingAmount[0]}
    ${JsonFomatExpectDb}=    JSONLibrary.Update Value To Json    ${JsonFomatExpectDb}    $..countChangeMode    ${countChangeMode[0]}
    ${JsonFomatExpectDb}=    JSONLibrary.Update Value To Json    ${JsonFomatExpectDb}    $..dateCountChangeMode    ${dateCountChangeMode[0]}
    ${JsonFomatExpectDb}    Convert Json To String    ${JsonFomatExpectDb}
    ${JsonFomatExpectDb}    Remove String    ${JsonFomatExpectDb}    ${SPACE}
    log    ${JsonFomatExpectDb}





    [Return]    ${JsonFomatExpectDb}
