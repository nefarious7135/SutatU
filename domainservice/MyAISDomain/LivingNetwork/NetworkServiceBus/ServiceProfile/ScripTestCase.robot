*** Settings ***
Resource          Variable.robot
Resource          ../../Keyword/Common.robot
Resource          ../../Keyword/MongoDB.robot
Resource          ../../Keyword/SecureCRT.robot
Resource          ../../Valiables/CommonValiable/CommonValiable.robot

*** Test Cases ***
TST_F19_1_1_001
    #หาในDB ว่ามี msisdn ไหม
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn_TST_F19_1_1_001}
    #ข้ามขั้นตอนนี้ เพราะ app จะไป insert ค่าให้
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${JsonInsert_TST_F19_1_1_001}    ${ID}
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCommandFileLog}    ${PathLogServiceProfile}
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    #produce คำสั่ง ลง kafka
    ProduceKafka    ${CmdDeleteMassage_qa.requestServiceProfile}    ${CmdProduce_qa.requestServiceProfile}    ${DataProduce_TST_F19_1_1_001}
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    #Consume คำสั่ง ลง kafka
    ConsumeKafka    ${Consume_qa.serviceProfileRequested}    TST_F19_1_1_001
    log    ${ConsumeResult}
    # check ค่า
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.serviceProfileRequested_TST_F19_1_1_001}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    FlushLogbyCommandName    ${NameCommandFileLog}    TST_F19_1_1_001    ${PathLogServiceProfile}
    # querydata
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn_TST_F19_1_1_001}
    #check db
    VerifyMongoDB    ${Jsondata}    ${JsonInsert_TST_F19_1_1_001}
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn_TST_F19_1_1_001}
    DeleteDataFromID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${ID}

TST_F19_1_1_002
    #หาในDB ว่ามี msisdn ไหม
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn_TST_F19_1_1_002}
    #insert data
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${JsonInsert_TST_F19_1_1_002}    ${ID}
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCommandFileLog}    ${PathLogNSB}
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    #produce คำสั่ง ลง kafka
    ProduceKafka    ${CmdDeleteMassage_qa.requestServiceProfile}    ${CmdProduce_qa.requestServiceProfile}    ${DataProduce_TST_F19_1_1_002}
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    #Consume คำสั่ง ลง kafka
    ConsumeKafka    ${Consume_qa.serviceProfileRequested}    TST_F19_1_1_002
    log    ${ConsumeResult}
    # check ค่า
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.serviceProfileRequested_TST_F19_1_1_002}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    FlushLogbyCommandName    ${NameCommandFileLog}    TST_F19_1_1_002    ${PathLogNSB}
    # querydata
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn_TST_F19_1_1_002}
    #check db
    VerifyMongoDB    ${Jsondata}    ${JsonInsert_TST_F19_1_1_002}
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn_TST_F19_1_1_002}
    DeleteDataFromID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${ID}

TST_F19_1_1_003
    #หาในDB ว่ามี msisdn ไหม
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn_TST_F19_1_1_003}
    #insert data
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${JsonInsert_TST_F19_1_1_003}    ${ID}
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCommandFileLog}    ${PathLogNSB}
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    #produce คำสั่ง ลง kafka
    ProduceKafka    ${CmdDeleteMassage_qa.requestServiceProfile}    ${CmdProduce_qa.requestServiceProfile}    ${DataProduce_TST_F19_1_1_003}
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    #Consume คำสั่ง ลง kafka
    ConsumeKafka    ${Consume_qa.serviceProfileRequested}    TST_F19_1_1_003
    log    ${ConsumeResult}
    # check ค่า
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.serviceProfileRequested_TST_F19_1_1_003}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    FlushLogbyCommandName    ${NameCommandFileLog}    TST_F19_1_1_003    ${PathLogNSB}
    # querydata
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn_TST_F19_1_1_003}
    #check db
    VerifyMongoDB    ${Jsondata}    ${JsonInsert_TST_F19_1_1_003}
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn_TST_F19_1_1_003}
    DeleteDataFromID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${ID}

