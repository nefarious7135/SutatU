*** Settings ***
Resource          ../../Keyword/Common.robot
Resource          ../../Keyword/MongoDB.robot
Resource          ../../Keyword/SecureCRT.robot
Resource          ../../Valiables/CommonValiable/CommonValiable.robot
Resource          Variable.robot
*** Test Cases ***
TST_F16_1_1_001
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCmdFileLog_ServiceSpecification}    ${PathLog_ServiceSpecification}
    #produce kafka : requestServiceSpecification
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    Produce Kafka    ${CmdDelete_serviceSpecificationRequested}    ${CmdProduce_requestServiceSpecification}    ${DataProduce_TST_F16_1_1_001}
    #Consume kafka : serviceSpecificationRequested
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ${ConsumeResult}    Consume Kafka    ${CmdConsume_serviceSpecificationRequested}    TST_F16_1_1_001
    # check app produce serviceSpecificationRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F16_1_1_001}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    Flush Log by Command Name    ${NameCmdFileLog_ServiceSpecification}    TST_F16_1_1_001    ${PathLog_ServiceSpecification}
    #QueryMongoDB : LivingNetwork5GModePackage
    ${Actual_DB}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollectionNameLivingNetwork5GModePackage_QA}    {"mode" : "ECO_Mode_Free"}
    #check MongoDB vs Expect
    VerifyMongoDB    ${Actual_DB}    ${MongoDBExpect_TST_F16_1_1_001}
    [Teardown]    Close All Connections

TST_F16_1_1_002
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCmdFileLog_ServiceSpecification}    ${PathLog_ServiceSpecification}
    #produce kafka : requestServiceSpecification
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    Produce Kafka    ${CmdDelete_serviceSpecificationRequested}    ${CmdProduce_requestServiceSpecification}    ${DataProduce_TST_F16_1_1_002}
    #Consume kafka : serviceSpecificationRequested
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ${ConsumeResult}    Consume Kafka    ${CmdConsume_serviceSpecificationRequested}    TST_F16_1_1_002
    # check app produce serviceSpecificationRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F16_1_1_002}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    Flush Log by Command Name    ${NameCmdFileLog_ServiceSpecification}    TST_F16_1_1_002    ${PathLog_ServiceSpecification}
    #QueryMongoDB : LivingNetwork5GModePackage
    ${Actual_DB}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollectionNameLivingNetwork5GModePackage_QA}    {"mode" : "BOOST_Mode_Free"}
    #check MongoDB vs Expect
    VerifyMongoDB    ${Actual_DB}    ${MongoDBExpect_TST_F16_1_1_002}
    [Teardown]    Close All Connections

TST_F16_1_1_003
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCmdFileLog_ServiceSpecification}    ${PathLog_ServiceSpecification}
    #produce kafka : requestServiceSpecification
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    Produce Kafka    ${CmdDelete_serviceSpecificationRequested}    ${CmdProduce_requestServiceSpecification}    ${DataProduce_TST_F16_1_1_003}
    #Consume kafka : serviceSpecificationRequested
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ${ConsumeResult}    Consume Kafka    ${CmdConsume_serviceSpecificationRequested}    TST_F16_1_1_003
    # check app produce serviceSpecificationRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F16_1_1_003}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    Flush Log by Command Name    ${NameCmdFileLog_ServiceSpecification}    TST_F16_1_1_003    ${PathLog_ServiceSpecification}
    #QueryMongoDB : LivingNetwork5GModePackage
    ${Actual_DB}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollectionNameLivingNetwork5GModePackage_QA}    {"mode" : "BOOST_Mode_Charge"}
    #check MongoDB vs Expect
    VerifyMongoDB    ${Actual_DB}    ${MongoDBExpect_TST_F16_1_1_003}
    [Teardown]    Close All Connections

