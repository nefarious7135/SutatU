*** Settings ***
Resource          Variable.robot
Resource          ../../Keyword/Common.robot
Resource          ../../Keyword/MongoDB.robot
Resource          ../../Keyword/SecureCRT.robot
Resource          ../../Valiables/CommonValiable/CommonValiable.robot
*** Test Cases ***
TST_F14_1_1_001
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_New}    ${PathLogGetMobileNetwork_New}
    #แก้ conf
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    ${path_getKids-new}    BuiltIn.Set Variable    /home/serveradm/http_mockup/configs/response/getKids-new
    ${file_getKids_default}    BuiltIn.Set Variable    default.json
    ${file_getKids_000}    BuiltIn.Set Variable    default_000.json  
    ${file_getKids_TST_F14_1_1_001}    BuiltIn.Set Variable    TST_F14_1_1_001.json
    ${pwd}    SSHLibrary.Execute Command    pwd
    SSHLibrary.Execute Command    cp ${path_getKids-new}/${file_getKids_TST_F14_1_1_001} ${path_getKids-new}/${file_getKids_default}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_new.getMobileNetwork}    ${CmdProduce_new.getMobileNetwork}    ${DataProduce_TST_F14_1_1_001}
    #Consume คำสั่ง ลง kafka.requestNetworkStatus
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_new.getMobileNetwork}    TST_F14_1_1_001
    # check ค่า \ \ \ kafka.requestNetworkStatus
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_new.getMobileNetworkRequested_TST_F14_1_1_001}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCommandFileLog_New}    TST_F14_1_1_001    ${PathLogGetMobileNetwork_New}
    #set mock-up ของ get kids กลับไปเป็น default
    SSHLibrary.Execute Command    cp ${path_getKids-new}/${file_getKids_000} ${path_getKids-new}/${file_getKids_default}

TST_F14_1_1_002
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_New}    ${PathLogGetMobileNetwork_New}
    #แก้ conf
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    ${path_getKids-new}    BuiltIn.Set Variable    /home/serveradm/http_mockup/configs/response/getKids-new
    ${file_getKids_default}    BuiltIn.Set Variable    default.json
    ${file_getKids_000}    BuiltIn.Set Variable    default_000.json  
    ${file_getKids_TST_F14_1_1_002}    BuiltIn.Set Variable    TST_F14_1_1_002.json
    ${pwd}    SSHLibrary.Execute Command    pwd
    SSHLibrary.Execute Command    cp ${path_getKids-new}/${file_getKids_TST_F14_1_1_002} ${path_getKids-new}/${file_getKids_default}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_new.getMobileNetwork}    ${CmdProduce_new.getMobileNetwork}    ${DataProduce_TST_F14_1_1_002}
    #Consume คำสั่ง ลง kafka.requestNetworkStatus
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_new.getMobileNetwork}    TST_F14_1_1_002
    # check ค่า \ \ \ kafka.requestNetworkStatus
    Log    ${ConsumeResult}
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_new.getMobileNetworkRequested_TST_F14_1_1_002}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCommandFileLog_New}    TST_F14_1_1_002    ${PathLogGetMobileNetwork_New}
    #set mock-up ของ get kids กลับไปเป็น default
    SSHLibrary.Execute Command    cp ${path_getKids-new}/${file_getKids_000} ${path_getKids-new}/${file_getKids_default}

TST_F14_1_1_003
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_New}    ${PathLogGetMobileNetwork_New}
    #แก้ conf
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    ${path_getKids-new}    BuiltIn.Set Variable    /home/serveradm/http_mockup/configs/response/getKids-new
    ${file_getKids_default}    BuiltIn.Set Variable    default.json
    ${file_getKids_000}    BuiltIn.Set Variable    default_000.json  
    ${file_getKids_TST_F14_1_1_003}    BuiltIn.Set Variable    TST_F14_1_1_003.json
    ${pwd}    SSHLibrary.Execute Command    pwd
    SSHLibrary.Execute Command    cp ${path_getKids-new}/${file_getKids_TST_F14_1_1_003} ${path_getKids-new}/${file_getKids_default}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_new.getMobileNetwork}    ${CmdProduce_new.getMobileNetwork}    ${DataProduce_TST_F14_1_1_003}
    #Consume คำสั่ง ลง kafka.requestNetworkStatus
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_new.getMobileNetwork}    TST_F14_1_1_003
    # check ค่า \ \ \ kafka.requestNetworkStatus
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_new.getMobileNetworkRequested_TST_F14_1_1_003}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCommandFileLog_New}    TST_F14_1_1_003    ${PathLogGetMobileNetwork_New}
    #set mock-up ของ get kids กลับไปเป็น default
    SSHLibrary.Execute Command    cp ${path_getKids-new}/${file_getKids_000} ${path_getKids-new}/${file_getKids_default}

TST_F14_1_1_004
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_New}    ${PathLogGetMobileNetwork_New}
    #แก้ conf
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    ${path_getKids-new}    BuiltIn.Set Variable    /home/serveradm/http_mockup/configs/response/getKids-new
    ${file_getKids_default}    BuiltIn.Set Variable    default.json
    ${file_getKids_000}    BuiltIn.Set Variable    default_000.json  
    ${file_getKids_TST_F14_1_1_004}    BuiltIn.Set Variable    TST_F14_1_1_004.json
    ${pwd}    SSHLibrary.Execute Command    pwd
    SSHLibrary.Execute Command    cp ${path_getKids-new}/${file_getKids_TST_F14_1_1_004} ${path_getKids-new}/${file_getKids_default}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_new.getMobileNetwork}    ${CmdProduce_new.getMobileNetwork}    ${DataProduce_TST_F14_1_1_004}
    #Consume คำสั่ง ลง kafka.requestNetworkStatus
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_new.getMobileNetwork}    TST_F14_1_1_004
    # check ค่า \ \ \ kafka.requestNetworkStatus
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_new.getMobileNetworkRequested_TST_F14_1_1_004}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCommandFileLog_New}    TST_F14_1_1_004    ${PathLogGetMobileNetwork_New}
    #set mock-up ของ get kids กลับไปเป็น default
    SSHLibrary.Execute Command    cp ${path_getKids-new}/${file_getKids_000} ${path_getKids-new}/${file_getKids_default}

TST_F14_0_1_005
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_New}    ${PathLogGetMobileNetwork_New}
    #แก้ conf
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    ${path_getKids-new}    BuiltIn.Set Variable    /home/serveradm/http_mockup/configs/response/getKids-new
    ${file_getKids_default}    BuiltIn.Set Variable    default.json
    ${file_getKids_000}    BuiltIn.Set Variable    default_000.json  
    ${file_getKids_TST_F14_0_1_005}    BuiltIn.Set Variable    TST_F14_0_1_005.json
    ${pwd}    SSHLibrary.Execute Command    pwd
    SSHLibrary.Execute Command    cp ${path_getKids-new}/${file_getKids_TST_F14_0_1_005} ${path_getKids-new}/${file_getKids_default}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_new.getMobileNetwork}    ${CmdProduce_new.getMobileNetwork}    ${DataProduce_TST_F14_0_1_005}
    #Consume คำสั่ง ลง kafka.requestNetworkStatus
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_new.getMobileNetwork}    TST_F14_0_1_005
    # check ค่า \ \ \ kafka.requestNetworkStatus
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_new.getMobileNetworkRequested_TST_F14_0_1_005}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCommandFileLog_New}    TST_F14_0_1_005    ${PathLogGetMobileNetwork_New}
    #set mock-up ของ get kids กลับไปเป็น default
    SSHLibrary.Execute Command    cp ${path_getKids-new}/${file_getKids_000} ${path_getKids-new}/${file_getKids_default}

TST_F14_0_1_006
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_New}    ${PathLogGetMobileNetwork_New}
    #แก้ conf
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    ${path_getKids-new}    BuiltIn.Set Variable    /home/serveradm/http_mockup/configs/response/getKids-new
    ${file_getKids_default}    BuiltIn.Set Variable    default.json
    ${file_getKids_000}    BuiltIn.Set Variable    default_000.json  
    ${file_getKids_TST_F14_0_1_006}    BuiltIn.Set Variable    TST_F14_0_1_006.json
    ${pwd}    SSHLibrary.Execute Command    pwd
    SSHLibrary.Execute Command    cp ${path_getKids-new}/${file_getKids_TST_F14_0_1_006} ${path_getKids-new}/${file_getKids_default}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_new.getMobileNetwork}    ${CmdProduce_new.getMobileNetwork}    ${DataProduce_TST_F14_0_1_006}
    #Consume คำสั่ง ลง kafka.requestNetworkStatus
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_new.getMobileNetwork}    TST_F14_0_1_006
    # check ค่า \ \ \ kafka.requestNetworkStatus
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_new.getMobileNetworkRequested_TST_F14_0_1_006}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCommandFileLog_New}    TST_F14_0_1_006    ${PathLogGetMobileNetwork_New}
    #set mock-up ของ get kids กลับไปเป็น default
    SSHLibrary.Execute Command    cp ${path_getKids-new}/${file_getKids_000} ${path_getKids-new}/${file_getKids_default}

TST_F14_0_1_007
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_New}    ${PathLogGetMobileNetwork_New}
    #แก้ conf
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    ${path_getKids-new}    BuiltIn.Set Variable    /home/serveradm/http_mockup/configs/response/getKids-new
    ${file_getKids_default}    BuiltIn.Set Variable    default.json
    ${file_getKids_000}    BuiltIn.Set Variable    default_000.json  
    ${file_getKids_TST_F14_0_1_007}    BuiltIn.Set Variable    TST_F14_0_1_007.json
    ${pwd}    SSHLibrary.Execute Command    pwd
    SSHLibrary.Execute Command    cp ${path_getKids-new}/${file_getKids_TST_F14_0_1_007} ${path_getKids-new}/${file_getKids_default}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_new.getMobileNetwork}    ${CmdProduce_new.getMobileNetwork}    ${DataProduce_TST_F14_0_1_007}
    #Consume คำสั่ง ลง kafka.requestNetworkStatus
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_new.getMobileNetwork}    TST_F14_0_1_007
    # check ค่า \ \ \ kafka.requestNetworkStatus
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_new.getMobileNetworkRequested_TST_F14_0_1_007}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCommandFileLog_New}    TST_F14_0_1_007    ${PathLogGetMobileNetwork_New}
    #set mock-up ของ get kids กลับไปเป็น default
    SSHLibrary.Execute Command    cp ${path_getKids-new}/${file_getKids_000} ${path_getKids-new}/${file_getKids_default}