TST_F19_1_1_004
    #หาในDB ว่ามี msisdn ไหม
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn_TST_F19_1_1_004}
    #insert data
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${JsonInsert_TST_F19_1_1_004}    ${ID}
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCommandFileLog}    ${PathLogNSB}
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    #produce คำสั่ง ลง kafka
    ProduceKafka    ${CmdDeleteMassage_qa.requestServiceProfile}    ${CmdProduce_qa.requestServiceProfile}    ${DataProduce_TST_F19_1_1_004}
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    #Consume คำสั่ง ลง kafka
    sleep    10
    ConsumeKafka    ${Consume_qa.serviceProfileRequested}    TST_F19_1_1_004
    log    ${ConsumeResult}
    # check ค่า
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.serviceProfileRequested_TST_F19_1_1_004}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    FlushLogbyCommandName    ${NameCommandFileLog}    TST_F19_1_1_004    ${PathLogNSB}
    # querydata
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn_TST_F19_1_1_004}
    #check db
    VerifyMongoDB    ${Jsondata}    ${JsonInsert_TST_F19_1_1_004}
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn_TST_F19_1_1_004}
    DeleteDataFromID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${ID}

TST_F19_1_1_005
    #หาในDB ว่ามี msisdn ไหม
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn_TST_F19_1_1_005}
    #insert data
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${JsonInsert_TST_F19_1_1_005}    ${ID}
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCommandFileLog}    ${PathLogNSB}
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    #produce คำสั่ง ลง kafka
    ProduceKafka    ${CmdDeleteMassage_qa.requestServiceProfile}    ${CmdProduce_qa.requestServiceProfile}    ${DataProduce_TST_F19_1_1_005}
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    #Consume คำสั่ง ลง kafka
    sleep    10
    ConsumeKafka    ${Consume_qa.serviceProfileRequested}    TST_F19_1_1_005
    log    ${ConsumeResult}
    # check ค่า
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.serviceProfileRequested_TST_F19_1_1_005}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    FlushLogbyCommandName    ${NameCommandFileLog}    TST_F19_1_1_005    ${PathLogNSB}
    # querydata
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn_TST_F19_1_1_005}
    #check db
    VerifyMongoDB    ${Jsondata}    ${JsonInsert_TST_F19_1_1_005}
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn_TST_F19_1_1_005}
    DeleteDataFromID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${ID}

TST_F19_1_1_006
    #หาในDB ว่ามี msisdn ไหม
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn_TST_F19_1_1_006}
    #insert data
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${JsonInsert_TST_F19_1_1_006}    ${ID}
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCommandFileLog}    ${PathLogNSB}
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    #produce คำสั่ง ลง kafka
    ProduceKafka    ${CmdDeleteMassage_qa.requestServiceProfile}    ${CmdProduce_qa.requestServiceProfile}    ${DataProduce_TST_F19_1_1_006}
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    #Consume คำสั่ง ลง kafka
    ConsumeKafka    ${Consume_qa.serviceProfileRequested}    TST_F19_1_1_006
    log    ${ConsumeResult}
    # check ค่า
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.serviceProfileRequested_TST_F19_1_1_006}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    FlushLogbyCommandName    ${NameCommandFileLog}    TST_F19_1_1_006    ${PathLogNSB}
    # querydata
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn_TST_F19_1_1_006}
    #check db
    VerifyMongoDB    ${Jsondata}    ${JsonInsert_TST_F19_1_1_006}
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn_TST_F19_1_1_006}
    DeleteDataFromID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${ID}

TST_F19_1_1_007
    #หาในDB ว่ามี msisdn ไหม
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn_TST_F19_1_1_007}
    #insert data
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${JsonInsert_TST_F19_1_1_007}    ${ID}
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCommandFileLog}    ${PathLogNSB}
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    #produce คำสั่ง ลง kafka
    ProduceKafka    ${CmdDeleteMassage_qa.requestServiceProfile}    ${CmdProduce_qa.requestServiceProfile}    ${DataProduce_TST_F19_1_1_007}
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    #Consume คำสั่ง ลง kafka
    ConsumeKafka    ${Consume_qa.serviceProfileRequested}    TST_F19_1_1_007
    log    ${ConsumeResult}
    # check ค่า
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.serviceProfileRequested_TST_F19_1_1_007}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    FlushLogbyCommandName    ${NameCommandFileLog}    TST_F19_1_1_007    ${PathLogNSB}
    # querydata
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn_TST_F19_1_1_007}
    #check db
    VerifyMongoDB    ${Jsondata}    ${JsonInsert_TST_F19_1_1_007}
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn_TST_F19_1_1_007}
    DeleteDataFromID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${ID}

