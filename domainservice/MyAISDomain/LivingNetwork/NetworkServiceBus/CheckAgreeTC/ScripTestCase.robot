*** Settings ***
Resource          Valiable.robot
Resource          ../../Keyword/Common.robot
Resource          ../../Keyword/MongoDB.robot
Resource          ../../Keyword/SecureCRT.robot
Resource          ../../Valiables/CommonValiable/CommonValiable.robot
Resource          ../../Valiables/CommonValiable/CommonValiable.robot
Resource          ../../Keyword/Stat.robot
*** Test Cases ***
# Delete
#     ${msisdn}    QueryDataReturnMsisdn    ${DataBaseNameNSB}    ${CollactionNamePrivacyProfile}    @{msisdn_TST_F23_0_1_017}
#     DelectDataFromMsisdn    ${DataBaseNameNSB}    ${CollactionNamePrivacyProfile}    ${msisdn}

# Insert
#     ${msisdn}    QueryDataReturnMsisdn    ${DataBaseNameNEB}    ${CollactionNameCellUserLocation}    @{msisdn_test}
#     InsertDataFromJson    ${DataBaseNameNEB}    ${CollactionNameCellUserLocation}    ${JsonInsert_test}

Fang
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    Log    ${NameCmdFileLog_CheckAgreeTC}
    Log    ${PathLogCheckAgreeTC}
    SetLogNull    ${NameCmdFileLog_CheckAgreeTC}    ${PathLogCheckAgreeTC}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDeleteMassage_qa.checkAgreeTCRequested}    ${CmdProduce_qa.requestCheckAgreeTC}    ${DataProduce_TST_F4_1_1_000}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Consume Kafka    ${Consume_qa.checkAgreeTCRequested}    fang
    log    ${ConsumeResult}
    #check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_qa.checkAgreeTCRequested2_TST_F4_1_1_000}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCmdFileLog_CheckAgreeTC}    fang    ${PathLogCheckAgreeTC}

TST_F4_1_1_000
    ${testCaseName}    Set Variable    TST_F4_1_1_000
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCmdFileLog_CheckAgreeTC}    ${PathLogCheckAgreeTC}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDeleteMassage_qa.checkAgreeTCRequested}    ${CmdProduce_qa.requestCheckAgreeTC}    ${DataProduce_TST_F4_1_1_000}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Consume Kafka    ${Consume_qa.checkAgreeTCRequested}    ${testCaseName}
    log    ${ConsumeResult}
    #check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_qa.checkAgreeTCRequested2_TST_F4_1_1_000}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    Sleep    25s
    FlushLogAndStatbyCommandName    ${NameCmdFileLog_CheckAgreeTC}    ${testCaseName}    ${PathLogCheckAgreeTC}
    ${result}    Common.VerifyStat    ${NameCmdFileLStat_CheckAgreeTC}    ${PathLogCheckAgreeTC}
    SuccessCheckAgreeTC20000    ${result}    

TST_F4_1_1_001
    ${testCaseName}    Set Variable    TST_F4_1_1_001
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCmdFileLog_CheckAgreeTC}    ${PathLogCheckAgreeTC}
    #หาใน mongo.PrivacyProfile หา msisdn
    ${publicId}    QueryDataReturnMsisdn    ${DataBaseNameNSB}    ${CollactionNamePrivacyProfile}    {"publicId" : "66123456000"}
    #prepare msisdn
    CheckResultAndInsertDataByMsisdn    ${DataBaseNameNSB}    ${CollactionNamePrivacyProfile}    ${JsonInsert_TST_F4_1_1_001}    ${publicId}
    Sleep    5
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDeleteMassage_qa.checkAgreeTCRequested}    ${CmdProduce_qa.requestCheckAgreeTC}    ${DataProduce_TST_F4_1_1_001}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Consume Kafka    ${Consume_qa.checkAgreeTCRequested}    ${testCaseName}
    log    ${ConsumeResult}
    #check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_qa.checkAgreeTCRequested2_TST_F4_1_1_001}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    Sleep    25s
    FlushLogAndStatbyCommandName    ${NameCmdFileLog_CheckAgreeTC}    ${testCaseName}    ${PathLogCheckAgreeTC}
    ${result}    Common.VerifyStat    ${NameCmdFileLStat_CheckAgreeTC}    ${PathLogCheckAgreeTC}
    SuccessCheckAgreeTC20000    ${result}