TST_F14_0_1_008
    # set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_New}    ${PathLogGetMobileNetwork_New}
    #แก้ conf
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    ${path_aisPhoneNumber-new}    BuiltIn.Set Variable    /home/serveradm/http_mockup/configs/response/aisPhoneNumber-new
    ${file_aisPhoneNumber_default}    BuiltIn.Set Variable    default.json
    ${file_aisPhoneNumber_000}    BuiltIn.Set Variable    default_000.json  
    ${file_aisPhoneNumber_TST_F14_0_1_008}    BuiltIn.Set Variable    TST_F14_0_1_008.json
    ${pwd}    SSHLibrary.Execute Command    pwd
    SSHLibrary.Execute Command    cp ${path_aisPhoneNumber-new}/${file_aisPhoneNumber_TST_F14_0_1_008} ${path_aisPhoneNumber-new}/${file_aisPhoneNumber_default}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_new.getMobileNetwork}    ${CmdProduce_new.getMobileNetwork}    ${DataProduce_TST_F14_0_1_008}
    #Consume คำสั่ง ลง kafka.requestNetworkStatus
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_new.getMobileNetwork}    TST_F14_0_1_008
    # check ค่า \ \ \ kafka.requestNetworkStatus
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_new.getMobileNetworkRequested_TST_F14_0_1_008}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCommandFileLog_New}    TST_F14_0_1_008    ${PathLogGetMobileNetwork_New}
    #set mock-up ของ get kids กลับไปเป็น default
    SSHLibrary.Execute Command    cp ${path_aisPhoneNumber-new}/${file_aisPhoneNumber_000} ${path_aisPhoneNumber-new}/${file_aisPhoneNumber_default}
TST_F14_0_1_009
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_New}    ${PathLogGetMobileNetwork_New}
    #แก้ conf
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    ${path_aisPhoneNumber-new}    BuiltIn.Set Variable    /home/serveradm/http_mockup/configs/response/aisPhoneNumber-new
    ${file_aisPhoneNumber_default}    BuiltIn.Set Variable    default.json
    ${file_aisPhoneNumber_000}    BuiltIn.Set Variable    default_000.json  
    ${file_aisPhoneNumber_TST_F14_0_1_009}    BuiltIn.Set Variable    TST_F14_0_1_009.json
    ${pwd}    SSHLibrary.Execute Command    pwd
    SSHLibrary.Execute Command    cp ${path_aisPhoneNumber-new}/${file_aisPhoneNumber_TST_F14_0_1_009} ${path_aisPhoneNumber-new}/${file_aisPhoneNumber_default}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_new.getMobileNetwork}    ${CmdProduce_new.getMobileNetwork}    ${DataProduce_TST_F14_0_1_009}
    #Consume คำสั่ง ลง kafka.requestNetworkStatus
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_new.getMobileNetwork}    TST_F14_0_1_009
    # check ค่า \ \ \ kafka.requestNetworkStatus
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_new.getMobileNetworkRequested_TST_F14_0_1_009}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCommandFileLog_New}    TST_F14_0_1_009    ${PathLogGetMobileNetwork_New}
    #set mock-up ของ get kids กลับไปเป็น default
    SSHLibrary.Execute Command    cp ${path_aisPhoneNumber-new}/${file_aisPhoneNumber_000} ${path_aisPhoneNumber-new}/${file_aisPhoneNumber_default}
TST_F14_0_1_020
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_New}    ${PathLogGetMobileNetwork_New}
    #แก้ conf
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    ${path_aisPhoneNumber-new}    BuiltIn.Set Variable    /home/serveradm/http_mockup/configs/response/aisPhoneNumber-new
    ${file_aisPhoneNumber_default}    BuiltIn.Set Variable    default.json
    ${file_aisPhoneNumber_000}    BuiltIn.Set Variable    default_000.json  
    ${file_aisPhoneNumber_TST_F14_0_1_020}    BuiltIn.Set Variable    TST_F14_0_1_020.json
    ${pwd}    SSHLibrary.Execute Command    pwd
    SSHLibrary.Execute Command    cp ${path_aisPhoneNumber-new}/${file_aisPhoneNumber_TST_F14_0_1_020} ${path_aisPhoneNumber-new}/${file_aisPhoneNumber_default}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_new.getMobileNetwork}    ${CmdProduce_new.getMobileNetwork}    ${DataProduce_TST_F14_0_1_020}
    #Consume คำสั่ง ลง kafka.requestNetworkStatus
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_new.getMobileNetwork}    TST_F14_0_1_020
    # check ค่า \ \ \ kafka.requestNetworkStatus
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_new.getMobileNetworkRequested_TST_F14_0_1_020}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCommandFileLog_New}    TST_F14_0_1_020    ${PathLogGetMobileNetwork_New}
    #set mock-up ของ get kids กลับไปเป็น default
    SSHLibrary.Execute Command    cp ${path_aisPhoneNumber-new}/${file_aisPhoneNumber_000} ${path_aisPhoneNumber-new}/${file_aisPhoneNumber_default}
TST_F14_0_1_021
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_New}    ${PathLogGetMobileNetwork_New}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_new.getMobileNetwork}    ${CmdProduce_new.getMobileNetwork}    ${DataProduce_TST_F14_0_1_021}
    #Consume คำสั่ง ลง kafka.requestNetworkStatus
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_new.getMobileNetwork}    TST_F14_0_1_021
    # check ค่า \ \ \ kafka.requestNetworkStatus
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_new.getMobileNetworkRequested_TST_F14_0_1_021}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCommandFileLog_New}    TST_F14_0_1_021    ${PathLogGetMobileNetwork_New}

TST_F14_0_1_022
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_New}    ${PathLogGetMobileNetwork_New}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_new.getMobileNetwork}    ${CmdProduce_new.getMobileNetwork}    ${DataProduce_TST_F14_0_1_022}
    #Consume คำสั่ง ลง kafka.requestNetworkStatus
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_new.getMobileNetwork}    TST_F14_0_1_022
    # check ค่า \ \ \ kafka.requestNetworkStatus
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_new.getMobileNetworkRequested_TST_F14_0_1_022}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCommandFileLog_New}    TST_F14_0_1_022    ${PathLogGetMobileNetwork_New}
    
TST_F14_0_1_023
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_New}    ${PathLogGetMobileNetwork_New}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_new.getMobileNetwork}    ${CmdProduce_new.getMobileNetwork}    ${DataProduce_TST_F14_0_1_023}
    #Consume คำสั่ง ลง kafka.requestNetworkStatus
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_new.getMobileNetwork}    TST_F14_0_1_023
    # check ค่า \ \ \ kafka.requestNetworkStatus
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_new.getMobileNetworkRequested_TST_F14_0_1_023}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCommandFileLog_New}    TST_F14_0_1_023    ${PathLogGetMobileNetwork_New}

TST_F14_1_1_024
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_New}    ${PathLogGetMobileNetwork_New}
    #แก้ conf
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    ${path_wellKnown-new}    BuiltIn.Set Variable    /home/serveradm/http_mockup/configs/response/well-known-new
    ${file_wellKnown_default}    BuiltIn.Set Variable    default.json
    ${file_wellKnown_000}    BuiltIn.Set Variable    default_000.json  
    ${file_wellKnown_TST_F14_1_1_024}    BuiltIn.Set Variable    TST_F14_1_1_024.json
    ${pwd}    SSHLibrary.Execute Command    pwd
    SSHLibrary.Execute Command    cp ${path_wellKnown-new}/${file_wellKnown_TST_F14_1_1_024} ${path_wellKnown-new}/${file_wellKnown_default}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_new.getMobileNetwork}    ${CmdProduce_new.getMobileNetwork}    ${DataProduce_TST_F14_1_1_024}
    #Consume คำสั่ง ลง kafka.requestNetworkStatus
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_new.getMobileNetwork}    TST_F14_1_1_024
    # check ค่า \ \ \ kafka.requestNetworkStatus
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_new.getMobileNetworkRequested_TST_F14_1_1_024}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCommandFileLog_New}    TST_F14_1_1_024    ${PathLogGetMobileNetwork_New}
    SSHLibrary.Execute Command    cp ${path_wellKnown-new}/${file_wellKnown_000} ${path_wellKnown-new}/${file_wellKnown_default}


TST_F14_0_1_040
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog}    ${PathLogGetMobileNetwork_qa}
    #แก้ conf
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    ${path_aisPhoneNumber}    BuiltIn.Set Variable    /home/serveradm/http_mockup/configs/response/aisPhoneNumber
    ${file_aisPhoneNumber_default}    BuiltIn.Set Variable    default.json
    ${file_aisPhoneNumber_000}    BuiltIn.Set Variable    default_000.json
    ${file_aisPhoneNumber_TST_F14_0_1_040}    BuiltIn.Set Variable    TST_F14_0_1_040.json
    ${pwd}    SSHLibrary.Execute Command    pwd
    SSHLibrary.Execute Command    cp ${path_aisPhoneNumber}/${file_aisPhoneNumber_TST_F14_0_1_040} ${path_aisPhoneNumber}/${file_aisPhoneNumber_default}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_qa.getMobileNetwork}    ${CmdProduce_qa.getMobileNetwork}    ${DataProduce_TST_F14_0_1_040}
    #Consume คำสั่ง ลง kafka.requestNetworkStatus
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_qa.getMobileNetwork}    TST_F14_0_1_040
    # check ค่า \ \ \ kafka.requestNetworkStatus
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_qa.getMobileNetworkRequested_TST_F14_0_1_040}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCommandFileLog}    TST_F14_0_1_040    ${PathLogGetMobileNetwork_qa}
    SSHLibrary.Execute Command    cp ${path_aisPhoneNumber}/${file_aisPhoneNumber_000} ${path_aisPhoneNumber}/${file_aisPhoneNumber_default}


TST_F14_0_1_041
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog}    ${PathLogGetMobileNetwork_qa}
    #แก้ conf
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    ${path_aisPhoneNumber}    BuiltIn.Set Variable    /home/serveradm/http_mockup/configs/response/aisPhoneNumber
    ${file_aisPhoneNumber_default}    BuiltIn.Set Variable    default.json
    ${file_aisPhoneNumber_000}    BuiltIn.Set Variable    default_000.json
    ${file_aisPhoneNumber_TST_F14_0_1_041}    BuiltIn.Set Variable    TST_F14_0_1_041.json
    ${pwd}    SSHLibrary.Execute Command    pwd
    SSHLibrary.Execute Command    cp ${path_aisPhoneNumber}/${file_aisPhoneNumber_TST_F14_0_1_041} ${path_aisPhoneNumber}/${file_aisPhoneNumber_default}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_qa.getMobileNetwork}    ${CmdProduce_qa.getMobileNetwork}    ${DataProduce_TST_F14_0_1_041}
    #Consume คำสั่ง ลง kafka.requestNetworkStatus
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_qa.getMobileNetwork}    TST_F14_0_1_041
    # check ค่า \ \ \ kafka.requestNetworkStatus
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_qa.getMobileNetworkRequested_TST_F14_0_1_041}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCommandFileLog}    TST_F14_0_1_041    ${PathLogGetMobileNetwork_qa}
    SSHLibrary.Execute Command    cp ${path_aisPhoneNumber}/${file_aisPhoneNumber_000} ${path_aisPhoneNumber}/${file_aisPhoneNumber_default}


