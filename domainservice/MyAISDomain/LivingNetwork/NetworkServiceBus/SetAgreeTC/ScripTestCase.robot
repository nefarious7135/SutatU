*** Settings ***
Resource          Valiable.robot
Resource          ../../Keyword/Common.robot
Resource          ../../Keyword/MongoDB.robot
Resource          ../../Keyword/SecureCRT.robot
Resource          ../../Valiables/CommonValiable/CommonValiable.robot
Resource          ../../NetworkServiceBus/SetAgreeTC/Valiable.robot
Resource          ../../Keyword/Stat.robot
*** Test Cases ***
Test Prepare Mongo
    #หา publicId ใน MongoDB
    ${publicId}    QueryDataReturnpublicId    ${DataBaseNameNSB}    ${Collection_MongoDB_privacyProfile}    ${MobileNo_TST_F5_1_1_002}
    Log    ${publicId}
    #ลบ publicId ใน MongoDB ก่อน prepare data
    ${publicId}    CheckResultAndDeleteDataBypublicId    ${DataBaseNameNSB}    ${Collection_MongoDB_privacyProfile}    ${publicId}
    Log    ${publicId}
    Sleep    5
    #prepare MongoDB
    InsertDataFromJson    ${DataBaseNameNSB}    ${Collection_MongoDB_privacyProfile}    ${MongoDBPrepare_TST_F5_1_1_002}
    Sleep    5

TST_F5_1_1_001
    #หา publicId ใน MongoDB
    ${publicId}    QueryDataReturnpublicId    ${DataBaseNameNSB}    ${Collection_MongoDB_privacyProfile}    ${MobileNo_TST_F5_1_1_001}
    #ลบ publicId ในMongoDB ก่อน prepare data
    ${publicId}    CheckResultAndDeleteDataBypublicId    ${DataBaseNameNSB}    ${Collection_MongoDB_privacyProfile}    ${publicId}
    #prepare MongoDB
    #InsertDataFromJson    ${DataBaseNameNSB}    ${Collection_MongoDB_privacyProfile}    ${MongoDBPrepare_TST_F5_1_1_001}
    Sleep    5
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #clear log
    SetLogNull    ${NameCmdFileLog_requestSetAgreeTC}    ${PathLogrequestSetAgreeTC}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_setAgreeTCRequested}    ${CmdProduce_setAgreeTC}    ${DataProduce_TST_F5_1_1_001}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${CmdConsume_setAgreeTCRequested}    TST_F5_1_1_001
    log    ${ConsumeResult}
    #check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F5_1_1_001}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCmdFileLog_requestSetAgreeTC}    TST_F5_1_1_001    ${PathLogrequestSetAgreeTC}
    VerifyStatByCommand    TST_F5_1_1_001    nsb-set-agree-tc    service-set-agree-tc    success
    #[Teardown]    Close All Connections
    Comment    ${result}    Common.VerifyStat    DMASTERSQA0001_service-set-agree-tc    /home/serveradm/nsb/service-set-agree-tc/logs
    Comment    AddNewSetAgreeTC20100    ${result}

TST_F5_1_1_002
    #หา publicId ใน MongoDB
    ${publicId}    QueryDataReturnpublicId    ${DataBaseNameNSB}    ${Collection_MongoDB_privacyProfile}    ${MobileNo_TST_F5_1_1_002}
    Log    ${publicId}
    #ลบ publicId ในMongoDB ก่อน prepare data
    ${publicId}    CheckResultAndDeleteDataBypublicId    ${DataBaseNameNSB}    ${Collection_MongoDB_privacyProfile}    ${publicId}
    Sleep    5
    #prepare MongoDB
    InsertDataFromJson    ${DataBaseNameNSB}    ${Collection_MongoDB_privacyProfile}    ${MongoDBPrepare_TST_F5_1_1_002}
    Sleep    5
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #clear log
    SetLogNull    ${NameCmdFileLog_requestSetAgreeTC}    ${PathLogrequestSetAgreeTC}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_setAgreeTCRequested}    ${CmdProduce_setAgreeTC}    ${DataProduce_TST_F5_1_1_002}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_setAgreeTCRequested}    TST_F5_1_1_002
    Log    'consumeResult='${ConsumeResult}
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F5_1_1_002}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCmdFileLog_requestSetAgreeTC}    TST_F5_1_1_002    ${PathLogrequestSetAgreeTC}
    VerifyStatByCommand    TST_F5_1_1_002    nsb-set-agree-tc    service-set-agree-tc    success
    #[Teardown]    Close All Connections
    Comment    ${result}    Common.VerifyStat    DMASTERSQA0001_service-set-agree-tc    /home/serveradm/nsb/service-set-agree-tc/logs
    Comment    InsertSetAgreeTC20000    ${result}

TST_F5_1_1_003
    #หา publicId ใน MongoDB
    ${publicId}    QueryDataReturnpublicId    ${DataBaseNameNSB}    ${Collection_MongoDB_privacyProfile}    ${MobileNo_TST_F5_1_1_003}
    #ลบ publicId ในMongoDB ก่อน prepare data
    ${publicId}    CheckResultAndDeleteDataBypublicId    ${DataBaseNameNSB}    ${Collection_MongoDB_privacyProfile}    ${publicId}
    #prepare MongoDB
    #InsertDataFromJson    ${DataBaseNameNSB}    ${Collection_MongoDB_privacyProfile}    ${MongoDBPrepare_TST_F5_1_1_003}
    Sleep    5
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #clear log
    SetLogNull    ${NameCmdFileLog_requestSetAgreeTC}    ${PathLogrequestSetAgreeTC}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_setAgreeTCRequested}    ${CmdProduce_setAgreeTC}    ${DataProduce_TST_F5_1_1_003}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${CmdConsume_setAgreeTCRequested}    TST_F5_1_1_003
    log    ${ConsumeResult}
    #check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F5_1_1_003}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCmdFileLog_requestSetAgreeTC}    TST_F5_1_1_003    ${PathLogrequestSetAgreeTC}
    VerifyStatByCommand    TST_F5_1_1_003    nsb-set-agree-tc    service-set-agree-tc    success
    #[Teardown]    Close All Connections
    Comment    ${result}    Common.VerifyStat    DMASTERSQA0001_service-set-agree-tc    /home/serveradm/nsb/service-set-agree-tc/logs
    Comment    AddNewSetAgreeTC20100    ${result}