TST_F4_1_1_002
    ${testCaseName}    Set Variable    TST_F4_1_1_002
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCmdFileLog_CheckAgreeTC}    ${PathLogCheckAgreeTC}
    #หาใน mongo.PrivacyProfile หา msisdn
    ${msisdn}    QueryDataReturnMsisdn    ${DataBaseNameNSB}    ${CollactionNamePrivacyProfile}    {"publicId" : "66123456001"}
    #prepare msisdn
    CheckResultAndInsertDataByMsisdn    ${DataBaseNameNSB}    ${CollactionNamePrivacyProfile}    ${JsonInsert_TST_F4_1_1_002}    ${msisdn}
    Sleep    5
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDeleteMassage_qa.checkAgreeTCRequested}    ${CmdProduce_qa.requestCheckAgreeTC}    ${DataProduce_TST_F4_1_1_002}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Consume Kafka    ${Consume_qa.checkAgreeTCRequested}    ${testCaseName}
    log    ${ConsumeResult}
    #check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_qa.checkAgreeTCRequested2_TST_F4_1_1_002}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    Sleep    25s
    FlushLogAndStatbyCommandName    ${NameCmdFileLog_CheckAgreeTC}    ${testCaseName}    ${PathLogCheckAgreeTC}
    ${result}    Common.VerifyStat    ${NameCmdFileLStat_CheckAgreeTC}    ${PathLogCheckAgreeTC}
    SuccessCheckAgreeTC20000    ${result}

TST_F4_1_1_003
    ${testCaseName}    Set Variable    TST_F4_1_1_003
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCmdFileLog_CheckAgreeTC}    ${PathLogCheckAgreeTC}
    #หาใน mongo.PrivacyProfile หา msisdn
    ${msisdn}    QueryDataReturnMsisdn    ${DataBaseNameNSB}    ${CollactionNamePrivacyProfile}    {"publicId" : "66123456002"}
    #prepare msisdn
    CheckResultAndInsertDataByMsisdn    ${DataBaseNameNSB}    ${CollactionNamePrivacyProfile}    ${JsonInsert_TST_F4_1_1_003}    ${msisdn}
    Sleep    5
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDeleteMassage_qa.checkAgreeTCRequested}    ${CmdProduce_qa.requestCheckAgreeTC}    ${DataProduce_TST_F4_1_1_003}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Consume Kafka    ${Consume_qa.checkAgreeTCRequested}    ${testCaseName}
    log    ${ConsumeResult}
    #check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_qa.checkAgreeTCRequested2_TST_F4_1_1_003}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    Sleep    25s
    FlushLogAndStatbyCommandName    ${NameCmdFileLog_CheckAgreeTC}    ${testCaseName}    ${PathLogCheckAgreeTC}
    ${result}    Common.VerifyStat    ${NameCmdFileLStat_CheckAgreeTC}    ${PathLogCheckAgreeTC}
    SuccessCheckAgreeTC20000    ${result}

TST_F4_1_1_004
    ${testCaseName}    Set Variable    TST_F4_1_1_003
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCmdFileLog_CheckAgreeTC}    ${PathLogCheckAgreeTC}
    #หาใน mongo.PrivacyProfile หา msisdn
    ${msisdn}    QueryDataReturnMsisdn    ${DataBaseNameNSB}    ${CollactionNamePrivacyProfile}    {"publicId" : "66123456003"}
    #prepare msisdn
    CheckResultAndInsertDataByMsisdn    ${DataBaseNameNSB}    ${CollactionNamePrivacyProfile}    ${JsonInsert_TST_F4_1_1_004}    ${msisdn}
    Sleep    5
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDeleteMassage_qa.checkAgreeTCRequested}    ${CmdProduce_qa.requestCheckAgreeTC}    ${DataProduce_TST_F4_1_1_004}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Consume Kafka    ${Consume_qa.checkAgreeTCRequested}    ${testCaseName}
    log    ${ConsumeResult}
    #check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_qa.checkAgreeTCRequested2_TST_F4_1_1_004}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    Sleep    25s
    FlushLogAndStatbyCommandName    ${NameCmdFileLog_CheckAgreeTC}    ${testCaseName}    ${PathLogCheckAgreeTC}
    ${result}    Common.VerifyStat    ${NameCmdFileLStat_CheckAgreeTC}    ${PathLogCheckAgreeTC}
    SuccessCheckAgreeTC20000    ${result}

