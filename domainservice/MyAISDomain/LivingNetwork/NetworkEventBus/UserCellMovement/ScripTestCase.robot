*** Settings ***
Resource          Variable.robot
Resource          ../../Keyword/Common.robot
Resource          ../../Keyword/MongoDB.robot
Resource          ../../Keyword/SecureCRT.robot
Resource          ../../Valiables/CommonValiable/CommonValiable.robot
*** Test Cases ***
TST_F4_1_1_000
    Connect To MongoDB    ${DataBaseNameNEB_qa}
    #Prepare data in mongoDB
    ${ID}    QueryDataReturnID    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${cellId_TST_F4_1_1_000}
    IF    "${ID}" != ""
    DeleteDataFromID    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${ID}
    END
    ${ID1}    QueryDataReturnID    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${cellId_TST_F4_1_1_000_1}
    IF    "${ID1}" != ""
    DeleteDataFromID    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${ID1}
    END
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull_NEB    ${NameCommandFileLog}    ${PathLogNEB_Log}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.228}
    ProduceKafka    ${CmdDeleteMassage_qa.cellUserLocation}    ${CmdProduce_qa.cellUserLocation}    ${DataProduceUser_TST_F4_1_1_000}
    Sleep    5
    # querydata and check result
    Connect To MongoDB    ${DataBaseNameNEB_qa}
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${cellId_TST_F4_1_1_000}
    VerifyMongoDB    ${Jsondata}    ${Jsonupsert_TST_F4_1_1_000}
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${cellId_TST_F4_1_1_000_1}
    VerifyMongoDB    ${Jsondata}    ${Jsonupsert_TST_F4_1_1_000_1}
    Sleep    5
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    FlushLogbyCommandName_NEB    ${NameCommandFileLog}    TST_F4_1_1_000    ${PathLogNEB_Log}

TST_F4_1_1_001
    Connect To MongoDB    ${DataBaseNameNEB_qa}
    #Prepare data in mongoDB
    ${ID}    QueryDataReturnID    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${cellId_TST_F4_1_1_001}
    CheckResultAndInsertDelectData    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${JsonInsert_TST_F4_1_1_001}    ${ID}
    ${ID1}    QueryDataReturnID    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${cellId_TST_F4_1_1_001_1}
    IF    "${ID1}" != ""
    DeleteDataFromID    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${ID1}
    END
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull_NEB    ${NameCommandFileLog}    ${PathLogNEB_Log}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.228}
    ProduceKafka    ${CmdDeleteMassage_qa.cellUserLocation}    ${CmdProduce_qa.cellUserLocation}    ${DataProduceUser_TST_F4_1_1_001}
    Sleep    5
    # querydata and check result
    Connect To MongoDB    ${DataBaseNameNEB_qa}
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${cellId_TST_F4_1_1_001}
    VerifyMongoDB    ${Jsondata}    ${Jsonupsert_TST_F4_1_1_001}
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${cellId_TST_F4_1_1_001_1}
    VerifyMongoDB    ${Jsondata}    ${Jsonupsert_TST_F4_1_1_001_1}
    Sleep    5
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    FlushLogbyCommandName_NEB    ${NameCommandFileLog}    TST_F4_1_1_001    ${PathLogNEB_Log}

TST_F4_1_1_002
    Connect To MongoDB    ${DataBaseNameNEB_qa}
    #Prepare data in mongoDB
    ${ID}    QueryDataReturnID    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${cellId_TST_F4_1_1_002}
    CheckResultAndInsertDelectData    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${JsonInsert_TST_F4_1_1_002}    ${ID}
    ${ID1}    QueryDataReturnID    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${cellId_TST_F4_1_1_002_1}
    CheckResultAndInsertDelectData    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${JsonInsert_TST_F4_1_1_002_1}    ${ID1}
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull_NEB    ${NameCommandFileLog}    ${PathLogNEB_Log}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.228}
    ProduceKafka    ${CmdDeleteMassage_qa.cellUserLocation}    ${CmdProduce_qa.cellUserLocation}    ${DataProduceUser_TST_F4_1_1_002}
    Sleep    5
    # querydata and check result
    Connect To MongoDB    ${DataBaseNameNEB_qa}
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${cellId_TST_F4_1_1_002}
    VerifyMongoDB    ${Jsondata}    ${Jsonupsert_TST_F4_1_1_002}
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${cellId_TST_F4_1_1_002_1}
    VerifyMongoDB    ${Jsondata}    ${Jsonupsert_TST_F4_1_1_002_1}
    Sleep    5
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    FlushLogbyCommandName_NEB    ${NameCommandFileLog}    TST_F4_1_1_002    ${PathLogNEB_Log}

