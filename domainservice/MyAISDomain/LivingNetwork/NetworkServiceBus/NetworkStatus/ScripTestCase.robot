*** Settings ***
Resource          Variable.robot
Resource          ../../Keyword/Common.robot
Resource          ../../Keyword/MongoDB.robot
Resource          ../../Keyword/SecureCRT.robot
Resource          ../../Keyword/Stat.robot
Resource          ../../Valiables/CommonValiable/CommonValiable.robot

*** Test Cases ***
TST_F2_1_1_001
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_kk}    ${PathLogNetworkStatus_kk}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #produce คำสั่ง ลง kafka
    ProduceKafka    ${CmdDeleteMassage_qa.requestProblemAreaCell01}    ${CmdProduce_qa.requestNetworkStatus01}    ${DataProduce_TST_F2_1_1_001}
    BuiltIn.Sleep    5
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #Consume คำสั่ง ลง kafka.requestProblemAreaCell
    ConsumeKafka    ${Consume_qa.requestProblemAreaCell01}    TST_F2_1_1_001
    # check ค่า \ \ \ kafka.requestProblemAreaCell
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.requestProblemAreaCell_TST_F2_1_1_001}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog_kk}    TST_F2_1_1_001    ${PathLogNetworkStatus_kk}
    # CheckUpsertMongoDB
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${msisdn_TST_F2_1_1_001}
    VerifyMongoDB    ${Jsondata}    ${JsonInsert_TST_F2_1_1_001}
    #verify stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    TST_F2_1_1_001    nsb-network-status    service-network-status-01    Success

TST_F2_1_1_002
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_kk}    ${PathLogNetworkStatus_kk}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #produce คำสั่ง ลง kafka
    ProduceKafka    ${CmdDeleteMassage_qa.requestProblemAreaCell01}    ${CmdProduce_qa.requestNetworkStatus01}    ${DataProduce_TST_F2_1_1_002}
    BuiltIn.Sleep    5
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #Consume คำสั่ง ลง kafka.requestProblemAreaCell
    ConsumeKafka    ${Consume_qa.requestProblemAreaCell01}    TST_F2_1_1_002
    # check ค่า \ \ \ kafka.requestProblemAreaCell
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.requestProblemAreaCell_TST_F2_1_1_002}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    BuiltIn.Sleep    30
    FlushLogAndStatbyCommandName    ${NameCommandFileLog_kk}    TST_F2_1_1_002    ${PathLogNetworkStatus_kk}
    # CheckUpsertMongoDB
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${msisdn_TST_F2_1_1_002}
    VerifyMongoDB    ${Jsondata}    ${JsonInsert_TST_F2_1_1_002}
    #verify stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    TST_F2_1_1_002    nsb-network-status    service-network-status-01    Success

TST_F2_1_1_003
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_kk}    ${PathLogNetworkStatus_kk}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #produce คำสั่ง ลง kafka
    ProduceKafka    ${CmdDeleteMassage_qa.requestProblemAreaCell01}    ${CmdProduce_qa.requestNetworkStatus01}    ${DataProduce_TST_F2_1_1_003}
    BuiltIn.Sleep    5
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #Consume คำสั่ง ลง kafka.requestProblemAreaCell
    ConsumeKafka    ${Consume_qa.requestProblemAreaCell01}    TST_F2_1_1_003
    # check ค่า \ \ \ kafka.requestProblemAreaCell
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.requestProblemAreaCell_TST_F2_1_1_003}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    BuiltIn.Sleep    30
    FlushLogAndStatbyCommandName    ${NameCommandFileLog_kk}    TST_F2_1_1_003    ${PathLogNetworkStatus_kk}
    # CheckUpsertMongoDB
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${msisdn_TST_F2_1_1_003}
    VerifyMongoDB    ${Jsondata}    ${JsonInsert_TST_F2_1_1_003}
    #verify stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    TST_F2_1_1_003    nsb-network-status    service-network-status-01    Success

TST_F2_1_1_004
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_kk}    ${PathLogNetworkStatus_kk}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #produce คำสั่ง ลง kafka
    ProduceKafka    ${CmdDeleteMassage_qa.requestProblemAreaCell01}    ${CmdProduce_qa.requestNetworkStatus01}    ${DataProduce_TST_F2_1_1_004}
    BuiltIn.Sleep    5
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #Consume คำสั่ง ลง kafka.requestProblemAreaCell
    ConsumeKafka    ${Consume_qa.requestProblemAreaCell01}    TST_F2_1_1_004
    # check ค่า \ \ \ kafka.requestProblemAreaCell
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.requestProblemAreaCell_TST_F2_1_1_004}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    BuiltIn.Sleep    30
    FlushLogAndStatbyCommandName    ${NameCommandFileLog_kk}    TST_F2_1_1_004    ${PathLogNetworkStatus_kk}
    # CheckUpsertMongoDB
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${msisdn_TST_F2_1_1_004}
    VerifyMongoDB    ${Jsondata}    ${JsonInsert_TST_F2_1_1_004}
    #verify stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    TST_F2_1_1_004    nsb-network-status    service-network-status-01    Success

TST_F2_1_1_005
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_kk}    ${PathLogNetworkStatus_kk}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #produce คำสั่ง ลง kafka
    ProduceKafka    ${CmdDeleteMassage_qa.requestProblemAreaCell01}    ${CmdProduce_qa.requestNetworkStatus01}    ${DataProduce_TST_F2_1_1_005}
    BuiltIn.Sleep    5
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #Consume คำสั่ง ลง kafka.requestProblemAreaCell
    ConsumeKafka    ${Consume_qa.requestProblemAreaCell01}    TST_F2_1_1_005
    # check ค่า \ \ \ kafka.requestProblemAreaCell
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.requestProblemAreaCell_TST_F2_1_1_005}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    BuiltIn.Sleep    30
    FlushLogAndStatbyCommandName    ${NameCommandFileLog_kk}    TST_F2_1_1_005    ${PathLogNetworkStatus_kk}
    # CheckUpsertMongoDB
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${msisdn_TST_F2_1_1_005}
    VerifyMongoDB    ${Jsondata}    ${JsonInsert_TST_F2_1_1_005}
    #verify stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    TST_F2_1_1_005    nsb-network-status    service-network-status-01    Success

TST_F2_1_1_006
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog}    ${PathLogNetworkStatus}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #produce คำสั่ง ลง kafka
    ProduceKafka    ${CmdDeleteMassage_qa.requestProblemAreaCell01}    ${CmdProduce_qa.requestNetworkStatus01}    ${DataProduce_TST_F2_1_1_006}
    BuiltIn.Sleep    5
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #Consume คำสั่ง ลง kafka.requestProblemAreaCell
    ConsumeKafka    ${Consume_qa.requestProblemAreaCell01}    TST_F2_1_1_006
    # check ค่า \ \ \ kafka.requestProblemAreaCell
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.requestProblemAreaCell_TST_F2_1_1_006}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    BuiltIn.Sleep    30
    FlushLogAndStatbyCommandName    ${NameCommandFileLog_kk}    TST_F2_1_1_006    ${PathLogNetworkStatus_kk}
    # CheckUpsertMongoDB
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${msisdn_TST_F2_1_1_006}
    VerifyMongoDB    ${Jsondata}    ${JsonInsert_TST_F2_1_1_006}
    #verify stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    TST_F2_1_1_006    nsb-network-status    service-network-status-01    Success

TST_F2_1_1_007
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog}    ${PathLogNetworkStatus}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #produce คำสั่ง ลง kafka
    ProduceKafka    ${CmdDeleteMassage_qa.requestProblemAreaCell01}    ${CmdProduce_qa.requestNetworkStatus01}    ${DataProduce_TST_F2_1_1_007}
    BuiltIn.Sleep    5
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #Consume คำสั่ง ลง kafka.requestProblemAreaCell
    ConsumeKafka    ${Consume_qa.requestProblemAreaCell01}    TST_F2_1_1_007
    # check ค่า \ \ \ kafka.requestProblemAreaCell
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.requestProblemAreaCell_TST_F2_1_1_007}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    BuiltIn.Sleep    30
    FlushLogAndStatbyCommandName    ${NameCommandFileLog_kk}    TST_F2_1_1_007    ${PathLogNetworkStatus_kk}
    # CheckUpsertMongoDB
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${msisdn_TST_F2_1_1_007}
    VerifyMongoDB    ${Jsondata}    ${JsonInsert_TST_F2_1_1_007}
    #verify stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    TST_F2_1_1_007    nsb-network-status    service-network-status-01    Success

TST_F2_1_1_008
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog}    ${PathLogNetworkStatus}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #produce คำสั่ง ลง kafka
    ProduceKafka    ${CmdDeleteMassage_qa.requestProblemAreaCell01}    ${CmdProduce_qa.requestNetworkStatus01}\n    ${DataProduce_TST_F2_1_1_008}
    BuiltIn.Sleep    5
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #Consume คำสั่ง ลง kafka.requestProblemAreaCell
    ConsumeKafka    ${Consume_qa.requestProblemAreaCell01}    TST_F2_1_1_008
    # check ค่า \ \ \ kafka.requestProblemAreaCell
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.requestProblemAreaCell_TST_F2_1_1_008}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    BuiltIn.Sleep    30
    FlushLogAndStatbyCommandName    ${NameCommandFileLog_kk}    TST_F2_1_1_008    ${PathLogNetworkStatus_kk}
    # CheckUpsertMongoDB
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${msisdn_TST_F2_1_1_008}
    VerifyMongoDB    ${Jsondata}    ${JsonInsert_TST_F2_1_1_008}
    #verify stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    TST_F2_1_1_008    nsb-network-status    service-network-status-01    Success

