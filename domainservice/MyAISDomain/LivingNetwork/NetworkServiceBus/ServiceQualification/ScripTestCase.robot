*** Settings ***
Resource          ../../Keyword/Common.robot
Resource          ../../Keyword/MongoDB.robot
Resource          ../../Keyword/SecureCRT.robot
Resource          ../../Valiables/CommonValiable/CommonValiable.robot
Resource          ../ServiceQualification/Valiable.robot

*** Test Cases ***
TST_F1_1_1_001
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCmdFileLog_ServiceQualification_10.138.42.190}    ${PathLogServiceQualification}
    #Set AC Response
    SetMockupResponse    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_default_success}
    #reload config app
    SSHLibrary.Execute Command    ${cmdReloadConf}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_serviceQualificationRequested_10.138.42.190}    ${CmdProduce_serviceQualification_10.138.42.190}    ${DataProduce_TST_F1_1_1_001}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_serviceQualificationRequested_10.138.42.190}    TST_F1_1_1_001
    Log    'consumeResult='${ConsumeResult}
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F1_1_1_001}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCmdFileLog_ServiceQualification_10.138.42.190}    TST_F1_1_1_001    ${PathLogServiceQualification}
    [Teardown]    Close All Connections

TST_F1_1_1_002
    #หา msisdn ใน MongoDB
    PrepareMongoDB_bo    ${DataBaseNameNSB}    ${CollectionNameLivingNetwork5GModePackage_Bo}    {"msisdn" : "66836318802"}	    ${MongoDBPrepare_TST_F1_1_1_002}
    Sleep    5
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCmdFileLog_ServiceQualification_10.138.42.190}    ${PathLogServiceQualification}
    #Set AC Response
    SetMockupResponse    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_default_success}
    #reload config app
    SSHLibrary.Execute Command    ${cmdReloadConf}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_serviceQualificationRequested_10.138.42.190}    ${CmdProduce_serviceQualification_10.138.42.190}    ${DataProduce_TST_F1_1_1_002}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_serviceQualificationRequested_10.138.42.190}    TST_F1_1_1_002
    Log    'consumeResult='${ConsumeResult}
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F1_1_1_002}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCmdFileLog_ServiceQualification_10.138.42.190}    TST_F1_1_1_002    ${PathLogServiceQualification}
    [Teardown]    Close All Connections

TST_F1_1_1_003
    #หา msisdn ใน MongoDB
    PrepareMongoDB_bo    ${DataBaseNameNSB}    ${CollectionNameLivingNetwork5GModePackage_Bo}    {"msisdn" : "66836318803"}	    ${MongoDBPrepare_TST_F1_1_1_003}
    Sleep    5
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCmdFileLog_ServiceQualification_10.138.42.190}    ${PathLogServiceQualification}
    #Set AC Response
    SetMockupResponse    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_default_success}
    #reload config app
    SSHLibrary.Execute Command    ${cmdReloadConf}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_serviceQualificationRequested_10.138.42.190}    ${CmdProduce_serviceQualification_10.138.42.190}    ${DataProduce_TST_F1_1_1_003}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_serviceQualificationRequested_10.138.42.190}    TST_F1_1_1_003
    Log    'consumeResult='${ConsumeResult}
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F1_1_1_003}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCmdFileLog_ServiceQualification_10.138.42.190}    TST_F1_1_1_003    ${PathLogServiceQualification}
    [Teardown]    Close All Connections

TST_F1_0_1_004
    #หา msisdn ใน MongoDB
    PrepareMongoDB_bo    ${DataBaseNameNSB}    ${CollectionNameLivingNetwork5GModePackage_Bo}    {"msisdn" : "66836318804"}	    ${MongoDBPrepare_TST_F1_0_1_004}
    Sleep    5
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCmdFileLog_ServiceQualification_10.138.42.190}    ${PathLogServiceQualification}
    #Set AC Response
    SetMockupResponse    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_default_success}
    #reload config app
    SSHLibrary.Execute Command    ${cmdReloadConf}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_serviceQualificationRequested_10.138.42.190}    ${CmdProduce_serviceQualification_10.138.42.190}    ${DataProduce_TST_F1_0_1_004}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_serviceQualificationRequested_10.138.42.190}    TST_F1_0_1_004
    Log    'consumeResult='${ConsumeResult}
    Log    'Expect='${DataExpect_TST_F1_0_1_004}
    # check app produce accessTokenRequested
    VerifyDataConsume_bo    ${ConsumeResult}    ${DataExpect_TST_F1_0_1_004}    
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCmdFileLog_ServiceQualification_10.138.42.190}    TST_F1_0_1_004    ${PathLogServiceQualification}
    [Teardown]    Close All Connections