TST_F14_0_1_042
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog}    ${PathLogGetMobileNetwork_qa}
    #แก้ conf
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    ${path_aisPhoneNumber}    BuiltIn.Set Variable    /home/serveradm/http_mockup/configs/response/aisPhoneNumber
    ${file_aisPhoneNumber_default}    BuiltIn.Set Variable    default.json
    ${file_aisPhoneNumber_000}    BuiltIn.Set Variable    default_000.json
    ${file_aisPhoneNumber_TST_F14_0_1_042}    BuiltIn.Set Variable    TST_F14_0_1_042.json
    ${pwd}    SSHLibrary.Execute Command    pwd
    SSHLibrary.Execute Command    cp ${path_aisPhoneNumber}/${file_aisPhoneNumber_TST_F14_0_1_042} ${path_aisPhoneNumber}/${file_aisPhoneNumber_default}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_qa.getMobileNetwork}    ${CmdProduce_qa.getMobileNetwork}    ${DataProduce_TST_F14_0_1_042}
    #Consume คำสั่ง ลง kafka.requestNetworkStatus
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_qa.getMobileNetwork}    TST_F14_0_1_042
    # check ค่า \ \ \ kafka.requestNetworkStatus
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_qa.getMobileNetworkRequested_TST_F14_0_1_042}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCommandFileLog}    TST_F14_0_1_042    ${PathLogGetMobileNetwork_qa}
    SSHLibrary.Execute Command    cp ${path_aisPhoneNumber}/${file_aisPhoneNumber_000} ${path_aisPhoneNumber}/${file_aisPhoneNumber_default}


TST_F14_0_1_043
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog}    ${PathLogGetMobileNetwork_qa}
    #แก้ conf
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    ${path_aisPhoneNumber}    BuiltIn.Set Variable    /home/serveradm/http_mockup/configs/response/aisPhoneNumber
    ${file_aisPhoneNumber_default}    BuiltIn.Set Variable    default.json
    ${file_aisPhoneNumber_000}    BuiltIn.Set Variable    default_000.json
    ${file_aisPhoneNumber_TST_F14_0_1_043}    BuiltIn.Set Variable    TST_F14_0_1_043.json
    ${pwd}    SSHLibrary.Execute Command    pwd
    SSHLibrary.Execute Command    cp ${path_aisPhoneNumber}/${file_aisPhoneNumber_TST_F14_0_1_043} ${path_aisPhoneNumber}/${file_aisPhoneNumber_default}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_qa.getMobileNetwork}    ${CmdProduce_qa.getMobileNetwork}    ${DataProduce_TST_F14_0_1_043}
    #Consume คำสั่ง ลง kafka.requestNetworkStatus
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_qa.getMobileNetwork}    TST_F14_0_1_043
    # check ค่า \ \ \ kafka.requestNetworkStatus
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_qa.getMobileNetworkRequested_TST_F14_0_1_043}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCommandFileLog}    TST_F14_0_1_043    ${PathLogGetMobileNetwork_qa}
    SSHLibrary.Execute Command    cp ${path_aisPhoneNumber}/${file_aisPhoneNumber_000} ${path_aisPhoneNumber}/${file_aisPhoneNumber_default}


TST_F14_0_1_044
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog}    ${PathLogGetMobileNetwork_qa}
    #แก้ conf
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    ${path_aisPhoneNumber}    BuiltIn.Set Variable    /home/serveradm/http_mockup/configs/response/aisPhoneNumber
    ${file_aisPhoneNumber_default}    BuiltIn.Set Variable    default.json
    ${file_aisPhoneNumber_000}    BuiltIn.Set Variable    default_000.json
    ${file_aisPhoneNumber_TST_F14_0_1_044}    BuiltIn.Set Variable    TST_F14_0_1_044.json
    ${pwd}    SSHLibrary.Execute Command    pwd
    SSHLibrary.Execute Command    cp ${path_aisPhoneNumber}/${file_aisPhoneNumber_TST_F14_0_1_044} ${path_aisPhoneNumber}/${file_aisPhoneNumber_default}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_qa.getMobileNetwork}    ${CmdProduce_qa.getMobileNetwork}    ${DataProduce_TST_F14_0_1_044}
    #Consume คำสั่ง ลง kafka.requestNetworkStatus
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_qa.getMobileNetwork}    TST_F14_0_1_044
    # check ค่า \ \ \ kafka.requestNetworkStatus
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_qa.getMobileNetworkRequested_TST_F14_0_1_044}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCommandFileLog}    TST_F14_0_1_044    ${PathLogGetMobileNetwork_qa}
    SSHLibrary.Execute Command    cp ${path_aisPhoneNumber}/${file_aisPhoneNumber_000} ${path_aisPhoneNumber}/${file_aisPhoneNumber_default}


TST_F14_0_1_045
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_au}    ${PathLogGetMobileNetwork_au}
    #แก้ conf
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    ${path_wellKnown-au}    BuiltIn.Set Variable    /home/serveradm/http_mockup/configs/response/aisPhoneNumber-au
    ${file_wellKnown_default}    BuiltIn.Set Variable    default.json
    ${file_wellKnown_000}    BuiltIn.Set Variable    default_000.json
    ${file_wellKnown_TST_F14_0_1_045}    BuiltIn.Set Variable    TST_F14_0_1_045.json
    ${pwd}    SSHLibrary.Execute Command    pwd
    SSHLibrary.Execute Command    cp ${path_wellKnown-au}/${file_wellKnown_TST_F14_0_1_045} ${path_wellKnown-au}/${file_wellKnown_default}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_au.getMobileNetwork}    ${CmdProduce_au.getMobileNetwork}    ${DataProduce_TST_F14_0_1_045}
    #Consume คำสั่ง ลง kafka.requestNetworkStatus
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_au.getMobileNetwork}    TST_F14_0_1_045
    # check ค่า \ \ \ kafka.requestNetworkStatus
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_ball.getMobileNetworkRequested_TST_F14_0_1_045}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCommandFileLog_au}    TST_F14_0_1_045    ${PathLogGetMobileNetwork_au}
    SSHLibrary.Execute Command    cp ${path_wellKnown-au}/${file_wellKnown_000} ${path_wellKnown-au}/${file_wellKnown_default}

TST_F14_0_1_047
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_au}    ${PathLogGetMobileNetwork_au}
    #แก้ conf
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    ${path_wellKnown-au}    BuiltIn.Set Variable    /home/serveradm/http_mockup/configs/response/aisPhoneNumber-au
    ${file_wellKnown_default}    BuiltIn.Set Variable    default.json
    ${file_wellKnown_000}    BuiltIn.Set Variable    default_000.json
    ${file_wellKnown_TST_F14_0_1_047}    BuiltIn.Set Variable    TST_F14_0_1_047.json
    ${pwd}    SSHLibrary.Execute Command    pwd
    SSHLibrary.Execute Command    cp ${path_wellKnown-au}/${file_wellKnown_TST_F14_0_1_047} ${path_wellKnown-au}/${file_wellKnown_default}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_au.getMobileNetwork}    ${CmdProduce_au.getMobileNetwork}    ${DataProduce_TST_F14_0_1_047}
    #Consume คำสั่ง ลง kafka.requestNetworkStatus
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_au.getMobileNetwork}    TST_F14_0_1_047
    # check ค่า \ \ \ kafka.requestNetworkStatus
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_ball.getMobileNetworkRequested_TST_F14_0_1_047}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCommandFileLog_au}    TST_F14_0_1_047    ${PathLogGetMobileNetwork_au}
    SSHLibrary.Execute Command    cp ${path_wellKnown-au}/${file_wellKnown_000} ${path_wellKnown-au}/${file_wellKnown_default}

TST_F14_1_1_048
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_au}    ${PathLogGetMobileNetwork_au}
    #แก้ conf
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    ${path_wellKnown-au}    BuiltIn.Set Variable    /home/serveradm/http_mockup/configs/response/aisPhoneNumber-au
    ${file_wellKnown_default}    BuiltIn.Set Variable    default.json
    ${file_wellKnown_000}    BuiltIn.Set Variable    default_000.json
    ${file_wellKnown_TST_F14_1_1_048}    BuiltIn.Set Variable    TST_F14_1_1_048.json
    ${pwd}    SSHLibrary.Execute Command    pwd
    SSHLibrary.Execute Command    cp ${path_wellKnown-au}/${file_wellKnown_TST_F14_1_1_048} ${path_wellKnown-au}/${file_wellKnown_default}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_au.getMobileNetwork}    ${CmdProduce_au.getMobileNetwork}    ${DataProduce_TST_F14_1_1_048}
    #Consume คำสั่ง ลง kafka.requestNetworkStatus
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_au.getMobileNetwork}    TST_F14_1_1_048
    # check ค่า \ \ \ kafka.requestNetworkStatus
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_ball.getMobileNetworkRequested_TST_F14_1_1_048}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCommandFileLog_au}    TST_F14_1_1_048    ${PathLogGetMobileNetwork_au}
    SSHLibrary.Execute Command    cp ${path_wellKnown-au}/${file_wellKnown_000} ${path_wellKnown-au}/${file_wellKnown_default}

TST_F14_0_1_050
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_au}    ${PathLogGetMobileNetwork_au}
    #แก้ conf
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    ${path_wellKnown-au}    BuiltIn.Set Variable    /home/serveradm/http_mockup/configs/response/aisPhoneNumber-au
    ${file_wellKnown_default}    BuiltIn.Set Variable    default.json 
    ${file_wellKnown_000}    BuiltIn.Set Variable    default_000.json
    ${file_wellKnown_TST_F14_0_1_050}    BuiltIn.Set Variable    TST_F14_0_1_050.json
    ${pwd}    SSHLibrary.Execute Command    pwd
    SSHLibrary.Execute Command    cp ${path_wellKnown-au}/${file_wellKnown_TST_F14_0_1_050} ${path_wellKnown-au}/${file_wellKnown_default}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_au.getMobileNetwork}    ${CmdProduce_au.getMobileNetwork}    ${DataProduce_TST_F14_0_1_050}
    #Consume คำสั่ง ลง kafka.requestNetworkStatus
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_au.getMobileNetwork}    TST_F14_0_1_050
    # check ค่า \ \ \ kafka.requestNetworkStatus
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_ball.getMobileNetworkRequested_TST_F14_0_1_050}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCommandFileLog_au}    TST_F14_0_1_050    ${PathLogGetMobileNetwork_au}
    SSHLibrary.Execute Command    cp ${path_wellKnown-au}/${file_wellKnown_000} ${path_wellKnown-au}/${file_wellKnown_default}

TST_F14_1_1_051
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_au}    ${PathLogGetMobileNetwork_au}
    #แก้ conf
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    ${path_wellKnown-au}    BuiltIn.Set Variable    /home/serveradm/http_mockup/configs/response/aisPhoneNumber-au
    ${file_wellKnown_default}    BuiltIn.Set Variable    default.json
    ${file_wellKnown_000}    BuiltIn.Set Variable    default_000.json
    ${file_wellKnown_TST_F14_1_1_051}    BuiltIn.Set Variable    TST_F14_1_1_051.json
    ${pwd}    SSHLibrary.Execute Command    pwd
    SSHLibrary.Execute Command    cp ${path_wellKnown-au}/${file_wellKnown_TST_F14_1_1_051} ${path_wellKnown-au}/${file_wellKnown_default}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_au.getMobileNetwork}    ${CmdProduce_au.getMobileNetwork}    ${DataProduce_TST_F14_1_1_051}
    #Consume คำสั่ง ลง kafka.requestNetworkStatus
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_au.getMobileNetwork}    TST_F14_1_1_051
    # check ค่า \ \ \ kafka.requestNetworkStatus
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_ball.getMobileNetworkRequested_TST_F14_1_1_051}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCommandFileLog_au}    TST_F14_1_1_051    ${PathLogGetMobileNetwork_au}
    SSHLibrary.Execute Command    cp ${path_wellKnown-au}/${file_wellKnown_000} ${path_wellKnown-au}/${file_wellKnown_default}
    
