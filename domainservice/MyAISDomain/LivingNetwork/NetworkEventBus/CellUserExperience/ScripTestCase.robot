*** Settings ***
Resource          Variable.robot
Resource          ../../Keyword/Common.robot
Resource          ../../Keyword/MongoDB.robot
Resource          ../../Keyword/SecureCRT.robot
Resource          ../../Valiables/CommonValiable/CommonValiable.robot
*** Test Cases ***
TST_F3_1_1_000
    #Insert_LocationMasterCell
    Connect To MongoDB    ${DataBaseNameNEB_qa}
    #Prepare data in mongoDB
    InsertDataFromJson    ${DataBaseNameNEB_qa}    ${CollactionNameLocationMasterCell}    ${JsonInsert_TST_F3_1_1_000}
    InsertDataFromJson    ${DataBaseNameNEB_qa}    ${CollactionNameCellUserLocation}    ${JsonInsertUser_TST_F3_1_1_000}
    Sleep    5
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull_NEB    ${NameCommandFileLog}    ${PathLogNEB_Log}
    SetLogNull_NEB    ${NameCommandFileLogUser}    ${PathLogNEB_Log}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.228}
    ProduceKafka    ${CmdDeleteMassage_qa.controlUserPlaneNetworkEvent}    ${CmdProduce_qa.controlUserPlaneNetworkEvent}    ${DataProduce_TST_F3_1_1_000}
    Sleep    5
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.228}
    ProduceKafka    ${CmdDeleteMassage_qa.cellUserLocation}    ${CmdProduce_qa.cellUserLocation}    ${DataProduceUser_TST_F3_1_1_000}
    Sleep    5
    #Consume คำสั่ง ลง kafka
    Comment    ConnectSecureCRT    ${HostURL_10.138.38.228}
    Comment    ConsumeKafka    ${Consume_qa.currentCellAvailabilityChecked}    TST_F3_1_1_000
    Comment    log    ${ConsumeResult}
    Comment    # check ค่า
    Comment    #VerifyDataConsume    ${ConsumeResult}    {"key": "TST_F3_1_000_key","invokeId": "TST_F3_1_000_invokeId","command": "qa.currentCellAvailabilityChecked","value": {"invokeId":"TST_F3_1_000_invokeId","headerBody": {"msisdn": "66836077991","transactionId": "TST_F3_1_000_transactionId"},"dataBody": {"resultCode":"20000","description": "Success","cellId": "520031B714775","capacity": 0,"current5GModeEnabler": 2}}}
    Comment    # querydata and check result
    Comment    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    {"cellId": "${CellID}"}
    Comment    Comment    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    {"cellId": "${CellID}"}
    Comment    VerifyMongoDB    ${Jsondata}    ${Jsonupsert_TST_F3_1_1_000}
    Comment    Sleep    15
    Comment    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    FlushLogbyCommandName_NEB    ${NameCommandFileLog}    TST_F3_1_1_000    ${PathLogNEB_Log}
    FlushLogbyCommandName_NEB    ${NameCommandFileLogUser}    TST_F3_1_1_000    ${PathLogNEB_Log}

TST_F3_1_1_001
    #Insert_LocationMasterCell
    Connect To MongoDB    ${DataBaseNameNEB_qa}
    #Prepare data in mongoDB
    InsertDataFromJson    ${DataBaseNameNEB_qa}    ${CollactionNameLocationMasterCell}    ${JsonInsert_TST_F3_1_1_001}
    InsertDataFromJson    ${DataBaseNameNEB_qa}    ${CollactionNameCellUserLocation}    ${JsonInsertUser_TST_F3_1_1_001}
    Sleep    5
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull_NEB    ${NameCommandFileLog}    ${PathLogNEB_Log}
    SetLogNull_NEB    ${NameCommandFileLogUser}    ${PathLogNEB_Log}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.228}
    ProduceKafka    ${CmdDeleteMassage_qa.controlUserPlaneNetworkEvent}    ${CmdProduce_qa.controlUserPlaneNetworkEvent}    ${DataProduce_TST_F3_1_1_001}
    Sleep    5
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.228}
    ProduceKafka    ${CmdDeleteMassage_qa.cellUserLocation}    ${CmdProduce_qa.cellUserLocation}    ${DataProduceUser_TST_F3_1_1_001}
    Sleep    5
    #Consume คำสั่ง ลง kafka
    Comment    ConnectSecureCRT    ${HostURL_10.138.38.228}
    Comment    ConsumeKafka    ${Consume_qa.currentCellAvailabilityChecked}    TST_F3_1_1_000
    Comment    log    ${ConsumeResult}
    Comment    # check ค่า
    Comment    #VerifyDataConsume    ${ConsumeResult}    {"key": "TST_F3_1_000_key","invokeId": "TST_F3_1_000_invokeId","command": "qa.currentCellAvailabilityChecked","value": {"invokeId":"TST_F3_1_000_invokeId","headerBody": {"msisdn": "66836077991","transactionId": "TST_F3_1_000_transactionId"},"dataBody": {"resultCode":"20000","description": "Success","cellId": "520031B714775","capacity": 0,"current5GModeEnabler": 2}}}
    Comment    # querydata and check result
    Comment    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    {"cellId": "${CellID}"}
    Comment    Comment    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    {"cellId": "${CellID}"}
    Comment    VerifyMongoDB    ${Jsondata}    ${Jsonupsert_TST_F3_1_1_000}
    Comment    Sleep    15
    Comment    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    FlushLogbyCommandName_NEB    ${NameCommandFileLog}    TST_F3_1_1_001    ${PathLogNEB_Log}
    FlushLogbyCommandName_NEB    ${NameCommandFileLogUser}    TST_F3_1_1_001    ${PathLogNEB_Log}

