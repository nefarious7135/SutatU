*** Settings ***
Resource          ../../Keyword/Common.robot
Resource          ../../Keyword/MongoDB.robot
Resource          ../../Keyword/SecureCRT.robot
Resource          ../../Valiables/CommonValiable/CommonValiable.robot
Resource          ../CheckProfile/Valiable.robot
*** Test Cases ***
TST_F11_1_1_001
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_001
    #Prepare mongoDB
    CheckResultAndDeleteDataByMsisdn_Bo    ${DataBaseNameNSB}    ${CollectionName_Bo}    ${QueryMSISDN_TST_F11_1_1_001}
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile}
    #Set AC Response
    SetMockupResponse    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested}    ${CmdProduce_checkProfile}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_bo    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_002
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_002
    #Prepare mongoDB
    CheckResultAndDeleteDataByMsisdn_Bo    ${DataBaseNameNSB}    ${CollectionName_Bo}    ${QueryMSISDN_TST_F11_1_1_002}
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile}
    #Set AC Response
    SetMockupResponse    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested}    ${CmdProduce_checkProfile}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_bo    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_003
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_003
    #Prepare mongoDB
    CheckResultAndDeleteDataByMsisdn_Bo    ${DataBaseNameNSB}    ${CollectionName_Bo}    ${QueryMSISDN_TST_F11_1_1_003}
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile}
    #Set AC Response
    SetMockupResponse    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested}    ${CmdProduce_checkProfile}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_bo    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_004
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_004
    #Prepare mongoDB
    CheckResultAndDeleteDataByMsisdn_Bo    ${DataBaseNameNSB}    ${CollectionName_Bo}    ${QueryMSISDN_TST_F11_1_1_004}
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile}
    #Set AC Response
    SetMockupResponse    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested}    ${CmdProduce_checkProfile}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_bo    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_005
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_005
    #Prepare mongoDB
    CheckResultAndDeleteDataByMsisdn_Bo    ${DataBaseNameNSB}    ${CollectionName_Bo}    ${QueryMSISDN_TST_F11_1_1_005}
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile}
    #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested}    ${CmdProduce_checkProfile}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_bo    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_006
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_006
    #Prepare mongoDB
    CheckResultAndDeleteDataByMsisdn_Bo    ${DataBaseNameNSB}    ${CollectionName_Bo}    ${QueryMSISDN_TST_F11_1_1_006}
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile}
    #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested}    ${CmdProduce_checkProfile}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    Log    'ExpectConsume='${DataExpect_${NumTestCase}}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_bo    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_007
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_007
    #Prepare mongoDB
    CheckResultAndDeleteDataByMsisdn_Bo    ${DataBaseNameNSB}    ${CollectionName_Bo}    ${QueryMSISDN_TST_F11_1_1_007}
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile}
    #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested}    ${CmdProduce_checkProfile}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_bo    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_008
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_008
    #Prepare mongoDB
    CheckResultAndDeleteDataByMsisdn_Bo    ${DataBaseNameNSB}    ${CollectionName_Bo}    ${QueryMSISDN_TST_F11_1_1_008}
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile}
    #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested}    ${CmdProduce_checkProfile}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_bo    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_009
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_009
    #Prepare mongoDB
    CheckResultAndDeleteDataByMsisdn_Bo    ${DataBaseNameNSB}    ${CollectionName_Bo}    ${QueryMSISDN_TST_F11_1_1_009}
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile}
    #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested}    ${CmdProduce_checkProfile}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_bo    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_010
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_010
    #Prepare mongoDB
    CheckResultAndDeleteDataByMsisdn_Bo    ${DataBaseNameNSB}    ${CollectionName_Bo}    ${QueryMSISDN_TST_F11_1_1_010}
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile}
    #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested}    ${CmdProduce_checkProfile}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_bo    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_011
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_011
    #Prepare mongoDB
    CheckResultAndDeleteDataByMsisdn_Bo    ${DataBaseNameNSB}    ${CollectionName_Bo}    ${QueryMSISDN_TST_F11_1_1_011}
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile}
    #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested}    ${CmdProduce_checkProfile}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_bo    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_012
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_012
    #Prepare mongoDB
    CheckResultAndDeleteDataByMsisdn_Bo    ${DataBaseNameNSB}    ${CollectionName_Bo}    ${QueryMSISDN_${NumTestCase}}
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile}
    #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested}    ${CmdProduce_checkProfile}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_bo    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_013
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_013
    #Prepare mongoDB
    CheckResultAndDeleteDataByMsisdn_Bo    ${DataBaseNameNSB}    ${CollectionName_Bo}    ${QueryMSISDN_${NumTestCase}}
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile}
    #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested}    ${CmdProduce_checkProfile}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_bo    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_014
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_014
    #Prepare mongoDB
    CheckResultAndDeleteDataByMsisdn_Bo    ${DataBaseNameNSB}    ${CollectionName_Bo}    ${QueryMSISDN_${NumTestCase}}
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile}
    #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested}    ${CmdProduce_checkProfile}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_bo    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_015
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_015
    #Prepare mongoDB
    CheckResultAndDeleteDataByMsisdn_Bo    ${DataBaseNameNSB}    ${CollectionName_Bo}    ${QueryMSISDN_${NumTestCase}}
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile}
    #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested}    ${CmdProduce_checkProfile}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_bo    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_016
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_016
    #Prepare mongoDB
    PrepareMongoDBCheckProfile_bo    ${DataBaseNameNSB}    ${CollectionName_Bo}    ${QueryMSISDN_${NumTestCase}}    ${MongoDBPrepare_${NumTestCase}}
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile}
    #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested}    ${CmdProduce_checkProfile}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_bo    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    # TST_F11_1_1_017
    # \ \ \ #TestCase
    # \ \ \ ${NumTestCase} \ \ \ BuiltIn.Set Variable \ \ \ TST_F11_1_1_017
    # \ \ \ #Prepare mongoDB
    # \ \ \ PrepareMongoDBCheckProfile_bo \ \ \ ${DataBaseNameNSB} \ \ \ ${CollectionName_Bo} \ \ \ ${QueryMSISDN_${NumTestCase}} \ \ \ ${MongoDBPrepare_${NumTestCase}}
    # \ \ \ # Connect CRT
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ SetLogNull_bo \ \ \ ${NameCommandFileLog} \ \ \ ${PathLogcheckProfile}
    # \ \ \ #Set AC Response
    # \ \ \ SetMockupResponse_bo \ \ \ ${PathConfigAntiCorruptResponse} \ \ \ ${PathDataAntiCorruptResponse_${NumTestCase}}
    # #Produce kafka : requestCheckProfile_Bo
    # ConnectSecureCRTkafaka \ \ \ ${HostURL_10.138.42.190}
    # Produce Kafka \ \ \ ${CmdDelete_checkProfileRequested} \ \ \ ${CmdProduce_checkProfile} \ \ \ ${DataProduce_${NumTestCase}}
    # BuiltIn.Sleep \ \ \ 5
    # #Consume kafka : checkProfileRequested_Bo
    # ConnectSecureCRTkafaka \ \ \ ${HostURL_10.138.42.190}
    # ${ConsumeResult} \ \ \ ConsumeKafka \ \ \ ${CmdConsume_checkProfileRequested} \ \ \ ${NumTestCase}
    # Log \ \ \ 'consumeResult='${ConsumeResult}
    # #Check app produce checkProfileRequested_Bo
    # VerifyDataConsume_bo \ \ \ ${ConsumeResult} \ \ \ ${DataExpect_${NumTestCase}}
    # #VerifyDataConsume_bo \ \ \ ${ConsumeResult} \ \ \ ${DataExpect_TST_F11_1_1_001}
    # Log \ \ \ 'expect='${DataExpect_${NumTestCase}}
    # #Verify mongoDB after Update
    # VerifyMongoDBCheckProfile_bo \ \ \ ${QueryMSISDN_${NumTestCase}} \ \ \ ${DataExpectMongoDB_${NumTestCase}}
    # #Keep Log
    # ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # FlushLogAndStatbyCommandName \ \ \ ${NameCommandFileLog} \ \ \ ${NumTestCase} \ \ \ ${PathLogcheckProfile}
    # ##Verify Stat
    # # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    # [Teardown] \ \ \ Close All Connections
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_018
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_018
    #Prepare mongoDB
    CheckResultAndDeleteDataByMsisdn_Bo    ${DataBaseNameNSB}    ${CollectionName_Bo}    ${QueryMSISDN_TST_F11_1_1_018}
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile}
    #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested}    ${CmdProduce_checkProfile}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_bo    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_019
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_019
    #Prepare mongoDB
    PrepareMongoDBCheckProfile_bo    ${DataBaseNameNSB}    ${CollectionName_Bo}    ${QueryMSISDN_${NumTestCase}}    ${MongoDBPrepare_${NumTestCase}}
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile}
    #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested}    ${CmdProduce_checkProfile}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_bo    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_041
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_041
    #Prepare mongoDB
    CheckResultAndDeleteDataByMsisdn_Bo    ${DataBaseNameNSB}    ${CollectionName_Bo}    ${QueryMSISDN_TST_F11_1_1_041}
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile}
    #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested}    ${CmdProduce_checkProfile}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_bo    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_042
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_042
    #Prepare mongoDB
    CheckResultAndDeleteDataByMsisdn_Bo    ${DataBaseNameNSB}    ${CollectionName_Bo}    ${QueryMSISDN_TST_F11_1_1_042}
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile}
    #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested}    ${CmdProduce_checkProfile}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_bo    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_043
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_043
    #Prepare mongoDB
    CheckResultAndDeleteDataByMsisdn_Bo    ${DataBaseNameNSB}    ${CollectionName_Bo}    ${QueryMSISDN_TST_F11_1_1_043}
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile}
    #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested}    ${CmdProduce_checkProfile}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_bo    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_044
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_044
    #Prepare mongoDB
    CheckResultAndDeleteDataByMsisdn_Bo    ${DataBaseNameNSB}    ${CollectionName_Bo}    ${QueryMSISDN_TST_F11_1_1_044}
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile}
    #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested}    ${CmdProduce_checkProfile}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_bo    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_045
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_045
    #Prepare mongoDB
    CheckResultAndDeleteDataByMsisdn_Bo    ${DataBaseNameNSB}    ${CollectionName_Bo}    ${QueryMSISDN_TST_F11_1_1_045}
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile}
    #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested}    ${CmdProduce_checkProfile}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_bo    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_020
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_020
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile_tea}
    #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse_tea}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested_tea}    ${CmdProduce_checkProfile_tea}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested_tea}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_tea    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile_tea}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    20000
    [Teardown]    Close All Connections

