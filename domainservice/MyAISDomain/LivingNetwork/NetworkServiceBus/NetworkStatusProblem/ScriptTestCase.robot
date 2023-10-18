*** Settings ***
Resource          ../../Keyword/Common.robot
Resource          ../../Keyword/MongoDB.robot
Resource          ../../Keyword/SecureCRT.robot
Resource          ../../Valiables/CommonValiable/CommonValiable.robot
Resource          ../NetworkStatusProblem/Valiable.robot
*** Test Cases ***
TST_F3_1_1_000
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #SetLogให้ว่าง
    SetLogNull    ${LogNameNetworkStatusProblem}    ${PathLogNetworkStatusProblem}
    #QueryData
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${NetworkStatusProblem_TST_F3_1_1_000}
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${Json_TST_F3_1_1_000}    ${ID}
    #ConsumeData
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_qa.problemAreaCellRequested}    ${CmdProduce_qa.problemAreaCellRequested}    ${Procuce_TST_F3_1_1_000}
    BuiltIn.Sleep    5
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_qa.networkStatusRequested}    TST_F3_1_1_000
    log    ${ConsumeResult}
    #check ค่าเครื่อง 30 ติด permission denied
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.networkStatusRequested_TST_F3_1_1_000}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${LogNameNetworkStatusProblem}    TST_F3_1_1_000    ${PathLogNetworkStatusProblem}
    VerifyStatByCommand    TST_F3_1_1_000    nsb-network-status-problem    service-network-status-problem    success

TST_F3_1_1_001
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #SetLogให้ว่าง
    SetLogNull    ${LogNameNetworkStatusProblem}    ${PathLogNetworkStatusProblem}
    #QueryData
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${NetworkStatusProblem_TST_F3_1_1_001}
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${Json_TST_F3_1_1_001}    ${ID}
    #ConsumeData
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_qa.problemAreaCellRequested}    ${CmdProduce_qa.problemAreaCellRequested}    ${Procuce_TST_F3_1_1_001}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_qa.networkStatusRequested}    TST_F3_1_1_001
    log    ${ConsumeResult}
    #check ค่าเครื่อง 30 ติด permission denied
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.networkStatusRequested_TST_F3_1_1_001}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${LogNameNetworkStatusProblem}    TST_F3_1_1_001    ${PathLogNetworkStatusProblem}
    VerifyStatByCommand    TST_F3_1_1_001    nsb-network-status-problem    service-network-status-problem    success

TST_F3_1_1_002
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #SetLogให้ว่าง
    SetLogNull    ${LogNameNetworkStatusProblem}    ${PathLogNetworkStatusProblem}
    #QueryData
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${NetworkStatusProblem_TST_F3_1_1_002}
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${Json_TST_F3_1_1_002}    ${ID}
    #ConsumeData
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_qa.problemAreaCellRequested}    ${CmdProduce_qa.problemAreaCellRequested}    ${Procuce_TST_F3_1_1_002}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_qa.networkStatusRequested}    TST_F3_1_1_002
    log    ${ConsumeResult}
    #check ค่าเครื่อง 30 ติด permission denied
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.networkStatusRequested_TST_F3_1_1_002}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${LogNameNetworkStatusProblem}    TST_F3_1_1_002    ${PathLogNetworkStatusProblem}
    VerifyStatByCommand    TST_F3_1_1_002    nsb-network-status-problem    service-network-status-problem    success

TST_F3_1_1_003
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #SetLogให้ว่าง
    SetLogNull    ${LogNameNetworkStatusProblem}    ${PathLogNetworkStatusProblem}
    #QueryData
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${NetworkStatusProblem_TST_F3_1_1_003}
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${Json_TST_F3_1_1_003}    ${ID}
    #ConsumeData
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_qa.problemAreaCellRequested}    ${CmdProduce_qa.problemAreaCellRequested}    ${Procuce_TST_F3_1_1_003}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_qa.networkStatusRequested}    TST_F3_1_1_003
    log    ${ConsumeResult}
    #check ค่าเครื่อง 30 ติด permission denied
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.networkStatusRequested_TST_F3_1_1_003}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${LogNameNetworkStatusProblem}    TST_F3_1_1_003    ${PathLogNetworkStatusProblem}
    VerifyStatByCommand    TST_F3_1_1_003    nsb-network-status-problem    service-network-status-problem    success

TST_F3_1_1_004
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #SetLogให้ว่าง
    SetLogNull    ${LogNameNetworkStatusProblem}    ${PathLogNetworkStatusProblem}
    #QueryData
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${NetworkStatusProblem_TST_F3_1_1_004}
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${Json_TST_F3_1_1_004}    ${ID}
    #ConsumeData
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_qa.problemAreaCellRequested}    ${CmdProduce_qa.problemAreaCellRequested}    ${Procuce_TST_F3_1_1_004}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_qa.networkStatusRequested}    TST_F3_1_1_004
    log    ${ConsumeResult}
    #check ค่าเครื่อง 30 ติด permission denied
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.networkStatusRequested_TST_F3_1_1_004}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${LogNameNetworkStatusProblem}    TST_F3_1_1_004    ${PathLogNetworkStatusProblem}
    VerifyStatByCommand    TST_F3_1_1_004    nsb-network-status-problem    service-network-status-problem    success

TST_F3_1_1_005
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #SetLogให้ว่าง
    SetLogNull    ${LogNameNetworkStatusProblem}    ${PathLogNetworkStatusProblem}
    #QueryData
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${NetworkStatusProblem_TST_F3_1_1_005}
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${Json_TST_F3_1_1_005}    ${ID}
    #ConsumeData
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_qa.problemAreaCellRequested}    ${CmdProduce_qa.problemAreaCellRequested}    ${Procuce_TST_F3_1_1_005}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_qa.networkStatusRequested}    TST_F3_1_1_005
    log    ${ConsumeResult}
    #check ค่าเครื่อง 30 ติด permission denied
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.networkStatusRequested_TST_F3_1_1_005}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${LogNameNetworkStatusProblem}    TST_F3_1_1_005    ${PathLogNetworkStatusProblem}
    VerifyStatByCommand    TST_F3_1_1_005    nsb-network-status-problem    service-network-status-problem    success