TST_F14_1_1_052
    # set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_New}    ${PathLogGetMobileNetwork_New}
    #แก้ conf
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    ${path_aisPhoneNumber-new}    BuiltIn.Set Variable    /home/serveradm/http_mockup/configs/response/aisPhoneNumber-new
    ${file_aisPhoneNumber_default}    BuiltIn.Set Variable    default.json
    ${file_aisPhoneNumber_000}    BuiltIn.Set Variable    default_000.json  
    ${file_aisPhoneNumber_TST_F14_1_1_052}    BuiltIn.Set Variable    TST_F14_1_1_052.json
    ${pwd}    SSHLibrary.Execute Command    pwd
    SSHLibrary.Execute Command    cp ${path_aisPhoneNumber-new}/${file_aisPhoneNumber_TST_F14_1_1_052} ${path_aisPhoneNumber-new}/${file_aisPhoneNumber_default}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_new.getMobileNetwork}    ${CmdProduce_new.getMobileNetwork}    ${DataProduce_TST_F14_1_1_052}
    #Consume คำสั่ง ลง kafka.requestNetworkStatus
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_new.getMobileNetwork}    TST_F14_1_1_052
    # check ค่า \ \ \ kafka.requestNetworkStatus
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_new.getMobileNetworkRequested_TST_F14_1_1_052}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCommandFileLog_New}    TST_F14_1_1_052    ${PathLogGetMobileNetwork_New}
    #set mock-up ของ get kids กลับไปเป็น default
    SSHLibrary.Execute Command    cp ${path_aisPhoneNumber-new}/${file_aisPhoneNumber_000} ${path_aisPhoneNumber-new}/${file_aisPhoneNumber_default}

TST_F14_1_1_053
    # set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_New}    ${PathLogGetMobileNetwork_New}
    #แก้ conf
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    ${path_aisPhoneNumber-new}    BuiltIn.Set Variable    /home/serveradm/http_mockup/configs/response/aisPhoneNumber-new
    ${file_aisPhoneNumber_default}    BuiltIn.Set Variable    default.json
    ${file_aisPhoneNumber_000}    BuiltIn.Set Variable    default_000.json  
    ${file_aisPhoneNumber_TST_F14_1_1_053}    BuiltIn.Set Variable    TST_F14_1_1_053.json
    ${pwd}    SSHLibrary.Execute Command    pwd
    SSHLibrary.Execute Command    cp ${path_aisPhoneNumber-new}/${file_aisPhoneNumber_TST_F14_1_1_053} ${path_aisPhoneNumber-new}/${file_aisPhoneNumber_default}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_new.getMobileNetwork}    ${CmdProduce_new.getMobileNetwork}    ${DataProduce_TST_F14_1_1_053}
    #Consume คำสั่ง ลง kafka.requestNetworkStatus
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_new.getMobileNetwork}    TST_F14_1_1_053
    # check ค่า \ \ \ kafka.requestNetworkStatus
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_new.getMobileNetworkRequested_TST_F14_1_1_053}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCommandFileLog_New}    TST_F14_1_1_053    ${PathLogGetMobileNetwork_New}
    #set mock-up ของ get kids กลับไปเป็น default
    SSHLibrary.Execute Command    cp ${path_aisPhoneNumber-new}/${file_aisPhoneNumber_000} ${path_aisPhoneNumber-new}/${file_aisPhoneNumber_default}

TST_F14_1_1_054
    # set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_New}    ${PathLogGetMobileNetwork_New}
    #แก้ conf
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    ${path_aisPhoneNumber-new}    BuiltIn.Set Variable    /home/serveradm/http_mockup/configs/response/aisPhoneNumber-new
    ${file_aisPhoneNumber_default}    BuiltIn.Set Variable    default.json
    ${file_aisPhoneNumber_000}    BuiltIn.Set Variable    default_000.json  
    ${file_aisPhoneNumber_TST_F14_1_1_054}    BuiltIn.Set Variable    TST_F14_1_1_054.json
    ${pwd}    SSHLibrary.Execute Command    pwd
    SSHLibrary.Execute Command    cp ${path_aisPhoneNumber-new}/${file_aisPhoneNumber_TST_F14_1_1_054} ${path_aisPhoneNumber-new}/${file_aisPhoneNumber_default}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_new.getMobileNetwork}    ${CmdProduce_new.getMobileNetwork}    ${DataProduce_TST_F14_1_1_054}
    #Consume คำสั่ง ลง kafka.requestNetworkStatus
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_new.getMobileNetwork}    TST_F14_1_1_054
    # check ค่า \ \ \ kafka.requestNetworkStatus
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_new.getMobileNetworkRequested_TST_F14_1_1_054}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCommandFileLog_New}    TST_F14_1_1_054    ${PathLogGetMobileNetwork_New}
    #set mock-up ของ get kids กลับไปเป็น default
    SSHLibrary.Execute Command    cp ${path_aisPhoneNumber-new}/${file_aisPhoneNumber_000} ${path_aisPhoneNumber-new}/${file_aisPhoneNumber_default}

TST_F14_1_1_055
    # set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_New}    ${PathLogGetMobileNetwork_New}
    #แก้ conf
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    ${path_aisPhoneNumber-new}    BuiltIn.Set Variable    /home/serveradm/http_mockup/configs/response/aisPhoneNumber-new
    ${file_aisPhoneNumber_default}    BuiltIn.Set Variable    default.json
    ${file_aisPhoneNumber_000}    BuiltIn.Set Variable    default_000.json  
    ${file_aisPhoneNumber_TST_F14_1_1_055}    BuiltIn.Set Variable    TST_F14_1_1_055.json
    ${pwd}    SSHLibrary.Execute Command    pwd
    SSHLibrary.Execute Command    cp ${path_aisPhoneNumber-new}/${file_aisPhoneNumber_TST_F14_1_1_055} ${path_aisPhoneNumber-new}/${file_aisPhoneNumber_default}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_new.getMobileNetwork}    ${CmdProduce_new.getMobileNetwork}    ${DataProduce_TST_F14_1_1_055}
    #Consume คำสั่ง ลง kafka.requestNetworkStatus
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_new.getMobileNetwork}    TST_F14_1_1_055
    # check ค่า \ \ \ kafka.requestNetworkStatus
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_new.getMobileNetworkRequested_TST_F14_1_1_055}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCommandFileLog_New}    TST_F14_1_1_055    ${PathLogGetMobileNetwork_New}
    #set mock-up ของ get kids กลับไปเป็น default
    SSHLibrary.Execute Command    cp ${path_aisPhoneNumber-new}/${file_aisPhoneNumber_000} ${path_aisPhoneNumber-new}/${file_aisPhoneNumber_default}

TST_F14_1_1_056
    # set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_New}    ${PathLogGetMobileNetwork_New}
    #แก้ conf
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    ${path_aisPhoneNumber-new}    BuiltIn.Set Variable    /home/serveradm/http_mockup/configs/response/aisPhoneNumber-new
    ${file_aisPhoneNumber_default}    BuiltIn.Set Variable    default.json
    ${file_aisPhoneNumber_000}    BuiltIn.Set Variable    default_000.json  
    ${file_aisPhoneNumber_TST_F14_1_1_056}    BuiltIn.Set Variable    TST_F14_1_1_056.json
    ${pwd}    SSHLibrary.Execute Command    pwd
    SSHLibrary.Execute Command    cp ${path_aisPhoneNumber-new}/${file_aisPhoneNumber_TST_F14_1_1_056} ${path_aisPhoneNumber-new}/${file_aisPhoneNumber_default}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_new.getMobileNetwork}    ${CmdProduce_new.getMobileNetwork}    ${DataProduce_TST_F14_1_1_056}
    #Consume คำสั่ง ลง kafka.requestNetworkStatus
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_new.getMobileNetwork}    TST_F14_1_1_056
    # check ค่า \ \ \ kafka.requestNetworkStatus
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_new.getMobileNetworkRequested_TST_F14_1_1_056}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCommandFileLog_New}    TST_F14_1_1_056    ${PathLogGetMobileNetwork_New}
    #set mock-up ของ get kids กลับไปเป็น default
    SSHLibrary.Execute Command    cp ${path_aisPhoneNumber-new}/${file_aisPhoneNumber_000} ${path_aisPhoneNumber-new}/${file_aisPhoneNumber_default}

TST_F14_0_1_057
# set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_New}    ${PathLogGetMobileNetwork_New}
    #แก้ conf
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    ${path_aisPhoneNumber-new}    BuiltIn.Set Variable    /home/serveradm/http_mockup/configs/response/aisPhoneNumber-new
    ${file_aisPhoneNumber_default}    BuiltIn.Set Variable    default.json
    ${file_aisPhoneNumber_000}    BuiltIn.Set Variable    default_000.json  
    ${file_aisPhoneNumber_TST_F14_0_1_057}    BuiltIn.Set Variable    TST_F14_0_1_057.json
    ${pwd}    SSHLibrary.Execute Command    pwd
    SSHLibrary.Execute Command    cp ${path_aisPhoneNumber-new}/${file_aisPhoneNumber_TST_F14_0_1_057} ${path_aisPhoneNumber-new}/${file_aisPhoneNumber_default}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_new.getMobileNetwork}    ${CmdProduce_new.getMobileNetwork}    ${DataProduce_TST_F14_0_1_057}
    #Consume คำสั่ง ลง kafka.requestNetworkStatus
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_new.getMobileNetwork}    TST_F14_0_1_057
    # check ค่า \ \ \ kafka.requestNetworkStatus
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_new.getMobileNetworkRequested_TST_F14_0_1_057}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCommandFileLog_New}    TST_F14_0_1_057    ${PathLogGetMobileNetwork_New}
    #set mock-up ของ get kids กลับไปเป็น default
    SSHLibrary.Execute Command    cp ${path_aisPhoneNumber-new}/${file_aisPhoneNumber_000} ${path_aisPhoneNumber-new}/${file_aisPhoneNumber_default}