TST_F16_1_1_004
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCmdFileLog_ServiceSpecification}    ${PathLog_ServiceSpecification}
    #produce kafka : requestServiceSpecification
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    Produce Kafka    ${CmdDelete_serviceSpecificationRequested}    ${CmdProduce_requestServiceSpecification}    ${DataProduce_TST_F16_1_1_004}
    #Consume kafka : serviceSpecificationRequested
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ${ConsumeResult}    Consume Kafka    ${CmdConsume_serviceSpecificationRequested}    TST_F16_1_1_004
    # check app produce serviceSpecificationRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F16_1_1_004}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    Flush Log by Command Name    ${NameCmdFileLog_ServiceSpecification}    TST_F16_1_1_004    ${PathLog_ServiceSpecification}
    #QueryMongoDB : LivingNetwork5GModePackage
    ${Actual_DB}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollectionNameLivingNetwork5GModePackage_QA}    {"mode" : "GAME_Mode_Free"}
    #check MongoDB vs Expect
    VerifyMongoDB    ${Actual_DB}    ${MongoDBExpect_TST_F16_1_1_004}
    [Teardown]    Close All Connections

TST_F16_1_1_005
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCmdFileLog_ServiceSpecification}    ${PathLog_ServiceSpecification}
    #produce kafka : requestServiceSpecification
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    Produce Kafka    ${CmdDelete_serviceSpecificationRequested}    ${CmdProduce_requestServiceSpecification}    ${DataProduce_TST_F16_1_1_005}
    #Consume kafka : serviceSpecificationRequested
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ${ConsumeResult}    Consume Kafka    ${CmdConsume_serviceSpecificationRequested}    TST_F16_1_1_005
    # check app produce serviceSpecificationRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F16_1_1_005}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    Flush Log by Command Name    ${NameCmdFileLog_ServiceSpecification}    TST_F16_1_1_005    ${PathLog_ServiceSpecification}
    #QueryMongoDB : LivingNetwork5GModePackage
    ${Actual_DB}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollectionNameLivingNetwork5GModePackage_QA}    {"mode" : "GAME_Mode_Charge"}
    #check MongoDB vs Expect
    VerifyMongoDB    ${Actual_DB}    ${MongoDBExpect_TST_F16_1_1_005}
    [Teardown]    Close All Connections

TST_F16_1_1_006
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCmdFileLog_ServiceSpecification}    ${PathLog_ServiceSpecification}
    #produce kafka : requestServiceSpecification
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    Produce Kafka    ${CmdDelete_serviceSpecificationRequested}    ${CmdProduce_requestServiceSpecification}    ${DataProduce_TST_F16_1_1_006}
    #Consume kafka : serviceSpecificationRequested
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ${ConsumeResult}    Consume Kafka    ${CmdConsume_serviceSpecificationRequested}    TST_F16_1_1_006
    # check app produce serviceSpecificationRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F16_1_1_006}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    Flush Log by Command Name    ${NameCmdFileLog_ServiceSpecification}    TST_F16_1_1_006    ${PathLog_ServiceSpecification}
    #QueryMongoDB : LivingNetwork5GModePackage
    ${Actual_DB}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollectionNameLivingNetwork5GModePackage_QA}    {"mode" : "GAME_Mode_Charge"}
    #check MongoDB vs Expect
    VerifyMongoDB    ${Actual_DB}    ${MongoDBExpect_TST_F16_1_1_006}
    [Teardown]    Close All Connections

TST_F16_1_1_007
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCmdFileLog_ServiceSpecification}    ${PathLog_ServiceSpecification}
    #produce kafka : requestServiceSpecification
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    Produce Kafka    ${CmdDelete_serviceSpecificationRequested}    ${CmdProduce_requestServiceSpecification}    ${DataProduce_TST_F16_1_1_007}
    #Consume kafka : serviceSpecificationRequested
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ${ConsumeResult}    Consume Kafka    ${CmdConsume_serviceSpecificationRequested}    TST_F16_1_1_007
    # check app produce serviceSpecificationRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F16_1_1_007}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    Flush Log by Command Name    ${NameCmdFileLog_ServiceSpecification}    TST_F16_1_1_007    ${PathLog_ServiceSpecification}
    #QueryMongoDB : LivingNetwork5GModePackage
    ${Actual_DB}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollectionNameLivingNetwork5GModePackage_QA}    {"mode" : "ECO_Mode_Free"}
    #check MongoDB vs Expect
    VerifyMongoDB    ${Actual_DB}    ${MongoDBExpect_TST_F16_1_1_007}
    [Teardown]    Close All Connections

