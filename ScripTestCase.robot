*** Settings ***
Resource          Valiable.robot
Resource          Keyword_5GMode.robot
Resource          ../../Keyword/Common.robot
Resource          ../../Keyword/MongoDB.robot
Resource          ../../Keyword/SecureCRT.robot
Resource          ../../Valiables/CommonValiable/CommonValiable.robot
Resource          ../../Valiables/CommonValiable/CommonValiable.robot
*** Test Cases ***
Delete
    ${cellId}    QueryDataReturnbyCellId    ${DataBaseNameNEB_QA}    ${CollactionNameCellResourceInventory}    @{test}
    DeleteDataFromCellId    ${DataBaseNameNEB_QA}    ${CollactionNameCellResourceInventory}    ${cellId}

Insert
    ${cellId}    QueryDataReturnbyCellId    ${DataBaseNameNEB_QA}    ${CollactionNameCellResourceInventory}    @{test}
    CheckResultAndInsertDataByMsisdn    ${DataBaseNameNEB_QA}    ${CollactionNameCellResourceInventory}    ${JsonInsertCellResourceInventory_TST_F10_1_1_001}    ${cellId}

Query
    ${CGI_HEX}    QueryDataReturnCellId    ${DataBaseNameNEB_QA}    ${CollactionNameCellUserLocation}    @{msisdn_TST_F10_1_1_001}
    ${CGI_HEX}    Set Variable    {"cellId" : "${CGI_HEX}"}
    ${cellId}    QueryDataReturnbyCellId    ${DataBaseNameNEB_QA}    ${CollactionNameCellResourceInventory}    ${CGI_HEX}
    CheckResultAndInsertDataByCellId    ${DataBaseNameNEB_QA}    ${CollactionNameCellResourceInventory}    ${JsonInsertCellResourceInventory_TST_F10_1_1_001}    ${cellId}

TST_F10_1_1_000
    ${msisdn}    QueryDataReturnMsisdn    ${DataBaseNameNEB_QA}    ${CollactionNameCellUserLocation}    @{msisdn_TST_F10_1_1_000}
    #prepare mongo.cellUserLocation
    CheckResultAndInsertDataByMsisdn    ${DataBaseNameNEB_QA}    ${CollactionNameCellUserLocation}    ${JsonInsert_TST_F10_1_1_000}    ${msisdn}
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull_NEB    ${NameCmdFileLog_5GModeResourceActivation}    ${PathLogNEB}
    #produce kafka : requestAccessToken
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    Produce Kafka    ${CmdDeleteMassage_qa.5GModeActivated}    ${CmdProduce_qa.5GModeActivated}    ${DataProduce_TST_F10_1_1_000}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    FlushLogbyCommandName_NEB    ${NameCmdFileLog_5GModeResourceActivation}    TST_F10_1_1_000    ${PathLogNEB}
    [Teardown]    Close All Connections

TST_F10_1_1_001
    #prepare mongo.cellUserLocation
    ${msisdn}    QueryDataReturnMsisdn    ${DataBaseNameNEB_QA}    ${CollactionNameCellUserLocation}    @{msisdn_TST_F10_1_1_001}
    CheckResultAndInsertDataByMsisdn    ${DataBaseNameNEB_QA}    ${CollactionNameCellUserLocation}    ${JsonInsertCellUserLocation_TST_F10_1_1_001}    ${msisdn}
    #prepare mongo.cellResourceInventory
    ${CGI_HEX}    QueryDataReturnCellId    ${DataBaseNameNEB_QA}    ${CollactionNameCellUserLocation}    @{msisdn_TST_F10_1_1_001}
    ${CGI_HEX}    Set Variable    {"cellId" : "${CGI_HEX}"}
    ${cellId}    QueryDataReturnbyCellId    ${DataBaseNameNEB_QA}    ${CollactionNameCellResourceInventory}    ${CGI_HEX}
    CheckResultAndInsertDataByCellId    ${DataBaseNameNEB_QA}    ${CollactionNameCellResourceInventory}    {"cellId" : "52003092BA91R01","capacity" : 5,"current5GModeEnabler" : 1}    ${cellId}
    ${cellId}    Set Variable    {"cellId" : "${cellId}"}    #กรณี Insert ค่าไปใหม่จะเจอเป็นค่าว่างให้เช็คใน mongoDBแทน
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull_NEB    ${NameCmdFileLog_5GModeResourceActivation}    ${PathLogNEB}
    #produce kafka : requestAccessToken
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    Produce Kafka    ${CmdDeleteMassage_qa.5GModeActivated}    ${CmdProduce_qa.5GModeActivated}    ${DataProduce_TST_F10_1_1_001}
    sleep    5s
    #MongoDB.cellUserLocation after update
    ${5GMode}    QueryDataReturn5GMode    ${DataBaseNameNEB_QA}    ${CollactionNameCellUserLocation}    @{msisdn_TST_F10_1_1_001}
    BuiltIn.Log Many    "5GMode" :"${5GMode}"
    #MongoDB.cellResourceInventory after update
    ${Current5GModeEnabler}    QueryDataReturnCurrent5GModeEnabler    ${DataBaseNameNEB_QA}    ${CollactionNameCellResourceInventory}    ${cellId}
    BuiltIn.Log Many    "Current5GModeEnabler" :"${Current5GModeEnabler}"
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    FlushLogbyCommandName_NEB    ${NameCmdFileLog_5GModeResourceActivation}    TST_F10_1_1_001    ${PathLogNEB}
    [Teardown]    Close All Connections