TST_F11_1_1_021
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_021
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile_tea}
    #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse_tea}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested_tea}    ${CmdProduce_checkProfile_tea}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested_tea}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile_tea}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_tea    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    20000
    [Teardown]    Close All Connections

TST_F11_1_1_022
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_022
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile_tea}
    #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse_tea}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested_tea}    ${CmdProduce_checkProfile_tea}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested_tea}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile_tea}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_tea    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    20000
    [Teardown]    Close All Connections

TST_F11_1_1_023
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_023
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile_tea}
    #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse_tea}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested_tea}    ${CmdProduce_checkProfile_tea}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested_tea}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile_tea}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_tea    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    20000
    [Teardown]    Close All Connections

TST_F11_1_1_024
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_024
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile_tea}
    #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse_tea}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested_tea}    ${CmdProduce_checkProfile_tea}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested_tea}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile_tea}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_tea    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    20000
    [Teardown]    Close All Connections

TST_F11_1_1_025
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_025
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile_tea}
    #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse_tea}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested_tea}    ${CmdProduce_checkProfile_tea}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested_tea}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile_tea}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_tea    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    20000
    [Teardown]    Close All Connections

TST_F11_1_1_026
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_026
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile_tea}
    #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse_tea}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested_tea}    ${CmdProduce_checkProfile_tea}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested_tea}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile_tea}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_tea    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    20000
    [Teardown]    Close All Connections

TST_F11_1_1_027
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_027
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile_tea}
    #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse_tea}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested_tea}    ${CmdProduce_checkProfile_tea}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested_tea}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile_tea}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_tea    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    20000
    [Teardown]    Close All Connections

TST_F11_1_1_028
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_028
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile_tea}
    #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse_tea}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested_tea}    ${CmdProduce_checkProfile_tea}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested_tea}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile_tea}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_tea    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    20000
    [Teardown]    Close All Connections

TST_F11_1_1_029
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_029
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile_tea}
    #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse_tea}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested_tea}    ${CmdProduce_checkProfile_tea}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested_tea}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile_tea}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_tea    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    20000
    [Teardown]    Close All Connections

TST_F11_1_1_030
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_030
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile_tea}
    #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse_tea}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested_tea}    ${CmdProduce_checkProfile_tea}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested_tea}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile_tea}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_tea    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    20000
    [Teardown]    Close All Connections

TST_F11_1_1_031
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_031
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile_tea}
    #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse_tea}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested_tea}    ${CmdProduce_checkProfile_tea}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested_tea}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile_tea}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_tea    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    20000
    [Teardown]    Close All Connections

TST_F11_1_1_032
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_032
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile_tea}
    #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse_tea}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested_tea}    ${CmdProduce_checkProfile_tea}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested_tea}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile_tea}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_tea    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    20000
    [Teardown]    Close All Connections

TST_F11_1_1_033
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_033
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile_tea}
    #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse_tea}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested_tea}    ${CmdProduce_checkProfile_tea}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested_tea}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile_tea}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_tea    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    20000
    [Teardown]    Close All Connections

TST_F11_1_1_034
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_034
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile_tea}
    #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse_tea}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested_tea}    ${CmdProduce_checkProfile_tea}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested_tea}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile_tea}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_tea    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    20000
    [Teardown]    Close All Connections

