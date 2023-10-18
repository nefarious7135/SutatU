*** Settings ***
Resource          Variable.robot
Resource          ../../Keyword/Common.robot
Resource          ../../Keyword/MongoDB.robot
Resource          ../../Keyword/SecureCRT.robot
Resource          ../../Valiables/CommonValiable/CommonValiable.robot
Resource          ../../Keyword/Stat.robot
*** Test Cases ***
TST_F13_1_1_001
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F13_1_1_001
    #Prepare mongoDB
    PrepareMongoDBSetCoutMode    ${DataBaseNameNSB}    ${CollectionNameqaProfilePaper}    ${QueryMSISDN_${NumTestCase}}    ${InsertMongoDB_${NumTestCase}}
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog}    ${PathLogSetCountMode}
    #Produce kafka : requestSetCountMode
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDeleteMassage_qa.setCountModeRequested}    ${CmdProduce_qa.requestSetCountMode}    ${DataProduce_${NumTestCase}}
    #Consume kafka : setCountModeRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${Consume_qa.setCountModeRequested}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce setCountModeRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.setCountModeRequested_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBSetCountMode    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogSetCountMode}
    #Verify Stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    ${NumTestCase}    nsb-set-count-mode    ${ServiceNameAPP}    Success
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-set-count-mode    20000    F13    ${NumTestCase}    ${DataExpectedqa.setCountModeRequested_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}
    [Teardown]    Close All Connections

TST_F13_1_1_002
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F13_1_1_002
    #Prepare mongoDB
    PrepareMongoDBSetCoutMode    ${DataBaseNameNSB}    ${CollectionNameqaProfilePaper}    ${QueryMSISDN_${NumTestCase}}    ${InsertMongoDB_${NumTestCase}}
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog}    ${PathLogSetCountMode}
    #Produce kafka : requestSetCountMode
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDeleteMassage_qa.setCountModeRequested}    ${CmdProduce_qa.requestSetCountMode}    ${DataProduce_${NumTestCase}}
    #Consume kafka : setCountModeRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${Consume_qa.setCountModeRequested}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce setCountModeRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.setCountModeRequested_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBSetCountMode    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogSetCountMode}
    #Verify Stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    ${NumTestCase}    nsb-set-count-mode    ${ServiceNameAPP}    Success
    VerifyLogDetail    ${DataProduce_${NumTestCase}}    nsb-set-count-mode    20000    F13    ${NumTestCase}    ${DataExpectedqa.setCountModeRequested_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}    ${DataProduce_${NumTestCase}}    ${NumTestCase}    20000
    [Teardown]    Close All Connections

TST_F13_1_1_003
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F13_1_1_003
    #Prepare mongoDB
    #Update dateCountChangeMode : CurrentDate
    ${InsertMongoDB}    JsonUpdatedateCountChangeMode    ${InsertMongoDB_${NumTestCase}}
    #Insert mongoDB
    PrepareMongoDBSetCoutMode    ${DataBaseNameNSB}    ${CollectionNameqaProfilePaper}    ${QueryMSISDN_${NumTestCase}}    ${InsertMongoDB}
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog}    ${PathLogSetCountMode}
    #Produce kafka : requestSetCountMode
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDeleteMassage_qa.setCountModeRequested}    ${CmdProduce_qa.requestSetCountMode}    ${DataProduce_${NumTestCase}}
    #Consume kafka : setCountModeRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${Consume_qa.setCountModeRequested}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce setCountModeRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.setCountModeRequested_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBSetCountMode    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogSetCountMode}
    #Verify Stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    ${NumTestCase}    nsb-set-count-mode    ${ServiceNameAPP}    Success
    [Teardown]    Close All Connections

TST_F13_1_1_004
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F13_1_1_004
    #Prepare mongoDB
    PrepareMongoDBSetCoutMode    ${DataBaseNameNSB}    ${CollectionNameqaProfilePaper}    ${QueryMSISDN_${NumTestCase}}    ${InsertMongoDB_${NumTestCase}}
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog}    ${PathLogSetCountMode}
    #Produce kafka : requestSetCountMode
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDeleteMassage_qa.setCountModeRequested}    ${CmdProduce_qa.requestSetCountMode}    ${DataProduce_${NumTestCase}}
    #Consume kafka : setCountModeRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${Consume_qa.setCountModeRequested}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce setCountModeRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.setCountModeRequested_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBSetCountMode    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogSetCountMode}
    #Verify Stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    ${NumTestCase}    nsb-set-count-mode    ${ServiceNameAPP}    Success
    [Teardown]    Close All Connections

TST_F13_1_1_005
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F13_1_1_005
    #Prepare mongoDB
    PrepareMongoDBSetCoutMode    ${DataBaseNameNSB}    ${CollectionNameqaProfilePaper}    ${QueryMSISDN_${NumTestCase}}    ${InsertMongoDB_${NumTestCase}}
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog}    ${PathLogSetCountMode}
    #Produce kafka : requestSetCountMode
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDeleteMassage_qa.setCountModeRequested}    ${CmdProduce_qa.requestSetCountMode}    ${DataProduce_${NumTestCase}}
    #Consume kafka : setCountModeRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${Consume_qa.setCountModeRequested}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce setCountModeRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.setCountModeRequested_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBSetCountMode    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogSetCountMode}
    #Verify Stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    ${NumTestCase}    nsb-set-count-mode    ${ServiceNameAPP}    Success
    [Teardown]    Close All Connections

TST_F13_1_1_006
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F13_1_1_006
    #Prepare mongoDB
    PrepareMongoDBSetCoutMode    ${DataBaseNameNSB}    ${CollectionNameqaProfilePaper}    ${QueryMSISDN_${NumTestCase}}    ${InsertMongoDB_${NumTestCase}}
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog}    ${PathLogSetCountMode}
    #Produce kafka : requestSetCountMode
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDeleteMassage_qa.setCountModeRequested}    ${CmdProduce_qa.requestSetCountMode}    ${DataProduce_${NumTestCase}}
    #Consume kafka : setCountModeRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${Consume_qa.setCountModeRequested}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce setCountModeRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.setCountModeRequested_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBSetCountMode    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogSetCountMode}
    #Verify Stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    ${NumTestCase}    nsb-set-count-mode    ${ServiceNameAPP}    Success
    [Teardown]    Close All Connections

TST_F13_1_1_007
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F13_1_1_007
    #Prepare mongoDB
    PrepareMongoDBSetCoutMode    ${DataBaseNameNSB}    ${CollectionNameqaProfilePaper}    ${QueryMSISDN_${NumTestCase}}    ${InsertMongoDB_${NumTestCase}}
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog}    ${PathLogSetCountMode}
    #Produce kafka : requestSetCountMode
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDeleteMassage_qa.setCountModeRequested}    ${CmdProduce_qa.requestSetCountMode}    ${DataProduce_${NumTestCase}}
    #Consume kafka : setCountModeRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${Consume_qa.setCountModeRequested}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce setCountModeRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.setCountModeRequested_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBSetCountMode    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogSetCountMode}
    #Verify Stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    ${NumTestCase}    nsb-set-count-mode    ${ServiceNameAPP}    Success
    [Teardown]    Close All Connections

TST_F13_0_1_050
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F13_0_1_050
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog}    ${PathLogSetCountMode}
    #Produce kafka : requestSetCountMode
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDeleteMassage_qa.setCountModeRequested}    ${CmdProduce_qa.requestSetCountMode}    ${DataProduce_${NumTestCase}}
    #Consume kafka : setCountModeRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${Consume_qa.setCountModeRequested}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce setCountModeRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.setCountModeRequested_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogSetCountMode}
    #Verify Stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    ${NumTestCase}    nsb-set-count-mode    ${ServiceNameAPP}    Error_DB40400
    [Teardown]    Close All Connections