TST_F5_0_1_004
    #หา publicId ใน MongoDB
    ${publicId}    QueryDataReturnpublicId    ${DataBaseNameNSB}    ${Collection_MongoDB_privacyProfile}    ${MobileNo_TST_F5_0_1_004}
    Log    ${publicId}
    #ลบ publicId ในMongoDB ก่อน prepare data
    ${publicId}    CheckResultAndDeleteDataBypublicId    ${DataBaseNameNSB}    ${Collection_MongoDB_privacyProfile}    ${publicId}
    Sleep    5
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #clear log
    SetLogNull    ${NameCmdFileLog_requestSetAgreeTC}    ${PathLogrequestSetAgreeTC}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_setAgreeTCRequested}    ${CmdProduce_setAgreeTC}    ${DataProduce_TST_F5_0_1_004}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${CmdConsume_setAgreeTCRequested}    TST_F5_0_1_004
    log    ${ConsumeResult}
    #check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F5_0_1_004}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCmdFileLog_requestSetAgreeTC}    TST_F5_0_1_004    ${PathLogrequestSetAgreeTC}
    VerifyStatByCommand    TST_F5_0_1_004    nsb-set-agree-tc    service-set-agree-tc    error
    #[Teardown]    Close All Connections
    Comment    ${result}    Common.VerifyStat    DMASTERSQA0001_service-set-agree-tc    /home/serveradm/nsb/service-set-agree-tc/logs
    Comment    ErrorSetAgreeTC50000    ${result}

TST_F5_0_1_005
    #หา publicId ใน MongoDB
    ${publicId}    QueryDataReturnpublicId    ${DataBaseNameNSB}    ${Collection_MongoDB_privacyProfile}    ${MobileNo_TST_F5_0_1_005}
    Log    ${publicId}
    #ลบ publicId ในMongoDB ก่อน prepare data
    ${publicId}    CheckResultAndDeleteDataBypublicId    ${DataBaseNameNSB}    ${Collection_MongoDB_privacyProfile}    ${publicId}
    Sleep    5
    #prepare MongoDB
    InsertDataFromJson    ${DataBaseNameNSB}    ${Collection_MongoDB_privacyProfile}    ${MongoDBPrepare_TST_F5_0_1_005}
    Sleep    5
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #clear log
    SetLogNull    ${NameCmdFileLog_requestSetAgreeTC}    ${PathLogrequestSetAgreeTC}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_setAgreeTCRequested}    ${CmdProduce_setAgreeTC}    ${DataProduce_TST_F5_0_1_005}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_setAgreeTCRequested}    TST_F5_0_1_005
    Log    'consumeResult='${ConsumeResult}
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F5_0_1_005}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCmdFileLog_requestSetAgreeTC}    TST_F5_0_1_005    ${PathLogrequestSetAgreeTC}
    VerifyStatByCommand    TST_F5_0_1_005    nsb-set-agree-tc    service-set-agree-tc    error
    #[Teardown]    Close All Connections
    Comment    ${result}    Common.VerifyStat    DMASTERSQA0001_service-set-agree-tc    /home/serveradm/nsb/service-set-agree-tc/logs
    Comment    ErrorSetAgreeTC50000    ${result}

TST_F5_1_1_006
    #หา publicId ใน MongoDB #1
    ${publicId1}    QueryDataReturnpublicId    ${DataBaseNameNSB}    ${Collection_MongoDB_privacyProfile}    ${MobileNo_TST_F5_1_1_006}
    #ลบ publicId ในMongoDB ก่อน prepare data #1
    ${publicId1}    CheckResultAndDeleteDataBypublicId    ${DataBaseNameNSB}    ${Collection_MongoDB_privacyProfile}    ${publicId1}
    #prepare MongoDB
    InsertDataFromJson    ${DataBaseNameNSB}    ${Collection_MongoDB_privacyProfile}    ${MongoDBPrepare_TST_F5_1_1_006}
    #หา publicId ใน MongoDB #2
    ${publicId2}    QueryDataReturnpublicId    ${DataBaseNameNSB}    ${Collection_MongoDB_privacyProfile}    ${MobileNo_TST_F5_1_1_006_null}
    #)])
    Log    ${publicId2}
    ${publicId2}    Set Variable    ${EMPTY}
    #ลบ publicId ในMongoDB ก่อน prepare data #1
    ${publicId2}    CheckResultAndDeleteDataBypublicIdNull    ${DataBaseNameNSB}    ${Collection_MongoDB_privacyProfile}    ${publicId2}
    #prepare MongoDB
    #InsertDataFromJson    ${DataBaseNameNSB}    ${Collection_MongoDB_privacyProfile}    ${MongoDBPrepare_TST_F5_1_1_006_null}
    Sleep    5
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #clear log
    SetLogNull    ${NameCmdFileLog_requestSetAgreeTC}    ${PathLogrequestSetAgreeTC}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_setAgreeTCRequested}    ${CmdProduce_setAgreeTC}    ${DataProduce_TST_F5_1_1_006}
    Log    ${DataProduce_TST_F5_1_1_006}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_setAgreeTCRequested}    TST_F5_1_1_006
    Log    'consumeResult='${ConsumeResult}
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F5_1_1_006}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCmdFileLog_requestSetAgreeTC}    TST_F5_1_1_006    ${PathLogrequestSetAgreeTC}
    VerifyStatByCommand    TST_F5_1_1_006    nsb-set-agree-tc    service-set-agree-tc    success
    #[Teardown]    Close All Connections
    Comment    ${result}    Common.VerifyStat    DMASTERSQA0001_service-set-agree-tc    /home/serveradm/nsb/service-set-agree-tc/logs
    Comment    AddNewSetAgreeTC20100    ${result}