TST_F16_1_1_008
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCmdFileLog_ServiceSpecification}    ${PathLog_ServiceSpecification}
    #produce kafka : requestServiceSpecification
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    Produce Kafka    ${CmdDelete_serviceSpecificationRequested}    ${CmdProduce_requestServiceSpecification}    ${DataProduce_TST_F16_1_1_008}
    #Consume kafka : serviceSpecificationRequested
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ${ConsumeResult}    Consume Kafka    ${CmdConsume_serviceSpecificationRequested}    TST_F16_1_1_008
    # check app produce serviceSpecificationRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F16_1_1_008}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    Flush Log by Command Name    ${NameCmdFileLog_ServiceSpecification}    TST_F16_1_1_008    ${PathLog_ServiceSpecification}
    #QueryMongoDB : LivingNetwork5GModePackage
    ${Actual_DB}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollectionNameLivingNetwork5GModePackage_QA}    {"mode" : "BOOST_Mode_Free"}
    #check MongoDB vs Expect
    VerifyMongoDB    ${Actual_DB}    ${MongoDBExpect_TST_F16_1_1_008}
    [Teardown]    Close All Connections

TST_F16_1_1_009
    #QueryMongoDB : LivingNetwork5GModePackage
    ${Actual_DB}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollectionNameLivingNetwork5GModePackage_QA}    {"mode" : "GAME_Mode_Charge"}
    Log    ${Actual_DB}
    #PrepareDataMongoDB
    #QueryForReturnID
    ${Results}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollectionNameLivingNetwork5GModePackage_QA}    {"mode" : "GAME_Mode_Charge"}
    Log    ${Results}
    #DeleteDBFromID
    DeleteDataFromID    ${DataBaseNameNSB}    ${CollectionNameLivingNetwork5GModePackage_QA}    ${Results}
    #InsertDB
    ${InsertResults}    InsertDataFromJson    ${DataBaseNameNSB}    ${CollectionNameLivingNetwork5GModePackage_QA}    {"phx_product_id":"O1111P230344445","product_name":"5G_Internet_Speed GAME 399B 10GB 1Hour","packType":"ontop","mode":"GAME_Mode_Charge","effectiveOption":"B"}
    Log    ${InsertResults}
    #QueryMongoDB : LivingNetwork5GModePackage
    ${Actual_DB}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollectionNameLivingNetwork5GModePackage_QA}    {"mode" : "GAME_Mode_Charge"}
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCmdFileLog_ServiceSpecification}    ${PathLog_ServiceSpecification}
    #produce kafka : requestServiceSpecification
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    Produce Kafka    ${CmdDelete_serviceSpecificationRequested}    ${CmdProduce_requestServiceSpecification}    ${DataProduce_TST_F16_1_1_009}
    #Consume kafka : serviceSpecificationRequested
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ${ConsumeResult}    Consume Kafka    ${CmdConsume_serviceSpecificationRequested}    TST_F16_1_1_009
    # check app produce serviceSpecificationRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F16_1_1_009}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    Flush Log by Command Name    ${NameCmdFileLog_ServiceSpecification}    TST_F16_1_1_009    ${PathLog_ServiceSpecification}
    #check MongoDB vs Expect
    VerifyMongoDB    ${Actual_DB}    ${MongoDBExpect_TST_F16_1_1_009}
    #AddOldDBData (คืนค่าเดิม Database)
    #QueryForReturnID
    ${NewIDResults}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollectionNameLivingNetwork5GModePackage_QA}    {"mode" : "GAME_Mode_Charge"}
    Log    ${NewIDResults}
    #DeleteDBFromID
    DeleteDataFromID    ${DataBaseNameNSB}    ${CollectionNameLivingNetwork5GModePackage_QA}    ${NewIDResults}
    #InsertDB
    ${InsertOldDataResults}    InsertDataFromJson    ${DataBaseNameNSB}    ${CollectionNameLivingNetwork5GModePackage_QA}    {"promotionCode":"P240218778","phx_product_id":"O1111P230344445","product_name":"5G_Internet_Speed GAME 399B 10GB 1Hour","packType":"ontop","mode":"GAME_Mode_Charge","effectiveOption":"B"}
    Log    ${InsertOldDataResults}
    [Teardown]    Close All Connections