TST_F19_1_1_008
    #หาในDB ว่ามี msisdn ไหม
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn_TST_F19_1_1_008}
    #insert data
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${JsonInsert_TST_F19_1_1_008}    ${ID}
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCommandFileLog}    ${PathLogNSB}
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    #produce คำสั่ง ลง kafka
    ProduceKafka    ${CmdDeleteMassage_qa.requestServiceProfile}    ${CmdProduce_qa.requestServiceProfile}    ${DataProduce_TST_F19_1_1_008}
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    #Consume คำสั่ง ลง kafka
    ConsumeKafka    ${Consume_qa.serviceProfileRequested}    TST_F19_1_1_008
    log    ${ConsumeResult}
    # check ค่า
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.serviceProfileRequested_TST_F19_1_1_008}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    FlushLogbyCommandName    ${NameCommandFileLog}    TST_F19_1_1_008    ${PathLogNSB}
    # querydata
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn_TST_F19_1_1_008}
    #check db
    VerifyMongoDB    ${Jsondata}    ${JsonInsert_TST_F19_1_1_008}
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn_TST_F19_1_1_008}
    DeleteDataFromID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${ID}

TST_F19_1_1_009
    #หาในDB ว่ามี msisdn ไหม
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn_TST_F19_1_1_009}
    #insert data
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${JsonInsert_TST_F19_1_1_009}    ${ID}
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCommandFileLog}    ${PathLogNSB}
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    #produce คำสั่ง ลง kafka
    ProduceKafka    ${CmdDeleteMassage_qa.requestServiceProfile}    ${CmdProduce_qa.requestServiceProfile}    ${DataProduce_TST_F19_1_1_009}
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    #Consume คำสั่ง ลง kafka
    ConsumeKafka    ${Consume_qa.serviceProfileRequested}    TST_F19_1_1_009
    log    ${ConsumeResult}
    # check ค่า
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.serviceProfileRequested_TST_F19_1_1_009}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    FlushLogbyCommandName    ${NameCommandFileLog}    TST_F19_1_1_009    ${PathLogNSB}
    # querydata
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn_TST_F19_1_1_009}
    #check db
    VerifyMongoDB    ${Jsondata}    ${JsonInsert_TST_F19_1_1_009}
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn_TST_F19_1_1_009}
    DeleteDataFromID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${ID}

TST_F19_1_1_010
    #หาในDB ว่ามี msisdn ไหม
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn_TST_F19_1_1_010}
    #insert data
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${JsonInsert_TST_F19_1_1_010}    ${ID}
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCommandFileLog}    ${PathLogNSB}
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    #produce คำสั่ง ลง kafka
    ProduceKafka    ${CmdDeleteMassage_qa.requestServiceProfile}    ${CmdProduce_qa.requestServiceProfile}    ${DataProduce_TST_F19_1_1_010}
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    #Consume คำสั่ง ลง kafka
    ConsumeKafka    ${Consume_qa.serviceProfileRequested}    TST_F19_1_1_010
    log    ${ConsumeResult}
    # check ค่า
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.serviceProfileRequested_TST_F19_1_1_010}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    FlushLogbyCommandName    ${NameCommandFileLog}    TST_F19_1_1_010    ${PathLogNSB}
    # querydata
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn_TST_F19_1_1_010}
    #check db
    VerifyMongoDB    ${Jsondata}    ${JsonInsert_TST_F19_1_1_010}
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn_TST_F19_1_1_010}
    DeleteDataFromID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${ID}