TST_F10_1_1_002
    #prepare mongo.cellUserLocation
    ${msisdn}    QueryDataReturnMsisdn    ${DataBaseNameNEB_QA}    ${CollactionNameCellUserLocation}    @{msisdn_TST_F10_1_1_002}
    CheckResultAndInsertDataByMsisdn    ${DataBaseNameNEB_QA}    ${CollactionNameCellUserLocation}    ${JsonInsertCellUserLocation_TST_F10_1_1_002}    ${msisdn}
    #prepare mongo.cellResourceInventory
    ${CGI_HEX}    QueryDataReturnCellId    ${DataBaseNameNEB_QA}    ${CollactionNameCellUserLocation}    @{msisdn_TST_F10_1_1_002}
    ${CGI_HEX}    Set Variable    {"cellId" : "${CGI_HEX}"}
    ${cellId}    QueryDataReturnbyCellId    ${DataBaseNameNEB_QA}    ${CollactionNameCellResourceInventory}    ${CGI_HEX}
    CheckResultAndInsertDataByCellId    ${DataBaseNameNEB_QA}    ${CollactionNameCellResourceInventory}    ${JsonInsertCellResourceInventory_TST_F10_1_1_002}    ${cellId}
    ${cellId}    Set Variable    {"cellId" : "${cellId}"}    #กรณี Insert ค่าไปใหม่จะเจอเป็นค่าว่างให้เช็คใน mongoDBแทน
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull_NEB    ${NameCmdFileLog_5GModeResourceActivation}    ${PathLogNEB}
    #produce kafka : requestAccessToken
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    Produce Kafka    ${CmdDeleteMassage_qa.5GModeActivated}    ${CmdProduce_qa.5GModeActivated}    ${DataProduce_TST_F10_1_1_002}
    sleep    5s
    #MongoDB.cellUserLocation after update
    ${5GMode}    QueryDataReturn5GMode    ${DataBaseNameNEB_QA}    ${CollactionNameCellUserLocation}    @{msisdn_TST_F10_1_1_002}
    BuiltIn.Log Many    "5GMode" :"${5GMode}"
    #MongoDB.cellResourceInventory after update
    ${Current5GModeEnabler}    QueryDataReturnCurrent5GModeEnabler    ${DataBaseNameNEB_QA}    ${CollactionNameCellResourceInventory}    ${cellId}
    BuiltIn.Log Many    "Current5GModeEnabler" :"${Current5GModeEnabler}"
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    FlushLogbyCommandName_NEB    ${NameCmdFileLog_5GModeResourceActivation}    TST_F10_1_1_002    ${PathLogNEB}
    [Teardown]    Close All Connections