TST_F1_1_1_005
    #หา msisdn ใน MongoDB
    PrepareMongoDB_bo    ${DataBaseNameNSB}    ${CollectionNameLivingNetwork5GModePackage_Bo}    {"msisdn" : "66836318805"}	    ${MongoDBPrepare_TST_F1_1_1_005}
    Sleep    5
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCmdFileLog_ServiceQualification_10.138.42.190}    ${PathLogServiceQualification}
    #Set AC Response
    SetMockupResponse    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_default_success}
    #reload config app
    SSHLibrary.Execute Command    ${cmdReloadConf}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_serviceQualificationRequested_10.138.42.190}    ${CmdProduce_serviceQualification_10.138.42.190}    ${DataProduce_TST_F1_1_1_005}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_serviceQualificationRequested_10.138.42.190}    TST_F1_1_1_005
    Log    'consumeResult='${ConsumeResult}
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F1_1_1_005}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCmdFileLog_ServiceQualification_10.138.42.190}    TST_F1_1_1_005    ${PathLogServiceQualification}
    [Teardown]    Close All Connections

TST_F1_1_1_006
    #หา msisdn ใน MongoDB
    PrepareMongoDB_bo    ${DataBaseNameNSB}    ${CollectionNameLivingNetwork5GModePackage_Bo}    {"msisdn" : "66836318806"}	    ${MongoDBPrepare_TST_F1_1_1_006}
    Sleep    5
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCmdFileLog_ServiceQualification_10.138.42.190}    ${PathLogServiceQualification}
    #Set AC Response
    SetMockupResponse    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_default_success}
    #reload config app
    SSHLibrary.Execute Command    ${cmdReloadConf}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_serviceQualificationRequested_10.138.42.190}    ${CmdProduce_serviceQualification_10.138.42.190}    ${DataProduce_TST_F1_1_1_006}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_serviceQualificationRequested_10.138.42.190}    TST_F1_1_1_006
    Log    'consumeResult='${ConsumeResult}
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F1_1_1_006}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCmdFileLog_ServiceQualification_10.138.42.190}    TST_F1_1_1_006    ${PathLogServiceQualification}
    [Teardown]    Close All Connections

TST_F1_1_1_007
    #หา msisdn ใน MongoDB
    PrepareMongoDB_bo    ${DataBaseNameNSB}    ${CollectionNameLivingNetwork5GModePackage_Bo}    {"msisdn" : "66836318807"}	    ${MongoDBPrepare_TST_F1_1_1_007}
    Sleep    5
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCmdFileLog_ServiceQualification_10.138.42.190}    ${PathLogServiceQualification}
    #Set AC Response
    SetMockupResponse    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_default_success}
    #reload config app
    SSHLibrary.Execute Command    ${cmdReloadConf}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_serviceQualificationRequested_10.138.42.190}    ${CmdProduce_serviceQualification_10.138.42.190}    ${DataProduce_TST_F1_1_1_007}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_serviceQualificationRequested_10.138.42.190}    TST_F1_1_1_007
    Log    'consumeResult='${ConsumeResult}
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F1_1_1_007}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCmdFileLog_ServiceQualification_10.138.42.190}    TST_F1_1_1_007    ${PathLogServiceQualification}
    [Teardown]    Close All Connections

TST_F1_1_1_008
    #หา msisdn ใน MongoDB
    PrepareMongoDB_bo    ${DataBaseNameNSB}    ${CollectionNameLivingNetwork5GModePackage_Bo}    {"msisdn" : "66836318808"}	    ${MongoDBPrepare_TST_F1_1_1_008}
    Sleep    5
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCmdFileLog_ServiceQualification_10.138.42.190}    ${PathLogServiceQualification}
    #Set AC Response
    SetMockupResponse    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_default_success}
    #reload config app
    SSHLibrary.Execute Command    ${cmdReloadConf}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_serviceQualificationRequested_10.138.42.190}    ${CmdProduce_serviceQualification_10.138.42.190}    ${DataProduce_TST_F1_1_1_008}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_serviceQualificationRequested_10.138.42.190}    TST_F1_1_1_008
    Log    'consumeResult='${ConsumeResult}
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F1_1_1_008}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCmdFileLog_ServiceQualification_10.138.42.190}    TST_F1_1_1_008    ${PathLogServiceQualification}
    [Teardown]    Close All Connections

TST_F1_1_1_009
    #หา msisdn ใน MongoDB
    PrepareMongoDB_bo    ${DataBaseNameNSB}    ${CollectionNameLivingNetwork5GModePackage_Bo}    {"msisdn" : "66836318809"}	    ${MongoDBPrepare_TST_F1_1_1_009}
    Sleep    5
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCmdFileLog_ServiceQualification_10.138.42.190}    ${PathLogServiceQualification}
    #Set AC Response
    SetMockupResponse    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_default_success}
    #reload config app
    SSHLibrary.Execute Command    ${cmdReloadConf}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_serviceQualificationRequested_10.138.42.190}    ${CmdProduce_serviceQualification_10.138.42.190}    ${DataProduce_TST_F1_1_1_009}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_serviceQualificationRequested_10.138.42.190}    TST_F1_1_1_009
    Log    'consumeResult='${ConsumeResult}
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F1_1_1_009}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCmdFileLog_ServiceQualification_10.138.42.190}    TST_F1_1_1_009    ${PathLogServiceQualification}
    [Teardown]    Close All Connections