TST_F5_0_1_007
    #หา publicId ใน MongoDB
    ${publicId}    QueryDataReturnpublicId    ${DataBaseNameNSB}    ${Collection_MongoDB_privacyProfile}    ${MobileNo_TST_F5_0_1_007}
    Log    ${publicId}
    #ลบ publicId ในMongoDB ก่อน prepare data
    ${publicId}    CheckResultAndDeleteDataBypublicId    ${DataBaseNameNSB}    ${Collection_MongoDB_privacyProfile}    ${publicId}
    Sleep    5
    #prepare MongoDB
    InsertDataFromJson    ${DataBaseNameNSB}    ${Collection_MongoDB_privacyProfile}    ${MongoDBPrepare_TST_F5_0_1_007}
    Sleep    5
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #clear log
    SetLogNull    ${NameCmdFileLog_requestSetAgreeTC}    ${PathLogrequestSetAgreeTC}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_setAgreeTCRequested}    ${CmdProduce_setAgreeTC}    ${DataProduce_TST_F5_0_1_007}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_setAgreeTCRequested}    TST_F5_0_1_007
    Log    'consumeResult='${ConsumeResult}
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F5_0_1_007}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCmdFileLog_requestSetAgreeTC}    TST_F5_0_1_007    ${PathLogrequestSetAgreeTC}
    VerifyStatByCommand    TST_F5_0_1_007    nsb-set-agree-tc    service-set-agree-tc    error
    #[Teardown]    Close All Connections
    Comment    ${result}    Common.VerifyStat    DMASTERSQA0001_service-set-agree-tc    /home/serveradm/nsb/service-set-agree-tc/logs
    Comment    ErrorSetAgreeTC50000    ${result}

TST_F5_0_1_008
    #หา publicId ใน MongoDB
    ${publicId}    QueryDataReturnpublicId    ${DataBaseNameNSB}    ${Collection_MongoDB_privacyProfile}    ${MobileNo_TST_F5_0_1_008}
    Log    ${publicId}
    #ลบ publicId ในMongoDB ก่อน prepare data
    ${publicId}    CheckResultAndDeleteDataBypublicId    ${DataBaseNameNSB}    ${Collection_MongoDB_privacyProfile}    ${publicId}
    Sleep    5
    #prepare MongoDB
    InsertDataFromJson    ${DataBaseNameNSB}    ${Collection_MongoDB_privacyProfile}    ${MongoDBPrepare_TST_F5_0_1_008}
    Sleep    5
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #clear log
    SetLogNull    ${NameCmdFileLog_requestSetAgreeTC}    ${PathLogrequestSetAgreeTC}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_setAgreeTCRequested}    ${CmdProduce_setAgreeTC}    ${DataProduce_TST_F5_0_1_008}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_setAgreeTCRequested}    TST_F5_0_1_008
    Log    'consumeResult='${ConsumeResult}
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F5_0_1_008}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCmdFileLog_requestSetAgreeTC}    TST_F5_0_1_008    ${PathLogrequestSetAgreeTC}
    VerifyStatByCommand    TST_F5_0_1_008    nsb-set-agree-tc    service-set-agree-tc    error
    #[Teardown]    Close All Connections
    Comment    ${result}    Common.VerifyStat    DMASTERSQA0001_service-set-agree-tc    /home/serveradm/nsb/service-set-agree-tc/logs
    Comment    ErrorSetAgreeTC50000    ${result}

TST_F5_0_1_009
    #หา publicId ใน MongoDB
    ${publicId}    QueryDataReturnpublicId    ${DataBaseNameNSB}    ${Collection_MongoDB_privacyProfile}    ${MobileNo_TST_F5_0_1_009}
    Log    ${publicId}
    #ลบ publicId ในMongoDB ก่อน prepare data
    ${publicId}    CheckResultAndDeleteDataBypublicId    ${DataBaseNameNSB}    ${Collection_MongoDB_privacyProfile}    ${publicId}
    Sleep    5
    #prepare MongoDB
    InsertDataFromJson    ${DataBaseNameNSB}    ${Collection_MongoDB_privacyProfile}    ${MongoDBPrepare_TST_F5_0_1_009}
    Sleep    5
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #clear log
    SetLogNull    ${NameCmdFileLog_requestSetAgreeTC}    ${PathLogrequestSetAgreeTC}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_setAgreeTCRequested}    ${CmdProduce_setAgreeTC}    ${DataProduce_TST_F5_0_1_009}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_setAgreeTCRequested}    TST_F5_0_1_009
    Log    'consumeResult='${ConsumeResult}
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F5_0_1_009}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCmdFileLog_requestSetAgreeTC}    TST_F5_0_1_009    ${PathLogrequestSetAgreeTC}
    VerifyStatByCommand    TST_F5_0_1_009    nsb-set-agree-tc    service-set-agree-tc    error
    #[Teardown]    Close All Connections
    Comment    ${result}    Common.VerifyStat    DMASTERSQA0001_service-set-agree-tc    /home/serveradm/nsb/service-set-agree-tc/logs
    Comment    ErrorSetAgreeTC50000    ${result}

TST_F5_1_1_010
    #หา publicId ใน MongoDB
    ${publicId}    QueryDataReturnpublicId    ${DataBaseNameNSB}    ${Collection_MongoDB_privacyProfile}    ${MobileNo_TST_F5_1_1_010}
    Log    ${publicId}
    #ลบ publicId ในMongoDB ก่อน prepare data
    ${publicId}    CheckResultAndDeleteDataBypublicId    ${DataBaseNameNSB}    ${Collection_MongoDB_privacyProfile}    ${publicId}
    Sleep    5
    #prepare MongoDB
    InsertDataFromJson    ${DataBaseNameNSB}    ${Collection_MongoDB_privacyProfile}    ${MongoDBPrepare_TST_F5_1_1_010}
    Sleep    5
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #clear log
    SetLogNull    ${NameCmdFileLog_requestSetAgreeTC}    ${PathLogrequestSetAgreeTC}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_setAgreeTCRequested}    ${CmdProduce_setAgreeTC}    ${DataProduce_TST_F5_1_1_010}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_setAgreeTCRequested}    TST_F5_1_1_010
    Log    'consumeResult='${ConsumeResult}
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F5_1_1_010}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCmdFileLog_requestSetAgreeTC}    TST_F5_1_1_010    ${PathLogrequestSetAgreeTC}
    VerifyStatByCommand    TST_F5_1_1_010    nsb-set-agree-tc    service-set-agree-tc    success
    #[Teardown]    Close All Connections
    Comment    ${result}    Common.VerifyStat    DMASTERSQA0001_service-set-agree-tc    /home/serveradm/nsb/service-set-agree-tc/logs
    Comment    InsertSetAgreeTC20000    ${result}