TST_F16_1_1_010
    #QueryMongoDB : LivingNetwork5GModePackage
    ${Actual_DB}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollectionNameLivingNetwork5GModePackage_QA}    {"mode" : "GAME_Mode_Charge"}
    Log    ${Actual_DB}
    #PrepareDataMongoDB
    #QueryForReturnID
    ${Results}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollectionNameLivingNetwork5GModePackage_QA}    {"mode" : "GAME_Mode_Charge"}
    Log    ${Results}
    #DeleteDBFromID
    DeleteDataFromID    ${DataBaseNameNSB}    ${CollectionNameLivingNetwork5GModePackage_QA}    ${Results}
    #InsertDB
    ${InsertResults}    InsertDataFromJson    ${DataBaseNameNSB}    ${CollectionNameLivingNetwork5GModePackage_QA}    {"promotionCode":"P240218778","product_name":"5G_Internet_Speed GAME 399B 10GB 1Hour","packType":"ontop","mode":"GAME_Mode_Charge","effectiveOption":"B"}
    Log    ${InsertResults}
    #QueryMongoDB : LivingNetwork5GModePackage
    ${Actual_DB}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollectionNameLivingNetwork5GModePackage_QA}    {"mode" : "GAME_Mode_Charge"}
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCmdFileLog_ServiceSpecification}    ${PathLog_ServiceSpecification}
    #produce kafka : requestServiceSpecification
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    Produce Kafka    ${CmdDelete_serviceSpecificationRequested}    ${CmdProduce_requestServiceSpecification}    ${DataProduce_TST_F16_1_1_010}
    #Consume kafka : serviceSpecificationRequested
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ${ConsumeResult}    Consume Kafka    ${CmdConsume_serviceSpecificationRequested}    TST_F16_1_1_010
    # check app produce serviceSpecificationRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F16_1_1_010}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    Flush Log by Command Name    ${NameCmdFileLog_ServiceSpecification}    TST_F16_1_1_010    ${PathLog_ServiceSpecification}
    #QueryMongoDB : LivingNetwork5GModePackage
    ${Actual_DB}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollectionNameLivingNetwork5GModePackage_QA}    {"mode" : "GAME_Mode_Charge"}
    #check MongoDB vs Expect
    VerifyMongoDB    ${Actual_DB}    ${MongoDBExpect_TST_F16_1_1_010}
    #AddOldDBData (คืนค่าเดิม Database)
    #QueryForReturnID
    ${NewIDResults}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollectionNameLivingNetwork5GModePackage_QA}    {"mode" : "GAME_Mode_Charge"}
    Log    ${NewIDResults}
    #DeleteDBFromID
    DeleteDataFromID    ${DataBaseNameNSB}    ${CollectionNameLivingNetwork5GModePackage_QA}    ${NewIDResults}
    #InsertDB
    ${InsertOldDataResults}    InsertDataFromJson    ${DataBaseNameNSB}    ${CollectionNameLivingNetwork5GModePackage_QA}    {"promotionCode":"P240218778","phx_product_id":"O1111P230344445","product_name":"5G_Internet_Speed GAME 399B 10GB 1Hour","packType":"ontop","mode":"GAME_Mode_Charge","effectiveOption":"B"}
    Log    ${InsertOldDataResults}
    [Teardown]    Close All Connections

