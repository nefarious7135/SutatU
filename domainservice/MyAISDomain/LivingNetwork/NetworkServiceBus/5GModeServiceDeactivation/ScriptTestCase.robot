*** Settings ***
Resource          ../../Keyword/Common.robot
Resource          ../../Keyword/MongoDB.robot
Resource          ../../Keyword/SecureCRT.robot
Resource          ../../Valiables/CommonValiable/CommonValiable.robot
Resource          Variable.robot

*** Test Cases ***
TST_F12_1_000
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCommandFileLog_Deactivate}    ${PathLog5gmodeservicedeactivation}
    #Set AC Response
    SetMockupResponse    ${PathConfigACResponse}    ${PathDataACResponse_anti_corr_succ}
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    #produce คำสั่ง ลง kafka
    ProduceKafka    ${delete_qa.5GModeDeactivated}    ${Produce_qa.deactivate5GMode}    ${DataProduce_TST_F12_1_000}
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    #Consume คำสั่ง ลง kafka
    Sleep    5s
    ${ConsumeResult}    ConsumeKafka    ${Consume_qa.5GModeDeactivated}    TST_F12_1_000
    log    ${ConsumeResult}
    # check ค่า
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_TST_F12_1_000}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    FlushLogbyCommandName    ${NameCommandFileLog_Deactivate}    TST_F12_1_000    ${PathLog5gmodeservicedeactivation}

TST_F12_1_001
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCommandFileLog_Deactivate}    ${PathLog5gmodeservicedeactivation}
    #Set AC Response
    SetMockupResponse    ${PathConfigACResponse}    ${PathDataACResponse_anti_corr_succ}
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    #produce คำสั่ง ลง kafka
    ProduceKafka    ${delete_qa.5GModeDeactivated}    ${Produce_qa.deactivate5GMode}    ${DataProduce_TST_F12_1_001}
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    #Consume คำสั่ง ลง kafka
    Sleep    5s
    ${ConsumeResult}    ConsumeKafka    ${Consume_qa.5GModeDeactivated}    TST_F12_1_001
    log    ${ConsumeResult}
    # check ค่า
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_TST_F12_1_001}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    FlushLogbyCommandName    ${NameCommandFileLog_Deactivate}    TST_F12_1_001    ${PathLog5gmodeservicedeactivation}

TST_F12_1_002
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCommandFileLog_Deactivate}    ${PathLog5gmodeservicedeactivation}
    #Set AC Response
    SetMockupResponse    ${PathConfigACResponse}    ${PathDataACResponse_anti_corr_succ}
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    #produce คำสั่ง ลง kafka
    ProduceKafka    ${delete_qa.5GModeDeactivated}    ${Produce_qa.deactivate5GMode}    ${DataProduce_TST_F12_1_002}
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    #Consume คำสั่ง ลง kafka
    Sleep    5s
    ${ConsumeResult}    ConsumeKafka    ${Consume_qa.5GModeDeactivated}    TST_F12_1_002
    log    ${ConsumeResult}
    # check ค่า
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_TST_F12_1_002}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    FlushLogbyCommandName    ${NameCommandFileLog_Deactivate}    TST_F12_1_002    ${PathLog5gmodeservicedeactivation}

TST_F12_1_003
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCommandFileLog_Deactivate}    ${PathLog5gmodeservicedeactivation}
    #Set AC Response
    SetMockupResponse    ${PathConfigACResponse}    ${PathDataACResponse_anti_corr_succ}
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    #produce คำสั่ง ลง kafka
    ProduceKafka    ${delete_qa.5GModeDeactivated}    ${Produce_qa.deactivate5GMode}    ${DataProduce_TST_F12_1_003}
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    #Consume คำสั่ง ลง kafka
    Sleep    5s
    ${ConsumeResult}    ConsumeKafka    ${Consume_qa.5GModeDeactivated}    TST_F12_1_003
    log    ${ConsumeResult}
    # check ค่า
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_TST_F12_1_003}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    FlushLogbyCommandName    ${NameCommandFileLog_Deactivate}    TST_F12_1_003    ${PathLog5gmodeservicedeactivation}

TST_F12_1_004
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCommandFileLog_Deactivate}    ${PathLog5gmodeservicedeactivation}
    #Set AC Response
    SetMockupResponse    ${PathConfigACResponse}    ${PathDataACResponse_TST_F12_1_004}
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    #produce คำสั่ง ลง kafka
    ProduceKafka    ${delete_qa.5GModeDeactivated}    ${Produce_qa.deactivate5GMode}    ${DataProduce_TST_F12_1_004}
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    #Consume คำสั่ง ลง kafka
    Sleep    5s
    ${ConsumeResult}    ConsumeKafka    ${Consume_qa.5GModeDeactivated}    TST_F12_1_004
    log    ${ConsumeResult}
    # check ค่า
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_TST_F12_1_004}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    FlushLogbyCommandName    ${NameCommandFileLog_Deactivate}    TST_F12_1_004    ${PathLog5gmodeservicedeactivation}