TST_F3_1_1_002
    #Insert_LocationMasterCell
    Connect To MongoDB    ${DataBaseNameNEB_qa}
    #Prepare data in mongoDB
    InsertDataFromJson    ${DataBaseNameNEB_qa}    ${CollactionNameLocationMasterCell}    ${JsonInsert_TST_F3_1_1_002}
    InsertDataFromJson    ${DataBaseNameNEB_qa}    ${CollactionNameCellUserLocation}    ${JsonInsertUser_TST_F3_1_1_002}
    Sleep    5
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull_NEB    ${NameCommandFileLog}    ${PathLogNEB_Log}
    SetLogNull_NEB    ${NameCommandFileLogUser}    ${PathLogNEB_Log}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.228}
    ProduceKafka    ${CmdDeleteMassage_qa.controlUserPlaneNetworkEvent}    ${CmdProduce_qa.controlUserPlaneNetworkEvent}    ${DataProduce_TST_F3_1_1_002}
    Sleep    5
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.228}
    ProduceKafka    ${CmdDeleteMassage_qa.cellUserLocation}    ${CmdProduce_qa.cellUserLocation}    ${DataProduceUser_TST_F3_1_1_002}
    Sleep    5
    #Consume คำสั่ง ลง kafka
    Comment    ConnectSecureCRT    ${HostURL_10.138.38.228}
    Comment    ConsumeKafka    ${Consume_qa.currentCellAvailabilityChecked}    TST_F3_1_1_000
    Comment    log    ${ConsumeResult}
    Comment    # check ค่า
    Comment    #VerifyDataConsume    ${ConsumeResult}    {"key": "TST_F3_1_000_key","invokeId": "TST_F3_1_000_invokeId","command": "qa.currentCellAvailabilityChecked","value": {"invokeId":"TST_F3_1_000_invokeId","headerBody": {"msisdn": "66836077991","transactionId": "TST_F3_1_000_transactionId"},"dataBody": {"resultCode":"20000","description": "Success","cellId": "520031B714775","capacity": 0,"current5GModeEnabler": 2}}}
    Comment    # querydata and check result
    Comment    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    {"cellId": "${CellID}"}
    Comment    Comment    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    {"cellId": "${CellID}"}
    Comment    VerifyMongoDB    ${Jsondata}    ${Jsonupsert_TST_F3_1_1_000}
    Comment    Sleep    15
    Comment    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    FlushLogbyCommandName_NEB    ${NameCommandFileLog}    TST_F3_1_1_002    ${PathLogNEB_Log}
    FlushLogbyCommandName_NEB    ${NameCommandFileLogUser}    TST_F3_1_1_002    ${PathLogNEB_Log}

TST_F3_1_1_003
    #Insert_LocationMasterCell
    Connect To MongoDB    ${DataBaseNameNEB_qa}
    #Prepare data in mongoDB
    InsertDataFromJson    ${DataBaseNameNEB_qa}    ${CollactionNameLocationMasterCell}    ${JsonInsert_TST_F3_1_1_003}
    InsertDataFromJson    ${DataBaseNameNEB_qa}    ${CollactionNameCellUserLocation}    ${JsonInsertUser_TST_F3_1_1_003}
    Sleep    5
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull_NEB    ${NameCommandFileLog}    ${PathLogNEB_Log}
    SetLogNull_NEB    ${NameCommandFileLogUser}    ${PathLogNEB_Log}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.228}
    ProduceKafka    ${CmdDeleteMassage_qa.controlUserPlaneNetworkEvent}    ${CmdProduce_qa.controlUserPlaneNetworkEvent}    ${DataProduce_TST_F3_1_1_003}
    Sleep    5
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.228}
    ProduceKafka    ${CmdDeleteMassage_qa.cellUserLocation}    ${CmdProduce_qa.cellUserLocation}    ${DataProduceUser_TST_F3_1_1_003}
    Sleep    5
    #Consume คำสั่ง ลง kafka
    Comment    ConnectSecureCRT    ${HostURL_10.138.38.228}
    Comment    ConsumeKafka    ${Consume_qa.currentCellAvailabilityChecked}    TST_F3_1_1_000
    Comment    log    ${ConsumeResult}
    Comment    # check ค่า
    Comment    #VerifyDataConsume    ${ConsumeResult}    {"key": "TST_F3_1_000_key","invokeId": "TST_F3_1_000_invokeId","command": "qa.currentCellAvailabilityChecked","value": {"invokeId":"TST_F3_1_000_invokeId","headerBody": {"msisdn": "66836077991","transactionId": "TST_F3_1_000_transactionId"},"dataBody": {"resultCode":"20000","description": "Success","cellId": "520031B714775","capacity": 0,"current5GModeEnabler": 2}}}
    Comment    # querydata and check result
    Comment    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    {"cellId": "${CellID}"}
    Comment    Comment    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    {"cellId": "${CellID}"}
    Comment    VerifyMongoDB    ${Jsondata}    ${Jsonupsert_TST_F3_1_1_000}
    Comment    Sleep    15
    Comment    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    FlushLogbyCommandName_NEB    ${NameCommandFileLog}    TST_F3_1_1_003    ${PathLogNEB_Log}
    FlushLogbyCommandName_NEB    ${NameCommandFileLogUser}    TST_F3_1_1_003    ${PathLogNEB_Log}