TST_F2_1_1_009
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog}    ${PathLogNetworkStatus}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #produce คำสั่ง ลง kafka
    ProduceKafka    ${CmdDeleteMassage_qa.requestProblemAreaCell01}    ${CmdProduce_qa.requestNetworkStatus01}    ${DataProduce_TST_F2_1_1_009}
    BuiltIn.Sleep    5
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #Consume คำสั่ง ลง kafka.requestProblemAreaCell
    ConsumeKafka    ${Consume_qa.requestProblemAreaCell01}    TST_F2_1_1_009
    # check ค่า \ \ \ kafka.requestProblemAreaCell
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.requestProblemAreaCell_TST_F2_1_1_009}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    BuiltIn.Sleep    30
    FlushLogAndStatbyCommandName    ${NameCommandFileLog_kk}    TST_F2_1_1_009    ${PathLogNetworkStatus_kk}
    # CheckUpsertMongoDB
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${msisdn_TST_F2_1_1_009}
    VerifyMongoDB    ${Jsondata}    ${JsonInsert_TST_F2_1_1_009}
    #verify stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    TST_F2_1_1_009    nsb-network-status    service-network-status-01    Success

TST_F2_1_1_010
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_kk}    ${PathLogNetworkStatus_kk}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #produce คำสั่ง ลง kafka
    ProduceKafka    ${CmdDeleteMassage_qa.requestProblemAreaCell01}    ${CmdProduce_qa.requestNetworkStatus01}    ${DataProduce_TST_F2_1_1_010}
    BuiltIn.Sleep    5
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #Consume คำสั่ง ลง kafka.requestProblemAreaCell
    ConsumeKafka    ${Consume_qa.requestProblemAreaCell01}    TST_F2_1_1_010
    # check ค่า \ \ \ kafka.requestProblemAreaCell
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.requestProblemAreaCell_TST_F2_1_1_010}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    BuiltIn.Sleep    30
    FlushLogAndStatbyCommandName    ${NameCommandFileLog_kk}    TST_F2_1_1_010    ${PathLogNetworkStatus_kk}
    # CheckUpsertMongoDB
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${msisdn_TST_F2_1_1_010}
    VerifyMongoDB    ${Jsondata}    ${JsonInsert_TST_F2_1_1_010}
    #verify stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    TST_F2_1_1_010    nsb-network-status    service-network-status-01    Success

TST_F2_1_1_011
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_F2}    ${PathLogNetworkStatus}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #produce คำสั่ง ลง kafka
    ProduceKafka    ${CmdDeleteMassage_qa.requestNetworkStatus}    ${CmdProduce_qa.requestNetworkStatus}    ${DataProduce_TST_F2_1_1_011}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #Consume คำสั่ง ลง kafka.requestProblemAreaCell
    ConsumeKafka    ${Consume_qa.requestProblemAreaCell}    TST_F2_1_1_011
    # check ค่า \ \ \ kafka.requestProblemAreaCell
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.requestProblemAreaCell_TST_F2_1_1_011}
    # CheckUpsertMongoDB
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper_F2}    ${msisdn_TST_F2_1_1_011}
    VerifyMongoDB    ${Jsondata}    ${JsonInsert_TST_F2_1_1_011}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog_F2}    TST_F2_1_1_011    ${PathLogNetworkStatus}
    #verify stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    TST_F2_1_1_011    nsb-network-status    service-network-status    Success

TST_F2_1_1_012
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_F2}    ${PathLogNetworkStatus}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #produce คำสั่ง ลง kafka
    ProduceKafka    ${CmdDeleteMassage_qa.requestNetworkStatus}    ${CmdProduce_qa.requestNetworkStatus}    ${DataProduce_TST_F2_1_1_012}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #Consume คำสั่ง ลง kafka.requestProblemAreaCell
    ConsumeKafka    ${Consume_qa.requestProblemAreaCell}    TST_F2_1_1_012
    # check ค่า \ \ \ kafka.requestProblemAreaCell
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.requestProblemAreaCell_TST_F2_1_1_012}
    # CheckUpsertMongoDB
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper_F2}    ${msisdn_TST_F2_1_1_012}
    VerifyMongoDB    ${Jsondata}    ${JsonInsert_TST_F2_1_1_012}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog_F2}    TST_F2_1_1_012    ${PathLogNetworkStatus}
    #verify stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    TST_F2_1_1_012    nsb-network-status    service-network-status    Success
    [Teardown]    Close All Connections

TST_F2_1_1_013
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_F2}    ${PathLogNetworkStatus}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #produce คำสั่ง ลง kafka
    ProduceKafka    ${CmdDeleteMassage_qa.requestNetworkStatus}    ${CmdProduce_qa.requestNetworkStatus}    ${DataProduce_TST_F2_1_1_013}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #Consume คำสั่ง ลง kafka.requestProblemAreaCell
    ConsumeKafka    ${Consume_qa.requestProblemAreaCell}    TST_F2_1_1_013
    # check ค่า \ \ \ kafka.requestProblemAreaCell
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.requestProblemAreaCell_TST_F2_1_1_013}
    # CheckUpsertMongoDB
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper_F2}    ${msisdn_TST_F2_1_1_013}
    VerifyMongoDB    ${Jsondata}    ${JsonInsert_TST_F2_1_1_013}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog_F2}    TST_F2_1_1_013    ${PathLogNetworkStatus}
    #verify stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    TST_F2_1_1_013    nsb-network-status    service-network-status    Success
    [Teardown]    Close All Connections

TST_F2_1_1_014
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_F2}    ${PathLogNetworkStatus}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #produce คำสั่ง ลง kafka
    ProduceKafka    ${CmdDeleteMassage_qa.requestNetworkStatus}    ${CmdProduce_qa.requestNetworkStatus}    ${DataProduce_TST_F2_1_1_014}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #Consume คำสั่ง ลง kafka.requestProblemAreaCell
    ConsumeKafka    ${Consume_qa.requestProblemAreaCell}    TST_F2_1_1_014
    # check ค่า \ \ \ kafka.requestProblemAreaCell
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.requestProblemAreaCell_TST_F2_1_1_014}
    # CheckUpsertMongoDB
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper_F2}    ${msisdn_TST_F2_1_1_014}
    VerifyMongoDB    ${Jsondata}    ${JsonInsert_TST_F2_1_1_014}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog_F2}    TST_F2_1_1_014    ${PathLogNetworkStatus}
    #verify stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    TST_F2_1_1_014    nsb-network-status    service-network-status    Success
    [Teardown]    Close All Connections

TST_F2_1_1_015
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_F2}    ${PathLogNetworkStatus}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #produce คำสั่ง ลง kafka
    ProduceKafka    ${CmdDeleteMassage_qa.requestNetworkStatus}    ${CmdProduce_qa.requestNetworkStatus}    ${DataProduce_TST_F2_1_1_015}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #Consume คำสั่ง ลง kafka.requestProblemAreaCell
    ConsumeKafka    ${Consume_qa.requestProblemAreaCell}    TST_F2_1_1_015
    # check ค่า \ \ \ kafka.requestProblemAreaCell
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.requestProblemAreaCell_TST_F2_1_1_015}
    # CheckUpsertMongoDB
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper_F2}    ${msisdn_TST_F2_1_1_015}
    VerifyMongoDB    ${Jsondata}    ${JsonInsert_TST_F2_1_1_015}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog_F2}    TST_F2_1_1_015    ${PathLogNetworkStatus}
    #verify stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    TST_F2_1_1_015    nsb-network-status    service-network-status    Success
    [Teardown]    Close All Connections

TST_F2_1_1_017
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_F2}    ${PathLogNetworkStatus}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #produce คำสั่ง ลง kafka
    ProduceKafka    ${CmdDeleteMassage_qa.requestNetworkStatus}    ${CmdProduce_qa.requestNetworkStatus}    ${DataProduce_TST_F2_1_1_017}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #Consume คำสั่ง ลง kafka.requestProblemAreaCell
    ConsumeKafka    ${Consume_qa.requestProblemAreaCell}    TST_F2_1_1_017
    # check ค่า \ \ \ kafka.requestProblemAreaCell
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.requestProblemAreaCell_TST_F2_1_1_017}
    # CheckUpsertMongoDB
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper_F2}    ${msisdn_TST_F2_1_1_017}
    VerifyMongoDB    ${Jsondata}    ${JsonInsert_TST_F2_1_1_017}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog_F2}    TST_F2_1_1_017    ${PathLogNetworkStatus}
    #verify stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    TST_F2_1_1_017    nsb-network-status    service-network-status    Success
    [Teardown]    Close All Connections

