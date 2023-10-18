*** Settings ***
Resource          Variable.robot
Resource          ../../Keyword/Common.robot
Resource          ../../Keyword/MongoDB.robot
Resource          ../../Keyword/SecureCRT.robot
Resource          ../../Valiables/CommonValiable/CommonValiable.robot
Resource          ../../Valiables/CommonValiable/CommonValiable.robot
*** Test Cases ***
test
    [Tags]  00
    # ${cellId}    QueryDataReturnCellIdNew    ${DataBaseNameNEB}    ${CollactionNameUserLocation}    ${msisdn_TST_F11_1_1_001}
    # Log    ${cellId}   console=yes
    InsertDataFromJson    ${DataBaseNameNEB}    ${CollactionNameLocationMasterCell}     ${PrepareDataTestMasterCell_001}
    Log   Insert   console=yes
    
    
#ก่อนรันสคริปต้องเคลียร์ Collection myNetworkUserLocation เพื่อให้ข้อมูลตรง Expected
TST_F11_1_1_001
    [Tags]  Success
    #หาใน mongo.UserLocation หา msisdn 
    ${msisdn}    QueryDataReturnMsisdn    ${DataBaseNameNEB}    ${CollactionNameUserLocation}    ${msisdn_TST_F11_1_1_001}
    #prepare msisdn
    CheckResultAndInsertDataByMsisdn    ${DataBaseNameNEB}    ${CollactionNameUserLocation}    ${JsonInsert_TST_F11_1_1_001}    ${msisdn}
    Sleep    5
    #Query mongo.UserLocation เพื่อเอา cellId และไปเช็คที่ LocationMasterCell ว่า cellId กับ CGI_HEX อันเดียวกันไหม
    ${cellId}    QueryDataReturnCellIdNew    ${DataBaseNameNEB}    ${CollactionNameUserLocation}    ${msisdn_TST_F11_1_1_001}
    ${CGI_HEX}    CheckDataReturnCellId    ${DataBaseNameNEB}    ${CollactionNameLocationMasterCell}    ${cellId}
    VerifyData    ${cellId}    ${CGI_HEX}
    #set log ให้เป็นค่าว่าง
    ConnectSecureCRTLog1    ${HostURL_10.137.45.30}
    SetLogNull_NEB    ${NameCommandFileLog}    ${PathLogNEB_Log}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.184}
    ProduceKafka    ${CmdDeleteMassage_qa.currentCellAvailabilityChecked}    ${CmdProduce_qa.requestcheckCurrentCellAvailability}    ${DataProduce_TST_F11_1_1_001}
    #Consume คำสั่ง ลง kafka
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.184}
    ${ConsumeResult}    ConsumeKafkaNEB    ${Consume_qa.currentCellAvailabilityChecked}    TST_F11_1_1_001
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.currentCellAvailabilityChecked_TST_F11_1_1_001}
    # เก็บ log
    ConnectSecureCRTLog1    ${HostURL_10.137.45.30}
    FlushLogbyCommandName_NEB    ${NameCommandFileLog}    TST_F11_1_1_001    ${PathLogNEB_Log}
    [Teardown]    Close All Connections