TST_F5_1_1_011
    #หา publicId ใน MongoDB
    ${publicId}    QueryDataReturnpublicId    ${DataBaseNameNSB}    ${Collection_MongoDB_privacyProfile}    ${MobileNo_TST_F5_1_1_011}
    #ลบ publicId ในMongoDB ก่อน prepare data
    ${publicId}    CheckResultAndDeleteDataBypublicId    ${DataBaseNameNSB}    ${Collection_MongoDB_privacyProfile}    ${publicId}
    #prepare MongoDB
    InsertDataFromJson    ${DataBaseNameNSB}    ${Collection_MongoDB_privacyProfile}    ${MongoDBPrepare_TST_F5_1_1_011}
    Sleep    5
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #clear log
    SetLogNull    ${NameCmdFileLog_requestSetAgreeTC}    ${PathLogrequestSetAgreeTC}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_setAgreeTCRequested}    ${CmdProduce_setAgreeTC}    ${DataProduce_TST_F5_1_1_011}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_setAgreeTCRequested}    TST_F5_1_1_011
    Log    'consumeResult='${ConsumeResult}
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F5_1_1_011}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCmdFileLog_requestSetAgreeTC}    TST_F5_1_1_011    ${PathLogrequestSetAgreeTC}
    VerifyStatByCommand    TST_F5_1_1_011    nsb-set-agree-tc    service-set-agree-tc    success
    #[Teardown]    Close All Connections
    Comment    ${result}    Common.VerifyStat    DMASTERSQA0001_service-set-agree-tc    /home/serveradm/nsb/service-set-agree-tc/logs
    Comment    InsertSetAgreeTC20000    ${result}

TST_F5_1_1_012
    #หา publicId ใน MongoDB
    ${publicId}    QueryDataReturnpublicId    ${DataBaseNameNSB}    ${Collection_MongoDB_privacyProfile}    ${MobileNo_TST_F5_1_1_012}
    Log    ${publicId}
    #ลบ publicId ในMongoDB ก่อน prepare data
    ${publicId}    CheckResultAndDeleteDataBypublicId    ${DataBaseNameNSB}    ${Collection_MongoDB_privacyProfile}    ${publicId}
    Sleep    5
    #prepare MongoDB
    InsertDataFromJson    ${DataBaseNameNSB}    ${Collection_MongoDB_privacyProfile}    ${MongoDBPrepare_TST_F5_1_1_012}
    Sleep    5
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #clear log
    SetLogNull    ${NameCmdFileLog_requestSetAgreeTC}    ${PathLogrequestSetAgreeTC}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_setAgreeTCRequested}    ${CmdProduce_setAgreeTC}    ${DataProduce_TST_F5_1_1_012}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_setAgreeTCRequested}    TST_F5_1_1_012
    Log    'consumeResult='${ConsumeResult}
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F5_1_1_012}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCmdFileLog_requestSetAgreeTC}    TST_F5_1_1_012    ${PathLogrequestSetAgreeTC}
    VerifyStatByCommand    TST_F5_1_1_012    nsb-set-agree-tc    service-set-agree-tc    success
    #[Teardown]    Close All Connections
    Comment    ${result}    Common.VerifyStat    DMASTERSQA0001_service-set-agree-tc    /home/serveradm/nsb/service-set-agree-tc/logs
    Comment    InsertSetAgreeTC20000    ${result}

TST_F5_1_1_013
    #หา publicId ใน MongoDB
    ${publicId}    QueryDataReturnpublicId    ${DataBaseNameNSB}    ${Collection_MongoDB_privacyProfile}    ${MobileNo_TST_F5_1_1_013}
    Log    ${publicId}
    #ลบ publicId ในMongoDB ก่อน prepare data
    ${publicId}    CheckResultAndDeleteDataBypublicId    ${DataBaseNameNSB}    ${Collection_MongoDB_privacyProfile}    ${publicId}
    Sleep    5
    #prepare MongoDB
    InsertDataFromJson    ${DataBaseNameNSB}    ${Collection_MongoDB_privacyProfile}    ${MongoDBPrepare_TST_F5_1_1_013}
    Sleep    5
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #clear log
    SetLogNull    ${NameCmdFileLog_requestSetAgreeTC}    ${PathLogrequestSetAgreeTC}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_setAgreeTCRequested}    ${CmdProduce_setAgreeTC}    ${DataProduce_TST_F5_1_1_013}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_setAgreeTCRequested}    TST_F5_1_1_013
    Log    'consumeResult='${ConsumeResult}
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F5_1_1_013}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCmdFileLog_requestSetAgreeTC}    TST_F5_1_1_013    ${PathLogrequestSetAgreeTC}
    VerifyStatByCommand    TST_F5_1_1_013    nsb-set-agree-tc    service-set-agree-tc    success
    #[Teardown]    Close All Connections
    Comment    ${result}    Common.VerifyStat    DMASTERSQA0001_service-set-agree-tc    /home/serveradm/nsb/service-set-agree-tc/logs
    Comment    InsertSetAgreeTC20000    ${result}

TST_F5_0_1_014
    #หา publicId ใน MongoDB
    ${publicId}    QueryDataReturnpublicId    ${DataBaseNameNSB}    ${Collection_MongoDB_privacyProfile}    ${MobileNo_TST_F5_0_1_014}
    Log    ${publicId}
    #ลบ publicId ในMongoDB ก่อน prepare data
    ${publicId}    CheckResultAndDeleteDataBypublicId    ${DataBaseNameNSB}    ${Collection_MongoDB_privacyProfile}    ${publicId}
    Sleep    5
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #clear log
    SetLogNull    ${NameCmdFileLog_requestSetAgreeTC}    ${PathLogrequestSetAgreeTC}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_setAgreeTCRequested}    ${CmdProduce_setAgreeTC}    ${DataProduce_TST_F5_0_1_014}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_setAgreeTCRequested}    TST_F5_0_1_014
    Log    'consumeResult='${ConsumeResult}
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F5_0_1_014}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCmdFileLog_requestSetAgreeTC}    TST_F5_0_1_014    ${PathLogrequestSetAgreeTC}
    VerifyStatByCommand    TST_F5_0_1_014    nsb-set-agree-tc    service-set-agree-tc    error
    #[Teardown]    Close All Connections
    Comment    ${result}    Common.VerifyStat    DMASTERSQA0001_service-set-agree-tc    /home/serveradm/nsb/service-set-agree-tc/logs
    Comment    ErrorSetAgreeTC50000    ${result}