TST_F4_1_1_005
    ${testCaseName}    Set Variable    TST_F4_1_1_005
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCmdFileLog_CheckAgreeTC}    ${PathLogCheckAgreeTC}
    #หาใน mongo.PrivacyProfile หา msisdn
    ${msisdn}    QueryDataReturnMsisdn    ${DataBaseNameNSB}    ${CollactionNamePrivacyProfile}    {"publicId" : "66123456004"}
    #prepare msisdn
    CheckResultAndInsertDataByMsisdn    ${DataBaseNameNSB}    ${CollactionNamePrivacyProfile}    ${JsonInsert_TST_F4_1_1_005}    ${msisdn}
    Sleep    5
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDeleteMassage_qa.checkAgreeTCRequested}    ${CmdProduce_qa.requestCheckAgreeTC}    ${DataProduce_TST_F4_1_1_005}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Consume Kafka    ${Consume_qa.checkAgreeTCRequested}    ${testCaseName}
    log    ${ConsumeResult}
    #check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_qa.checkAgreeTCRequested2_TST_F4_1_1_005}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    Sleep    25s
    FlushLogAndStatbyCommandName    ${NameCmdFileLog_CheckAgreeTC}    ${testCaseName}    ${PathLogCheckAgreeTC}
    ${result}    Common.VerifyStat    ${NameCmdFileLStat_CheckAgreeTC}    ${PathLogCheckAgreeTC}
    SuccessCheckAgreeTC20000    ${result}

TST_F4_1_1_006
    ${testCaseName}    Set Variable    TST_F4_1_1_006
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCmdFileLog_CheckAgreeTC}    ${PathLogCheckAgreeTC}
    #หาใน mongo.PrivacyProfile หา msisdn
    ${msisdn}    QueryDataReturnMsisdn    ${DataBaseNameNSB}    ${CollactionNamePrivacyProfile}    {"publicId" : "66123456005"}
    #prepare msisdn
    CheckResultAndInsertDataByMsisdn    ${DataBaseNameNSB}    ${CollactionNamePrivacyProfile}    ${JsonInsert_TST_F4_1_1_006}    ${msisdn}
    Sleep    5
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDeleteMassage_qa.checkAgreeTCRequested}    ${CmdProduce_qa.requestCheckAgreeTC}    ${DataProduce_TST_F4_1_1_006}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Consume Kafka    ${Consume_qa.checkAgreeTCRequested}    ${testCaseName}
    log    ${ConsumeResult}
    #check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_qa.checkAgreeTCRequested2_TST_F4_1_1_006}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    Sleep    25s
    FlushLogAndStatbyCommandName    ${NameCmdFileLog_CheckAgreeTC}    ${testCaseName}    ${PathLogCheckAgreeTC}
    ${result}    Common.VerifyStat    ${NameCmdFileLStat_CheckAgreeTC}    ${PathLogCheckAgreeTC}
    SuccessCheckAgreeTC20000    ${result}

TST_F4_1_1_007
    ${testCaseName}    Set Variable    TST_F4_1_1_007
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCmdFileLog_CheckAgreeTC}    ${PathLogCheckAgreeTC}
    #หาใน mongo.PrivacyProfile หา msisdn
    ${msisdn}    QueryDataReturnMsisdn    ${DataBaseNameNSB}    ${CollactionNamePrivacyProfile}    {"publicId" : "66123456006"}
    #prepare msisdn
    CheckResultAndInsertDataByMsisdn    ${DataBaseNameNSB}    ${CollactionNamePrivacyProfile}    ${JsonInsert_TST_F4_1_1_007}    ${msisdn}
    Sleep    5
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDeleteMassage_qa.checkAgreeTCRequested}    ${CmdProduce_qa.requestCheckAgreeTC}    ${DataProduce_TST_F4_1_1_007}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Consume Kafka    ${Consume_qa.checkAgreeTCRequested}    TST_F4_1_1_007
    log    ${ConsumeResult}
    #check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_qa.checkAgreeTCRequested2_TST_F4_1_1_007}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    Sleep    25s
    FlushLogAndStatbyCommandName    ${NameCmdFileLog_CheckAgreeTC}    TST_F4_1_1_007    ${PathLogCheckAgreeTC}
    ${result}    Common.VerifyStat    ${NameCmdFileLStat_CheckAgreeTC}    ${PathLogCheckAgreeTC}
    SuccessCheckAgreeTC20000    ${result}