TST_F4_1_1_003
    Connect To MongoDB    ${DataBaseNameNEB_qa}
    #Prepare data in mongoDB
    ${ID}    QueryDataReturnID    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${cellId_TST_F4_1_1_003_1}
    CheckResultAndInsertDelectData    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${JsonInsert_TST_F4_1_1_003}    ${ID}
    ${ID1}    QueryDataReturnID    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${cellId_TST_F4_1_1_003}
    IF    "${ID1}" != ""
    DeleteDataFromID    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${ID1}
    END
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull_NEB    ${NameCommandFileLog}    ${PathLogNEB_Log}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.228}
    ProduceKafka    ${CmdDeleteMassage_qa.cellUserLocation}    ${CmdProduce_qa.cellUserLocation}    ${DataProduceUser_TST_F4_1_1_003}
    Sleep    5
    # querydata and check result
    Connect To MongoDB    ${DataBaseNameNEB_qa}
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${cellId_TST_F4_1_1_003}
    VerifyMongoDB    ${Jsondata}    ${Jsonupsert_TST_F4_1_1_003}
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${cellId_TST_F4_1_1_003_1}
    VerifyMongoDB    ${Jsondata}    ${Jsonupsert_TST_F4_1_1_003_1}
    Sleep    5
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    FlushLogbyCommandName_NEB    ${NameCommandFileLog}    TST_F4_1_1_003    ${PathLogNEB_Log}

TST_F4_1_1_004
    Connect To MongoDB    ${DataBaseNameNEB_qa}
    #Prepare data in mongoDB
    ${ID}    QueryDataReturnID    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${cellId_TST_F4_1_1_004}
    CheckResultAndInsertDelectData    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${JsonInsert_TST_F4_1_1_004}    ${ID}
    ${ID1}    QueryDataReturnID    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${cellId_TST_F4_1_1_004_1}
    CheckResultAndInsertDelectData    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${JsonInsert_TST_F4_1_1_004_1}    ${ID1}
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull_NEB    ${NameCommandFileLog}    ${PathLogNEB_Log}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.228}
    ProduceKafka    ${CmdDeleteMassage_qa.cellUserLocation}    ${CmdProduce_qa.cellUserLocation}    ${DataProduceUser_TST_F4_1_1_004}
    Sleep    5
    # querydata and check result
    Connect To MongoDB    ${DataBaseNameNEB_qa}
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${cellId_TST_F4_1_1_004}
    VerifyMongoDB    ${Jsondata}    ${Jsonupsert_TST_F4_1_1_004}
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${cellId_TST_F4_1_1_004_1}
    VerifyMongoDB    ${Jsondata}    ${Jsonupsert_TST_F4_1_1_004_1}
    Sleep    5
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    FlushLogbyCommandName_NEB    ${NameCommandFileLog}    TST_F4_1_1_004    ${PathLogNEB_Log}