TST_F5_1_1_015
    #หา publicId ใน MongoDB
    ${publicId}    QueryDataReturnpublicId    ${DataBaseNameNSB}    ${Collection_MongoDB_privacyProfile}    ${MobileNo_TST_F5_1_1_015}
    Log    ${publicId}
    #ลบ publicId ในMongoDB ก่อน prepare data
    ${publicId}    CheckResultAndDeleteDataBypublicId    ${DataBaseNameNSB}    ${Collection_MongoDB_privacyProfile}    ${publicId}
    Sleep    5
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #clear log
    SetLogNull    ${NameCmdFileLog_requestSetAgreeTC}    ${PathLogrequestSetAgreeTC}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_setAgreeTCRequested}    ${CmdProduce_setAgreeTC}    ${DataProduce_TST_F5_1_1_015}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_setAgreeTCRequested}    TST_F5_1_1_015
    Log    'consumeResult='${ConsumeResult}
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F5_1_1_015}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCmdFileLog_requestSetAgreeTC}    TST_F5_1_1_015    ${PathLogrequestSetAgreeTC}
    VerifyStatByCommand    TST_F5_1_1_015    nsb-set-agree-tc    service-set-agree-tc    success
    #[Teardown]    Close All Connections
    Comment    ${result}    Common.VerifyStat    DMASTERSQA0001_service-set-agree-tc    /home/serveradm/nsb/service-set-agree-tc/logs
    Comment    InsertSetAgreeTC20000    ${result}

TST_F5_0_1_016
    #หา publicId ใน MongoDB
    ${publicId}    QueryDataReturnpublicId    ${DataBaseNameNSB}    ${Collection_MongoDB_privacyProfile}    ${MobileNo_TST_F5_0_1_016}
    Log    ${publicId}
    #ลบ publicId ในMongoDB ก่อน prepare data
    ${publicId}    CheckResultAndDeleteDataBypublicId    ${DataBaseNameNSB}    ${Collection_MongoDB_privacyProfile}    ${publicId}
    Sleep    5
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #clear log
    SetLogNull    ${NameCmdFileLog_requestSetAgreeTC}    ${PathLogrequestSetAgreeTC}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_setAgreeTCRequested}    ${CmdProduce_setAgreeTC}    ${DataProduce_TST_F5_0_1_016}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_setAgreeTCRequested}    TST_F5_0_1_016
    Log    'consumeResult='${ConsumeResult}
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F5_0_1_016}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCmdFileLog_requestSetAgreeTC}    TST_F5_0_1_016    ${PathLogrequestSetAgreeTC}
    VerifyStatByCommand    TST_F5_0_1_016    nsb-set-agree-tc    service-set-agree-tc    error
    #[Teardown]    Close All Connections
    Comment    ${result}    Common.VerifyStat    DMASTERSQA0001_service-set-agree-tc    /home/serveradm/nsb/service-set-agree-tc/logs
    Comment    ErrorSetAgreeTC50000    ${result}

TST_F5_1_1_017
    #หา publicId ใน MongoDB
    ${publicId}    QueryDataReturnpublicId    ${DataBaseNameNSB}    ${Collection_MongoDB_privacyProfile}    ${MobileNo_TST_F5_1_1_017}
    #ลบ publicId ในMongoDB ก่อน prepare data
    ${publicId}    CheckResultAndDeleteDataBypublicId    ${DataBaseNameNSB}    ${Collection_MongoDB_privacyProfile}    ${publicId}
    #prepare MongoDB
    #InsertDataFromJson    ${DataBaseNameNSB}    ${Collection_MongoDB_privacyProfile}    ${MongoDBPrepare_TST_F5_1_1_017}
    Sleep    5
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #clear log
    SetLogNull    ${NameCmdFileLog_requestSetAgreeTC}    ${PathLogrequestSetAgreeTC}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_setAgreeTCRequested}    ${CmdProduce_setAgreeTC}    ${DataProduce_TST_F5_1_1_017}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_setAgreeTCRequested}    TST_F5_1_1_017
    Log    'consumeResult='${ConsumeResult}
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F5_1_1_017}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCmdFileLog_requestSetAgreeTC}    TST_F5_1_1_017    ${PathLogrequestSetAgreeTC}
    VerifyStatByCommand    TST_F5_1_1_017    nsb-set-agree-tc    service-set-agree-tc    success
    #[Teardown]    Close All Connections
    Comment    ${result}    Common.VerifyStat    DMASTERSQA0001_service-set-agree-tc    /home/serveradm/nsb/service-set-agree-tc/logs
    Comment    AddNewSetAgreeTC20100    ${result}

TST_F5_0_1_018
    #หา publicId ใน MongoDB
    ${publicId}    QueryDataReturnpublicId    ${DataBaseNameNSB}    ${Collection_MongoDB_privacyProfile}    ${MobileNo_TST_F5_0_1_018}
    Log    ${publicId}
    #ลบ publicId ในMongoDB ก่อน prepare data
    ${publicId}    CheckResultAndDeleteDataBypublicId    ${DataBaseNameNSB}    ${Collection_MongoDB_privacyProfile}    ${publicId}
    Sleep    5
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #clear log
    SetLogNull    ${NameCmdFileLog_requestSetAgreeTC}    ${PathLogrequestSetAgreeTC}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_setAgreeTCRequested}    ${CmdProduce_setAgreeTC}    ${DataProduce_TST_F5_0_1_018}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_setAgreeTCRequested}    TST_F5_0_1_018
    Log    'consumeResult='${ConsumeResult}
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F5_0_1_018}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCmdFileLog_requestSetAgreeTC}    TST_F5_0_1_018    ${PathLogrequestSetAgreeTC}
    VerifyStatByCommand    TST_F5_0_1_018    nsb-set-agree-tc    service-set-agree-tc    error
    #[Teardown]    Close All Connections
    Comment    ${result}    Common.VerifyStat    DMASTERSQA0001_service-set-agree-tc    /home/serveradm/nsb/service-set-agree-tc/logs
    Comment    ErrorSetAgreeTC50000    ${result}