TST_F1_1_1_010
    #หา msisdn ใน MongoDB
    PrepareMongoDB_bo    ${DataBaseNameNSB}    ${CollectionNameLivingNetwork5GModePackage_Bo}    {"msisdn" : "66836318810"}	    ${MongoDBPrepare_TST_F1_1_1_010}
    Sleep    5
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCmdFileLog_ServiceQualification_10.138.42.190}    ${PathLogServiceQualification}
    #Set AC Response
    SetMockupResponse    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_default_success}
    #reload config app
    SSHLibrary.Execute Command    ${cmdReloadConf}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_serviceQualificationRequested_10.138.42.190}    ${CmdProduce_serviceQualification_10.138.42.190}    ${DataProduce_TST_F1_1_1_010}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_serviceQualificationRequested_10.138.42.190}    TST_F1_1_1_010
    Log    'consumeResult='${ConsumeResult}
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F1_1_1_010}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCmdFileLog_ServiceQualification_10.138.42.190}    TST_F1_1_1_010    ${PathLogServiceQualification}
    [Teardown]    Close All Connections

TST_F1_1_1_011
    #หา msisdn ใน MongoDB
    PrepareMongoDB_bo    ${DataBaseNameNSB}    ${CollectionNameLivingNetwork5GModePackage_Bo}    {"msisdn" : "66836318811"}	    ${MongoDBPrepare_TST_F1_1_1_011}
    Sleep    5
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCmdFileLog_ServiceQualification_10.138.42.190}    ${PathLogServiceQualification}
    #Set AC Response
    SetMockupResponse    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_default_success}
    #reload config app
    SSHLibrary.Execute Command    ${cmdReloadConf}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_serviceQualificationRequested_10.138.42.190}    ${CmdProduce_serviceQualification_10.138.42.190}    ${DataProduce_TST_F1_1_1_011}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_serviceQualificationRequested_10.138.42.190}    TST_F1_1_1_011
    Log    'consumeResult='${ConsumeResult}
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F1_1_1_011}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCmdFileLog_ServiceQualification_10.138.42.190}    TST_F1_1_1_011    ${PathLogServiceQualification}
    [Teardown]    Close All Connections

TST_F1_1_1_025
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCmdFileLog_ServiceQualification_10.138.42.190}    ${PathLogServiceQualification}
    #Set AC Response
    SetMockupResponse    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_default_success}
    #reload config app
    SSHLibrary.Execute Command    ${cmdReloadConf}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_serviceQualificationRequested_10.138.42.190}    ${CmdProduce_serviceQualification_10.138.42.190}    ${DataProduce_TST_F1_1_1_025}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_serviceQualificationRequested_10.138.42.190}    TST_F1_1_1_025
    Log    'consumeResult='${ConsumeResult}
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F1_1_1_025}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCmdFileLog_ServiceQualification_10.138.42.190}    TST_F1_1_1_025    ${PathLogServiceQualification}
    [Teardown]    Close All Connections

TST_F1_0_1_026
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCmdFileLog_ServiceQualification_10.138.42.190}    ${PathLogServiceQualification}
    #Set AC Response
    SetMockupResponse    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_default_success}
    #reload config app
    SSHLibrary.Execute Command    ${cmdReloadConf}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_serviceQualificationRequested_10.138.42.190}    ${CmdProduce_serviceQualification_10.138.42.190}    ${DataProduce_TST_F1_0_1_026}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_serviceQualificationRequested_10.138.42.190}    TST_F1_0_1_026
    Log    'consumeResult='${ConsumeResult}
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F1_0_1_026}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCmdFileLog_ServiceQualification_10.138.42.190}    TST_F1_0_1_026    ${PathLogServiceQualification}
    [Teardown]    Close All Connections

TST_F1_0_1_027
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCmdFileLog_ServiceQualification_10.138.42.190}    ${PathLogServiceQualification}
    #Set AC Response
    SetMockupResponse    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_default_success}
    #reload config app
    SSHLibrary.Execute Command    ${cmdReloadConf}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_serviceQualificationRequested_10.138.42.190}    ${CmdProduce_serviceQualification_10.138.42.190}    ${DataProduce_TST_F1_0_1_027}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_serviceQualificationRequested_10.138.42.190}    TST_F1_0_1_027
    Log    'consumeResult='${ConsumeResult}
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F1_0_1_027}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCmdFileLog_ServiceQualification_10.138.42.190}    TST_F1_0_1_027    ${PathLogServiceQualification}
    [Teardown]    Close All Connections