TST_F3_1_1_004
    #Insert_LocationMasterCell
    Connect To MongoDB    ${DataBaseNameNEB_qa}
    #Prepare data in mongoDB
    InsertDataFromJson    ${DataBaseNameNEB_qa}    ${CollactionNameLocationMasterCell}    ${JsonInsert_TST_F3_1_1_004}
    InsertDataFromJson    ${DataBaseNameNEB_qa}    ${CollactionNameCellUserLocation}    ${JsonInsertUser_TST_F3_1_1_004}
    Sleep    5
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull_NEB    ${NameCommandFileLog}    ${PathLogNEB_Log}
    SetLogNull_NEB    ${NameCommandFileLogUser}    ${PathLogNEB_Log}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.228}
    ProduceKafka    ${CmdDeleteMassage_qa.controlUserPlaneNetworkEvent}    ${CmdProduce_qa.controlUserPlaneNetworkEvent}    ${DataProduce_TST_F3_1_1_004}
    Sleep    5
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.228}
    ProduceKafka    ${CmdDeleteMassage_qa.cellUserLocation}    ${CmdProduce_qa.cellUserLocation}    ${DataProduceUser_TST_F3_1_1_000}
    Sleep    5
    #Consume คำสั่ง ลง kafka
    Comment    ConnectSecureCRT    ${HostURL_10.138.38.228}
    Comment    ConsumeKafka    ${Consume_qa.currentCellAvailabilityChecked}    TST_F3_1_1_000
    Comment    log    ${ConsumeResult}
    Comment    # check ค่า
    Comment    #VerifyDataConsume    ${ConsumeResult}    {"key": "TST_F3_1_000_key","invokeId": "TST_F3_1_000_invokeId","command": "qa.currentCellAvailabilityChecked","value": {"invokeId":"TST_F3_1_000_invokeId","headerBody": {"msisdn": "66836077991","transactionId": "TST_F3_1_000_transactionId"},"dataBody": {"resultCode":"20000","description": "Success","cellId": "520031B714775","capacity": 0,"current5GModeEnabler": 2}}}
    Comment    # querydata and check result
    Comment    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    {"cellId": "${CellID}"}
    Comment    Comment    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    {"cellId": "${CellID}"}
    Comment    VerifyMongoDB    ${Jsondata}    ${Jsonupsert_TST_F3_1_1_000}
    Comment    Sleep    15
    Comment    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    FlushLogbyCommandName_NEB    ${NameCommandFileLog}    TST_F3_1_1_004    ${PathLogNEB_Log}
    FlushLogbyCommandName_NEB    ${NameCommandFileLogUser}    TST_F3_1_1_004    ${PathLogNEB_Log}

TST_F3_1_1_005
    #Insert_LocationMasterCell
    Connect To MongoDB    ${DataBaseNameNEB_qa}
    #Prepare data in mongoDB
    InsertDataFromJson    ${DataBaseNameNEB_qa}    ${CollactionNameLocationMasterCell}    ${JsonInsert_TST_F3_1_1_005}
    InsertDataFromJson    ${DataBaseNameNEB_qa}    ${CollactionNameCellUserLocation}    ${JsonInsertUser_TST_F3_1_1_005}
    Sleep    5
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull_NEB    ${NameCommandFileLog}    ${PathLogNEB_Log}
    SetLogNull_NEB    ${NameCommandFileLogUser}    ${PathLogNEB_Log}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.228}
    ProduceKafka    ${CmdDeleteMassage_qa.controlUserPlaneNetworkEvent}    ${CmdProduce_qa.controlUserPlaneNetworkEvent}    ${DataProduce_TST_F3_1_1_005}
    Sleep    5
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.228}
    ProduceKafka    ${CmdDeleteMassage_qa.cellUserLocation}    ${CmdProduce_qa.cellUserLocation}    ${DataProduceUser_TST_F3_1_1_005}
    Sleep    5
    #Consume คำสั่ง ลง kafka
    Comment    ConnectSecureCRT    ${HostURL_10.138.38.228}
    Comment    ConsumeKafka    ${Consume_qa.currentCellAvailabilityChecked}    TST_F3_1_1_000
    Comment    log    ${ConsumeResult}
    Comment    # check ค่า
    Comment    #VerifyDataConsume    ${ConsumeResult}    {"key": "TST_F3_1_000_key","invokeId": "TST_F3_1_000_invokeId","command": "qa.currentCellAvailabilityChecked","value": {"invokeId":"TST_F3_1_000_invokeId","headerBody": {"msisdn": "66836077991","transactionId": "TST_F3_1_000_transactionId"},"dataBody": {"resultCode":"20000","description": "Success","cellId": "520031B714775","capacity": 0,"current5GModeEnabler": 2}}}
    Comment    # querydata and check result
    Comment    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    {"cellId": "${CellID}"}
    Comment    Comment    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    {"cellId": "${CellID}"}
    Comment    VerifyMongoDB    ${Jsondata}    ${Jsonupsert_TST_F3_1_1_000}
    Comment    Sleep    15
    Comment    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    FlushLogbyCommandName_NEB    ${NameCommandFileLog}    TST_F3_1_1_005 ${PathLogNEB_Log}
    FlushLogbyCommandName_NEB    ${NameCommandFileLogUser}    TST_F3_1_1_005    ${PathLogNEB_Log}

TST_F3_1_1_006
    #Insert_LocationMasterCell
    Connect To MongoDB    ${DataBaseNameNEB_qa}
    #Prepare data in mongoDB
    InsertDataFromJson    ${DataBaseNameNEB_qa}    ${CollactionNameLocationMasterCell}    ${JsonInsert_TST_F3_1_1_006}
    InsertDataFromJson    ${DataBaseNameNEB_qa}    ${CollactionNameCellUserLocation}    ${JsonInsertUser_TST_F3_1_1_006}
    Sleep    5
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull_NEB    ${NameCommandFileLog}    ${PathLogNEB_Log}
    SetLogNull_NEB    ${NameCommandFileLogUser}    ${PathLogNEB_Log}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.228}
    ProduceKafka    ${CmdDeleteMassage_qa.controlUserPlaneNetworkEvent}    ${CmdProduce_qa.controlUserPlaneNetworkEvent}    ${DataProduce_TST_F3_1_1_006}
    Sleep    5
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.228}
    ProduceKafka    ${CmdDeleteMassage_qa.cellUserLocation}    ${CmdProduce_qa.cellUserLocation}    ${DataProduceUser_TST_F3_1_1_006}
    Sleep    5
    #Consume คำสั่ง ลง kafka
    Comment    ConnectSecureCRT    ${HostURL_10.138.38.228}
    Comment    ConsumeKafka    ${Consume_qa.currentCellAvailabilityChecked}    TST_F3_1_1_000
    Comment    log    ${ConsumeResult}
    Comment    # check ค่า
    Comment    #VerifyDataConsume    ${ConsumeResult}    {"key": "TST_F3_1_000_key","invokeId": "TST_F3_1_000_invokeId","command": "qa.currentCellAvailabilityChecked","value": {"invokeId":"TST_F3_1_000_invokeId","headerBody": {"msisdn": "66836077991","transactionId": "TST_F3_1_000_transactionId"},"dataBody": {"resultCode":"20000","description": "Success","cellId": "520031B714775","capacity": 0,"current5GModeEnabler": 2}}}
    Comment    # querydata and check result
    Comment    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    {"cellId": "${CellID}"}
    Comment    Comment    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    {"cellId": "${CellID}"}
    Comment    VerifyMongoDB    ${Jsondata}    ${Jsonupsert_TST_F3_1_1_000}
    Comment    Sleep    15
    Comment    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    FlushLogbyCommandName_NEB    ${NameCommandFileLog}    TST_F3_1_1_006    ${PathLogNEB_Log}
    FlushLogbyCommandName_NEB    ${NameCommandFileLogUser}    TST_F3_1_1_006    ${PathLogNEB_Log}