TST_F3_1_1_006
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #SetLogให้ว่าง
    SetLogNull    ${LogNameNetworkStatusProblem}    ${PathLogNetworkStatusProblem}
    #QueryData
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${NetworkStatusProblem_TST_F3_1_1_006}
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${Json_TST_F3_1_1_006}    ${ID}
    #ConsumeData
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_qa.problemAreaCellRequested}    ${CmdProduce_qa.problemAreaCellRequested}    ${Procuce_TST_F3_1_1_006}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_qa.networkStatusRequested}    TST_F3_1_1_006
    log    ${ConsumeResult}
    #check ค่าเครื่อง 30 ติด permission denied
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.networkStatusRequested_TST_F3_1_1_006}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${LogNameNetworkStatusProblem}    TST_F3_1_1_006    ${PathLogNetworkStatusProblem}
    VerifyStatByCommand    TST_F3_1_1_006    nsb-network-status-problem    service-network-status-problem    success

TST_F3_1_1_007
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #SetLogให้ว่าง
    SetLogNull    ${LogNameNetworkStatusProblem}    ${PathLogNetworkStatusProblem}
    #QueryData
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${NetworkStatusProblem_TST_F3_1_1_007}
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${Json_TST_F3_1_1_007}    ${ID}
    #ConsumeData
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_qa.problemAreaCellRequested}    ${CmdProduce_qa.problemAreaCellRequested}    ${Procuce_TST_F3_1_1_007}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_qa.networkStatusRequested}    TST_F3_1_1_007
    log    ${ConsumeResult}
    #check ค่าเครื่อง 30 ติด permission denied
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.networkStatusRequested_TST_F3_1_1_007}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${LogNameNetworkStatusProblem}    TST_F3_1_1_007    ${PathLogNetworkStatusProblem}
    VerifyStatByCommand    TST_F3_1_1_007    nsb-network-status-problem    service-network-status-problem    success

TST_F3_1_1_008
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #SetLogให้ว่าง
    SetLogNull    ${LogNameNetworkStatusProblem}    ${PathLogNetworkStatusProblem}
    #QueryData
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${NetworkStatusProblem_TST_F3_1_1_008}
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${Json_TST_F3_1_1_008}    ${ID}
    #ConsumeData
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_qa.problemAreaCellRequested}    ${CmdProduce_qa.problemAreaCellRequested}    ${Procuce_TST_F3_1_1_008}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_qa.networkStatusRequested}    TST_F3_1_1_008
    log    ${ConsumeResult}
    #check ค่าเครื่อง 30 ติด permission denied
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.networkStatusRequested_TST_F3_1_1_008}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${LogNameNetworkStatusProblem}    TST_F3_1_1_008    ${PathLogNetworkStatusProblem}
    VerifyStatByCommand    TST_F3_1_1_008    nsb-network-status-problem    service-network-status-problem    success

TST_F3_1_1_009
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #SetLogให้ว่าง
    SetLogNull    ${LogNameNetworkStatusProblem}    ${PathLogNetworkStatusProblem}
    #QueryData
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${NetworkStatusProblem_TST_F3_1_1_009}
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${Json_TST_F3_1_1_009}    ${ID}
    #ConsumeData
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_qa.problemAreaCellRequested}    ${CmdProduce_qa.problemAreaCellRequested}    ${Procuce_TST_F3_1_1_009}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_qa.networkStatusRequested}    TST_F3_1_1_009
    log    ${ConsumeResult}
    #check ค่าเครื่อง 30 ติด permission denied
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.networkStatusRequested_TST_F3_1_1_009}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${LogNameNetworkStatusProblem}    TST_F3_1_1_009    ${PathLogNetworkStatusProblem}
    VerifyStatByCommand    TST_F3_1_1_009    nsb-network-status-problem    service-network-status-problem    success

TST_F3_1_1_010
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #SetLogให้ว่าง
    SetLogNull    ${LogNameNetworkStatusProblem}    ${PathLogNetworkStatusProblem}
    #QueryData
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${NetworkStatusProblem_TST_F3_1_1_010}
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${Json_TST_F3_1_1_010}    ${ID}
    #ConsumeData
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_qa.problemAreaCellRequested}    ${CmdProduce_qa.problemAreaCellRequested}    ${Procuce_TST_F3_1_1_010}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_qa.networkStatusRequested}    TST_F3_1_1_010
    log    ${ConsumeResult}
    #check ค่าเครื่อง 30 ติด permission denied
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.networkStatusRequested_TST_F3_1_1_010}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${LogNameNetworkStatusProblem}    TST_F3_1_1_010    ${PathLogNetworkStatusProblem}
    VerifyStatByCommand    TST_F3_1_1_010    nsb-network-status-problem    service-network-status-problem    success

TST_F3_1_1_011
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #SetLogให้ว่าง
    SetLogNull    ${LogNameNetworkStatusProblem}    ${PathLogNetworkStatusProblem}
    #QueryData
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${NetworkStatusProblem_TST_F3_1_1_011}
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${Json_TST_F3_1_1_011}    ${ID}
    #ConsumeData
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_qa.problemAreaCellRequested}    ${CmdProduce_qa.problemAreaCellRequested}    ${Procuce_TST_F3_1_1_011}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_qa.networkStatusRequested}    TST_F3_1_1_011
    log    ${ConsumeResult}
    #check ค่าเครื่อง 30 ติด permission denied
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.networkStatusRequested_TST_F3_1_1_011}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${LogNameNetworkStatusProblem}    TST_F3_1_1_011    ${PathLogNetworkStatusProblem}
    VerifyStatByCommand    TST_F3_1_1_011    nsb-network-status-problem    service-network-status-problem    success