TST_F1_0_1_028
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCmdFileLog_ServiceQualification_10.138.42.190}    ${PathLogServiceQualification}
    #Set AC Response
    SetMockupResponse    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_default_success}
    #reload config app
    SSHLibrary.Execute Command    ${cmdReloadConf}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_serviceQualificationRequested_10.138.42.190}    ${CmdProduce_serviceQualification_10.138.42.190}    ${DataProduce_TST_F1_0_1_028}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_serviceQualificationRequested_10.138.42.190}    TST_F1_0_1_028
    Log    'consumeResult='${ConsumeResult}
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F1_0_1_028}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCmdFileLog_ServiceQualification_10.138.42.190}    TST_F1_0_1_028    ${PathLogServiceQualification}
    [Teardown]    Close All Connections

TST_F1_0_1_050
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCmdFileLog_ServiceQualification_10.138.42.190}    ${PathLogServiceQualification}
    #Set AC Response
    SetMockupResponse    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_TST_F1_0_1_050}
    #reload config app
    SSHLibrary.Execute Command    ${cmdReloadConf}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_serviceQualificationRequested_10.138.42.190}    ${CmdProduce_serviceQualification_10.138.42.190}    ${DataProduce_TST_F1_0_1_050}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_serviceQualificationRequested_10.138.42.190}    TST_F1_0_1_050
    Log    'consumeResult='${ConsumeResult}
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F1_0_1_050}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCmdFileLog_ServiceQualification_10.138.42.190}    TST_F1_0_1_050    ${PathLogServiceQualification}
    [Teardown]    Close All Connections

TST_F1_1_1_051
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCmdFileLog_ServiceQualification_10.138.42.190}    ${PathLogServiceQualification}
    #Set AC Response
    SetMockupResponse    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_TST_F1_1_1_051}
    #reload config app
    SSHLibrary.Execute Command    ${cmdReloadConf}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_serviceQualificationRequested_10.138.42.190}    ${CmdProduce_serviceQualification_10.138.42.190}    ${DataProduce_TST_F1_1_1_051}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_serviceQualificationRequested_10.138.42.190}    TST_F1_1_1_051
    Log    'consumeResult='${ConsumeResult}
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F1_1_1_051}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCmdFileLog_ServiceQualification_10.138.42.190}    TST_F1_1_1_051    ${PathLogServiceQualification}
    [Teardown]    Close All Connections

TST_F1_1_1_052
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCmdFileLog_ServiceQualification_10.138.42.190}    ${PathLogServiceQualification}
    #Set AC Response
    SetMockupResponse    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_TST_F1_1_1_052}
    #reload config app
    SSHLibrary.Execute Command    ${cmdReloadConf}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_serviceQualificationRequested_10.138.42.190}    ${CmdProduce_serviceQualification_10.138.42.190}    ${DataProduce_TST_F1_1_1_052}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_serviceQualificationRequested_10.138.42.190}    TST_F1_1_1_052
    Log    'consumeResult='${ConsumeResult}
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F1_1_1_052}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCmdFileLog_ServiceQualification_10.138.42.190}    TST_F1_1_1_052    ${PathLogServiceQualification}
    [Teardown]    Close All Connections

TST_F1_1_1_053
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCmdFileLog_ServiceQualification_10.138.42.190}    ${PathLogServiceQualification}
    #Set AC Response
    SetMockupResponse    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_TST_F1_1_1_053}
    #reload config app
    SSHLibrary.Execute Command    ${cmdReloadConf}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_serviceQualificationRequested_10.138.42.190}    ${CmdProduce_serviceQualification_10.138.42.190}    ${DataProduce_TST_F1_1_1_053}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_serviceQualificationRequested_10.138.42.190}    TST_F1_1_1_053
    Log    'consumeResult='${ConsumeResult}
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F1_1_1_053}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCmdFileLog_ServiceQualification_10.138.42.190}    TST_F1_1_1_053    ${PathLogServiceQualification}
    [Teardown]    Close All Connections

TST_F1_1_1_054
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCmdFileLog_ServiceQualification_10.138.42.190}    ${PathLogServiceQualification}
    #Set AC Response
    SetMockupResponse    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_TST_F1_1_1_054}
    #reload config app
    SSHLibrary.Execute Command    ${cmdReloadConf}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_serviceQualificationRequested_10.138.42.190}    ${CmdProduce_serviceQualification_10.138.42.190}    ${DataProduce_TST_F1_1_1_054}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_serviceQualificationRequested_10.138.42.190}    TST_F1_1_1_054
    Log    'consumeResult='${ConsumeResult}
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F1_1_1_054}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCmdFileLog_ServiceQualification_10.138.42.190}    TST_F1_1_1_054    ${PathLogServiceQualification}
    [Teardown]    Close All Connections