TST_F11_1_1_002
    [Tags]  Success
    #หาใน mongo.UserLocation หา msisdn 
    ${msisdn}    QueryDataReturnMsisdn    ${DataBaseNameNEB}    ${CollactionNameUserLocation}    ${msisdn_TST_F11_1_1_002}
    #prepare msisdn
    CheckResultAndInsertDataByMsisdn    ${DataBaseNameNEB}    ${CollactionNameUserLocation}    ${JsonInsert_TST_F11_1_1_002}    ${msisdn}
    Sleep    5
    #prepare data current5GModeEnabler > 0
    FOR  ${JsonInsert}  IN  @{PrepareDataTestmyNetwork_002}
        InsertDataFromJson    ${DataBaseNameNEB}    ${CollactionNamemyNetworkUserLocation}     ${JsonInsert}
    END
    #Query mongo.UserLocation เพื่อเอา cellId และไปเช็คที่ LocationMasterCell ว่า cellId กับ CGI_HEX อันเดียวกันไหม
    ${cellId}    QueryDataReturnCellIdNew    ${DataBaseNameNEB}    ${CollactionNameUserLocation}    ${msisdn_TST_F11_1_1_002}
    ${CGI_HEX}    CheckDataReturnCellId    ${DataBaseNameNEB}    ${CollactionNameLocationMasterCell}    ${cellId}
    VerifyData    ${cellId}    ${CGI_HEX}
    #set log ให้เป็นค่าว่าง
    ConnectSecureCRTLog1    ${HostURL_10.137.45.30}
    SetLogNull_NEB    ${NameCommandFileLog}    ${PathLogNEB_Log}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.184}
    ProduceKafka    ${CmdDeleteMassage_qa.currentCellAvailabilityChecked}    ${CmdProduce_qa.requestcheckCurrentCellAvailability}    ${DataProduce_TST_F11_1_1_002}
    #Consume คำสั่ง ลง kafka
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.184}
    ${ConsumeResult}    ConsumeKafkaNEB    ${Consume_qa.currentCellAvailabilityChecked}    TST_F11_1_1_002
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.currentCellAvailabilityChecked_TST_F11_1_1_002}
    # เก็บ log
    ConnectSecureCRTLog1    ${HostURL_10.137.45.30}
    FlushLogbyCommandName_NEB    ${NameCommandFileLog}    TST_F11_1_1_002    ${PathLogNEB_Log}
    [Teardown]    Close All Connections    

TST_F11_1_1_003
    [Tags]  Success
    #หาใน mongo.UserLocation หา msisdn 
    ${msisdn}    QueryDataReturnMsisdn    ${DataBaseNameNEB}    ${CollactionNameUserLocation}    ${msisdn_TST_F11_1_1_003}
    #prepare msisdn
    CheckResultAndInsertDataByMsisdn    ${DataBaseNameNEB}    ${CollactionNameUserLocation}    ${JsonInsert_TST_F11_1_1_003}    ${msisdn}
    Sleep    5
    #Query mongo.UserLocation เพื่อเอา cellId และไปเช็คที่ LocationMasterCell ว่า cellId กับ CGI_HEX อันเดียวกันไหม
    ${cellId}    QueryDataReturnCellIdNew    ${DataBaseNameNEB}    ${CollactionNameUserLocation}    ${msisdn_TST_F11_1_1_003}
    ${CGI_HEX}    CheckDataReturnCellId    ${DataBaseNameNEB}    ${CollactionNameLocationMasterCell}    ${cellId}
    VerifyData    ${cellId}    ${CGI_HEX}
    #set log ให้เป็นค่าว่าง
    ConnectSecureCRTLog1    ${HostURL_10.137.45.30}
    SetLogNull_NEB    ${NameCommandFileLog}    ${PathLogNEB_Log}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.184}
    ProduceKafka    ${CmdDeleteMassage_qa.currentCellAvailabilityChecked}    ${CmdProduce_qa.requestcheckCurrentCellAvailability}    ${DataProduce_TST_F11_1_1_003}
    #Consume คำสั่ง ลง kafka
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.184}
    ${ConsumeResult}    ConsumeKafkaNEB    ${Consume_qa.currentCellAvailabilityChecked}    TST_F11_1_1_003
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.currentCellAvailabilityChecked_TST_F11_1_1_003}
    # เก็บ log
    ConnectSecureCRTLog1    ${HostURL_10.137.45.30}
    FlushLogbyCommandName_NEB    ${NameCommandFileLog}    TST_F11_1_1_003    ${PathLogNEB_Log}
    [Teardown]    Close All Connections  