TST_F2_1_1_018
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_F2}    ${PathLogNetworkStatus}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #produce คำสั่ง ลง kafka
    ProduceKafka    ${CmdDeleteMassage_qa.requestNetworkStatus}    ${CmdProduce_qa.requestNetworkStatus}    ${DataProduce_TST_F2_1_1_018}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #Consume คำสั่ง ลง kafka.requestProblemAreaCell
    ConsumeKafka    ${Consume_qa.requestProblemAreaCell}    TST_F2_1_1_018
    # check ค่า \ \ \ kafka.requestProblemAreaCell
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.requestProblemAreaCell_TST_F2_1_1_018}
    # CheckUpsertMongoDB
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper_F2}    ${msisdn_TST_F2_1_1_018}
    VerifyMongoDB    ${Jsondata}    ${JsonInsert_TST_F2_1_1_018}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog_F2}    TST_F2_1_1_018    ${PathLogNetworkStatus}
    #verify stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    TST_F2_1_1_018    nsb-network-status    service-network-status    Success
    [Teardown]    Close All Connections

TST_F2_1_1_019
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_F2}    ${PathLogNetworkStatus}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #produce คำสั่ง ลง kafka
    ProduceKafka    ${CmdDeleteMassage_qa.requestNetworkStatus}    ${CmdProduce_qa.requestNetworkStatus}    ${DataProduce_TST_F2_1_1_019}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #Consume คำสั่ง ลง kafka.requestProblemAreaCell
    ConsumeKafka    ${Consume_qa.requestProblemAreaCell}    TST_F2_1_1_019
    # check ค่า \ \ \ kafka.requestProblemAreaCell
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.requestProblemAreaCell_TST_F2_1_1_019}
    # CheckUpsertMongoDB
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper_F2}    ${msisdn_TST_F2_1_1_019}
    VerifyMongoDB    ${Jsondata}    ${JsonInsert_TST_F2_1_1_019}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog_F2}    TST_F2_1_1_019    ${PathLogNetworkStatus}
    #verify stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    TST_F2_1_1_019    nsb-network-status    service-network-status    Success
    [Teardown]    Close All Connections

TST_F2_0_1_020
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_kk}    ${PathLogNetworkStatus_kk}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #produce คำสั่ง ลง kafka
    ProduceKafka    ${CmdDeleteMassage_qa.requestProblemAreaCell01}    ${CmdProduce_qa.requestNetworkStatus01}    ${DataProduce_TST_F2_0_1_020}
    BuiltIn.Sleep    5
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #Consume คำสั่ง ลง kafka.requestProblemAreaCell
    ConsumeKafka    ${Consume_qa.requestProblemAreaCell01}    TST_F2_0_1_020
    # check ค่า \ \ \ kafka.requestProblemAreaCell
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.requestProblemAreaCell_TST_F2_0_1_020}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    BuiltIn.Sleep    30
    FlushLogAndStatbyCommandName    ${NameCommandFileLog_kk}    TST_F2_0_1_020    ${PathLogNetworkStatus_kk}
    # CheckUpsertMongoDB
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${transaction_TST_F2_0_1_020}
    VerifyMongoDB    ${Jsondata}    ${JsonInsert_TST_F2_0_1_020}
    #verify stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    TST_F2_0_1_020    nsb-network-status    service-network-status-01    ERROR_MISSING_INVALID

TST_F2_1_1_021
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_kk}    ${PathLogNetworkStatus_kk}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #produce คำสั่ง ลง kafka
    ProduceKafka    ${CmdDeleteMassage_qa.requestProblemAreaCell01}    ${CmdProduce_qa.requestNetworkStatus01}    ${DataProduce_TST_F2_1_1_021}
    BuiltIn.Sleep    5
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #Consume คำสั่ง ลง kafka.requestProblemAreaCell
    ConsumeKafka    ${Consume_qa.requestProblemAreaCell01}    TST_F2_1_1_021
    # check ค่า \ \ \ kafka.requestProblemAreaCell
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.requestProblemAreaCell_TST_F2_1_1_021}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    BuiltIn.Sleep    30
    FlushLogAndStatbyCommandName    ${NameCommandFileLog_kk}    TST_F2_1_1_021    ${PathLogNetworkStatus_kk}
    # CheckUpsertMongoDB
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${msisdn_TST_F2_1_1_021}
    VerifyMongoDB    ${Jsondata}    ${JsonInsert_TST_F2_1_1_021}
    #verify stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    TST_F2_1_1_021    nsb-network-status    service-network-status-01    Success

TST_F2_1_1_022
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_kk}    ${PathLogNetworkStatus_kk}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #produce คำสั่ง ลง kafka
    ProduceKafka    ${CmdDeleteMassage_qa.requestProblemAreaCell01}    ${CmdProduce_qa.requestNetworkStatus01}    ${DataProduce_TST_F2_1_1_022}
    BuiltIn.Sleep    5
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #Consume คำสั่ง ลง kafka.requestProblemAreaCell
    ConsumeKafka    ${Consume_qa.requestProblemAreaCell01}    TST_F2_1_1_022
    # check ค่า \ \ \ kafka.requestProblemAreaCell
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.requestProblemAreaCell_TST_F2_1_1_022}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    BuiltIn.Sleep    30
    FlushLogAndStatbyCommandName    ${NameCommandFileLog_kk}    TST_F2_1_1_022    ${PathLogNetworkStatus_kk}
    # CheckUpsertMongoDB
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${msisdn_TST_F2_1_1_022}
    VerifyMongoDB    ${Jsondata}    ${JsonInsert_TST_F2_1_1_022}
    #verify stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    TST_F2_1_1_022    nsb-network-status    service-network-status-01    Success

TST_F2_1_1_023
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_kk}    ${PathLogNetworkStatus_kk}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #produce คำสั่ง ลง kafka
    ProduceKafka    ${CmdDeleteMassage_qa.requestProblemAreaCell01}    ${CmdProduce_qa.requestNetworkStatus01}    ${DataProduce_TST_F2_1_1_023}
    BuiltIn.Sleep    5
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #Consume คำสั่ง ลง kafka.requestProblemAreaCell
    ConsumeKafka    ${Consume_qa.requestProblemAreaCell01}    TST_F2_1_1_023
    # check ค่า \ \ \ kafka.requestProblemAreaCell
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.requestProblemAreaCell_TST_F2_1_1_023}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    BuiltIn.Sleep    30
    FlushLogAndStatbyCommandName    ${NameCommandFileLog_kk}    TST_F2_1_1_023    ${PathLogNetworkStatus_kk}
    # CheckUpsertMongoDB
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${msisdn_TST_F2_1_1_023}
    VerifyMongoDB    ${Jsondata}    ${JsonInsert_TST_F2_1_1_023}
    #verify stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    TST_F2_1_1_023    nsb-network-status    service-network-status-01    Success

TST_F2_1_1_024
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_kk}    ${PathLogNetworkStatus_kk}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #produce คำสั่ง ลง kafka
    ProduceKafka    ${CmdDeleteMassage_qa.requestProblemAreaCell01}    ${CmdProduce_qa.requestNetworkStatus01}    ${DataProduce_TST_F2_1_1_024}
    BuiltIn.Sleep    5
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #Consume คำสั่ง ลง kafka.requestProblemAreaCell
    ConsumeKafka    ${Consume_qa.requestProblemAreaCell01}    TST_F2_1_1_024
    # check ค่า \ \ \ kafka.requestProblemAreaCell
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.requestProblemAreaCell_TST_F2_1_1_024}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    BuiltIn.Sleep    30
    FlushLogAndStatbyCommandName    ${NameCommandFileLog_kk}    TST_F2_1_1_024    ${PathLogNetworkStatus_kk}
    # CheckUpsertMongoDB
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${msisdn_TST_F2_1_1_024}
    VerifyMongoDB    ${Jsondata}    ${JsonInsert_TST_F2_1_1_024}
    #verify stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    TST_F2_1_1_024    nsb-network-status    service-network-status-01    Success

TST_F2_1_1_025
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_kk}    ${PathLogNetworkStatus_kk}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #produce คำสั่ง ลง kafka
    ProduceKafka    ${CmdDeleteMassage_qa.requestProblemAreaCell01}    ${CmdProduce_qa.requestNetworkStatus01}    ${DataProduce_TST_F2_1_1_025}
    BuiltIn.Sleep    5
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #Consume คำสั่ง ลง kafka.requestProblemAreaCell
    ConsumeKafka    ${Consume_qa.requestProblemAreaCell01}    TST_F2_1_1_025
    # check ค่า \ \ \ kafka.requestProblemAreaCell
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.requestProblemAreaCell_TST_F2_1_1_025}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    BuiltIn.Sleep    30
    FlushLogAndStatbyCommandName    ${NameCommandFileLog_kk}    TST_F2_1_1_025    ${PathLogNetworkStatus_kk}
    # CheckUpsertMongoDB
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${msisdn_TST_F2_1_1_025}
    VerifyMongoDB    ${Jsondata}    ${JsonInsert_TST_F2_1_1_025}
    #verify stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    TST_F2_1_1_025    nsb-network-status    service-network-status-01    Success

TST_F2_0_1_026
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_kk}    ${PathLogNetworkStatus_kk}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #produce คำสั่ง ลง kafka
    ProduceKafka    ${CmdDeleteMassage_qa.requestProblemAreaCell01}    ${CmdProduce_qa.requestNetworkStatus01}    ${DataProduce_TST_F2_0_1_026}
    BuiltIn.Sleep    5
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #Consume คำสั่ง ลง kafka.requestProblemAreaCell
    ConsumeKafka    ${Consume_qa.requestProblemAreaCell01}    TST_F2_0_1_026
    # check ค่า \ \ \ kafka.requestProblemAreaCell
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.requestProblemAreaCell_TST_F2_0_1_026}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    BuiltIn.Sleep    30
    FlushLogAndStatbyCommandName    ${NameCommandFileLog_kk}    TST_F2_0_1_026    ${PathLogNetworkStatus_kk}
    # CheckUpsertMongoDB
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${transaction_TST_F2_0_1_026}
    VerifyMongoDB    ${Jsondata}    ${JsonInsert_TST_F2_0_1_026}
    #verify stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    TST_F2_0_1_026    nsb-network-status    service-network-status-01    ERROR_MISSING_INVALID