TST_F3_1_1_012
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #SetLogให้ว่าง
    SetLogNull    ${LogNameNetworkStatusProblem}    ${PathLogNetworkStatusProblem}
    #QueryData
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${NetworkStatusProblem_TST_F3_1_1_012}
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${Json_TST_F3_1_1_012}    ${ID}
    #ConsumeData
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_qa.problemAreaCellRequested}    ${CmdProduce_qa.problemAreaCellRequested}    ${Procuce_TST_F3_1_1_012}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_qa.networkStatusRequested}    TST_F3_1_1_012
    log    ${ConsumeResult}
    #check ค่าเครื่อง 30 ติด permission denied
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.networkStatusRequested_TST_F3_1_1_012}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${LogNameNetworkStatusProblem}    TST_F3_1_1_012    ${PathLogNetworkStatusProblem}
    VerifyStatByCommand    TST_F3_1_1_012    nsb-network-status-problem    service-network-status-problem    success

TST_F3_1_1_013
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #SetLogให้ว่าง
    SetLogNull    ${LogNameNetworkStatusProblem}    ${PathLogNetworkStatusProblem}
    #QueryData
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${NetworkStatusProblem_TST_F3_1_1_013}
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${Json_TST_F3_1_1_013}    ${ID}
    #ConsumeData
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_qa.problemAreaCellRequested}    ${CmdProduce_qa.problemAreaCellRequested}    ${Procuce_TST_F3_1_1_013}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_qa.networkStatusRequested}    TST_F3_1_1_013
    log    ${ConsumeResult}
    #check ค่าเครื่อง 30 ติด permission denied
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.networkStatusRequested_TST_F3_1_1_013}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${LogNameNetworkStatusProblem}    TST_F3_1_1_013    ${PathLogNetworkStatusProblem}
    VerifyStatByCommand    TST_F3_1_1_013    nsb-network-status-problem    service-network-status-problem    success

TST_F3_1_1_014
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #SetLogให้ว่าง
    SetLogNull    ${LogNameNetworkStatusProblem}    ${PathLogNetworkStatusProblem}
    #QueryData
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${NetworkStatusProblem_TST_F3_1_1_014}
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${Json_TST_F3_1_1_014}    ${ID}
    #ConsumeData
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_qa.problemAreaCellRequested}    ${CmdProduce_qa.problemAreaCellRequested}    ${Procuce_TST_F3_1_1_014}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_qa.networkStatusRequested}    TST_F3_1_1_014
    log    ${ConsumeResult}
    #check ค่าเครื่อง 30 ติด permission denied
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.networkStatusRequested_TST_F3_1_1_014}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${LogNameNetworkStatusProblem}    TST_F3_1_1_014    ${PathLogNetworkStatusProblem}
    VerifyStatByCommand    TST_F3_1_1_014    nsb-network-status-problem    service-network-status-problem    success

TST_F3_1_1_015
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #SetLogให้ว่าง
    SetLogNull    ${LogNameNetworkStatusProblem}    ${PathLogNetworkStatusProblem}
    #QueryData
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${NetworkStatusProblem_TST_F3_1_1_015}
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${Json_TST_F3_1_1_015}    ${ID}
    #ConsumeData
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_qa.problemAreaCellRequested}    ${CmdProduce_qa.problemAreaCellRequested}    ${Procuce_TST_F3_1_1_015}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_qa.networkStatusRequested}    TST_F3_1_1_015
    log    ${ConsumeResult}
    #check ค่าเครื่อง 30 ติด permission denied
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.networkStatusRequested_TST_F3_1_1_015}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${LogNameNetworkStatusProblem}    TST_F3_1_1_015    ${PathLogNetworkStatusProblem}
    VerifyStatByCommand    TST_F3_1_1_015    nsb-network-status-problem    service-network-status-problem    success

TST_F3_1_1_016
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #SetLogให้ว่าง
    SetLogNull    ${LogNameNetworkStatusProblem}    ${PathLogNetworkStatusProblem}
    #QueryData
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${NetworkStatusProblem_TST_F3_1_1_016}
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${Json_TST_F3_1_1_016}    ${ID}
    #ConsumeData
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_qa.problemAreaCellRequested}    ${CmdProduce_qa.problemAreaCellRequested}    ${Procuce_TST_F3_1_1_016}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_qa.networkStatusRequested}    TST_F3_1_1_016
    log    ${ConsumeResult}
    #check ค่าเครื่อง 30 ติด permission denied
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.networkStatusRequested_TST_F3_1_1_016}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${LogNameNetworkStatusProblem}    TST_F3_1_1_016    ${PathLogNetworkStatusProblem}
    VerifyStatByCommand    TST_F3_1_1_016    nsb-network-status-problem    service-network-status-problem    success

TST_F3_1_1_017
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #SetLogให้ว่าง
    SetLogNull    ${LogNameNetworkStatusProblem}    ${PathLogNetworkStatusProblem}
    #QueryData
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${NetworkStatusProblem_TST_F3_1_1_017}
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${Json_TST_F3_1_1_017}    ${ID}
    #ConsumeData
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_qa.problemAreaCellRequested}    ${CmdProduce_qa.problemAreaCellRequested}    ${Procuce_TST_F3_1_1_017}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_qa.networkStatusRequested}    TST_F3_1_1_017
    log    ${ConsumeResult}
    #check ค่าเครื่อง 30 ติด permission denied
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.networkStatusRequested_TST_F3_1_1_017}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${LogNameNetworkStatusProblem}    TST_F3_1_1_017    ${PathLogNetworkStatusProblem}
    VerifyStatByCommand    TST_F3_1_1_017    nsb-network-status-problem    service-network-status-problem    success

TST_F3_1_1_018
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #SetLogให้ว่าง
    SetLogNull    ${LogNameNetworkStatusProblem}    ${PathLogNetworkStatusProblem}
    #QueryData
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${NetworkStatusProblem_TST_F3_1_1_018}
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${Json_TST_F3_1_1_018}    ${ID}
    #ConsumeData
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_qa.problemAreaCellRequested}    ${CmdProduce_qa.problemAreaCellRequested}    ${Procuce_TST_F3_1_1_018}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_qa.networkStatusRequested}    TST_F3_1_1_018
    log    ${ConsumeResult}
    #check ค่าเครื่อง 30 ติด permission denied
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.networkStatusRequested_TST_F3_1_1_018}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${LogNameNetworkStatusProblem}    TST_F3_1_1_018    ${PathLogNetworkStatusProblem}
    VerifyStatByCommand    TST_F3_1_1_018    nsb-network-status-problem    service-network-status-problem    success