TST_F10_1_1_003
    #prepare mongo.cellUserLocation
    ${msisdn}    QueryDataReturnMsisdn    ${DataBaseNameNEB_QA}    ${CollactionNameCellUserLocation}    @{msisdn_TST_F10_1_1_003}
    CheckResultAndInsertDataByMsisdn    ${DataBaseNameNEB_QA}    ${CollactionNameCellUserLocation}    ${JsonInsertCellUserLocation_TST_F10_1_1_003}    ${msisdn}
    #prepare mongo.cellResourceInventory
    ${CGI_HEX}    QueryDataReturnCellId    ${DataBaseNameNEB_QA}    ${CollactionNameCellUserLocation}    @{msisdn_TST_F10_1_1_003}
    ${CGI_HEX}    Set Variable    {"cellId" : "${CGI_HEX}"}
    ${cellId}    QueryDataReturnbyCellId    ${DataBaseNameNEB_QA}    ${CollactionNameCellResourceInventory}    ${CGI_HEX}
    CheckResultAndInsertDataByCellId    ${DataBaseNameNEB_QA}    ${CollactionNameCellResourceInventory}    ${JsonInsertCellResourceInventory_TST_F10_1_1_003}    ${cellId}
    ${cellId}    Set Variable    {"cellId" : "${cellId}"}    #กรณี Insert ค่าไปใหม่จะเจอเป็นค่าว่างให้เช็คใน mongoDBแทน
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull_NEB    ${NameCmdFileLog_5GModeResourceActivation}    ${PathLogNEB}
    #produce kafka : requestAccessToken
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    Produce Kafka    ${CmdDeleteMassage_qa.5GModeActivated}    ${CmdProduce_qa.5GModeActivated}    ${DataProduce_TST_F10_1_1_003}
    sleep    5s
    #MongoDB.cellUserLocation after update
    ${5GMode}    QueryDataReturn5GMode    ${DataBaseNameNEB_QA}    ${CollactionNameCellUserLocation}    @{msisdn_TST_F10_1_1_003}
    BuiltIn.Log Many    "5GMode" :"${5GMode}"
    #MongoDB.cellResourceInventory after update
    ${Current5GModeEnabler}    QueryDataReturnCurrent5GModeEnabler    ${DataBaseNameNEB_QA}    ${CollactionNameCellResourceInventory}    ${cellId}
    BuiltIn.Log Many    "Current5GModeEnabler" :"${Current5GModeEnabler}"
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    FlushLogbyCommandName_NEB    ${NameCmdFileLog_5GModeResourceActivation}    TST_F10_1_1_003    ${PathLogNEB}
    [Teardown]    Close All Connections

TST_F10_1_1_004
    #prepare mongo.cellUserLocation
    ${msisdn}    QueryDataReturnMsisdn    ${DataBaseNameNEB_QA}    ${CollactionNameCellUserLocation}    @{msisdn_TST_F10_1_1_004}
    CheckResultAndInsertDataByMsisdn    ${DataBaseNameNEB_QA}    ${CollactionNameCellUserLocation}    ${JsonInsertCellUserLocation_TST_F10_1_1_004}    ${msisdn}
    #prepare mongo.cellResourceInventory
    ${CGI_HEX}    QueryDataReturnCellId    ${DataBaseNameNEB_QA}    ${CollactionNameCellUserLocation}    @{msisdn_TST_F10_1_1_004}
    ${CGI_HEX}    Set Variable    {"cellId" : "${CGI_HEX}"}
    ${cellId}    QueryDataReturnbyCellId    ${DataBaseNameNEB_QA}    ${CollactionNameCellResourceInventory}    ${CGI_HEX}
    CheckResultAndInsertDataByCellId    ${DataBaseNameNEB_QA}    ${CollactionNameCellResourceInventory}    ${JsonInsertCellResourceInventory_TST_F10_1_1_004}    ${cellId}
    ${cellId}    Set Variable    {"cellId" : "${cellId}"}    #กรณี Insert ค่าไปใหม่จะเจอเป็นค่าว่างให้เช็คใน mongoDBแทน
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull_NEB    ${NameCmdFileLog_5GModeResourceActivation}    ${PathLogNEB}
    #produce kafka : requestAccessToken
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    Produce Kafka    ${CmdDeleteMassage_qa.5GModeActivated}    ${CmdProduce_qa.5GModeActivated}    ${DataProduce_TST_F10_1_1_004}
    sleep    5s
    #MongoDB.cellUserLocation after update
    ${5GMode}    QueryDataReturn5GMode    ${DataBaseNameNEB_QA}    ${CollactionNameCellUserLocation}    @{msisdn_TST_F10_1_1_004}
    BuiltIn.Log Many    "5GMode" :"${5GMode}"
    #MongoDB.cellResourceInventory after update
    ${Current5GModeEnabler}    QueryDataReturnCurrent5GModeEnabler    ${DataBaseNameNEB_QA}    ${CollactionNameCellResourceInventory}    ${cellId}
    BuiltIn.Log Many    "Current5GModeEnabler" :"${Current5GModeEnabler}"
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    FlushLogbyCommandName_NEB    ${NameCmdFileLog_5GModeResourceActivation}    TST_F10_1_1_004    ${PathLogNEB}
    [Teardown]    Close All Connections