TST_F4_0_1_008
    ${testCaseName}    Set Variable    TST_F4_1_1_008
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCmdFileLog_CheckAgreeTC}    ${PathLogCheckAgreeTC}
    #หาใน mongo.PrivacyProfile หา msisdn
    ${msisdn}    QueryDataReturnMsisdn    ${DataBaseNameNSB}    ${CollactionNamePrivacyProfile}    {"publicId" : "66123456007"}
    #prepare msisdn
    CheckResultAndInsertDataByMsisdn    ${DataBaseNameNSB}    ${CollactionNamePrivacyProfile}    ${JsonInsert_TST_F4_1_1_008}    ${msisdn}
    Sleep    5
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDeleteMassage_qa.checkAgreeTCRequested}    ${CmdProduce_qa.requestCheckAgreeTC}    ${DataProduce_TST_F4_1_1_008}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Consume Kafka    ${Consume_qa.checkAgreeTCRequested}    ${testCaseName}
    log    ${ConsumeResult}
    #check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_qa.checkAgreeTCRequested2_TST_F4_1_1_008}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    Sleep    25s
    FlushLogAndStatbyCommandName    ${NameCmdFileLog_CheckAgreeTC}    ${testCaseName}    ${PathLogCheckAgreeTC}
    ${result}    Common.VerifyStat    ${NameCmdFileLStat_CheckAgreeTC}    ${PathLogCheckAgreeTC}
    ErrorCheckAgreeTC40401    ${result}

TST_F4_0_1_009
    ${testCaseName}    Set Variable    TST_F4_1_1_009
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCmdFileLog_CheckAgreeTC}    ${PathLogCheckAgreeTC}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDeleteMassage_qa.checkAgreeTCRequested}    ${CmdProduce_qa.requestCheckAgreeTC}    ${DataProduce_TST_F4_0_1_009}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Consume Kafka    ${Consume_qa.checkAgreeTCRequested}    ${testCaseName}
    log    ${ConsumeResult}
    #check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_qa.checkAgreeTCRequested2_TST_F4_0_1_009}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    Sleep    25s
    FlushLogAndStatbyCommandName    ${NameCmdFileLog_CheckAgreeTC}    ${testCaseName}    ${PathLogCheckAgreeTC}
    ${result}    Common.VerifyStat    ${NameCmdFileLStat_CheckAgreeTC}    ${PathLogCheckAgreeTC}
    ErrorCheckAgreeTC40401    ${result}

TST_F4_1_1_010
    ${testCaseName}    Set Variable    TST_F4_1_1_010
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCmdFileLog_CheckAgreeTC}    ${PathLogCheckAgreeTC}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDeleteMassage_qa.checkAgreeTCRequested}    ${CmdProduce_qa.requestCheckAgreeTC}    ${DataProduce_TST_F4_1_1_010}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Consume Kafka    ${Consume_qa.checkAgreeTCRequested}    ${testCaseName}
    log    ${ConsumeResult}
    #check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_qa.checkAgreeTCRequested2_TST_F4_1_1_010}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    Sleep    25s
    FlushLogAndStatbyCommandName    ${NameCmdFileLog_CheckAgreeTC}    ${testCaseName}    ${PathLogCheckAgreeTC}
    ${result}    Common.VerifyStat    ${NameCmdFileLStat_CheckAgreeTC}    ${PathLogCheckAgreeTC}
    SuccessCheckAgreeTC20000    ${result}