TST_F3_1_1_019
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #SetLogให้ว่าง
    SetLogNull    ${LogNameNetworkStatusProblem}    ${PathLogNetworkStatusProblem}
    #QueryData
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${NetworkStatusProblem_TST_F3_1_1_019}
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${Json_TST_F3_1_1_019}    ${ID}
    #ConsumeData
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_qa.problemAreaCellRequested}    ${CmdProduce_qa.problemAreaCellRequested}    ${Procuce_TST_F3_1_1_019}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_qa.networkStatusRequested}    TST_F3_1_1_019
    log    ${ConsumeResult}
    #check ค่าเครื่อง 30 ติด permission denied
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.networkStatusRequested_TST_F3_1_1_019}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${LogNameNetworkStatusProblem}    TST_F3_1_1_019    ${PathLogNetworkStatusProblem}
    VerifyStatByCommand    TST_F3_1_1_019    nsb-network-status-problem    service-network-status-problem    success

TST_F3_1_1_020
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #SetLogให้ว่าง
    SetLogNull    ${LogNameNetworkStatusProblem}    ${PathLogNetworkStatusProblem}
    #QueryData
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${NetworkStatusProblem_TST_F3_1_1_020}
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${Json_TST_F3_1_1_020}    ${ID}
    #ConsumeData
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_qa.problemAreaCellRequested}    ${CmdProduce_qa.problemAreaCellRequested}    ${Procuce_TST_F3_1_1_020}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_qa.networkStatusRequested}    TST_F3_1_1_020
    log    ${ConsumeResult}
    #check ค่าเครื่อง 30 ติด permission denied
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.networkStatusRequested_TST_F3_1_1_020}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${LogNameNetworkStatusProblem}    TST_F3_1_1_020    ${PathLogNetworkStatusProblem}
    VerifyStatByCommand    TST_F3_1_1_020    nsb-network-status-problem    service-network-status-problem    success

TST_F3_1_1_021
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #SetLogให้ว่าง
    SetLogNull    ${LogNameNetworkStatusProblem}    ${PathLogNetworkStatusProblem}
    #QueryData
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${NetworkStatusProblem_TST_F3_1_1_021}
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${Json_TST_F3_1_1_021}    ${ID}
    #ConsumeData
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_qa.problemAreaCellRequested}    ${CmdProduce_qa.problemAreaCellRequested}    ${Procuce_TST_F3_1_1_021}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_qa.networkStatusRequested}    TST_F3_1_1_021
    log    ${ConsumeResult}
    #check ค่าเครื่อง 30 ติด permission denied
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.networkStatusRequested_TST_F3_1_1_021}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${LogNameNetworkStatusProblem}    TST_F3_1_1_021    ${PathLogNetworkStatusProblem}
    VerifyStatByCommand    TST_F3_1_1_021    nsb-network-status-problem    service-network-status-problem    success

TST_F3_1_1_022
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #SetLogให้ว่าง
    SetLogNull    ${LogNameNetworkStatusProblem}    ${PathLogNetworkStatusProblem}
    #QueryData
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${NetworkStatusProblem_TST_F3_1_1_022}
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${Json_TST_F3_1_1_022}    ${ID}
    #ConsumeData
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_qa.problemAreaCellRequested}    ${CmdProduce_qa.problemAreaCellRequested}    ${Procuce_TST_F3_1_1_022}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_qa.networkStatusRequested}    TST_F3_1_1_022
    log    ${ConsumeResult}
    #check ค่าเครื่อง 30 ติด permission denied
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.networkStatusRequested_TST_F3_1_1_022}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${LogNameNetworkStatusProblem}    TST_F3_1_1_022    ${PathLogNetworkStatusProblem}
    VerifyStatByCommand    TST_F3_1_1_022    nsb-network-status-problem    service-network-status-problem    success

TST_F3_1_1_023
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #SetLogให้ว่าง
    SetLogNull    ${LogNameNetworkStatusProblem}    ${PathLogNetworkStatusProblem}
    #QueryData
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${NetworkStatusProblem_TST_F3_1_1_023}
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${Json_TST_F3_1_1_023}    ${ID}
    #ConsumeData
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_qa.problemAreaCellRequested}    ${CmdProduce_qa.problemAreaCellRequested}    ${Procuce_TST_F3_1_1_023}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_qa.networkStatusRequested}    TST_F3_1_1_023
    log    ${ConsumeResult}
    #check ค่าเครื่อง 30 ติด permission denied
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.networkStatusRequested_TST_F3_1_1_023}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${LogNameNetworkStatusProblem}    TST_F3_1_1_023    ${PathLogNetworkStatusProblem}
    VerifyStatByCommand    TST_F3_1_1_023    nsb-network-status-problem    service-network-status-problem    success

TST_F3_1_1_024
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #SetLogให้ว่าง
    SetLogNull    ${LogNameNetworkStatusProblem}    ${PathLogNetworkStatusProblem}
    #QueryData
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${NetworkStatusProblem_TST_F3_1_1_024}
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${Json_TST_F3_1_1_024}    ${ID}
    #ConsumeData
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_qa.problemAreaCellRequested}    ${CmdProduce_qa.problemAreaCellRequested}    ${Procuce_TST_F3_1_1_024}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_qa.networkStatusRequested}    TST_F3_1_1_024
    log    ${ConsumeResult}
    #check ค่าเครื่อง 30 ติด permission denied
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.networkStatusRequested_TST_F3_1_1_024}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${LogNameNetworkStatusProblem}    TST_F3_1_1_024    ${PathLogNetworkStatusProblem}
    VerifyStatByCommand    TST_F3_1_1_024    nsb-network-status-problem    service-network-status-problem    success