TST_F3_1_1_007
    #Insert_LocationMasterCell
    Connect To MongoDB    ${DataBaseNameNEB_qa}
    #Prepare data in mongoDB
    InsertDataFromJson    ${DataBaseNameNEB_qa}    ${CollactionNameLocationMasterCell}    ${JsonInsert_TST_F3_1_1_007}
    InsertDataFromJson    ${DataBaseNameNEB_qa}    ${CollactionNameCellUserLocation}    ${JsonInsertUser_TST_F3_1_1_007}
    Sleep    5
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull_NEB    ${NameCommandFileLog}    ${PathLogNEB_Log}
    SetLogNull_NEB    ${NameCommandFileLogUser}    ${PathLogNEB_Log}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.228}
    ProduceKafka    ${CmdDeleteMassage_qa.controlUserPlaneNetworkEvent}    ${CmdProduce_qa.controlUserPlaneNetworkEvent}    ${DataProduce_TST_F3_1_1_007}
    Sleep    5
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.228}
    ProduceKafka    ${CmdDeleteMassage_qa.cellUserLocation}    ${CmdProduce_qa.cellUserLocation}    ${DataProduceUser_TST_F3_1_1_007}
    Sleep    5
    #Consume คำสั่ง ลง kafka
    Comment    ConnectSecureCRT    ${HostURL_10.138.38.228}
    Comment    ConsumeKafka    ${Consume_qa.currentCellAvailabilityChecked}    TST_F3_1_1_000
    Comment    log    ${ConsumeResult}
    Comment    # check ค่า
    Comment    #VerifyDataConsume    ${ConsumeResult}    {"key": "TST_F3_1_000_key","invokeId": "TST_F3_1_000_invokeId","command": "qa.currentCellAvailabilityChecked","value": {"invokeId":"TST_F3_1_000_invokeId","headerBody": {"msisdn": "66836077991","transactionId": "TST_F3_1_000_transactionId"},"dataBody": {"resultCode":"20000","description": "Success","cellId": "520031B714775","capacity": 0,"current5GModeEnabler": 2}}}
    Comment    # querydata and check result
    Comment    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    {"cellId": "${CellID}"}
    Comment    Comment    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    {"cellId": "${CellID}"}
    Comment    VerifyMongoDB    ${Jsondata}    ${Jsonupsert_TST_F3_1_1_000}
    Comment    Sleep    15
    Comment    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    FlushLogbyCommandName_NEB    ${NameCommandFileLog}    TST_F3_1_1_007    ${PathLogNEB_Log}
    FlushLogbyCommandName_NEB    ${NameCommandFileLogUser}    TST_F3_1_1_007    ${PathLogNEB_Log}

TST_F3_1_1_008
    #Insert_LocationMasterCell
    Connect To MongoDB    ${DataBaseNameNEB_qa}
    #Prepare data in mongoDB
    InsertDataFromJson    ${DataBaseNameNEB_qa}    ${CollactionNameLocationMasterCell}    ${JsonInsert_TST_F3_1_1_008}
    InsertDataFromJson    ${DataBaseNameNEB_qa}    ${CollactionNameCellUserLocation}    ${JsonInsertUser_TST_F3_1_1_008}
    Sleep    5
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull_NEB    ${NameCommandFileLog}    ${PathLogNEB_Log}
    SetLogNull_NEB    ${NameCommandFileLogUser}    ${PathLogNEB_Log}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.228}
    ProduceKafka    ${CmdDeleteMassage_qa.controlUserPlaneNetworkEvent}    ${CmdProduce_qa.controlUserPlaneNetworkEvent}    ${DataProduce_TST_F3_1_1_008}
    Sleep    5
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.228}
    ProduceKafka    ${CmdDeleteMassage_qa.cellUserLocation}    ${CmdProduce_qa.cellUserLocation}    ${DataProduceUser_TST_F3_1_1_008}
    Sleep    5
    #Consume คำสั่ง ลง kafka
    Comment    ConnectSecureCRT    ${HostURL_10.138.38.228}
    Comment    ConsumeKafka    ${Consume_qa.currentCellAvailabilityChecked}    TST_F3_1_1_000
    Comment    log    ${ConsumeResult}
    Comment    # check ค่า
    Comment    #VerifyDataConsume    ${ConsumeResult}    {"key": "TST_F3_1_000_key","invokeId": "TST_F3_1_000_invokeId","command": "qa.currentCellAvailabilityChecked","value": {"invokeId":"TST_F3_1_000_invokeId","headerBody": {"msisdn": "66836077991","transactionId": "TST_F3_1_000_transactionId"},"dataBody": {"resultCode":"20000","description": "Success","cellId": "520031B714775","capacity": 0,"current5GModeEnabler": 2}}}
    Comment    # querydata and check result
    Comment    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    {"cellId": "${CellID}"}
    Comment    Comment    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    {"cellId": "${CellID}"}
    Comment    VerifyMongoDB    ${Jsondata}    ${Jsonupsert_TST_F3_1_1_000}
    Comment    Sleep    15
    Comment    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    FlushLogbyCommandName_NEB    ${NameCommandFileLog}    TST_F3_1_1_008    ${PathLogNEB_Log}
    FlushLogbyCommandName_NEB    ${NameCommandFileLogUser}    TST_F3_1_1_008    ${PathLogNEB_Log}