TST_F11_1_1_004
    [Tags]  Success
    #หาใน mongo.UserLocation หา msisdn 
    ${msisdn}    QueryDataReturnMsisdn    ${DataBaseNameNEB}    ${CollactionNameUserLocation}    ${msisdn_TST_F11_1_1_004}
    #prepare msisdn
    CheckResultAndInsertDataByMsisdn    ${DataBaseNameNEB}    ${CollactionNameUserLocation}    ${JsonInsert_TST_F11_1_1_004}    ${msisdn}
    Sleep    5
    #Query mongo.UserLocation เพื่อเอา cellId และไปเช็คที่ LocationMasterCell ว่า cellId กับ CGI_HEX อันเดียวกันไหม
    ${cellId}    QueryDataReturnCellIdNew    ${DataBaseNameNEB}    ${CollactionNameUserLocation}    ${msisdn_TST_F11_1_1_004}
    ${CGI_HEX}    CheckDataReturnCellId    ${DataBaseNameNEB}    ${CollactionNameLocationMasterCell}    ${cellId}
    VerifyData    ${cellId}    ${CGI_HEX}
    #set log ให้เป็นค่าว่าง
    ConnectSecureCRTLog1    ${HostURL_10.137.45.30}
    SetLogNull_NEB    ${NameCommandFileLog}    ${PathLogNEB_Log}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.184}
    ProduceKafka    ${CmdDeleteMassage_qa.currentCellAvailabilityChecked}    ${CmdProduce_qa.requestcheckCurrentCellAvailability}    ${DataProduce_TST_F11_1_1_004}
    #Consume คำสั่ง ลง kafka
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.184}
    ${ConsumeResult}    ConsumeKafkaNEB    ${Consume_qa.currentCellAvailabilityChecked}    TST_F11_1_1_004
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.currentCellAvailabilityChecked_TST_F11_1_1_004}
    # เก็บ log
    ConnectSecureCRTLog1    ${HostURL_10.137.45.30}
    FlushLogbyCommandName_NEB    ${NameCommandFileLog}    TST_F11_1_1_004    ${PathLogNEB_Log}
    [Teardown]    Close All Connections      

TST_F11_1_1_005
    [Tags]  Success
    #หาใน mongo.UserLocation หา msisdn 
    ${msisdn}    QueryDataReturnMsisdn    ${DataBaseNameNEB}    ${CollactionNameUserLocation}    ${msisdn_TST_F11_1_1_005}
    #prepare msisdn
    CheckResultAndInsertDataByMsisdn    ${DataBaseNameNEB}    ${CollactionNameUserLocation}    ${JsonInsert_TST_F11_1_1_005}    ${msisdn}
    Sleep    5
    #Query mongo.UserLocation เพื่อเอา cellId และไปเช็คที่ LocationMasterCell ว่า cellId กับ CGI_HEX อันเดียวกันไหม
    ${cellId}    QueryDataReturnCellIdNew    ${DataBaseNameNEB}    ${CollactionNameUserLocation}    ${msisdn_TST_F11_1_1_005}
    ${CGI_HEX}    CheckDataReturnCellId    ${DataBaseNameNEB}    ${CollactionNameLocationMasterCell}    ${cellId}
    VerifyData    ${cellId}    ${CGI_HEX}
    #set log ให้เป็นค่าว่าง
    ConnectSecureCRTLog1    ${HostURL_10.137.45.30}
    SetLogNull_NEB    ${NameCommandFileLog}    ${PathLogNEB_Log}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.184}
    ProduceKafka    ${CmdDeleteMassage_qa.currentCellAvailabilityChecked}    ${CmdProduce_qa.requestcheckCurrentCellAvailability}    ${DataProduce_TST_F11_1_1_005}
    #Consume คำสั่ง ลง kafka
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.184}
    ${ConsumeResult}    ConsumeKafkaNEB    ${Consume_qa.currentCellAvailabilityChecked}    TST_F11_1_1_005
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.currentCellAvailabilityChecked_TST_F11_1_1_005}
    # เก็บ log
    ConnectSecureCRTLog1    ${HostURL_10.137.45.30}
    FlushLogbyCommandName_NEB    ${NameCommandFileLog}    TST_F11_1_1_005    ${PathLogNEB_Log}
    [Teardown]    Close All Connections