TST_F13_0_1_051
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F13_0_1_051
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog}    ${PathLogSetCountMode}
    #Produce kafka : requestSetCountMode
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDeleteMassage_qa.setCountModeRequested}    ${CmdProduce_qa.requestSetCountMode}    ${DataProduce_${NumTestCase}}
    #Consume kafka : setCountModeRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${Consume_qa.setCountModeRequested}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce setCountModeRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.setCountModeRequested_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogSetCountMode}
    #Verify Stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    ${NumTestCase}    nsb-set-count-mode    ${ServiceNameAPP}    Error_Consume
    [Teardown]    Close All Connections

TST_F13_0_1_052
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F13_0_1_052
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog}    ${PathLogSetCountMode}
    #Produce kafka : requestSetCountMode
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDeleteMassage_qa.setCountModeRequested}    ${CmdProduce_qa.requestSetCountMode}    ${DataProduce_${NumTestCase}}
    #Consume kafka : setCountModeRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${Consume_qa.setCountModeRequested}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce setCountModeRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.setCountModeRequested_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogSetCountMode}
    #Verify Stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    ${NumTestCase}    nsb-set-count-mode    ${ServiceNameAPP}    Error_Consume
    [Teardown]    Close All Connections

TST_F13_0_1_053
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F13_0_1_053
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog}    ${PathLogSetCountMode}
    #Produce kafka : requestSetCountMode
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDeleteMassage_qa.setCountModeRequested}    ${CmdProduce_qa.requestSetCountMode}    ${DataProduce_${NumTestCase}}
    #Consume kafka : setCountModeRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${Consume_qa.setCountModeRequested}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce setCountModeRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.setCountModeRequested_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogSetCountMode}
    #Verify Stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    ${NumTestCase}    nsb-set-count-mode    ${ServiceNameAPP}    Error_DB40400
    [Teardown]    Close All Connections

TST_F13_0_1_054
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F13_0_1_054
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog}    ${PathLogSetCountMode}
    #Produce kafka : requestSetCountMode
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDeleteMassage_qa.setCountModeRequested}    ${CmdProduce_qa.requestSetCountMode}    ${DataProduce_${NumTestCase}}
    #Consume kafka : setCountModeRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${Consume_qa.setCountModeRequested}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce setCountModeRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.setCountModeRequested_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogSetCountMode}
    #Verify Stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    ${NumTestCase}    nsb-set-count-mode    ${ServiceNameAPP}    Error_Consume
    [Teardown]    Close All Connections

TST_F13_1_1_055
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F13_1_1_055
    #Prepare mongoDB
    PrepareMongoDBSetCoutMode    ${DataBaseNameNSB}    ${CollectionNameqaProfilePaper}    ${QueryMSISDN_${NumTestCase}}    ${InsertMongoDB_${NumTestCase}}
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog}    ${PathLogSetCountMode}
    #Produce kafka : requestSetCountMode
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDeleteMassage_qa.setCountModeRequested}    ${CmdProduce_qa.requestSetCountMode}    ${DataProduce_${NumTestCase}}
    #Consume kafka : setCountModeRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${Consume_qa.setCountModeRequested}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce setCountModeRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.setCountModeRequested_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBSetCountMode    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogSetCountMode}
    #Verify Stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    ${NumTestCase}    nsb-set-count-mode    ${ServiceNameAPP}    Success
    [Teardown]    Close All Connections

TST_F13_1_1_058
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F13_1_1_058
    #Prepare mongoDB
    PrepareMongoDBSetCoutMode    ${DataBaseNameNSB}    ${CollectionNameqaProfilePaper}    ${QueryMSISDN_${NumTestCase}}    ${InsertMongoDB_${NumTestCase}}
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog}    ${PathLogSetCountMode}
    #Produce kafka : requestSetCountMode
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDeleteMassage_qa.setCountModeRequested}    ${CmdProduce_qa.requestSetCountMode}    ${DataProduce_${NumTestCase}}
    #Consume kafka : setCountModeRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${Consume_qa.setCountModeRequested}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce setCountModeRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.setCountModeRequested_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBSetCountMode    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogSetCountMode}
    #Verify Stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    ${NumTestCase}    nsb-set-count-mode    ${ServiceNameAPP}    Success
    [Teardown]    Close All Connections

TST_F13_1_1_059
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F13_1_1_059
    #Prepare mongoDB
    PrepareMongoDBSetCoutMode    ${DataBaseNameNSB}    ${CollectionNameqaProfilePaper}    ${QueryMSISDN_${NumTestCase}}    ${InsertMongoDB_${NumTestCase}}
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog}    ${PathLogSetCountMode}
    #Produce kafka : requestSetCountMode
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDeleteMassage_qa.setCountModeRequested}    ${CmdProduce_qa.requestSetCountMode}    ${DataProduce_${NumTestCase}}
    #Consume kafka : setCountModeRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${Consume_qa.setCountModeRequested}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce setCountModeRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.setCountModeRequested_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBSetCountMode    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogSetCountMode}
    #Verify Stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    ${NumTestCase}    nsb-set-count-mode    ${ServiceNameAPP}    Success
    [Teardown]    Close All Connections

TST_F13_1_1_060
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F13_1_1_060
    #Prepare mongoDB
    PrepareMongoDBSetCoutMode    ${DataBaseNameNSB}    ${CollectionNameqaProfilePaper}    ${QueryMSISDN_${NumTestCase}}    ${InsertMongoDB_${NumTestCase}}
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog}    ${PathLogSetCountMode}
    #Produce kafka : requestSetCountMode
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDeleteMassage_qa.setCountModeRequested}    ${CmdProduce_qa.requestSetCountMode}    ${DataProduce_${NumTestCase}}
    #Consume kafka : setCountModeRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${Consume_qa.setCountModeRequested}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce setCountModeRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.setCountModeRequested_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBSetCountMode    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogSetCountMode}
    #Verify Stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    ${NumTestCase}    nsb-set-count-mode    ${ServiceNameAPP}    Success
    [Teardown]    Close All Connections

TST_F13_0_1_061
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F13_0_1_061
    #Prepare mongoDB
    PrepareMongoDBSetCoutMode    ${DataBaseNameNSB}    ${CollectionNameqaProfilePaper}    ${QueryMSISDN_${NumTestCase}}    ${InsertMongoDB_${NumTestCase}}
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog}    ${PathLogSetCountMode}
    #Produce kafka : requestSetCountMode
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDeleteMassage_qa.setCountModeRequested}    ${CmdProduce_qa.requestSetCountMode}    ${DataProduce_${NumTestCase}}
    #Consume kafka : setCountModeRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${Consume_qa.setCountModeRequested}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce setCountModeRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.setCountModeRequested_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBSetCountMode    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogSetCountMode}
    #Verify Stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    ${NumTestCase}    nsb-set-count-mode    ${ServiceNameAPP}    Error_DB20000
    [Teardown]    Close All Connections