TST_F3_1_1_009
    #Insert_LocationMasterCell
    Connect To MongoDB    ${DataBaseNameNEB_qa}
    #Prepare data in mongoDB
    InsertDataFromJson    ${DataBaseNameNEB_qa}    ${CollactionNameLocationMasterCell}    ${JsonInsert_TST_F3_1_1_009}
    InsertDataFromJson    ${DataBaseNameNEB_qa}    ${CollactionNameCellUserLocation}    ${JsonInsertUser_TST_F3_1_1_009}
    Sleep    5
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull_NEB    ${NameCommandFileLog}    ${PathLogNEB_Log}
    SetLogNull_NEB    ${NameCommandFileLogUser}    ${PathLogNEB_Log}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.228}
    ProduceKafka    ${CmdDeleteMassage_qa.controlUserPlaneNetworkEvent}    ${CmdProduce_qa.controlUserPlaneNetworkEvent}    ${DataProduce_TST_F3_1_1_009}
    Sleep    5
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.228}
    ProduceKafka    ${CmdDeleteMassage_qa.cellUserLocation}    ${CmdProduce_qa.cellUserLocation}    ${DataProduceUser_TST_F3_1_1_009}
    Sleep    5
    #Consume คำสั่ง ลง kafka
    Comment    ConnectSecureCRT    ${HostURL_10.138.38.228}
    Comment    ConsumeKafka    ${Consume_qa.currentCellAvailabilityChecked}    TST_F3_1_1_000
    Comment    log    ${ConsumeResult}
    Comment    # check ค่า
    Comment    #VerifyDataConsume    ${ConsumeResult}    {"key": "TST_F3_1_000_key","invokeId": "TST_F3_1_000_invokeId","command": "qa.currentCellAvailabilityChecked","value": {"invokeId":"TST_F3_1_000_invokeId","headerBody": {"msisdn": "66836077991","transactionId": "TST_F3_1_000_transactionId"},"dataBody": {"resultCode":"20000","description": "Success","cellId": "520031B714775","capacity": 0,"current5GModeEnabler": 2}}}
    Comment    # querydata and check result
    Comment    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    {"cellId": "${CellID}"}
    Comment    Comment    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    {"cellId": "${CellID}"}
    Comment    VerifyMongoDB    ${Jsondata}    ${Jsonupsert_TST_F3_1_1_000}
    Comment    Sleep    15
    Comment    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    FlushLogbyCommandName_NEB    ${NameCommandFileLog}    TST_F3_1_1_009    ${PathLogNEB_Log}
    FlushLogbyCommandName_NEB    ${NameCommandFileLogUser}    TST_F3_1_1_009    ${PathLogNEB_Log}

TST_F3_1_1_010
    #Insert_LocationMasterCell
    Connect To MongoDB    ${DataBaseNameNEB_qa}
    #Prepare data in mongoDB
    InsertDataFromJson    ${DataBaseNameNEB_qa}    ${CollactionNameLocationMasterCell}    ${JsonInsert_TST_F3_1_1_010}
    InsertDataFromJson    ${DataBaseNameNEB_qa}    ${CollactionNameCellUserLocation}    ${JsonInsertUser_TST_F3_1_1_010}
    Sleep    5
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull_NEB    ${NameCommandFileLog}    ${PathLogNEB_Log}
    SetLogNull_NEB    ${NameCommandFileLogUser}    ${PathLogNEB_Log}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.228}
    ProduceKafka    ${CmdDeleteMassage_qa.controlUserPlaneNetworkEvent}    ${CmdProduce_qa.controlUserPlaneNetworkEvent}    ${DataProduce_TST_F3_1_1_010}
    Sleep    5
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.228}
    ProduceKafka    ${CmdDeleteMassage_qa.cellUserLocation}    ${CmdProduce_qa.cellUserLocation}    ${DataProduceUser_TST_F3_1_1_010}
    Sleep    5
    #Consume คำสั่ง ลง kafka
    Comment    ConnectSecureCRT    ${HostURL_10.138.38.228}
    Comment    ConsumeKafka    ${Consume_qa.currentCellAvailabilityChecked}    TST_F3_1_1_000
    Comment    log    ${ConsumeResult}
    Comment    # check ค่า
    Comment    #VerifyDataConsume    ${ConsumeResult}    {"key": "TST_F3_1_000_key","invokeId": "TST_F3_1_000_invokeId","command": "qa.currentCellAvailabilityChecked","value": {"invokeId":"TST_F3_1_000_invokeId","headerBody": {"msisdn": "66836077991","transactionId": "TST_F3_1_000_transactionId"},"dataBody": {"resultCode":"20000","description": "Success","cellId": "520031B714775","capacity": 0,"current5GModeEnabler": 2}}}
    Comment    # querydata and check result
    Comment    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    {"cellId": "${CellID}"}
    Comment    Comment    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    {"cellId": "${CellID}"}
    Comment    VerifyMongoDB    ${Jsondata}    ${Jsonupsert_TST_F3_1_1_000}
    Comment    Sleep    15
    Comment    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    FlushLogbyCommandName_NEB    ${NameCommandFileLog}    TST_F3_1_1_010    ${PathLogNEB_Log}
    FlushLogbyCommandName_NEB    ${NameCommandFileLogUser}    TST_F3_1_1_010    ${PathLogNEB_Log}

