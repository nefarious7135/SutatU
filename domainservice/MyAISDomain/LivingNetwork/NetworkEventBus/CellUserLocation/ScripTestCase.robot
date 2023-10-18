*** Settings ***
Resource          Variable.robot
Resource          ../../Keyword/Common.robot
Resource          ../../Keyword/MongoDB.robot
Resource          ../../Keyword/SecureCRT.robot
Resource          ../../Valiables/CommonValiable/CommonValiable.robot

*** Test Cases ***
Insert_LocationMasterCell
    Connect To MongoDB    ${DataBaseNameNEB_qa}
    #Query_CGI_HEX
    ${ID}    QueryDataReturnID    ${DataBaseNameNEB_qa}    ${CollactionNameLocationMasterCell}    ${CGI_HEX_TST_F2_1_1_000}
    #InsertDataTable_performanceLevel
    CheckResultAndInsertDelectData    ${DataBaseNameNEB_qa}    ${CollactionNameLocationMasterCell}    ${JsonInsertDB_TST_F2_1_1_000}    ${ID}

TST_F2_1_1_000
    #Insert_LocationMasterCell
    Connect To MongoDB    ${DataBaseNameNEB_qa}
    #Query_CGI_HEX
    ${ID}    QueryDataReturnID    ${DataBaseNameNEB_qa}    ${CollactionNameLocationMasterCell}    ${CGI_HEX_TST_F2_1_1_000}
    #InsertDataTable_performanceLevel
    CheckResultAndInsertDelectData    ${DataBaseNameNEB_qa}    ${CollactionNameLocationMasterCell}    ${JsonInsertDB_TST_F2_1_1_000}    ${ID}
    Sleep    5
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull    ${NameCommandFileLog}    ${PathLogNEB_Log}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.228}
    ProduceKafka    ${CmdDeleteMassage_qa.cellUserLocation}    ${CmdProduce_qa.cellUserLocation}    ${DataProduce_TST_F2_1_1_000}
    Sleep    5
    # querydata and check upsert CellUserLocation
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNEB_qa}    ${CollactionNameCellUserLocation}    ${msisdn_TST_F2_1_1_000}
    VerifyMongoDB    ${Jsondata}    ${Jsonupsert_TST_F2_1_1_000}
    Sleep    15
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    FlushLogbyCommandName_NEB    ${NameCommandFileLog}    TST_F2_1_1_000    ${PathLogNEB_Log}

TST_F2_1_1_001
    #Insert_LocationMasterCell
    Connect To MongoDB    ${DataBaseNameNEB_qa}
    #Query_CGI_HEX
    ${ID}    QueryDataReturnID    ${DataBaseNameNEB_qa}    ${CollactionNameLocationMasterCell}    ${CGI_HEX_TST_F2_1_1_001}
    #InsertDataTable_performanceLevel
    CheckResultAndInsertDelectData    ${DataBaseNameNEB_qa}    ${CollactionNameLocationMasterCell}    ${JsonInsertDB_TST_F2_1_1_001}    ${ID}
    Sleep    5
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull    ${NameCommandFileLog}    ${PathLogNEB_Log}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.228}
    ProduceKafka    ${CmdDeleteMassage_qa.cellUserLocation}    ${CmdProduce_qa.cellUserLocation}    ${DataProduce_TST_F2_1_1_001}
    Sleep    5
    # querydata and check upsert CellUserLocation
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNEB_qa}    ${CollactionNameCellUserLocation}    ${msisdn_TST_F2_1_1_001}
    VerifyMongoDB    ${Jsondata}    ${Jsonupsert_TST_F2_1_1_001}
    Sleep    15
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    FlushLogbyCommandName_NEB    ${NameCommandFileLog}    TST_F2_1_1_001    ${PathLogNEB_Log}

TST_F2_1_1_002
    #Insert_LocationMasterCell
    Connect To MongoDB    ${DataBaseNameNEB_qa}
    #Query_CGI_HEX
    ${ID}    QueryDataReturnID    ${DataBaseNameNEB_qa}    ${CollactionNameLocationMasterCell}    ${CGI_HEX_TST_F2_1_1_002}
    #InsertDataTable_performanceLevel
    CheckResultAndInsertDelectData    ${DataBaseNameNEB_qa}    ${CollactionNameLocationMasterCell}    ${JsonInsertDB_TST_F2_1_1_002}    ${ID}
    Sleep    5
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull    ${NameCommandFileLog}    ${PathLogNEB_Log}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.228}
    ProduceKafka    ${CmdDeleteMassage_qa.cellUserLocation}    ${CmdProduce_qa.cellUserLocation}    ${DataProduce_TST_F2_1_1_002}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    FlushLogbyCommandName_NEB    ${NameCommandFileLog}    TST_F2_1_1_002    ${PathLogNEB_Log}

TST_F2_1_1_003
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull    ${NameCommandFileLog}    ${PathLogNEB_Log}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.228}
    ProduceKafka    ${CmdDeleteMassage_qa.cellUserLocation}    ${CmdProduce_qa.cellUserLocation}    ${DataProduce_TST_F2_1_1_003}
    Sleep    5
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    FlushLogbyCommandName_NEB    ${NameCommandFileLog}    TST_F2_1_1_003    ${PathLogNEB_Log}