TST_F4_1_1_005
    Connect To MongoDB    ${DataBaseNameNEB_qa}
    #Prepare data in mongoDB
    ${ID}    QueryDataReturnID    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${cellId_TST_F4_1_1_005}
    CheckResultAndInsertDelectData    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${JsonInsert_TST_F4_1_1_005}    ${ID}
    ${ID1}    QueryDataReturnID    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${cellId_TST_F4_1_1_005_1}
    CheckResultAndInsertDelectData    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${JsonInsert_TST_F4_1_1_005_1}    ${ID1}
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull_NEB    ${NameCommandFileLog}    ${PathLogNEB_Log}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.228}
    ProduceKafka    ${CmdDeleteMassage_qa.cellUserLocation}    ${CmdProduce_qa.cellUserLocation}    ${DataProduceUser_TST_F4_1_1_005}
    Sleep    5
    # querydata and check result
    Connect To MongoDB    ${DataBaseNameNEB_qa}
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${cellId_TST_F4_1_1_005}
    VerifyMongoDB    ${Jsondata}    ${Jsonupsert_TST_F4_1_1_005}
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${cellId_TST_F4_1_1_005_1}
    VerifyMongoDB    ${Jsondata}    ${Jsonupsert_TST_F4_1_1_005_1}
    Sleep    5
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    FlushLogbyCommandName_NEB    ${NameCommandFileLog}    TST_F4_1_1_005    ${PathLogNEB_Log}

TST_F4_1_1_006
    Connect To MongoDB    ${DataBaseNameNEB_qa}
    #Prepare data in mongoDB
    ${ID}    QueryDataReturnID    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${cellId_TST_F4_1_1_006}
    IF    "${ID}" != ""
    DeleteDataFromID    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${ID}
    END
    ${ID1}    QueryDataReturnID    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${cellId_TST_F4_1_1_006_1}
    IF    "${ID1}" != ""
    DeleteDataFromID    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${ID1}
    END
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull_NEB    ${NameCommandFileLog}    ${PathLogNEB_Log}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.228}
    ProduceKafka    ${CmdDeleteMassage_qa.cellUserLocation}    ${CmdProduce_qa.cellUserLocation}    ${DataProduceUser_TST_F4_1_1_006}
    Sleep    5
    # querydata and check result
    Connect To MongoDB    ${DataBaseNameNEB_qa}
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${cellId_TST_F4_1_1_006}
    VerifyMongoDB    ${Jsondata}    ${Jsonupsert_TST_F4_1_1_006}
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${cellId_TST_F4_1_1_006_1}
    VerifyMongoDB    ${Jsondata}    ${Jsonupsert_TST_F4_1_1_006_1}
    Sleep    5
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    FlushLogbyCommandName_NEB    ${NameCommandFileLog}    TST_F4_1_1_006    ${PathLogNEB_Log}

TST_F4_1_1_007
    Connect To MongoDB    ${DataBaseNameNEB_qa}
    #Prepare data in mongoDB
    ${ID}    QueryDataReturnID    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${cellId_TST_F4_1_1_007}
    IF    "${ID}" != ""
    DeleteDataFromID    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${ID}
    END
    ${ID1}    QueryDataReturnID    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${cellId_TST_F4_1_1_007_1}
    IF    "${ID1}" != ""
    DeleteDataFromID    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${ID1}
    END
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull_NEB    ${NameCommandFileLog}    ${PathLogNEB_Log}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.228}
    ProduceKafka    ${CmdDeleteMassage_qa.cellUserLocation}    ${CmdProduce_qa.cellUserLocation}    ${DataProduceUser_TST_F4_1_1_007}
    Sleep    5
    # querydata and check result
    Connect To MongoDB    ${DataBaseNameNEB_qa}
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${cellId_TST_F4_1_1_007}
    VerifyMongoDB    ${Jsondata}    ${Jsonupsert_TST_F4_1_1_007}
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${cellId_TST_F4_1_1_007_1}
    VerifyMongoDB    ${Jsondata}    ${Jsonupsert_TST_F4_1_1_007_1}
    Sleep    5
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    FlushLogbyCommandName_NEB    ${NameCommandFileLog}    TST_F4_1_1_007    ${PathLogNEB_Log}