TST_F19_1_1_011
    #หาในDB ว่ามี msisdn ไหม
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn_TST_F19_1_1_011}
    #insert data
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${JsonInsert_TST_F19_1_1_011}    ${ID}
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCommandFileLog}    ${PathLogNSB}
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    #produce คำสั่ง ลง kafka
    ProduceKafka    ${CmdDeleteMassage_qa.requestServiceProfile}    ${CmdProduce_qa.requestServiceProfile}    ${DataProduce_TST_F19_1_1_011}
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    #Consume คำสั่ง ลง kafka
    ConsumeKafka    ${Consume_qa.serviceProfileRequested}    TST_F19_1_1_011
    log    ${ConsumeResult}
    # check ค่า
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.serviceProfileRequested_TST_F19_1_1_011}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    FlushLogbyCommandName    ${NameCommandFileLog}    TST_F19_1_1_011    ${PathLogNSB}
    # querydata
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn_TST_F19_1_1_011}
    #check db
    VerifyMongoDB    ${Jsondata}    ${JsonInsert_TST_F19_1_1_011}
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn_TST_F19_1_1_011}
    DeleteDataFromID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${ID}

TST_F19_1_1_012
    #หาในDB ว่ามี msisdn ไหม
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn_TST_F19_1_1_012}
    #insert data
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${JsonInsert_TST_F19_1_1_012}    ${ID}
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCommandFileLog}    ${PathLogNSB}
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    #produce คำสั่ง ลง kafka
    ProduceKafka    ${CmdDeleteMassage_qa.requestServiceProfile}    ${CmdProduce_qa.requestServiceProfile}    ${DataProduce_TST_F19_1_1_012}
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    #Consume คำสั่ง ลง kafka
    ConsumeKafka    ${Consume_qa.serviceProfileRequested}    TST_F19_1_1_012
    log    ${ConsumeResult}
    # check ค่า
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.serviceProfileRequested_TST_F19_1_1_012}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    FlushLogbyCommandName    ${NameCommandFileLog}    TST_F19_1_1_012    ${PathLogNSB}
    # querydata
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn_TST_F19_1_1_012}
    #check db
    VerifyMongoDB    ${Jsondata}    ${JsonInsert_TST_F19_1_1_012}
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn_TST_F19_1_1_012}
    DeleteDataFromID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${ID}

TST_F19_0_1_001
    #หาในDB ว่ามี msisdn ไหม
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn_TST_F19_0_1_001}
    #insert data
    Comment    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${JsonInsert_TST_F19_0_1_001}    ${ID}
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCommandFileLog}    ${PathLogNSB}
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    #produce คำสั่ง ลง kafka
    ProduceKafka    ${CmdDeleteMassage_qa.requestServiceProfile}    ${CmdProduce_qa.requestServiceProfile}    ${DataProduce_TST_F19_0_1_001}
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    #Consume คำสั่ง ลง kafka
    ConsumeKafka    ${Consume_qa.serviceProfileRequested}    TST_F19_0_1_001
    log    ${ConsumeResult}
    # check ค่า
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.serviceProfileRequested_TST_F19_0_1_001}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    FlushLogbyCommandName    ${NameCommandFileLog}    TST_F19_0_1_001    ${PathLogNSB}
    # querydata
    Comment    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn_TST_F19_0_1_001}
    #check db
    Comment    VerifyMongoDB    ${Jsondata}    ${JsonInsert_TST_F19_0_1_001}
    Comment    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn_TST_F19_0_1_001}
    Comment    DeleteDataFromID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${ID}

TST_F19_0_1_002
    #หาในDB ว่ามี msisdn ไหม
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn_TST_F19_0_1_002}
    #insert data
    Comment    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${JsonInsert_TST_F19_0_1_002}    ${ID}
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCommandFileLog}    ${PathLogNSB}
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    #produce คำสั่ง ลง kafka
    ProduceKafka    ${CmdDeleteMassage_qa.requestServiceProfile}    ${CmdProduce_qa.requestServiceProfile}    ${DataProduce_TST_F19_0_1_002}
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    #Consume คำสั่ง ลง kafka
    ConsumeKafka    ${Consume_qa.serviceProfileRequested}    TST_F19_0_1_002
    log    ${ConsumeResult}
    # check ค่า
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.serviceProfileRequested_TST_F19_0_1_002}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    FlushLogbyCommandName    ${NameCommandFileLog}    TST_F19_0_1_002    ${PathLogNSB}
    # querydata
    Comment    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn_TST_F19_0_1_002}
    #check db
    Comment    VerifyMongoDB    ${Jsondata}    ${JsonInsert_TST_F19_0_1_002}
    Comment    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn_TST_F19_0_1_002}
    Comment    DeleteDataFromID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${ID}