TST_F10_1_1_005
    #prepare mongo.cellUserLocation
    ${msisdn}    QueryDataReturnMsisdn    ${DataBaseNameNEB_QA}    ${CollactionNameCellUserLocation}    @{msisdn_TST_F10_1_1_005}
    CheckResultAndInsertDataByMsisdn    ${DataBaseNameNEB_QA}    ${CollactionNameCellUserLocation}    ${JsonInsertCellUserLocation_TST_F10_1_1_005}    ${msisdn}
    #prepare mongo.cellResourceInventory
    ${CGI_HEX}    QueryDataReturnCellId    ${DataBaseNameNEB_QA}    ${CollactionNameCellUserLocation}    @{msisdn_TST_F10_1_1_005}
    ${CGI_HEX}    Set Variable    {"cellId" : "${CGI_HEX}"}
    ${cellId}    QueryDataReturnbyCellId    ${DataBaseNameNEB_QA}    ${CollactionNameCellResourceInventory}    ${CGI_HEX}
    CheckResultAndInsertDataByCellId    ${DataBaseNameNEB_QA}    ${CollactionNameCellResourceInventory}    ${JsonInsertCellResourceInventory_TST_F10_1_1_005}    ${cellId}
    ${cellId}    Set Variable    {"cellId" : "${cellId}"}    #กรณี Insert ค่าไปใหม่จะเจอเป็นค่าว่างให้เช็คใน mongoDBแทน
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull_NEB    ${NameCmdFileLog_5GModeResourceActivation}    ${PathLogNEB}
    #produce kafka : requestAccessToken
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    Produce Kafka    ${CmdDeleteMassage_qa.5GModeActivated}    ${CmdProduce_qa.5GModeActivated}    ${DataProduce_TST_F10_1_1_005}
    sleep    5s
    #MongoDB.cellUserLocation after update
    ${5GMode}    QueryDataReturn5GMode    ${DataBaseNameNEB_QA}    ${CollactionNameCellUserLocation}    @{msisdn_TST_F10_1_1_005}
    BuiltIn.Log Many    "5GMode" :"${5GMode}"
    #MongoDB.cellResourceInventory after update
    ${Current5GModeEnabler}    QueryDataReturnCurrent5GModeEnabler    ${DataBaseNameNEB_QA}    ${CollactionNameCellResourceInventory}    ${cellId}
    BuiltIn.Log Many    "Current5GModeEnabler" :"${Current5GModeEnabler}"
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    FlushLogbyCommandName_NEB    ${NameCmdFileLog_5GModeResourceActivation}    TST_F10_1_1_005    ${PathLogNEB}
    [Teardown]    Close All Connections

TST_F10_1_1_006
    #prepare mongo.cellUserLocation
    ${msisdn}    QueryDataReturnMsisdn    ${DataBaseNameNEB_QA}    ${CollactionNameCellUserLocation}    @{msisdn_TST_F10_1_1_006}
    CheckResultAndInsertDataByMsisdn    ${DataBaseNameNEB_QA}    ${CollactionNameCellUserLocation}    ${JsonInsertCellUserLocation_TST_F10_1_1_006}    ${msisdn}
    #prepare mongo.cellResourceInventory
    ${CGI_HEX}    QueryDataReturnCellId    ${DataBaseNameNEB_QA}    ${CollactionNameCellUserLocation}    @{msisdn_TST_F10_1_1_006}
    ${CGI_HEX}    Set Variable    {"cellId" : "${CGI_HEX}"}
    ${cellId}    QueryDataReturnbyCellId    ${DataBaseNameNEB_QA}    ${CollactionNameCellResourceInventory}    ${CGI_HEX}
    CheckResultAndInsertDataByCellId    ${DataBaseNameNEB_QA}    ${CollactionNameCellResourceInventory}    ${JsonInsertCellResourceInventory_TST_F10_1_1_006}    ${cellId}
    ${cellId}    Set Variable    {"cellId" : "${cellId}"}    #กรณี Insert ค่าไปใหม่จะเจอเป็นค่าว่างให้เช็คใน mongoDBแทน
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull_NEB    ${NameCmdFileLog_5GModeResourceActivation}    ${PathLogNEB}
    #produce kafka : requestAccessToken
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    Produce Kafka    ${CmdDeleteMassage_qa.5GModeActivated}    ${CmdProduce_qa.5GModeActivated}    ${DataProduce_TST_F10_1_1_006}
    sleep    5s
    #MongoDB.cellUserLocation after update
    ${5GMode}    QueryDataReturn5GMode    ${DataBaseNameNEB_QA}    ${CollactionNameCellUserLocation}    @{msisdn_TST_F10_1_1_006}
    BuiltIn.Log Many    "5GMode" :"${5GMode}"
    #MongoDB.cellResourceInventory after update
    ${Current5GModeEnabler}    QueryDataReturnCurrent5GModeEnabler    ${DataBaseNameNEB_QA}    ${CollactionNameCellResourceInventory}    ${cellId}
    BuiltIn.Log Many    "Current5GModeEnabler" :"${Current5GModeEnabler}"
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    FlushLogbyCommandName_NEB    ${NameCmdFileLog_5GModeResourceActivation}    TST_F10_1_1_006    ${PathLogNEB}
    [Teardown]    Close All Connections