TST_F2_1_1_050
    #กำหนดค่าในเคส
    ${table}    BuiltIn.Set Variable    {"table" : "qualityStatus"}
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #หา table \ ใน MongoDB
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollectionNameqaNetworkQualityStatus}    ${table}
    Log    ${ID}
    #ลบข้อมูลใน MongoDB ก่อน insert
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollectionNameqaNetworkQualityStatus}    ${Data_qaNetworkQualityStatus_TST_F2_1_1_050}    ${ID}
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_F2}    ${PathLogNetworkStatus}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #produce คำสั่ง ลง kafka
    ProduceKafka    ${CmdDeleteMassage_qa.requestNetworkStatus}    ${CmdProduce_qa.requestNetworkStatus}    ${DataProduce_TST_F2_1_1_050}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #Consume คำสั่ง ลง kafka.requestProblemAreaCell
    ConsumeKafka    ${Consume_qa.requestProblemAreaCell}    TST_F2_1_1_050
    # check ค่า \ \ \ kafka.requestProblemAreaCell
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.requestProblemAreaCell_TST_F2_1_1_050}
    # CheckUpsertMongoDB
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper_F2}    ${msisdn_TST_F2_1_1_050}
    VerifyMongoDB    ${Jsondata}    ${JsonInsert_TST_F2_1_1_050}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog_F2}    TST_F2_1_1_050    ${PathLogNetworkStatus}
    #verify stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    TST_F2_1_1_050    nsb-network-status    service-network-status    SUCCESS_DB40400
    #ลบข้อมูลใน MongoDB แล้ว insert ข้อมูลที่เป็น default
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollectionNameqaNetworkQualityStatus}    ${table}
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollectionNameqaNetworkQualityStatus}    ${Data_qaNetworkQualityStatus_default}    ${ID}

TST_F2_1_1_051
    #กำหนดค่าในเคส
    ${table}    BuiltIn.Set Variable    {"table" : "qualityStatus"}
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #หา table \ ใน MongoDB
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollectionNameqaNetworkQualityStatus}    ${table}
    Log    ${ID}
    #ลบข้อมูลใน MongoDB ก่อน insert
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollectionNameqaNetworkQualityStatus}    ${Data_qaNetworkQualityStatus_TST_F2_1_1_051}    ${ID}
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_F2}    ${PathLogNetworkStatus}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #produce คำสั่ง ลง kafka
    ProduceKafka    ${CmdDeleteMassage_qa.requestNetworkStatus}    ${CmdProduce_qa.requestNetworkStatus}    ${DataProduce_TST_F2_1_1_051}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #Consume คำสั่ง ลง kafka.requestProblemAreaCell
    ConsumeKafka    ${Consume_qa.requestProblemAreaCell}    TST_F2_1_1_051
    # check ค่า \ \ \ kafka.requestProblemAreaCell
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.requestProblemAreaCell_TST_F2_1_1_051}
    # CheckUpsertMongoDB
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper_F2}    ${msisdn_TST_F2_1_1_051}
    VerifyMongoDB    ${Jsondata}    ${JsonInsert_TST_F2_1_1_051}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog_F2}    TST_F2_1_1_051    ${PathLogNetworkStatus}
    #verify stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    TST_F2_1_1_051    nsb-network-status    service-network-status    Success
    #ลบข้อมูลใน MongoDB แล้ว insert ข้อมูลที่เป็น default
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollectionNameqaNetworkQualityStatus}    ${table}
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollectionNameqaNetworkQualityStatus}    ${Data_qaNetworkQualityStatus_default}    ${ID}

TST_F2_1_1_052
    #กำหนดค่าในเคส
    ${table}    BuiltIn.Set Variable    {"table" : "qualityStatus"}
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #หา table \ ใน MongoDB
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollectionNameqaNetworkQualityStatus}    ${table}
    Log    ${ID}
    #ลบข้อมูลใน MongoDB ก่อน insert
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollectionNameqaNetworkQualityStatus}    ${Data_qaNetworkQualityStatus_TST_F2_1_1_052}    ${ID}
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_F2}    ${PathLogNetworkStatus}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #produce คำสั่ง ลง kafka
    ProduceKafka    ${CmdDeleteMassage_qa.requestNetworkStatus}    ${CmdProduce_qa.requestNetworkStatus}    ${DataProduce_TST_F2_1_1_052}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #Consume คำสั่ง ลง kafka.requestProblemAreaCell
    ConsumeKafka    ${Consume_qa.requestProblemAreaCell}    TST_F2_1_1_052
    # check ค่า \ \ \ kafka.requestProblemAreaCell
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.requestProblemAreaCell_TST_F2_1_1_052}
    # CheckUpsertMongoDB
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper_F2}    ${msisdn_TST_F2_1_1_052}
    VerifyMongoDB    ${Jsondata}    ${JsonInsert_TST_F2_1_1_052}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog_F2}    TST_F2_1_1_052    ${PathLogNetworkStatus}
    #verify stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    TST_F2_1_1_052    nsb-network-status    service-network-status    Success
    #ลบข้อมูลใน MongoDB แล้ว insert ข้อมูลที่เป็น default
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollectionNameqaNetworkQualityStatus}    ${table}
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollectionNameqaNetworkQualityStatus}    ${Data_qaNetworkQualityStatus_default}    ${ID}

TST_F2_1_1_053
    #กำหนดค่าในเคส
    ${table}    BuiltIn.Set Variable    {"table" : "qualityStatus"}
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #หา table \ ใน MongoDB
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollectionNameqaNetworkQualityStatus}    ${table}
    Log    ${ID}
    #ลบข้อมูลใน MongoDB ก่อน insert
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollectionNameqaNetworkQualityStatus}    ${Data_qaNetworkQualityStatus_TST_F2_1_1_053}    ${ID}
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_F2}    ${PathLogNetworkStatus}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #produce คำสั่ง ลง kafka
    ProduceKafka    ${CmdDeleteMassage_qa.requestNetworkStatus}    ${CmdProduce_qa.requestNetworkStatus}    ${DataProduce_TST_F2_1_1_053}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #Consume คำสั่ง ลง kafka.requestProblemAreaCell
    ConsumeKafka    ${Consume_qa.requestProblemAreaCell}    TST_F2_1_1_053
    # check ค่า \ \ \ kafka.requestProblemAreaCell
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.requestProblemAreaCell_TST_F2_1_1_053}
    # CheckUpsertMongoDB
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper_F2}    ${msisdn_TST_F2_1_1_053}
    VerifyMongoDB    ${Jsondata}    ${JsonInsert_TST_F2_1_1_053}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog_F2}    TST_F2_1_1_053    ${PathLogNetworkStatus}
    #verify stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    TST_F2_1_1_053    nsb-network-status    service-network-status    Success
    #ลบข้อมูลใน MongoDB แล้ว insert ข้อมูลที่เป็น default
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollectionNameqaNetworkQualityStatus}    ${table}
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollectionNameqaNetworkQualityStatus}    ${Data_qaNetworkQualityStatus_default}    ${ID}

TST_F2_1_1_054
    #กำหนดค่าในเคส
    ${table}    BuiltIn.Set Variable    {"table" : "qualityStatus"}
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #หา table \ ใน MongoDB
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollectionNameqaNetworkQualityStatus}    ${table}
    Log    ${ID}
    #ลบข้อมูลใน MongoDB ก่อน insert
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollectionNameqaNetworkQualityStatus}    ${Data_qaNetworkQualityStatus_TST_F2_1_1_054}    ${ID}
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_F2}    ${PathLogNetworkStatus}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #produce คำสั่ง ลง kafka
    ProduceKafka    ${CmdDeleteMassage_qa.requestNetworkStatus}    ${CmdProduce_qa.requestNetworkStatus}    ${DataProduce_TST_F2_1_1_054}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #Consume คำสั่ง ลง kafka.requestProblemAreaCell
    ConsumeKafka    ${Consume_qa.requestProblemAreaCell}    TST_F2_1_1_054
    # check ค่า \ \ \ kafka.requestProblemAreaCell
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.requestProblemAreaCell_TST_F2_1_1_054}
    # CheckUpsertMongoDB
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper_F2}    ${msisdn_TST_F2_1_1_054}
    VerifyMongoDB    ${Jsondata}    ${JsonInsert_TST_F2_1_1_054}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog_F2}    TST_F2_1_1_054    ${PathLogNetworkStatus}
    #verify stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    TST_F2_1_1_054    nsb-network-status    service-network-status    Success
    #ลบข้อมูลใน MongoDB แล้ว insert ข้อมูลที่เป็น default
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollectionNameqaNetworkQualityStatus}    ${table}
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollectionNameqaNetworkQualityStatus}    ${Data_qaNetworkQualityStatus_default}    ${ID}