TST_F3_1_1_011
    #Insert_LocationMasterCell
    Connect To MongoDB    ${DataBaseNameNEB_qa}
    #Prepare data in mongoDB
    InsertDataFromJson    ${DataBaseNameNEB_qa}    ${CollactionNameLocationMasterCell}    ${JsonInsert_TST_F3_1_1_011}
    InsertDataFromJson    ${DataBaseNameNEB_qa}    ${CollactionNameCellUserLocation}    ${JsonInsertUser_TST_F3_1_1_011}
    Sleep    5
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull_NEB    ${NameCommandFileLog}    ${PathLogNEB_Log}
    SetLogNull_NEB    ${NameCommandFileLogUser}    ${PathLogNEB_Log}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.228}
    ProduceKafka    ${CmdDeleteMassage_qa.controlUserPlaneNetworkEvent}    ${CmdProduce_qa.controlUserPlaneNetworkEvent}    ${DataProduce_TST_F3_1_1_011}
    Sleep    5
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.228}
    ProduceKafka    ${CmdDeleteMassage_qa.cellUserLocation}    ${CmdProduce_qa.cellUserLocation}    ${DataProduceUser_TST_F3_1_1_011}
    Sleep    5
    #Consume คำสั่ง ลง kafka
    Comment    ConnectSecureCRT    ${HostURL_10.138.38.228}
    Comment    ConsumeKafka    ${Consume_qa.currentCellAvailabilityChecked}    TST_F3_1_1_000
    Comment    log    ${ConsumeResult}
    Comment    # check ค่า
    Comment    #VerifyDataConsume    ${ConsumeResult}    {"key": "TST_F3_1_000_key","invokeId": "TST_F3_1_000_invokeId","command": "qa.currentCellAvailabilityChecked","value": {"invokeId":"TST_F3_1_000_invokeId","headerBody": {"msisdn": "66836077991","transactionId": "TST_F3_1_000_transactionId"},"dataBody": {"resultCode":"20000","description": "Success","cellId": "520031B714775","capacity": 0,"current5GModeEnabler": 2}}}
    Comment    # querydata and check result
    Comment    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    {"cellId": "${CellID}"}
    Comment    Comment    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    {"cellId": "${CellID}"}
    Comment    VerifyMongoDB    ${Jsondata}    ${Jsonupsert_TST_F3_1_1_000}
    Comment    Sleep    15
    Comment    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    FlushLogbyCommandName_NEB    ${NameCommandFileLog}    TST_F3_1_1_011    ${PathLogNEB_Log}
    FlushLogbyCommandName_NEB    ${NameCommandFileLogUser}    TST_F3_1_1_011    ${PathLogNEB_Log}

TST_F3_0_1_000
    #Insert_LocationMasterCell
    Connect To MongoDB    ${DataBaseNameNEB_qa}
    #Prepare data in mongoDB
    InsertDataFromJson    ${DataBaseNameNEB_qa}    ${CollactionNameLocationMasterCell}    ${JsonInsert_TST_F3_0_1_000}
    InsertDataFromJson    ${DataBaseNameNEB_qa}    ${CollactionNameCellUserLocation}    ${JsonInsertUser_TST_F3_0_1_000}
    Sleep    5
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull_NEB    ${NameCommandFileLog}    ${PathLogNEB_Log}
    SetLogNull_NEB    ${NameCommandFileLogUser}    ${PathLogNEB_Log}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.228}
    ProduceKafka    ${CmdDeleteMassage_qa.controlUserPlaneNetworkEvent}    ${CmdProduce_qa.controlUserPlaneNetworkEvent}    ${DataProduce_TST_F3_0_1_000}
    Sleep    5
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.228}
    ProduceKafka    ${CmdDeleteMassage_qa.cellUserLocation}    ${CmdProduce_qa.cellUserLocation}    ${DataProduceUser_TST_F3_0_1_000}
    Sleep    5
    #Consume คำสั่ง ลง kafka
    Comment    ConnectSecureCRT    ${HostURL_10.138.38.228}
    Comment    ConsumeKafka    ${Consume_qa.currentCellAvailabilityChecked}    TST_F3_1_1_000
    Comment    log    ${ConsumeResult}
    Comment    # check ค่า
    Comment    #VerifyDataConsume    ${ConsumeResult}    {"key": "TST_F3_1_000_key","invokeId": "TST_F3_1_000_invokeId","command": "qa.currentCellAvailabilityChecked","value": {"invokeId":"TST_F3_1_000_invokeId","headerBody": {"msisdn": "66836077991","transactionId": "TST_F3_1_000_transactionId"},"dataBody": {"resultCode":"20000","description": "Success","cellId": "520031B714775","capacity": 0,"current5GModeEnabler": 2}}}
    Comment    # querydata and check result
    Comment    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    {"cellId": "${CellID}"}
    Comment    Comment    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    {"cellId": "${CellID}"}
    Comment    VerifyMongoDB    ${Jsondata}    ${Jsonupsert_TST_F3_1_1_000}
    Comment    Sleep    15
    Comment    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    FlushLogbyCommandName_NEB    ${NameCommandFileLog}    TST_F3_0_1_000    ${PathLogNEB_Log}
    FlushLogbyCommandName_NEB    ${NameCommandFileLogUser}    TST_F3_0_1_000    ${PathLogNEB_Log}