TST_F3_1_1_025
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #SetLogให้ว่าง
    SetLogNull    ${LogNameNetworkStatusProblem}    ${PathLogNetworkStatusProblem}
    #QueryData
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${NetworkStatusProblem_TST_F3_1_1_025}
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${Json_TST_F3_1_1_025}    ${ID}
    #ConsumeData
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_qa.problemAreaCellRequested}    ${CmdProduce_qa.problemAreaCellRequested}    ${Procuce_TST_F3_1_1_025}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_qa.networkStatusRequested}    TST_F3_1_1_025
    log    ${ConsumeResult}
    #check ค่าเครื่อง 30 ติด permission denied
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.networkStatusRequested_TST_F3_1_1_025}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${LogNameNetworkStatusProblem}    TST_F3_1_1_025    ${PathLogNetworkStatusProblem}
    VerifyStatByCommand    TST_F3_1_1_025    nsb-network-status-problem    service-network-status-problem    success

TST_F3_1_1_026
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #SetLogให้ว่าง
    SetLogNull    ${LogNameNetworkStatusProblem}    ${PathLogNetworkStatusProblem}
    #QueryData
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${NetworkStatusProblem_TST_F3_1_1_026}
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${Json_TST_F3_1_1_026}    ${ID}
    #ConsumeData
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_qa.problemAreaCellRequested}    ${CmdProduce_qa.problemAreaCellRequested}    ${Procuce_TST_F3_1_1_026}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_qa.networkStatusRequested}    TST_F3_1_1_026
    log    ${ConsumeResult}
    #check ค่าเครื่อง 30 ติด permission denied
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.networkStatusRequested_TST_F3_1_1_026}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${LogNameNetworkStatusProblem}    TST_F3_1_1_026    ${PathLogNetworkStatusProblem}
    VerifyStatByCommand    TST_F3_1_1_026    nsb-network-status-problem    service-network-status-problem    success

TST_F3_1_1_027
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #SetLogให้ว่าง
    SetLogNull    ${LogNameNetworkStatusProblem}    ${PathLogNetworkStatusProblem}
    #QueryData
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${NetworkStatusProblem_TST_F3_1_1_027}
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${Json_TST_F3_1_1_027}    ${ID}
    #ConsumeData
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_qa.problemAreaCellRequested}    ${CmdProduce_qa.problemAreaCellRequested}    ${Procuce_TST_F3_1_1_027}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_qa.networkStatusRequested}    TST_F3_1_1_027
    log    ${ConsumeResult}
    #check ค่าเครื่อง 30 ติด permission denied
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.networkStatusRequested_TST_F3_1_1_027}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${LogNameNetworkStatusProblem}    TST_F3_1_1_027    ${PathLogNetworkStatusProblem}
    VerifyStatByCommand    TST_F3_1_1_027    nsb-network-status-problem    service-network-status-problem    success

TST_F3_1_1_028
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #SetLogให้ว่าง
    SetLogNull    ${LogNameNetworkStatusProblem}    ${PathLogNetworkStatusProblem}
    #QueryData
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${NetworkStatusProblem_TST_F3_1_1_028}
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${Json_TST_F3_1_1_028}    ${ID}
    #ConsumeData
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_qa.problemAreaCellRequested}    ${CmdProduce_qa.problemAreaCellRequested}    ${Procuce_TST_F3_1_1_028}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_qa.networkStatusRequested}    TST_F3_1_1_028
    log    ${ConsumeResult}
    #check ค่าเครื่อง 30 ติด permission denied
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.networkStatusRequested_TST_F3_1_1_028}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${LogNameNetworkStatusProblem}    TST_F3_1_1_028    ${PathLogNetworkStatusProblem}
    VerifyStatByCommand    TST_F3_1_1_028    nsb-network-status-problem    service-network-status-problem    success

TST_F3_1_1_029
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #SetLogให้ว่าง
    SetLogNull    ${LogNameNetworkStatusProblem}    ${PathLogNetworkStatusProblem}
    #QueryData
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${NetworkStatusProblem_TST_F3_1_1_029}
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${Json_TST_F3_1_1_029}    ${ID}
    #ConsumeData
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_qa.problemAreaCellRequested}    ${CmdProduce_qa.problemAreaCellRequested}    ${Procuce_TST_F3_1_1_029}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_qa.networkStatusRequested}    TST_F3_1_1_029
    log    ${ConsumeResult}
    #check ค่าเครื่อง 30 ติด permission denied
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.networkStatusRequested_TST_F3_1_1_029}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${LogNameNetworkStatusProblem}    TST_F3_1_1_029    ${PathLogNetworkStatusProblem}
    VerifyStatByCommand    TST_F3_1_1_029    nsb-network-status-problem    service-network-status-problem    success

TST_F3_1_1_030
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #SetLogให้ว่าง
    SetLogNull    ${LogNameNetworkStatusProblem}    ${PathLogNetworkStatusProblem}
    #QueryData
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${NetworkStatusProblem_TST_F3_1_1_030}
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${Json_TST_F3_1_1_030}    ${ID}
    #ConsumeData
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_qa.problemAreaCellRequested}    ${CmdProduce_qa.problemAreaCellRequested}    ${Procuce_TST_F3_1_1_030}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_qa.networkStatusRequested}    TST_F3_1_1_030
    log    ${ConsumeResult}
    #check ค่าเครื่อง 30 ติด permission denied
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.networkStatusRequested_TST_F3_1_1_030}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${LogNameNetworkStatusProblem}    TST_F3_1_1_030    ${PathLogNetworkStatusProblem}
    VerifyStatByCommand    TST_F3_1_1_030    nsb-network-status-problem    service-network-status-problem    success

TST_F3_1_1_031
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #SetLogให้ว่าง
    SetLogNull    ${LogNameNetworkStatusProblem}    ${PathLogNetworkStatusProblem}
    #QueryData
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${NetworkStatusProblem_TST_F3_1_1_031}
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${Json_TST_F3_1_1_031}    ${ID}
    #ConsumeData
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_qa.problemAreaCellRequested}    ${CmdProduce_qa.problemAreaCellRequested}    ${Procuce_TST_F3_1_1_031}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_qa.networkStatusRequested}    TST_F3_1_1_031
    log    ${ConsumeResult}
    #check ค่าเครื่อง 30 ติด permission denied
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.networkStatusRequested_TST_F3_1_1_031}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${LogNameNetworkStatusProblem}    TST_F3_1_1_031    ${PathLogNetworkStatusProblem}
    VerifyStatByCommand    TST_F3_1_1_031    nsb-network-status-problem    service-network-status-problem    success