TST_F4_1_1_008
    Connect To MongoDB    ${DataBaseNameNEB_qa}
    #Prepare data in mongoDB
    ${ID}    QueryDataReturnID    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${cellId_TST_F4_1_1_008}
    IF    "${ID}" != ""
    DeleteDataFromID    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${ID}
    END
    ${ID1}    QueryDataReturnID    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${cellId_TST_F4_1_1_008_1}
    IF    "${ID1}" != ""
    DeleteDataFromID    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${ID1}
    END
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull_NEB    ${NameCommandFileLog}    ${PathLogNEB_Log}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.228}
    ProduceKafka    ${CmdDeleteMassage_qa.cellUserLocation}    ${CmdProduce_qa.cellUserLocation}    ${DataProduceUser_TST_F4_1_1_008}
    Sleep    5
    # querydata and check result
    Connect To MongoDB    ${DataBaseNameNEB_qa}
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${cellId_TST_F4_1_1_008}
    VerifyMongoDB    ${Jsondata}    ${Jsonupsert_TST_F4_1_1_008}
    Sleep    5
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    FlushLogbyCommandName_NEB    ${NameCommandFileLog}    TST_F4_1_1_008    ${PathLogNEB_Log}

TST_F4_1_1_009
    Connect To MongoDB    ${DataBaseNameNEB_qa}
    #Prepare data in mongoDB
    ${ID}    QueryDataReturnID    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${cellId_TST_F4_1_1_009}
    IF    "${ID}" != ""
    DeleteDataFromID    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${ID}
    END
    ${ID1}    QueryDataReturnID    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${cellId_TST_F4_1_1_009_1}
    IF    "${ID1}" != ""
    DeleteDataFromID    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${ID1}
    END
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull_NEB    ${NameCommandFileLog}    ${PathLogNEB_Log}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.228}
    ProduceKafka    ${CmdDeleteMassage_qa.cellUserLocation}    ${CmdProduce_qa.cellUserLocation}    ${DataProduceUser_TST_F4_1_1_009}
    Sleep    5
    # querydata and check result
    Connect To MongoDB    ${DataBaseNameNEB_qa}
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${cellId_TST_F4_1_1_009}
    VerifyMongoDB    ${Jsondata}    ${Jsonupsert_TST_F4_1_1_009}
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${cellId_TST_F4_1_1_009_1}
    VerifyMongoDB    ${Jsondata}    ${Jsonupsert_TST_F4_1_1_009_1}
    Sleep    5
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    FlushLogbyCommandName_NEB    ${NameCommandFileLog}    TST_F4_1_1_009    ${PathLogNEB_Log}

TST_F4_1_1_010
    Connect To MongoDB    ${DataBaseNameNEB_qa}
    #Prepare data in mongoDB
    ${ID}    QueryDataReturnID    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${cellId_TST_F4_1_1_010}
    IF    "${ID}" != ""
    DeleteDataFromID    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${ID}
    END
    ${ID1}    QueryDataReturnID    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${cellId_TST_F4_1_1_010_1}
    IF    "${ID1}" != ""
    DeleteDataFromID    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${ID1}
    END
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull_NEB    ${NameCommandFileLog}    ${PathLogNEB_Log}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.228}
    ProduceKafka    ${CmdDeleteMassage_qa.cellUserLocation}    ${CmdProduce_qa.cellUserLocation}    ${DataProduceUser_TST_F4_1_1_010}
    Sleep    5
    # querydata and check result
    Connect To MongoDB    ${DataBaseNameNEB_qa}
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${cellId_TST_F4_1_1_010}
    VerifyMongoDB    ${Jsondata}    ${Jsonupsert_TST_F4_1_1_010}
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${cellId_TST_F4_1_1_010_1}
    VerifyMongoDB    ${Jsondata}    ${Jsonupsert_TST_F4_1_1_010_1}
    Sleep    5
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    FlushLogbyCommandName_NEB    ${NameCommandFileLog}    TST_F4_1_1_010    ${PathLogNEB_Log}