TST_F5_0_1_019
    #หา publicId ใน MongoDB
    ${publicId}    QueryDataReturnpublicId    ${DataBaseNameNSB}    ${Collection_MongoDB_privacyProfile}    ${MobileNo_TST_F5_0_1_019}
    Log    ${publicId}
    #ลบ publicId ในMongoDB ก่อน prepare data
    ${publicId}    CheckResultAndDeleteDataBypublicId    ${DataBaseNameNSB}    ${Collection_MongoDB_privacyProfile}    ${publicId}
    Sleep    5
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #clear log
    SetLogNull    ${NameCmdFileLog_requestSetAgreeTC}    ${PathLogrequestSetAgreeTC}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_setAgreeTCRequested}    ${CmdProduce_setAgreeTC}    ${DataProduce_TST_F5_0_1_019}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_setAgreeTCRequested}    TST_F5_0_1_019
    Log    'consumeResult='${ConsumeResult}
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F5_0_1_019}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCmdFileLog_requestSetAgreeTC}    TST_F5_0_1_019    ${PathLogrequestSetAgreeTC}
    VerifyStatByCommand    TST_F5_0_1_019    nsb-set-agree-tc    service-set-agree-tc    error
    #[Teardown]    Close All Connections
    Comment    ${result}    Common.VerifyStat    DMASTERSQA0001_service-set-agree-tc    /home/serveradm/nsb/service-set-agree-tc/logs
    Comment    ErrorSetAgreeTC50000    ${result}

TST_F5_1_1_020
    #หา publicId ใน MongoDB
    ${publicId}    QueryDataReturnpublicId    ${DataBaseNameNSB}    ${Collection_MongoDB_privacyProfile}    ${MobileNo_TST_F5_1_1_020}
    Log    ${publicId}
    #ลบ publicId ในMongoDB ก่อน prepare data
    ${publicId}    CheckResultAndDeleteDataBypublicId    ${DataBaseNameNSB}    ${Collection_MongoDB_privacyProfile}    ${publicId}
    Sleep    5
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #clear log
    SetLogNull    ${NameCmdFileLog_requestSetAgreeTC}    ${PathLogrequestSetAgreeTC}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_setAgreeTCRequested}    ${CmdProduce_setAgreeTC}    ${DataProduce_TST_F5_1_1_020}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_setAgreeTCRequested}    TST_F5_1_1_020
    Log    'consumeResult='${ConsumeResult}
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F5_1_1_020}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCmdFileLog_requestSetAgreeTC}    TST_F5_1_1_020    ${PathLogrequestSetAgreeTC}
    VerifyStatByCommand    TST_F5_1_1_020    nsb-set-agree-tc    service-set-agree-tc    success
    #[Teardown]    Close All Connections
    Comment    ${result}    Common.VerifyStat    DMASTERSQA0001_service-set-agree-tc    /home/serveradm/nsb/service-set-agree-tc/logs
    Comment    AddNewSetAgreeTC20100    ${result}

TST_F5_1_1_021
    #หา publicId ใน MongoDB
    ${publicId}    QueryDataReturnpublicId    ${DataBaseNameNSB}    ${Collection_MongoDB_privacyProfile}    ${MobileNo_TST_F5_1_1_021}
    Log    ${publicId}
    #ลบ publicId ในMongoDB ก่อน prepare data
    ${publicId}    CheckResultAndDeleteDataBypublicId    ${DataBaseNameNSB}    ${Collection_MongoDB_privacyProfile}    ${publicId}
    Sleep    5
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #clear log
    SetLogNull    ${NameCmdFileLog_requestSetAgreeTC}    ${PathLogrequestSetAgreeTC}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_setAgreeTCRequested}    ${CmdProduce_setAgreeTC}    ${DataProduce_TST_F5_1_1_021}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_setAgreeTCRequested}    TST_F5_1_1_021
    Log    'consumeResult='${ConsumeResult}
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F5_1_1_021}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCmdFileLog_requestSetAgreeTC}    TST_F5_1_1_021    ${PathLogrequestSetAgreeTC}
    VerifyStatByCommand    TST_F5_1_1_021    nsb-set-agree-tc    service-set-agree-tc    success
    #[Teardown]    Close All Connections
    Comment    ${result}    Common.VerifyStat    DMASTERSQA0001_service-set-agree-tc    /home/serveradm/nsb/service-set-agree-tc/logs
    Comment    AddNewSetAgreeTC20100    ${result}

TST_F5_1_1_022
    #หา publicId ใน MongoDB
    ${publicId}    QueryDataReturnpublicId    ${DataBaseNameNSB}    ${Collection_MongoDB_privacyProfile}    ${MobileNo_TST_F5_1_1_022}
    Log    ${publicId}
    #ลบ publicId ในMongoDB ก่อน prepare data
    ${publicId}    CheckResultAndDeleteDataBypublicId    ${DataBaseNameNSB}    ${Collection_MongoDB_privacyProfile}    ${publicId}
    Sleep    5
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #clear log
    SetLogNull    ${NameCmdFileLog_requestSetAgreeTC}    ${PathLogrequestSetAgreeTC}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_setAgreeTCRequested}    ${CmdProduce_setAgreeTC}    ${DataProduce_TST_F5_1_1_022}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_setAgreeTCRequested}    TST_F5_1_1_022
    Log    'consumeResult='${ConsumeResult}
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F5_1_1_022}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCmdFileLog_requestSetAgreeTC}    TST_F5_1_1_022    ${PathLogrequestSetAgreeTC}
    VerifyStatByCommand    TST_F5_1_1_022    nsb-set-agree-tc    service-set-agree-tc    success
    #[Teardown]    Close All Connections
    Comment    ${result}    Common.VerifyStat    DMASTERSQA0001_service-set-agree-tc    /home/serveradm/nsb/service-set-agree-tc/logs
    Comment    AddNewSetAgreeTC20100    ${result}