TST_F4_0_1_011
    ${testCaseName}    Set Variable    TST_F4_1_1_011
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCmdFileLog_CheckAgreeTC}    ${PathLogCheckAgreeTC}
    #หาใน mongo.PrivacyProfile หา msisdn
    ${msisdn}    QueryDataReturnMsisdn    ${DataBaseNameNSB}    ${CollactionNamePrivacyProfile}    {"publicId" : "66843230015"}
    #prepare msisdn
    CheckResultAndInsertDataByMsisdn    ${DataBaseNameNSB}    ${CollactionNamePrivacyProfile}    ${JsonInsert_TST_F4_1_1_011}    ${msisdn}
    Sleep    5
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDeleteMassage_qa.checkAgreeTCRequested}    ${CmdProduce_qa.requestCheckAgreeTC}    ${DataProduce_TST_F4_1_1_011}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Consume Kafka    ${Consume_qa.checkAgreeTCRequested}    ${testCaseName}
    log    ${ConsumeResult}
    #check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_qa.checkAgreeTCRequested2_TST_F4_1_1_011}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    Sleep    25s
    FlushLogAndStatbyCommandName    ${NameCmdFileLog_CheckAgreeTC}    ${testCaseName}    ${PathLogCheckAgreeTC}
    ${result}    Common.VerifyStat    ${NameCmdFileLStat_CheckAgreeTC}    ${PathLogCheckAgreeTC}
    ErrorCheckAgreeTC40401    ${result}

TST_F4_0_1_050
    ${testCaseName}    Set Variable    TST_F4_0_1_050
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCmdFileLog_CheckAgreeTC}    ${PathLogCheckAgreeTC}
    #หาใน mongo.PrivacyProfile หา msisdn
    ${msisdn}    QueryDataReturnMsisdn    ${DataBaseNameNSB}    ${CollactionNamePrivacyProfile}    {"publicId": "66123456009"}
    #prepare msisdn
    CheckResultAndDelectDataByMsisdn    ${DataBaseNameNSB}    ${CollactionNamePrivacyProfile}    ${msisdn}
    Sleep    5
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDeleteMassage_qa.checkAgreeTCRequested}    ${CmdProduce_qa.requestCheckAgreeTC}    ${DataProduce_TST_F4_0_1_050}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Consume Kafka    ${Consume_qa.checkAgreeTCRequested}    ${testCaseName}
    log    ${ConsumeResult}
    #check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_qa.checkAgreeTCRequested2_TST_F4_0_1_050}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    Sleep    25s
    FlushLogAndStatbyCommandName    ${NameCmdFileLog_CheckAgreeTC}    ${testCaseName}    ${PathLogCheckAgreeTC}
    ${result}    Common.VerifyStat    ${NameCmdFileLStat_CheckAgreeTC}    ${PathLogCheckAgreeTC}
    ErrorCheckAgreeTC40401    ${result}

TST_F4_0_1_051
    ${testCaseName}    Set Variable    TST_F4_0_1_051
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCmdFileLog_CheckAgreeTC}    ${PathLogCheckAgreeTC}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDeleteMassage_qa.checkAgreeTCRequested}    ${CmdProduce_qa.requestCheckAgreeTC}    ${DataProduce_TST_F4_0_1_051}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Consume Kafka    ${Consume_qa.checkAgreeTCRequested}    ${testCaseName}
    log    ${ConsumeResult}
    #check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_qa.checkAgreeTCRequested2_TST_F4_0_1_051}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    Sleep    25s
    FlushLogAndStatbyCommandName    ${NameCmdFileLog_CheckAgreeTC}    ${testCaseName}    ${PathLogCheckAgreeTC}
    ${result}    Common.VerifyStat    ${NameCmdFileLStat_CheckAgreeTC}    ${PathLogCheckAgreeTC}
    ErrorCheckAgreeTC50000    ${result}