TST_F10_1_1_007
    #prepare mongo.cellUserLocation
    ${msisdn}    QueryDataReturnMsisdn    ${DataBaseNameNEB_QA}    ${CollactionNameCellUserLocation}    @{msisdn_TST_F10_1_1_007}
    CheckResultAndInsertDataByMsisdn    ${DataBaseNameNEB_QA}    ${CollactionNameCellUserLocation}    ${JsonInsertCellUserLocation_TST_F10_1_1_007}    ${msisdn}
    #prepare mongo.cellResourceInventory
    ${CGI_HEX}    QueryDataReturnCellId    ${DataBaseNameNEB_QA}    ${CollactionNameCellUserLocation}    @{msisdn_TST_F10_1_1_007}
    ${CGI_HEX}    Set Variable    {"cellId" : "${CGI_HEX}"}
    ${cellId}    QueryDataReturnbyCellId    ${DataBaseNameNEB_QA}    ${CollactionNameCellResourceInventory}    ${CGI_HEX}
    CheckResultAndInsertDataByCellId    ${DataBaseNameNEB_QA}    ${CollactionNameCellResourceInventory}    ${JsonInsertCellResourceInventory_TST_F10_1_1_007}    ${cellId}
    ${cellId}    Set Variable    {"cellId" : "${cellId}"}    #กรณี Insert ค่าไปใหม่จะเจอเป็นค่าว่างให้เช็คใน mongoDBแทน
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull_NEB    ${NameCmdFileLog_5GModeResourceActivation}    ${PathLogNEB}
    #produce kafka : requestAccessToken
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    Produce Kafka    ${CmdDeleteMassage_qa.5GModeActivated}    ${CmdProduce_qa.5GModeActivated}    ${DataProduce_TST_F10_1_1_007}
    sleep    5s
    #MongoDB.cellUserLocation after update
    ${5GMode}    QueryDataReturn5GMode    ${DataBaseNameNEB_QA}    ${CollactionNameCellUserLocation}    @{msisdn_TST_F10_1_1_007}
    BuiltIn.Log Many    "5GMode" :"${5GMode}"
    #MongoDB.cellResourceInventory after update
    ${Current5GModeEnabler}    QueryDataReturnCurrent5GModeEnabler    ${DataBaseNameNEB_QA}    ${CollactionNameCellResourceInventory}    ${cellId}
    BuiltIn.Log Many    "Current5GModeEnabler" :"${Current5GModeEnabler}"
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    FlushLogbyCommandName_NEB    ${NameCmdFileLog_5GModeResourceActivation}    TST_F10_1_1_007    ${PathLogNEB}
    [Teardown]    Close All Connections

TST_F10_1_1_008
    #prepare mongo.cellUserLocation
    ${msisdn}    QueryDataReturnMsisdn    ${DataBaseNameNEB_QA}    ${CollactionNameCellUserLocation}    @{msisdn_TST_F10_1_1_008}
    CheckResultAndInsertDataByMsisdn    ${DataBaseNameNEB_QA}    ${CollactionNameCellUserLocation}    ${JsonInsertCellUserLocation_TST_F10_1_1_008}    ${msisdn}
    #prepare mongo.cellResourceInventory
    ${CGI_HEX}    QueryDataReturnCellId    ${DataBaseNameNEB_QA}    ${CollactionNameCellUserLocation}    @{msisdn_TST_F10_1_1_008}
    ${CGI_HEX}    Set Variable    {"cellId" : "${CGI_HEX}"}
    ${cellId}    QueryDataReturnbyCellId    ${DataBaseNameNEB_QA}    ${CollactionNameCellResourceInventory}    ${CGI_HEX}
    CheckResultAndInsertDataByCellId    ${DataBaseNameNEB_QA}    ${CollactionNameCellResourceInventory}    ${JsonInsertCellResourceInventory_TST_F10_1_1_008}    ${cellId}
    ${cellId}    Set Variable    {"cellId" : "${cellId}"}    #กรณี Insert ค่าไปใหม่จะเจอเป็นค่าว่างให้เช็คใน mongoDBแทน
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull_NEB    ${NameCmdFileLog_5GModeResourceActivation}    ${PathLogNEB}
    #produce kafka : requestAccessToken
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    Produce Kafka    ${CmdDeleteMassage_qa.5GModeActivated}    ${CmdProduce_qa.5GModeActivated}    ${DataProduce_TST_F10_1_1_008}
    sleep    5s
    #MongoDB.cellUserLocation after update
    ${5GMode}    QueryDataReturn5GMode    ${DataBaseNameNEB_QA}    ${CollactionNameCellUserLocation}    @{msisdn_TST_F10_1_1_008}
    BuiltIn.Log Many    "5GMode" :"${5GMode}"
    #MongoDB.cellResourceInventory after update
    ${Current5GModeEnabler}    QueryDataReturnCurrent5GModeEnabler    ${DataBaseNameNEB_QA}    ${CollactionNameCellResourceInventory}    ${cellId}
    BuiltIn.Log Many    "Current5GModeEnabler" :"${Current5GModeEnabler}"
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    FlushLogbyCommandName_NEB    ${NameCmdFileLog_5GModeResourceActivation}    TST_F10_1_1_008    ${PathLogNEB}
    [Teardown]    Close All Connections