TST_F19_0_1_003
    #หาในDB ว่ามี msisdn ไหม
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn_TST_F19_0_1_003}
    #insert data
    Comment    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${JsonInsert_TST_F19_0_1_003}    ${ID}
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCommandFileLog}    ${PathLogNSB}
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    #produce คำสั่ง ลง kafka
    ProduceKafka    ${CmdDeleteMassage_qa.requestServiceProfile}    ${CmdProduce_qa.requestServiceProfile}    ${DataProduce_TST_F19_0_1_003}
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    #Consume คำสั่ง ลง kafka
    ConsumeKafka    ${Consume_qa.serviceProfileRequested}    TST_F19_0_1_003
    log    ${ConsumeResult}
    # check ค่า
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.serviceProfileRequested_TST_F19_0_1_003}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    FlushLogbyCommandName    ${NameCommandFileLog}    TST_F19_0_1_003    ${PathLogNSB}
    # querydata
    Comment    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn_TST_F19_0_1_003}
    #check db
    Comment    VerifyMongoDB    ${Jsondata}    ${JsonInsert_TST_F19_0_1_003}
    Comment    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn_TST_F19_0_1_003}
    Comment    DeleteDataFromID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${ID}

TST_F19_0_1_004
    #หาในDB ว่ามี msisdn ไหม
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn_TST_F19_0_1_003}
    #insert data
    Comment    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${JsonInsert_TST_F19_0_1_003}    ${ID}
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCommandFileLog}    ${PathLogNSB}
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    #produce คำสั่ง ลง kafka
    ProduceKafka    ${CmdDeleteMassage_qa.requestServiceProfile}    ${CmdProduce_qa.requestServiceProfile}    ${DataProduce_TST_F19_0_1_003}
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    #Consume คำสั่ง ลง kafka
    ConsumeKafka    ${Consume_qa.serviceProfileRequested}    TST_F19_0_1_003
    log    ${ConsumeResult}
    # check ค่า
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.serviceProfileRequested_TST_F19_0_1_003}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    FlushLogbyCommandName    ${NameCommandFileLog}    TST_F19_0_1_003    ${PathLogNSB}
    # querydata
    Comment    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn_TST_F19_0_1_003}
    #check db
    Comment    VerifyMongoDB    ${Jsondata}    ${JsonInsert_TST_F19_0_1_003}
    Comment    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn_TST_F19_0_1_003}
    Comment    DeleteDataFromID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${ID}

TST_F19_0_1_005
    #หาในDB ว่ามี msisdn ไหม
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn_TST_F19_0_1_003}
    #insert data
    Comment    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${JsonInsert_TST_F19_0_1_003}    ${ID}
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCommandFileLog}    ${PathLogNSB}
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    #produce คำสั่ง ลง kafka
    ProduceKafka    ${CmdDeleteMassage_qa.requestServiceProfile}    ${CmdProduce_qa.requestServiceProfile}    ${DataProduce_TST_F19_0_1_003}
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    #Consume คำสั่ง ลง kafka
    ConsumeKafka    ${Consume_qa.serviceProfileRequested}    TST_F19_0_1_003
    log    ${ConsumeResult}
    # check ค่า
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.serviceProfileRequested_TST_F19_0_1_003}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    FlushLogbyCommandName    ${NameCommandFileLog}    TST_F19_0_1_003    ${PathLogNSB}
    # querydata
    Comment    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn_TST_F19_0_1_003}
    #check db
    Comment    VerifyMongoDB    ${Jsondata}    ${JsonInsert_TST_F19_0_1_003}
    Comment    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn_TST_F19_0_1_003}
    Comment    DeleteDataFromID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${ID}