TST_F11_1_1_035
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_035
    PrepareMongoDBCheckProfile_bo    ${DataBaseNameNSB}    ${CollectionName_Bo}    ${QueryMSISDN_${NumTestCase}}    ${MongoDBPrepare_${NumTestCase}}
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile_tea}
    #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse_tea}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested_tea}    ${CmdProduce_checkProfile_tea}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested_tea}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile_tea}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_tea    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_036
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_036
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile_tea}
    #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse_tea}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested_tea}    ${CmdProduce_checkProfile_tea}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested_tea}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile_tea}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_tea    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_037
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_037
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile_tea}
    #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse_tea}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested_tea}    ${CmdProduce_checkProfile_tea}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested_tea}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile_tea}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_tea    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_038
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_038
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile_tea}
    #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse_tea}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested_tea}    ${CmdProduce_checkProfile_tea}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested_tea}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile_tea}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_tea    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_039
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_039
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile_tea}
    #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse_tea}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested_tea}    ${CmdProduce_checkProfile_tea}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested_tea}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile_tea}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_tea    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_040
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_040
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile_tea}
    #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse_tea}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested_tea}    ${CmdProduce_checkProfile_tea}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested_tea}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile_tea}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_tea    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_250
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_250
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile_tea}
    #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse_tea}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested_tea}    ${CmdProduce_checkProfile_tea}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested_tea}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile_tea}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_tea    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_251
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_251
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile_tea}
    #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse_tea}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested_tea}    ${CmdProduce_checkProfile_tea}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested_tea}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile_tea}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_tea    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_0_1_050
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_0_1_050
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile_tea}
    #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse_tea}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested_tea}    ${CmdProduce_checkProfile_tea}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested_tea}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile_tea}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_051
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_051
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile_tea}
    #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse_tea}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested_tea}    ${CmdProduce_checkProfile_tea}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested_tea}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile_tea}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_tea    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_052
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_052
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile_tea}
    #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse_tea}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested_tea}    ${CmdProduce_checkProfile_tea}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested_tea}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile_tea}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_tea    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_053
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_053
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile_tea}
    # #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse_tea}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested_tea}    ${CmdProduce_checkProfile_tea}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested_tea}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_tea    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile_tea}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_054
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_054
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile_tea}
    # #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse_tea}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested_tea}    ${CmdProduce_checkProfile_tea}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested_tea}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_tea    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile_tea}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_055
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_055
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile_tea}
    # #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse_tea}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested_tea}    ${CmdProduce_checkProfile_tea}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested_tea}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_tea    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile_tea}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_056
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_056
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile_tea}
    # #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse_tea}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested_tea}    ${CmdProduce_checkProfile_tea}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested_tea}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_tea    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile_tea}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_057
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_057
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile_tea}
    # #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse_tea}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested_tea}    ${CmdProduce_checkProfile_tea}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested_tea}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_tea    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile_tea}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_058
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_058
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile_tea}
    # #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse_tea}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested_tea}    ${CmdProduce_checkProfile_tea}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested_tea}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_tea    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile_tea}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_059
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_059
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile_tea}
    # #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse_tea}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested_tea}    ${CmdProduce_checkProfile_tea}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested_tea}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_tea    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile_tea}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_060
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_060
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile_tea}
    # #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested_tea}    ${CmdProduce_checkProfile_tea}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested_tea}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_tea    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile_tea}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_061
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_061
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile_tea}
    # #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse_tea}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested_tea}    ${CmdProduce_checkProfile_tea}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested_tea}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_tea    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile_tea}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_062
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_062
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile_tea}
    # #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse_tea}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested_tea}    ${CmdProduce_checkProfile_tea}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested_tea}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_tea    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile_tea}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_063
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_063
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile_tea}
    # #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse_tea}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested_tea}    ${CmdProduce_checkProfile_tea}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested_tea}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_tea    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile_tea}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_064
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_064
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile_tea}
    # #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse_tea}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested_tea}    ${CmdProduce_checkProfile_tea}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested_tea}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_tea    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile_tea}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_0_1_065
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_0_1_065
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile_tea}
    # #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse_tea}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested_tea}    ${CmdProduce_checkProfile_tea}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested_tea}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    #VerifyMongoDBCheckProfile_bo    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile_tea}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_066
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_066
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile_tea}
    # #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse_tea}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested_tea}    ${CmdProduce_checkProfile_tea}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested_tea}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_tea    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile_tea}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_067
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_067
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile_tea}
    # #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse_tea}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested_tea}    ${CmdProduce_checkProfile_tea}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested_tea}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_tea    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile_tea}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_068
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_068
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile_tea}
    # #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse_tea}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested_tea}    ${CmdProduce_checkProfile_tea}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested_tea}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_tea    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile_tea}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_069
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_069
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile_tea}
    # #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse_tea}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested_tea}    ${CmdProduce_checkProfile_tea}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested_tea}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_tea    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile_tea}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_070
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_070
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile_tea}
    # #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse_tea}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested_tea}    ${CmdProduce_checkProfile_tea}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested_tea}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_tea    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile_tea}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_071
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_071
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile_tea}
    # #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse_tea}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested_tea}    ${CmdProduce_checkProfile_tea}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested_tea}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_tea    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile_tea}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_072
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_072
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile_tea}
    # #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse_tea}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested_tea}    ${CmdProduce_checkProfile_tea}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested_tea}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_tea    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile_tea}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_073
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_073
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile_tea}
    # #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse_tea}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested_tea}    ${CmdProduce_checkProfile_tea}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested_tea}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_tea    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile_tea}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_074
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_074
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile_tea}
    # #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse_tea}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested_tea}    ${CmdProduce_checkProfile_tea}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested_tea}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_tea    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile_tea}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_075
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_075
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile_tea}
    # #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse_tea}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested_tea}    ${CmdProduce_checkProfile_tea}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested_tea}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_tea    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile_tea}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_076
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_076
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile_tea}
    # #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse_tea}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested_tea}    ${CmdProduce_checkProfile_tea}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested_tea}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_tea    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile_tea}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_077
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_077
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile_tea}
    # #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse_tea}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested_tea}    ${CmdProduce_checkProfile_tea}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested_tea}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_tea    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile_tea}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_078
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_078
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile_tea}
    # #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse_tea}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested_tea}    ${CmdProduce_checkProfile_tea}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested_tea}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_tea    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile_tea}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_079
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_079
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile_tea}
    # #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse_tea}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested_tea}    ${CmdProduce_checkProfile_tea}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested_tea}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_tea    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile_tea}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_080
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_080
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile_tea}
    # #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse_tea}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested_tea}    ${CmdProduce_checkProfile_tea}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested_tea}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_tea    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile_tea}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_081
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_081
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile_tea}
    # #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse_tea}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested_tea}    ${CmdProduce_checkProfile_tea}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested_tea}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_tea    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile_tea}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_082
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_082
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile_tea}
    # #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse_tea}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested_tea}    ${CmdProduce_checkProfile_tea}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested_tea}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_tea    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile_tea}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_083
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_083
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile_tea}
    # #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse_tea}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested_tea}    ${CmdProduce_checkProfile_tea}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested_tea}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_tea    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile_tea}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_084
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_084
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile_tea}
    # #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse_tea}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested_tea}    ${CmdProduce_checkProfile_tea}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested_tea}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_tea    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile_tea}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_085
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_085
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile_tea}
    # #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse_tea}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested_tea}    ${CmdProduce_checkProfile_tea}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested_tea}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_tea    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile_tea}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_086
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_086
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile_tea}
    # #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse_tea}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested_tea}    ${CmdProduce_checkProfile_tea}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested_tea}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_tea    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile_tea}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_087
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_087
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile_tea}
    # #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse_tea}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested_tea}    ${CmdProduce_checkProfile_tea}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested_tea}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_tea    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile_tea}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_088
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_088
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile_tea}
    # #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse_tea}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested_tea}    ${CmdProduce_checkProfile_tea}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested_tea}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_tea    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile_tea}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_089
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_089
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile_tea}
    # #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse_tea}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested_tea}    ${CmdProduce_checkProfile_tea}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested_tea}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_tea    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile_tea}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_090
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_090
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile_tea}
    # #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse_tea}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested_tea}    ${CmdProduce_checkProfile_tea}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested_tea}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_tea    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile_tea}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_091
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_091
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile_tea}
    # #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse_tea}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested_tea}    ${CmdProduce_checkProfile_tea}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested_tea}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_tea    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile_tea}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_092
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_092
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile_tea}
    # #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse_tea}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested_tea}    ${CmdProduce_checkProfile_tea}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested_tea}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_tea    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile_tea}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_0_1_101
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_0_1_101
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile}
    # #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested}    ${CmdProduce_checkProfile}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    # #Verify mongoDB after Update
    # VerifyMongoDBCheckProfile_bo \ \ \ ${QueryMSISDN_${NumTestCase}} \ \ \ ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_0_1_102
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_0_1_102
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile}
    # #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested}    ${CmdProduce_checkProfile}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    ##Verify mongoDB after Update
    # VerifyMongoDBCheckProfile_bo \ \ \ ${QueryMSISDN_${NumTestCase}} \ \ \ ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_103
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_103
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile}
    # #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested}    ${CmdProduce_checkProfile}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_bo    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_104
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_104
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile}
    # #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested}    ${CmdProduce_checkProfile}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_bo    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_105
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_105
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile}
    # #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested}    ${CmdProduce_checkProfile}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_bo    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_106
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_106
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile}
    # #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested}    ${CmdProduce_checkProfile}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_bo    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_107
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_107
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile}
    # #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested}    ${CmdProduce_checkProfile}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_bo    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_108
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_108
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile}
    # #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested}    ${CmdProduce_checkProfile}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_bo    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_109
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_109
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile}
    # #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested}    ${CmdProduce_checkProfile}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_bo    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_110
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_110
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile}
    # #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested}    ${CmdProduce_checkProfile}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_bo    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_111
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_111
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile}
    # #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested}    ${CmdProduce_checkProfile}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_bo    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_112
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_112
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile}
    # #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested}    ${CmdProduce_checkProfile}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_bo    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_113
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_113
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile}
    #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    # #reload config app
    # SSHLibrary.Execute Command \ \ \ ${cmdReloadConf}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested}    ${CmdProduce_checkProfile}    ${DataProduce_${NumTestCase}}
    log    'cmd_produce='${CmdProduce_checkProfile}
    Log    'data_produce='${DataProduce_${NumTestCase}}
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    Log    'expect_comsume='${DataExpect_${NumTestCase}}
    # check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile}
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_114
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_114
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile}
    # #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested}    ${CmdProduce_checkProfile}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_bo    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_115
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_115
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile}
    # #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    # #reload config app
    # SSHLibrary.Execute Command \ \ \ ${cmdReloadConf}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested}    ${CmdProduce_checkProfile}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_bo    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_116
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_116
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile}
    # #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    # #reload config app
    # SSHLibrary.Execute Command \ \ \ ${cmdReloadConf}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested}    ${CmdProduce_checkProfile}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_bo    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_117
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_117
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile}
    # #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    # #reload config app
    # SSHLibrary.Execute Command \ \ \ ${cmdReloadConf}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested}    ${CmdProduce_checkProfile}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_bo    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_118
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_118
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile}
    # #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    # #reload config app
    # SSHLibrary.Execute Command \ \ \ ${cmdReloadConf}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested}    ${CmdProduce_checkProfile}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_bo    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_119
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_119
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile}
    # #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    # #reload config app
    # SSHLibrary.Execute Command \ \ \ ${cmdReloadConf}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested}    ${CmdProduce_checkProfile}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_bo    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_0_1_151
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_0_1_151
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile}
    # #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    # #reload config app
    # SSHLibrary.Execute Command \ \ \ ${cmdReloadConf}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested}    ${CmdProduce_checkProfile}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    # #Verify mongoDB after Update
    # VerifyMongoDBCheckProfile_bo \ \ \ ${QueryMSISDN_${NumTestCase}} \ \ \ ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_0_1_152
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_0_1_152
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile}
    # #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    # #reload config app
    # SSHLibrary.Execute Command \ \ \ ${cmdReloadConf}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested}    ${CmdProduce_checkProfile}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    # #Verify mongoDB after Update
    # VerifyMongoDBCheckProfile_bo \ \ \ ${QueryMSISDN_${NumTestCase}} \ \ \ ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_153
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_153
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile}
    # #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    # #reload config app
    # SSHLibrary.Execute Command \ \ \ ${cmdReloadConf}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested}    ${CmdProduce_checkProfile}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_bo    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_154
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_154
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile}
    # #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    # #reload config app
    # SSHLibrary.Execute Command \ \ \ ${cmdReloadConf}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested}    ${CmdProduce_checkProfile}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_bo    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_155
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_155
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile}
    # #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    # #reload config app
    # SSHLibrary.Execute Command \ \ \ ${cmdReloadConf}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested}    ${CmdProduce_checkProfile}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_bo    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_156
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_156
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile}
    # #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    # #reload config app
    # SSHLibrary.Execute Command \ \ \ ${cmdReloadConf}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested}    ${CmdProduce_checkProfile}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_bo    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_157
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_157
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile}
    # #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    # #reload config app
    # SSHLibrary.Execute Command \ \ \ ${cmdReloadConf}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested}    ${CmdProduce_checkProfile}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_bo    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_158
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_158
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile}
    # #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    # #reload config app
    # SSHLibrary.Execute Command \ \ \ ${cmdReloadConf}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested}    ${CmdProduce_checkProfile}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_bo    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_159
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_159
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile}
    # #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    # #reload config app
    # SSHLibrary.Execute Command \ \ \ ${cmdReloadConf}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested}    ${CmdProduce_checkProfile}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_bo    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_160
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_160
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile}
    # #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    # #reload config app
    # SSHLibrary.Execute Command \ \ \ ${cmdReloadConf}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested}    ${CmdProduce_checkProfile}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_bo    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_161
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_161
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile}
    # #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    # #reload config app
    # SSHLibrary.Execute Command \ \ \ ${cmdReloadConf}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested}    ${CmdProduce_checkProfile}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_bo    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_162
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_162
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile}
    # #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    # #reload config app
    # SSHLibrary.Execute Command \ \ \ ${cmdReloadConf}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested}    ${CmdProduce_checkProfile}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_bo    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_163
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_163
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile}
    # #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    # #reload config app
    # SSHLibrary.Execute Command \ \ \ ${cmdReloadConf}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested}    ${CmdProduce_checkProfile}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_bo    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_164
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_164
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile}
    # #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    # #reload config app
    # SSHLibrary.Execute Command \ \ \ ${cmdReloadConf}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested}    ${CmdProduce_checkProfile}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_bo    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_165
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_165
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile}
    # #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    # #reload config app
    # SSHLibrary.Execute Command \ \ \ ${cmdReloadConf}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested}    ${CmdProduce_checkProfile}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_bo    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_166
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_166
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile}
    # #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    # #reload config app
    # SSHLibrary.Execute Command \ \ \ ${cmdReloadConf}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested}    ${CmdProduce_checkProfile}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_bo    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_167
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_167
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCommandFileLog}    ${PathLogcheckProfile}
    # #Set AC Response
    SetMockupResponse_bo    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    # #reload config app
    # SSHLibrary.Execute Command \ \ \ ${cmdReloadConf}
    #Produce kafka : requestCheckProfile_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested}    ${CmdProduce_checkProfile}    ${DataProduce_${NumTestCase}}
    BuiltIn.Sleep    5
    #Consume kafka : checkProfileRequested_Bo
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_checkProfileRequested}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce checkProfileRequested_Bo
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F11_1_1_001}
    Log    'expect='${DataExpect_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBCheckProfile_bo    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile}
    ##Verify Stat
    # \ \ \ ConnectSecureCRTLog \ \ \ ${HostURL_10.137.45.30}
    # \ \ \ VerifyStatByCommand \ \ \ ${NumTestCase} \ \ \ nsb-check-profile \ \ \ ${ServiceNameAPP} \ \ \ SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_202
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_202
    #หา mssidn ใน MongoDB
    ${ID}    QueryDataReturnMsisdn    ${DataBaseNameNSB}    ${CollactionName_may}    {"msisdn":"66543789034"}
    Log    ${ID}
    #ลบData MongoDB
    ${ID}    DelectDataFromMsisdn    ${DataBaseNameNSB}    ${CollactionName_may}    ${ID}
    Log    ${ID}
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog}    ${PathLogcheckProfile_may}
    #Set AC Response
    SetMockupResponse_may    ${PathConfigAntiCorruptResponse_May}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    # #reload config app
    # SSHLibrary.Execute Command \ \ \ ${cmdReloadConf}
    #Produce kafka : requestCheckProfile_may
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested_may}    ${CmdProduce_checkProfile_may}    ${MongoDBPrepare_${NumTestCase}}
    log    'cmd_produce='${CmdProduce_checkProfile_may}
    Log    'data_produce='${DataProduce_${NumTestCase}}
    #Consume kafka : checkProfileRequested_may
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    Consume Kafka    ${CmdConsume_checkProfileRequested_may}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    Log    'expect_comsume='${DataExpect_${NumTestCase}}
    # check app produce checkProfileRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile_may}
    Sleep    10s
    #Verify Stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    ${NumTestCase}    nsb-check-profile    service-check-profile-may    SUCCESS_DB40400
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_206
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_206
    #หา mssidn ใน MongoDB
    ${ID}    QueryDataReturnMsisdn    ${DataBaseNameNSB}    ${CollactionName_may}    {"msisdn":"0843789036"}
    Log    ${ID}
    #ลบData MongoDB
    ${ID}    DelectDataFromMsisdn    ${DataBaseNameNSB}    ${CollactionName_may}    ${ID}
    Log    ${ID}
    #prepare MongoDB
    ${CurrentDate}    Nowdate
    InsertDataFromJson    ${DataBaseNameNSB}    ${CollactionName_may}    ${MongoDBPrepare_${NumTestCase}}
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog}    ${PathLogcheckProfile_may}
    #Set AC Response
    SetMockupResponse_may    ${PathConfigAntiCorruptResponse_May}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    # #reload config app
    # SSHLibrary.Execute Command \ \ \ ${cmdReloadConf}
    #Produce kafka : requestCheckProfile_may
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested_may}    ${CmdProduce_checkProfile_may}    ${DataProduce_${NumTestCase}}
    log    'cmd_produce='${CmdProduce_checkProfile_may}
    Log    'data_produce='${DataProduce_${NumTestCase}}
    #Consume kafka : checkProfileRequested_may
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    Consume Kafka    ${CmdConsume_checkProfileRequested_may}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    Log    'expect_comsume='${DataExpect_${NumTestCase}}
    # check app produce checkProfileRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile_may}
    Sleep    10s
    #Verify Stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    ${NumTestCase}    nsb-check-profile    service-check-profile-may    SUCCESS
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_207
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_207
    #Query mssidn in MongoDB
    ${ID}    QueryDataReturnMsisdn    ${DataBaseNameNSB}    ${CollactionName_may}    {"msisdn":"0843789037"}
    Log    ${ID}
    #Delete Data in MongoDB
    ${ID}    DelectDataFromMsisdn    ${DataBaseNameNSB}    ${CollactionName_may}    ${ID}
    Log    ${ID}
    #Prepare MongoDB
    # ${CurrentDate} \ \ \ Nowdate
    InsertDataFromJson    ${DataBaseNameNSB}    ${CollactionName_may}    ${MongoDBPrepare_${NumTestCase}}
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog}    ${PathLogcheckProfile_may}
    #Set AC Response
    SetMockupResponse_may    ${PathConfigAntiCorruptResponse_May}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    # #reload config app
    # SSHLibrary.Execute Command \ \ \ ${cmdReloadConf}
    #Produce kafka : requestCheckProfile_may
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested_may}    ${CmdProduce_checkProfile_may}    ${DataProduce_${NumTestCase}}
    log    'cmd_produce='${CmdProduce_checkProfile_may}
    Log    'data_produce='${DataProduce_${NumTestCase}}
    #Consume kafka : checkProfileRequested_may
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    Consume Kafka    ${CmdConsume_checkProfileRequested_may}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    Log    'expect_comsume='${DataExpect_${NumTestCase}}
    # check app produce checkProfileRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile_may}
    Sleep    10s
    #Verify Stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    ${NumTestCase}    nsb-check-profile    service-check-profile-may    SUCCESS
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_208
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_208
    #Query mssidn in MongoDB
    ${ID}    QueryDataReturnMsisdn    ${DataBaseNameNSB}    ${CollactionName_may}    {"msisdn":"0843789038"}
    Log    ${ID}
    #Delete Data in MongoDB
    ${ID}    DelectDataFromMsisdn    ${DataBaseNameNSB}    ${CollactionName_may}    ${ID}
    Log    ${ID}
    #Prepare MongoDB
    ${CurrentDate}    Nowdate
    InsertDataFromJson    ${DataBaseNameNSB}    ${CollactionName_may}    ${MongoDBPrepare_${NumTestCase}}
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog}    ${PathLogcheckProfile_may}
    #Set AC Response
    SetMockupResponse_may    ${PathConfigAntiCorruptResponse_May}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    # #reload config app
    # SSHLibrary.Execute Command \ \ \ ${cmdReloadConf}
    #Produce kafka : requestCheckProfile_may
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested_may}    ${CmdProduce_checkProfile_may}    ${DataProduce_${NumTestCase}}
    log    'cmd_produce='${CmdProduce_checkProfile_may}
    Log    'data_produce='${DataProduce_${NumTestCase}}
    #Consume kafka : checkProfileRequested_may
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    Consume Kafka    ${CmdConsume_checkProfileRequested_may}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    Log    'expect_comsume='${DataExpect_${NumTestCase}}
    # check app produce checkProfileRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile_may}
    Sleep    10s
    #Verify Stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    ${NumTestCase}    nsb-check-profile    service-check-profile-may    SUCCESS
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_209
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_209
    #Query mssidn in MongoDB
    ${ID}    QueryDataReturnMsisdn    ${DataBaseNameNSB}    ${CollactionName_may}    {"msisdn":"0843789039"}
    Log    ${ID}
    #Delete Data in MongoDB
    ${ID}    DelectDataFromMsisdn    ${DataBaseNameNSB}    ${CollactionName_may}    ${ID}
    Log    ${ID}
    #Prepare MongoDB
    ${CurrentDate}    Nowdate
    InsertDataFromJson    ${DataBaseNameNSB}    ${CollactionName_may}    ${MongoDBPrepare_${NumTestCase}}
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog}    ${PathLogcheckProfile_may}
    #Set AC Response
    SetMockupResponse_may    ${PathConfigAntiCorruptResponse_May}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    # #reload config app
    # SSHLibrary.Execute Command \ \ \ ${cmdReloadConf}
    #Produce kafka : requestCheckProfile_may
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested_may}    ${CmdProduce_checkProfile_may}    ${DataProduce_${NumTestCase}}
    log    'cmd_produce='${CmdProduce_checkProfile_may}
    Log    'data_produce='${DataProduce_${NumTestCase}}
    #Consume kafka : checkProfileRequested_may
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    Consume Kafka    ${CmdConsume_checkProfileRequested_may}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    Log    'expect_comsume='${DataExpect_${NumTestCase}}
    # check app produce checkProfileRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile_may}
    Sleep    10s
    #Verify Stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    ${NumTestCase}    nsb-check-profile    service-check-profile-may    SUCCESS
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_210
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_210
    #Query mssidn in MongoDB
    ${ID}    QueryDataReturnMsisdn    ${DataBaseNameNSB}    ${CollactionName_may}    {"msisdn":"0843789040"}
    Log    ${ID}
    #Delete Data in MongoDB
    ${ID}    DelectDataFromMsisdn    ${DataBaseNameNSB}    ${CollactionName_may}    ${ID}
    Log    ${ID}
    #Prepare MongoDB
    ${CurrentDate}    Nowdate
    InsertDataFromJson    ${DataBaseNameNSB}    ${CollactionName_may}    {"msisdn":"0843789040","isUsingFupPackage":false,"networkType":"postpaid","5GMode":{"currentMode":"boost","packageName":"Test Speed1","packageExpireTime":"20230822","initialAmount":1,"remainingAmount":1,"countChangeMode":1,"dateCountChangeMode":"${CurrentDate}"}}
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog}    ${PathLogcheckProfile_may}
    #Set AC Response
    SetMockupResponse_may    ${PathConfigAntiCorruptResponse_May}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    # #reload config app
    # SSHLibrary.Execute Command \ \ \ ${cmdReloadConf}
    #Produce kafka : requestCheckProfile_may
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested_may}    ${CmdProduce_checkProfile_may}    ${DataProduce_${NumTestCase}}
    log    'cmd_produce='${CmdProduce_checkProfile_may}
    Log    'data_produce='${DataProduce_${NumTestCase}}
    #Consume kafka : checkProfileRequested_may
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    Consume Kafka    ${CmdConsume_checkProfileRequested_may}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    Log    'expect_comsume='${DataExpect_${NumTestCase}}
    # check app produce checkProfileRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile_may}
    Sleep    10s
    #Verify Stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    ${NumTestCase}    nsb-check-profile    service-check-profile-may    SUCCESS
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_211
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_211
    #Query mssidn in MongoDB
    ${ID}    QueryDataReturnMsisdn    ${DataBaseNameNSB}    ${CollactionName_may}    {"msisdn":"0843789041"}
    Log    ${ID}
    #Delete Data in MongoDB
    ${ID}    DelectDataFromMsisdn    ${DataBaseNameNSB}    ${CollactionName_may}    ${ID}
    Log    ${ID}
    #Prepare MongoDB
    ${CurrentDate}    Nowdate
    InsertDataFromJson    ${DataBaseNameNSB}    ${CollactionName_may}    {"msisdn":"0843789041","isUsingFupPackage":false,"networkType":"postpaid","5GMode":{"currentMode":"boost_mode","packageName":"Test Speed1","packageExpireTime":"20200822","productSequenceId":"A1","remainingAmount":0,"countChangeMode":20,"dateCountChangeMode":"${CurrentDate}"}}
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog}    ${PathLogcheckProfile_may}
    #Set AC Response
    SetMockupResponse_may    ${PathConfigAntiCorruptResponse_May}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    # #reload config app
    # SSHLibrary.Execute Command \ \ \ ${cmdReloadConf}
    #Produce kafka : requestCheckProfile_may
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested_may}    ${CmdProduce_checkProfile_may}    ${DataProduce_${NumTestCase}}
    log    'cmd_produce='${CmdProduce_checkProfile_may}
    Log    'data_produce='${DataProduce_${NumTestCase}}
    #Consume kafka : checkProfileRequested_may
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    Consume Kafka    ${CmdConsume_checkProfileRequested_may}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    Log    'expect_comsume='${DataExpect_${NumTestCase}}
    # check app produce checkProfileRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile_may}
    Sleep    10s
    #Verify Stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    ${NumTestCase}    nsb-check-profile    service-check-profile-may    SUCCESS
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_212
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_212
    #Query mssidn in MongoDB
    ${ID}    QueryDataReturnMsisdn    ${DataBaseNameNSB}    ${CollactionName_may}    {"msisdn":"0843789042"}
    Log    ${ID}
    #Delete Data in MongoDB
    ${ID}    DelectDataFromMsisdn    ${DataBaseNameNSB}    ${CollactionName_may}    ${ID}
    Log    ${ID}
    #Prepare MongoDB
    ${CurrentDate}    Nowdate
    InsertDataFromJson    ${DataBaseNameNSB}    ${CollactionName_may}    ${MongoDBPrepare_${NumTestCase}}
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog}    ${PathLogcheckProfile_may}
    #Set AC Response
    SetMockupResponse_may    ${PathConfigAntiCorruptResponse_May}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    # #reload config app
    # SSHLibrary.Execute Command \ \ \ ${cmdReloadConf}
    #Produce kafka : requestCheckProfile_may
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested_may}    ${CmdProduce_checkProfile_may}    ${DataProduce_${NumTestCase}}
    log    'cmd_produce='${CmdProduce_checkProfile_may}
    Log    'data_produce='${DataProduce_${NumTestCase}}
    #Consume kafka : checkProfileRequested_may
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    Consume Kafka    ${CmdConsume_checkProfileRequested_may}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    Log    'expect_comsume='${DataExpect_${NumTestCase}}
    # check app produce checkProfileRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile_may}
    Sleep    10s
    #Verify Stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    ${NumTestCase}    nsb-check-profile    service-check-profile-may    SUCCESS
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_213
    # เตรียมDB ก่อนtest
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_213
    #Query mssidn in MongoDB
    ${ID}    QueryDataReturnMsisdn    ${DataBaseNameNSB}    ${CollactionName_may}    {"msisdn":"0843789043"}
    Log    ${ID}
    #Delete Data in MongoDB
    ${ID}    DelectDataFromMsisdn    ${DataBaseNameNSB}    ${CollactionName_may}    ${ID}
    Log    ${ID}
    #Prepare MongoDB
    ${CurrentDate}    Nowdate
    InsertDataFromJson    ${DataBaseNameNSB}    ${CollactionName_may}    ${MongoDBPrepare_${NumTestCase}}
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog}    ${PathLogcheckProfile_may}
    #Set AC Response
    SetMockupResponse_may    ${PathConfigAntiCorruptResponse_May}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    # #reload config app
    # SSHLibrary.Execute Command \ \ \ ${cmdReloadConf}
    #Produce kafka : requestCheckProfile_may
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested_may}    ${CmdProduce_checkProfile_may}    ${DataProduce_${NumTestCase}}
    log    'cmd_produce='${CmdProduce_checkProfile_may}
    Log    'data_produce='${DataProduce_${NumTestCase}}
    #Consume kafka : checkProfileRequested_may
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    Consume Kafka    ${CmdConsume_checkProfileRequested_may}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    Log    'expect_comsume='${DataExpect_${NumTestCase}}
    # check app produce checkProfileRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile_may}
    Sleep    10s
    #Verify Stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    ${NumTestCase}    nsb-check-profile    service-check-profile-may    SUCCESS
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_214
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_214
    #Query mssidn in MongoDB
    ${ID}    QueryDataReturnMsisdn    ${DataBaseNameNSB}    ${CollactionName_may}    {"msisdn":"0843789044"}
    Log    ${ID}
    #Delete Data in MongoDB
    ${ID}    DelectDataFromMsisdn    ${DataBaseNameNSB}    ${CollactionName_may}    ${ID}
    Log    ${ID}
    #Prepare MongoDB
    ${CurrentDate}    Nowdate
    InsertDataFromJson    ${DataBaseNameNSB}    ${CollactionName_may}    ${MongoDBPrepare_${NumTestCase}}
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog}    ${PathLogcheckProfile_may}
    #Set AC Response
    SetMockupResponse_may    ${PathConfigAntiCorruptResponse_May}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    # #reload config app
    # SSHLibrary.Execute Command \ \ \ ${cmdReloadConf}
    #Produce kafka : requestCheckProfile_may
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested_may}    ${CmdProduce_checkProfile_may}    ${DataProduce_${NumTestCase}}
    log    'cmd_produce='${CmdProduce_checkProfile_may}
    Log    'data_produce='${DataProduce_${NumTestCase}}
    #Consume kafka : checkProfileRequested_may
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    Consume Kafka    ${CmdConsume_checkProfileRequested_may}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    Log    'expect_comsume='${DataExpect_${NumTestCase}}
    # check app produce checkProfileRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile_may}
    Sleep    10s
    #Verify Stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    ${NumTestCase}    nsb-check-profile    service-check-profile-may    SUCCESS
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_217
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_217
    #Query mssidn in MongoDB
    ${ID}    QueryDataReturnMsisdn    ${DataBaseNameNSB}    ${CollactionName_may}    {"msisdn":"0843789045"}
    Log    ${ID}
    #Delete Data in MongoDB
    ${ID}    DelectDataFromMsisdn    ${DataBaseNameNSB}    ${CollactionName_may}    ${ID}
    Log    ${ID}
    #Prepare MongoDB
    ${CurrentDate}    Nowdate
    InsertDataFromJson    ${DataBaseNameNSB}    ${CollactionName_may}    {"msisdn":"0843789045","isUsingFupPackage":false,"networkType":"","5GMode":{"currentMode":"boost_mode","packageName":"Test Speed1","packageExpireTime":"20201002","productSequenceId":"A1","initialAmount":1,"remainingAmount":1,"countChangeMode":7,"dateCountChangeMode":"${CurrentDate}"}}
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog}    ${PathLogcheckProfile_may}
    #Set AC Response
    SetMockupResponse_may    ${PathConfigAntiCorruptResponse_May}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    # #reload config app
    # SSHLibrary.Execute Command \ \ \ ${cmdReloadConf}
    #Produce kafka : requestCheckProfile_may
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested_may}    ${CmdProduce_checkProfile_may}    ${DataProduce_${NumTestCase}}
    log    'cmd_produce='${CmdProduce_checkProfile_may}
    Log    'data_produce='${DataProduce_${NumTestCase}}
    #Consume kafka : checkProfileRequested_may
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    Consume Kafka    ${CmdConsume_checkProfileRequested_may}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    Log    'expect_comsume='${DataExpect_${NumTestCase}}
    # check app produce checkProfileRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile_may}
    Sleep    10s
    #Verify Stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    ${NumTestCase}    nsb-check-profile    service-check-profile-may    SUCCESS
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_218
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_218
    #Query mssidn in MongoDB
    ${ID}    QueryDataReturnMsisdn    ${DataBaseNameNSB}    ${CollactionName_may}    {"msisdn":"0843789046"}
    Log    ${ID}
    #Delete Data in MongoDB
    ${ID}    DelectDataFromMsisdn    ${DataBaseNameNSB}    ${CollactionName_may}    ${ID}
    Log    ${ID}
    #Prepare MongoDB
    ${CurrentDate}    Nowdate
    InsertDataFromJson    ${DataBaseNameNSB}    ${CollactionName_may}    ${MongoDBPrepare_${NumTestCase}}
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog}    ${PathLogcheckProfile_may}
    #Set AC Response
    SetMockupResponse_may    ${PathConfigAntiCorruptResponse_May}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    # #reload config app
    # SSHLibrary.Execute Command \ \ \ ${cmdReloadConf}
    #Produce kafka : requestCheckProfile_may
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested_may}    ${CmdProduce_checkProfile_may}    ${DataProduce_${NumTestCase}}
    log    'cmd_produce='${CmdProduce_checkProfile_may}
    Log    'data_produce='${DataProduce_${NumTestCase}}
    #Consume kafka : checkProfileRequested_may
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    Consume Kafka    ${CmdConsume_checkProfileRequested_may}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    Log    'expect_comsume='${DataExpect_${NumTestCase}}
    # check app produce checkProfileRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile_may}
    Sleep    10s
    #Verify Stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    ${NumTestCase}    nsb-check-profile    service-check-profile-may    SUCCESS
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_219
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_219
    #Query mssidn in MongoDB
    ${ID}    QueryDataReturnMsisdn    ${DataBaseNameNSB}    ${CollactionName_may}    {"msisdn":"0843789047"}
    Log    ${ID}
    #Delete Data in MongoDB
    ${ID}    DelectDataFromMsisdn    ${DataBaseNameNSB}    ${CollactionName_may}    ${ID}
    Log    ${ID}
    #Prepare MongoDB
    ${CurrentDate}    Nowdate
    InsertDataFromJson    ${DataBaseNameNSB}    ${CollactionName_may}    {"msisdn":"0843789047","isUsingFupPackage":false,"networkType":"POSTPAID","5GMode":{"currentMode":"","packageName":"Test Speed1","packageExpireTime":"20201002","productSequenceId":"A1","initialAmount":1,"remainingAmount":1,"countChangeMode":7,"dateCountChangeMode":"${CurrentDate}"}}
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog}    ${PathLogcheckProfile_may}
    #Set AC Response
    SetMockupResponse_may    ${PathConfigAntiCorruptResponse_May}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    # #reload config app
    # SSHLibrary.Execute Command \ \ \ ${cmdReloadConf}
    #Produce kafka : requestCheckProfile_may
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested_may}    ${CmdProduce_checkProfile_may}    ${DataProduce_${NumTestCase}}
    log    'cmd_produce='${CmdProduce_checkProfile_may}
    Log    'data_produce='${DataProduce_${NumTestCase}}
    #Consume kafka : checkProfileRequested_may
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    Consume Kafka    ${CmdConsume_checkProfileRequested_may}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    Log    'expect_comsume='${DataExpect_${NumTestCase}}
    # check app produce checkProfileRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile_may}
    Sleep    10s
    #Verify Stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    ${NumTestCase}    nsb-check-profile    service-check-profile-may    SUCCESS
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_220
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_220
    #Query mssidn in MongoDB
    ${ID}    QueryDataReturnMsisdn    ${DataBaseNameNSB}    ${CollactionName_may}    {"msisdn":"0843789048"}
    Log    ${ID}
    #Delete Data in MongoDB
    ${ID}    DelectDataFromMsisdn    ${DataBaseNameNSB}    ${CollactionName_may}    ${ID}
    Log    ${ID}
    #Prepare MongoDB
    ${CurrentDate}    Nowdate
    InsertDataFromJson    ${DataBaseNameNSB}    ${CollactionName_may}    {"msisdn":"0843789048","isUsingFupPackage":false,"networkType":"POSTPAID","5GMode":{"currentMode":"game_mode","packageName":"","packageExpireTime":"20201002","productSequenceId":"A1","initialAmount":1,"remainingAmount":1,"countChangeMode":7,"dateCountChangeMode":"${CurrentDate}"}}
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog}    ${PathLogcheckProfile_may}
    #Set AC Response
    SetMockupResponse_may    ${PathConfigAntiCorruptResponse_May}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    # #reload config app
    # SSHLibrary.Execute Command \ \ \ ${cmdReloadConf}
    #Produce kafka : requestCheckProfile_may
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested_may}    ${CmdProduce_checkProfile_may}    ${DataProduce_${NumTestCase}}
    log    'cmd_produce='${CmdProduce_checkProfile_may}
    Log    'data_produce='${DataProduce_${NumTestCase}}
    #Consume kafka : checkProfileRequested_may
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    Consume Kafka    ${CmdConsume_checkProfileRequested_may}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    Log    'expect_comsume='${DataExpect_${NumTestCase}}
    # check app produce checkProfileRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile_may}
    Sleep    10s
    #Verify Stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    ${NumTestCase}    nsb-check-profile    service-check-profile-may    SUCCESS
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_221
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_221
    #Query mssidn in MongoDB
    ${ID}    QueryDataReturnMsisdn    ${DataBaseNameNSB}    ${CollactionName_may}    {"msisdn":"0843789049"}
    Log    ${ID}
    #Delete Data in MongoDB
    ${ID}    DelectDataFromMsisdn    ${DataBaseNameNSB}    ${CollactionName_may}    ${ID}
    Log    ${ID}
    #Prepare MongoDB
    ${CurrentDate}    Nowdate
    InsertDataFromJson    ${DataBaseNameNSB}    ${CollactionName_may}    {"msisdn":"0843789049","isUsingFupPackage":false,"networkType":"POSTPAID","5GMode":{"currentMode":"game_mode","packageName":"Test Speed1","packageExpireTime":"","productSequenceId":"A1","initialAmount":1,"remainingAmount":1,"countChangeMode":7,"dateCountChangeMode":"${CurrentDate}"}}
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog}    ${PathLogcheckProfile_may}
    #Set AC Response
    SetMockupResponse_may    ${PathConfigAntiCorruptResponse_May}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    # #reload config app
    # SSHLibrary.Execute Command \ \ \ ${cmdReloadConf}
    #Produce kafka : requestCheckProfile_may
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested_may}    ${CmdProduce_checkProfile_may}    ${DataProduce_${NumTestCase}}
    log    'cmd_produce='${CmdProduce_checkProfile_may}
    Log    'data_produce='${DataProduce_${NumTestCase}}
    #Consume kafka : checkProfileRequested_may
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    Consume Kafka    ${CmdConsume_checkProfileRequested_may}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    Log    'expect_comsume='${DataExpect_${NumTestCase}}
    # check app produce checkProfileRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile_may}
    Sleep    10s
    #Verify Stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    ${NumTestCase}    nsb-check-profile    service-check-profile-may    SUCCESS
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_222
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_222
    #Query mssidn in MongoDB
    ${ID}    QueryDataReturnMsisdn    ${DataBaseNameNSB}    ${CollactionName_may}    {"msisdn":"0843789050"}
    Log    ${ID}
    #Delete Data in MongoDB
    ${ID}    DelectDataFromMsisdn    ${DataBaseNameNSB}    ${CollactionName_may}    ${ID}
    Log    ${ID}
    #Prepare MongoDB
    ${CurrentDate}    Nowdate
    InsertDataFromJson    ${DataBaseNameNSB}    ${CollactionName_may}    {"msisdn":"0843789050","isUsingFupPackage":false,"networkType":"POSTPAID","5GMode":{"currentMode":"game_mode","packageName":"Test Speed1","packageExpireTime":"20201002","productSequenceId":"","initialAmount":1,"remainingAmount":1,"countChangeMode":7,"dateCountChangeMode":"${CurrentDate}"}}
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog}    ${PathLogcheckProfile_may}
    #Set AC Response
    SetMockupResponse_may    ${PathConfigAntiCorruptResponse_May}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    # #reload config app
    # SSHLibrary.Execute Command \ \ \ ${cmdReloadConf}
    #Produce kafka : requestCheckProfile_may
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested_may}    ${CmdProduce_checkProfile_may}    ${DataProduce_${NumTestCase}}
    log    'cmd_produce='${CmdProduce_checkProfile_may}
    Log    'data_produce='${DataProduce_${NumTestCase}}
    #Consume kafka : checkProfileRequested_may
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    Consume Kafka    ${CmdConsume_checkProfileRequested_may}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    Log    'expect_comsume='${DataExpect_${NumTestCase}}
    # check app produce checkProfileRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile_may}
    Sleep    10s
    #Verify Stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    ${NumTestCase}    nsb-check-profile    service-check-profile-may    SUCCESS
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_226
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_226
    #Query mssidn in MongoDB
    ${ID}    QueryDataReturnMsisdn    ${DataBaseNameNSB}    ${CollactionName_may}    {"msisdn":"0843789051"}
    Log    ${ID}
    #Delete Data in MongoDB
    ${ID}    DelectDataFromMsisdn    ${DataBaseNameNSB}    ${CollactionName_may}    ${ID}
    Log    ${ID}
    #Prepare MongoDB
    ${CurrentDate}    Nowdate
    InsertDataFromJson    ${DataBaseNameNSB}    ${CollactionName_may}    ${MongoDBPrepare_${NumTestCase}}
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog}    ${PathLogcheckProfile_may}
    #Set AC Response
    SetMockupResponse_may    ${PathConfigAntiCorruptResponse_May}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    # #reload config app
    # SSHLibrary.Execute Command \ \ \ ${cmdReloadConf}
    #Produce kafka : requestCheckProfile_may
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested_may}    ${CmdProduce_checkProfile_may}    ${DataProduce_${NumTestCase}}
    log    'cmd_produce='${CmdProduce_checkProfile_may}
    Log    'data_produce='${DataProduce_${NumTestCase}}
    #Consume kafka : checkProfileRequested_may
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    Consume Kafka    ${CmdConsume_checkProfileRequested_may}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    Log    'expect_comsume='${DataExpect_${NumTestCase}}
    # check app produce checkProfileRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile_may}
    Sleep    10s
    #Verify Stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    ${NumTestCase}    nsb-check-profile    service-check-profile-may    SUCCESS
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections

TST_F11_1_1_227
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F11_1_1_227
    #Query mssidn in MongoDB
    ${ID}    QueryDataReturnMsisdn    ${DataBaseNameNSB}    ${CollactionName_may}    {"msisdn":"0843789052"}
    Log    ${ID}
    #Delete Data in MongoDB
    ${ID}    DelectDataFromMsisdn    ${DataBaseNameNSB}    ${CollactionName_may}    ${ID}
    Log    ${ID}
    #Prepare MongoDB
    ${CurrentDate}    Nowdate
    InsertDataFromJson    ${DataBaseNameNSB}    ${CollactionName_may}    ${MongoDBPrepare_${NumTestCase}}
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog}    ${PathLogcheckProfile_may}
    #Set AC Response
    SetMockupResponse_may    ${PathConfigAntiCorruptResponse_May}    ${PathDataAntiCorruptResponse_${NumTestCase}}
    # #reload config app
    # SSHLibrary.Execute Command \ \ \ ${cmdReloadConf}
    #Produce kafka : requestCheckProfile_may
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_checkProfileRequested_may}    ${CmdProduce_checkProfile_may}    ${DataProduce_${NumTestCase}}
    log    'cmd_produce='${CmdProduce_checkProfile_may}
    Log    'data_produce='${DataProduce_${NumTestCase}}
    #Consume kafka : checkProfileRequested_may
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    Consume Kafka    ${CmdConsume_checkProfileRequested_may}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    Log    'expect_comsume='${DataExpect_${NumTestCase}}
    # check app produce checkProfileRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogcheckProfile_may}
    Sleep    10s
    #Verify Stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    ${NumTestCase}    nsb-check-profile    service-check-profile-may    SUCCESS
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-check-profile    20000    F11    ${NumTestCase}    ${DataExpect_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    40400
    [Teardown]    Close All Connections
*** Keywords ***
SetLogNull_bo
    [Arguments]    ${Command_Name}    ${pathLog}
    ${CurrentDate}    Get Current Date
    ${CurrentDate}    Split String    ${CurrentDate}    ${SPACE}
    ${CurrentDate}    BuiltIn.Set Variable    ${CurrentDate}[0]
    Comment    Log    ${CurrentDate}
    ${filename}    SSHLibrary.Execute Command    find ${pathLog}/log/ -type f -newermt "${CurrentDate}" | grep ${Command_Name} |cut -d '/' -f8    #find file : edit current day
    log    ${filename}
    IF    "${filename}" != ""
    SSHLibrary.Execute Command    echo "" > ${pathLog}/log/${filename}
    END
    #Set Stat Null
    ${filename_Stat}    SSHLibrary.Execute Command    find ${pathLog}/stat/ -type f \ -newermt "${CurrentDate}"
    IF    "${filename_Stat}" != ""
    SSHLibrary.Execute Command    echo "" > ${filename_Stat}
    END

FlushLogbyCommandName_bo
    [Arguments]    ${Command_Name}    ${Number_TestCase}    ${pathLog}
    ${pwd}    SSHLibrary.Execute Command    pwd
    log    ${pwd}
    BuiltIn.Sleep    2
    ${stdout}    SSHLibrary.Execute Command    cd ${pathLog}/log/
    log    ${stdout}
    ${filename}    SSHLibrary.Execute Command    find ${pathLog}/log/ -type f -mmin -1 -prune| grep ${Command_Name} |cut -d '/' -f8
    log    ${filename}
    SSHLibrary.Execute Command    cp ${pathLog}/log/${filename} /app/mfaf/TestResult/${Number_TestCase}.log
    ${ls}    SSHLibrary.Execute Command    ls -lrt /app/mfaf/TestResult/
    log    ${ls}

VerifyDataConsume_bo
    [Arguments]    ${Data_Actual}    ${Data_Expect}
    [Documentation]    ${Data_Actual} | ${Data_Expect}
    ...
    ...
    ...
    ...    ${Data_Expect} = Expect
    #BuiltIn.Should Be Equal    ${Data_Actual}    ${Data_Expect}
    BuiltIn.Should Be Equal As Strings    ${Data_Actual}    ${Data_Expect}    formatter=str
    # \ \ #ตอนนี้มันมี ESC ติดมา ไปหาวิธีเอา ESC ออกแล้วค่อยกลับมาใช้
    Comment    BuiltIn.Should Contain    ${Data_Actual}    ${Data_Expect}

QueryDataReturnMsisdn_bo
    [Arguments]    ${DBName}    ${CollectionName}    ${msisdn}
    ConnectMongoDB    ${DBName}
    ${msisdn}    Retrieve MongoDB Records With Desired Fields    ${DBName}    ${CollectionName}    ${msisdn}    msisdn    True    False
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

CheckResultAndDeleteDataByMsisdn_Bo
    [Arguments]    ${DBName}    ${CollectionName}    ${msisdn}
    ConnectMongoDB    ${DBName}
    ${msisdn}    JSONLibrary.Convert String To Json    ${msisdn}
    log    ${msisdn}
    ${msisdn}    JSONLibrary.Get Value From Json    ${msisdn}    $..msisdn
    ${msisdn}    BuiltIn.Set Variable    ${msisdn[0]}
    log    ${msisdn}
    IF    "${msisdn}" == ""
    log    ${msisdn}
    ELSE
    DeleteDataFromMsisdn_bo    ${DBName}    ${CollectionName}    ${msisdn}
    ${msisdn}    Set Variable    ${EMPTY}
    END
    [Return]    ${msisdn}

DeleteAndInsertDataByMsisdn_Bo
    [Arguments]    ${DBName}    ${CollectionName}    ${msisdn}    ${JsonInsert}
    IF    "${msisdn}" == ""
    log    ${msisdn}
    InsertDataFromJson    ${DBName}    ${CollectionName}    ${JsonInsert}
    ELSE
    DeleteDataFromMsisdn_bo    ${DBName}    ${CollectionName}    ${msisdn}
    InsertDataFromJson    ${DBName}    ${CollectionName}    ${JsonInsert}
    END

DeleteDataFromMsisdn_bo
    [Arguments]    ${DBName}    ${CollectionName}    ${msisdn}
    [Documentation]    ${DBName} = DataBaseName Ex.mfaf_neb
    ...    ${CollectionName} = CollectionName Ex.livingNetworkMSISDN
    ...    ${msisdn} = DataBaseName Ex.{xxxxxxxxxxx}
    ...
    ...
    ...    Ex. DelectDataFromID ${DBName} ${CollectionName} ${msisdn}
    ${msisdn}    Set Variable    {"msisdn":"${msisdn}"}
    Remove Mongodb Records    ${DBName}    ${CollectionName}    ${msisdn}

CheckResultAndInsertDataByMsisdn_bo
    [Arguments]    ${DBName}    ${CollectionName}    ${JsonInsert}    ${msisdn}
    IF    "${msisdn}" == ""
    InsertDataFromJson    ${DBName}    ${CollectionName}    ${JsonInsert}
    ELSE
    BuiltIn.Log Many    ${msisdn}
    END

PrepareMongoDB_bo
    [Arguments]    ${DBName}    ${CollectionName}    ${msisdn}    ${JsonInsert}
    ConnectMongoDB    ${DBName}
    ${msisdn}    Retrieve MongoDB Records With Desired Fields    ${DBName}    ${CollectionName}    ${msisdn}    msisdn    True    False
    ${msisdn}    Replace String    ${msisdn}    '    ${SPACE}
    ${msisdn}    Remove String    ${msisdn}    dict_items([( _id
    ${msisdn}    Remove String    ${msisdn}    , ObjectId(
    BuiltIn.Log Many    ${msisdn}
    Log    'msisdn='${msisdn}
    IF    "${msisdn}" == ""
    InsertDataFromJson    ${DBName}    ${CollectionName}    ${JsonInsert}
    ELSE
    ${Splitmsisdn}=    Split String    ${msisdn}
    ${msisdn}    Set Variable    ${Splitmsisdn[5]}
    BuiltIn.Log Many    ${msisdn}
    DeleteDataFromMsisdn_bo    ${DBName}    ${CollectionName}    ${msisdn}
    InsertDataFromJson    ${DBName}    ${CollectionName}    ${JsonInsert}
    END

PrepareMongoDBCheckProfile_bo
    [Arguments]    ${DBName}    ${CollectionName}    ${JsonQueryDB}    ${JsonInsertDB}
    #Connect MongoDB NSB
    Connect To MongoDB    ${DBName}
    #Query qaProfilePaper Key msisdn
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollectionName}    ${JsonQueryDB}
    log    ${ID}
    #Delete Data By ID
    IF    "${ID}" != ""
    DeleteDataFromID    ${DBName}    ${CollectionName}    ${ID}
    END
    #Insert Data To mongoDB
    InsertDataFromJson    ${DBName}    ${CollectionName}    ${JsonInsertDB}

JsonUpdatedateCountChangeMode_bo
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

VerifyMongoDBCheckProfile_bo
    [Arguments]    ${QueryMSISDN}    ${DataExpectMongoDB}
    #Update dateCountMode variable \ ${DataExpectMongoDB_${Testcase}}
    ${DataExpectMongoDB}    JsonUpdatedateCountChangeMode_bo    ${DataExpectMongoDB}
    Log    'ExpectMongo='${DataExpectMongoDB}
    #Connect MongoDB NSB
    Connect To MongoDB    ${DataBaseNameNSB}
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollectionName_Bo}    ${QueryMSISDN}
    Comment    VerifyMongoDB    ${Jsondata}    ${DataExpectMongoDB}
    ${Jsondata}    BuiltIn.Convert To String    ${Jsondata}
    ${Jsondata}    Remove String    ${Jsondata}    ${SPACE}
    ${Jsondata}    Replace String    ${Jsondata}    True    true
    ${Jsondata}    Replace String    ${Jsondata}    False    false
    ${Jsondata}    Replace String    ${Jsondata}    '    "
    ${DataExpectMongoDB}    BuiltIn.Convert To String    ${DataExpectMongoDB}
    ${DataExpectMongoDB}    Remove String    ${DataExpectMongoDB}    ${SPACE}
    BuiltIn.Should Be Equal    ${Jsondata}    ${DataExpectMongoDB}
    Log    mongoDB : ${Jsondata}
    Log    Expect : ${DataExpectMongoDB}
    Log    Verify mongoDB Success

VerifyStatSetCountMode_bo
    [Arguments]    ${Number_TestCase}    ${NameStatLog}    ${DOS}
    #เช็ค path ปัจจุบัน
    ${pwd}    SSHLibrary.Execute Command    pwd
    log    ${pwd}
    #Find : F/Number_Testcase
    ${F}    Split String    ${Number_TestCase}    _
    ${F}    Fetch From Right    ${F}[1]    _
    Log    ${F}
    ${result}    SSHLibrary.Execute Command    less /LOCAL-NAS/livingnetwork/nsb/log_mfaf/TestResult/${F}/${Number_TestCase}/${NameStatLog}
    Log    ${result}
    ${Amount}    Set Variable    0
    ${ListStat}    BuiltIn.Create List    ${DOS}|Receive_Request_From_Kafka|Consume_Message|Success|Success|qa.requestSetCountMode|consume|    ${DOS}|Send_Request_To_Mongo|FindOne_qaProfilePaper_ProcessTime|||qaProfilePaper|read|    ${DOS}|Send_Request_To_Mongo|FindOne_qaProfilePaper|Success|Success|qaProfilePaper|read|20000    ${DOS}|Send_Request_To_Mongo|Update_qaProfilePaper|Success|Success|qaProfilePaper|update|20000    ${DOS}|Send_Request_To_Mongo|Update_qaProfilePaper_ProcessTime|||qaProfilePaper|update|    ${DOS}|Send_Request_To_Kafka|Produce_Message|Success|Success|qa.setCountModeRequested|produce|20000    ${DOS}|Send_Request_To_Kafka|Produce_Message_ProcessTime|||qa.setCountModeRequested|produce|    ${DOS}|Summary|Summary_ProcessTime|||||    ${DOS}|Summary|Summary|Success|Success|||
    ${CountList}    Get Length    ${ListStat}
    Log    ${CountList}
    FOR    ${i}    IN RANGE    ${CountList}
        IF    "${DOS}"=="nsb-set-count-mode"
        Log    ${ListStat}[${i}]
        Should Contain    ${result}    ${ListStat}[${i}]
        ${Amount}    BuiltIn.Evaluate    ${Amount}+1
    END
    END
    #Check Amount
    IF    ${Amount}==${CountList}
    Log    Stat Pass
    ELSE
    Log    Stat Not Pass
    END

SetMockupResponse_bo
    [Arguments]    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse}
    [Documentation]    ตอนเรียกใช้ควรวางต่อกับ keyword setLogNull เพราะ mockup อยู่ในเครื่อง 66 เครื่องเดียวกับ log จะได้ ConnectSecureCRT ครั้งเดียว
    ...    แต่ถ้าไม่วางต่อจาก setLog จะต้อง ConnectSecureCRT ก่อนทุกครั้ง
    ...
    ...
    ...    ${PathConfigAntiCorruptResponse} คือ Path ที่ \ Mockup อ่าน Response
    ...    ${PathDataAntiCorruptResponse} คือ Path file \ Data AntiCorrup Response ที่ต้องการ
    #Connect CRT
    Log    'PathAC='${PathDataAntiCorruptResponse}
    Comment    ${PathData}    BuiltIn.Set Variable    ${PathDataAntiCorruptResponse}/${FileName}
    SSHLibrary.Execute Command    cp ${PathDataAntiCorruptResponse} ${PathConfigAntiCorruptResponse}

GetCurrentDate_bo
    #GetCurrentDate
    ${CurrentDate}    Get Current Date
    ${CurrentDate}    Split String    ${CurrentDate}    ${SPACE}
    ${CurrentDate}    Remove String    ${CurrentDate}[0]    -
    Log    ${CurrentDate}
    [Return]    ${CurrentDate}

SetMockupResponse_may
    [Arguments]    ${PathConfigAntiCorruptResponse_may}    ${PathDataAntiCorruptResponse}
    [Documentation]    ตอนเรียกใช้ควรวางต่อกับ keyword setLogNull เพราะ mockup อยู่ในเครื่อง 66 เครื่องเดียวกับ log จะได้ ConnectSecureCRT ครั้งเดียว
    ...    แต่ถ้าไม่วางต่อจาก setLog จะต้อง ConnectSecureCRT ก่อนทุกครั้ง
    ...
    ...
    ...    ${PathConfigAntiCorruptResponse_may} คือ Path ที่ \ Mockup อ่าน Response
    ...    ${PathDataAntiCorruptResponse} คือ Path file \ Data AntiCorrup Response ที่ต้องการ
    #Connect CRT
    Log    'PathAC='${PathDataAntiCorruptResponse}
    Comment    ${PathData}    BuiltIn.Set Variable    ${PathDataAntiCorruptResponse}/${FileName}
    SSHLibrary.Execute Command    cp ${PathDataAntiCorruptResponse} ${PathConfigAntiCorruptResponse_may}

VerifyMongoDBCheckProfile_tea
    [Arguments]    ${QueryMSISDN}    ${DataExpectMongoDB}
    #Update dateCountMode variable \ ${DataExpectMongoDB_${Testcase}}
    ${DataExpectMongoDB}    JsonUpdatedateCountChangeMode_bo    ${DataExpectMongoDB}
    Log    'ExpectMongo='${DataExpectMongoDB}
    #Connect MongoDB NSB
    Connect To MongoDB    ${DataBaseNameNSB}
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollectionName_tea}    ${QueryMSISDN}
    Comment    VerifyMongoDB    ${Jsondata}    ${DataExpectMongoDB}
    ${Jsondata}    BuiltIn.Convert To String    ${Jsondata}
    ${Jsondata}    Remove String    ${Jsondata}    ${SPACE}
    ${Jsondata}    Replace String    ${Jsondata}    True    true
    ${Jsondata}    Replace String    ${Jsondata}    False    false
    ${Jsondata}    Replace String    ${Jsondata}    '    "
    ${DataExpectMongoDB}    BuiltIn.Convert To String    ${DataExpectMongoDB}
    ${DataExpectMongoDB}    Remove String    ${DataExpectMongoDB}    ${SPACE}
    BuiltIn.Should Be Equal    ${Jsondata}    ${DataExpectMongoDB}
    Log    mongoDB : ${Jsondata}
    Log    Expect : ${DataExpectMongoDB}
    Log    Verify mongoDB Success

Nowdate
    ${CurrentDate}    Get Current Date
    ${CurrentDate}    Remove String    ${CurrentDate}    -
    ${CurrentDate}    Split String    ${CurrentDate}    ${SPACE}
    ${CurrentDate}    BuiltIn.Set Variable    ${CurrentDate}[0]
    [Return]    ${CurrentDate}