TST_F2_1_1_055
    #กำหนดค่าในเคส
    ${table}    BuiltIn.Set Variable    {"table" : "performance"}
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #หา table \ ใน MongoDB
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollectionNameqaPerformanceLevel_F2}    ${table}
    Log    ${ID}
    #ลบข้อมูลใน MongoDB ก่อน insert
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollectionNameqaPerformanceLevel_F2}    ${Data_qaPerformanceLevel_TST_F2_1_1_055}    ${ID}
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_F2}    ${PathLogNetworkStatus}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #produce คำสั่ง ลง kafka
    ProduceKafka    ${CmdDeleteMassage_qa.requestNetworkStatus}    ${CmdProduce_qa.requestNetworkStatus}    ${DataProduce_TST_F2_1_1_055}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #Consume คำสั่ง ลง kafka.requestProblemAreaCell
    ConsumeKafka    ${Consume_qa.requestProblemAreaCell}    TST_F2_1_1_055
    # check ค่า \ \ \ kafka.requestProblemAreaCell
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.requestProblemAreaCell_TST_F2_1_1_055}
    # CheckUpsertMongoDB
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper_F2}    ${msisdn_TST_F2_1_1_055}
    VerifyMongoDB    ${Jsondata}    ${JsonInsert_TST_F2_1_1_055}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog_F2}    TST_F2_1_1_055    ${PathLogNetworkStatus}
    #verify stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    TST_F2_1_1_055    nsb-network-status    service-network-status    SUCCESS_DB_PER40400
    #ลบข้อมูลใน MongoDB แล้ว insert ข้อมูลที่เป็น default
    ${table}    BuiltIn.Set Variable    {"table" : "performance1"}
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #หา table \ ใน MongoDB
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollectionNameqaPerformanceLevel_F2}    ${table}
    Log    ${ID}
    #ลบข้อมูลใน MongoDB ก่อน insert
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollectionNameqaPerformanceLevel_F2}    ${Data_qaPerformanceLevel_default}    ${ID}

TST_F2_1_1_056
    #กำหนดค่าในเคส
    ${table}    BuiltIn.Set Variable    {"table" : "performance"}
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #หา table \ ใน MongoDB
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollectionNameqaPerformanceLevel_F2}    ${table}
    Log    ${ID}
    #ลบข้อมูลใน MongoDB ก่อน insert
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollectionNameqaPerformanceLevel_F2}    ${Data_qaPerformanceLevel_TST_F2_1_1_056}    ${ID}
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_F2}    ${PathLogNetworkStatus}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #produce คำสั่ง ลง kafka
    ProduceKafka    ${CmdDeleteMassage_qa.requestNetworkStatus}    ${CmdProduce_qa.requestNetworkStatus}    ${DataProduce_TST_F2_1_1_056}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #Consume คำสั่ง ลง kafka.requestProblemAreaCell
    ConsumeKafka    ${Consume_qa.requestProblemAreaCell}    TST_F2_1_1_056
    # check ค่า \ \ \ kafka.requestProblemAreaCell
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.requestProblemAreaCell_TST_F2_1_1_056}
    # CheckUpsertMongoDB
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper_F2}    ${msisdn_TST_F2_1_1_056}
    VerifyMongoDB    ${Jsondata}    ${JsonInsert_TST_F2_1_1_056}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog_F2}    TST_F2_1_1_056    ${PathLogNetworkStatus}
    #verify stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    TST_F2_1_1_056    nsb-network-status    service-network-status    SUCCESS
    #ลบข้อมูลใน MongoDB แล้ว insert ข้อมูลที่เป็น default
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollectionNameqaPerformanceLevel_F2}    ${table}
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollectionNameqaPerformanceLevel_F2}    ${Data_qaPerformanceLevel_default}    ${ID}

TST_F2_1_1_057
    #กำหนดค่าในเคส
    ${table}    BuiltIn.Set Variable    {"table" : "performance"}
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #หา table \ ใน MongoDB
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollectionNameqaPerformanceLevel_F2}    ${table}
    Log    ${ID}
    #ลบข้อมูลใน MongoDB ก่อน insert
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollectionNameqaPerformanceLevel_F2}    ${Data_qaPerformanceLevel_TST_F2_1_1_057}    ${ID}
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_F2}    ${PathLogNetworkStatus}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #produce คำสั่ง ลง kafka
    ProduceKafka    ${CmdDeleteMassage_qa.requestNetworkStatus}    ${CmdProduce_qa.requestNetworkStatus}    ${DataProduce_TST_F2_1_1_057}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #Consume คำสั่ง ลง kafka.requestProblemAreaCell
    ConsumeKafka    ${Consume_qa.requestProblemAreaCell}    TST_F2_1_1_057
    # check ค่า \ \ \ kafka.requestProblemAreaCell
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.requestProblemAreaCell_TST_F2_1_1_057}
    # CheckUpsertMongoDB
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper_F2}    ${msisdn_TST_F2_1_1_057}
    VerifyMongoDB    ${Jsondata}    ${JsonInsert_TST_F2_1_1_057}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog_F2}    TST_F2_1_1_057    ${PathLogNetworkStatus}
    #verify stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    TST_F2_1_1_057    nsb-network-status    service-network-status    SUCCESS
    #ลบข้อมูลใน MongoDB แล้ว insert ข้อมูลที่เป็น default
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollectionNameqaPerformanceLevel_F2}    ${table}
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollectionNameqaPerformanceLevel_F2}    ${Data_qaPerformanceLevel_default}    ${ID}

TST_F2_1_1_058
    #กำหนดค่าในเคส
    ${table}    BuiltIn.Set Variable    {"table" : "performance"}
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #หา table \ ใน MongoDB
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollectionNameqaPerformanceLevel_F2}    ${table}
    Log    ${ID}
    #ลบข้อมูลใน MongoDB ก่อน insert
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollectionNameqaPerformanceLevel_F2}    ${Data_qaPerformanceLevel_TST_F2_1_1_058}    ${ID}
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_F2}    ${PathLogNetworkStatus}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #produce คำสั่ง ลง kafka
    ProduceKafka    ${CmdDeleteMassage_qa.requestNetworkStatus}    ${CmdProduce_qa.requestNetworkStatus}    ${DataProduce_TST_F2_1_1_058}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #Consume คำสั่ง ลง kafka.requestProblemAreaCell
    ConsumeKafka    ${Consume_qa.requestProblemAreaCell}    TST_F2_1_1_058
    # check ค่า \ \ \ kafka.requestProblemAreaCell
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.requestProblemAreaCell_TST_F2_1_1_058}
    # CheckUpsertMongoDB
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper_F2}    ${msisdn_TST_F2_1_1_058}
    VerifyMongoDB    ${Jsondata}    ${JsonInsert_TST_F2_1_1_058}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog_F2}    TST_F2_1_1_058    ${PathLogNetworkStatus}
    #verify stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    TST_F2_1_1_058    nsb-network-status    service-network-status    SUCCESS
    #ลบข้อมูลใน MongoDB แล้ว insert ข้อมูลที่เป็น default
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollectionNameqaPerformanceLevel_F2}    ${table}
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollectionNameqaPerformanceLevel_F2}    ${Data_qaPerformanceLevel_default}    ${ID}

TST_F2_1_1_059
    #กำหนดค่าในเคส
    ${table}    BuiltIn.Set Variable    {"table" : "performance"}
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #หา table \ ใน MongoDB
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollectionNameqaPerformanceLevel_F2}    ${table}
    Log    ${ID}
    #ลบข้อมูลใน MongoDB ก่อน insert
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollectionNameqaPerformanceLevel_F2}    ${Data_qaPerformanceLevel_TST_F2_1_1_059}    ${ID}
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_F2}    ${PathLogNetworkStatus}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #produce คำสั่ง ลง kafka
    ProduceKafka    ${CmdDeleteMassage_qa.requestNetworkStatus}    ${CmdProduce_qa.requestNetworkStatus}    ${DataProduce_TST_F2_1_1_059}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #Consume คำสั่ง ลง kafka.requestProblemAreaCell
    ConsumeKafka    ${Consume_qa.requestProblemAreaCell}    TST_F2_1_1_059
    # check ค่า \ \ \ kafka.requestProblemAreaCell
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.requestProblemAreaCell_TST_F2_1_1_059}
    # CheckUpsertMongoDB
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper_F2}    ${msisdn_TST_F2_1_1_059}
    VerifyMongoDB    ${Jsondata}    ${JsonInsert_TST_F2_1_1_059}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog_F2}    TST_F2_1_1_059    ${PathLogNetworkStatus}
    #verify stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    TST_F2_1_1_059    nsb-network-status    service-network-status    SUCCESS
    #ลบข้อมูลใน MongoDB แล้ว insert ข้อมูลที่เป็น default
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollectionNameqaPerformanceLevel_F2}    ${table}
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollectionNameqaPerformanceLevel_F2}    ${Data_qaPerformanceLevel_default}    ${ID}