TST_F16_1_1_011
    #QueryMongoDB : LivingNetwork5GModePackage
    ${Actual_DB}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollectionNameLivingNetwork5GModePackage_QA}    {"mode" : "GAME_Mode_Charge"}
    Log    ${Actual_DB}
    #PrepareDataMongoDB
    #QueryForReturnID
    ${Results}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollectionNameLivingNetwork5GModePackage_QA}    {"mode" : "GAME_Mode_Charge"}
    Log    ${Results}
    #DeleteDBFromID
    DeleteDataFromID    ${DataBaseNameNSB}    ${CollectionNameLivingNetwork5GModePackage_QA}    ${Results}
    #InsertDB
    ${InsertResults}    InsertDataFromJson    ${DataBaseNameNSB}    ${CollectionNameLivingNetwork5GModePackage_QA}    {"promotionCode":"P240218778","phx_product_id":"O1111P230344445","packType":"ontop","mode":"GAME_Mode_Charge","effectiveOption":"B"}
    Log    ${InsertResults}
    #QueryMongoDB : LivingNetwork5GModePackage
    ${Actual_DB}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollectionNameLivingNetwork5GModePackage_QA}    {"mode" : "GAME_Mode_Charge"}
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCmdFileLog_ServiceSpecification}    ${PathLog_ServiceSpecification}
    #produce kafka : requestServiceSpecification
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    Produce Kafka    ${CmdDelete_serviceSpecificationRequested}    ${CmdProduce_requestServiceSpecification}    ${DataProduce_TST_F16_1_1_011}
    #Consume kafka : serviceSpecificationRequested
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ${ConsumeResult}    Consume Kafka    ${CmdConsume_serviceSpecificationRequested}    TST_F16_1_1_011
    # check app produce serviceSpecificationRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F16_1_1_011}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    Flush Log by Command Name    ${NameCmdFileLog_ServiceSpecification}    TST_F16_1_1_011    ${PathLog_ServiceSpecification}
    #QueryMongoDB : LivingNetwork5GModePackage
    ${Actual_DB}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollectionNameLivingNetwork5GModePackage_QA}    {"mode" : "GAME_Mode_Charge"}
    #check MongoDB vs Expect
    VerifyMongoDB    ${Actual_DB}    ${MongoDBExpect_TST_F16_1_1_011}
    #AddOldDBData (คืนค่าเดิม Database)
    #QueryForReturnID
    ${NewIDResults}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollectionNameLivingNetwork5GModePackage_QA}    {"mode" : "GAME_Mode_Charge"}
    Log    ${NewIDResults}
    #DeleteDBFromID
    DeleteDataFromID    ${DataBaseNameNSB}    ${CollectionNameLivingNetwork5GModePackage_QA}    ${NewIDResults}
    #InsertDB
    ${InsertOldDataResults}    InsertDataFromJson    ${DataBaseNameNSB}    ${CollectionNameLivingNetwork5GModePackage_QA}    {"promotionCode":"P240218778","phx_product_id":"O1111P230344445","product_name":"5G_Internet_Speed GAME 399B 10GB 1Hour","packType":"ontop","mode":"GAME_Mode_Charge","effectiveOption":"B"}
    Log    ${InsertOldDataResults}
    [Teardown]    Close All Connections

TST_F16_1_1_012
    #QueryMongoDB : LivingNetwork5GModePackage
    ${Actual_DB}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollectionNameLivingNetwork5GModePackage_QA}    {"mode" : "GAME_Mode_Charge"}
    Log    ${Actual_DB}
    #PrepareDataMongoDB
    #QueryForReturnID
    ${Results}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollectionNameLivingNetwork5GModePackage_QA}    {"mode" : "GAME_Mode_Charge"}
    Log    ${Results}
    #DeleteDBFromID
    DeleteDataFromID    ${DataBaseNameNSB}    ${CollectionNameLivingNetwork5GModePackage_QA}    ${Results}
    #InsertDB
    ${InsertResults}    InsertDataFromJson    ${DataBaseNameNSB}    ${CollectionNameLivingNetwork5GModePackage_QA}    {"promotionCode":"P240218778","phx_product_id":"O1111P230344445","product_name":"5G_Internet_Speed GAME 399B 10GB 1Hour","mode":"GAME_Mode_Charge","effectiveOption":"B"}
    Log    ${InsertResults}
    #QueryMongoDB : LivingNetwork5GModePackage
    ${Actual_DB}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollectionNameLivingNetwork5GModePackage_QA}    {"mode" : "GAME_Mode_Charge"}
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCmdFileLog_ServiceSpecification}    ${PathLog_ServiceSpecification}
    #produce kafka : requestServiceSpecification
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    Produce Kafka    ${CmdDelete_serviceSpecificationRequested}    ${CmdProduce_requestServiceSpecification}    ${DataProduce_TST_F16_1_1_012}
    #Consume kafka : serviceSpecificationRequested
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ${ConsumeResult}    Consume Kafka    ${CmdConsume_serviceSpecificationRequested}    TST_F16_1_1_012
    # check app produce serviceSpecificationRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F16_1_1_012}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    Flush Log by Command Name    ${NameCmdFileLog_ServiceSpecification}    TST_F16_1_1_012    ${PathLog_ServiceSpecification}
    #QueryMongoDB : LivingNetwork5GModePackage
    ${Actual_DB}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollectionNameLivingNetwork5GModePackage_QA}    {"mode" : "GAME_Mode_Charge"}
    #check MongoDB vs Expect
    VerifyMongoDB    ${Actual_DB}    ${MongoDBExpect_TST_F16_1_1_012}
    #AddOldDBData (คืนค่าเดิม Database)
    #QueryForReturnID
    ${NewIDResults}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollectionNameLivingNetwork5GModePackage_QA}    {"mode" : "GAME_Mode_Charge"}
    Log    ${NewIDResults}
    #DeleteDBFromID
    DeleteDataFromID    ${DataBaseNameNSB}    ${CollectionNameLivingNetwork5GModePackage_QA}    ${NewIDResults}
    #InsertDB
    ${InsertOldDataResults}    InsertDataFromJson    ${DataBaseNameNSB}    ${CollectionNameLivingNetwork5GModePackage_QA}    {"promotionCode":"P240218778","phx_product_id":"O1111P230344445","product_name":"5G_Internet_Speed GAME 399B 10GB 1Hour","packType":"ontop","mode":"GAME_Mode_Charge","effectiveOption":"B"}
    Log    ${InsertOldDataResults}
    [Teardown]    Close All Connections