TST_F1_1_1_055
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCmdFileLog_ServiceQualification_10.138.42.190}    ${PathLogServiceQualification}
    #Set AC Response
    SetMockupResponse    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_TST_F1_1_1_055}
    #reload config app
    SSHLibrary.Execute Command    ${cmdReloadConf}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_serviceQualificationRequested_10.138.42.190}    ${CmdProduce_serviceQualification_10.138.42.190}    ${DataProduce_TST_F1_1_1_055}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_serviceQualificationRequested_10.138.42.190}    TST_F1_1_1_055
    Log    'consumeResult='${ConsumeResult}
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F1_1_1_055}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCmdFileLog_ServiceQualification_10.138.42.190}    TST_F1_1_1_055    ${PathLogServiceQualification}
    [Teardown]    Close All Connections

TST_F1_1_1_056
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCmdFileLog_ServiceQualification_10.138.42.190}    ${PathLogServiceQualification}
    #Set AC Response
    SetMockupResponse    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_TST_F1_1_1_056}
    #reload config app
    SSHLibrary.Execute Command    ${cmdReloadConf}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_serviceQualificationRequested_10.138.42.190}    ${CmdProduce_serviceQualification_10.138.42.190}    ${DataProduce_TST_F1_1_1_056}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_serviceQualificationRequested_10.138.42.190}    TST_F1_1_1_056
    Log    'consumeResult='${ConsumeResult}
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F1_1_1_056}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCmdFileLog_ServiceQualification_10.138.42.190}    TST_F1_1_1_056    ${PathLogServiceQualification}
    [Teardown]    Close All Connections

TST_F1_0_1_057
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCmdFileLog_ServiceQualification_10.138.42.190}    ${PathLogServiceQualification}
    #Set AC Response
    SetMockupResponse    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_TST_F1_0_1_057}
    #reload config app
    SSHLibrary.Execute Command    ${cmdReloadConf}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_serviceQualificationRequested_10.138.42.190}    ${CmdProduce_serviceQualification_10.138.42.190}    ${DataProduce_TST_F1_0_1_057}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_serviceQualificationRequested_10.138.42.190}    TST_F1_0_1_057
    Log    'consumeResult='${ConsumeResult}
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F1_0_1_057}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCmdFileLog_ServiceQualification_10.138.42.190}    TST_F1_0_1_057    ${PathLogServiceQualification}
    [Teardown]    Close All Connections

TST_F1_0_1_058
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCmdFileLog_ServiceQualification_10.138.42.190}    ${PathLogServiceQualification}
    #Set AC Response
    SetMockupResponse    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_TST_F1_0_1_058}
    #reload config app
    SSHLibrary.Execute Command    ${cmdReloadConf}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_serviceQualificationRequested_10.138.42.190}    ${CmdProduce_serviceQualification_10.138.42.190}    ${DataProduce_TST_F1_0_1_058}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_serviceQualificationRequested_10.138.42.190}    TST_F1_0_1_058
    Log    'consumeResult='${ConsumeResult}
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F1_0_1_058}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCmdFileLog_ServiceQualification_10.138.42.190}    TST_F1_0_1_058    ${PathLogServiceQualification}
    [Teardown]    Close All Connections

TST_F1_0_1_059
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCmdFileLog_ServiceQualification_10.138.42.190}    ${PathLogServiceQualification}
    #Set AC Response
    SetMockupResponse    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_TST_F1_0_1_059}
    #reload config app
    SSHLibrary.Execute Command    ${cmdReloadConf}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_serviceQualificationRequested_10.138.42.190}    ${CmdProduce_serviceQualification_10.138.42.190}    ${DataProduce_TST_F1_0_1_059}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_serviceQualificationRequested_10.138.42.190}    TST_F1_0_1_059
    Log    'consumeResult='${ConsumeResult}
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F1_0_1_059}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCmdFileLog_ServiceQualification_10.138.42.190}    TST_F1_0_1_059    ${PathLogServiceQualification}
    [Teardown]    Close All Connections

TST_F1_0_1_060
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCmdFileLog_ServiceQualification_10.138.42.190}    ${PathLogServiceQualification}
    #Set AC Response
    SetMockupResponse    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_TST_F1_0_1_060}
    #reload config app
    SSHLibrary.Execute Command    ${cmdReloadConf}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_serviceQualificationRequested_10.138.42.190}    ${CmdProduce_serviceQualification_10.138.42.190}    ${DataProduce_TST_F1_0_1_060}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_serviceQualificationRequested_10.138.42.190}    TST_F1_0_1_060
    Log    'consumeResult='${ConsumeResult}
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F1_0_1_060}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCmdFileLog_ServiceQualification_10.138.42.190}    TST_F1_0_1_060    ${PathLogServiceQualification}
    [Teardown]    Close All Connections