TST_F4_1_1_011
    Connect To MongoDB    ${DataBaseNameNEB_qa}
    #Prepare data in mongoDB
    ${ID}    QueryDataReturnID    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${cellId_TST_F4_1_1_011}
    IF    "${ID}" != ""
    DeleteDataFromID    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${ID}
    END
    ${ID1}    QueryDataReturnID    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${cellId_TST_F4_1_1_011_1}
    IF    "${ID1}" != ""
    DeleteDataFromID    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${ID1}
    END
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull_NEB    ${NameCommandFileLog}    ${PathLogNEB_Log}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.228}
    ProduceKafka    ${CmdDeleteMassage_qa.cellUserLocation}    ${CmdProduce_qa.cellUserLocation}    ${DataProduceUser_TST_F4_1_1_011}
    Sleep    5
    # querydata and check result
    Connect To MongoDB    ${DataBaseNameNEB_qa}
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${cellId_TST_F4_1_1_011}
    VerifyMongoDB    ${Jsondata}    ${Jsonupsert_TST_F4_1_1_011}
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${cellId_TST_F4_1_1_011_1}
    VerifyMongoDB    ${Jsondata}    ${Jsonupsert_TST_F4_1_1_011_1}
    Sleep    5
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    FlushLogbyCommandName_NEB    ${NameCommandFileLog}    TST_F4_1_1_011    ${PathLogNEB_Log}

TST_F4_1_1_012
    Connect To MongoDB    ${DataBaseNameNEB_qa}
    #Prepare data in mongoDB
    ${ID}    QueryDataReturnID    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${cellId_TST_F4_1_1_012}
    IF    "${ID}" != ""
    DeleteDataFromID    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${ID}
    END
    ${ID1}    QueryDataReturnID    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${cellId_TST_F4_1_1_012_1}
    IF    "${ID1}" != ""
    DeleteDataFromID    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${ID1}
    END
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull_NEB    ${NameCommandFileLog}    ${PathLogNEB_Log}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.228}
    ProduceKafka    ${CmdDeleteMassage_qa.cellUserLocation}    ${CmdProduce_qa.cellUserLocation}    ${DataProduceUser_TST_F4_1_1_012}
    Sleep    5
    # querydata and check result
    Connect To MongoDB    ${DataBaseNameNEB_qa}
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${cellId_TST_F4_1_1_012}
    VerifyMongoDB    ${Jsondata}    ${Jsonupsert_TST_F4_1_1_012}
    Sleep    5
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    FlushLogbyCommandName_NEB    ${NameCommandFileLog}    TST_F4_1_1_012    ${PathLogNEB_Log}

TST_F4_1_1_013
    Connect To MongoDB    ${DataBaseNameNEB_qa}
    #Prepare data in mongoDB
    ${ID}    QueryDataReturnID    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${cellId_TST_F4_1_1_013}
    IF    "${ID}" != ""
    DeleteDataFromID    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${ID}
    END
    ${ID1}    QueryDataReturnID    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${cellId_TST_F4_1_1_013_1}
    IF    "${ID1}" != ""
    DeleteDataFromID    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${ID1}
    END
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull_NEB    ${NameCommandFileLog}    ${PathLogNEB_Log}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.228}
    ProduceKafka    ${CmdDeleteMassage_qa.cellUserLocation}    ${CmdProduce_qa.cellUserLocation}    ${DataProduceUser_TST_F4_1_1_013-1}
    Sleep    5
    # querydata and check result
    Connect To MongoDB    ${DataBaseNameNEB_qa}
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${cellId_TST_F4_1_1_013_1}
    VerifyMongoDB    ${Jsondata}    ${Jsonupsert_TST_F4_1_1_013}
    ConnectSecureCRT    ${HostURL_10.138.38.228}
    ProduceKafka    ${CmdDeleteMassage_qa.cellUserLocation}    ${CmdProduce_qa.cellUserLocation}    ${DataProduceUser_TST_F4_1_1_013-2}
    Sleep    5
    Connect To MongoDB    ${DataBaseNameNEB_qa}
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${cellId_TST_F4_1_1_013}
    VerifyMongoDB    ${Jsondata}    ${Jsonupsert_TST_F4_1_1_013-1}
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${cellId_TST_F4_1_1_013_1}
    VerifyMongoDB    ${Jsondata}    ${Jsonupsert_TST_F4_1_1_013-1_1}
    Sleep    5
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    FlushLogbyCommandName_NEB    ${NameCommandFileLog}    TST_F4_1_1_013    ${PathLogNEB_Log}