TST_F4_0_1_052
    ${testCaseName}    Set Variable    TST_F4_0_1_052
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCmdFileLog_CheckAgreeTC}    ${PathLogCheckAgreeTC}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDeleteMassage_qa.checkAgreeTCRequested}    ${CmdProduce_qa.requestCheckAgreeTC}    ${DataProduce_TST_F4_0_1_052}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Consume Kafka    ${Consume_qa.checkAgreeTCRequested}    ${testCaseName}
    log    ${ConsumeResult}
    #check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_qa.checkAgreeTCRequested2_TST_F4_0_1_052}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    Sleep    25s
    FlushLogAndStatbyCommandName    ${NameCmdFileLog_CheckAgreeTC}    ${testCaseName}    ${PathLogCheckAgreeTC}
    ${result}    Common.VerifyStat    ${NameCmdFileLStat_CheckAgreeTC}    ${PathLogCheckAgreeTC}
    ErrorCheckAgreeTC50000    ${result}

TST_F4_0_1_053
    ${testCaseName}    Set Variable    TST_F4_0_1_052
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCmdFileLog_CheckAgreeTC}    ${PathLogCheckAgreeTC}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDeleteMassage_qa.checkAgreeTCRequested}    ${CmdProduce_qa.requestCheckAgreeTC}    ${DataProduce_TST_F4_0_1_053}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Consume Kafka    ${Consume_qa.checkAgreeTCRequested}    ${testCaseName}
    log    ${ConsumeResult}
    #check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_qa.checkAgreeTCRequested2_TST_F4_0_1_053}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    Sleep    25s
    FlushLogAndStatbyCommandName    ${NameCmdFileLog_CheckAgreeTC}    ${testCaseName}    ${PathLogCheckAgreeTC}
    ${result}    Common.VerifyStat    ${NameCmdFileLStat_CheckAgreeTC}    ${PathLogCheckAgreeTC}
    ErrorCheckAgreeTC50000    ${result}

TST_F4_0_1_054
    ${testCaseName}    Set Variable    TST_F4_0_1_054
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCmdFileLog_CheckAgreeTC}    ${PathLogCheckAgreeTC}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDeleteMassage_qa.checkAgreeTCRequested}    ${CmdProduce_qa.requestCheckAgreeTC}    ${DataProduce_TST_F4_0_1_054}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Consume Kafka    ${Consume_qa.checkAgreeTCRequested}    ${testCaseName}
    log    ${ConsumeResult}
    #check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_qa.checkAgreeTCRequested2_TST_F4_0_1_054}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    Sleep    25s
    FlushLogAndStatbyCommandName    ${NameCmdFileLog_CheckAgreeTC}    ${testCaseName}    ${PathLogCheckAgreeTC}
    ${result}    Common.VerifyStat    ${NameCmdFileLStat_CheckAgreeTC}    ${PathLogCheckAgreeTC}
    ErrorCheckAgreeTC50000    ${result}

TST_F4_0_1_055
    ${testCaseName}    Set Variable    TST_F4_0_1_055
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCmdFileLog_CheckAgreeTC}    ${PathLogCheckAgreeTC}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDeleteMassage_qa.checkAgreeTCRequested}    ${CmdProduce_qa.requestCheckAgreeTC}    ${DataProduce_TST_F4_0_1_055}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Consume Kafka    ${Consume_qa.checkAgreeTCRequested}    ${testCaseName}
    log    ${ConsumeResult}
    #check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_qa.checkAgreeTCRequested2_TST_F4_0_1_055}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    Sleep    25s
    FlushLogAndStatbyCommandName    ${NameCmdFileLog_CheckAgreeTC}    ${testCaseName}    ${PathLogCheckAgreeTC}
    ${result}    Common.VerifyStat    ${NameCmdFileLStat_CheckAgreeTC}    ${PathLogCheckAgreeTC}
    ErrorCheckAgreeTC50000    ${result}

TST_F4_0_1_056
    ${testCaseName}    Set Variable    TST_F4_0_1_056
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCmdFileLog_CheckAgreeTC}    ${PathLogCheckAgreeTC}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDeleteMassage_qa.checkAgreeTCRequested}    ${CmdProduce_qa.requestCheckAgreeTC}    ${DataProduce_TST_F4_0_1_056}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Consume Kafka    ${Consume_qa.checkAgreeTCRequested}    ${testCaseName}
    log    ${ConsumeResult}
    #check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_qa.checkAgreeTCRequested2_TST_F4_0_1_056}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    Sleep    25s
    FlushLogAndStatbyCommandName    ${NameCmdFileLog_CheckAgreeTC}    ${testCaseName}    ${PathLogCheckAgreeTC}
    ${result}    Common.VerifyStat    ${NameCmdFileLStat_CheckAgreeTC}    ${PathLogCheckAgreeTC}
    ErrorCheckAgreeTC50000    ${result}