TST_F3_0_1_001
    #Insert_LocationMasterCell
    Connect To MongoDB    ${DataBaseNameNEB_qa}
    #Prepare data in mongoDB
    InsertDataFromJson    ${DataBaseNameNEB_qa}    ${CollactionNameLocationMasterCell}    ${JsonInsert_TST_F3_0_1_001}
    InsertDataFromJson    ${DataBaseNameNEB_qa}    ${CollactionNameCellUserLocation}    ${JsonInsertUser_TST_F3_0_1_001}
    Sleep    5
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull_NEB    ${NameCommandFileLog}    ${PathLogNEB_Log}
    SetLogNull_NEB    ${NameCommandFileLogUser}    ${PathLogNEB_Log}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.228}
    ProduceKafka    ${CmdDeleteMassage_qa.controlUserPlaneNetworkEvent}    ${CmdProduce_qa.controlUserPlaneNetworkEvent}    ${DataProduce_TST_F3_0_1_001}
    Sleep    5
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.228}
    ProduceKafka    ${CmdDeleteMassage_qa.cellUserLocation}    ${CmdProduce_qa.cellUserLocation}    ${DataProduceUser_TST_F3_0_1_001}
    Sleep    5
    #Consume คำสั่ง ลง kafka
    Comment    ConnectSecureCRT    ${HostURL_10.138.38.228}
    Comment    ConsumeKafka    ${Consume_qa.currentCellAvailabilityChecked}    TST_F3_1_1_000
    Comment    log    ${ConsumeResult}
    Comment    # check ค่า
    Comment    #VerifyDataConsume    ${ConsumeResult}    {"key": "TST_F3_1_000_key","invokeId": "TST_F3_1_000_invokeId","command": "qa.currentCellAvailabilityChecked","value": {"invokeId":"TST_F3_1_000_invokeId","headerBody": {"msisdn": "66836077991","transactionId": "TST_F3_1_000_transactionId"},"dataBody": {"resultCode":"20000","description": "Success","cellId": "520031B714775","capacity": 0,"current5GModeEnabler": 2}}}
    Comment    # querydata and check result
    Comment    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    {"cellId": "${CellID}"}
    Comment    Comment    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    {"cellId": "${CellID}"}
    Comment    VerifyMongoDB    ${Jsondata}    ${Jsonupsert_TST_F3_1_1_000}
    Comment    Sleep    15
    Comment    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    FlushLogbyCommandName_NEB    ${NameCommandFileLog}    TST_F3_0_1_001    ${PathLogNEB_Log}
    FlushLogbyCommandName_NEB    ${NameCommandFileLogUser}    TST_F3_0_1_001    ${PathLogNEB_Log}
TST_F3_0_1_002
    #Insert_LocationMasterCell
    Connect To MongoDB    ${DataBaseNameNEB_qa}
    #Prepare data in mongoDB
    InsertDataFromJson    ${DataBaseNameNEB_qa}    ${CollactionNameLocationMasterCell}    ${JsonInsert_TST_F3_0_1_002}
    InsertDataFromJson    ${DataBaseNameNEB_qa}    ${CollactionNameCellUserLocation}    ${JsonInsertUser_TST_F3_0_1_002}
    Sleep    5
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull_NEB    ${NameCommandFileLog}    ${PathLogNEB_Log}
    SetLogNull_NEB    ${NameCommandFileLogUser}    ${PathLogNEB_Log}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.228}
    ProduceKafka    ${CmdDeleteMassage_qa.controlUserPlaneNetworkEvent}    ${CmdProduce_qa.controlUserPlaneNetworkEvent}    ${DataProduce_TST_F3_0_1_002}
    Sleep    5
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.228}
    ProduceKafka    ${CmdDeleteMassage_qa.cellUserLocation}    ${CmdProduce_qa.cellUserLocation}    ${DataProduceUser_TST_F3_0_1_002}
    Sleep    5
    #Consume คำสั่ง ลง kafka
    Comment    ConnectSecureCRT    ${HostURL_10.138.38.228}
    Comment    ConsumeKafka    ${Consume_qa.currentCellAvailabilityChecked}    TST_F3_1_1_000
    Comment    log    ${ConsumeResult}
    Comment    # check ค่า
    Comment    #VerifyDataConsume    ${ConsumeResult}    {"key": "TST_F3_1_000_key","invokeId": "TST_F3_1_000_invokeId","command": "qa.currentCellAvailabilityChecked","value": {"invokeId":"TST_F3_1_000_invokeId","headerBody": {"msisdn": "66836077991","transactionId": "TST_F3_1_000_transactionId"},"dataBody": {"resultCode":"20000","description": "Success","cellId": "520031B714775","capacity": 0,"current5GModeEnabler": 2}}}
    Comment    # querydata and check result
    Comment    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    {"cellId": "${CellID}"}
    Comment    Comment    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    {"cellId": "${CellID}"}
    Comment    VerifyMongoDB    ${Jsondata}    ${Jsonupsert_TST_F3_1_1_000}
    Comment    Sleep    15
    Comment    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    FlushLogbyCommandName_NEB    ${NameCommandFileLog}    TST_F3_0_1_002    ${PathLogNEB_Log}
    FlushLogbyCommandName_NEB    ${NameCommandFileLogUser}    TST_F3_0_1_002    ${PathLogNEB_Log}
TST_F3_0_1_003
    #Insert_LocationMasterCell
    Connect To MongoDB    ${DataBaseNameNEB_qa}
    #Prepare data in mongoDB
    InsertDataFromJson    ${DataBaseNameNEB_qa}    ${CollactionNameLocationMasterCell}    ${JsonInsert_TST_F3_0_1_003}
    InsertDataFromJson    ${DataBaseNameNEB_qa}    ${CollactionNameCellUserLocation}    ${JsonInsertUser_TST_F3_0_1_003}
    Sleep    5
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull_NEB    ${NameCommandFileLog}    ${PathLogNEB_Log}
    SetLogNull_NEB    ${NameCommandFileLogUser}    ${PathLogNEB_Log}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.228}
    ProduceKafka    ${CmdDeleteMassage_qa.controlUserPlaneNetworkEvent}    ${CmdProduce_qa.controlUserPlaneNetworkEvent}    ${DataProduce_TST_F3_0_1_003}
    Sleep    5
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.228}
    ProduceKafka    ${CmdDeleteMassage_qa.cellUserLocation}    ${CmdProduce_qa.cellUserLocation}    ${DataProduceUser_TST_F3_0_1_003}
    Sleep    5
    #Consume คำสั่ง ลง kafka
    Comment    ConnectSecureCRT    ${HostURL_10.138.38.228}
    Comment    ConsumeKafka    ${Consume_qa.currentCellAvailabilityChecked}    TST_F3_1_1_000
    Comment    log    ${ConsumeResult}
    Comment    # check ค่า
    Comment    #VerifyDataConsume    ${ConsumeResult}    {"key": "TST_F3_1_000_key","invokeId": "TST_F3_1_000_invokeId","command": "qa.currentCellAvailabilityChecked","value": {"invokeId":"TST_F3_1_000_invokeId","headerBody": {"msisdn": "66836077991","transactionId": "TST_F3_1_000_transactionId"},"dataBody": {"resultCode":"20000","description": "Success","cellId": "520031B714775","capacity": 0,"current5GModeEnabler": 2}}}
    Comment    # querydata and check result
    Comment    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    {"cellId": "${CellID}"}
    Comment    Comment    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    {"cellId": "${CellID}"}
    Comment    VerifyMongoDB    ${Jsondata}    ${Jsonupsert_TST_F3_1_1_000}
    Comment    Sleep    15
    Comment    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    FlushLogbyCommandName_NEB    ${NameCommandFileLog}    TST_F3_0_1_003    ${PathLogNEB_Log}
    FlushLogbyCommandName_NEB    ${NameCommandFileLogUser}    TST_F3_0_1_003    ${PathLogNEB_Log}