TST_F1_0_1_061
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCmdFileLog_ServiceQualification_10.138.42.190}    ${PathLogServiceQualification}
    #Set AC Response
    SetMockupResponse    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_TST_F1_0_1_061}
    #reload config app
    SSHLibrary.Execute Command    ${cmdReloadConf}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_serviceQualificationRequested_10.138.42.190}    ${CmdProduce_serviceQualification_10.138.42.190}    ${DataProduce_TST_F1_0_1_061}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_serviceQualificationRequested_10.138.42.190}    TST_F1_0_1_061
    Log    'consumeResult='${ConsumeResult}
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F1_0_1_061}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCmdFileLog_ServiceQualification_10.138.42.190}    TST_F1_0_1_061    ${PathLogServiceQualification}
    [Teardown]    Close All Connections

TST_F1_0_1_062
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCmdFileLog_ServiceQualification_10.138.42.190}    ${PathLogServiceQualification}
    #Set AC Response
    SetMockupResponse    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_TST_F1_0_1_062}
    #reload config app
    SSHLibrary.Execute Command    ${cmdReloadConf}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_serviceQualificationRequested_10.138.42.190}    ${CmdProduce_serviceQualification_10.138.42.190}    ${DataProduce_TST_F1_0_1_062}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_serviceQualificationRequested_10.138.42.190}    TST_F1_0_1_062
    Log    'consumeResult='${ConsumeResult}
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F1_0_1_062}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCmdFileLog_ServiceQualification_10.138.42.190}    TST_F1_0_1_062    ${PathLogServiceQualification}
    [Teardown]    Close All Connections

TST_F1_0_1_063
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCmdFileLog_ServiceQualification_10.138.42.190}    ${PathLogServiceQualification}
    #Set AC Response
    SetMockupResponse    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_TST_F1_0_1_063}
    #reload config app
    SSHLibrary.Execute Command    ${cmdReloadConf}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_serviceQualificationRequested_10.138.42.190}    ${CmdProduce_serviceQualification_10.138.42.190}    ${DataProduce_TST_F1_0_1_063}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_serviceQualificationRequested_10.138.42.190}    TST_F1_0_1_063
    Log    'consumeResult='${ConsumeResult}
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F1_0_1_063}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCmdFileLog_ServiceQualification_10.138.42.190}    TST_F1_0_1_063    ${PathLogServiceQualification}
    [Teardown]    Close All Connections

TST_F1_0_1_064
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCmdFileLog_ServiceQualification_10.138.42.190}    ${PathLogServiceQualification}
    #Set AC Response
    SetMockupResponse    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_TST_F1_0_1_064}
    #reload config app
    SSHLibrary.Execute Command    ${cmdReloadConf}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_serviceQualificationRequested_10.138.42.190}    ${CmdProduce_serviceQualification_10.138.42.190}    ${DataProduce_TST_F1_0_1_064}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_serviceQualificationRequested_10.138.42.190}    TST_F1_0_1_064
    Log    'consumeResult='${ConsumeResult}
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F1_0_1_064}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCmdFileLog_ServiceQualification_10.138.42.190}    TST_F1_0_1_064    ${PathLogServiceQualification}
    [Teardown]    Close All Connections

TST_F1_1_1_065
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCmdFileLog_ServiceQualification_10.138.42.190}    ${PathLogServiceQualification}
    #Set AC Response
    SetMockupResponse    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_TST_F1_1_1_065}
    #reload config app
    SSHLibrary.Execute Command    ${cmdReloadConf}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_serviceQualificationRequested_10.138.42.190}    ${CmdProduce_serviceQualification_10.138.42.190}    ${DataProduce_TST_F1_1_1_065}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_serviceQualificationRequested_10.138.42.190}    TST_F1_1_1_065
    Log    'consumeResult='${ConsumeResult}
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F1_1_1_065}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCmdFileLog_ServiceQualification_10.138.42.190}    TST_F1_1_1_065    ${PathLogServiceQualification}
    [Teardown]    Close All Connections

TST_F1_1_1_066
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCmdFileLog_ServiceQualification_10.138.42.190}    ${PathLogServiceQualification}
    #Set AC Response
    SetMockupResponse    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_TST_F1_1_1_066}
    #reload config app
    SSHLibrary.Execute Command    ${cmdReloadConf}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_serviceQualificationRequested_10.138.42.190}    ${CmdProduce_serviceQualification_10.138.42.190}    ${DataProduce_TST_F1_1_1_066}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_serviceQualificationRequested_10.138.42.190}    TST_F1_1_1_066
    Log    'consumeResult='${ConsumeResult}
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F1_1_1_066}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCmdFileLog_ServiceQualification_10.138.42.190}    TST_F1_1_1_066    ${PathLogServiceQualification}
    [Teardown]    Close All Connections