TST_F14_1_1_058
    # set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_New}    ${PathLogGetMobileNetwork_New}
    #แก้ conf
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    ${path_aisPhoneNumber-new}    BuiltIn.Set Variable    /home/serveradm/http_mockup/configs/response/aisPhoneNumber-new
    ${file_aisPhoneNumber_default}    BuiltIn.Set Variable    default.json
    ${file_aisPhoneNumber_000}    BuiltIn.Set Variable    default_000.json  
    ${file_aisPhoneNumber_TST_F14_1_1_058}    BuiltIn.Set Variable    TST_F14_1_1_058.json
    ${pwd}    SSHLibrary.Execute Command    pwd
    SSHLibrary.Execute Command    cp ${path_aisPhoneNumber-new}/${file_aisPhoneNumber_TST_F14_1_1_058} ${path_aisPhoneNumber-new}/${file_aisPhoneNumber_default}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_new.getMobileNetwork}    ${CmdProduce_new.getMobileNetwork}    ${DataProduce_TST_F14_1_1_058}
    #Consume คำสั่ง ลง kafka.requestNetworkStatus
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_new.getMobileNetwork}    TST_F14_1_1_058
    # check ค่า \ \ \ kafka.requestNetworkStatus
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_new.getMobileNetworkRequested_TST_F14_1_1_058}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCommandFileLog_New}    TST_F14_1_1_058    ${PathLogGetMobileNetwork_New}
    #set mock-up ของ get kids กลับไปเป็น default
    SSHLibrary.Execute Command    cp ${path_aisPhoneNumber-new}/${file_aisPhoneNumber_000} ${path_aisPhoneNumber-new}/${file_aisPhoneNumber_default}

TST_F14_0_1_059
    # set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_New}    ${PathLogGetMobileNetwork_New}
    #แก้ conf
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    ${path_aisPhoneNumber-new}    BuiltIn.Set Variable    /home/serveradm/http_mockup/configs/response/aisPhoneNumber-new
    ${file_aisPhoneNumber_default}    BuiltIn.Set Variable    default.json
    ${file_aisPhoneNumber_000}    BuiltIn.Set Variable    default_000.json  
    ${file_aisPhoneNumber_TST_F14_0_1_059}    BuiltIn.Set Variable    TST_F14_0_1_059.json
    ${pwd}    SSHLibrary.Execute Command    pwd
    SSHLibrary.Execute Command    cp ${path_aisPhoneNumber-new}/${file_aisPhoneNumber_TST_F14_0_1_059} ${path_aisPhoneNumber-new}/${file_aisPhoneNumber_default}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_new.getMobileNetwork}    ${CmdProduce_new.getMobileNetwork}    ${DataProduce_TST_F14_0_1_059}
    #Consume คำสั่ง ลง kafka.requestNetworkStatus
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_new.getMobileNetwork}    TST_F14_0_1_059
    # check ค่า \ \ \ kafka.requestNetworkStatus
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_new.getMobileNetworkRequested_TST_F14_0_1_059}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCommandFileLog_New}    TST_F14_0_1_059    ${PathLogGetMobileNetwork_New}
    #set mock-up ของ get kids กลับไปเป็น default
    SSHLibrary.Execute Command    cp ${path_aisPhoneNumber-new}/${file_aisPhoneNumber_000} ${path_aisPhoneNumber-new}/${file_aisPhoneNumber_default}

TST_F14_0_1_060
# set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_New}    ${PathLogGetMobileNetwork_New}
    #แก้ conf
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    ${path_aisPhoneNumber-new}    BuiltIn.Set Variable    /home/serveradm/http_mockup/configs/response/aisPhoneNumber-new
    ${file_aisPhoneNumber_default}    BuiltIn.Set Variable    default.json
    ${file_aisPhoneNumber_000}    BuiltIn.Set Variable    default_000.json  
    ${file_aisPhoneNumber_TST_F14_0_1_060}    BuiltIn.Set Variable    TST_F14_0_1_060.json
    ${pwd}    SSHLibrary.Execute Command    pwd
    SSHLibrary.Execute Command    cp ${path_aisPhoneNumber-new}/${file_aisPhoneNumber_TST_F14_0_1_060} ${path_aisPhoneNumber-new}/${file_aisPhoneNumber_default}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_new.getMobileNetwork}    ${CmdProduce_new.getMobileNetwork}    ${DataProduce_TST_F14_0_1_060}
    #Consume คำสั่ง ลง kafka.requestNetworkStatus
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_new.getMobileNetwork}    TST_F14_0_1_060
    # check ค่า \ \ \ kafka.requestNetworkStatus
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_new.getMobileNetworkRequested_TST_F14_0_1_060}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCommandFileLog_New}    TST_F14_0_1_060    ${PathLogGetMobileNetwork_New}
    #set mock-up ของ get kids กลับไปเป็น default
    SSHLibrary.Execute Command    cp ${path_aisPhoneNumber-new}/${file_aisPhoneNumber_000} ${path_aisPhoneNumber-new}/${file_aisPhoneNumber_default}

TST_F14_1_1_061
    # set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_New}    ${PathLogGetMobileNetwork_New}
    #แก้ conf
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    ${path_aisPhoneNumber-new}    BuiltIn.Set Variable    /home/serveradm/http_mockup/configs/response/aisPhoneNumber-new
    ${file_aisPhoneNumber_default}    BuiltIn.Set Variable    default.json
    ${file_aisPhoneNumber_000}    BuiltIn.Set Variable    default_000.json  
    ${file_aisPhoneNumber_TST_F14_1_1_061}    BuiltIn.Set Variable    TST_F14_1_1_061.json
    ${pwd}    SSHLibrary.Execute Command    pwd
    SSHLibrary.Execute Command    cp ${path_aisPhoneNumber-new}/${file_aisPhoneNumber_TST_F14_1_1_061} ${path_aisPhoneNumber-new}/${file_aisPhoneNumber_default}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_new.getMobileNetwork}    ${CmdProduce_new.getMobileNetwork}    ${DataProduce_TST_F14_1_1_061}
    #Consume คำสั่ง ลง kafka.requestNetworkStatus
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_new.getMobileNetwork}    TST_F14_1_1_061
    # check ค่า \ \ \ kafka.requestNetworkStatus
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_new.getMobileNetworkRequested_TST_F14_1_1_061}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCommandFileLog_New}    TST_F14_1_1_061    ${PathLogGetMobileNetwork_New}
    #set mock-up ของ get kids กลับไปเป็น default
    SSHLibrary.Execute Command    cp ${path_aisPhoneNumber-new}/${file_aisPhoneNumber_000} ${path_aisPhoneNumber-new}/${file_aisPhoneNumber_default}

TST_F14_0_1_062
    # set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_New}    ${PathLogGetMobileNetwork_New}
    #แก้ conf
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    ${path_aisPhoneNumber-new}    BuiltIn.Set Variable    /home/serveradm/http_mockup/configs/response/aisPhoneNumber-new
    ${file_aisPhoneNumber_default}    BuiltIn.Set Variable    default.json
    ${file_aisPhoneNumber_000}    BuiltIn.Set Variable    default_000.json  
    ${file_aisPhoneNumber_TST_F14_0_1_062}    BuiltIn.Set Variable    TST_F14_0_1_062.json
    ${pwd}    SSHLibrary.Execute Command    pwd
    SSHLibrary.Execute Command    cp ${path_aisPhoneNumber-new}/${file_aisPhoneNumber_TST_F14_0_1_062} ${path_aisPhoneNumber-new}/${file_aisPhoneNumber_default}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_new.getMobileNetwork}    ${CmdProduce_new.getMobileNetwork}    ${DataProduce_TST_F14_0_1_062}
    #Consume คำสั่ง ลง kafka.requestNetworkStatus
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_new.getMobileNetwork}    TST_F14_0_1_062
    # check ค่า \ \ \ kafka.requestNetworkStatus
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_new.getMobileNetworkRequested_TST_F14_0_1_062}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCommandFileLog_New}    TST_F14_0_1_062    ${PathLogGetMobileNetwork_New}
    #set mock-up ของ get kids กลับไปเป็น default
    SSHLibrary.Execute Command    cp ${path_aisPhoneNumber-new}/${file_aisPhoneNumber_000} ${path_aisPhoneNumber-new}/${file_aisPhoneNumber_default}

TST_F14_0_1_063
    # set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_New}    ${PathLogGetMobileNetwork_New}
    #แก้ conf
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    ${path_aisPhoneNumber-new}    BuiltIn.Set Variable    /home/serveradm/http_mockup/configs/response/aisPhoneNumber-new
    ${file_aisPhoneNumber_default}    BuiltIn.Set Variable    default.json
    ${file_aisPhoneNumber_000}    BuiltIn.Set Variable    default_000.json  
    ${file_aisPhoneNumber_TST_F14_0_1_063}    BuiltIn.Set Variable    TST_F14_0_1_063.json
    ${pwd}    SSHLibrary.Execute Command    pwd
    SSHLibrary.Execute Command    cp ${path_aisPhoneNumber-new}/${file_aisPhoneNumber_TST_F14_0_1_063} ${path_aisPhoneNumber-new}/${file_aisPhoneNumber_default}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_new.getMobileNetwork}    ${CmdProduce_new.getMobileNetwork}    ${DataProduce_TST_F14_0_1_063}
    #Consume คำสั่ง ลง kafka.requestNetworkStatus
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_new.getMobileNetwork}    TST_F14_0_1_063
    # check ค่า \ \ \ kafka.requestNetworkStatus
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_new.getMobileNetworkRequested_TST_F14_0_1_063}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCommandFileLog_New}    TST_F14_0_1_063    ${PathLogGetMobileNetwork_New}
    #set mock-up ของ get kids กลับไปเป็น default
    SSHLibrary.Execute Command    cp ${path_aisPhoneNumber-new}/${file_aisPhoneNumber_000} ${path_aisPhoneNumber-new}/${file_aisPhoneNumber_default}

TST_F14_0_1_064
    # set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_New}    ${PathLogGetMobileNetwork_New}
    #แก้ conf
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    ${path_aisPhoneNumber-new}    BuiltIn.Set Variable    /home/serveradm/http_mockup/configs/response/aisPhoneNumber-new
    ${file_aisPhoneNumber_default}    BuiltIn.Set Variable    default.json
    ${file_aisPhoneNumber_000}    BuiltIn.Set Variable    default_000.json  
    ${file_aisPhoneNumber_TST_F14_0_1_064}    BuiltIn.Set Variable    TST_F14_0_1_064.json
    ${pwd}    SSHLibrary.Execute Command    pwd
    SSHLibrary.Execute Command    cp ${path_aisPhoneNumber-new}/${file_aisPhoneNumber_TST_F14_0_1_064} ${path_aisPhoneNumber-new}/${file_aisPhoneNumber_default}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_new.getMobileNetwork}    ${CmdProduce_new.getMobileNetwork}    ${DataProduce_TST_F14_0_1_064}
    #Consume คำสั่ง ลง kafka.requestNetworkStatus
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_new.getMobileNetwork}    TST_F14_0_1_064
    # check ค่า \ \ \ kafka.requestNetworkStatus
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_new.getMobileNetworkRequested_TST_F14_0_1_064}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCommandFileLog_New}    TST_F14_0_1_064    ${PathLogGetMobileNetwork_New}
    #set mock-up ของ get kids กลับไปเป็น default
    SSHLibrary.Execute Command    cp ${path_aisPhoneNumber-new}/${file_aisPhoneNumber_000} ${path_aisPhoneNumber-new}/${file_aisPhoneNumber_default}