TST_F10_1_1_009
    #prepare mongo.cellUserLocation
    ${msisdn}    QueryDataReturnMsisdn    ${DataBaseNameNEB_QA}    ${CollactionNameCellUserLocation}    @{msisdn_TST_F10_1_1_009}
    CheckResultAndInsertDataByMsisdn    ${DataBaseNameNEB_QA}    ${CollactionNameCellUserLocation}    ${JsonInsertCellUserLocation_TST_F10_1_1_008}    ${msisdn}
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull_NEB    ${NameCmdFileLog_5GModeResourceActivation}    ${PathLogNEB}
    #produce kafka : requestAccessToken
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    Produce Kafka    ${CmdDeleteMassage_qa.5GModeActivated}    ${CmdProduce_qa.5GModeActivated}    ${DataProduce_TST_F10_1_1_009}
    sleep    5s
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    FlushLogbyCommandName_NEB    ${NameCmdFileLog_5GModeResourceActivation}    TST_F10_1_1_009    ${PathLogNEB}
    [Teardown]    Close All Connections

TST_F10_1_1_010
    #prepare mongo.cellUserLocation
    ${msisdn}    QueryDataReturnMsisdn    ${DataBaseNameNEB_QA}    ${CollactionNameCellUserLocation}    @{msisdn_TST_F10_1_1_010}
    CheckResultAndInsertDataByMsisdn    ${DataBaseNameNEB_QA}    ${CollactionNameCellUserLocation}    ${JsonInsertCellUserLocation_TST_F10_1_1_008}    ${msisdn}
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull_NEB    ${NameCmdFileLog_5GModeResourceActivation}    ${PathLogNEB}
    #produce kafka : requestAccessToken
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    Produce Kafka    ${CmdDeleteMassage_qa.5GModeActivated}    ${CmdProduce_qa.5GModeActivated}    ${DataProduce_TST_F10_1_1_010}
    sleep    5s
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    FlushLogbyCommandName_NEB    ${NameCmdFileLog_5GModeResourceActivation}    TST_F10_1_1_010    ${PathLogNEB}
    [Teardown]    Close All Connections

TST_F10_1_1_011
    #prepare mongo.cellUserLocation
    ${msisdn}    QueryDataReturnMsisdn    ${DataBaseNameNEB_QA}    ${CollactionNameCellUserLocation}    @{msisdn_TST_F10_1_1_011}
    CheckResultAndInsertDataByMsisdn    ${DataBaseNameNEB_QA}    ${CollactionNameCellUserLocation}    ${JsonInsertCellUserLocation_TST_F10_1_1_008}    ${msisdn}
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull_NEB    ${NameCmdFileLog_5GModeResourceActivation}    ${PathLogNEB}
    #produce kafka : requestAccessToken
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    Produce Kafka    ${CmdDeleteMassage_qa.5GModeActivated}    ${CmdProduce_qa.5GModeActivated}    ${DataProduce_TST_F10_1_1_011}
    sleep    5s
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    FlushLogbyCommandName_NEB    ${NameCmdFileLog_5GModeResourceActivation}    TST_F10_1_1_011    ${PathLogNEB}
    [Teardown]    Close All Connections