TST_F4_1_1_014
    Connect To MongoDB    ${DataBaseNameNEB_qa}
    #Prepare data in mongoDB
    ${ID}    QueryDataReturnID    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${cellId_TST_F4_1_1_014}
    CheckResultAndInsertDelectData    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${JsonInsert_TST_F4_1_1_014}    ${ID}
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull_NEB    ${NameCommandFileLog}    ${PathLogNEB_Log}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.228}
    ProduceKafka    ${CmdDeleteMassage_qa.cellUserLocation}    ${CmdProduce_qa.cellUserLocation}    ${DataProduceUser_TST_F4_1_1_014}
    Sleep    5
    # querydata and check result
    Connect To MongoDB    ${DataBaseNameNEB_qa}
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${cellId_TST_F4_1_1_014}
    VerifyMongoDB    ${Jsondata}    ${Jsonupsert_TST_F4_1_1_014}
    Sleep    5
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    FlushLogbyCommandName_NEB    ${NameCommandFileLog}    TST_F4_1_1_014    ${PathLogNEB_Log}

TST_F4_1_1_015
    Connect To MongoDB    ${DataBaseNameNEB_qa}
    #Prepare data in mongoDB
    ${ID}    QueryDataReturnID    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${cellId_TST_F4_1_1_015}
    IF    "${ID}" != ""
    DeleteDataFromID    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${ID}
    END
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull_NEB    ${NameCommandFileLog}    ${PathLogNEB_Log}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.228}
    ProduceKafka    ${CmdDeleteMassage_qa.cellUserLocation}    ${CmdProduce_qa.cellUserLocation}    ${DataProduceUser_TST_F4_1_1_015}
    Sleep    5
    # querydata and check result
    Connect To MongoDB    ${DataBaseNameNEB_qa}
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${cellId_TST_F4_1_1_015}
    VerifyMongoDB    ${Jsondata}    ${Jsonupsert_TST_F4_1_1_015}
    Sleep    5
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    FlushLogbyCommandName_NEB    ${NameCommandFileLog}    TST_F4_1_1_015    ${PathLogNEB_Log}

TST_F4_1_1_016
    Connect To MongoDB    ${DataBaseNameNEB_qa}
    #Prepare data in mongoDB
    ${ID}    QueryDataReturnID    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${cellId_TST_F4_1_1_016}
    IF    "${ID}" != ""
    DeleteDataFromID    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${ID}
    END
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull_NEB    ${NameCommandFileLog}    ${PathLogNEB_Log}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.228}
    ProduceKafka    ${CmdDeleteMassage_qa.cellUserLocation}    ${CmdProduce_qa.cellUserLocation}    ${DataProduceUser_TST_F4_1_1_016}
    Sleep    5
    # querydata and check result
    Connect To MongoDB    ${DataBaseNameNEB_qa}
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${cellId_TST_F4_1_1_016}
    VerifyMongoDB    ${Jsondata}    ${Jsonupsert_TST_F4_1_1_016}
    Sleep    5
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    FlushLogbyCommandName_NEB    ${NameCommandFileLog}    TST_F4_1_1_016    ${PathLogNEB_Log}

TST_F4_1_1_017
    Connect To MongoDB    ${DataBaseNameNEB_qa}
    #Prepare data in mongoDB
    ${ID}    QueryDataReturnID    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${cellId_TST_F4_1_1_017}
    IF    "${ID}" != ""
    DeleteDataFromID    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${ID}
    END
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull_NEB    ${NameCommandFileLog}    ${PathLogNEB_Log}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.228}
    ProduceKafka    ${CmdDeleteMassage_qa.cellUserLocation}    ${CmdProduce_qa.cellUserLocation}    ${DataProduceUser_TST_F4_1_1_017}
    Sleep    5
    # querydata and check result
    Connect To MongoDB    ${DataBaseNameNEB_qa}
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${cellId_TST_F4_1_1_017}
    VerifyMongoDB    ${Jsondata}    ${Jsonupsert_TST_F4_1_1_017}
    Sleep    5
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    FlushLogbyCommandName_NEB    ${NameCommandFileLog}    TST_F4_1_1_017    ${PathLogNEB_Log}