TST_F1_0_1_067
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCmdFileLog_ServiceQualification_10.138.42.190}    ${PathLogServiceQualification}
    #Set AC Response
    SetMockupResponse    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_TST_F1_0_1_067}
    #reload config app
    SSHLibrary.Execute Command    ${cmdReloadConf}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_serviceQualificationRequested_10.138.42.190}    ${CmdProduce_serviceQualification_10.138.42.190}    ${DataProduce_TST_F1_0_1_067}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_serviceQualificationRequested_10.138.42.190}    TST_F1_0_1_067
    Log    'consumeResult='${ConsumeResult}
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F1_0_1_067}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCmdFileLog_ServiceQualification_10.138.42.190}    TST_F1_0_1_067    ${PathLogServiceQualification}
    [Teardown]    Close All Connections

TST_F1_0_1_068
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCmdFileLog_ServiceQualification_10.138.42.190}    ${PathLogServiceQualification}
    #Set AC Response
    SetMockupResponse    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_TST_F1_0_1_068}
    #reload config app
    SSHLibrary.Execute Command    ${cmdReloadConf}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_serviceQualificationRequested_10.138.42.190}    ${CmdProduce_serviceQualification_10.138.42.190}    ${DataProduce_TST_F1_0_1_068}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_serviceQualificationRequested_10.138.42.190}    TST_F1_0_1_068
    Log    'consumeResult='${ConsumeResult}
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F1_0_1_068}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCmdFileLog_ServiceQualification_10.138.42.190}    TST_F1_0_1_068    ${PathLogServiceQualification}
    [Teardown]    Close All Connections

TST_F1_0_1_069
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCmdFileLog_ServiceQualification_10.138.42.190}    ${PathLogServiceQualification}
    #Set AC Response
    SetMockupResponse    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_TST_F1_0_1_069}
    #reload config app
    SSHLibrary.Execute Command    ${cmdReloadConf}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_serviceQualificationRequested_10.138.42.190}    ${CmdProduce_serviceQualification_10.138.42.190}    ${DataProduce_TST_F1_0_1_069}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_serviceQualificationRequested_10.138.42.190}    TST_F1_0_1_069
    Log    'consumeResult='${ConsumeResult}
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F1_0_1_069}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCmdFileLog_ServiceQualification_10.138.42.190}    TST_F1_0_1_069    ${PathLogServiceQualification}
    [Teardown]    Close All Connections

TST_F1_0_1_070
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCmdFileLog_ServiceQualification_10.138.42.190}    ${PathLogServiceQualification}
    #Set AC Response
    SetMockupResponse    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_TST_F1_0_1_070}
    #reload config app
    SSHLibrary.Execute Command    ${cmdReloadConf}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_serviceQualificationRequested_10.138.42.190}    ${CmdProduce_serviceQualification_10.138.42.190}    ${DataProduce_TST_F1_0_1_070}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_serviceQualificationRequested_10.138.42.190}    TST_F1_0_1_070
    Log    'consumeResult='${ConsumeResult}
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F1_0_1_070}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCmdFileLog_ServiceQualification_10.138.42.190}    TST_F1_0_1_070    ${PathLogServiceQualification}
    [Teardown]    Close All Connections

TST_F1_0_1_071
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCmdFileLog_ServiceQualification_10.138.42.190}    ${PathLogServiceQualification}
    #Set AC Response
    SetMockupResponse    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_TST_F1_0_1_071}
    #reload config app
    SSHLibrary.Execute Command    ${cmdReloadConf}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_serviceQualificationRequested_10.138.42.190}    ${CmdProduce_serviceQualification_10.138.42.190}    ${DataProduce_TST_F1_0_1_071}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_serviceQualificationRequested_10.138.42.190}    TST_F1_0_1_071
    Log    'consumeResult='${ConsumeResult}
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F1_0_1_071}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCmdFileLog_ServiceQualification_10.138.42.190}    TST_F1_0_1_071    ${PathLogServiceQualification}
    [Teardown]    Close All Connections

TST_F1_0_1_072
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCmdFileLog_ServiceQualification_10.138.42.190}    ${PathLogServiceQualification}
    #Set AC Response
    SetMockupResponse    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_TST_F1_0_1_072}
    #reload config app
    SSHLibrary.Execute Command    ${cmdReloadConf}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_serviceQualificationRequested_10.138.42.190}    ${CmdProduce_serviceQualification_10.138.42.190}    ${DataProduce_TST_F1_0_1_072}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_serviceQualificationRequested_10.138.42.190}    TST_F1_0_1_072
    Log    'consumeResult='${ConsumeResult}
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F1_0_1_072}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCmdFileLog_ServiceQualification_10.138.42.190}    TST_F1_0_1_072    ${PathLogServiceQualification}
    [Teardown]    Close All Connections