TST_F5_1_1_023
    #หา publicId ใน MongoDB
    ${publicId}    QueryDataReturnpublicId    ${DataBaseNameNSB}    ${Collection_MongoDB_privacyProfile}    ${MobileNo_TST_F5_1_1_023}
    Log    ${publicId}
    #ลบ publicId ในMongoDB ก่อน prepare data
    ${publicId}    CheckResultAndDeleteDataBypublicId    ${DataBaseNameNSB}    ${Collection_MongoDB_privacyProfile}    ${publicId}
    Sleep    5
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #clear log
    SetLogNull    ${NameCmdFileLog_requestSetAgreeTC}    ${PathLogrequestSetAgreeTC}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_setAgreeTCRequested}    ${CmdProduce_setAgreeTC}    ${DataProduce_TST_F5_1_1_023}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_setAgreeTCRequested}    TST_F5_1_1_023
    Log    'consumeResult='${ConsumeResult}
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F5_1_1_023}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCmdFileLog_requestSetAgreeTC}    TST_F5_1_1_023    ${PathLogrequestSetAgreeTC}
    VerifyStatByCommand    TST_F5_1_1_023    nsb-set-agree-tc    service-set-agree-tc    success
    #[Teardown]    Close All Connections
    Comment    ${result}    Common.VerifyStat    DMASTERSQA0001_service-set-agree-tc    /home/serveradm/nsb/service-set-agree-tc/logs
    Comment    AddNewSetAgreeTC20100    ${result}

TST_F5_1_1_024
    #หา publicId ใน MongoDB
    ${publicId}    QueryDataReturnpublicId    ${DataBaseNameNSB}    ${Collection_MongoDB_privacyProfile}    ${MobileNo_TST_F5_1_1_024}
    Log    ${publicId}
    #ลบ publicId ในMongoDB ก่อน prepare data
    ${publicId}    CheckResultAndDeleteDataBypublicId    ${DataBaseNameNSB}    ${Collection_MongoDB_privacyProfile}    ${publicId}
    Sleep    5
    #prepare MongoDB
    InsertDataFromJson    ${DataBaseNameNSB}    ${Collection_MongoDB_privacyProfile}    ${MongoDBPrepare_TST_F5_1_1_024}
    Sleep    5
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #clear log
    SetLogNull    ${NameCmdFileLog_requestSetAgreeTC}    ${PathLogrequestSetAgreeTC}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_setAgreeTCRequested}    ${CmdProduce_setAgreeTC}    ${DataProduce_TST_F5_1_1_024}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_setAgreeTCRequested}    TST_F5_1_1_024
    Log    'consumeResult='${ConsumeResult}
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F5_1_1_024}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCmdFileLog_requestSetAgreeTC}    TST_F5_1_1_024    ${PathLogrequestSetAgreeTC}
    VerifyStatByCommand    TST_F5_1_1_024    nsb-set-agree-tc    service-set-agree-tc    success
    #[Teardown]    Close All Connections
    Comment    ${result}    Common.VerifyStat    DMASTERSQA0001_service-set-agree-tc    /home/serveradm/nsb/service-set-agree-tc/logs
    Comment    AddNewSetAgreeTC20100    ${result}

TST_F5_1_1_025
    #หา publicId ใน MongoDB
    ${publicId}    QueryDataReturnpublicId    ${DataBaseNameNSB}    ${Collection_MongoDB_privacyProfile}    ${MobileNo_TST_F5_1_1_025}
    Log    ${publicId}
    #ลบ publicId ในMongoDB ก่อน prepare data
    ${publicId}    CheckResultAndDeleteDataBypublicId    ${DataBaseNameNSB}    ${Collection_MongoDB_privacyProfile}    ${publicId}
    Sleep    5
    #prepare MongoDB
    InsertDataFromJson    ${DataBaseNameNSB}    ${Collection_MongoDB_privacyProfile}    ${MongoDBPrepare_TST_F5_1_1_025}
    Sleep    5
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #clear log
    SetLogNull    ${NameCmdFileLog_requestSetAgreeTC}    ${PathLogrequestSetAgreeTC}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_setAgreeTCRequested}    ${CmdProduce_setAgreeTC}    ${DataProduce_TST_F5_1_1_025}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_setAgreeTCRequested}    TST_F5_1_1_025
    Log    'consumeResult='${ConsumeResult}
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F5_1_1_025}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCmdFileLog_requestSetAgreeTC}    TST_F5_1_1_025    ${PathLogrequestSetAgreeTC}
    VerifyStatByCommand    TST_F5_1_1_025    nsb-set-agree-tc    service-set-agree-tc    success
    #[Teardown]    Close All Connections
    Comment    ${result}    Common.VerifyStat    DMASTERSQA0001_service-set-agree-tc    /home/serveradm/nsb/service-set-agree-tc/logs
    Comment    AddNewSetAgreeTC20100    ${result}

TST_F5_1_1_026
    #หา publicId ใน MongoDB
    ${publicId}    QueryDataReturnpublicId    ${DataBaseNameNSB}    ${Collection_MongoDB_privacyProfile}    ${MobileNo_TST_F5_1_1_026}
    Log    ${publicId}
    #ลบ publicId ในMongoDB ก่อน prepare data
    ${publicId}    CheckResultAndDeleteDataBypublicId    ${DataBaseNameNSB}    ${Collection_MongoDB_privacyProfile}    ${publicId}
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #clear log
    SetLogNull    ${NameCmdFileLog_requestSetAgreeTC}    ${PathLogrequestSetAgreeTC}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_setAgreeTCRequested}    ${CmdProduce_setAgreeTC}    ${DataProduce_TST_F5_1_1_026}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${CmdConsume_setAgreeTCRequested}    TST_F5_1_1_026
    log    ${ConsumeResult}
    #check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F5_1_1_026}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCmdFileLog_requestSetAgreeTC}    TST_F5_1_1_026    ${PathLogrequestSetAgreeTC}
    VerifyStatByCommand    TST_F5_1_1_026    nsb-set-agree-tc    service-set-agree-tc    success
    #[Teardown]    Close All Connections
    Comment    ${result}    Common.VerifyStat    DMASTERSQA0001_service-set-agree-tc    /home/serveradm/nsb/service-set-agree-tc/logs
    Comment    AddNewSetAgreeTC20100    ${result}