TST_F2_1_1_060
    #กำหนดค่าในเคส
    ${table}    BuiltIn.Set Variable    {"table" : "performance"}
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #หา table \ ใน MongoDB
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollectionNameqaPerformanceLevel}    ${table}
    Log    ${ID}
    #ลบข้อมูลใน MongoDB ก่อน insert
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollectionNameqaPerformanceLevel}    ${Data_qaPerformanceLevel_TST_F2_1_1_060}    ${ID}
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog}    ${PathLogNetworkStatus}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #produce คำสั่ง ลง kafka
    ProduceKafka    ${CmdDeleteMassage_qa.requestNetworkStatus}    ${CmdProduce_qa.requestNetworkStatus}    ${DataProduce_TST_F2_1_1_060}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #Consume คำสั่ง ลง kafka.requestProblemAreaCell
    ConsumeKafka    ${Consume_qa.requestProblemAreaCell}    TST_F2_1_1_060
    # check ค่า \ \ \ kafka.requestProblemAreaCell
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.requestProblemAreaCell_TST_F2_1_1_060}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    TST_F2_1_1_060    ${PathLogNetworkStatus}
    #ลบข้อมูลใน MongoDB แล้ว insert ข้อมูลที่เป็น default
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollectionNameqaPerformanceLevel}    ${table}
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollectionNameqaPerformanceLevel}    ${Data_qaPerformanceLevel_default}    ${ID}

TST_F2_1_1_061
    #กำหนดค่าในเคส
    ${table}    BuiltIn.Set Variable    {"table" : "performance"}
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #หา table \ ใน MongoDB
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollectionNameqaPerformanceLevel_F2}    ${table}
    Log    ${ID}
    #ลบข้อมูลใน MongoDB ก่อน insert
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollectionNameqaPerformanceLevel_F2}    ${Data_qaPerformanceLevel_TST_F2_1_1_061}    ${ID}
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_F2}    ${PathLogNetworkStatus}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #produce คำสั่ง ลง kafka
    ProduceKafka    ${CmdDeleteMassage_qa.requestNetworkStatus}    ${CmdProduce_qa.requestNetworkStatus}    ${DataProduce_TST_F2_1_1_061}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #Consume คำสั่ง ลง kafka.requestProblemAreaCell
    ConsumeKafka    ${Consume_qa.requestProblemAreaCell}    TST_F2_1_1_061
    # check ค่า \ \ \ kafka.requestProblemAreaCell
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.requestProblemAreaCell_TST_F2_1_1_061}
    # CheckUpsertMongoDB
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper_F2}    ${msisdn_TST_F2_1_1_061}
    VerifyMongoDB    ${Jsondata}    ${JsonInsert_TST_F2_1_1_061}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog_F2}    TST_F2_1_1_061    ${PathLogNetworkStatus}
    #verify stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    TST_F2_1_1_061    nsb-network-status    service-network-status    SUCCESS
    #ลบข้อมูลใน MongoDB แล้ว insert ข้อมูลที่เป็น default
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollectionNameqaPerformanceLevel_F2}    ${table}
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollectionNameqaPerformanceLevel_F2}    ${Data_qaPerformanceLevel_default}    ${ID}

TST_F2_0_1_061
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog}    ${PathLogNetworkStatus}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #produce คำสั่ง ลง kafka
    ProduceKafka    ${CmdDeleteMassage_qa.requestNetworkStatus}    ${CmdProduce_qa.requestNetworkStatus}    ${DataProduce_TST_F2_0_1_061}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #Consume คำสั่ง ลง kafka.requestProblemAreaCell
    ConsumeKafka    ${Consume_qa.requestProblemAreaCell}    TST_F2_0_1_061
    # check ค่า \ \ \ kafka.requestProblemAreaCell
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.requestProblemAreaCell_TST_F2_0_1_061}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog}    TST_F2_0_1_061    ${PathLogNetworkStatus}

TST_F2_1_1_100
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_kk}    ${PathLogNetworkStatus_kk}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #produce คำสั่ง ลง kafka
    ProduceKafka    ${CmdDeleteMassage_qa.requestProblemAreaCell01}    ${CmdProduce_qa.requestNetworkStatus01}    ${DataProduce_TST_F2_1_1_100}
    BuiltIn.Sleep    5
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #Consume คำสั่ง ลง kafka.requestProblemAreaCell
    ConsumeKafka    ${Consume_qa.requestProblemAreaCell01}    TST_F2_1_1_100
    # check ค่า \ \ \ kafka.requestProblemAreaCell
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.requestProblemAreaCell_TST_F2_1_1_100}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    BuiltIn.Sleep    30
    FlushLogAndStatbyCommandName    ${NameCommandFileLog_kk}    TST_F2_1_1_100    ${PathLogNetworkStatus_kk}
    # CheckUpsertMongoDB
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${msisdn_TST_F2_1_1_100}
    VerifyMongoDB    ${Jsondata}    ${JsonInsert_TST_F2_1_1_100}
    #verify stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    TST_F2_1_1_100    nsb-network-status    service-network-status-01    Success

TST_F2_1_1_101
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_kk}    ${PathLogNetworkStatus_kk}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #produce คำสั่ง ลง kafka
    ProduceKafka    ${CmdDeleteMassage_qa.requestProblemAreaCell01}    ${CmdProduce_qa.requestNetworkStatus01}    ${DataProduce_TST_F2_1_1_101}
    BuiltIn.Sleep    5
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #Consume คำสั่ง ลง kafka.requestProblemAreaCell
    ConsumeKafka    ${Consume_qa.requestProblemAreaCell01}    TST_F2_1_1_101
    # check ค่า \ \ \ kafka.requestProblemAreaCell
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.requestProblemAreaCell_TST_F2_1_1_101}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    BuiltIn.Sleep    30
    FlushLogAndStatbyCommandName    ${NameCommandFileLog_kk}    TST_F2_1_1_101    ${PathLogNetworkStatus_kk}
    # CheckUpsertMongoDB
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${msisdn_TST_F2_1_1_101}
    VerifyMongoDB    ${Jsondata}    ${JsonInsert_TST_F2_1_1_101}
    #verify stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    TST_F2_1_1_101    nsb-network-status    service-network-status-01    Success

TST_F2_1_1_102
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_kk}    ${PathLogNetworkStatus_kk}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #produce คำสั่ง ลง kafka
    ProduceKafka    ${CmdDeleteMassage_qa.requestProblemAreaCell01}    ${CmdProduce_qa.requestNetworkStatus01}    ${DataProduce_TST_F2_1_1_102}
    BuiltIn.Sleep    5
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #Consume คำสั่ง ลง kafka.requestProblemAreaCell
    ConsumeKafka    ${Consume_qa.requestProblemAreaCell01}    TST_F2_1_1_102
    # check ค่า \ \ \ kafka.requestProblemAreaCell
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.requestProblemAreaCell_TST_F2_1_1_102}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    BuiltIn.Sleep    30
    FlushLogAndStatbyCommandName    ${NameCommandFileLog_kk}    TST_F2_1_1_102    ${PathLogNetworkStatus_kk}
    # CheckUpsertMongoDB
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${msisdn_TST_F2_1_1_102}
    VerifyMongoDB    ${Jsondata}    ${JsonInsert_TST_F2_1_1_102}
    #verify stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    TST_F2_1_1_102    nsb-network-status    service-network-status-01    Success

TST_F2_1_1_103
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_kk}    ${PathLogNetworkStatus_kk}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #produce คำสั่ง ลง kafka
    ProduceKafka    ${CmdDeleteMassage_qa.requestProblemAreaCell01}    ${CmdProduce_qa.requestNetworkStatus01}    ${DataProduce_TST_F2_1_1_103}
    BuiltIn.Sleep    5
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #Consume คำสั่ง ลง kafka.requestProblemAreaCell
    ConsumeKafka    ${Consume_qa.requestProblemAreaCell01}    TST_F2_1_1_103
    # check ค่า \ \ \ kafka.requestProblemAreaCell
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.requestProblemAreaCell_TST_F2_1_1_103}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    BuiltIn.Sleep    30
    FlushLogAndStatbyCommandName    ${NameCommandFileLog_kk}    TST_F2_1_1_103    ${PathLogNetworkStatus_kk}
    # CheckUpsertMongoDB
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${msisdn_TST_F2_1_1_103}
    VerifyMongoDB    ${Jsondata}    ${JsonInsert_TST_F2_1_1_103}
    #verify stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    TST_F2_1_1_103    nsb-network-status    service-network-status-01    Success

TST_F2_1_1_104
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_kk}    ${PathLogNetworkStatus_kk}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #produce คำสั่ง ลง kafka
    ProduceKafka    ${CmdDeleteMassage_qa.requestProblemAreaCell01}    ${CmdProduce_qa.requestNetworkStatus01}    ${DataProduce_TST_F2_1_1_104}
    BuiltIn.Sleep    5
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #Consume คำสั่ง ลง kafka.requestProblemAreaCell
    ConsumeKafka    ${Consume_qa.requestProblemAreaCell01}    TST_F2_1_1_104
    # check ค่า \ \ \ kafka.requestProblemAreaCell
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.requestProblemAreaCell_TST_F2_1_1_104}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    BuiltIn.Sleep    30
    FlushLogAndStatbyCommandName    ${NameCommandFileLog_kk}    TST_F2_1_1_104    ${PathLogNetworkStatus_kk}
    # CheckUpsertMongoDB
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${msisdn_TST_F2_1_1_104}
    VerifyMongoDB    ${Jsondata}    ${JsonInsert_TST_F2_1_1_104}
    #verify stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    TST_F2_1_1_104    nsb-network-status    service-network-status-01    Success