TST_F11_1_1_006
    [Tags]  Success
    #หาใน mongo.UserLocation หา msisdn 
    ${msisdn}    QueryDataReturnMsisdn    ${DataBaseNameNEB}    ${CollactionNameUserLocation}    ${msisdn_TST_F11_1_1_006}
    #prepare msisdn
    CheckResultAndInsertDataByMsisdn    ${DataBaseNameNEB}    ${CollactionNameUserLocation}    ${JsonInsert_TST_F11_1_1_006}    ${msisdn}
    Sleep    5
    #Query mongo.UserLocation เพื่อเอา cellId และไปเช็คที่ LocationMasterCell ว่า cellId กับ CGI_HEX อันเดียวกันไหม
    ${cellId}    QueryDataReturnCellIdNew    ${DataBaseNameNEB}    ${CollactionNameUserLocation}    ${msisdn_TST_F11_1_1_006}
    ${CGI_HEX}    CheckDataReturnCellId    ${DataBaseNameNEB}    ${CollactionNameLocationMasterCell}    ${cellId}
    VerifyData    ${cellId}    ${CGI_HEX}
    #set log ให้เป็นค่าว่าง
    ConnectSecureCRTLog1    ${HostURL_10.137.45.30}
    SetLogNull_NEB    ${NameCommandFileLog}    ${PathLogNEB_Log}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.184}
    ProduceKafka    ${CmdDeleteMassage_qa.currentCellAvailabilityChecked}    ${CmdProduce_qa.requestcheckCurrentCellAvailability}    ${DataProduce_TST_F11_1_1_006}
    #Consume คำสั่ง ลง kafka
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.184}
    ${ConsumeResult}    ConsumeKafkaNEB    ${Consume_qa.currentCellAvailabilityChecked}    TST_F11_1_1_006
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.currentCellAvailabilityChecked_TST_F11_1_1_006}
    # เก็บ log
    ConnectSecureCRTLog1    ${HostURL_10.137.45.30}
    FlushLogbyCommandName_NEB    ${NameCommandFileLog}    TST_F11_1_1_006    ${PathLogNEB_Log}
    [Teardown]    Close All Connections    

TST_F11_1_1_007    #Not found ไม่เช็ค CGI_HEX 
    [Tags]  Success
    #หาใน mongo.UserLocation หา msisdn 
    ${msisdn}    QueryDataReturnMsisdn    ${DataBaseNameNEB}    ${CollactionNameUserLocation}    ${msisdn_TST_F11_1_1_007}
    #prepare msisdn
    CheckResultAndInsertDataByMsisdn    ${DataBaseNameNEB}    ${CollactionNameUserLocation}    ${JsonInsert_TST_F11_1_1_007}    ${msisdn}
    Sleep    5
    #Query mongo.UserLocation เพื่อเอา cellId และไปเช็คที่ LocationMasterCell ว่า cellId กับ CGI_HEX อันเดียวกันไหม
    # ${cellId}    QueryDataReturnCellIdNew    ${DataBaseNameNEB}    ${CollactionNameUserLocation}    ${msisdn_TST_F11_1_1_007}
    # ${CGI_HEX}    CheckDataReturnCellId    ${DataBaseNameNEB}    ${CollactionNameLocationMasterCell}    ${cellId}
    # VerifyData    ${cellId}    ${CGI_HEX}
    #set log ให้เป็นค่าว่าง
    ConnectSecureCRTLog1    ${HostURL_10.137.45.30}
    SetLogNull_NEB    ${NameCommandFileLog}    ${PathLogNEB_Log}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.184}
    ProduceKafka    ${CmdDeleteMassage_qa.currentCellAvailabilityChecked}    ${CmdProduce_qa.requestcheckCurrentCellAvailability}    ${DataProduce_TST_F11_1_1_007}
    #Consume คำสั่ง ลง kafka
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.184}
    ${ConsumeResult}    ConsumeKafkaNEB    ${Consume_qa.currentCellAvailabilityChecked}    TST_F11_1_1_007
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.currentCellAvailabilityChecked_TST_F11_1_1_007}
    # เก็บ log
    ConnectSecureCRTLog1    ${HostURL_10.137.45.30}
    FlushLogbyCommandName_NEB    ${NameCommandFileLog}    TST_F11_1_1_007    ${PathLogNEB_Log}
    [Teardown]    Close All Connections 