TST_F13_1_1_062
    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F13_1_1_062
    #Prepare mongoDB
    PrepareMongoDBSetCoutMode    ${DataBaseNameNSB}    ${CollectionNameqaProfilePaper}    ${QueryMSISDN_${NumTestCase}}    ${InsertMongoDB_${NumTestCase}}
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog}    ${PathLogSetCountMode}
    #Produce kafka : requestSetCountMode
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDeleteMassage_qa.setCountModeRequested}    ${CmdProduce_qa.requestSetCountMode}    ${DataProduce_${NumTestCase}}
    #Consume kafka : setCountModeRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${Consume_qa.setCountModeRequested}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    #Check app produce setCountModeRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.setCountModeRequested_${NumTestCase}}
    #Verify mongoDB after Update
    VerifyMongoDBSetCountMode    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogSetCountMode}
    #Verify Stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    ${NumTestCase}    nsb-set-count-mode    ${ServiceNameAPP}    Success
    [Teardown]    Close All Connections

Test
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    Comment    SetLogNull    ${NameCommandFileLog}    ${PathLogSetCountMode}
    Comment    VerifyStatByCommand    TST_F3_1_1_003    nsb-network-status-problem    service-network-status-problem-may    Success
    Comment    VerifyStatSetCountModeUpdate    TST_F13_1_1_001    nsb-set-count-mode    service-set-count-mode    Success
    Comment    VerifyStatSetCountModeUpdate    TST_F13_0_1_050    nsb-set-count-mode    service-set-count-mode    Error_DB40400
    Comment    VerifyStatSetCountModeUpdate    TST_F13_0_1_050    nsb-set-count-mode    service-set-count-mode    Error_Consume
    Comment    VerifyStatSetCountModeUpdate    TST_F2_1_1_001    nsb-network-status    service-network-status-01    Success
    Comment    VerifyStatSetCountModeUpdate    TST_F2_1_1_011    nsb-network-status    service-network-status    Success
    Comment    VerifyStatSetCountModeUpdate    TST_F4_1_1_001    nsb-check-agree-tc    service-check-agree-tc    Success
    Comment    VerifyStatSetCountModeUpdate    TST_F4_0_1_059    nsb-check-agree-tc    service-check-agree-tc    Error_Null
    Comment    VerifyStatSetCountModeUpdate    TST_F5_1_1_001_log    nsb-set-agree-tc    service-set-agree-tc    Success
    Comment    VerifyStatSetCountModeUpdate    TST_F5_0_1_004_log    nsb-set-agree-tc    service-set-agree-tc    Error
    Comment    VerifyStatSetCountModeUpdate    TST_F12_0_1_001    nsb-set-rating    service-set-rating    Error
    Comment    VerifyStatSetCountModeUpdate    TST_F12_1_1_001    nsb-set-rating    service-set-rating    Success
    Comment    VerifyStatSetCountModeUpdate    TST_F11_1_1_007    nsb-check-profile    service-check-profile-Bo    Success
    Comment    VerifyStatSetCountModeUpdate    TST_F11_1_1_001    nsb-check-profile    service-check-profile-Bo    Success_DB40400
    Comment    ${result}    BuiltIn.Set Variable    value|typeline|dos|event|method|status|message|tableName|tableMethod|tableResultCode\n7|typeline|nsb-check-agree-tc|Summary|Summary_ProcessTime|||||\n6|typeline|nsb-check-agree-tc|Send_Request_To_Kafka|Produce_Message_ProcessTime|||qa.checkAgreeTCRequested2|produce|\n1|typeline|nsb-check-agree-tc|Summary|Summary|Error|Error|||\n1|typeline|nsb-check-agree-tc|Send_Request_To_Kafka|Produce_Message|Success|Success|qa.checkAgreeTCRequested2|produce|20000\n1|typeline|nsb-check-agree-tc|Receive_Request_From_Kafka|Consume_Message|Success|Success|qa.requestCheckAgreeTC2|consume|
    Comment    ErrorCheckAgreeTC50000    ${result}

Test2
    Comment    Comment    Log    ${DictA['nsb-set-count-mode']}
    Comment    Comment    Log    ${service-network-status-problem-may['Consume']}
    Comment    ${DOS}    BuiltIn.Set Variable    nsb-network-status-problem
    Comment    Comment    BuiltIn.Log Many    @{service-network-status-problem-may}
    Comment    Comment    BuiltIn.Log    ${service-network-status-problem-may}[Consume]
    Comment    ${ServiceNameAPP}    BuiltIn.Set Variable    service-network-status-problem-may
    Comment    Comment    ${VerStatTopicConsume}    BuiltIn.Set Variable    ${${ServiceNameAPP}}[Consume]
    Comment    Comment    ${VerStatTopicProduce}    BuiltIn.Set Variable    ${ServiceNameAPP}[Produce]
    Comment    Comment    ${VerStatCollectTionDB}    BuiltIn.Set Variable    ${ServiceNameAPP}[MongoDB]
    Comment    Comment    ${ListStat_Problem_SUCCESS}    BuiltIn.Create List    ${DOS}|Receive_Request_From_Kafka|Consume_Message|Success|Success|${ServiceNameAPP}[Consume]|consume|    ${DOS}|Send_Request_To_Mongo|FindOne_${VerStatCollectTionDB}_ProcessTime|||${VerStatCollectTionDB}|read|    ${DOS}|Send_Request_To_Mongo|FindOne_${ServiceNameAPP}[MongoDB]|Success|Success|${ServiceNameAPP}[MongoDB]|read|20000    ${DOS}|Send_Request_To_Mongo|DeleteOne_${ServiceNameAPP}[MongoDB]|Success|Success|${ServiceNameAPP}[MongoDB]|delete|20000    ${DOS}|Send_Request_To_Mongo|DeleteOne_${ServiceNameAPP}[MongoDB]_ProcessTime|||${ServiceNameAPP}[MongoDB]|delete|    ${DOS}|Send_Request_To_Kafka|Produce_Message|Success|Success|${ServiceNameAPP}[Produce]|produce|20000    ${DOS}|Send_Request_To_Kafka|Produce_Message_ProcessTime|||${ServiceNameAPP}[Produce]|produce|    ${DOS}|Summary|Summary_ProcessTime|||||    ${DOS}|Summary|Summary|Success|Success|||
    Comment    Comment    Log Many    ${ListStat_Problem_SUCCESS}
    Comment    &{DictA}    BuiltIn.Create Dictionary    nsb-set-count-mode=Count    nsb-network-status-problem=Problem
    Comment    ${C}    Set Variable    ${DictA['${DOS}']}
    Comment    Log    ${${ServiceNameAPP}}[Consume]
    Comment    #List Stat Success By Commond
    Comment    Comment    ${ListStat_Count_SUCCESS}    BuiltIn.Create List    ${DOS}|Receive_Request_From_Kafka|Consume_Message|Success|Success|qa.requestSetCountMode|consume|    ${DOS}|Send_Request_To_Mongo|FindOne_qaProfilePaper_ProcessTime|||qaProfilePaper|read|    ${DOS}|Send_Request_To_Mongo|FindOne_qaProfilePaper|Success|Success|qaProfilePaper|read|20000    ${DOS}|Send_Request_To_Mongo|Update_qaProfilePaper|Success|Success|qaProfilePaper|update|20000    ${DOS}|Send_Request_To_Mongo|Update_qaProfilePaper_ProcessTime|||qaProfilePaper|update|    ${DOS}|Send_Request_To_Kafka|Produce_Message|Success|Success|qa.setCountModeRequested|produce|20000    ${DOS}|Send_Request_To_Kafka|Produce_Message_ProcessTime|||qa.setCountModeRequested|produce|    ${DOS}|Summary|Summary_ProcessTime|||||    ${DOS}|Summary|Summary|Success|Success|||
    Comment    Comment    ${ListStat_Problem_SUCCESS}    BuiltIn.Create List    ${DOS}|Receive_Request_From_Kafka|Consume_Message|Success|Success|${ServiceNameAPP}[Consume]|consume|    ${DOS}|Send_Request_To_Mongo|FindOne_${ServiceNameAPP}['MongoDB']_ProcessTime|||${ServiceNameAPP}['MongoDB']|read|    ${DOS}|Send_Request_To_Mongo|FindOne_${ServiceNameAPP}['MongoDB']|Success|Success|${ServiceNameAPP}['MongoDB']|read|20000    ${DOS}|Send_Request_To_Mongo|DeleteOne_${ServiceNameAPP}['MongoDB']|Success|Success|${ServiceNameAPP}['MongoDB']|delete|20000    ${DOS}|Send_Request_To_Mongo|DeleteOne_${ServiceNameAPP}['MongoDB']_ProcessTime|||${ServiceNameAPP}['MongoDB']|delete|    ${DOS}|Send_Request_To_Kafka|Produce_Message|Success|Success|${ServiceNameAPP}['Produce']|produce|20000    ${DOS}|Send_Request_To_Kafka|Produce_Message_ProcessTime|||${ServiceNameAPP}['Produce']|produce|    ${DOS}|Summary|Summary_ProcessTime|||||    ${DOS}|Summary|Summary|Success|Success|||
    Comment    ${ListStat_Problem_SUCCESS}    BuiltIn.Create List    ${DOS}|Receive_Request_From_Kafka|Consume_Message|Success|Success|${${ServiceNameAPP}}[Consume]|consume|    ${DOS}|Send_Request_To_Mongo|FindOne_${${ServiceNameAPP}[MongoDB]}_ProcessTime|||${${ServiceNameAPP}[MongoDB]}|read|
    Comment    Comment    Log    ${ServiceNameAPP}[Consume]
    Comment    Comment    Log Many    ${ListStat_Problem_SUCCESS}
    #Connect CRT
    Comment    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    Comment    #TestCase
    Comment    ${NumTestCase}    BuiltIn.Set Variable    TST_F13_1_1_001_Stat
    Comment    CheckStatNull_BK    ${PathLogSetCountMode}    ${NumTestCase}
    Comment    ${ListStat_Count_SUCCESS}    Set Variable    @{ListStat_Count_SUCCESS}
    Comment    Log Many    @{ListStat_Count_SUCCESS}
    #Connect CRT
    Comment    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    Comment    CheckStatNull_BK    ${PathLogSetCountMode}
    Comment    ${ListStat_NetworkStatus_SUCCESS_T}    BuiltIn.Create List    ${ListStat_NetworkStatus_SUCCESS_T}
    Log    ${ListStat_NetworkStatus_SUCCESS_T}