TST_F2_1_1_105
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_kk}    ${PathLogNetworkStatus_kk}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #produce คำสั่ง ลง kafka
    ProduceKafka    ${CmdDeleteMassage_qa.requestProblemAreaCell01}    ${CmdProduce_qa.requestNetworkStatus01}    ${DataProduce_TST_F2_1_1_105}
    BuiltIn.Sleep    5
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #Consume คำสั่ง ลง kafka.requestProblemAreaCell
    ConsumeKafka    ${Consume_qa.requestProblemAreaCell01}    TST_F2_1_1_105
    # check ค่า \ \ \ kafka.requestProblemAreaCell
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.requestProblemAreaCell_TST_F2_1_1_105}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    BuiltIn.Sleep    30
    FlushLogAndStatbyCommandName    ${NameCommandFileLog_kk}    TST_F2_1_1_105    ${PathLogNetworkStatus_kk}
    # CheckUpsertMongoDB
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${msisdn_TST_F2_1_1_105}
    VerifyMongoDB    ${Jsondata}    ${JsonInsert_TST_F2_1_1_105}
    #verify stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    TST_F2_1_1_105    nsb-network-status    service-network-status-01    Success

TST_F2_1_1_106
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_kk}    ${PathLogNetworkStatus_kk}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #produce คำสั่ง ลง kafka
    ProduceKafka    ${CmdDeleteMassage_qa.requestProblemAreaCell01}    ${CmdProduce_qa.requestNetworkStatus01}    ${DataProduce_TST_F2_1_1_106}
    BuiltIn.Sleep    5
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #Consume คำสั่ง ลง kafka.requestProblemAreaCell
    ConsumeKafka    ${Consume_qa.requestProblemAreaCell01}    TST_F2_1_1_106
    # check ค่า \ \ \ kafka.requestProblemAreaCell
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.requestProblemAreaCell_TST_F2_1_1_106}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    BuiltIn.Sleep    30
    FlushLogAndStatbyCommandName    ${NameCommandFileLog_kk}    TST_F2_1_1_106    ${PathLogNetworkStatus_kk}
    # CheckUpsertMongoDB
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${msisdn_TST_F2_1_1_106}
    VerifyMongoDB    ${Jsondata}    ${JsonInsert_TST_F2_1_1_106}
    #verify stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    TST_F2_1_1_106    nsb-network-status    service-network-status-01    Success

TST_F2_1_1_107
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_kk}    ${PathLogNetworkStatus_kk}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #produce คำสั่ง ลง kafka
    ProduceKafka    ${CmdDeleteMassage_qa.requestProblemAreaCell01}    ${CmdProduce_qa.requestNetworkStatus01}    ${DataProduce_TST_F2_1_1_107}
    BuiltIn.Sleep    5
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #Consume คำสั่ง ลง kafka.requestProblemAreaCell
    ConsumeKafka    ${Consume_qa.requestProblemAreaCell01}    TST_F2_1_1_107
    # check ค่า \ \ \ kafka.requestProblemAreaCell
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.requestProblemAreaCell_TST_F2_1_1_107}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    BuiltIn.Sleep    30
    FlushLogAndStatbyCommandName    ${NameCommandFileLog_kk}    TST_F2_1_1_107    ${PathLogNetworkStatus_kk}
    # CheckUpsertMongoDB
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${msisdn_TST_F2_1_1_107}
    VerifyMongoDB    ${Jsondata}    ${JsonInsert_TST_F2_1_1_107}
    #verify stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    TST_F2_1_1_107    nsb-network-status    service-network-status-01    Success

TST_F2_1_1_108
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_kk}    ${PathLogNetworkStatus_kk}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #produce คำสั่ง ลง kafka
    ProduceKafka    ${CmdDeleteMassage_qa.requestProblemAreaCell01}    ${CmdProduce_qa.requestNetworkStatus01}    ${DataProduce_TST_F2_1_1_108}
    BuiltIn.Sleep    5
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #Consume คำสั่ง ลง kafka.requestProblemAreaCell
    ConsumeKafka    ${Consume_qa.requestProblemAreaCell01}    TST_F2_1_1_108
    # check ค่า \ \ \ kafka.requestProblemAreaCell
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.requestProblemAreaCell_TST_F2_1_1_108}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    BuiltIn.Sleep    30
    FlushLogAndStatbyCommandName    ${NameCommandFileLog_kk}    TST_F2_1_1_108    ${PathLogNetworkStatus_kk}
    # CheckUpsertMongoDB
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${msisdn_TST_F2_1_1_108}
    VerifyMongoDB    ${Jsondata}    ${JsonInsert_TST_F2_1_1_108}
    #verify stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    TST_F2_1_1_108    nsb-network-status    service-network-status-01    Success

TST_F2_1_1_109
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_kk}    ${PathLogNetworkStatus_kk}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #produce คำสั่ง ลง kafka
    ProduceKafka    ${CmdDeleteMassage_qa.requestProblemAreaCell01}    ${CmdProduce_qa.requestNetworkStatus01}    ${DataProduce_TST_F2_1_1_109}
    BuiltIn.Sleep    5
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #Consume คำสั่ง ลง kafka.requestProblemAreaCell
    ConsumeKafka    ${Consume_qa.requestProblemAreaCell01}    TST_F2_1_1_109
    # check ค่า \ \ \ kafka.requestProblemAreaCell
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.requestProblemAreaCell_TST_F2_1_1_109}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    BuiltIn.Sleep    30
    FlushLogAndStatbyCommandName    ${NameCommandFileLog_kk}    TST_F2_1_1_109    ${PathLogNetworkStatus_kk}
    # CheckUpsertMongoDB
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${msisdn_TST_F2_1_1_109}
    VerifyMongoDB    ${Jsondata}    ${JsonInsert_TST_F2_1_1_109}
    #verify stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    TST_F2_1_1_109    nsb-network-status    service-network-status-01    Success

TST_F2_1_1_110
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_kk}    ${PathLogNetworkStatus_kk}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #produce คำสั่ง ลง kafka
    ProduceKafka    ${CmdDeleteMassage_qa.requestProblemAreaCell01}    ${CmdProduce_qa.requestNetworkStatus01}    ${DataProduce_TST_F2_1_1_110}
    BuiltIn.Sleep    5
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #Consume คำสั่ง ลง kafka.requestProblemAreaCell
    ConsumeKafka    ${Consume_qa.requestProblemAreaCell01}    TST_F2_1_1_110
    # check ค่า \ \ \ kafka.requestProblemAreaCell
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.requestProblemAreaCell_TST_F2_1_1_110}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    BuiltIn.Sleep    30
    FlushLogAndStatbyCommandName    ${NameCommandFileLog_kk}    TST_F2_1_1_110    ${PathLogNetworkStatus_kk}
    # CheckUpsertMongoDB
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${msisdn_TST_F2_1_1_110}
    VerifyMongoDB    ${Jsondata}    ${JsonInsert_TST_F2_1_1_110}
    #verify stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    TST_F2_1_1_110    nsb-network-status    service-network-status-01    Success

TST_F2_1_1_111
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_kk}    ${PathLogNetworkStatus_kk}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #produce คำสั่ง ลง kafka
    ProduceKafka    ${CmdDeleteMassage_qa.requestProblemAreaCell01}    ${CmdProduce_qa.requestNetworkStatus01}    ${DataProduce_TST_F2_1_1_111}
    BuiltIn.Sleep    5
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #Consume คำสั่ง ลง kafka.requestProblemAreaCell
    ConsumeKafka    ${Consume_qa.requestProblemAreaCell01}    TST_F2_1_1_111
    # check ค่า \ \ \ kafka.requestProblemAreaCell
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.requestProblemAreaCell_TST_F2_1_1_111}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    BuiltIn.Sleep    30
    FlushLogAndStatbyCommandName    ${NameCommandFileLog_kk}    TST_F2_1_1_111    ${PathLogNetworkStatus_kk}
    # CheckUpsertMongoDB
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${msisdn_TST_F2_1_1_111}
    VerifyMongoDB    ${Jsondata}    ${JsonInsert_TST_F2_1_1_111}
    #verify stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    TST_F2_1_1_111    nsb-network-status    service-network-status-01    Success

TST_F2_1_1_112
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_kk}    ${PathLogNetworkStatus_kk}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #produce คำสั่ง ลง kafka
    ProduceKafka    ${CmdDeleteMassage_qa.requestProblemAreaCell01}    ${CmdProduce_qa.requestNetworkStatus01}    ${DataProduce_TST_F2_1_1_112}
    BuiltIn.Sleep    5
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #Consume คำสั่ง ลง kafka.requestProblemAreaCell
    ConsumeKafka    ${Consume_qa.requestProblemAreaCell01}    TST_F2_1_1_112
    # check ค่า \ \ \ kafka.requestProblemAreaCell
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.requestProblemAreaCell_TST_F2_1_1_112}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    BuiltIn.Sleep    30
    FlushLogAndStatbyCommandName    ${NameCommandFileLog_kk}    TST_F2_1_1_112    ${PathLogNetworkStatus_kk}
    # CheckUpsertMongoDB
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${msisdn_TST_F2_1_1_112}
    VerifyMongoDB    ${Jsondata}    ${JsonInsert_TST_F2_1_1_112}
    #verify stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    TST_F2_1_1_112    nsb-network-status    service-network-status-01    Success