TST_F5_1_1_027
    #หา publicId ใน MongoDB
    ${publicId}    QueryDataReturnpublicId    ${DataBaseNameNSB}    ${Collection_MongoDB_privacyProfile}    ${MobileNo_TST_F5_1_1_027}
    Log    ${publicId}
    #ลบ publicId ในMongoDB ก่อน prepare data
    ${publicId}    CheckResultAndDeleteDataBypublicId    ${DataBaseNameNSB}    ${Collection_MongoDB_privacyProfile}    ${publicId}
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #clear log
    SetLogNull    ${NameCmdFileLog_requestSetAgreeTC}    ${PathLogrequestSetAgreeTC}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_setAgreeTCRequested}    ${CmdProduce_setAgreeTC}    ${DataProduce_TST_F5_1_1_027}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${CmdConsume_setAgreeTCRequested}    TST_F5_1_1_027
    log    ${ConsumeResult}
    #check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F5_1_1_027}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCmdFileLog_requestSetAgreeTC}    TST_F5_1_1_027    ${PathLogrequestSetAgreeTC}
    VerifyStatByCommand    TST_F5_1_1_027    nsb-set-agree-tc    service-set-agree-tc    success
    #[Teardown]    Close All Connections
    Comment    ${result}    Common.VerifyStat    DMASTERSQA0001_service-set-agree-tc    /home/serveradm/nsb/service-set-agree-tc/logs
    Comment    AddNewSetAgreeTC20100    ${result}

TST_F5_0_1_028
    #หา publicId ใน MongoDB
    ${publicId}    QueryDataReturnpublicId    ${DataBaseNameNSB}    ${Collection_MongoDB_privacyProfile}    ${MobileNo_TST_F5_0_1_028}
    Log    ${publicId}
    #ลบ publicId ในMongoDB ก่อน prepare data
    ${publicId}    CheckResultAndDeleteDataBypublicId    ${DataBaseNameNSB}    ${Collection_MongoDB_privacyProfile}    ${publicId}
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #clear log
    SetLogNull    ${NameCmdFileLog_requestSetAgreeTC}    ${PathLogrequestSetAgreeTC}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_setAgreeTCRequested}    ${CmdProduce_setAgreeTC}    ${DataProduce_TST_F5_0_1_028}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    ConsumeKafka    ${CmdConsume_setAgreeTCRequested}    TST_F5_0_1_028
    Log    'consumeResult='${ConsumeResult}
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F5_0_1_028}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCmdFileLog_requestSetAgreeTC}    TST_F5_0_1_028    ${PathLogrequestSetAgreeTC}
    VerifyStatByCommand    TST_F5_0_1_028    nsb-set-agree-tc    service-set-agree-tc    error
    #[Teardown]    Close All Connections
    Comment    ${result}    Common.VerifyStat    DMASTERSQA0001_service-set-agree-tc    /home/serveradm/nsb/service-set-agree-tc/logs
    Comment    ErrorSetAgreeTC50000    ${result}

TST_F5_1_1_029
    #หา publicId ใน MongoDB
    ${publicId}    QueryDataReturnpublicId    ${DataBaseNameNSB}    ${Collection_MongoDB_privacyProfile}    ${MobileNo_TST_F5_1_1_029}
    #ลบ publicId ในMongoDB ก่อน prepare data
    ${publicId}    CheckResultAndDeleteDataBypublicId    ${DataBaseNameNSB}    ${Collection_MongoDB_privacyProfile}    ${publicId}
    #prepare MongoDB
    InsertDataFromJson    ${DataBaseNameNSB}    ${Collection_MongoDB_privacyProfile}    ${MongoDBPrepare_TST_F5_1_1_029}
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #clear log
    SetLogNull    ${NameCmdFileLog_requestSetAgreeTC}    ${PathLogrequestSetAgreeTC}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDelete_setAgreeTCRequested}    ${CmdProduce_setAgreeTC}    ${DataProduce_TST_F5_1_1_029}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${CmdConsume_setAgreeTCRequested}    TST_F5_1_1_029
    log    ${ConsumeResult}
    #check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F5_1_1_029}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    Sleep    20s
    FlushLogAndStatbyCommandName    ${NameCmdFileLog_requestSetAgreeTC}    TST_F5_1_1_029    ${PathLogrequestSetAgreeTC}
    VerifyStatByCommand    TST_F5_1_1_029    nsb-set-agree-tc    service-set-agree-tc    success
    #[Teardown]    Close All Connections
    Comment    ${result}    Common.VerifyStat    DMASTERSQA0001_service-set-agree-tc    /home/serveradm/nsb/service-set-agree-tc/logs
    Comment    InsertSetAgreeTC20000    ${result}
*** Keywords ***
CheckResultAndDeleteDataByMsisdn_Bo
    [Arguments]    ${DBName}    ${CollectionName}    ${msisdn}
    IF    "${msisdn}" == ""
    BuiltIn.Log Many    ${msisdn}
    ELSE
    DelectDataFromMsisdn    ${DBName}    ${CollectionName}    ${msisdn}
    END
    #publicId

CheckResultAndDeleteDataBypublicId
    [Arguments]    ${DBName}    ${CollectionName}    ${publicId}
    IF    "${publicId}" == ""
    log    ${publicId}
    ELSE
    DelectDataFrompublicId    ${DBName}    ${CollectionName}    ${publicId}
    ${publicId}    Set Variable    ${EMPTY}
    END
    [Return]    ${publicId}

CheckResultAndDeleteDataBypublicIdNull
    [Arguments]    ${DBName}    ${CollectionName}    ${publicId}
    # IF \ \ \ "${publicId}" == ""
    DelectDataFrompublicId    ${DBName}    ${CollectionName}    ${publicId}
    # ${publicId} \ \ \ Set Variable \ \ \ ${EMPTY}
    # END
    [Return]    ${publicId}