TST_F10_1_1_012
    #prepare mongo.cellUserLocation
    ${msisdn}    QueryDataReturnMsisdn    ${DataBaseNameNEB_QA}    ${CollactionNameCellUserLocation}    @{msisdn_TST_F10_1_1_012}
    CheckResultAndInsertDataByMsisdn    ${DataBaseNameNEB_QA}    ${CollactionNameCellUserLocation}    ${JsonInsertCellUserLocation_TST_F10_1_1_012}    ${msisdn}
    #prepare mongo.cellResourceInventory
    ${CGI_HEX}    QueryDataReturnCellId    ${DataBaseNameNEB_QA}    ${CollactionNameCellUserLocation}    @{msisdn_TST_F10_1_1_012}
    ${CGI_HEX}    Set Variable    {"cellId" : "${CGI_HEX}"}
    ${cellId}    QueryDataReturnbyCellId    ${DataBaseNameNEB_QA}    ${CollactionNameCellResourceInventory}    ${CGI_HEX}
    CheckResultAndInsertDataByCellId    ${DataBaseNameNEB_QA}    ${CollactionNameCellResourceInventory}    ${JsonInsertCellResourceInventory_TST_F10_1_1_012}    ${cellId}
    ${cellId}    Set Variable    {"cellId" : "${cellId}"}    #กรณี Insert ค่าไปใหม่จะเจอเป็นค่าว่างให้เช็คใน mongoDBแทน
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull_NEB    ${NameCmdFileLog_5GModeResourceActivation}    ${PathLogNEB}
    #produce kafka : requestAccessToken
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    Produce Kafka    ${CmdDeleteMassage_qa.5GModeActivated}    ${CmdProduce_qa.5GModeActivated}    ${DataProduce_TST_F10_1_1_012}
    sleep    5s
    #MongoDB.cellUserLocation after update
    ${5GMode}    QueryDataReturn5GMode    ${DataBaseNameNEB_QA}    ${CollactionNameCellUserLocation}    @{msisdn_TST_F10_1_1_012}
    BuiltIn.Log Many    "5GMode" :"${5GMode}"
    #MongoDB.cellResourceInventory after update
    ${Current5GModeEnabler}    QueryDataReturnCurrent5GModeEnabler    ${DataBaseNameNEB_QA}    ${CollactionNameCellResourceInventory}    ${cellId}
    BuiltIn.Log Many    "Current5GModeEnabler" :"${Current5GModeEnabler}"
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    FlushLogbyCommandName_NEB    ${NameCmdFileLog_5GModeResourceActivation}    TST_F10_1_1_012    ${PathLogNEB}
    [Teardown]    Close All Connections

TST_F10_1_1_013
    #prepare mongo.cellUserLocation
    ${msisdn}    QueryDataReturnMsisdn    ${DataBaseNameNEB_QA}    ${CollactionNameCellUserLocation}    @{msisdn_TST_F10_1_1_013}
    CheckResultAndInsertDataByMsisdn    ${DataBaseNameNEB_QA}    ${CollactionNameCellUserLocation}    ${JsonInsertCellUserLocation_TST_F10_1_1_013}    ${msisdn}
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull_NEB    ${NameCmdFileLog_5GModeResourceActivation}    ${PathLogNEB}
    #produce kafka : requestAccessToken
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    Produce Kafka    ${CmdDeleteMassage_qa.5GModeActivated}    ${CmdProduce_qa.5GModeActivated}    ${DataProduce_TST_F10_1_1_013}
    sleep    5s
    #MongoDB.cellUserLocation after update
    ${5GMode}    QueryDataReturn5GMode    ${DataBaseNameNEB_QA}    ${CollactionNameCellUserLocation}    @{msisdn_TST_F10_1_1_013}
    BuiltIn.Log Many    "5GMode" :"${5GMode}"
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    FlushLogbyCommandName_NEB    ${NameCmdFileLog_5GModeResourceActivation}    TST_F10_1_1_013    ${PathLogNEB}
    [Teardown]    Close All Connections