TST_F2_1_1_150
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_F2}    ${PathLogNetworkStatus}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #produce คำสั่ง ลง kafka
    ProduceKafka    ${CmdDeleteMassage_qa.requestNetworkStatus}    ${CmdProduce_qa.requestNetworkStatus}    ${DataProduce_TST_F2_1_1_150}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #Consume คำสั่ง ลง kafka.requestProblemAreaCell
    ConsumeKafka    ${Consume_qa.requestProblemAreaCell}    TST_F2_1_1_150
    # check ค่า \ \ \ kafka.requestProblemAreaCell
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.requestProblemAreaCell_TST_F2_1_1_150}
    # CheckUpsertMongoDB
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper_F2}    ${msisdn_TST_F2_1_1_150}
    VerifyMongoDB    ${Jsondata}    ${JsonInsert_TST_F2_1_1_150}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog_F2}    TST_F2_1_1_150    ${PathLogNetworkStatus}
    #verify stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    TST_F2_1_1_150    nsb-network-status    service-network-status    Success
    [Teardown]    Close All Connections

TST_F2_1_1_151
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_F2}    ${PathLogNetworkStatus}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #produce คำสั่ง ลง kafka
    ProduceKafka    ${CmdDeleteMassage_qa.requestNetworkStatus}    ${CmdProduce_qa.requestNetworkStatus}    ${DataProduce_TST_F2_1_1_151}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #Consume คำสั่ง ลง kafka.requestProblemAreaCell
    ConsumeKafka    ${Consume_qa.requestProblemAreaCell}    TST_F2_1_1_151
    # check ค่า \ \ \ kafka.requestProblemAreaCell
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.requestProblemAreaCell_TST_F2_1_1_151}
    # CheckUpsertMongoDB
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper_F2}    ${msisdn_TST_F2_1_1_151}
    VerifyMongoDB    ${Jsondata}    ${JsonInsert_TST_F2_1_1_151}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog_F2}    TST_F2_1_1_151    ${PathLogNetworkStatus}
    #verify stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    TST_F2_1_1_150    nsb-network-status    service-network-status    Success
    [Teardown]    Close All Connections

TST_F2_1_1_152
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_F2}    ${PathLogNetworkStatus}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #produce คำสั่ง ลง kafka
    ProduceKafka    ${CmdDeleteMassage_qa.requestNetworkStatus}    ${CmdProduce_qa.requestNetworkStatus}    ${DataProduce_TST_F2_1_1_152}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #Consume คำสั่ง ลง kafka.requestProblemAreaCell
    ConsumeKafka    ${Consume_qa.requestProblemAreaCell}    TST_F2_1_1_152
    # check ค่า \ \ \ kafka.requestProblemAreaCell
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.requestProblemAreaCell_TST_F2_1_1_152}
    # CheckUpsertMongoDB
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper_F2}    ${msisdn_TST_F2_1_1_152}
    VerifyMongoDB    ${Jsondata}    ${JsonInsert_TST_F2_1_1_152}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog_F2}    TST_F2_1_1_152    ${PathLogNetworkStatus}
    #verify stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    TST_F2_1_1_152    nsb-network-status    service-network-status    Success
    [Teardown]    Close All Connections

TST_F2_1_1_153
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_F2}    ${PathLogNetworkStatus}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #produce คำสั่ง ลง kafka
    ProduceKafka    ${CmdDeleteMassage_qa.requestNetworkStatus}    ${CmdProduce_qa.requestNetworkStatus}    ${DataProduce_TST_F2_1_1_153}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #Consume คำสั่ง ลง kafka.requestProblemAreaCell
    ConsumeKafka    ${Consume_qa.requestProblemAreaCell}    TST_F2_1_1_153
    # check ค่า \ \ \ kafka.requestProblemAreaCell
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.requestProblemAreaCell_TST_F2_1_1_153}
    # CheckUpsertMongoDB
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper_F2}    ${msisdn_TST_F2_1_1_153}
    VerifyMongoDB    ${Jsondata}    ${JsonInsert_TST_F2_1_1_153}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog_F2}    TST_F2_1_1_153    ${PathLogNetworkStatus}
    #verify stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    TST_F2_1_1_153    nsb-network-status    service-network-status    Success
    [Teardown]    Close All Connections

TST_F2_1_1_154
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_F2}    ${PathLogNetworkStatus}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #produce คำสั่ง ลง kafka
    ProduceKafka    ${CmdDeleteMassage_qa.requestNetworkStatus}    ${CmdProduce_qa.requestNetworkStatus}    ${DataProduce_TST_F2_1_1_154}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #Consume คำสั่ง ลง kafka.requestProblemAreaCell
    ConsumeKafka    ${Consume_qa.requestProblemAreaCell}    TST_F2_1_1_154
    # check ค่า \ \ \ kafka.requestProblemAreaCell
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.requestProblemAreaCell_TST_F2_1_1_154}
    # CheckUpsertMongoDB
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper_F2}    ${msisdn_TST_F2_1_1_154}
    VerifyMongoDB    ${Jsondata}    ${JsonInsert_TST_F2_1_1_154}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog_F2}    TST_F2_1_1_154    ${PathLogNetworkStatus}
    #verify stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    TST_F2_1_1_154    nsb-network-status    service-network-status    Success
    [Teardown]    Close All Connections

TST_F2_1_1_155
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_F2}    ${PathLogNetworkStatus}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #produce คำสั่ง ลง kafka
    ProduceKafka    ${CmdDeleteMassage_qa.requestNetworkStatus}    ${CmdProduce_qa.requestNetworkStatus}    ${DataProduce_TST_F2_1_1_155}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #Consume คำสั่ง ลง kafka.requestProblemAreaCell
    ConsumeKafka    ${Consume_qa.requestProblemAreaCell}    TST_F2_1_1_155
    # check ค่า \ \ \ kafka.requestProblemAreaCell
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.requestProblemAreaCell_TST_F2_1_1_155}
    # CheckUpsertMongoDB
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper_F2}    ${msisdn_TST_F2_1_1_155}
    VerifyMongoDB    ${Jsondata}    ${JsonInsert_TST_F2_1_1_155}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog_F2}    TST_F2_1_1_155    ${PathLogNetworkStatus}
    #verify stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    TST_F2_1_1_155    nsb-network-status    service-network-status    Success
    [Teardown]    Close All Connections

TST_F2_1_1_156
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_F2}    ${PathLogNetworkStatus}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #produce คำสั่ง ลง kafka
    ProduceKafka    ${CmdDeleteMassage_qa.requestNetworkStatus}    ${CmdProduce_qa.requestNetworkStatus}    ${DataProduce_TST_F2_1_1_156}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #Consume คำสั่ง ลง kafka.requestProblemAreaCell
    ConsumeKafka    ${Consume_qa.requestProblemAreaCell}    TST_F2_1_1_156
    # check ค่า \ \ \ kafka.requestProblemAreaCell
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.requestProblemAreaCell_TST_F2_1_1_156}
    # CheckUpsertMongoDB
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper_F2}    ${msisdn_TST_F2_1_1_156}
    VerifyMongoDB    ${Jsondata}    ${JsonInsert_TST_F2_1_1_156}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog_F2}    TST_F2_1_1_156    ${PathLogNetworkStatus}
    #verify stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    TST_F2_1_1_156    nsb-network-status    service-network-status    Success
    [Teardown]    Close All Connections

TST_F2_1_1_157
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_F2}    ${PathLogNetworkStatus}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #produce คำสั่ง ลง kafka
    ProduceKafka    ${CmdDeleteMassage_qa.requestNetworkStatus}    ${CmdProduce_qa.requestNetworkStatus}    ${DataProduce_TST_F2_1_1_157}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #Consume คำสั่ง ลง kafka.requestProblemAreaCell
    ConsumeKafka    ${Consume_qa.requestProblemAreaCell}    TST_F2_1_1_157
    # check ค่า \ \ \ kafka.requestProblemAreaCell
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.requestProblemAreaCell_TST_F2_1_1_157}
    # CheckUpsertMongoDB
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper_F2}    ${msisdn_TST_F2_1_1_157}
    VerifyMongoDB    ${Jsondata}    ${JsonInsert_TST_F2_1_1_157}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog_F2}    TST_F2_1_1_157    ${PathLogNetworkStatus}
    #verify stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    TST_F2_1_1_157    nsb-network-status    service-network-status    Success
    [Teardown]    Close All Connections

TST_F2_1_1_158
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_F2}    ${PathLogNetworkStatus}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #produce คำสั่ง ลง kafka
    ProduceKafka    ${CmdDeleteMassage_qa.requestNetworkStatus}    ${CmdProduce_qa.requestNetworkStatus}    ${DataProduce_TST_F2_1_1_158}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    #Consume คำสั่ง ลง kafka.requestProblemAreaCell
    ConsumeKafka    ${Consume_qa.requestProblemAreaCell}    TST_F2_1_1_158
    # check ค่า \ \ \ kafka.requestProblemAreaCell
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.requestProblemAreaCell_TST_F2_1_1_158}
    # CheckUpsertMongoDB
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper_F2}    ${msisdn_TST_F2_1_1_158}
    VerifyMongoDB    ${Jsondata}    ${JsonInsert_TST_F2_1_1_158}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${NameCommandFileLog_F2}    TST_F2_1_1_158    ${PathLogNetworkStatus}
    #verify stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    TST_F2_1_1_158    nsb-network-status    service-network-status    Success
    [Teardown]    Close All Connections