TST_F14_0_1_065
    # set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_New}    ${PathLogGetMobileNetwork_New}
    #แก้ conf
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    ${path_aisPhoneNumber-new}    BuiltIn.Set Variable    /home/serveradm/http_mockup/configs/response/aisPhoneNumber-new
    ${file_aisPhoneNumber_default}    BuiltIn.Set Variable    default.json
    ${file_aisPhoneNumber_000}    BuiltIn.Set Variable    default_000.json  
    ${file_aisPhoneNumber_TST_F14_0_1_065}    BuiltIn.Set Variable    TST_F14_0_1_065.json
    ${pwd}    SSHLibrary.Execute Command    pwd
    SSHLibrary.Execute Command    cp ${path_aisPhoneNumber-new}/${file_aisPhoneNumber_TST_F14_0_1_065} ${path_aisPhoneNumber-new}/${file_aisPhoneNumber_default}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_new.getMobileNetwork}    ${CmdProduce_new.getMobileNetwork}    ${DataProduce_TST_F14_0_1_065}
    #Consume คำสั่ง ลง kafka.requestNetworkStatus
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_new.getMobileNetwork}    TST_F14_0_1_065
    # check ค่า \ \ \ kafka.requestNetworkStatus
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_new.getMobileNetworkRequested_TST_F14_0_1_065}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCommandFileLog_New}    TST_F14_0_1_065    ${PathLogGetMobileNetwork_New}
    #set mock-up ของ get kids กลับไปเป็น default
    SSHLibrary.Execute Command    cp ${path_aisPhoneNumber-new}/${file_aisPhoneNumber_000} ${path_aisPhoneNumber-new}/${file_aisPhoneNumber_default}

TST_F14_0_1_066
    # set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_New}    ${PathLogGetMobileNetwork_New}
    #แก้ conf
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    ${path_aisPhoneNumber-new}    BuiltIn.Set Variable    /home/serveradm/http_mockup/configs/response/aisPhoneNumber-new
    ${file_aisPhoneNumber_default}    BuiltIn.Set Variable    default.json
    ${file_aisPhoneNumber_000}    BuiltIn.Set Variable    default_000.json  
    ${file_aisPhoneNumber_TST_F14_0_1_066}    BuiltIn.Set Variable    TST_F14_0_1_066.json
    ${pwd}    SSHLibrary.Execute Command    pwd
    SSHLibrary.Execute Command    cp ${path_aisPhoneNumber-new}/${file_aisPhoneNumber_TST_F14_0_1_066} ${path_aisPhoneNumber-new}/${file_aisPhoneNumber_default}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_new.getMobileNetwork}    ${CmdProduce_new.getMobileNetwork}    ${DataProduce_TST_F14_0_1_066}
    #Consume คำสั่ง ลง kafka.requestNetworkStatus
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_new.getMobileNetwork}    TST_F14_0_1_066
    # check ค่า \ \ \ kafka.requestNetworkStatus
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_new.getMobileNetworkRequested_TST_F14_0_1_066}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCommandFileLog_New}    TST_F14_0_1_066    ${PathLogGetMobileNetwork_New}
    #set mock-up ของ get kids กลับไปเป็น default
    SSHLibrary.Execute Command    cp ${path_aisPhoneNumber-new}/${file_aisPhoneNumber_000} ${path_aisPhoneNumber-new}/${file_aisPhoneNumber_default}

TST_F14_0_1_067
    # set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_New}    ${PathLogGetMobileNetwork_New}
    #แก้ conf
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    ${path_aisPhoneNumber-new}    BuiltIn.Set Variable    /home/serveradm/http_mockup/configs/response/aisPhoneNumber-new
    ${file_aisPhoneNumber_default}    BuiltIn.Set Variable    default.json
    ${file_aisPhoneNumber_000}    BuiltIn.Set Variable    default_000.json  
    ${file_aisPhoneNumber_TST_F14_0_1_067}    BuiltIn.Set Variable    TST_F14_0_1_067.json
    ${pwd}    SSHLibrary.Execute Command    pwd
    SSHLibrary.Execute Command    cp ${path_aisPhoneNumber-new}/${file_aisPhoneNumber_TST_F14_0_1_067} ${path_aisPhoneNumber-new}/${file_aisPhoneNumber_default}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_new.getMobileNetwork}    ${CmdProduce_new.getMobileNetwork}    ${DataProduce_TST_F14_0_1_067}
    #Consume คำสั่ง ลง kafka.requestNetworkStatus
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_new.getMobileNetwork}    TST_F14_0_1_067
    # check ค่า \ \ \ kafka.requestNetworkStatus
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_new.getMobileNetworkRequested_TST_F14_0_1_067}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCommandFileLog_New}    TST_F14_0_1_067    ${PathLogGetMobileNetwork_New}
    #set mock-up ของ get kids กลับไปเป็น default
    SSHLibrary.Execute Command    cp ${path_aisPhoneNumber-new}/${file_aisPhoneNumber_000} ${path_aisPhoneNumber-new}/${file_aisPhoneNumber_default}

TST_F14_0_1_080
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_fang}    ${PathLogGetMobileNetwork_fang}
    #แก้ conf
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    ${path_well-known-fang}    BuiltIn.Set Variable    /home/serveradm/http_mockup/configs/response/well-known-fang
    ${file_well-known_default}    BuiltIn.Set Variable    default.json
    ${file_well-known_default_000}    BuiltIn.Set Variable    default_000.json  
    ${file_well-known_TST_F14_0_1_080}    BuiltIn.Set Variable    TST_F14_0_1_080.json
    ${pwd}    SSHLibrary.Execute Command    pwd
    SSHLibrary.Execute Command    cp ${path_well-known-fang}/${file_well-known_TST_F14_0_1_080} ${path_well-known-fang}/${file_well-known_default}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_fang.getMobileNetwork}    ${CmdProduce_fang.getMobileNetwork}    ${DataProduce_TST_F14_0_1_080}
    #Consume คำสั่ง ลง kafka.requestNetworkStatus
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_fang.getMobileNetwork}    TST_F14_0_1_080
    # check ค่า \ \ \ kafka.requestNetworkStatus
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_fang.getMobileNetworkRequested_TST_F14_0_1_080}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCommandFileLog_fang}    TST_F14_0_1_080    ${PathLogGetMobileNetwork_fang}
    #set mock-up ของ get kids กลับไปเป็น default
    SSHLibrary.Execute Command    cp ${path_well-known-fang}/${file_well-known_default_000} ${path_well-known-fang}/${file_well-known_default}

TST_F14_0_1_081
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_fang}    ${PathLogGetMobileNetwork_fang}
    #แก้ conf
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    ${path_well-known-fang}    BuiltIn.Set Variable    /home/serveradm/http_mockup/configs/response/well-known-fang
    ${file_well-known_default}    BuiltIn.Set Variable    default.json
    ${file_well-known_default_000}    BuiltIn.Set Variable    default_000.json  
    ${file_well-known_TST_F14_0_1_080}    BuiltIn.Set Variable    TST_F14_0_1_080.json
    ${pwd}    SSHLibrary.Execute Command    pwd
    SSHLibrary.Execute Command    cp ${path_well-known-fang}/${file_well-known_TST_F14_0_1_080} ${path_well-known-fang}/${file_well-known_default}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_fang.getMobileNetwork}    ${CmdProduce_fang.getMobileNetwork}    ${DataProduce_TST_F14_0_1_080}
    #Consume คำสั่ง ลง kafka.requestNetworkStatus
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_fang.getMobileNetwork}    TST_F14_0_1_080
    # check ค่า \ \ \ kafka.requestNetworkStatus
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_fang.getMobileNetworkRequested_TST_F14_0_1_080}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCommandFileLog_fang}    TST_F14_0_1_080    ${PathLogGetMobileNetwork_fang}
    #set mock-up ของ get kids กลับไปเป็น default
    SSHLibrary.Execute Command    cp ${path_well-known-fang}/${file_well-known_default_000} ${path_well-known-fang}/${file_well-known_default}

TST_F14_0_1_082
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_fang}    ${PathLogGetMobileNetwork_fang}
    #แก้ conf
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    ${path_well-known-fang}    BuiltIn.Set Variable    /home/serveradm/http_mockup/configs/response/well-known-fang
    ${file_well-known_default}    BuiltIn.Set Variable    default.json
    ${file_well-known_default_000}    BuiltIn.Set Variable    default_000.json  
    ${file_well-known_TST_F14_0_1_082}    BuiltIn.Set Variable    TST_F14_0_1_082.json
    ${pwd}    SSHLibrary.Execute Command    pwd
    SSHLibrary.Execute Command    cp ${path_well-known-fang}/${file_well-known_TST_F14_0_1_082} ${path_well-known-fang}/${file_well-known_default}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_fang.getMobileNetwork}    ${CmdProduce_fang.getMobileNetwork}    ${DataProduceTST_F14_0_1_082}
    #Consume คำสั่ง ลง kafka.requestNetworkStatus
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_fang.getMobileNetwork}    TST_F14_0_1_082
    # check ค่า \ \ \ kafka.requestNetworkStatus
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_fang.getMobileNetworkRequested_TST_F14_0_1_082}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCommandFileLog_fang}    TST_F14_0_1_082    ${PathLogGetMobileNetwork_fang}
    #set mock-up ของ get kids กลับไปเป็น default
    SSHLibrary.Execute Command    cp ${path_well-known-fang}/${file_well-known_default_000} ${path_well-known-fang}/${file_well-known_default}

TST_F14_0_1_083
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_fang}    ${PathLogGetMobileNetwork_fang}
    #แก้ conf
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    ${path_well-known-fang}    BuiltIn.Set Variable    /home/serveradm/http_mockup/configs/response/well-known-fang
    ${file_well-known_default}    BuiltIn.Set Variable    default.json
    ${file_well-known_default_000}    BuiltIn.Set Variable    default_000.json  
    ${file_well-known_TST_F14_0_1_083}    BuiltIn.Set Variable    TST_F14_0_1_083.json
    ${pwd}    SSHLibrary.Execute Command    pwd
    SSHLibrary.Execute Command    cp ${path_well-known-fang}/${file_well-known_TST_F14_0_1_083} ${path_well-known-fang}/${file_well-known_default}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_fang.getMobileNetwork}    ${CmdProduce_fang.getMobileNetwork}    ${DataProduce_TST_F14_0_1_083}
    #Consume คำสั่ง ลง kafka.requestNetworkStatus
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_fang.getMobileNetwork}    TST_F14_0_1_083
    # check ค่า \ \ \ kafka.requestNetworkStatus
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_fang.getMobileNetworkRequested_TST_F14_0_1_083}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCommandFileLog_fang}    TST_F14_0_1_083    ${PathLogGetMobileNetwork_fang}
    #set mock-up ของ get kids กลับไปเป็น default
    SSHLibrary.Execute Command    cp ${path_well-known-fang}/${file_well-known_default_000} ${path_well-known-fang}/${file_well-known_default}