Test3
    Comment    #TestCase
    ${NumTestCase}    BuiltIn.Set Variable    TST_F13_1_1_001
    Comment    #Prepare mongoDB
    Comment    PrepareMongoDBSetCoutMode    ${DataBaseNameNSB}    ${CollectionNameqaProfilePaper}    ${QueryMSISDN_${NumTestCase}}    ${InsertMongoDB_${NumTestCase}}
    Comment    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    Comment    SetLogAndStatNull    ${NameCommandFileLog}    ${PathLogSetCountMode}
    Comment    #Produce kafka : requestSetCountMode
    Comment    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Comment    Produce Kafka    ${CmdDeleteMassage_qa.setCountModeRequested}    ${CmdProduce_qa.requestSetCountMode}    ${EMPTY}
    Comment    Comment    BuiltIn.Sleep    5
    #Consume kafka : setCountModeRequested
    Comment    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Comment    ${ConsumeResult}    CheckStatNull_BK    ${Consume_qa.setCountModeRequested}    ${NumTestCase}
    Log    'consumeResult='${ConsumeResult}
    Log    ${ConsumeResult}
    Comment    #Check app produce setCountModeRequested
    Comment    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.setCountModeRequested_${NumTestCase}}
    Comment    #Verify mongoDB after Update
    Comment    VerifyMongoDBSetCountMode    ${QueryMSISDN_${NumTestCase}}    ${DataExpectMongoDB_${NumTestCase}}
    Comment    #Keep Log
    Comment    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    Comment    CheckStatNull_BK    ${NameCommandFileLog}    ${NumTestCase}    ${PathLogSetCountMode}
    Comment    #Verify Stat
    Comment    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    Comment    VerifyStatByCommand    ${NumTestCase}    nsb-set-count-mode    ${ServiceNameAPP}    Success
    CheckStatNull    /LOCAL-NAS/livingnetwork/nsb/log_mfaf/TestResult/F13/TST_F13_1_1_001/TST_F13_1_1_001.stat

TestJSON
    ${Json}    BuiltIn.Set Variable    {"action":"[CONSUMING]","actionDescription":"start consuming event: topic qa.requestSetCountMode, partition 0, offset 207","appName":"mfaf","broker":"content","channel":"web","componentName":"nsb-set-count-mode","componentVersion":"No Version Provided","device":"324897098709872103948709,324897098709872103948710","instance":"DMASTERSQA0001","level":"info","message":"{"msisdn":"0812312312"}","originateServiceName":"Event source","public":"0812312312","recordName":"qa.requestSetCountMode","recordType":"detail","sessionId":"234709834750982345","subAction":"N/A","timestamp":"2023-09-19 17:03:52.588","transactionId":"TST_F13_1_1_001","useCase":"test","useCaseStep":"4","user":"xsewkd03keo30dc"}
    ${message}    Get Value From Json    ${Json}    $..action
    Log    ${message}
*** Keywords ***
PrepareMongoDBSetCoutMode
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

JsonUpdatedateCountChangeMode
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

VerifyMongoDBSetCountMode
    [Arguments]    ${QueryMSISDN}    ${DataExpectMongoDB}
    #Update dateCountMode variable \ ${DataExpectMongoDB_${Testcase}}
    ${DataExpectMongoDB}    JsonUpdatedateCountChangeMode    ${DataExpectMongoDB}
    Log    ${DataExpectMongoDB}
    #Connect MongoDB NSB
    Connect To MongoDB    ${DataBaseNameNSB}
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollectionNameqaProfilePaper}    ${QueryMSISDN}
    Comment    VerifyMongoDB    ${Jsondata}    ${DataExpectMongoDB}
    ${Jsondata}    BuiltIn.Convert To String    ${Jsondata}
    ${Jsondata}    Remove String    ${Jsondata}    ${SPACE}
    ${Jsondata}    Replace String    ${Jsondata}    True    true
    ${Jsondata}    Replace String    ${Jsondata}    False    false
    ${Jsondata}    Replace String    ${Jsondata}    '    "
    BuiltIn.Should Be Equal    ${Jsondata}    ${DataExpectMongoDB}
    Log    mongoDB : ${Jsondata}
    Log    Expect : ${DataExpectMongoDB}
    Log    Verify mongoDB Success