TST_F1_0_1_073
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCmdFileLog_ServiceQualification_10.138.42.190}    ${PathLogServiceQualification}
    #Set AC Response
    SetMockupResponse    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_TST_F1_0_1_073}
    #reload config app
    SSHLibrary.Execute Command    ${cmdReloadConf}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_serviceQualificationRequested_10.138.42.190}    ${CmdProduce_serviceQualification_10.138.42.190}    ${DataProduce_TST_F1_0_1_073}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_serviceQualificationRequested_10.138.42.190}    TST_F1_0_1_073
    Log    'consumeResult='${ConsumeResult}
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F1_0_1_073}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCmdFileLog_ServiceQualification_10.138.42.190}    TST_F1_0_1_073    ${PathLogServiceQualification}
    [Teardown]    Close All Connections

TST_F1_0_1_074
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCmdFileLog_ServiceQualification_10.138.42.190}    ${PathLogServiceQualification}
    #Set AC Response
    SetMockupResponse    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_TST_F1_0_1_074}
    #reload config app
    SSHLibrary.Execute Command    ${cmdReloadConf}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_serviceQualificationRequested_10.138.42.190}    ${CmdProduce_serviceQualification_10.138.42.190}    ${DataProduce_TST_F1_0_1_074}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_serviceQualificationRequested_10.138.42.190}    TST_F1_0_1_074
    Log    'consumeResult='${ConsumeResult}
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F1_0_1_074}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCmdFileLog_ServiceQualification_10.138.42.190}    TST_F1_0_1_074    ${PathLogServiceQualification}
    [Teardown]    Close All Connections

TST_F1_0_1_075
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCmdFileLog_ServiceQualification_10.138.42.190}    ${PathLogServiceQualification}
    #Set AC Response
    SetMockupResponse    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_TST_F1_0_1_075}
    #reload config app
    SSHLibrary.Execute Command    ${cmdReloadConf}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_serviceQualificationRequested_10.138.42.190}    ${CmdProduce_serviceQualification_10.138.42.190}    ${DataProduce_TST_F1_0_1_075}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_serviceQualificationRequested_10.138.42.190}    TST_F1_0_1_075
    Log    'consumeResult='${ConsumeResult}
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F1_0_1_075}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCmdFileLog_ServiceQualification_10.138.42.190}    TST_F1_0_1_075    ${PathLogServiceQualification}
    [Teardown]    Close All Connections

TST_F1_1_1_076
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCmdFileLog_ServiceQualification_10.138.42.190}    ${PathLogServiceQualification}
    #Set AC Response
    SetMockupResponse    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_TST_F1_1_1_076}
    #reload config app
    SSHLibrary.Execute Command    ${cmdReloadConf}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_serviceQualificationRequested_10.138.42.190}    ${CmdProduce_serviceQualification_10.138.42.190}    ${DataProduce_TST_F1_1_1_076}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_serviceQualificationRequested_10.138.42.190}    TST_F1_1_1_076
    Log    'consumeResult='${ConsumeResult}
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F1_1_1_076}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCmdFileLog_ServiceQualification_10.138.42.190}    TST_F1_1_1_076    ${PathLogServiceQualification}
    [Teardown]    Close All Connections

TST_F1_1_1_077
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull_bo    ${NameCmdFileLog_ServiceQualification_10.138.42.190}    ${PathLogServiceQualification}
    #Set AC Response
    SetMockupResponse    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_TST_F1_1_1_077}
    #reload config app
    SSHLibrary.Execute Command    ${cmdReloadConf}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_serviceQualificationRequested_10.138.42.190}    ${CmdProduce_serviceQualification_10.138.42.190}    ${DataProduce_TST_F1_1_1_077}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_serviceQualificationRequested_10.138.42.190}    TST_F1_1_1_077
    Log    'consumeResult='${ConsumeResult}
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F1_1_1_077}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCmdFileLog_ServiceQualification_10.138.42.190}    TST_F1_1_1_077    ${PathLogServiceQualification}
    [Teardown]    Close All Connections

*** Keywords ***
SetLogNull_bo
    [Arguments]    ${Command_Name}    ${pathLog}
    #${filename}    SSHLibrary.Execute Command    find ${pathLog}/log/ -type f -mmin -1 -prune | grep ${Command_Name} |cut -d '/' -f8
    ${filename}    SSHLibrary.Execute Command    find ${pathLog}/log/ -type f -mmin -3 -ls | grep ${Command_Name} |cut -d '/' -f8
    log    ${filename}
    IF    "${filename}" != ""
    SSHLibrary.Execute Command    echo "" > ${pathLog}/log/${filename}
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
    BuiltIn.Should Be Equal As Strings    ${Data_Actual}        ${Data_Expect}        formatter=str
    #   #ตอนนี้มันมี ESC ติดมา ไปหาวิธีเอา ESC ออกแล้วค่อยกลับมาใช้
    Comment    BuiltIn.Should Contain    ${Data_Actual}    ${Data_Expect}
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