TST_F11_1_1_008
    [Tags]  Success
    #หาใน mongo.UserLocation หา msisdn 
    ${msisdn}    QueryDataReturnMsisdn    ${DataBaseNameNEB}    ${CollactionNameUserLocation}    ${msisdn_TST_F11_1_1_008}
    #prepare msisdn
    CheckResultAndInsertDataByMsisdn    ${DataBaseNameNEB}    ${CollactionNameUserLocation}    ${JsonInsert_TST_F11_1_1_008}    ${msisdn}
    Sleep    5
    #Query mongo.UserLocation เพื่อเอา cellId และไปเช็คที่ LocationMasterCell ว่า cellId กับ CGI_HEX อันเดียวกันไหม
    ${cellId}    QueryDataReturnCellIdNew    ${DataBaseNameNEB}    ${CollactionNameUserLocation}    ${msisdn_TST_F11_1_1_008}
    ${CGI_HEX}    CheckDataReturnCellId    ${DataBaseNameNEB}    ${CollactionNameLocationMasterCell}    ${cellId}
    VerifyData    ${cellId}    ${CGI_HEX}
    #set log ให้เป็นค่าว่าง
    ConnectSecureCRTLog1    ${HostURL_10.137.45.30}
    SetLogNull_NEB    ${NameCommandFileLog}    ${PathLogNEB_Log}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.184}
    ProduceKafka    ${CmdDeleteMassage_qa.currentCellAvailabilityChecked}    ${CmdProduce_qa.requestcheckCurrentCellAvailability}    ${DataProduce_TST_F11_1_1_008}
    #Consume คำสั่ง ลง kafka
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.184}
    ${ConsumeResult}    ConsumeKafkaNEB    ${Consume_qa.currentCellAvailabilityChecked}    TST_F11_1_1_008
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.currentCellAvailabilityChecked_TST_F11_1_1_008}
    # เก็บ log
    ConnectSecureCRTLog1    ${HostURL_10.137.45.30}
    FlushLogbyCommandName_NEB    ${NameCommandFileLog}    TST_F11_1_1_008    ${PathLogNEB_Log}
    [Teardown]    Close All Connections 

TST_F11_1_1_009
    [Tags]  Success
    #หาใน mongo.UserLocation หา msisdn 
    ${msisdn}    QueryDataReturnMsisdn    ${DataBaseNameNEB}    ${CollactionNameUserLocation}    ${msisdn_TST_F11_1_1_009}
    #prepare msisdn
    CheckResultAndInsertDataByMsisdn    ${DataBaseNameNEB}    ${CollactionNameUserLocation}    ${JsonInsert_TST_F11_1_1_009}    ${msisdn}
    Sleep    5
    #Query mongo.UserLocation เพื่อเอา cellId และไปเช็คที่ LocationMasterCell ว่า cellId กับ CGI_HEX อันเดียวกันไหม
    ${cellId}    QueryDataReturnCellIdNew    ${DataBaseNameNEB}    ${CollactionNameUserLocation}    ${msisdn_TST_F11_1_1_009}
    ${CGI_HEX}    CheckDataReturnCellId    ${DataBaseNameNEB}    ${CollactionNameLocationMasterCell}    ${cellId}
    VerifyData    ${cellId}    ${CGI_HEX}
    #set log ให้เป็นค่าว่าง
    ConnectSecureCRTLog1    ${HostURL_10.137.45.30}
    SetLogNull_NEB    ${NameCommandFileLog}    ${PathLogNEB_Log}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.184}
    ProduceKafka    ${CmdDeleteMassage_qa.currentCellAvailabilityChecked}    ${CmdProduce_qa.requestcheckCurrentCellAvailability}    ${DataProduce_TST_F11_1_1_009}
    #Consume คำสั่ง ลง kafka
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.184}
    ${ConsumeResult}    ConsumeKafkaNEB    ${Consume_qa.currentCellAvailabilityChecked}    TST_F11_1_1_009
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.currentCellAvailabilityChecked_TST_F11_1_1_009}
    # เก็บ log
    ConnectSecureCRTLog1    ${HostURL_10.137.45.30}
    FlushLogbyCommandName_NEB    ${NameCommandFileLog}    TST_F11_1_1_009   ${PathLogNEB_Log}
    [Teardown]    Close All Connections 