VerifyStatSetCountMode_BK
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
    ...
    ...    F2 : Success หรือ Success_DB40400 หรือ Error_Missing_Invalid
    ...
    ...    F3 : Success หรือ Error
    ...
    ...    F4 : Success หรือ Error_DB40400 หรือ Error_Consume หรือ Error_DB40400 หรือ Error_Null
    ...
    ...    F5 : Success หรือ Error
    ...
    ...    F11 : Success หรือ Error หรือ Success_DB40400 หรือ Error_DB40400
    ...
    ...    F12 : Success หรือ Error
    ...
    ...    F13 : Success หรือ Error_Consume \ หรือ Error_DB40400
    #เช็ค path ปัจจุบัน
    ${pwd}    SSHLibrary.Execute Command    pwd
    log    ${pwd}
    #Find : F/Number_Testcase
    ${F}    String.Split String    ${Number_TestCase}    _
    Comment    ${F}    String.Fetch From Right    ${F}[1]    _
    ${F}    BuiltIn.Set Variable    ${F}[1]
    Log    ${F}
    ${result}    SSHLibrary.Execute Command    less /LOCAL-NAS/livingnetwork/nsb/log_mfaf/TestResult/${F}/${Number_TestCase}/${Number_TestCase}.stat
    Log    ${result}
    ${Amount}    BuiltIn.Set Variable    0
    ${Status}    String.Convert To Upper Case    ${Status}
    ${C}    BuiltIn.Set Variable    ${DefineListDOS['${DOS_Stat}']}
    IF    "${C}"=="NetworkStatus"
        IF    "${Status}"=="SUCCESS"
    #List Stat Success By Commond
        ${ListStat_NetworkStatus_SUCCESS}    BuiltIn.Create List    ${DOS_Stat}|Receive_Request_From_Kafka|Consume_Message|Success|Success|${${ServiceNameAPP}}[Consume]|consume|    ${DOS_Stat}|Send_Request_To_Mongo|FindOne_${${ServiceNameAPP}}[MongoDBProfilePaper]|Success|Success|${${ServiceNameAPP}}[MongoDBProfilePaper]|read|20000    ${DOS_Stat}|Send_Request_To_Mongo|FindOne_${${ServiceNameAPP}}[MongoDBProfilePaper]_ProcessTime|||${${ServiceNameAPP}}[MongoDBProfilePaper]|read|    ${DOS_Stat}|Send_Request_To_Mongo|FindOne_${${ServiceNameAPP}}[MongoDBPerformanceLevel]|Success|Success|${${ServiceNameAPP}}[MongoDBPerformanceLevel]|read|20000    ${DOS_Stat}|Send_Request_To_Mongo|FindOne_${${ServiceNameAPP}}[MongoDBPerformanceLevel]_ProcessTime|||${${ServiceNameAPP}}[MongoDBPerformanceLevel]|read|    ${DOS_Stat}|Send_Request_To_Mongo|FindOne_${${ServiceNameAPP}}[MongoDBNetworkQualityStatus]|Success|Success|${${ServiceNameAPP}}[MongoDBNetworkQualityStatus]|read|20000    ${DOS_Stat}|Send_Request_To_Mongo|FindOne_${${ServiceNameAPP}}[MongoDBNetworkQualityStatus]_ProcessTime|||${${ServiceNameAPP}}[MongoDBNetworkQualityStatus]|read|    ${DOS_Stat}|Send_Request_To_Mongo|Update_${${ServiceNameAPP}}[MongoDBNetworkStatusPaper]|Success|Success|${${ServiceNameAPP}}[MongoDBNetworkStatusPaper]|update|20000    ${DOS_Stat}|Send_Request_To_Mongo|Update_${${ServiceNameAPP}}[MongoDBNetworkStatusPaper]_ProcessTime|||${${ServiceNameAPP}}[MongoDBNetworkStatusPaper]|update|    ${DOS_Stat}|Send_Request_To_Kafka|Produce_Message|Success|Success|${${ServiceNameAPP}}[Produce]|produce|20000    ${DOS_Stat}|Send_Request_To_Kafka|Produce_Message_ProcessTime|||${${ServiceNameAPP}}[Produce]|produce|    ${DOS_Stat}|Summary|Summary|Success|Success|||    ${DOS_Stat}|Summary|Summary_ProcessTime|||||
        END
    ELSE IF    "${C}"=="CheckProfile"
        ${ListStat_CheckProfile_SUCCESS_DB40400}    BuiltIn.Create List    ${DOS_Stat}|Receive_Request_From_Kafka|Consume_Message|Success|Success|${${ServiceNameAPP}}[Consume]|consume|    ${DOS_Stat}|Send_Request_To_Server|POST|Success|Success||POST|20000    ${DOS_Stat}|Send_Request_To_Server|POST_ProcessTime||||POST|    ${DOS_Stat}|Send_Request_To_Mongo|FindOne_${${ServiceNameAPP}}[MongoDB]|Error|mongo: no documents in result|${${ServiceNameAPP}}[MongoDB]|read|40400    ${DOS_Stat}|Send_Request_To_Mongo|FindOne_${${ServiceNameAPP}}[MongoDB]_ProcessTime|||${${ServiceNameAPP}}[MongoDB]|read|    ${DOS_Stat}|Send_Request_To_Mongo|Update_${${ServiceNameAPP}}[MongoDB]|Success|Success|${${ServiceNameAPP}}[MongoDB]|update|20000    ${DOS_Stat}|Send_Request_To_Mongo|Update_${${ServiceNameAPP}}[MongoDB]_ProcessTime|||${${ServiceNameAPP}}[MongoDB]|update|    ${DOS_Stat}|Send_Request_To_Kafka|Produce_Message|Success|Success|${${ServiceNameAPP}}[Produce]|produce|20000    ${DOS_Stat}|Send_Request_To_Kafka|Produce_Message_ProcessTime|||${${ServiceNameAPP}}[Produce]|produce|    ${DOS_Stat}|Summary|Summary|Success|Success|||    ${DOS_Stat}|Summary|Summary_ProcessTime|||||
        ${ListStat_CheckProfile_SUCCESS}    BuiltIn.Create List    ${DOS_Stat}|Receive_Request_From_Kafka|Consume_Message|Success|Success|${${ServiceNameAPP}}[Consume]|consume|    ${DOS_Stat}|Send_Request_To_Server|POST|Success|Success||POST|20000    ${DOS_Stat}|Send_Request_To_Server|POST_ProcessTime||||POST|    ${DOS_Stat}|Send_Request_To_Mongo|FindOne_${${ServiceNameAPP}}[MongoDB]|Success|Success|${${ServiceNameAPP}}[MongoDB]|read|20000    ${DOS_Stat}|Send_Request_To_Mongo|FindOne_${${ServiceNameAPP}}[MongoDB]_ProcessTime|||${${ServiceNameAPP}}[MongoDB]|read|    ${DOS_Stat}|Send_Request_To_Mongo|Update_${${ServiceNameAPP}}[MongoDB]|Success|Success|${${ServiceNameAPP}}[MongoDB]|update|20000    ${DOS_Stat}|Send_Request_To_Mongo|Update_${${ServiceNameAPP}}[MongoDB]_ProcessTime|||${${ServiceNameAPP}}[MongoDB]|update|    ${DOS_Stat}|Send_Request_To_Kafka|Produce_Message|Success|Success|${${ServiceNameAPP}}[Produce]|produce|20000    ${DOS_Stat}|Send_Request_To_Kafka|Produce_Message_ProcessTime|||${${ServiceNameAPP}}[Produce]|produce|    ${DOS_Stat}|Summary|Summary|Success|Success|||    ${DOS_Stat}|Summary|Summary_ProcessTime|||||
        ${ListStat_CheckProfile_ERROR_MISSING_INVALID}    BuiltIn.Create List    ${DOS_Stat}|Receive_Request_From_Kafka|Consume_Message|Success|Success|${${ServiceNameAPP}}[Consume]|consume|    ${DOS_Stat}|Send_Request_To_Mongo|Update_${${ServiceNameAPP}}[MongoDBNetworkStatusPaper]|Success|Success|${${ServiceNameAPP}}[MongoDBNetworkStatusPaper]|update|20000    ${DOS_Stat}|Send_Request_To_Mongo|Update_${${ServiceNameAPP}}[MongoDBNetworkStatusPaper]_ProcessTime|||${${ServiceNameAPP}}[MongoDBNetworkStatusPaper]|update|    ${DOS_Stat}|Send_Request_To_Kafka|Produce_Message|Success|Success|${${ServiceNameAPP}}[Produce]|produce|20000    ${DOS_Stat}|Send_Request_To_Kafka|Produce_Message_ProcessTime|||${${ServiceNameAPP}}[Produce]|produce|    ${DOS_Stat}|Summary|Summary|Success|Success|||    ${DOS_Stat}|Summary|Summary_ProcessTime|||||
    ELSE
        IF    "${Status}"=="SUCCESS"
        ${ListStat_Count_SUCCESS}    BuiltIn.Create List    ${DOS_Stat}|Receive_Request_From_Kafka|Consume_Message|Success|Success|${${ServiceNameAPP}}[Consume]|consume|    ${DOS_Stat}|Send_Request_To_Mongo|FindOne_${${ServiceNameAPP}}[MongoDB]_ProcessTime|||${${ServiceNameAPP}}[MongoDB]|read|    ${DOS_Stat}|Send_Request_To_Mongo|FindOne_${${ServiceNameAPP}}[MongoDB]|Success|Success|${${ServiceNameAPP}}[MongoDB]|read|20000    ${DOS_Stat}|Send_Request_To_Mongo|Update_${${ServiceNameAPP}}[MongoDB]|Success|Success|${${ServiceNameAPP}}[MongoDB]|update|20000    ${DOS_Stat}|Send_Request_To_Mongo|Update_${${ServiceNameAPP}}[MongoDB]_ProcessTime|||${${ServiceNameAPP}}[MongoDB]|update|    ${DOS_Stat}|Send_Request_To_Kafka|Produce_Message|Success|Success|${${ServiceNameAPP}}[Produce]|produce|20000    ${DOS_Stat}|Send_Request_To_Kafka|Produce_Message_ProcessTime|||${${ServiceNameAPP}}[Produce]|produce|    ${DOS_Stat}|Summary|Summary_ProcessTime|||||    ${DOS_Stat}|Summary|Summary|Success|Success|||
        ${ListStat_Problem_SUCCESS}    BuiltIn.Create List    ${DOS_Stat}|Receive_Request_From_Kafka|Consume_Message|Success|Success|${${ServiceNameAPP}}[Consume]|consume|    ${DOS_Stat}|Send_Request_To_Mongo|FindOne_${${ServiceNameAPP}}[MongoDB]_ProcessTime|||${${ServiceNameAPP}}[MongoDB]|read|    ${DOS_Stat}|Send_Request_To_Mongo|FindOne_${${ServiceNameAPP}}[MongoDB]|Success|Success|${${ServiceNameAPP}}[MongoDB]|read|20000    ${DOS_Stat}|Send_Request_To_Mongo|DeleteOne_${${ServiceNameAPP}}[MongoDB]|Success|Success|${${ServiceNameAPP}}[MongoDB]|delete|20000    ${DOS_Stat}|Send_Request_To_Mongo|DeleteOne_${${ServiceNameAPP}}[MongoDB]_ProcessTime|||${${ServiceNameAPP}}[MongoDB]|delete|    ${DOS_Stat}|Send_Request_To_Kafka|Produce_Message|Success|Success|${${ServiceNameAPP}}[Produce]|produce|20000    ${DOS_Stat}|Send_Request_To_Kafka|Produce_Message_ProcessTime|||${${ServiceNameAPP}}[Produce]|produce|    ${DOS_Stat}|Summary|Summary_ProcessTime|||||    ${DOS_Stat}|Summary|Summary|Success|Success|||
        ${ListStat_AgreeTC_SUCCESS}    BuiltIn.Create List    ${DOS_Stat}|Receive_Request_From_Kafka|Consume_Message|Success|Success|${${ServiceNameAPP}}[Consume]|consume|    ${DOS_Stat}|Send_Request_To_Mongo|FindOne_${${ServiceNameAPP}}[MongoDB]|Success|Success|${${ServiceNameAPP}}[MongoDB]|read|20000    ${DOS_Stat}|Send_Request_To_Mongo|FindOne_${${ServiceNameAPP}}[MongoDB]_ProcessTime|||${${ServiceNameAPP}}[MongoDB]|read|    ${DOS_Stat}|Send_Request_To_Kafka|Produce_Message|Success|Success|${${ServiceNameAPP}}[Produce]|produce|20000    ${DOS_Stat}|Send_Request_To_Kafka|Produce_Message_ProcessTime|||${${ServiceNameAPP}}[Produce]|produce|    ${DOS_Stat}|Summary|Summary|Success|Success|||    ${DOS_Stat}|Summary|Summary_ProcessTime|||||
        ${ListStat_SetAgree_SUCCESS}    BuiltIn.Create List    ${DOS_Stat}|Receive_Request_From_Kafka|Consume_Message|Success|Success|${${ServiceNameAPP}}[Consume]|consume|    ${DOS_Stat}|Send_Request_To_Mongo|Update_${${ServiceNameAPP}}[MongoDB]|Success|Success|${${ServiceNameAPP}}[MongoDB]|update|20000    ${DOS_Stat}|Send_Request_To_Mongo|Update_${${ServiceNameAPP}}[MongoDB]_ProcessTime|||${${ServiceNameAPP}}[MongoDB]|update|    ${DOS_Stat}|Send_Request_To_Kafka|Produce_Message|Success|Success|${${ServiceNameAPP}}[Produce]|produce|20000    ${DOS_Stat}|Send_Request_To_Kafka|Produce_Message_ProcessTime|||${${ServiceNameAPP}}[Produce]|produce|    ${DOS_Stat}|Summary|Summary|Success|Success|||    ${DOS_Stat}|Summary|Summary_ProcessTime|||||
        ${ListStat_Rating_SUCCESS}    BuiltIn.Create List    ${DOS_Stat}|Receive_Request_From_Kafka|Consume_Message|Success|Success|${${ServiceNameAPP}}[Consume]|consume|    ${DOS_Stat}|Send_Request_To_Mongo|Update_${${ServiceNameAPP}}[MongoDB]|Success|Success|${${ServiceNameAPP}}[MongoDB]|update|20000    ${DOS_Stat}|Send_Request_To_Mongo|Update_${${ServiceNameAPP}}[MongoDB]_ProcessTime|||${${ServiceNameAPP}}[MongoDB]|update|    ${DOS_Stat}|Send_Request_To_Kafka|Produce_Message|Success|Success|${${ServiceNameAPP}}[Produce]|produce|20000    ${DOS_Stat}|Send_Request_To_Kafka|Produce_Message_ProcessTime|||${${ServiceNameAPP}}[Produce]|produce|    ${DOS_Stat}|Summary|Summary|Success|Success|||    ${DOS_Stat}|Summary|Summary_ProcessTime|||||
        ELSE
        ${ListStat_Count_ERROR_DB40400}    BuiltIn.Create List    ${DOS_Stat}|Receive_Request_From_Kafka|Consume_Message|Success|Success|${${ServiceNameAPP}}[Consume]|consume|    ${DOS_Stat}|Send_Request_To_Mongo|FindOne_${${ServiceNameAPP}}[MongoDB]_ProcessTime|||${${ServiceNameAPP}}[MongoDB]|read|    ${DOS_Stat}|Send_Request_To_Mongo|FindOne_${${ServiceNameAPP}}[MongoDB]|Error|mongo: no documents in result|${${ServiceNameAPP}}[MongoDB]|read|40400    ${DOS_Stat}|Send_Request_To_Kafka|Produce_Message|Success|Success|${${ServiceNameAPP}}[Produce]|produce|20000    ${DOS_Stat}|Send_Request_To_Kafka|Produce_Message_ProcessTime|||${${ServiceNameAPP}}[Produce]|produce|    ${DOS_Stat}|Summary|Summary_ProcessTime|||||    ${DOS_Stat}|Summary|Summary|Error|Error|||
        ${ListStat_Count_ERROR_CONSUME}    BuiltIn.Create List    ${DOS_Stat}|Receive_Request_From_Kafka|Consume_Message|Success|Success|${${ServiceNameAPP}}[Consume]|consume|    ${DOS_Stat}|Send_Request_To_Kafka|Produce_Message|Success|Success|${${ServiceNameAPP}}[Produce]|produce|20000    ${DOS_Stat}|Send_Request_To_Kafka|Produce_Message_ProcessTime|||${${ServiceNameAPP}}[Produce]|produce|    ${DOS_Stat}|Summary|Summary_ProcessTime|||||    ${DOS_Stat}|Summary|Summary|Error|Error|||
        ${ListStat_Count_ERROR}    BuiltIn.Create List    ${DOS_Stat}|Receive_Request_From_Kafka|Consume_Message|Success|Success|${${ServiceNameAPP}}[Consume]|consume|    ${DOS_Stat}|Send_Request_To_Mongo|FindOne_${${ServiceNameAPP}}[MongoDB]_ProcessTime|||${${ServiceNameAPP}}[MongoDB]|read|    ${DOS_Stat}|Send_Request_To_Mongo|FindOne_${${ServiceNameAPP}}[MongoDB]|Success|Success|${${ServiceNameAPP}}[MongoDB]|read|20000    ${DOS_Stat}|Send_Request_To_Mongo|Update_${${ServiceNameAPP}}[MongoDB]|Success|Success|${${ServiceNameAPP}}[MongoDB]|update|20000    ${DOS_Stat}|Send_Request_To_Mongo|Update_${${ServiceNameAPP}}[MongoDB]_ProcessTime|||${${ServiceNameAPP}}[MongoDB]|update|    ${DOS_Stat}|Send_Request_To_Kafka|Produce_Message|Success|Success|${${ServiceNameAPP}}[Produce]|produce|20000    ${DOS_Stat}|Send_Request_To_Kafka|Produce_Message_ProcessTime|||${${ServiceNameAPP}}[Produce]|produce|    ${DOS_Stat}|Summary|Summary_ProcessTime|||||    ${DOS_Stat}|Summary|Summary|Error|Error|||
        ${ListStat_Rating_ERROR}    BuiltIn.Create List    ${DOS_Stat}|Receive_Request_From_Kafka|Consume_Message|Success|Success|${${ServiceNameAPP}}[Consume]|consume|    ${DOS_Stat}|Send_Request_To_Kafka|Produce_Message|Success|Success|${${ServiceNameAPP}}[Produce]|produce|20000    ${DOS_Stat}|Send_Request_To_Kafka|Produce_Message_ProcessTime|||${${ServiceNameAPP}}[Produce]|produce|    ${DOS_Stat}|Summary|Summary|Error|Error|||    ${DOS_Stat}|Summary|Summary_ProcessTime|||||
        ${ListStat_SetAgree_ERROR}    BuiltIn.Create List    ${DOS_Stat}|Receive_Request_From_Kafka|Consume_Message|Success|Success|${${ServiceNameAPP}}[Consume]|consume|    ${DOS_Stat}|Send_Request_To_Kafka|Produce_Message|Success|Success|${${ServiceNameAPP}}[Produce]|produce|20000    ${DOS_Stat}|Send_Request_To_Kafka|Produce_Message_ProcessTime|||${${ServiceNameAPP}}[Produce]|produce|    ${DOS_Stat}|Summary|Summary|Error|Error|||    ${DOS_Stat}|Summary|Summary_ProcessTime|||||
        ${ListStat_AgreeTC_ERROR_DB40400}    BuiltIn.Create List    ${DOS_Stat}|Receive_Request_From_Kafka|Consume_Message|Success|Success|${${ServiceNameAPP}}[Consume]|consume|    ${DOS_Stat}|Send_Request_To_Mongo|FindOne_${${ServiceNameAPP}}[MongoDB]|Error|mongo: no documents in result|${${ServiceNameAPP}}[MongoDB]|read|40400    ${DOS_Stat}|Send_Request_To_Mongo|FindOne_${${ServiceNameAPP}}[MongoDB]_ProcessTime|||${${ServiceNameAPP}}[MongoDB]|read|    ${DOS_Stat}|Send_Request_To_Kafka|Produce_Message|Success|Success|${${ServiceNameAPP}}[Produce]|produce|20000    ${DOS_Stat}|Send_Request_To_Kafka|Produce_Message_ProcessTime|||${${ServiceNameAPP}}[Produce]|produce|    ${DOS_Stat}|Summary|Summary|Error|Error|||    ${DOS_Stat}|Summary|Summary_ProcessTime|||||
        ${ListStat_AgreeTC_ERROR_CONSUME}    BuiltIn.Create List    ${DOS_Stat}|Receive_Request_From_Kafka|Consume_Message|Success|Success|${${ServiceNameAPP}}[Consume]|consume|    ${DOS_Stat}|Send_Request_To_Kafka|Produce_Message|Success|Success|${${ServiceNameAPP}}[Produce]|produce|20000    ${DOS_Stat}|Send_Request_To_Kafka|Produce_Message_ProcessTime|||${${ServiceNameAPP}}[Produce]|produce|    ${DOS_Stat}|Summary|Summary|Error|Error|||    ${DOS_Stat}|Summary|Summary_ProcessTime|||||
        ${ListStat_AgreeTC_ERROR_NULL}    BuiltIn.Create List    ${DOS_Stat}|Receive_Request_From_Kafka|Consume_Message|Success|Success|${${ServiceNameAPP}}[Consume]|consume|    ${DOS_Stat}|Summary|Summary|Error|Error|||    ${DOS_Stat}|Summary|Summary_ProcessTime|||||
        ${ListStat_Problem_ERROR}    BuiltIn.Create List    ${DOS_Stat}|Receive_Request_From_Kafka|Consume_Message|Success|Success|${${ServiceNameAPP}}[Consume]|consume|    ${DOS_Stat}|Send_Request_To_Mongo|FindOne_${${ServiceNameAPP}}[MongoDB]_ProcessTime|||${${ServiceNameAPP}}[MongoDB]|read|    ${DOS_Stat}|Send_Request_To_Mongo|FindOne_${${ServiceNameAPP}}[MongoDB]|Error|mongo: no documents in result|${${ServiceNameAPP}}[MongoDB]|read|40400    ${DOS_Stat}|Send_Request_To_Mongo|DeleteOne_${${ServiceNameAPP}}[MongoDB]|Success|Success|${${ServiceNameAPP}}[MongoDB]|delete|20000    ${DOS_Stat}|Send_Request_To_Mongo|DeleteOne_${${ServiceNameAPP}}[MongoDB]_ProcessTime|||${${ServiceNameAPP}}[MongoDB]|delete|    ${DOS_Stat}|Send_Request_To_Kafka|Produce_Message|Success|Success|${${ServiceNameAPP}}[Produce]|produce|20000    ${DOS_Stat}|Send_Request_To_Kafka|Produce_Message_ProcessTime|||${${ServiceNameAPP}}[Produce]|produce|    ${DOS_Stat}|Summary|Summary_ProcessTime|||||    ${DOS_Stat}|Summary|Summary|Error|Error|||
        END
    END
    ${CountList}    BuiltIn.Get Length    ${ListStat_${C}_${Status}}
    Log    ${CountList}
    #Check Stat
    FOR    ${i}    IN RANGE    ${CountList}
        Log    ${ListStat_${C}_${Status}}[${i}]
        ${Result_Status}    BuiltIn.Run Keyword And Return Status    BuiltIn.Should Contain    ${result}    ${ListStat_${C}_${Status}}[${i}]
            IF    "${Result_Status}"=="True"
            ${Amount}    BuiltIn.Evaluate    ${Amount}+1
            Log    ${Amount}
            END
    END
    #Check Amount
    BuiltIn.Should Be Equal As Integers    ${CountList}    ${Amount}