TST_F4_1_1_018
    Connect To MongoDB    ${DataBaseNameNEB_qa}
    #Prepare data in mongoDB
    ${ID}    QueryDataReturnID    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${cellId_TST_F4_1_1_018}
    IF    "${ID}" != ""
    DeleteDataFromID    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${ID}
    END
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull_NEB    ${NameCommandFileLog}    ${PathLogNEB_Log}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.228}
    ProduceKafka    ${CmdDeleteMassage_qa.cellUserLocation}    ${CmdProduce_qa.cellUserLocation}    ${DataProduceUser_TST_F4_1_1_018}
    Sleep    5
    # querydata and check result
    Connect To MongoDB    ${DataBaseNameNEB_qa}
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNEB_qa}    ${CollactionNameCellResourceInventory}    ${cellId_TST_F4_1_1_018}
    VerifyMongoDB    ${Jsondata}    ${Jsonupsert_TST_F4_1_1_018}
    Sleep    5
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    FlushLogbyCommandName_NEB    ${NameCommandFileLog}    TST_F4_1_1_018    ${PathLogNEB_Log}

TST_F4_0_1_000
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull_NEB    ${NameCommandFileLog}    ${PathLogNEB_Log}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.228}
    ProduceKafka    ${CmdDeleteMassage_qa.cellUserLocation}    ${CmdProduce_qa.cellUserLocation}    ${DataProduceUser_TST_F4_0_1_000}
    Sleep    5
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    FlushLogbyCommandName_NEB    ${NameCommandFileLog}    TST_F4_0_1_000    ${PathLogNEB_Log}

TST_F4_0_1_001
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull_NEB    ${NameCommandFileLog}    ${PathLogNEB_Log}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.228}
    ProduceKafka    ${CmdDeleteMassage_qa.cellUserLocation}    ${CmdProduce_qa.cellUserLocation}    ${DataProduceUser_TST_F4_0_1_001}
    Sleep    5
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    FlushLogbyCommandName_NEB    ${NameCommandFileLog}    TST_F4_0_1_001    ${PathLogNEB_Log}

TST_F4_0_1_002
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull_NEB    ${NameCommandFileLog}    ${PathLogNEB_Log}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.228}
    ProduceKafka    ${CmdDeleteMassage_qa.cellUserLocation}    ${CmdProduce_qa.cellUserLocation}    ${DataProduceUser_TST_F4_0_1_002}
    Sleep    5
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    FlushLogbyCommandName_NEB    ${NameCommandFileLog}    TST_F4_0_1_002    ${PathLogNEB_Log}

TST_F4_0_1_003
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull_NEB    ${NameCommandFileLog}    ${PathLogNEB_Log}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.228}
    ProduceKafka    ${CmdDeleteMassage_qa.cellUserLocation}    ${CmdProduce_qa.cellUserLocation}    ${DataProduceUser_TST_F4_0_1_003}
    Sleep    5
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    FlushLogbyCommandName_NEB    ${NameCommandFileLog}    TST_F4_0_1_003    ${PathLogNEB_Log}

TST_F4_0_1_004
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull_NEB    ${NameCommandFileLog}    ${PathLogNEB_Log}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.228}
    ProduceKafka    ${CmdDeleteMassage_qa.cellUserLocation}    ${CmdProduce_qa.cellUserLocation}    ${DataProduceUser_TST_F4_0_1_004}
    Sleep    5
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    FlushLogbyCommandName_NEB    ${NameCommandFileLog}    TST_F4_0_1_004    ${PathLogNEB_Log}

TST_F4_0_1_005
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull_NEB    ${NameCommandFileLog}    ${PathLogNEB_Log}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.228}
    ProduceKafka    ${CmdDeleteMassage_qa.cellUserLocation}    ${CmdProduce_qa.cellUserLocation}    ${DataProduceUser_TST_F4_0_1_005}
    Sleep    5
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    FlushLogbyCommandName_NEB    ${NameCommandFileLog}    TST_F4_0_1_005    ${PathLogNEB_Log}

TST_F4_0_1_006
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull_NEB    ${NameCommandFileLog}    ${PathLogNEB_Log}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.228}
    ProduceKafka    ${CmdDeleteMassage_qa.cellUserLocation}    ${CmdProduce_qa.cellUserLocation}    ${DataProduceUser_TST_F4_0_1_006}
    Sleep    5
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    FlushLogbyCommandName_NEB    ${NameCommandFileLog}    TST_F4_0_1_006    ${PathLogNEB_Log}