TST_F4_0_1_057
    ${testCaseName}    Set Variable    TST_F4_0_1_057
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCmdFileLog_CheckAgreeTC}    ${PathLogCheckAgreeTC}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDeleteMassage_qa.checkAgreeTCRequested}    ${CmdProduce_qa.requestCheckAgreeTC}    ${DataProduce_TST_F4_0_1_057}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Consume Kafka    ${Consume_qa.checkAgreeTCRequested}    ${testCaseName}
    log    ${ConsumeResult}
    #check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    	${DataExpected_qa.checkAgreeTCRequested2_TST_F4_0_1_057}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    Sleep    25s
    FlushLogAndStatbyCommandName    ${NameCmdFileLog_CheckAgreeTC}    ${testCaseName}    ${PathLogCheckAgreeTC}
    ${result}    Common.VerifyStat    ${NameCmdFileLStat_CheckAgreeTC}    ${PathLogCheckAgreeTC}
    ErrorCheckAgreeTC50000    ${result}

TST_F4_0_1_059
    ${testCaseName}    Set Variable    TST_F4_0_1_059
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCmdFileLog_CheckAgreeTC}    ${PathLogCheckAgreeTC}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDeleteMassage_qa.checkAgreeTCRequested}    ${CmdProduce_qa.requestCheckAgreeTC}    ${DataProduce_TST_F4_0_1_059}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Consume Kafka    ${Consume_qa.checkAgreeTCRequested}    ${testCaseName}
    log    ${ConsumeResult}
    #check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_qa.checkAgreeTCRequested2_TST_F4_0_1_059}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    Sleep    25s
    FlushLogAndStatbyCommandName    ${NameCmdFileLog_CheckAgreeTC}    ${testCaseName}    ${PathLogCheckAgreeTC}
    ${result}    Common.VerifyStat    ${NameCmdFileLStat_CheckAgreeTC}    ${PathLogCheckAgreeTC}
    ErrorCheckAgreeTCNull    ${result}

TST_F4_0_1_060
    ${testCaseName}    Set Variable    TST_F4_0_1_060
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCmdFileLog_CheckAgreeTC}    ${PathLogCheckAgreeTC}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDeleteMassage_qa.checkAgreeTCRequested}    ${CmdProduce_qa.requestCheckAgreeTC}    ${DataProduce_TST_F4_0_1_060}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Consume Kafka    ${Consume_qa.checkAgreeTCRequested}    ${testCaseName}
    log    ${ConsumeResult}
    #check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_qa.checkAgreeTCRequested2_TST_F4_0_1_060}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    Sleep    25s
    FlushLogAndStatbyCommandName    ${NameCmdFileLog_CheckAgreeTC}    ${testCaseName}    ${PathLogCheckAgreeTC}
    ${result}    Common.VerifyStat    ${NameCmdFileLStat_CheckAgreeTC}    ${PathLogCheckAgreeTC}
    ErrorCheckAgreeTC50000    ${result}

TST_F4_0_1_061
    ${testCaseName}    Set Variable    TST_F4_0_1_061
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCmdFileLog_CheckAgreeTC}    ${PathLogCheckAgreeTC}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDeleteMassage_qa.checkAgreeTCRequested}    ${CmdProduce_qa.requestCheckAgreeTC}    ${DataProduce_TST_F4_0_1_061}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Consume Kafka    ${Consume_qa.checkAgreeTCRequested}    ${testCaseName}
    log    ${ConsumeResult}
    #check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    	${DataExpected_qa.checkAgreeTCRequested2_TST_F4_0_1_061}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    Sleep    25s
    FlushLogAndStatbyCommandName    ${NameCmdFileLog_CheckAgreeTC}    ${testCaseName}    ${PathLogCheckAgreeTC}
    ${result}    Common.VerifyStat    ${NameCmdFileLStat_CheckAgreeTC}    ${PathLogCheckAgreeTC}
    ErrorCheckAgreeTC50000    ${result}