TST_F14_1_1_084
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_fang}    ${PathLogGetMobileNetwork_fang}
    #แก้ conf
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    ${path_well-known-fang}    BuiltIn.Set Variable    /home/serveradm/http_mockup/configs/response/well-known-fang
    ${file_well-known_default}    BuiltIn.Set Variable    default.json
    ${file_well-known_default_000}    BuiltIn.Set Variable    default_000.json  
    ${file_well-known_TST_F14_1_1_084}    BuiltIn.Set Variable    TST_F14_1_1_084.json
    ${pwd}    SSHLibrary.Execute Command    pwd
    SSHLibrary.Execute Command    cp ${path_well-known-fang}/${file_well-known_TST_F14_1_1_084} ${path_well-known-fang}/${file_well-known_default}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_fang.getMobileNetwork}    ${CmdProduce_fang.getMobileNetwork}    ${DataProduce_TST_F14_1_1_084}
    #Consume คำสั่ง ลง kafka.requestNetworkStatus
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_fang.getMobileNetwork}    TST_F14_1_1_084
    # check ค่า \ \ \ kafka.requestNetworkStatus
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_fang.getMobileNetworkRequested_TST_F14_1_1_084}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCommandFileLog_fang}    TST_F14_1_1_084    ${PathLogGetMobileNetwork_fang}
    #set mock-up ของ get kids กลับไปเป็น default
    SSHLibrary.Execute Command    cp ${path_well-known-fang}/${file_well-known_default_000} ${path_well-known-fang}/${file_well-known_default}

TST_F14_0_1_090
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_fang}    ${PathLogGetMobileNetwork_fang}
    #แก้ conf
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    ${path_getKids-fang}    BuiltIn.Set Variable    /home/serveradm/http_mockup/configs/response/getKids-fang
    ${file_getKids_default}    BuiltIn.Set Variable    default.json
    ${file_getKids_000}    BuiltIn.Set Variable    default_000.json  
    ${file_getKids_TST_F14_0_1_090}    BuiltIn.Set Variable    TST_F14_0_1_090.json
    ${pwd}    SSHLibrary.Execute Command    pwd
    SSHLibrary.Execute Command    cp ${path_getKids-fang}/${file_getKids_TST_F14_0_1_090} ${path_getKids-fang}/${file_getKids_default}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_fang.getMobileNetwork}    ${CmdProduce_fang.getMobileNetwork}    ${DataProduce_TST_F14_0_1_090}
    #Consume คำสั่ง ลง kafka.requestNetworkStatus
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_fang.getMobileNetwork}    TST_F14_0_1_090
    # check ค่า \ \ \ kafka.requestNetworkStatus
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_fang.getMobileNetworkRequested_TST_F14_0_1_090}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCommandFileLog_fang}    TST_F14_0_1_090    ${PathLogGetMobileNetwork_fang}
    #set mock-up ของ get kids กลับไปเป็น default
    SSHLibrary.Execute Command    cp ${path_getKids-fang}/${file_getKids_000} ${path_getKids-fang}/${file_getKids_default}

TST_F14_1_1_091
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_fang}    ${PathLogGetMobileNetwork_fang}
    #แก้ conf
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    ${path_getKids-fang}    BuiltIn.Set Variable    /home/serveradm/http_mockup/configs/response/getKids-fang
    ${file_getKids_default}    BuiltIn.Set Variable    default.json
    ${file_getKids_000}    BuiltIn.Set Variable    default_000.json  
    ${file_getKids_TST_F14_1_1_091}    BuiltIn.Set Variable    TST_F14_1_1_091.json
    ${pwd}    SSHLibrary.Execute Command    pwd
    SSHLibrary.Execute Command    cp ${path_getKids-fang}/${file_getKids_TST_F14_1_1_091} ${path_getKids-fang}/${file_getKids_default}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_fang.getMobileNetwork}    ${CmdProduce_fang.getMobileNetwork}    ${DataProduce_TST_F14_1_1_091}
    #Consume คำสั่ง ลง kafka.requestNetworkStatus
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_fang.getMobileNetwork}    TST_F14_1_1_091
    # check ค่า \ \ \ kafka.requestNetworkStatus
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_fang.getMobileNetworkRequested_TST_F14_1_1_091}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCommandFileLog_fang}    TST_F14_1_1_091    ${PathLogGetMobileNetwork_fang}
    #set mock-up ของ get kids กลับไปเป็น default
    SSHLibrary.Execute Command    cp ${path_getKids-fang}/${file_getKids_000} ${path_getKids-fang}/${file_getKids_default}

TST_F14_0_1_092
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_fang}    ${PathLogGetMobileNetwork_fang}
    #แก้ conf
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    ${path_getKids-fang}    BuiltIn.Set Variable    /home/serveradm/http_mockup/configs/response/getKids-fang
    ${file_getKids_default}    BuiltIn.Set Variable    default.json
    ${file_getKids_000}    BuiltIn.Set Variable    default_000.json  
    ${file_getKids_TST_F14_0_1_092}    BuiltIn.Set Variable    TST_F14_0_1_092.json
    ${pwd}    SSHLibrary.Execute Command    pwd
    SSHLibrary.Execute Command    cp ${path_getKids-fang}/${file_getKids_TST_F14_0_1_092} ${path_getKids-fang}/${file_getKids_default}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_fang.getMobileNetwork}    ${CmdProduce_fang.getMobileNetwork}    ${DataProduce_TST_F14_0_1_092}
    #Consume คำสั่ง ลง kafka.requestNetworkStatus
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_fang.getMobileNetwork}    TST_F14_0_1_092
    # check ค่า \ \ \ kafka.requestNetworkStatus
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_fang.getMobileNetworkRequested_TST_F14_0_1_092}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCommandFileLog_fang}    TST_F14_0_1_092    ${PathLogGetMobileNetwork_fang}
    #set mock-up ของ get kids กลับไปเป็น default
    SSHLibrary.Execute Command    cp ${path_getKids-fang}/${file_getKids_000} ${path_getKids-fang}/${file_getKids_default}

TST_F14_1_1_093
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_fang}    ${PathLogGetMobileNetwork_fang}
    #แก้ conf
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    ${path_getKids-fang}    BuiltIn.Set Variable    /home/serveradm/http_mockup/configs/response/getKids-fang
    ${file_getKids_default}    BuiltIn.Set Variable    default.json
    ${file_getKids_000}    BuiltIn.Set Variable    default_000.json  
    ${file_getKids_TST_F14_1_1_093}    BuiltIn.Set Variable    TST_F14_1_1_093.json
    ${pwd}    SSHLibrary.Execute Command    pwd
    SSHLibrary.Execute Command    cp ${path_getKids-fang}/${file_getKids_TST_F14_1_1_093} ${path_getKids-fang}/${file_getKids_default}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_fang.getMobileNetwork}    ${CmdProduce_fang.getMobileNetwork}    ${DataProduce_TST_F14_1_1_093}
    #Consume คำสั่ง ลง kafka.requestNetworkStatus
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_fang.getMobileNetwork}    TST_F14_1_1_093
    # check ค่า \ \ \ kafka.requestNetworkStatus
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_fang.getMobileNetworkRequested_TST_F14_1_1_093}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCommandFileLog_fang}    TST_F14_1_1_093    ${PathLogGetMobileNetwork_fang}
    #set mock-up ของ get kids กลับไปเป็น default
    SSHLibrary.Execute Command    cp ${path_getKids-fang}/${file_getKids_000} ${path_getKids-fang}/${file_getKids_default}

TST_F14_0_1_094
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_fang}    ${PathLogGetMobileNetwork_fang}
    #แก้ conf
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    ${path_getKids-fang}    BuiltIn.Set Variable    /home/serveradm/http_mockup/configs/response/getKids-fang
    ${file_getKids_default}    BuiltIn.Set Variable    default.json
    ${file_getKids_000}    BuiltIn.Set Variable    default_000.json  
    ${file_getKids_TST_F14_0_1_094}    BuiltIn.Set Variable    TST_F14_0_1_094.json
    ${pwd}    SSHLibrary.Execute Command    pwd
    SSHLibrary.Execute Command    cp ${path_getKids-fang}/${file_getKids_TST_F14_0_1_094} ${path_getKids-fang}/${file_getKids_default}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_fang.getMobileNetwork}    ${CmdProduce_fang.getMobileNetwork}    ${DataProduce_TST_F14_0_1_094}
    #Consume คำสั่ง ลง kafka.requestNetworkStatus
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_fang.getMobileNetwork}    TST_F14_0_1_094
    # check ค่า \ \ \ kafka.requestNetworkStatus
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_fang.getMobileNetworkRequested_TST_F14_0_1_094}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCommandFileLog_fang}    TST_F14_0_1_094    ${PathLogGetMobileNetwork_fang}
    #set mock-up ของ get kids กลับไปเป็น default
    SSHLibrary.Execute Command    cp ${path_getKids-fang}/${file_getKids_000} ${path_getKids-fang}/${file_getKids_default}

TST_F14_1_1_095
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_fang}    ${PathLogGetMobileNetwork_fang}
    #แก้ conf
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    ${path_getKids-fang}    BuiltIn.Set Variable    /home/serveradm/http_mockup/configs/response/getKids-fang
    ${file_getKids_default}    BuiltIn.Set Variable    default.json
    ${file_getKids_000}    BuiltIn.Set Variable    default_000.json  
    ${file_getKids_TST_F14_1_1_095}    BuiltIn.Set Variable    TST_F14_1_1_095.json
    ${pwd}    SSHLibrary.Execute Command    pwd
    SSHLibrary.Execute Command    cp ${path_getKids-fang}/${file_getKids_TST_F14_1_1_095} ${path_getKids-fang}/${file_getKids_default}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_fang.getMobileNetwork}    ${CmdProduce_fang.getMobileNetwork}    ${DataProduce_TST_F14_1_1_095}
    #Consume คำสั่ง ลง kafka.requestNetworkStatus
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_fang.getMobileNetwork}    TST_F14_1_1_095
    # check ค่า \ \ \ kafka.requestNetworkStatus
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_fang.getMobileNetworkRequested_TST_F14_1_1_095}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCommandFileLog_fang}    TST_F14_1_1_095    ${PathLogGetMobileNetwork_fang}
    #set mock-up ของ get kids กลับไปเป็น default
    SSHLibrary.Execute Command    cp ${path_getKids-fang}/${file_getKids_000} ${path_getKids-fang}/${file_getKids_default}

TST_F14_0_1_096
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_fang}    ${PathLogGetMobileNetwork_fang}
    #แก้ conf
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    ${path_getKids-fang}    BuiltIn.Set Variable    /home/serveradm/http_mockup/configs/response/getKids-fang
    ${file_getKids_default}    BuiltIn.Set Variable    default.json
    ${file_getKids_000}    BuiltIn.Set Variable    default_000.json  
    ${file_getKids_TST_F14_0_1_096}    BuiltIn.Set Variable    TST_F14_0_1_096.json
    ${pwd}    SSHLibrary.Execute Command    pwd
    SSHLibrary.Execute Command    cp ${path_getKids-fang}/${file_getKids_TST_F14_0_1_096} ${path_getKids-fang}/${file_getKids_default}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_fang.getMobileNetwork}    ${CmdProduce_fang.getMobileNetwork}    ${DataProduce_TST_F14_0_1_096}
    #Consume คำสั่ง ลง kafka.requestNetworkStatus
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_fang.getMobileNetwork}    TST_F14_0_1_096
    # check ค่า \ \ \ kafka.requestNetworkStatus
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_fang.getMobileNetworkRequested_TST_F14_0_1_096}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCommandFileLog_fang}    TST_F14_0_1_096    ${PathLogGetMobileNetwork_fang}
    #set mock-up ของ get kids กลับไปเป็น default
    SSHLibrary.Execute Command    cp ${path_getKids-fang}/${file_getKids_000} ${path_getKids-fang}/${file_getKids_default}