TST_F4_0_1_007
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull_NEB    ${NameCommandFileLog}    ${PathLogNEB_Log}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.228}
    ProduceKafka    ${CmdDeleteMassage_qa.cellUserLocation}    ${CmdProduce_qa.cellUserLocation}    ${DataProduceUser_TST_F4_0_1_007}
    Sleep    5
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    FlushLogbyCommandName_NEB    ${NameCommandFileLog}    TST_F4_0_1_007    ${PathLogNEB_Log}

TST_F4_0_1_008
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull_NEB    ${NameCommandFileLog}    ${PathLogNEB_Log}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.228}
    ProduceKafka    ${CmdDeleteMassage_qa.cellUserLocation}    ${CmdProduce_qa.cellUserLocation}    ${DataProduceUser_TST_F4_0_1_008}
    Sleep    5
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    FlushLogbyCommandName_NEB    ${NameCommandFileLog}    TST_F4_0_1_008    ${PathLogNEB_Log}

TST_F4_0_1_009
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull_NEB    ${NameCommandFileLog}    ${PathLogNEB_Log}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.228}
    ProduceKafka    ${CmdDeleteMassage_qa.cellUserLocation}    ${CmdProduce_qa.cellUserLocation}    ${DataProduceUser_TST_F4_0_1_009}
    Sleep    5
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    FlushLogbyCommandName_NEB    ${NameCommandFileLog}    TST_F4_0_1_009    ${PathLogNEB_Log}

TST_F4_0_1_010
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull_NEB    ${NameCommandFileLog}    ${PathLogNEB_Log}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.228}
    ProduceKafka    ${CmdDeleteMassage_qa.cellUserLocation}    ${CmdProduce_qa.cellUserLocation}    ${DataProduceUser_TST_F4_0_1_010}
    Sleep    5
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    FlushLogbyCommandName_NEB    ${NameCommandFileLog}    TST_F4_0_1_010    ${PathLogNEB_Log}

TST_F4_0_1_011
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull_NEB    ${NameCommandFileLog}    ${PathLogNEB_Log}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.228}
    ProduceKafka    ${CmdDeleteMassage_qa.cellUserLocation}    ${CmdProduce_qa.cellUserLocation}    ${DataProduceUser_TST_F4_0_1_011}
    Sleep    5
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    FlushLogbyCommandName_NEB    ${NameCommandFileLog}    TST_F4_0_1_011    ${PathLogNEB_Log}

TST_F4_0_1_012
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull_NEB    ${NameCommandFileLog}    ${PathLogNEB_Log}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.228}
    ProduceKafka    ${CmdDeleteMassage_qa.cellUserLocation}    ${CmdProduce_qa.cellUserLocation}    ${DataProduceUser_TST_F4_0_1_012}
    Sleep    5
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    FlushLogbyCommandName_NEB    ${NameCommandFileLog}    TST_F4_0_1_012    ${PathLogNEB_Log}

TST_F4_0_1_013
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull_NEB    ${NameCommandFileLog}    ${PathLogNEB_Log}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.228}
    ProduceKafka    ${CmdDeleteMassage_qa.cellUserLocation}    ${CmdProduce_qa.cellUserLocation}    ${DataProduceUser_TST_F4_0_1_013}
    Sleep    5
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    FlushLogbyCommandName_NEB    ${NameCommandFileLog}    TST_F4_0_1_013    ${PathLogNEB_Log}

TST_F4_0_1_014
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull_NEB    ${NameCommandFileLog}    ${PathLogNEB_Log}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.228}
    ProduceKafka    ${CmdDeleteMassage_qa.cellUserLocation}    ${CmdProduce_qa.cellUserLocation}    ${DataProduceUser_TST_F4_0_1_014}
    Sleep    5
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    FlushLogbyCommandName_NEB    ${NameCommandFileLog}    TST_F4_0_1_014    ${PathLogNEB_Log}