TST_F3_0_1_004
    #Insert_LocationMasterCell
    Connect To MongoDB    ${DataBaseNameNEB_qa}
    #Prepare data in mongoDB
    InsertDataFromJson    ${DataBaseNameNEB_qa}    ${CollactionNameLocationMasterCell}    ${JsonInsert_TST_F3_0_1_004}
    InsertDataFromJson    ${DataBaseNameNEB_qa}    ${CollactionNameCellUserLocation}    ${JsonInsertUser_TST_F3_0_1_004}
    Sleep    5
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull_NEB    ${NameCommandFileLog}    ${PathLogNEB_Log}
    SetLogNull_NEB    ${NameCommandFileLogUser}    ${PathLogNEB_Log}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.228}
    ProduceKafka    ${CmdDeleteMassage_qa.controlUserPlaneNetworkEvent}    ${CmdProduce_qa.controlUserPlaneNetworkEvent}    ${DataProduce_TST_F3_0_1_004}
    Sleep    5
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.228}
    ProduceKafka    ${CmdDeleteMassage_qa.cellUserLocation}    ${CmdProduce_qa.cellUserLocation}    ${DataProduceUser_TST_F3_0_1_004}
    Sleep    5
    #Consume คำสั่ง ลง kafka
    Comment    ConnectSecureCRT    ${HostURL_10.138.38.228}
    Comment    ConsumeKafka    ${Consume_qa.currentCellAvailabilityChecked}    TST_F3_1_1_000
    Comment    log    ${ConsumeResult}
    Comment    # check ค่า
    Comment    #VerifyDataConsume    ${ConsumeResult}    {"key": "TST_F3_1_000_key","invokeId": "TST_F3_1_000_invokeId","command": "qa.currentCellAvailabilityChecked","value": {"invokeId":"TST_F3_1_000_invokeId","headerBody": {"msisdn": "66836077991","transactionId": "TST_F3_1_000_transactionId"},"dataBody": {"resultCode":"20000","description": "Success","cellId": "520031B714775","capacity": 0,"current5GModeEnabler": 2}}}
    Comment    # querydata and check result
    Comment    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    {"cellId": "${CellID}"}
    Comment    Comment    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    {"cellId": "${CellID}"}
    Comment    VerifyMongoDB    ${Jsondata}    ${Jsonupsert_TST_F3_1_1_000}
    Comment    Sleep    15
    Comment    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    FlushLogbyCommandName_NEB    ${NameCommandFileLog}    TST_F3_0_1_004    ${PathLogNEB_Log}
    FlushLogbyCommandName_NEB    ${NameCommandFileLogUser}    TST_F3_0_1_004    ${PathLogNEB_Log}
TST_F3_0_1_005
    #Insert_LocationMasterCell
    Connect To MongoDB    ${DataBaseNameNEB_qa}
    #Prepare data in mongoDB
    InsertDataFromJson    ${DataBaseNameNEB_qa}    ${CollactionNameLocationMasterCell}    ${JsonInsert_TST_F3_0_1_005}
    InsertDataFromJson    ${DataBaseNameNEB_qa}    ${CollactionNameCellUserLocation}    ${JsonInsertUser_TST_F3_0_1_005}
    Sleep    5
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull_NEB    ${NameCommandFileLog}    ${PathLogNEB_Log}
    SetLogNull_NEB    ${NameCommandFileLogUser}    ${PathLogNEB_Log}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.228}
    ProduceKafka    ${CmdDeleteMassage_qa.controlUserPlaneNetworkEvent}    ${CmdProduce_qa.controlUserPlaneNetworkEvent}    ${DataProduce_TST_F3_0_1_005}
    Sleep    5
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.228}
    ProduceKafka    ${CmdDeleteMassage_qa.cellUserLocation}    ${CmdProduce_qa.cellUserLocation}    ${DataProduceUser_TST_F3_0_1_005}
    Sleep    5
    #Consume คำสั่ง ลง kafka
    Comment    ConnectSecureCRT    ${HostURL_10.138.38.228}
    Comment    ConsumeKafka    ${Consume_qa.currentCellAvailabilityChecked}    TST_F3_1_1_000
    Comment    log    ${ConsumeResult}
    Comment    # check ค่า
    Comment    #VerifyDataConsume    ${ConsumeResult}    {"key": "TST_F3_1_000_key","invokeId": "TST_F3_1_000_invokeId","command": "qa.currentCellAvailabilityChecked","value": {"invokeId":"TST_F3_1_000_invokeId","headerBody": {"msisdn": "66836077991","transactionId": "TST_F3_1_000_transactionId"},"dataBody": {"resultCode":"20000","description": "Success","cellId": "520031B714775","capacity": 0,"current5GModeEnabler": 2}}}
    Comment    # querydata and check result
    Comment    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    {"cellId": "${CellID}"}
    Comment    Comment    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    {"cellId": "${CellID}"}
    Comment    VerifyMongoDB    ${Jsondata}    ${Jsonupsert_TST_F3_1_1_000}
    Comment    Sleep    15
    Comment    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    FlushLogbyCommandName_NEB    ${NameCommandFileLog}    TST_F3_0_1_000    ${PathLogNEB_Log}
    FlushLogbyCommandName_NEB    ${NameCommandFileLogUser}    TST_F3_0_1_000    ${PathLogNEB_Log}