TST_F3_1_1_032
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #SetLogให้ว่าง
    SetLogNull    ${LogNameNetworkStatusProblem}    ${PathLogNetworkStatusProblem}
    #QueryData
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${NetworkStatusProblem_TST_F3_1_1_032}
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${Json_TST_F3_1_1_032}    ${ID}
    #ConsumeData
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_qa.problemAreaCellRequested}    ${CmdProduce_qa.problemAreaCellRequested}    ${Procuce_TST_F3_1_1_032}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_qa.networkStatusRequested}    TST_F3_1_1_032
    log    ${ConsumeResult}
    #check ค่าเครื่อง 30 ติด permission denied
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.networkStatusRequested_TST_F3_1_1_032}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${LogNameNetworkStatusProblem}    TST_F3_1_1_032    ${PathLogNetworkStatusProblem}
    VerifyStatByCommand    TST_F3_1_1_032    nsb-network-status-problem    service-network-status-problem    success

TST_F3_1_1_033
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #SetLogให้ว่าง
    SetLogNull    ${LogNameNetworkStatusProblem}    ${PathLogNetworkStatusProblem}
    #QueryData
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${NetworkStatusProblem_TST_F3_1_1_033}
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${Json_TST_F3_1_1_033}    ${ID}
    #ConsumeData
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_qa.problemAreaCellRequested}    ${CmdProduce_qa.problemAreaCellRequested}    ${Procuce_TST_F3_1_1_033}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_qa.networkStatusRequested}    TST_F3_1_1_033
    log    ${ConsumeResult}
    #check ค่าเครื่อง 30 ติด permission denied
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.networkStatusRequested_TST_F3_1_1_033}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${LogNameNetworkStatusProblem}    TST_F3_1_1_033    ${PathLogNetworkStatusProblem}
    VerifyStatByCommand    TST_F3_1_1_033    nsb-network-status-problem    service-network-status-problem    success

TST_F3_1_1_034
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #SetLogให้ว่าง
    SetLogNull    ${LogNameNetworkStatusProblem}    ${PathLogNetworkStatusProblem}
    #QueryData
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${NetworkStatusProblem_TST_F3_1_1_034}
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${Json_TST_F3_1_1_034}    ${ID}
    #ConsumeData
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_qa.problemAreaCellRequested}    ${CmdProduce_qa.problemAreaCellRequested}    ${Procuce_TST_F3_1_1_034}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_qa.networkStatusRequested}    TST_F3_1_1_034
    log    ${ConsumeResult}
    #check ค่าเครื่อง 30 ติด permission denied
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.networkStatusRequested_TST_F3_1_1_034}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${LogNameNetworkStatusProblem}    TST_F3_1_1_034    ${PathLogNetworkStatusProblem}
    VerifyStatByCommand    TST_F3_1_1_034    nsb-network-status-problem    service-network-status-problem    success

TST_F3_1_1_035
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #SetLogให้ว่าง
    SetLogNull    ${LogNameNetworkStatusProblem}    ${PathLogNetworkStatusProblem}
    #QueryData
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${NetworkStatusProblem_TST_F3_1_1_035}
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${Json_TST_F3_1_1_035}    ${ID}
    #ConsumeData
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_qa.problemAreaCellRequested}    ${CmdProduce_qa.problemAreaCellRequested}    ${Procuce_TST_F3_1_1_035}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_qa.networkStatusRequested}    TST_F3_1_1_035
    log    ${ConsumeResult}
    #check ค่าเครื่อง 30 ติด permission denied
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.networkStatusRequested_TST_F3_1_1_035}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${LogNameNetworkStatusProblem}    TST_F3_1_1_035    ${PathLogNetworkStatusProblem}
    VerifyStatByCommand    TST_F3_1_1_035    nsb-network-status-problem    service-network-status-problem    success

TST_F3_0_1_036
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #SetLogให้ว่าง
    SetLogNull    ${LogNameNetworkStatusProblem}    ${PathLogNetworkStatusProblem}
    #QueryData
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${NetworkStatusProblem_TST_F3_0_1_036}
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${Json_TST_F3_0_1_036}    ${ID}
    #ConsumeData
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_qa.problemAreaCellRequested}    ${CmdProduce_qa.problemAreaCellRequested}    ${Procuce_TST_F3_0_1_036}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_qa.networkStatusRequested}    TST_F3_0_1_036
    log    ${ConsumeResult}
    #check ค่าเครื่อง 30 ติด permission denied
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.networkStatusRequested_TST_F3_0_1_036}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${LogNameNetworkStatusProblem}    TST_F3_0_1_036    ${PathLogNetworkStatusProblem}

TST_F3_1_1_037
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #SetLogให้ว่าง
    SetLogNull    ${LogNameNetworkStatusProblem}    ${PathLogNetworkStatusProblem}
    #QueryData
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${NetworkStatusProblem_TST_F3_1_1_037}
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${Json_TST_F3_1_1_037}    ${ID}
    #ConsumeData
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_qa.problemAreaCellRequested}    ${CmdProduce_qa.problemAreaCellRequested}    ${Procuce_TST_F3_1_1_037}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_qa.networkStatusRequested}    TST_F3_1_1_037
    log    ${ConsumeResult}
    #check ค่าเครื่อง 30 ติด permission denied
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.networkStatusRequested_TST_F3_1_1_037}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${LogNameNetworkStatusProblem}    TST_F3_1_1_037    ${PathLogNetworkStatusProblem}
    VerifyStatByCommand    TST_F3_1_1_037    nsb-network-status-problem    service-network-status-problem    success