TST_F12_1_005
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCommandFileLog_Deactivate}    ${PathLog5gmodeservicedeactivation}
    #Set AC Response
    SetMockupResponse    ${PathConfigACResponse}    ${PathDataACResponse_TST_F12_1_005}
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    #produce คำสั่ง ลง kafka
    ProduceKafka    ${delete_qa.5GModeDeactivated}    ${Produce_qa.deactivate5GMode}    ${DataProduce_TST_F12_1_005}
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    #Consume คำสั่ง ลง kafka
    Sleep    5s
    ${ConsumeResult}    ConsumeKafka    ${Consume_qa.5GModeDeactivated}    TST_F12_1_005
    log    ${ConsumeResult}
    # check ค่า
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_TST_F12_1_005}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    FlushLogbyCommandName    ${NameCommandFileLog_Deactivate}    TST_F12_1_005    ${PathLog5gmodeservicedeactivation}

TST_F12_1_006
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCommandFileLog_Deactivate}    ${PathLog5gmodeservicedeactivation}
    #Set AC Response
    SetMockupResponse    ${PathConfigACResponse}    ${PathDataACResponse_TST_F12_1_006}
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    #produce คำสั่ง ลง kafka
    ProduceKafka    ${delete_qa.5GModeDeactivated}    ${Produce_qa.deactivate5GMode}    ${DataProduce_TST_F12_1_006}
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    #Consume คำสั่ง ลง kafka
    Sleep    5s
    ${ConsumeResult}    ConsumeKafka    ${Consume_qa.5GModeDeactivated}    TST_F12_1_006
    log    ${ConsumeResult}
    # check ค่า
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_TST_F12_1_006}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    FlushLogbyCommandName    ${NameCommandFileLog_Deactivate}    TST_F12_1_006    ${PathLog5gmodeservicedeactivation}

TST_F12_1_007
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCommandFileLog_Deactivate}    ${PathLog5gmodeservicedeactivation}
    #Set AC Response
    SetMockupResponse    ${PathConfigACResponse}    ${PathDataACResponse_anti_corr_succ}
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    #produce คำสั่ง ลง kafka
    ProduceKafka    ${delete_qa.5GModeDeactivated}    ${Produce_qa.deactivate5GMode}    ${DataProduce_TST_F12_1_007}
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    #Consume คำสั่ง ลง kafka
    Sleep    5s
    ${ConsumeResult}    ConsumeKafka    ${Consume_qa.5GModeDeactivated}    TST_F12_1_007
    log    ${ConsumeResult}
    # check ค่า
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_TST_F12_1_007}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    FlushLogbyCommandName    ${NameCommandFileLog_Deactivate}    TST_F12_1_007    ${PathLog5gmodeservicedeactivation}

TST_F12_0_000
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCommandFileLog_Deactivate}    ${PathLog5gmodeservicedeactivation}
    #Set AC Response
    SetMockupResponse    ${PathConfigACResponse}    ${PathDataACResponse_TST_F12_0_000}
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    #produce คำสั่ง ลง kafka
    ProduceKafka    ${delete_qa.5GModeDeactivated}    ${Produce_qa.deactivate5GMode}    ${DataProduce_TST_F12_0_000}
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    #Consume คำสั่ง ลง kafka
    Sleep    5s
    ${ConsumeResult}    ConsumeKafka    ${Consume_qa.5GModeDeactivated}    TST_F12_0_000
    log    ${ConsumeResult}
    # check ค่า
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_TST_F12_0_000}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    FlushLogbyCommandName    ${NameCommandFileLog_Deactivate}    TST_F12_0_000    ${PathLog5gmodeservicedeactivation}

TST_F12_0_001
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCommandFileLog_Deactivate}    ${PathLog5gmodeservicedeactivation}
    #Set AC Response
    SetMockupResponse    ${PathConfigACResponse}    ${PathDataACResponse_TST_F12_0_001}
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    #produce คำสั่ง ลง kafka
    ProduceKafka    ${delete_qa.5GModeDeactivated}    ${Produce_qa.deactivate5GMode}    ${DataProduce_TST_F12_0_001}
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    #Consume คำสั่ง ลง kafka
    Sleep    5s
    ${ConsumeResult}    ConsumeKafka    ${Consume_qa.5GModeDeactivated}    TST_F12_0_001
    log    ${ConsumeResult}
    # check ค่า
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_TST_F12_0_001}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    FlushLogbyCommandName    ${NameCommandFileLog_Deactivate}    TST_F12_0_001    ${PathLog5gmodeservicedeactivation}

TST_F12_0_002
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCommandFileLog_Deactivate}    ${PathLog5gmodeservicedeactivation}
    #Set AC Response
    SetMockupResponse    ${PathConfigACResponse}    ${PathDataACResponse_TST_F12_0_002}
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    #produce คำสั่ง ลง kafka
    ProduceKafka    ${delete_qa.5GModeDeactivated}    ${Produce_qa.deactivate5GMode}    ${DataProduce_TST_F12_0_002}
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    #Consume คำสั่ง ลง kafka
    Sleep    5s
    ${ConsumeResult}    ConsumeKafka    ${Consume_qa.5GModeDeactivated}    TST_F12_0_002
    log    ${ConsumeResult}
    # check ค่า
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_TST_F12_0_002}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    FlushLogbyCommandName    ${NameCommandFileLog_Deactivate}    TST_F12_0_002    ${PathLog5gmodeservicedeactivation}