#=====================ERROR CASE=======================

TST_F11_0_1_001
    [Tags]  Error
    #หาใน mongo.UserLocation หา msisdn
    ${msisdn}    QueryDataReturnMsisdn    ${DataBaseNameNEB}    ${CollactionNameUserLocation}    ${msisdn_TST_F11_0_1_001}
    #prepare msisdn
    ${msisdn}    CheckResultAndDelectDataByMsisdn    ${DataBaseNameNEB}    ${CollactionNameCellUserLocation}    ${msisdn}
    Sleep    2
    Log    No msisdn=${msisdn}    console=yes
    #set log ให้เป็นค่าว่าง
    ConnectSecureCRTLog1    ${HostURL_10.137.45.30}
    SetLogNull_NEB    ${NameCommandFileLog}    ${PathLogNEB_Log}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.184}
    ProduceKafka    ${CmdDeleteMassage_qa.currentCellAvailabilityChecked}    ${CmdProduce_qa.requestcheckCurrentCellAvailability}    ${DataProduce_TST_F11_0_1_001}
    #Consume คำสั่ง ลง kafka
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.184}
    ${ConsumeResult}    ConsumeKafkaNEB    ${Consume_qa.currentCellAvailabilityChecked}    TST_F11_0_1_001
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.currentCellAvailabilityChecked_TST_F11_0_1_001}
    #เก็บ log'
    ConnectSecureCRTLog1    ${HostURL_10.137.45.30}
    FlushLogbyCommandName_NEB    ${NameCommandFileLog}    TST_F11_0_1_001    ${PathLogNEB_Log}
    [Teardown]    Close All Connections 

TST_F11_0_1_002
    [Tags]  Error
    #หาใน mongo.UserLocation หา msisdn
    ${msisdn}    QueryDataReturnMsisdn    ${DataBaseNameNEB}    ${CollactionNameUserLocation}    ${msisdn_TST_F11_0_1_002}
    #prepare msisdn
    ${msisdn}    CheckResultAndDelectDataByMsisdn    ${DataBaseNameNEB}    ${CollactionNameCellUserLocation}    ${msisdn}
    Sleep    2
    Log    ${msisdn}
    ${cellId}    QueryDataReturnCellIdNew    ${DataBaseNameNEB}    ${CollactionNameUserLocation}    ${msisdn_TST_F11_0_1_002}
    #set log ให้เป็นค่าว่าง
    ConnectSecureCRTLog1    ${HostURL_10.137.45.30}
    SetLogNull_NEB    ${NameCommandFileLog}    ${PathLogNEB_Log}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.184}
    ProduceKafka    ${CmdDeleteMassage_qa.currentCellAvailabilityChecked}    ${CmdProduce_qa.requestcheckCurrentCellAvailability}    ${DataProduce_TST_F11_0_1_002}
    #Consume คำสั่ง ลง kafka
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.184}
    ${ConsumeResult}    ConsumeKafkaNEB    ${Consume_qa.currentCellAvailabilityChecked}    TST_F11_0_1_002
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.currentCellAvailabilityChecked_TST_F11_0_1_002}
    #เก็บ log'
    ConnectSecureCRTLog1    ${HostURL_10.137.45.30}
    FlushLogbyCommandName_NEB    ${NameCommandFileLog}    TST_F11_0_1_002   ${PathLogNEB_Log}    
    [Teardown]    Close All Connections 