TST_F3_0_1_000
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #SetLogให้ว่าง
    SetLogNull    ${LogNameNetworkStatusProblem}    ${PathLogNetworkStatusProblem}
    #QueryData
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${NetworkStatusProblem_TST_F3_0_1_000}
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${Json_TST_F3_0_1_000}    ${ID}
    #ConsumeData
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_qa.problemAreaCellRequested}    ${CmdProduce_qa.problemAreaCellRequested}    ${Procuce_TST_F3_0_1_000}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_qa.networkStatusRequested}    TST_F3_0_1_000
    log    ${ConsumeResult}
    #check ค่าเครื่อง 30 ติด permission denied
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.networkStatusRequested_TST_F3_0_1_000}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${LogNameNetworkStatusProblem}    TST_F3_0_1_000    ${PathLogNetworkStatusProblem}
    VerifyStatByCommand    TST_F3_0_1_000    nsb-network-status-problem    service-network-status-problem    error

TST_F3_0_1_001
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #SetLogให้ว่าง
    SetLogNull    ${LogNameNetworkStatusProblem}    ${PathLogNetworkStatusProblem}
    #QueryData
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${NetworkStatusProblem_TST_F3_0_1_001}
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${Json_TST_F3_0_1_001}    ${ID}
    #ConsumeData
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_qa.problemAreaCellRequested}    ${CmdProduce_qa.problemAreaCellRequested}    ${Procuce_TST_F3_0_1_001}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_qa.networkStatusRequested}    TST_F3_0_1_001
    log    ${ConsumeResult}
    #check ค่าเครื่อง 30 ติด permission denied
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.networkStatusRequested_TST_F3_0_1_001}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${LogNameNetworkStatusProblem}    TST_F3_0_1_001    ${PathLogNetworkStatusProblem}
    VerifyStatByCommand    TST_F3_0_1_001    nsb-network-status-problem    service-network-status-problem    success    error

TST_F3_0_1_002
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #SetLogให้ว่าง
    SetLogNull    ${LogNameNetworkStatusProblem}    ${PathLogNetworkStatusProblem}
    #QueryData
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${NetworkStatusProblem_TST_F3_0_1_002}
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${Json_TST_F3_0_1_002}    ${ID}
    #ConsumeData
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_qa.problemAreaCellRequested}    ${CmdProduce_qa.problemAreaCellRequested}    ${Procuce_TST_F3_0_1_002}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_qa.networkStatusRequested}    TST_F3_0_1_002
    log    ${ConsumeResult}
    #check ค่าเครื่อง 30 ติด permission denied
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.networkStatusRequested_TST_F3_0_1_002}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${LogNameNetworkStatusProblem}    TST_F3_0_1_002    ${PathLogNetworkStatusProblem}
    VerifyStatByCommand    TST_F3_0_1_002    nsb-network-status-problem    service-network-status-problem    ERROR_NOTFOUND_DB

TST_F3_0_1_003
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #SetLogให้ว่าง
    SetLogNull    ${LogNameNetworkStatusProblem}    ${PathLogNetworkStatusProblem}
    #QueryData
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${NetworkStatusProblem_TST_F3_0_1_003}
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${Json_TST_F3_0_1_003}    ${ID}
    #ConsumeData
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_qa.problemAreaCellRequested}    ${CmdProduce_qa.problemAreaCellRequested}    ${Procuce_TST_F3_0_1_003}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_qa.networkStatusRequested}    TST_F3_0_1_003
    log    ${ConsumeResult}
    #check ค่าเครื่อง 30 ติด permission denied
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.networkStatusRequested_TST_F3_0_1_003}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${LogNameNetworkStatusProblem}    TST_F3_0_1_003    ${PathLogNetworkStatusProblem}
    VerifyStatByCommand    TST_F3_0_1_003    nsb-network-status-problem    service-network-status-problem    ERROR_MISSING_INVALID

TST_F3_0_1_007
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #SetLogให้ว่าง
    SetLogNull    ${LogNameNetworkStatusProblem}    ${PathLogNetworkStatusProblem}
    #QueryData
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${NetworkStatusProblem_TST_F3_0_1_007}
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${Json_TST_F3_0_1_007}    ${ID}
    #ConsumeData
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_qa.problemAreaCellRequested}    ${CmdProduce_qa.problemAreaCellRequested}    ${Procuce_TST_F3_0_1_007}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_qa.networkStatusRequested}    TST_F3_0_1_007
    log    ${ConsumeResult}
    #check ค่าเครื่อง 30 ติด permission denied
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.networkStatusRequested_TST_F3_0_1_007}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${LogNameNetworkStatusProblem}    TST_F3_0_1_007    ${PathLogNetworkStatusProblem}
    VerifyStatByCommand    TST_F3_0_1_007    nsb-network-status-problem    service-network-status-problem    ERROR_NOTFOUND_DB

TST_F3_1_1_038
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #SetLogให้ว่าง
    SetLogNull    ${LogNameNetworkStatusProblem}    ${PathLogNetworkStatusProblem}
    #QueryData
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${NetworkStatusProblem_TST_F3_1_1_038}
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${Json_TST_F3_1_1_038}    ${ID}
    #ConsumeData
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_qa.problemAreaCellRequested}    ${CmdProduce_qa.problemAreaCellRequested}    ${Procuce_TST_F3_1_1_038}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_qa.networkStatusRequested}    TST_F3_1_1_038
    log    ${ConsumeResult}
    #check ค่าเครื่อง 30 ติด permission denied
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.networkStatusRequested_TST_F3_1_1_038}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${LogNameNetworkStatusProblem}    TST_F3_1_1_038    ${PathLogNetworkStatusProblem}
    VerifyStatByCommand    TST_F3_1_1_038    nsb-network-status-problem    service-network-status-problem    success

TST_F3_0_1_004
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #SetLogให้ว่าง
    SetLogNull    ${LogNameNetworkStatusProblem}    ${PathLogNetworkStatusProblem}
    #QueryData
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${NetworkStatusProblem_TST_F3_0_1_004}
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${Json_TST_F3_0_1_004}    ${ID}
    #ConsumeData
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_qa.problemAreaCellRequested}    ${CmdProduce_qa.problemAreaCellRequested}    ${Procuce_TST_F3_0_1_004}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_qa.networkStatusRequested}    TST_F3_0_1_004
    log    ${ConsumeResult}
    #check ค่าเครื่อง 30 ติด permission denied
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.networkStatusRequested_TST_F3_0_1_004}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${LogNameNetworkStatusProblem}    TST_F3_0_1_004    ${PathLogNetworkStatusProblem}
    VerifyStatByCommand    TST_F3_0_1_004    nsb-network-status-problem    service-network-status-problem    ERROR_MISSING_INVALID