SetLogAndStatNull
    [Arguments]    ${Command_Name}    ${pathLog}
    Comment    ${CurrentDate}    Get Current Date
    Comment    ${CurrentDate}    Split String    ${CurrentDate}    ${SPACE}
    Comment    ${CurrentDate}    BuiltIn.Set Variable    ${CurrentDate}[0]
    Comment    Comment    Log    ${CurrentDate}
    Comment    ${filename}    SSHLibrary.Execute Command    find ${pathLog}/log/ -type f -newermt "${CurrentDate}" | grep ${Command_Name} |cut -d '/' -f8    #find file : edit current day
    Comment    log    ${filename}
    Comment    IF    "${filename}" != ""
    Comment    SSHLibrary.Execute Command    echo "" > ${pathLog}/log/${filename}
    Comment    END
    Comment    #Set Stat Null
    Comment    ${filename_Stat}    SSHLibrary.Execute Command    find ${pathLog}/stat/ -type f \ -newermt "${CurrentDate}"
    Comment    IF    "${filename_Stat}" != ""
    Comment    SSHLibrary.Execute Command    echo "" > ${filename_Stat}
    Comment    END
    #เช็ค path ปัจจุบัน
    ${pwd}    SSHLibrary.Execute Command    pwd
    log    ${pwd}
    #run คำสัง consume
    ${stdin}    SSHLibrary.Write    ${cmdConsume}    loglevel=DEBUG
    sleep    5
    #read ข้อมูลที่ได้จากการ consume
    ${output}=    SSHLibrary.Read    loglevel=DEBUG    # Shown in the console due to loglevel
    #ตัดค่า > ที่ติดมากับข้อมูล
    ${output}    String.Replace String    ${output}
        ${EMPTY}
    ${output}    String.Replace String    ${output}
        ${EMPTY}
    Comment    ${output}    String.Replace String    ${output}    ${SPACE}    ${EMPTY}
    ${output}    String.Replace String    ${output}        ${EMPTY}
    ${output}    String.Replace String    ${output}    [?2004l    ${EMPTY}
    log    ${output}
    #เขียนข้อมูลที่ read มาได้จาก consume ลงไฟล์
    SSHLibrary.Execute Command    echo '${output}' >${pwd}/ConsumeResult/${ConsumeResultFile}.txt
    BuiltIn.Set Global Variable    ${ConsumeResult}    ${output}

CheckStatNull_BK
    [Arguments]    ${cmdConsume}    ${ConsumeResultFile}
    ${output}    BuiltIn.Wait Until Keyword Succeeds    12x    5s    CheckConsumeNull2    ${cmdConsume}    ${ConsumeResultFile}
    [Return]    ${output}

CheckConsumeNull2
    [Arguments]    ${cmdConsume}    ${ConsumeResultFile}
    [Documentation]    ${cmdConsume} --> คำสั่ง consume
    ...    ${ConsumeResultFile} --> ชื่อไฟล์ที่จะเก็บข้อมูล consume
    ...
    ...    keyword นี้จะ consume ข้อมูลมา read และเก็บข้อมูล write ใส่ไฟล์เก็บไว้
    ...
    ...    return ข้อมูลที่ได้กลับไป (${output}) --> เรียกใช้โดย ${ConsumeResult}
    #เช็ค path ปัจจุบัน
    ${pwd}    SSHLibrary.Execute Command    pwd
    log    ${pwd}
    #run คำสัง consume
    ${stdin}    SSHLibrary.Write    ${cmdConsume}    loglevel=DEBUG
    sleep    5
    #read ข้อมูลที่ได้จากการ consume
    ${output}=    SSHLibrary.Read    loglevel=DEBUG    # Shown in the console due to loglevel
    #ตัดค่า > ที่ติดมากับข้อมูล
    ${output}    String.Replace String    ${output}    \r    ${EMPTY}
    ${output}    String.Replace String    ${output}    \n    ${EMPTY}
    Comment    ${output}    String.Replace String    ${output}    ${SPACE}    ${EMPTY}
    ${output}    String.Replace String    ${output}        ${EMPTY}
    ${output}    String.Replace String    ${output}    [?2004l    ${EMPTY}
    log    ${output}
    BuiltIn.Should Contain    ${output}    {
    #เขียนข้อมูลที่ read มาได้จาก consume ลงไฟล์
    SSHLibrary.Execute Command    echo '${output}' >${pwd}/ConsumeResult/${ConsumeResultFile}.txt
    BuiltIn.Set Global Variable    ${ConsumeResult}    ${output}
    [Return]    ${output}

VerifyStatSetCountModeUpdate
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
    ...
    ...    F2 : Success หรือ Error หรือ Success_DB40400 หรือ Error_DB40400
    ...    F3 : Success หรือ Error
    ...    F4 : Success หรือ Error
    ...    F5 : Success หรือ Error
    ...    F11 : Success หรือ Error หรือ Success_DB40400 หรือ Error_DB40400
    ...    F12 : Success หรือ Error
    ...    F13 : Success หรือ Error_Consume \ หรือ Error_DB40400
    #เช็ค path ปัจจุบัน
    ${pwd}    SSHLibrary.Execute Command    pwd
    log    ${pwd}
    #Find : F/Number_Testcase
    ${F}    Split String    ${Number_TestCase}    _
    ${F}    Fetch From Right    ${F}[1]    _
    Log    ${F}
    ${result}    SSHLibrary.Execute Command    less /LOCAL-NAS/livingnetwork/nsb/log_mfaf/TestResult/${F}/${Number_TestCase}/${Number_TestCase}.stat
    Log    ${result}
    ${DomainService}    Set Variable    ${DefineListDOS['${DOS_Stat}']}
    Log    ${DomainService}
    ${Status}    String.Convert To Upper Case    ${Status}
    IF    "${DomainService}"=="SetCountMode"
    StatSetCountMode    ${result}    ${DOS_Stat}    ${ServiceNameAPP}    ${Status}
    ELSE IF    "${DomainService}"=="CheckAgreeTC"
    StatCheckAgreeTC    ${result}    ${DOS_Stat}    ${ServiceNameAPP}    ${Status}
    ELSE IF    "${DomainService}"=="NetworkStatus"
    StatNetworkStatus    ${result}    ${DOS_Stat}    ${ServiceNameAPP}    ${Status}
    ELSE IF    "${DomainService}"=="NetworkStatusProblem"
    StatNetworkStatusProblem    ${result}    ${DOS_Stat}    ${ServiceNameAPP}    ${Status}
    ELSE IF    "${DomainService}"=="SetAgreeTC"
    StatSetAgreeTC    ${result}    ${DOS_Stat}    ${ServiceNameAPP}    ${Status}
    ELSE IF    "${DomainService}"=="CheckProfile"
    StatCheckProfile    ${result}    ${DOS_Stat}    ${ServiceNameAPP}    ${Status}
    END