TST_F11_0_1_003
    [Tags]  Error
    #set log ให้เป็นค่าว่าง
    ConnectSecureCRTLog1    ${HostURL_10.137.45.30}
    SetLogNull_NEB    ${NameCommandFileLog}    ${PathLogNEB_Log}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.184}
    ProduceKafka    ${CmdDeleteMassage_qa.currentCellAvailabilityChecked}    ${CmdProduce_qa.requestcheckCurrentCellAvailability}    ${DataProduce_TST_F11_0_1_003}
    #Consume คำสั่ง ลง kafka
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.184}
    ${ConsumeResult}    ConsumeKafkaNEB    ${Consume_qa.currentCellAvailabilityChecked}    TST_F11_0_1_003
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.currentCellAvailabilityChecked_TST_F11_0_1_003}
    #เก็บ log'
    ConnectSecureCRTLog1    ${HostURL_10.137.45.30}
    FlushLogbyCommandName_NEB    ${NameCommandFileLog}    TST_F11_0_1_003   ${PathLogNEB_Log}    
    [Teardown]    Close All Connections 

TST_F11_0_1_004
    [Tags]  Error
    #set log ให้เป็นค่าว่าง
    ConnectSecureCRTLog1    ${HostURL_10.137.45.30}
    SetLogNull_NEB    ${NameCommandFileLog}    ${PathLogNEB_Log}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.184}
    ProduceKafka    ${CmdDeleteMassage_qa.currentCellAvailabilityChecked}    ${CmdProduce_qa.requestcheckCurrentCellAvailability}    ${DataProduce_TST_F11_0_1_004}
    #Consume คำสั่ง ลง kafka
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.184}
    ${ConsumeResult}    ConsumeKafkaNEB    ${Consume_qa.currentCellAvailabilityChecked}    TST_F11_0_1_004
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.currentCellAvailabilityChecked_TST_F11_0_1_004}
    #เก็บ log'
    ConnectSecureCRTLog1    ${HostURL_10.137.45.30}
    FlushLogbyCommandName_NEB    ${NameCommandFileLog}    TST_F11_0_1_004   ${PathLogNEB_Log}    
    [Teardown]    Close All Connections 

TST_F11_0_1_005
    [Tags]  Error
    #set log ให้เป็นค่าว่าง
    ConnectSecureCRTLog1    ${HostURL_10.137.45.30}
    SetLogNull_NEB    ${NameCommandFileLog}    ${PathLogNEB_Log}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.184}
    ProduceKafka    ${CmdDeleteMassage_qa.currentCellAvailabilityChecked}    ${CmdProduce_qa.requestcheckCurrentCellAvailability}    ${DataProduce_TST_F11_0_1_005}
    #Consume คำสั่ง ลง kafka
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.184}
    ${ConsumeResult}    ConsumeKafkaNEB    ${Consume_qa.currentCellAvailabilityChecked}    TST_F11_0_1_005
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.currentCellAvailabilityChecked_TST_F11_0_1_005}
    #เก็บ log'
    ConnectSecureCRTLog1    ${HostURL_10.137.45.30}
    FlushLogbyCommandName_NEB    ${NameCommandFileLog}    TST_F11_0_1_005   ${PathLogNEB_Log}    
    [Teardown]    Close All Connections 

TST_F11_0_1_006
    [Tags]  Error
    #set log ให้เป็นค่าว่าง
    ConnectSecureCRTLog1    ${HostURL_10.137.45.30}
    SetLogNull_NEB    ${NameCommandFileLog}    ${PathLogNEB_Log}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.184}
    ProduceKafka    ${CmdDeleteMassage_qa.currentCellAvailabilityChecked}    ${CmdProduce_qa.requestcheckCurrentCellAvailability}    ${DataProduce_TST_F11_0_1_006}
    #Consume คำสั่ง ลง kafka
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.184}
    ${ConsumeResult}    ConsumeKafkaNEB    ${Consume_qa.currentCellAvailabilityChecked}    TST_F11_0_1_006
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.currentCellAvailabilityChecked_TST_F11_0_1_006}
    #เก็บ log'
    ConnectSecureCRTLog1    ${HostURL_10.137.45.30}
    FlushLogbyCommandName_NEB    ${NameCommandFileLog}    TST_F11_0_1_006   ${PathLogNEB_Log}    
    [Teardown]    Close All Connections 