TST_F2_1_1_004
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull    ${NameCommandFileLog}    ${PathLogNEB_Log}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.228}
    ProduceKafka    ${CmdDeleteMassage_qa.cellUserLocation}    ${CmdProduce_qa.cellUserLocation}    ${DataProduce_TST_F2_1_1_004}
    Sleep    5
    # querydata and check upsert CellUserLocation
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNEB_qa}    ${CollactionNameCellUserLocation}    ${msisdn_TST_F2_1_1_004}
    VerifyMongoDB    ${Jsondata}    ${Jsonupsert_TST_F2_1_1_004}
    Sleep    8
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    FlushLogbyCommandName_NEB    ${NameCommandFileLog}    TST_F2_1_1_004    ${PathLogNEB_Log}

TST_F2_1_1_005
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull    ${NameCommandFileLog}    ${PathLogNEB_Log}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.228}
    ProduceKafka    ${CmdDeleteMassage_qa.cellUserLocation}    ${CmdProduce_qa.cellUserLocation}    ${DataProduce_TST_F2_1_1_005}
    Sleep    5
    # querydata and check upsert CellUserLocation
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNEB_qa}    ${CollactionNameCellUserLocation}    ${msisdn_TST_F2_1_1_005}
    VerifyMongoDB    ${Jsondata}    ${Jsonupsert_TST_F2_1_1_005}
    Sleep    8
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    FlushLogbyCommandName_NEB    ${NameCommandFileLog}    TST_F2_1_1_005    ${PathLogNEB_Log}

TST_F2_1_1_006
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull    ${NameCommandFileLog}    ${PathLogNEB_Log}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.228}
    ProduceKafka    ${CmdDeleteMassage_qa.cellUserLocation}    ${CmdProduce_qa.cellUserLocation}    ${DataProduce_TST_F2_1_1_006}
    Sleep    8
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    FlushLogbyCommandName_NEB    ${NameCommandFileLog}    TST_F2_1_1_006    ${PathLogNEB_Log}

TST_F2_1_1_007
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull    ${NameCommandFileLog}    ${PathLogNEB_Log}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.228}
    ProduceKafka    ${CmdDeleteMassage_qa.cellUserLocation}    ${CmdProduce_qa.cellUserLocation}    ${DataProduce_TST_F2_1_1_007}
    Sleep    5
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    FlushLogbyCommandName_NEB    ${NameCommandFileLog}    TST_F2_1_1_007    ${PathLogNEB_Log}

TST_F2_1_1_008
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull    ${NameCommandFileLog}    ${PathLogNEB_Log}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.228}
    ProduceKafka    ${CmdDeleteMassage_qa.cellUserLocation}    ${CmdProduce_qa.cellUserLocation}    ${DataProduce_TST_F2_1_1_008}
    Sleep    5
    # querydata and check upsert CellUserLocation
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNEB_qa}    ${CollactionNameCellUserLocation}    ${msisdn_TST_F2_1_1_008}
    VerifyMongoDB    ${Jsondata}    ${Jsonupsert_TST_F2_1_1_008}
    Sleep    15
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    FlushLogbyCommandName_NEB    ${NameCommandFileLog}    TST_F2_1_1_008    ${PathLogNEB_Log}

TST_F2_1_1_009
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull    ${NameCommandFileLog}    ${PathLogNEB_Log}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.228}
    ProduceKafka    ${CmdDeleteMassage_qa.cellUserLocation}    ${CmdProduce_qa.cellUserLocation}    ${DataProduce_TST_F2_1_1_009}
    Sleep    15
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    FlushLogbyCommandName_NEB    ${NameCommandFileLog}    TST_F2_1_1_009    ${PathLogNEB_Log}

TST_F2_1_1_010
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull    ${NameCommandFileLog}    ${PathLogNEB_Log}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.228}
    ProduceKafka    ${CmdDeleteMassage_qa.cellUserLocation}    ${CmdProduce_qa.cellUserLocation}    ${DataProduce_TST_F2_1_1_010}
    Sleep    15
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    FlushLogbyCommandName_NEB    ${NameCommandFileLog}    TST_F2_1_1_010    ${PathLogNEB_Log}

TST_F2_0_1_000
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull    ${NameCommandFileLog}    ${PathLogNEB_Log}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.228}
    ProduceKafka    ${CmdDeleteMassage_qa.cellUserLocation}    ${CmdProduce_qa.cellUserLocation}    ${DataProduce_TST_F2_0_1_000}
    Sleep    10
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    FlushLogbyCommandName_NEB    ${NameCommandFileLog}    TST_F2_0_1_000    ${PathLogNEB_Log}

TST_F2_0_1_001
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull    ${NameCommandFileLog}    ${PathLogNEB_Log}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.228}
    ProduceKafka    ${CmdDeleteMassage_qa.cellUserLocation}    ${CmdProduce_qa.cellUserLocation}    ${DataProduce_TST_F2_0_1_001}
    Sleep    15
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    FlushLogbyCommandName_NEB    ${NameCommandFileLog}    TST_F2_0_1_001    ${PathLogNEB_Log}

TST_F2_0_1_002
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull    ${NameCommandFileLog}    ${PathLogNEB_Log}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.228}
    ProduceKafka    ${CmdDeleteMassage_qa.cellUserLocation}    ${CmdProduce_qa.cellUserLocation}    ${DataProduce_TST_F2_0_1_002}
    Sleep    15
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    FlushLogbyCommandName_NEB    ${NameCommandFileLog}    TST_F2_0_1_002    ${PathLogNEB_Log}