TST_F14_0_1_097
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_fang}    ${PathLogGetMobileNetwork_fang}
    #แก้ conf
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    ${path_getKids-fang}    BuiltIn.Set Variable    /home/serveradm/http_mockup/configs/response/getKids-fang
    ${file_getKids_default}    BuiltIn.Set Variable    default.json
    ${file_getKids_000}    BuiltIn.Set Variable    default_000.json  
    ${file_getKids_TST_F14_0_1_097}    BuiltIn.Set Variable    TST_F14_0_1_097.json
    ${pwd}    SSHLibrary.Execute Command    pwd
    SSHLibrary.Execute Command    cp ${path_getKids-fang}/${file_getKids_TST_F14_0_1_097} ${path_getKids-fang}/${file_getKids_default}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_fang.getMobileNetwork}    ${CmdProduce_fang.getMobileNetwork}    ${DataProduce_TST_F14_0_1_097}
    #Consume คำสั่ง ลง kafka.requestNetworkStatus
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_fang.getMobileNetwork}    TST_F14_0_1_097
    # check ค่า \ \ \ kafka.requestNetworkStatus
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_fang.getMobileNetworkRequested_TST_F14_0_1_097}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCommandFileLog_fang}    TST_F14_0_1_097    ${PathLogGetMobileNetwork_fang}
    #set mock-up ของ get kids กลับไปเป็น default
    SSHLibrary.Execute Command    cp ${path_getKids-fang}/${file_getKids_000} ${path_getKids-fang}/${file_getKids_default}

TST_F14_1_1_098
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_fang}    ${PathLogGetMobileNetwork_fang}
    #แก้ conf
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    ${path_getKids-fang}    BuiltIn.Set Variable    /home/serveradm/http_mockup/configs/response/getKids-fang
    ${file_getKids_default}    BuiltIn.Set Variable    default.json
    ${file_getKids_000}    BuiltIn.Set Variable    default_000.json  
    ${file_getKids_TST_F14_1_1_098}    BuiltIn.Set Variable    TST_F14_1_1_098.json
    ${pwd}    SSHLibrary.Execute Command    pwd
    SSHLibrary.Execute Command    cp ${path_getKids-fang}/${file_getKids_TST_F14_1_1_098} ${path_getKids-fang}/${file_getKids_default}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_fang.getMobileNetwork}    ${CmdProduce_fang.getMobileNetwork}    ${DataProduce_TST_F14_1_1_098}
    #Consume คำสั่ง ลง kafka.requestNetworkStatus
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_fang.getMobileNetwork}    TST_F14_1_1_098
    # check ค่า \ \ \ kafka.requestNetworkStatus
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_fang.getMobileNetworkRequested_TST_F14_1_1_098}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCommandFileLog_fang}    TST_F14_1_1_098    ${PathLogGetMobileNetwork_fang}
    #set mock-up ของ get kids กลับไปเป็น default
    SSHLibrary.Execute Command    cp ${path_getKids-fang}/${file_getKids_000} ${path_getKids-fang}/${file_getKids_default}

TST_F14_0_1_099
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_fang}    ${PathLogGetMobileNetwork_fang}
    #แก้ conf
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    ${path_getKids-fang}    BuiltIn.Set Variable    /home/serveradm/http_mockup/configs/response/getKids-fang
    ${file_getKids_default}    BuiltIn.Set Variable    default.json
    ${file_getKids_000}    BuiltIn.Set Variable    default_000.json  
    ${file_getKids_TST_F14_0_1_099}    BuiltIn.Set Variable    TST_F14_0_1_099.json
    ${pwd}    SSHLibrary.Execute Command    pwd
    SSHLibrary.Execute Command    cp ${path_getKids-fang}/${file_getKids_TST_F14_0_1_099} ${path_getKids-fang}/${file_getKids_default}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_fang.getMobileNetwork}    ${CmdProduce_fang.getMobileNetwork}    ${DataProduce_TST_F14_0_1_099}
    #Consume คำสั่ง ลง kafka.requestNetworkStatus
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_fang.getMobileNetwork}    TST_F14_0_1_099
    # check ค่า \ \ \ kafka.requestNetworkStatus
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_fang.getMobileNetworkRequested_TST_F14_0_1_099}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCommandFileLog_fang}    TST_F14_0_1_099    ${PathLogGetMobileNetwork_fang}
    #set mock-up ของ get kids กลับไปเป็น default
    SSHLibrary.Execute Command    cp ${path_getKids-fang}/${file_getKids_000} ${path_getKids-fang}/${file_getKids_default}

TST_F14_1_1_100
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_fang}    ${PathLogGetMobileNetwork_fang}
    #แก้ conf
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    ${path_getKids-fang}    BuiltIn.Set Variable    /home/serveradm/http_mockup/configs/response/getKids-fang
    ${file_getKids_default}    BuiltIn.Set Variable    default.json
    ${file_getKids_000}    BuiltIn.Set Variable    default_000.json  
    ${file_getKids_TST_F14_1_1_100}    BuiltIn.Set Variable    TST_F14_1_1_100.json
    ${pwd}    SSHLibrary.Execute Command    pwd
    SSHLibrary.Execute Command    cp ${path_getKids-fang}/${file_getKids_TST_F14_1_1_100} ${path_getKids-fang}/${file_getKids_default}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_fang.getMobileNetwork}    ${CmdProduce_fang.getMobileNetwork}    ${DataProduce_TST_F14_1_1_100}
    #Consume คำสั่ง ลง kafka.requestNetworkStatus
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_fang.getMobileNetwork}    TST_F14_1_1_100
    # check ค่า \ \ \ kafka.requestNetworkStatus
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_fang.getMobileNetworkRequested_TST_F14_1_1_100}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCommandFileLog_fang}    TST_F14_1_1_100    ${PathLogGetMobileNetwork_fang}
    #set mock-up ของ get kids กลับไปเป็น default
    SSHLibrary.Execute Command    cp ${path_getKids-fang}/${file_getKids_000} ${path_getKids-fang}/${file_getKids_default}

TST_F14_0_1_101
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_fang}    ${PathLogGetMobileNetwork_fang}
    #แก้ conf
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    ${path_getKids-fang}    BuiltIn.Set Variable    /home/serveradm/http_mockup/configs/response/getKids-fang
    ${file_getKids_default}    BuiltIn.Set Variable    default.json
    ${file_getKids_000}    BuiltIn.Set Variable    default_000.json  
    ${file_getKids_TST_F14_0_1_101}    BuiltIn.Set Variable    TST_F14_0_1_101.json
    ${pwd}    SSHLibrary.Execute Command    pwd
    SSHLibrary.Execute Command    cp ${path_getKids-fang}/${file_getKids_TST_F14_0_1_101} ${path_getKids-fang}/${file_getKids_default}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_fang.getMobileNetwork}    ${CmdProduce_fang.getMobileNetwork}    ${DataProduce_TST_F14_0_1_101}
    #Consume คำสั่ง ลง kafka.requestNetworkStatus
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_fang.getMobileNetwork}    TST_F14_0_1_101
    # check ค่า \ \ \ kafka.requestNetworkStatus
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_fang.getMobileNetworkRequested_TST_F14_0_1_101}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCommandFileLog_fang}    TST_F14_0_1_101    ${PathLogGetMobileNetwork_fang}
    #set mock-up ของ get kids กลับไปเป็น default
    SSHLibrary.Execute Command    cp ${path_getKids-fang}/${file_getKids_000} ${path_getKids-fang}/${file_getKids_default}

TST_F14_1_1_102
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_fang}    ${PathLogGetMobileNetwork_fang}
    #แก้ conf
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    ${path_getKids-fang}    BuiltIn.Set Variable    /home/serveradm/http_mockup/configs/response/getKids-fang
    ${file_getKids_default}    BuiltIn.Set Variable    default.json
    ${file_getKids_000}    BuiltIn.Set Variable    default_000.json  
    ${file_getKids_TST_F14_1_1_102}    BuiltIn.Set Variable    TST_F14_1_1_102.json
    ${pwd}    SSHLibrary.Execute Command    pwd
    SSHLibrary.Execute Command    cp ${path_getKids-fang}/${file_getKids_TST_F14_1_1_102} ${path_getKids-fang}/${file_getKids_default}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_fang.getMobileNetwork}    ${CmdProduce_fang.getMobileNetwork}    ${DataProduce_TST_F14_1_1_102}
    #Consume คำสั่ง ลง kafka.requestNetworkStatus
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_fang.getMobileNetwork}    TST_F14_1_1_102
    # check ค่า \ \ \ kafka.requestNetworkStatus
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_fang.getMobileNetworkRequested_TST_F14_1_1_102}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCommandFileLog_fang}    TST_F14_1_1_102    ${PathLogGetMobileNetwork_fang}
    #set mock-up ของ get kids กลับไปเป็น default
    SSHLibrary.Execute Command    cp ${path_getKids-fang}/${file_getKids_000} ${path_getKids-fang}/${file_getKids_default}

TST_F14_0_1_103
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCommandFileLog_fang}    ${PathLogGetMobileNetwork_fang}
    #แก้ conf
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    ${path_getKids-fang}    BuiltIn.Set Variable    /home/serveradm/http_mockup/configs/response/getKids-fang
    ${file_getKids_default}    BuiltIn.Set Variable    default.json
    ${file_getKids_000}    BuiltIn.Set Variable    default_000.json  
    ${file_getKids_TST_F14_0_1_103}    BuiltIn.Set Variable    TST_F14_0_1_103.json
    ${pwd}    SSHLibrary.Execute Command    pwd
    SSHLibrary.Execute Command    cp ${path_getKids-fang}/${file_getKids_TST_F14_0_1_103} ${path_getKids-fang}/${file_getKids_default}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ProduceKafka    ${CmdDeleteMassage_fang.getMobileNetwork}    ${CmdProduce_fang.getMobileNetwork}    ${DataProduce_TST_F14_0_1_103}
    #Consume คำสั่ง ลง kafka.requestNetworkStatus
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ConsumeKafka    ${Consume_fang.getMobileNetwork}    TST_F14_0_1_103
    # check ค่า \ \ \ kafka.requestNetworkStatus
    VerifyDataConsume    ${ConsumeResult}    ${DataExpected_fang.getMobileNetworkRequested_TST_F14_0_1_103}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    FlushLogbyCommandName    ${NameCommandFileLog_fang}    TST_F14_0_1_103    ${PathLogGetMobileNetwork_fang}
    #set mock-up ของ get kids กลับไปเป็น default
    SSHLibrary.Execute Command    cp ${path_getKids-fang}/${file_getKids_000} ${path_getKids-fang}/${file_getKids_default}