TST_F16_1_1_013
    #QueryMongoDB : LivingNetwork5GModePackage
    ${Actual_DB}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollectionNameLivingNetwork5GModePackage_QA}    {"mode" : "GAME_Mode_Charge"}
    Log    ${Actual_DB}
    #PrepareDataMongoDB
    #QueryForReturnID
    ${Results}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollectionNameLivingNetwork5GModePackage_QA}    {"mode" : "GAME_Mode_Charge"}
    Log    ${Results}
    #DeleteDBFromID
    DeleteDataFromID    ${DataBaseNameNSB}    ${CollectionNameLivingNetwork5GModePackage_QA}    ${Results}
    #InsertDB
    ${InsertResults}    InsertDataFromJson    ${DataBaseNameNSB}    ${CollectionNameLivingNetwork5GModePackage_QA}    {"promotionCode":"P240218778","phx_product_id":"O1111P230344445","product_name":"5G_Internet_Speed GAME 399B 10GB 1Hour","packType":"ontop","mode":"GAME_Mode_Charge"}
    Log    ${InsertResults}
    #QueryMongoDB : LivingNetwork5GModePackage
    ${Actual_DB}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollectionNameLivingNetwork5GModePackage_QA}    {"mode" : "GAME_Mode_Charge"}
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCmdFileLog_ServiceSpecification}    ${PathLog_ServiceSpecification}
    #produce kafka : requestServiceSpecification
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    Produce Kafka    ${CmdDelete_serviceSpecificationRequested}    ${CmdProduce_requestServiceSpecification}    ${DataProduce_TST_F16_1_1_013}
    #Consume kafka : serviceSpecificationRequested
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ${ConsumeResult}    Consume Kafka    ${CmdConsume_serviceSpecificationRequested}    TST_F16_1_1_013
    # check app produce serviceSpecificationRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F16_1_1_013}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    Flush Log by Command Name    ${NameCmdFileLog_ServiceSpecification}    TST_F16_1_1_013    ${PathLog_ServiceSpecification}
    #QueryMongoDB : LivingNetwork5GModePackage
    ${Actual_DB}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollectionNameLivingNetwork5GModePackage_QA}    {"mode" : "GAME_Mode_Charge"}
    #check MongoDB vs Expect
    VerifyMongoDB    ${Actual_DB}    ${MongoDBExpect_TST_F16_1_1_013}
    #AddOldDBData (คืนค่าเดิม Database)
    #QueryForReturnID
    ${NewIDResults}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollectionNameLivingNetwork5GModePackage_QA}    {"mode" : "GAME_Mode_Charge"}
    Log    ${NewIDResults}
    #DeleteDBFromID
    DeleteDataFromID    ${DataBaseNameNSB}    ${CollectionNameLivingNetwork5GModePackage_QA}    ${NewIDResults}
    #InsertDB
    ${InsertOldDataResults}    InsertDataFromJson    ${DataBaseNameNSB}    ${CollectionNameLivingNetwork5GModePackage_QA}    {"promotionCode":"P240218778","phx_product_id":"O1111P230344445","product_name":"5G_Internet_Speed GAME 399B 10GB 1Hour","packType":"ontop","mode":"GAME_Mode_Charge","effectiveOption":"B"}
    Log    ${InsertOldDataResults}
    [Teardown]    Close All Connections