TST_F3_0_1_010
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #SetLogให้ว่าง
    SetLogNull    ${LogNameNetworkStatusProblem}    ${PathLogNetworkStatusProblem}
    #QueryData
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${NetworkStatusProblem_TST_F3_0_1_010}
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${Json_TST_F3_0_1_010}    ${ID}
    #ConsumeData
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_qa.problemAreaCellRequested}    ${CmdProduce_qa.problemAreaCellRequested}    ${Procuce_TST_F3_0_1_010}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_qa.networkStatusRequested}    TST_F3_0_1_010
    log    ${ConsumeResult}
    #check ค่าเครื่อง 30 ติด permission denied
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.networkStatusRequested_TST_F3_0_1_010}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${LogNameNetworkStatusProblem}    TST_F3_0_1_010    ${PathLogNetworkStatusProblem}
    VerifyStatByCommand    TST_F3_0_1_010    nsb-network-status-problem    service-network-status-problem    ERROR

TST_F3_0_1_011
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #SetLogให้ว่าง
    SetLogNull    ${LogNameNetworkStatusProblem}    ${PathLogNetworkStatusProblem}
    Comment    #QueryData
    Comment    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${NetworkStatusProblem_TST_F3_0_1_011}
    Comment    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${Json_TST_F3_0_1_011}    ${ID}
    #ConsumeData
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_qa.problemAreaCellRequested}    ${CmdProduce_qa.problemAreaCellRequested}    ${Procuce_TST_F3_0_1_011}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_qa.networkStatusRequested}    TST_F3_0_1_011
    log    ${ConsumeResult}
    #check ค่าเครื่อง 30 ติด permission denied
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.networkStatusRequested_TST_F3_0_1_011}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${LogNameNetworkStatusProblem}    TST_F3_0_1_011    ${PathLogNetworkStatusProblem}
    VerifyStatByCommand    TST_F3_0_1_011    nsb-network-status-problem    service-network-status-problem    ERROR_MISSING_INVALID

TST_F3_0_1_012
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #SetLogให้ว่าง
    SetLogNull    ${LogNameNetworkStatusProblem}    ${PathLogNetworkStatusProblem}
    #QueryData
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${NetworkStatusProblem_TST_F3_0_1_012}
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${Json_TST_F3_0_1_012}    ${ID}
    #ConsumeData
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_qa.problemAreaCellRequested}    ${CmdProduce_qa.problemAreaCellRequested}    ${Procuce_TST_F3_0_1_012}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_qa.networkStatusRequested}    TST_F3_0_1_012
    log    ${ConsumeResult}
    #check ค่าเครื่อง 30 ติด permission denied
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.networkStatusRequested_TST_F3_0_1_012}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${LogNameNetworkStatusProblem}    TST_F3_0_1_012    ${PathLogNetworkStatusProblem}
    VerifyStatByCommand    TST_F3_0_1_012    nsb-network-status-problem    service-network-status-problem    ERROR

TST_F3_0_1_013
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #SetLogให้ว่าง
    SetLogNull    ${LogNameNetworkStatusProblem}    ${PathLogNetworkStatusProblem}
    #QueryData
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${NetworkStatusProblem_TST_F3_0_1_013}
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollectionNameqaNetworkStatusPaper}    ${Json_TST_F3_0_1_013}    ${ID}
    #ConsumeData
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_qa.problemAreaCellRequested}    ${CmdProduce_qa.problemAreaCellRequested}    ${Procuce_TST_F3_0_1_013}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_qa.networkStatusRequested}    TST_F3_0_1_013
    log    ${ConsumeResult}
    #check ค่าเครื่อง 30 ติด permission denied
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.networkStatusRequested_TST_F3_0_1_013}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${LogNameNetworkStatusProblem}    TST_F3_0_1_013    ${PathLogNetworkStatusProblem}
    VerifyStatByCommand    TST_F3_0_1_013    nsb-network-status-problem    service-network-status-problem    ERROR_MISSING_INVALID

TST_F3_1_1_003__test_may
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    #SetLogให้ว่าง
    SetLogNull    ${LogNameNetworkStatusProblem}    /home/serveradm/nsb/service-network-status-problem-may/logs
    #QueryData
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    qaNetworkStatusPaper_may    ${NetworkStatusProblem_TST_F3_1_1_003}
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    qaNetworkStatusPaper_may    ${Json_TST_F3_1_1_003}    ${ID}
    #ConsumeData
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    /app/kafka/kafka_2.13-3.2.3/bin/kafka-delete-records.sh --bootstrap-server DMYAISNSB-0002:9093 --command-config /app/kafka/kafka_2.13-3.2.3/config/admin-sasl.properties --offset-json-file /home/serveradm/delete-qa.networkStatusRequested_may.json    /app/kafka/kafka_2.13-3.2.3/bin/kafka-console-producer.sh --bootstrap-server DMYAISNSB-0002:9093 --producer.config /app/kafka/kafka_2.13-3.2.3/config/admin-sasl.properties --topic qa.problemAreaCellRequested_may    ${Procuce_TST_F3_1_1_003}
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    /app/kafka/kafka_2.13-3.2.3/bin/kafka-console-consumer.sh --bootstrap-server DMYAISNSB-0002:9093 --consumer.config /app/kafka/kafka_2.13-3.2.3/config/admin-sasl.properties --topic qa.networkStatusRequested_may --from-beginning    TST_F3_1_1_003
    log    ${ConsumeResult}
    #check ค่าเครื่อง 30 ติด permission denied
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.networkStatusRequested_TST_F3_1_1_003}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogAndStatbyCommandName    ${LogNameNetworkStatusProblem}    TST_F3_1_1_003    /home/serveradm/nsb/service-network-status-problem-may/logs
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    TST_F3_1_1_003    nsb-network-status-problem    service-network-status-problem-may    success