TST_F10_1_1_014
    #prepare mongo.cellUserLocation
    ${msisdn}    QueryDataReturnMsisdn    ${DataBaseNameNEB_QA}    ${CollactionNameCellUserLocation}    @{msisdn_TST_F10_1_1_014}
    CheckResultAndInsertDataByMsisdn    ${DataBaseNameNEB_QA}    ${CollactionNameCellUserLocation}    ${JsonInsertCellUserLocation_TST_F10_1_1_014}    ${msisdn}
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull_NEB    ${NameCmdFileLog_5GModeResourceActivation}    ${PathLogNEB}
    #produce kafka : requestAccessToken
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    Produce Kafka    ${CmdDeleteMassage_qa.5GModeActivated}    ${CmdProduce_qa.5GModeActivated}    ${DataProduce_TST_F10_1_1_014}
    sleep    5s
    #MongoDB.cellUserLocation after update
    ${5GMode}    QueryDataReturn5GMode    ${DataBaseNameNEB_QA}    ${CollactionNameCellUserLocation}    @{msisdn_TST_F10_1_1_014}
    BuiltIn.Log Many    "5GMode" :"${5GMode}"
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    FlushLogbyCommandName_NEB    ${NameCmdFileLog_5GModeResourceActivation}    TST_F10_1_1_014    ${PathLogNEB}
    [Teardown]    Close All Connections

TST_F10_0_1_000
    ${msisdn}    QueryDataReturnMsisdn    ${DataBaseNameNEB_QA}    ${CollactionNameCellUserLocation}    @{msisdn_TST_F10_0_1_000}
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull_NEB    ${NameCmdFileLog_5GModeResourceActivation}    ${PathLogNEB}
    #produce kafka : requestAccessToken
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    Produce Kafka    ${CmdDeleteMassage_qa.5GModeActivated}    ${CmdProduce_qa.5GModeActivated}    ${DataProduce_TST_F10_0_1_000}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    FlushLogbyCommandName_NEB    ${NameCmdFileLog_5GModeResourceActivation}    TST_F10_0_1_000    ${PathLogNEB}
    [Teardown]    Close All Connections

TST_F10_0_1_001
    ${msisdn}    QueryDataReturnMsisdn    ${DataBaseNameNEB_QA}    ${CollactionNameCellUserLocation}    @{msisdn_TST_F10_0_1_001}
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull_NEB    ${NameCmdFileLog_5GModeResourceActivation}    ${PathLogNEB}
    #produce kafka : requestAccessToken
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    Produce Kafka    ${CmdDeleteMassage_qa.5GModeActivated}    ${CmdProduce_qa.5GModeActivated}    ${DataProduce_TST_F10_0_1_001}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    FlushLogbyCommandName_NEB    ${NameCmdFileLog_5GModeResourceActivation}    TST_F10_0_1_001    ${PathLogNEB}
    [Teardown]    Close All Connections

TST_F10_0_1_002
    ${msisdn}    QueryDataReturnMsisdn    ${DataBaseNameNEB_QA}    ${CollactionNameCellUserLocation}    @{msisdn_TST_F10_0_1_002}
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull_NEB    ${NameCmdFileLog_5GModeResourceActivation}    ${PathLogNEB}
    #produce kafka : requestAccessToken
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    Produce Kafka    ${CmdDeleteMassage_qa.5GModeActivated}    ${CmdProduce_qa.5GModeActivated}    ${DataProduce_TST_F10_0_1_002} \
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    FlushLogbyCommandName_NEB    ${NameCmdFileLog_5GModeResourceActivation}    TST_F10_0_1_002    ${PathLogNEB}
    [Teardown]    Close All Connections

TST_F10_0_1_003
    ${msisdn}    QueryDataReturnMsisdn    ${DataBaseNameNEB_QA}    ${CollactionNameCellUserLocation}    @{msisdn_TST_F10_0_1_003}
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull_NEB    ${NameCmdFileLog_5GModeResourceActivation}    ${PathLogNEB}
    #produce kafka : requestAccessToken
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    Produce Kafka    ${CmdDeleteMassage_qa.5GModeActivated}    ${CmdProduce_qa.5GModeActivated}    ${DataProduce_TST_F10_0_1_003}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    FlushLogbyCommandName_NEB    ${NameCmdFileLog_5GModeResourceActivation}    TST_F10_0_1_003    ${PathLogNEB}
    [Teardown]    Close All Connections

TST_F10_0_1_004
    ${msisdn}    QueryDataReturnMsisdn    ${DataBaseNameNEB_QA}    ${CollactionNameCellUserLocation}    @{msisdn_TST_F10_0_1_004}
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull_NEB    ${NameCmdFileLog_5GModeResourceActivation}    ${PathLogNEB}
    #produce kafka : requestAccessToken
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    Produce Kafka    ${CmdDeleteMassage_qa.5GModeActivated}    ${CmdProduce_qa.5GModeActivated}    ${DataProduce_TST_F10_0_1_004}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    FlushLogbyCommandName_NEB    ${NameCmdFileLog_5GModeResourceActivation}    TST_F10_0_1_004    ${PathLogNEB}
    [Teardown]    Close All Connections
