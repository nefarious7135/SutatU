*** Settings ***
Resource          Valiable.robot
Resource          ../../Keyword/Common.robot
Resource          ../../Keyword/MongoDB.robot
Resource          ../../Keyword/SecureCRT.robot
Resource          ../../Valiables/CommonValiable/CommonValiable.robot
*** Test Cases ***
TST_F13_1_1_004
    #กำหนดค่าในเคส
    ${msisdn}    BuiltIn.Set Variable    {"msisdn" : "66812340006"}
    ${TC_Number}    BuiltIn.Set Variable    TST_F13_1_1_004
    #หาในDB ว่ามี msisdn ไหม
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    #ข้ามขั้นตอนนี้ เพราะ app จะไป insert ค่าให้
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    {"msisdn":"66812340006","package":{"currentPackage":"O2103P210305313","productSequenceId":"0002480109997","freeUnitExpireTime":"20230331235959+0700"},"5GMode":{"changeModePerday":{"count":1,"currentDate":"20230327"},"currentMode":{"modeName":"game_mode","expireDate":"20230430:000000"},"lastDefaultMode":"max_mode"}}    ${ID}
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCommandFileLog}    ${PathLogActivate5GMode}
    SetLogNull    ${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ProduceKafka    ${delete_qa.5GModeActivated}    ${Produce_qa.activate5GMode}    {"key":"Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId":"ios-20230327111117974MRPusL4Tsc","command":"qa.activate5GMode","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812340006","transactionId":"TST_F13_1_1_004"},"dataBody":{"accessToken":"02eyJhbGciOiJIUzI1NiJ9.eyJtb2JpbGVObyI6IjA5MTAwMzEzNDYiLCJuZXR3b3JrVHlwZSI6Ik1BU1MiLCJ0aW1lc3RhbXAiOiIyMDIzLTAzLTE1VDE0OjEwOjE0KzA3OjAwIn0.jTwLjjC9p0t9IbVC5w3nI8R7WBahJuVC_J2BrKEypJ0","msisdn":"66812340006","networkType":"CPE","modeName":"max_mode","promotionCode":"","packType":"","effectiveOption":""}}}
    #Consume คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ConsumeKafka    ${Consume_qa.5GModeActivated}    ${TC_Number}
    log    ${ConsumeResult}
    # check ค่า
    VerifyDataConsume    ${ConsumeResult}    {"key":"Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId":"ios-20230327111117974MRPusL4Tsc","command":"qa.5GModeActivated","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812340006","transactionId":"TST_F13_1_1_004"},"dataBody":{"resultCode":"20000","resultDesc":"Success","developerMessage":"Success","modeName":"max_mode"}}}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    FlushLogbyCommandName    ${NameCommandFileLog}    ${TC_Number}    ${PathLogActivate5GMode}
    FlushLogbyCommandName    ${NameCommandFileLogChkAddPack}    ${TC_Number}_${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    # querydata
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    #check db
    ${currentDate}    CurrentDate
    VerifyMongoDB    ${Jsondata}    {"msisdn":"66812340006","package":{"currentPackage":"O2103P210305313","productSequenceId":"0002480109997","freeUnitExpireTime":"20230331235959+0700"},"5GMode":{"changeModePerday":{"count":0,"currentDate":"${currentDate}"},"currentMode":{"modeName":"max_mode","expireDate":"20991231:235959"},"lastDefaultMode":"max_mode"}}
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    DeleteDataFromID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${ID}
    [Teardown]    Close All Connections

TST_F13_1_1_005
    #กำหนดค่าในเคส
    ${msisdn}    BuiltIn.Set Variable    {"msisdn" : "66812340007"}
    ${TC_Number}    BuiltIn.Set Variable    TST_F13_1_1_005
    #หาในDB ว่ามี msisdn ไหม
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    #ข้ามขั้นตอนนี้ เพราะ app จะไป insert ค่าให้
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    {"msisdn":"66812340007","package":{"currentPackage":"O2103P210305313","productSequenceId":"0002480109997","freeUnitExpireTime":"20230331235959+0700"},"5GMode":{"changeModePerday":{"count":1,"currentDate":"20230327"},"currentMode":{"modeName":"boost_mode","expireDate":"20230430:000000"},"lastDefaultMode":"max_mode"}}    ${ID}
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCommandFileLog}    ${PathLogActivate5GMode}
    SetLogNull    ${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ProduceKafka    ${delete_qa.5GModeActivated}    ${Produce_qa.activate5GMode}    {"key":"Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId":"ios-20230327111117974MRPusL4Tsc","command":"qa.activate5GMode","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812340007","transactionId":"TST_F13_1_1_005"},"dataBody":{"accessToken":"02eyJhbGciOiJIUzI1NiJ9.eyJtb2JpbGVObyI6IjA5MTAwMzEzNDYiLCJuZXR3b3JrVHlwZSI6Ik1BU1MiLCJ0aW1lc3RhbXAiOiIyMDIzLTAzLTE1VDE0OjEwOjE0KzA3OjAwIn0.jTwLjjC9p0t9IbVC5w3nI8R7WBahJuVC_J2BrKEypJ0","msisdn":"66812340007","networkType":"CPE","modeName":"max_mode","promotionCode":"0002480109997","packType":"ontop","effectiveOption":"I"}}}
    #Consume คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ConsumeKafka    ${Consume_qa.5GModeActivated}    ${TC_Number}
    log    ${ConsumeResult}
    # check ค่า
    VerifyDataConsume    ${ConsumeResult}    {"key":"Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId":"ios-20230327111117974MRPusL4Tsc","command":"qa.5GModeActivated","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812340007","transactionId":"TST_F13_1_1_005"},"dataBody":{"resultCode":"20000","resultDesc":"Success","developerMessage":"Success","modeName":"max_mode"}}}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    FlushLogbyCommandName    ${NameCommandFileLog}    ${TC_Number}    ${PathLogActivate5GMode}
    FlushLogbyCommandName    ${NameCommandFileLogChkAddPack}    ${TC_Number}_${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    # querydata
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    #check db
    ${currentDate}    CurrentDate
    VerifyMongoDB    ${Jsondata}    {"msisdn":"66812340007","package":{"currentPackage":"O2103P210305313","productSequenceId":"0002480109997","freeUnitExpireTime":"20230331235959+0700"},"5GMode":{"changeModePerday":{"count":0,"currentDate":"${currentDate}"},"currentMode":{"modeName":"max_mode","expireDate":"20991231:235959"},"lastDefaultMode":"max_mode"}}
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    DeleteDataFromID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${ID}
    [Teardown]    Close All Connections

TST_F13_1_1_010
    #กำหนดค่าในเคส
    ${msisdn}    BuiltIn.Set Variable    {"msisdn" : "66812340012"}
    ${TC_Number}    BuiltIn.Set Variable    TST_F13_1_1_010
    #หาในDB ว่ามี msisdn ไหม
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    #ข้ามขั้นตอนนี้ เพราะ app จะไป insert ค่าให้
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    {"msisdn":"66812340012","package":{"currentPackage":"O2103P210305313","productSequenceId":"0002480109997","freeUnitExpireTime":"20230331235959+0700"},"5GMode":{"changeModePerday":{"count":0,"currentDate":"20230327"},"currentMode":{"modeName":"","expireDate":""},"lastDefaultMode":""}}    ${ID}
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCommandFileLog}    ${PathLogActivate5GMode}
    SetLogNull    ${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ProduceKafka    ${delete_qa.5GModeActivated}    ${Produce_qa.activate5GMode}    {"key":"Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId":"ios-20230327111117974MRPusL4Tsc","command":"qa.activate5GMode","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812340012","transactionId":"TST_F13_1_1_010"},"dataBody":{"accessToken":"02eyJhbGciOiJIUzI1NiJ9.eyJtb2JpbGVObyI6IjA5MTAwMzEzNDYiLCJuZXR3b3JrVHlwZSI6Ik1BU1MiLCJ0aW1lc3RhbXAiOiIyMDIzLTAzLTE1VDE0OjEwOjE0KzA3OjAwIn0.jTwLjjC9p0t9IbVC5w3nI8R7WBahJuVC_J2BrKEypJ0","msisdn":"66812340012","networkType":"CPE","modeName":"boost_mode","promotionCode":"0002480109997","packType":"ontop","effectiveOption":"I"}}}
    #Consume คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ConsumeKafka    ${Consume_qa.5GModeActivated}    ${TC_Number}
    log    ${ConsumeResult}
    # check ค่า
    VerifyDataConsume    ${ConsumeResult}    {"key":"Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId":"ios-20230327111117974MRPusL4Tsc","command":"qa.5GModeActivated","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812340012","transactionId":"TST_F13_1_1_010"},"dataBody":{"resultCode":"20000","resultDesc":"Success","developerMessage":"Success","modeName":"boost_mode"}}}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    FlushLogbyCommandName    ${NameCommandFileLog}    ${TC_Number}    ${PathLogActivate5GMode}
    FlushLogbyCommandName    ${NameCommandFileLogChkAddPack}    ${TC_Number}_${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    # querydata
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    ${JsondataexpireDate}    ${JsondataexpireDateTime}    GetExpireDateFromJson    ${Jsondata}
    #check db
    ${currentDate}    CurrentDate
    ${CurrentDateAndTime+1hour}    CurrentDateAndTime+1hour
    ${expireDate}    CurrentDateAndTimeNow
    ${CurrentDateAndTime+1hour-1min}    CurrentDateAndTime+1hour-1min
    IF    '${CurrentDateAndTime+1hour}'=='${JsondataexpireDateTime}' or '${CurrentDateAndTime+1hour-1min}'=='${JsondataexpireDateTime}'
        ${expireDate}    BuiltIn.Set Variable    ${JsondataexpireDate}
    END
    VerifyMongoDB    ${Jsondata}    {"msisdn":"66812340012","package":{"currentPackage":"O2103P210305313","productSequenceId":"0002480109997","freeUnitExpireTime":"20230331235959+0700"},"5GMode":{"changeModePerday":{"count":1,"currentDate":"${currentDate}"},"currentMode":{"modeName":"boost_mode","expireDate":"${expireDate}"},"lastDefaultMode":"max_mode"}}
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    DeleteDataFromID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${ID}
    [Teardown]    Close All Connections

TST_F13_1_1_040
    #กำหนดค่าในเคส
    ${msisdn}    BuiltIn.Set Variable    {"msisdn" : "66812345699"}
    ${TC_Number}    BuiltIn.Set Variable    TST_F13_1_1_040
    #หาในDB ว่ามี msisdn ไหม
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    #ข้ามขั้นตอนนี้ เพราะ app จะไป insert ค่าให้
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    {"msisdn":"66812345699","package":{"currentPackage":"O2103P210305313","productSequenceId":"0002480109997","freeUnitExpireTime":"20230331235959+0700"},"5GMode":{"changeModePerday":{"count":0,"currentDate":"20230327"},"currentMode":{"modeName":"max_mode","expireDate":"20991231:235959"},"lastDefaultMode":"max_mode"}}    ${ID}
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCommandFileLog}    ${PathLogActivate5GMode}
    SetLogNull    ${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    #produce คำสั่ง ลง kafka
    ProduceKafka    ${delete_qa.5GModeActivated}    ${Produce_qa.activate5GMode}    {"key":"Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId":"ios-20230327111117974MRPusL4Tsc","command":"mfaf.activate5GMode","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812345699","transactionId":"TST_F13_1_1_040"},"dataBody":{"accessToken":"02eyJhbGciOiJIUzI1NiJ9.eyJtb2JpbGVObyI6IjA5MTAwMzEzNDYiLCJuZXR3b3JrVHlwZSI6Ik1BU1MiLCJ0aW1lc3RhbXAiOiIyMDIzLTAzLTE1VDE0OjEwOjE0KzA3OjAwIn0.jTwLjjC9p0t9IbVC5w3nI8R7WBahJuVC_J2BrKEypJ0","msisdn":"66812345699","networkType":"CPE","modeName":"eco_mode","promotionCode":"0002480109997","packType":"ontop","effectiveOption":"I"}}}
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    #Consume คำสั่ง ลง kafka
    ConsumeKafka    ${Consume_qa.5GModeActivated}    ${TC_Number}
    log    ${ConsumeResult}
    # check ค่า
    VerifyDataConsume    ${ConsumeResult}    {"key":"Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId":"ios-20230327111117974MRPusL4Tsc","command":"qa.5GModeActivated","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812345699","transactionId":"TST_F13_1_1_040"},"dataBody":{"resultCode":"20000","resultDesc":"Success","developerMessage":"Success","modeName":"eco_mode"}}}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    FlushLogbyCommandName    ${NameCommandFileLog}    ${TC_Number}    ${PathLogActivate5GMode}
    FlushLogbyCommandName    ${NameCommandFileLogChkAddPack}    ${TC_Number}_${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    # querydata
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    #check db
    ${currentDate}    CurrentDate
    VerifyMongoDB    ${Jsondata}    {"msisdn":"66812345699","package":{"currentPackage":"O2103P210305313","productSequenceId":"0002480109997","freeUnitExpireTime":"20230331235959+0700"},"5GMode":{"changeModePerday":{"count":1,"currentDate":"${currentDate}"},"currentMode":{"modeName":"eco_mode","expireDate":"20991231:235959"},"lastDefaultMode":"max_mode"}}
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    DeleteDataFromID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${ID}
    [Teardown]    Close All Connections

TST_F13_1_1_041
    #กำหนดค่าในเคส
    ${msisdn}    BuiltIn.Set Variable    {"msisdn" : "66812345698"}
    ${TC_Number}    BuiltIn.Set Variable    TST_F13_1_1_041
    #หาในDB ว่ามี msisdn ไหม
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    #ข้ามขั้นตอนนี้ เพราะ app จะไป insert ค่าให้
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    {"msisdn":"66812345698","package":{"currentPackage":"O2103P210305313","productSequenceId":"0002480109997","freeUnitExpireTime":"20230331235959+0700"},"5GMode":{"changeModePerday":{"count":0,"currentDate":"20230327"},"currentMode":{"modeName":"boost_mode","expireDate":"20241231:235959"},"lastDefaultMode":"boost_mode"}}    ${ID}
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCommandFileLog}    ${PathLogActivate5GMode}
    SetLogNull    ${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ProduceKafka    ${delete_qa.5GModeActivated}    ${Produce_qa.activate5GMode}    {"key":"Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId":"ios-20230327111117974MRPusL4Tsc","command":"mfaf.activate5GMode","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812345698","transactionId":"TST_F13_1_1_041"},"dataBody":{"accessToken":"02eyJhbGciOiJIUzI1NiJ9.eyJtb2JpbGVObyI6IjA5MTAwMzEzNDYiLCJuZXR3b3JrVHlwZSI6Ik1BU1MiLCJ0aW1lc3RhbXAiOiIyMDIzLTAzLTE1VDE0OjEwOjE0KzA3OjAwIn0.jTwLjjC9p0t9IbVC5w3nI8R7WBahJuVC_J2BrKEypJ0","msisdn":"66812345698","networkType":"CPE","modeName":"eco_mode","promotionCode":"0002480109997","packType":"ontop","effectiveOption":"I"}}}
    #Consume คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ConsumeKafka    ${Consume_qa.5GModeActivated}    ${TC_Number}
    log    ${ConsumeResult}
    # check ค่า
    VerifyDataConsume    ${ConsumeResult}    {"key":"Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId":"ios-20230327111117974MRPusL4Tsc","command":"qa.5GModeActivated","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812345698","transactionId":"TST_F13_1_1_041"},"dataBody":{"resultCode":"20000","resultDesc":"Success","developerMessage":"Success","modeName":"eco_mode"}}}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    FlushLogbyCommandName    ${NameCommandFileLog}    ${TC_Number}    ${PathLogActivate5GMode}
    FlushLogbyCommandName    ${NameCommandFileLogChkAddPack}    ${TC_Number}_${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    # querydata
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    #check db
    ${currentDate}    CurrentDate
    VerifyMongoDB    ${Jsondata}    {"msisdn":"66812345698","package":{"currentPackage":"O2103P210305313","productSequenceId":"0002480109997","freeUnitExpireTime":"20230331235959+0700"},"5GMode":{"changeModePerday":{"count":1,"currentDate":"${currentDate}"},"currentMode":{"modeName":"eco_mode","expireDate":"20991231:235959"},"lastDefaultMode":"max_mode"}}
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    DeleteDataFromID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${ID}
    [Teardown]    Close All Connections

TST_F13_1_1_042
    #กำหนดค่าในเคส
    ${msisdn}    BuiltIn.Set Variable    {"msisdn" : "66812345697"}
    ${TC_Number}    BuiltIn.Set Variable    TST_F13_1_1_042
    #หาในDB ว่ามี msisdn ไหม
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    #ข้ามขั้นตอนนี้ เพราะ app จะไป insert ค่าให้
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    {"msisdn":"66812345697","package":{"currentPackage":"O2103P210305313","productSequenceId":"0002480109997","freeUnitExpireTime":"20230331235959+0700"},"5GMode":{"changeModePerday":{"count":0,"currentDate":"20230327"},"currentMode":{"modeName":"game_mode","expireDate":"20241231:235959"},"lastDefaultMode":"game_mode"}}    ${ID}
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCommandFileLog}    ${PathLogActivate5GMode}
    SetLogNull    ${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ProduceKafka    ${delete_qa.5GModeActivated}    ${Produce_qa.activate5GMode}    {"key":"Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId":"ios-20230327111117974MRPusL4Tsc","command":"mfaf.activate5GMode","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812345697","transactionId":"TST_F13_1_1_042"},"dataBody":{"accessToken":"02eyJhbGciOiJIUzI1NiJ9.eyJtb2JpbGVObyI6IjA5MTAwMzEzNDYiLCJuZXR3b3JrVHlwZSI6Ik1BU1MiLCJ0aW1lc3RhbXAiOiIyMDIzLTAzLTE1VDE0OjEwOjE0KzA3OjAwIn0.jTwLjjC9p0t9IbVC5w3nI8R7WBahJuVC_J2BrKEypJ0","msisdn":"66812345697","networkType":"CPE","modeName":"eco_mode","promotionCode":"0002480109997","packType":"ontop","effectiveOption":"I"}}}
    #Consume คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ConsumeKafka    ${Consume_qa.5GModeActivated}    ${msisdn}
    log    ${ConsumeResult}
    # check ค่า
    VerifyDataConsume    ${ConsumeResult}    {"key":"Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId":"ios-20230327111117974MRPusL4Tsc","command":"qa.5GModeActivated","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812345697","transactionId":"TST_F13_1_1_042"},"dataBody":{"resultCode":"20000","resultDesc":"Success","developerMessage":"Success","modeName":"eco_mode"}}}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    FlushLogbyCommandName    ${NameCommandFileLog}    ${msisdn}    ${PathLogActivate5GMode}
    FlushLogbyCommandName    ${NameCommandFileLogChkAddPack}    ${msisdn}_${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    # querydata
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    #check db
    ${currentDate}    CurrentDate
    VerifyMongoDB    ${Jsondata}    {"msisdn":"66812345697","package":{"currentPackage":"O2103P210305313","productSequenceId":"0002480109997","freeUnitExpireTime":"20230331235959+0700"},"5GMode":{"changeModePerday":{"count":1,"currentDate":"${currentDate}"},"currentMode":{"modeName":"eco_mode","expireDate":"20991231:235959"},"lastDefaultMode":"max_mode"}}
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    DeleteDataFromID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${ID}

TST_F13_1_1_043
    #กำหนดค่าในเคส
    ${msisdn}    BuiltIn.Set Variable    {"msisdn" : "66812345699"}
    ${TC_Number}    BuiltIn.Set Variable    TST_F13_1_1_043
    #หาในDB ว่ามี msisdn ไหม
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    #ข้ามขั้นตอนนี้ เพราะ app จะไป insert ค่าให้
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    {"msisdn":"66812345699","package":{"currentPackage":"O2103P210305313","productSequenceId":"0002480109997","freeUnitExpireTime":"20230331235959+0700"},"5GMode":{"changeModePerday":{"count":1,"currentDate":"20230327"},"currentMode":{"modeName":"max_mode","expireDate":"20991231:235959"},"lastDefaultMode":"max_mode"}}    ${ID}
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCommandFileLog}    ${PathLogActivate5GMode}
    SetLogNull    ${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    #produce คำสั่ง ลง kafka
    ProduceKafka    ${delete_qa.5GModeActivated}    ${Produce_qa.activate5GMode}    {"key":"Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId":"ios-20230327111117974MRPusL4Tsc","command":"mfaf.activate5GMode","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812345699","transactionId":"TST_F13_1_1_043"},"dataBody":{"accessToken":"02eyJhbGciOiJIUzI1NiJ9.eyJtb2JpbGVObyI6IjA5MTAwMzEzNDYiLCJuZXR3b3JrVHlwZSI6Ik1BU1MiLCJ0aW1lc3RhbXAiOiIyMDIzLTAzLTE1VDE0OjEwOjE0KzA3OjAwIn0.jTwLjjC9p0t9IbVC5w3nI8R7WBahJuVC_J2BrKEypJ0","msisdn":"66812345699","networkType":"CPE","modeName":"eco_mode","promotionCode":"0002480109997","packType":"ontop","effectiveOption":"I"}}}
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    #Consume คำสั่ง ลง kafka
    ConsumeKafka    ${Consume_qa.5GModeActivated}    ${TC_Number}
    log    ${ConsumeResult}
    # check ค่า
    VerifyDataConsume    ${ConsumeResult}    {"key":"Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId":"ios-20230327111117974MRPusL4Tsc","command":"qa.5GModeActivated","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812345699","transactionId":"TST_F13_1_1_043"},"dataBody":{"resultCode":"20000","resultDesc":"Success","developerMessage":"Success","modeName":"eco_mode"}}}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    FlushLogbyCommandName    ${NameCommandFileLog}    ${TC_Number}    ${PathLogActivate5GMode}
    FlushLogbyCommandName    ${NameCommandFileLogChkAddPack}    ${TC_Number}_${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    # querydata
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    #check db
    ${currentDate}    CurrentDate
    VerifyMongoDB    ${Jsondata}    {"msisdn":"66812345699","package":{"currentPackage":"O2103P210305313","productSequenceId":"0002480109997","freeUnitExpireTime":"20230331235959+0700"},"5GMode":{"changeModePerday":{"count":1,"currentDate":"${currentDate}"},"currentMode":{"modeName":"eco_mode","expireDate":"20991231:235959"},"lastDefaultMode":"max_mode"}}
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    DeleteDataFromID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${ID}
    [Teardown]    Close All Connections

TST_F13_1_1_044
    #กำหนดค่าในเคส
    ${msisdn}    BuiltIn.Set Variable    {"msisdn" : "66812345698"}
    ${TC_Number}    BuiltIn.Set Variable    TST_F13_1_1_044
    #หาในDB ว่ามี msisdn ไหม
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    #ข้ามขั้นตอนนี้ เพราะ app จะไป insert ค่าให้
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    {"msisdn":"66812345698","package":{"currentPackage":"O2103P210305313","productSequenceId":"0002480109997","freeUnitExpireTime":"20230331235959+0700"},"5GMode":{"changeModePerday":{"count":1,"currentDate":"20230327"},"currentMode":{"modeName":"boost_mode","expireDate":"20241231:235959"},"lastDefaultMode":"boost_mode"}}    ${ID}
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCommandFileLog}    ${PathLogActivate5GMode}
    SetLogNull    ${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ProduceKafka    ${delete_qa.5GModeActivated}    ${Produce_qa.activate5GMode}    {"key":"Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId":"ios-20230327111117974MRPusL4Tsc","command":"mfaf.activate5GMode","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812345698","transactionId":"TST_F13_1_1_044"},"dataBody":{"accessToken":"02eyJhbGciOiJIUzI1NiJ9.eyJtb2JpbGVObyI6IjA5MTAwMzEzNDYiLCJuZXR3b3JrVHlwZSI6Ik1BU1MiLCJ0aW1lc3RhbXAiOiIyMDIzLTAzLTE1VDE0OjEwOjE0KzA3OjAwIn0.jTwLjjC9p0t9IbVC5w3nI8R7WBahJuVC_J2BrKEypJ0","msisdn":"66812345698","networkType":"CPE","modeName":"eco_mode","promotionCode":"0002480109997","packType":"ontop","effectiveOption":"I"}}}
    #Consume คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ConsumeKafka    ${Consume_qa.5GModeActivated}    ${TC_Number}
    log    ${ConsumeResult}
    # check ค่า
    VerifyDataConsume    ${ConsumeResult}    {"key":"Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId":"ios-20230327111117974MRPusL4Tsc","command":"qa.5GModeActivated","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812345698","transactionId":"TST_F13_1_1_044"},"dataBody":{"resultCode":"20000","resultDesc":"Success","developerMessage":"Success","modeName":"eco_mode"}}}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    FlushLogbyCommandName    ${NameCommandFileLog}    ${TC_Number}    ${PathLogActivate5GMode}
    FlushLogbyCommandName    ${NameCommandFileLogChkAddPack}    ${TC_Number}_${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    # querydata
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    #check db
    ${currentDate}    CurrentDate
    VerifyMongoDB    ${Jsondata}    {"msisdn":"66812345698","package":{"currentPackage":"O2103P210305313","productSequenceId":"0002480109997","freeUnitExpireTime":"20230331235959+0700"},"5GMode":{"changeModePerday":{"count":1,"currentDate":"${currentDate}"},"currentMode":{"modeName":"eco_mode","expireDate":"20991231:235959"},"lastDefaultMode":"max_mode"}}
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    DeleteDataFromID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${ID}
    [Teardown]    Close All Connections

TST_F13_1_1_045
    #กำหนดค่าในเคส
    ${msisdn}    BuiltIn.Set Variable    {"msisdn" : "66812345697"}
    ${TC_Number}    BuiltIn.Set Variable    TST_F13_1_1_045
    #หาในDB ว่ามี msisdn ไหม
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    #ข้ามขั้นตอนนี้ เพราะ app จะไป insert ค่าให้
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    {"msisdn":"66812345697","package":{"currentPackage":"O2103P210305313","productSequenceId":"0002480109997","freeUnitExpireTime":"20230331235959+0700"},"5GMode":{"changeModePerday":{"count":1,"currentDate":"20230327"},"currentMode":{"modeName":"game_mode","expireDate":"20241231:235959"},"lastDefaultMode":"game_mode"}}    ${ID}
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCommandFileLog}    ${PathLogActivate5GMode}
    SetLogNull    ${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ProduceKafka    ${delete_qa.5GModeActivated}    ${Produce_qa.activate5GMode}    {"key":"Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId":"ios-20230327111117974MRPusL4Tsc","command":"mfaf.activate5GMode","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812345697","transactionId":"TST_F13_1_1_045"},"dataBody":{"accessToken":"02eyJhbGciOiJIUzI1NiJ9.eyJtb2JpbGVObyI6IjA5MTAwMzEzNDYiLCJuZXR3b3JrVHlwZSI6Ik1BU1MiLCJ0aW1lc3RhbXAiOiIyMDIzLTAzLTE1VDE0OjEwOjE0KzA3OjAwIn0.jTwLjjC9p0t9IbVC5w3nI8R7WBahJuVC_J2BrKEypJ0","msisdn":"66812345697","networkType":"CPE","modeName":"eco_mode","promotionCode":"0002480109997","packType":"ontop","effectiveOption":"I"}}}
    #Consume คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ConsumeKafka    ${Consume_qa.5GModeActivated}    ${TC_Number}
    log    ${ConsumeResult}
    # check ค่า
    VerifyDataConsume    ${ConsumeResult}    {"key":"Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId":"ios-20230327111117974MRPusL4Tsc","command":"qa.5GModeActivated","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812345697","transactionId":"TST_F13_1_1_045"},"dataBody":{"resultCode":"20000","resultDesc":"Success","developerMessage":"Success","modeName":"eco_mode"}}}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    FlushLogbyCommandName    ${NameCommandFileLog}    ${TC_Number}    ${PathLogActivate5GMode}
    FlushLogbyCommandName    ${NameCommandFileLogChkAddPack}    ${TC_Number}_${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    # querydata
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    #check db
    ${currentDate}    CurrentDate
    VerifyMongoDB    ${Jsondata}    {"msisdn":"66812345697","package":{"currentPackage":"O2103P210305313","productSequenceId":"0002480109997","freeUnitExpireTime":"20230331235959+0700"},"5GMode":{"changeModePerday":{"count":1,"currentDate":"${currentDate}"},"currentMode":{"modeName":"eco_mode","expireDate":"20991231:235959"},"lastDefaultMode":"max_mode"}}
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    DeleteDataFromID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${ID}
    [Teardown]    Close All Connections

TST_F13_1_1_046
    #กำหนดค่าในเคส
    ${msisdn}    BuiltIn.Set Variable    {"msisdn" : "66812345693"}
    ${TC_Number}    BuiltIn.Set Variable    TST_F13_1_1_046
    #หาในDB ว่ามี msisdn ไหม
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    #ข้ามขั้นตอนนี้ เพราะ app จะไป insert ค่าให้
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    {"msisdn":"66812345693","package":{"currentPackage":"O2103P210305313","productSequenceId":"0002480109997","freeUnitExpireTime":"20230331235959+0700"}}    ${ID}
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCommandFileLog}    ${PathLogActivate5GMode}
    SetLogNull    ${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ProduceKafka    ${delete_qa.5GModeActivated}    ${Produce_qa.activate5GMode}    {"key":"Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId":"ios-20230327111117974MRPusL4Tsc","command":"mfaf.activate5GMode","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812345693","transactionId":"TST_F13_1_1_046"},"dataBody":{"accessToken":"02eyJhbGciOiJIUzI1NiJ9.eyJtb2JpbGVObyI6IjA5MTAwMzEzNDYiLCJuZXR3b3JrVHlwZSI6Ik1BU1MiLCJ0aW1lc3RhbXAiOiIyMDIzLTAzLTE1VDE0OjEwOjE0KzA3OjAwIn0.jTwLjjC9p0t9IbVC5w3nI8R7WBahJuVC_J2BrKEypJ0","msisdn":"66812345693","networkType":"CPE","modeName":"eco_mode","promotionCode":"0002480109997","packType":"ontop","effectiveOption":"I"}}}
    #Consume คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ConsumeKafka    ${Consume_qa.5GModeActivated}    ${TC_Number}
    log    ${ConsumeResult}
    # check ค่า
    VerifyDataConsume    ${ConsumeResult}    {"key":"Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId":"ios-20230327111117974MRPusL4Tsc","command":"qa.5GModeActivated","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812345693","transactionId":"TST_F13_1_1_046"},"dataBody":{"resultCode":"20000","resultDesc":"Success","developerMessage":"Success","modeName":"eco_mode"}}}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    FlushLogbyCommandName    ${NameCommandFileLog}    ${TC_Number}    ${PathLogActivate5GMode}
    FlushLogbyCommandName    ${NameCommandFileLogChkAddPack}    ${TC_Number}_${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    # querydata
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    #check db
    ${currentDate}    CurrentDate
    VerifyMongoDB    ${Jsondata}    {"msisdn":"66812345693","package":{"currentPackage":"O2103P210305313","productSequenceId":"0002480109997","freeUnitExpireTime":"20230331235959+0700"},"5GMode":{"changeModePerday":{"count":1,"currentDate":"${currentDate}"},"currentMode":{"modeName":"eco_mode","expireDate":"20991231:235959"},"lastDefaultMode":"max_mode"}}
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    DeleteDataFromID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${ID}
    [Teardown]    Close All Connections

TST_F13_1_1_051
    #กำหนดค่าในเคส
    ${msisdn}    BuiltIn.Set Variable    {"msisdn" : "66812345692"}
    ${TC_Number}    BuiltIn.Set Variable    TST_F13_1_1_051
    #หาในDB ว่ามี msisdn ไหม
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    #ข้ามขั้นตอนนี้ เพราะ app จะไป insert ค่าให้
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    {"msisdn":"66812345692","package":{"currentPackage":"O2103P210305313","productSequenceId":"0002480109997","freeUnitExpireTime":"20230331235959+0700"},"5GMode":{"changeModePerday":{"count":0,"currentDate":"20230327"},"currentMode":{"modeName":"eco_mode","expireDate":"20241231:235959"},"lastDefaultMode":"eco_mode"}}    ${ID}
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCommandFileLog}    ${PathLogActivate5GMode}
    SetLogNull    ${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ProduceKafka    ${delete_qa.5GModeActivated}    ${Produce_qa.activate5GMode}    {"key":"Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId":"ios-20230327111117974MRPusL4Tsc","command":"mfaf.activate5GMode","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812345692","transactionId":"TST_F13_1_1_051"},"dataBody":{"accessToken":"02eyJhbGciOiJIUzI1NiJ9.eyJtb2JpbGVObyI6IjA5MTAwMzEzNDYiLCJuZXR3b3JrVHlwZSI6Ik1BU1MiLCJ0aW1lc3RhbXAiOiIyMDIzLTAzLTE1VDE0OjEwOjE0KzA3OjAwIn0.jTwLjjC9p0t9IbVC5w3nI8R7WBahJuVC_J2BrKEypJ0","msisdn":"66812345692","networkType":"CPE","modeName":"max_mode"}}}
    #Consume คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ConsumeKafka    ${Consume_qa.5GModeActivated}    ${TC_Number}
    log    ${ConsumeResult}
    # check ค่า
    VerifyDataConsume    ${ConsumeResult}    {"key":"Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId":"ios-20230327111117974MRPusL4Tsc","command":"qa.5GModeActivated","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812345692","transactionId":"TST_F13_1_1_051"},"dataBody":{"resultCode":"20000","resultDesc":"Success","developerMessage":"Success","modeName":"max_mode"}}}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    FlushLogbyCommandName    ${NameCommandFileLog}    ${TC_Number}    ${PathLogActivate5GMode}
    FlushLogbyCommandName    ${NameCommandFileLogChkAddPack}    ${TC_Number}_${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    # querydata
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    #check db
    ${currentDate}    CurrentDate
    VerifyMongoDB    ${Jsondata}    {"msisdn":"66812345692","package":{"currentPackage":"O2103P210305313","productSequenceId":"0002480109997","freeUnitExpireTime":"20230331235959+0700"},"5GMode":{"changeModePerday":{"count":0,"currentDate":"${currentDate}"},"currentMode":{"modeName":"max_mode","expireDate":"20991231:235959"},"lastDefaultMode":"max_mode"}}
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    DeleteDataFromID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${ID}
    [Teardown]    Close All Connections

TST_F13_1_1_052
    #กำหนดค่าในเคส
    ${msisdn}    BuiltIn.Set Variable    {"msisdn" : "66812345691"}
    ${TC_Number}    BuiltIn.Set Variable    TST_F13_1_1_052
    #หาในDB ว่ามี msisdn ไหม
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    #ข้ามขั้นตอนนี้ เพราะ app จะไป insert ค่าให้
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    {"msisdn":"66812345691","package":{"currentPackage":"O2103P210305313","productSequenceId":"0002480109997","freeUnitExpireTime":"20230331235959+0700"},"5GMode":{"changeModePerday":{"count":0,"currentDate":"20230327"},"currentMode":{"modeName":"boost_mode","expireDate":"20231231:235959"},"lastDefaultMode":"boost_mode"}}    ${ID}
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCommandFileLog}    ${PathLogActivate5GMode}
    SetLogNull    ${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ProduceKafka    ${delete_qa.5GModeActivated}    ${Produce_qa.activate5GMode}    {"key":"Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId":"ios-20230327111117974MRPusL4Tsc","command":"mfaf.activate5GMode","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812345691","transactionId":"TST_F13_1_1_052"},"dataBody":{"accessToken":"02eyJhbGciOiJIUzI1NiJ9.eyJtb2JpbGVObyI6IjA5MTAwMzEzNDYiLCJuZXR3b3JrVHlwZSI6Ik1BU1MiLCJ0aW1lc3RhbXAiOiIyMDIzLTAzLTE1VDE0OjEwOjE0KzA3OjAwIn0.jTwLjjC9p0t9IbVC5w3nI8R7WBahJuVC_J2BrKEypJ0","msisdn":"66812345691","networkType":"CPE","modeName":"max_mode"}}}
    #Consume คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ConsumeKafka    ${Consume_qa.5GModeActivated}    ${TC_Number}
    log    ${ConsumeResult}
    # check ค่า
    VerifyDataConsume    ${ConsumeResult}    {"key":"Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId":"ios-20230327111117974MRPusL4Tsc","command":"qa.5GModeActivated","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812345691","transactionId":"TST_F13_1_1_052"},"dataBody":{"resultCode":"20000","resultDesc":"Success","developerMessage":"Success","modeName":"max_mode"}}}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    FlushLogbyCommandName    ${NameCommandFileLog}    ${TC_Number}    ${PathLogActivate5GMode}
    FlushLogbyCommandName    ${NameCommandFileLogChkAddPack}    ${TC_Number}_${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    # querydata
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    #check db
    ${currentDate}    CurrentDate
    VerifyMongoDB    ${Jsondata}    {"msisdn":"66812345691","package":{"currentPackage":"O2103P210305313","productSequenceId":"0002480109997","freeUnitExpireTime":"20230331235959+0700"},"5GMode":{"changeModePerday":{"count":0,"currentDate":"${currentDate}"},"currentMode":{"modeName":"max_mode","expireDate":"20991231:235959"},"lastDefaultMode":"max_mode"}}
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    DeleteDataFromID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${ID}
    [Teardown]    Close All Connections

TST_F13_1_1_053
    #กำหนดค่าในเคส
    ${msisdn}    BuiltIn.Set Variable    {"msisdn" : "66812345690"}
    ${TC_Number}    BuiltIn.Set Variable    TST_F13_1_1_053
    #หาในDB ว่ามี msisdn ไหม
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    #ข้ามขั้นตอนนี้ เพราะ app จะไป insert ค่าให้
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    {"msisdn":"66812345690","package":{"currentPackage":"O2103P210305313","freeUnitExpireTime":"20230331235959+0700","productSequenceId":"0002480109997"},"5GMode":{"changeModePerday":{"count":0,"currentDate":"20230327"},"currentMode":{"modeName":"game_mode","expireDate":"20231231:235959"},"lastDefaultMode":"game_mode"}}    ${ID}
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCommandFileLog}    ${PathLogActivate5GMode}
    SetLogNull    ${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ProduceKafka    ${delete_qa.5GModeActivated}    ${Produce_qa.activate5GMode}    {"key":"Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId":"ios-20230327111117974MRPusL4Tsc","command":"mfaf.activate5GMode","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812345690","transactionId":"TST_F13_1_1_053"},"dataBody":{"accessToken":"02eyJhbGciOiJIUzI1NiJ9.eyJtb2JpbGVObyI6IjA5MTAwMzEzNDYiLCJuZXR3b3JrVHlwZSI6Ik1BU1MiLCJ0aW1lc3RhbXAiOiIyMDIzLTAzLTE1VDE0OjEwOjE0KzA3OjAwIn0.jTwLjjC9p0t9IbVC5w3nI8R7WBahJuVC_J2BrKEypJ0","msisdn":"66812345690","networkType":"CPE","modeName":"max_mode"}}}
    #Consume คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ConsumeKafka    ${Consume_qa.5GModeActivated}    ${TC_Number}
    log    ${ConsumeResult}
    # check ค่า
    VerifyDataConsume    ${ConsumeResult}    {"key":"Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId":"ios-20230327111117974MRPusL4Tsc","command":"qa.5GModeActivated","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812345690","transactionId":"TST_F13_1_1_053"},"dataBody":{"resultCode":"20000","resultDesc":"Success","developerMessage":"Success","modeName":"max_mode"}}}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    FlushLogbyCommandName    ${NameCommandFileLog}    ${TC_Number}    ${PathLogActivate5GMode}
    FlushLogbyCommandName    ${NameCommandFileLogChkAddPack}    ${TC_Number}_${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    # querydata
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    #check db
    ${currentDate}    CurrentDate
    VerifyMongoDB    ${Jsondata}    {"msisdn":"66812345690","package":{"currentPackage":"O2103P210305313","productSequenceId":"0002480109997","freeUnitExpireTime":"20230331235959+0700"},"5GMode":{"changeModePerday":{"count":0,"currentDate":"${currentDate}"},"currentMode":{"modeName":"max_mode","expireDate":"20991231:235959"},"lastDefaultMode":"max_mode"}}
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    DeleteDataFromID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${ID}
    [Teardown]    Close All Connections

TST_F13_1_1_054
    #กำหนดค่าในเคส
    ${msisdn}    BuiltIn.Set Variable    {"msisdn" : "66812345692"}
    ${TC_Number}    BuiltIn.Set Variable    TST_F13_1_1_054
    #หาในDB ว่ามี msisdn ไหม
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    #ข้ามขั้นตอนนี้ เพราะ app จะไป insert ค่าให้
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    {"msisdn":"66812345692","package":{"currentPackage":"O2103P210305313","productSequenceId":"0002480109997","freeUnitExpireTime":"20230331235959+0700"},"5GMode":{"changeModePerday":{"count":1,"currentDate":"20230327"},"currentMode":{"modeName":"eco_mode","expireDate":"20231231:235959"},"lastDefaultMode":"eco_mode"}}    ${ID}
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCommandFileLog}    ${PathLogActivate5GMode}
    SetLogNull    ${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ProduceKafka    ${delete_qa.5GModeActivated}    ${Produce_qa.activate5GMode}    {"key":"Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId":"ios-20230327111117974MRPusL4Tsc","command":"mfaf.activate5GMode","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812345692","transactionId":"TST_F13_1_1_054"},"dataBody":{"accessToken":"02eyJhbGciOiJIUzI1NiJ9.eyJtb2JpbGVObyI6IjA5MTAwMzEzNDYiLCJuZXR3b3JrVHlwZSI6Ik1BU1MiLCJ0aW1lc3RhbXAiOiIyMDIzLTAzLTE1VDE0OjEwOjE0KzA3OjAwIn0.jTwLjjC9p0t9IbVC5w3nI8R7WBahJuVC_J2BrKEypJ0","msisdn":"66812345692","networkType":"CPE","modeName":"max_mode"}}}
    #Consume คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ConsumeKafka    ${Consume_qa.5GModeActivated}    ${TC_Number}
    log    ${ConsumeResult}
    # check ค่า
    VerifyDataConsume    ${ConsumeResult}    {"key":"Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId":"ios-20230327111117974MRPusL4Tsc","command":"qa.5GModeActivated","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812345692","transactionId":"TST_F13_1_1_054"},"dataBody":{"resultCode":"20000","resultDesc":"Success","developerMessage":"Success","modeName":"max_mode"}}}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    FlushLogbyCommandName    ${NameCommandFileLog}    ${TC_Number}    ${PathLogActivate5GMode}
    FlushLogbyCommandName    ${NameCommandFileLogChkAddPack}    ${TC_Number}_${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    # querydata
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    #check db
    ${currentDate}    CurrentDate
    VerifyMongoDB    ${Jsondata}    {"msisdn":"66812345692","package":{"currentPackage":"O2103P210305313","productSequenceId":"0002480109997","freeUnitExpireTime":"20230331235959+0700"},"5GMode":{"changeModePerday":{"count":0,"currentDate":"${currentDate}"},"currentMode":{"modeName":"max_mode","expireDate":"20991231:235959"},"lastDefaultMode":"max_mode"}}
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    DeleteDataFromID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${ID}
    [Teardown]    Close All Connections

TST_F13_1_1_055
    #กำหนดค่าในเคส
    ${msisdn}    BuiltIn.Set Variable    {"msisdn" : "66812345691"}
    ${TC_Number}    BuiltIn.Set Variable    TST_F13_1_1_055
    #หาในDB ว่ามี msisdn ไหม
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    #ข้ามขั้นตอนนี้ เพราะ app จะไป insert ค่าให้
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    {"msisdn":"66812345691","package":{"currentPackage":"O2103P210305313","productSequenceId":"0002480109997","freeUnitExpireTime":"20230331235959+0700"},"5GMode":{"changeModePerday":{"count":1,"currentDate":"20230327"},"currentMode":{"modeName":"boost_mode","expireDate":"20231231:235959"},"lastDefaultMode":"boost_mode"}}    ${ID}
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCommandFileLog}    ${PathLogActivate5GMode}
    SetLogNull    ${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ProduceKafka    ${delete_qa.5GModeActivated}    ${Produce_qa.activate5GMode}    {"key":"Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId":"ios-20230327111117974MRPusL4Tsc","command":"mfaf.activate5GMode","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812345691","transactionId":"TST_F13_1_1_055"},"dataBody":{"accessToken":"02eyJhbGciOiJIUzI1NiJ9.eyJtb2JpbGVObyI6IjA5MTAwMzEzNDYiLCJuZXR3b3JrVHlwZSI6Ik1BU1MiLCJ0aW1lc3RhbXAiOiIyMDIzLTAzLTE1VDE0OjEwOjE0KzA3OjAwIn0.jTwLjjC9p0t9IbVC5w3nI8R7WBahJuVC_J2BrKEypJ0","msisdn":"66812345691","networkType":"CPE","modeName":"max_mode"}}}
    #Consume คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ConsumeKafka    ${Consume_qa.5GModeActivated}    ${TC_Number}
    log    ${ConsumeResult}
    # check ค่า
    VerifyDataConsume    ${ConsumeResult}    {"key":"Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId":"ios-20230327111117974MRPusL4Tsc","command":"qa.5GModeActivated","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812345691","transactionId":"TST_F13_1_1_055"},"dataBody":{"resultCode":"20000","resultDesc":"Success","developerMessage":"Success","modeName":"max_mode"}}}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    FlushLogbyCommandName    ${NameCommandFileLog}    ${TC_Number}    ${PathLogActivate5GMode}
    FlushLogbyCommandName    ${NameCommandFileLogChkAddPack}    ${TC_Number}_${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    # querydata
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    #check db
    ${currentDate}    CurrentDate
    VerifyMongoDB    ${Jsondata}    {"msisdn":"66812345691","package":{"currentPackage":"O2103P210305313","productSequenceId":"0002480109997","freeUnitExpireTime":"20230331235959+0700"},"5GMode":{"changeModePerday":{"count":0,"currentDate":"${currentDate}"},"currentMode":{"modeName":"max_mode","expireDate":"20991231:235959"},"lastDefaultMode":"max_mode"}}
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    DeleteDataFromID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${ID}
    [Teardown]    Close All Connections

TST_F13_1_1_056
    #กำหนดค่าในเคส
    ${msisdn}    BuiltIn.Set Variable    {"msisdn" : "66812345690"}
    ${TC_Number}    BuiltIn.Set Variable    TST_F13_1_1_056
    #หาในDB ว่ามี msisdn ไหม
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    #ข้ามขั้นตอนนี้ เพราะ app จะไป insert ค่าให้
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    {"msisdn":"66812345690","package":{"currentPackage":"O2103P210305313","productSequenceId":"0002480109997","freeUnitExpireTime":"20230331235959+0700"},"5GMode":{"changeModePerday":{"count":1,"currentDate":"20230327"},"currentMode":{"modeName":"game_mode","expireDate":"20231231:235959"},"lastDefaultMode":"game_mode"}}    ${ID}
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCommandFileLog}    ${PathLogActivate5GMode}
    SetLogNull    ${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ProduceKafka    ${delete_qa.5GModeActivated}    ${Produce_qa.activate5GMode}    {"key":"Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId":"ios-20230327111117974MRPusL4Tsc","command":"mfaf.activate5GMode","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812345690","transactionId":"TST_F13_1_1_056"},"dataBody":{"accessToken":"02eyJhbGciOiJIUzI1NiJ9.eyJtb2JpbGVObyI6IjA5MTAwMzEzNDYiLCJuZXR3b3JrVHlwZSI6Ik1BU1MiLCJ0aW1lc3RhbXAiOiIyMDIzLTAzLTE1VDE0OjEwOjE0KzA3OjAwIn0.jTwLjjC9p0t9IbVC5w3nI8R7WBahJuVC_J2BrKEypJ0","msisdn":"66812345690","networkType":"CPE","modeName":"max_mode"}}}
    #Consume คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ConsumeKafka    ${Consume_qa.5GModeActivated}    ${TC_Number}
    log    ${ConsumeResult}
    # check ค่า
    VerifyDataConsume    ${ConsumeResult}    {"key":"Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId":"ios-20230327111117974MRPusL4Tsc","command":"qa.5GModeActivated","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812345690","transactionId":"TST_F13_1_1_056"},"dataBody":{"resultCode":"20000","resultDesc":"Success","developerMessage":"Success","modeName":"max_mode"}}}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    FlushLogbyCommandName    ${NameCommandFileLog}    ${TC_Number}    ${PathLogActivate5GMode}
    FlushLogbyCommandName    ${NameCommandFileLogChkAddPack}    ${TC_Number}_${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    # querydata
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    #check db
    ${currentDate}    CurrentDate
    VerifyMongoDB    ${Jsondata}    {"msisdn":"66812345690","package":{"currentPackage":"O2103P210305313","productSequenceId":"0002480109997","freeUnitExpireTime":"20230331235959+0700"},"5GMode":{"changeModePerday":{"count":0,"currentDate":"${currentDate}"},"currentMode":{"modeName":"max_mode","expireDate":"20991231:235959"},"lastDefaultMode":"max_mode"}}
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    DeleteDataFromID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${ID}
    [Teardown]    Close All Connections

TST_F13_1_1_057
    #กำหนดค่าในเคส
    ${msisdn}    BuiltIn.Set Variable    {"msisdn" : "66812345686"}
    ${TC_Number}    BuiltIn.Set Variable    TST_F13_1_1_057
    #หาในDB ว่ามี msisdn ไหม
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    #ข้ามขั้นตอนนี้ เพราะ app จะไป insert ค่าให้
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    {"msisdn":"66812345686","package":{"currentPackage":"O2103P210305313","productSequenceId":"0002480109997","freeUnitExpireTime":"20230331235959+0700"}}    ${ID}
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCommandFileLog}    ${PathLogActivate5GMode}
    SetLogNull    ${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ProduceKafka    ${delete_qa.5GModeActivated}    ${Produce_qa.activate5GMode}    {"key":"Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId":"ios-20230327111117974MRPusL4Tsc","command":"mfaf.activate5GMode","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812345686","transactionId":"TST_F13_1_1_057"},"dataBody":{"accessToken":"02eyJhbGciOiJIUzI1NiJ9.eyJtb2JpbGVObyI6IjA5MTAwMzEzNDYiLCJuZXR3b3JrVHlwZSI6Ik1BU1MiLCJ0aW1lc3RhbXAiOiIyMDIzLTAzLTE1VDE0OjEwOjE0KzA3OjAwIn0.jTwLjjC9p0t9IbVC5w3nI8R7WBahJuVC_J2BrKEypJ0","msisdn":"66812345686","networkType":"CPE","modeName":"max_mode"}}}
    #Consume คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ConsumeKafka    ${Consume_qa.5GModeActivated}    ${TC_Number}
    log    ${ConsumeResult}
    # check ค่า
    VerifyDataConsume    ${ConsumeResult}    {"key":"Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId":"ios-20230327111117974MRPusL4Tsc","command":"qa.5GModeActivated","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812345686","transactionId":"TST_F13_1_1_057"},"dataBody":{"resultCode":"20000","resultDesc":"Success","developerMessage":"Success","modeName":"max_mode"}}}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    FlushLogbyCommandName    ${NameCommandFileLog}    ${TC_Number}    ${PathLogActivate5GMode}
    FlushLogbyCommandName    ${NameCommandFileLogChkAddPack}    ${TC_Number}_${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    # querydata
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    #check db
    ${currentDate}    CurrentDate
    VerifyMongoDB    ${Jsondata}    {"msisdn":"66812345686","package":{"currentPackage":"O2103P210305313","productSequenceId":"0002480109997","freeUnitExpireTime":"20230331235959+0700"},"5GMode":{"changeModePerday":{"count":0,"currentDate":"${currentDate}"},"currentMode":{"modeName":"max_mode","expireDate":"20991231:235959"},"lastDefaultMode":"max_mode"}}
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    DeleteDataFromID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${ID}
    [Teardown]    Close All Connections

TST_F13_1_1_061
    #กำหนดค่าในเคส
    ${msisdn}    BuiltIn.Set Variable    {"msisdn" : "66812344001"}
    ${TC_Number}    BuiltIn.Set Variable    TST_F13_1_1_061
    #หาในDB ว่ามี msisdn ไหม
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    #ข้ามขั้นตอนนี้ เพราะ app จะไป insert ค่าให้
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    {"msisdn":"66812344001","package":{"currentPackage":"O2103P210305313","productSequenceId":"0002480109997","freeUnitExpireTime":"20240401000000+0800"},"5GMode":{"changeModePerday":{"count":0,"currentDate":"20230401"},"currentMode":{"modeName":"boost_mode","expireDate":"20991231:235959"},"lastDefaultMode":"boost_mode"}}    ${ID}
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCommandFileLog}    ${PathLogActivate5GMode}
    SetLogNull    ${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ProduceKafka    ${delete_qa.5GModeActivated}    ${Produce_qa.activate5GMode}    {"key":"key_TST_F13_1_1_061","invokeId":"invokeId_TST_F13_1_1_061","command":"mfaf.activate5GMode","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812344001","transactionId":"TST_F13_1_1_061"},"dataBody":{"accessToken":"token","msisdn":"66812344001","networkType":"CPE","modeName":"game_mode","promotionCode":"0002480109997","packType":"ontop","effectiveOption":"I"}}}
    #Consume คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ConsumeKafka    ${Consume_qa.5GModeActivated}    ${TC_Number}
    log    ${ConsumeResult}
    # check ค่า
    VerifyDataConsume    ${ConsumeResult}    {"key":"key_TST_F13_1_1_061","invokeId":"invokeId_TST_F13_1_1_061","command":"qa.5GModeActivated","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812344001","transactionId":"TST_F13_1_1_061"},"dataBody":{"resultCode":"20000","resultDesc":"Success","developerMessage":"Success","modeName":"game_mode"}}}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    FlushLogbyCommandName    ${NameCommandFileLog}    ${TC_Number}    ${PathLogActivate5GMode}
    FlushLogbyCommandName    ${NameCommandFileLogChkAddPack}    ${TC_Number}_${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    # querydata
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    ${JsondataexpireDate}    ${JsondataexpireDateTime}    GetExpireDateFromJson    ${Jsondata}
    #check db
    ${currentDate}    CurrentDate
    ${CurrentDateAndTime+1hour}    CurrentDateAndTime+1hour
    ${expireDate}    CurrentDateAndTimeNow
    ${CurrentDateAndTime+1hour-1min}    CurrentDateAndTime+1hour-1min
    IF    '${CurrentDateAndTime+1hour}'=='${JsondataexpireDateTime}' or '${CurrentDateAndTime+1hour-1min}'=='${JsondataexpireDateTime}'
        ${expireDate}    BuiltIn.Set Variable    ${JsondataexpireDate}
    END
    VerifyMongoDB    ${Jsondata}    {"msisdn":"66812344001","package":{"currentPackage":"O2103P210305313","productSequenceId":"0002480109997","freeUnitExpireTime":"20240401000000+0800"},"5GMode":{"changeModePerday":{"count":1,"currentDate":"${currentDate}"},"currentMode":{"modeName":"game_mode","expireDate":"${expireDate}"},"lastDefaultMode":"max_mode"}}
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    DeleteDataFromID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${ID}
    [Teardown]    Close All Connections

TST_F13_1_1_062
    #กำหนดค่าในเคส
    ${msisdn}    BuiltIn.Set Variable    {"msisdn" : "66812344002"}
    ${TC_Number}    BuiltIn.Set Variable    TST_F13_1_1_062
    #หาในDB ว่ามี msisdn ไหม
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    #ข้ามขั้นตอนนี้ เพราะ app จะไป insert ค่าให้
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    {"msisdn":"66812344002","package":{"currentPackage":"O2103P210305313","productSequenceId":"0002480109997","freeUnitExpireTime":"20240401000000+0800"},"5GMode":{"changeModePerday":{"count":10,"currentDate":"20230401"},"currentMode":{"modeName":"boost_mode","expireDate":"20991231:235959"},"lastDefaultMode":"max_mode"}}    ${ID}
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCommandFileLog}    ${PathLogActivate5GMode}
    SetLogNull    ${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ProduceKafka    ${delete_qa.5GModeActivated}    ${Produce_qa.activate5GMode}    {"key":"Key_TST_F13_1_1_062","invokeId":"InvokeId_TST_F13_1_1_062","command":"mfaf.activate5GMode","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812344002","transactionId":"TST_F13_1_1_062"},"dataBody":{"accessToken":"token","msisdn":"66812344002","networkType":"CPE","modeName":"game_mode","promotionCode":"0002480109997","packType":"ontop","effectiveOption":"I"}}}
    #Consume คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ConsumeKafka    ${Consume_qa.5GModeActivated}    ${TC_Number}
    log    ${ConsumeResult}
    # check ค่า
    VerifyDataConsume    ${ConsumeResult}    {"key":"Key_TST_F13_1_1_062","invokeId":"InvokeId_TST_F13_1_1_062","command":"qa.5GModeActivated","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812344002","transactionId":"TST_F13_1_1_062"},"dataBody":{"resultCode":"20000","resultDesc":"Success","developerMessage":"Success","modeName":"game_mode"}}}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    FlushLogbyCommandName    ${NameCommandFileLog}    ${TC_Number}    ${PathLogActivate5GMode}
    FlushLogbyCommandName    ${NameCommandFileLogChkAddPack}    ${TC_Number}_${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    # querydata
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    ${JsondataexpireDate}    ${JsondataexpireDateTime}    GetExpireDateFromJson    ${Jsondata}
    #check db
    ${currentDate}    CurrentDate
    ${CurrentDateAndTime+1hour}    CurrentDateAndTime+1hour
    ${expireDate}    CurrentDateAndTimeNow
    ${CurrentDateAndTime+1hour-1min}    CurrentDateAndTime+1hour-1min
    IF    '${CurrentDateAndTime+1hour}'=='${JsondataexpireDateTime}' or '${CurrentDateAndTime+1hour-1min}'=='${JsondataexpireDateTime}'
        ${expireDate}    BuiltIn.Set Variable    ${JsondataexpireDate}
    END
    VerifyMongoDB    ${Jsondata}    {"msisdn":"66812344002","package":{"currentPackage":"O2103P210305313","productSequenceId":"0002480109997","freeUnitExpireTime":"20240401000000+0800"},"5GMode":{"changeModePerday":{"count":1,"currentDate":"${currentDate}"},"currentMode":{"modeName":"game_mode","expireDate":"${expireDate}"},"lastDefaultMode":"max_mode"}}
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    DeleteDataFromID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${ID}
    [Teardown]    Close All Connections

TST_F13_1_1_063
    #กำหนดค่าในเคส
    ${msisdn}    BuiltIn.Set Variable    {"msisdn" : "66812344003"}
    ${TC_Number}    BuiltIn.Set Variable    TST_F13_1_1_063
    #หาในDB ว่ามี msisdn ไหม
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    #ข้ามขั้นตอนนี้ เพราะ app จะไป insert ค่าให้
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    {"msisdn":"66812344003","package":{"currentPackage":"O2103P210305313_default_success","productSequenceId":"0002480109997","freeUnitExpireTime":"20230401000000+0800"}}    ${ID}
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCommandFileLog}    ${PathLogActivate5GMode}
    SetLogNull    ${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ProduceKafka    ${delete_qa.5GModeActivated}    ${Produce_qa.activate5GMode}    {"key":"Key_TST_F13_1_1_063","invokeId":"InvokeId_TST_F13_1_1_063","command":"mfaf.activate5GMode","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812344003","transactionId":"TST_F13_1_1_063"},"dataBody":{"accessToken":"token","msisdn":"66812344003","networkType":"CPE","modeName":"game_mode","promotionCode":"0002480109997","packType":"ontop","effectiveOption":"I"}}}
    #Consume คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ConsumeKafka    ${Consume_qa.5GModeActivated}    ${TC_Number}
    log    ${ConsumeResult}
    # check ค่า
    VerifyDataConsume    ${ConsumeResult}    {"key":"Key_TST_F13_1_1_063","invokeId":"InvokeId_TST_F13_1_1_063","command":"qa.5GModeActivated","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812344003","transactionId":"TST_F13_1_1_063"},"dataBody":{"resultCode":"20000","resultDesc":"Success","developerMessage":"Success","modeName":"game_mode"}}}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    FlushLogbyCommandName    ${NameCommandFileLog}    ${TC_Number}    ${PathLogActivate5GMode}
    FlushLogbyCommandName    ${NameCommandFileLogChkAddPack}    ${TC_Number}_${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    # querydata
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    ${JsondataexpireDate}    ${JsondataexpireDateTime}    GetExpireDateFromJson    ${Jsondata}
    #check db
    ${currentDate}    CurrentDate
    ${CurrentDateAndTime+1hour}    CurrentDateAndTime+1hour
    ${expireDate}    CurrentDateAndTimeNow
    ${CurrentDateAndTime+1hour-1min}    CurrentDateAndTime+1hour-1min
    IF    '${CurrentDateAndTime+1hour}'=='${JsondataexpireDateTime}' or '${CurrentDateAndTime+1hour-1min}'=='${JsondataexpireDateTime}'
        ${expireDate}    BuiltIn.Set Variable    ${JsondataexpireDate}
    END
    VerifyMongoDB    ${Jsondata}    {"msisdn":"66812344003","package":{"currentPackage":"O2103P210305313_default_success","productSequenceId":"0002480109997","freeUnitExpireTime":"20230401000000+0800"},"5GMode":{"changeModePerday":{"count":1,"currentDate":"${currentDate}"},"currentMode":{"modeName":"game_mode","expireDate":"${expireDate}"},"lastDefaultMode":"max_mode"}}
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    DeleteDataFromID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${ID}
    [Teardown]    Close All Connections

TST_F13_1_1_066
    #กำหนดค่าในเคส
    ${msisdn}    BuiltIn.Set Variable    {"msisdn" : "66812344006"}
    ${TC_Number}    BuiltIn.Set Variable    TST_F13_1_1_066
    #หาในDB ว่ามี msisdn ไหม
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    #ข้ามขั้นตอนนี้ เพราะ app จะไป insert ค่าให้
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    {"msisdn":"66812344006","package":{"currentPackage":"O2103P210305313","productSequenceId":"0002480109997","freeUnitExpireTime":"20240401000000+0800"},"5GMode":{"changeModePerday":{"count":0,"currentDate":"20230405"},"currentMode":{"modeName":"eco_mode","expireDate":"20991231:235959"},"lastDefaultMode":"eco_mode"}}    ${ID}
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCommandFileLog}    ${PathLogActivate5GMode}
    SetLogNull    ${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ProduceKafka    ${delete_qa.5GModeActivated}    ${Produce_qa.activate5GMode}    {"key":"Key_TST_F13_1_1_066","invokeId":"InvokeId_TST_F13_1_1_066","command":"mfaf.activate5GMode","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812344006","transactionId":"TST_F13_1_1_066"},"dataBody":{"accessToken":"SSB_TOKEN","msisdn":"66812344006","networkType":"CPE","modeName":"game_mode","promotionCode":"promo1","packType":"pack1","effectiveOption":"try"}}}
    #Consume คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ConsumeKafka    ${Consume_qa.5GModeActivated}    ${TC_Number}
    log    ${ConsumeResult}
    # check ค่า
    VerifyDataConsume    ${ConsumeResult}    {"key":"Key_TST_F13_1_1_066","invokeId":"InvokeId_TST_F13_1_1_066","command":"qa.5GModeActivated","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812344006","transactionId":"TST_F13_1_1_066"},"dataBody":{"resultCode":"20000","resultDesc":"Success","developerMessage":"Success","modeName":"game_mode"}}}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    FlushLogbyCommandName    ${NameCommandFileLog}    ${TC_Number}    ${PathLogActivate5GMode}
    FlushLogbyCommandName    ${NameCommandFileLogChkAddPack}    ${TC_Number}_${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    # querydata
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    ${JsondataexpireDate}    ${JsondataexpireDateTime}    GetExpireDateFromJson    ${Jsondata}
    #check db
    ${currentDate}    CurrentDate
    ${CurrentDateAndTime+1hour}    CurrentDateAndTime+1hour
    ${expireDate}    CurrentDateAndTimeNow
    ${CurrentDateAndTime+1hour-1min}    CurrentDateAndTime+1hour-1min
    IF    '${CurrentDateAndTime+1hour}'=='${JsondataexpireDateTime}' or '${CurrentDateAndTime+1hour-1min}'=='${JsondataexpireDateTime}'
        ${expireDate}    BuiltIn.Set Variable    ${JsondataexpireDate}
    END
    VerifyMongoDB    ${Jsondata}    {"msisdn":"66812344006","package":{"currentPackage":"O2103P210305313","productSequenceId":"0002480109997","freeUnitExpireTime":"20240401000000+0800"},"5GMode":{"changeModePerday":{"count":1,"currentDate":"${currentDate}"},"currentMode":{"modeName":"game_mode","expireDate":"${expireDate}"},"lastDefaultMode":"max_mode"}}
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    DeleteDataFromID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${ID}
    [Teardown]    Close All Connections

TST_F13_1_1_067
    #กำหนดค่าในเคส
    ${msisdn}    BuiltIn.Set Variable    {"msisdn" : "66812344007"}
    ${TC_Number}    BuiltIn.Set Variable    TST_F13_1_1_067
    #หาในDB ว่ามี msisdn ไหม
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    #ข้ามขั้นตอนนี้ เพราะ app จะไป insert ค่าให้
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    {"msisdn":"66812344007","package":{"currentPackage":"O2103P210305313","productSequenceId":"0002480109997","freeUnitExpireTime":"20240401000000+0800"},"5GMode":{"changeModePerday":{"count":10,"currentDate":"20230405:235959"},"currentMode":{"modeName":"eco_mode","expireDate":"20991231:235959"},"lastDefaultMode":"max_mode"}}    ${ID}
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCommandFileLog}    ${PathLogActivate5GMode}
    SetLogNull    ${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ProduceKafka    ${delete_qa.5GModeActivated}    ${Produce_qa.activate5GMode}    {"key":"Key_TST_F13_1_1_067","invokeId":"InvokeId_TST_F13_1_1_067","command":"mfaf.activate5GMode","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812344007","transactionId":"TST_F13_1_1_067"},"dataBody":{"accessToken":"SSB_TOKEN","msisdn":"66812344007","networkType":"CPE","modeName":"game_mode","promotionCode":"promo1","packType":"pack1","effectiveOption":"try"}}}
    #Consume คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ConsumeKafka    ${Consume_qa.5GModeActivated}    ${TC_Number}
    log    ${ConsumeResult}
    # check ค่า
    VerifyDataConsume    ${ConsumeResult}    {"key":"Key_TST_F13_1_1_067","invokeId":"InvokeId_TST_F13_1_1_067","command":"qa.5GModeActivated","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812344007","transactionId":"TST_F13_1_1_067"},"dataBody":{"resultCode":"20000","resultDesc":"Success","developerMessage":"Success","modeName":"game_mode"}}}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    FlushLogbyCommandName    ${NameCommandFileLog}    ${TC_Number}    ${PathLogActivate5GMode}
    FlushLogbyCommandName    ${NameCommandFileLogChkAddPack}    ${TC_Number}_${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    # querydata
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    ${JsondataexpireDate}    ${JsondataexpireDateTime}    GetExpireDateFromJson    ${Jsondata}
    #check db
    ${currentDate}    CurrentDate
    ${CurrentDateAndTime+1hour}    CurrentDateAndTime+1hour
    ${expireDate}    CurrentDateAndTimeNow
    ${CurrentDateAndTime+1hour-1min}    CurrentDateAndTime+1hour-1min
    IF    '${CurrentDateAndTime+1hour}'=='${JsondataexpireDateTime}' or '${CurrentDateAndTime+1hour-1min}'=='${JsondataexpireDateTime}'
        ${expireDate}    BuiltIn.Set Variable    ${JsondataexpireDate}
    END
    VerifyMongoDB    ${Jsondata}    {"msisdn":"66812344007","package":{"currentPackage":"O2103P210305313","productSequenceId":"0002480109997","freeUnitExpireTime":"20240401000000+0800"},"5GMode":{"changeModePerday":{"count":1,"currentDate":"${currentDate}"},"currentMode":{"modeName":"game_mode","expireDate":"${expireDate}"},"lastDefaultMode":"max_mode"}}
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    DeleteDataFromID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${ID}
    [Teardown]    Close All Connections

TST_F13_1_1_068
    #กำหนดค่าในเคส
    ${msisdn}    BuiltIn.Set Variable    {"msisdn" : "66812344008"}
    ${TC_Number}    BuiltIn.Set Variable    TST_F13_1_1_068
    #หาในDB ว่ามี msisdn ไหม
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    #ข้ามขั้นตอนนี้ เพราะ app จะไป insert ค่าให้
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    {"msisdn":"66812344008","package":{"currentPackage":"O2103P210305313","productSequenceId":"0002480109997","freeUnitExpireTime":"20240401000000+0800"},"5GMode":{"changeModePerday":{"count":0,"currentDate":"20230401"},"currentMode":{"modeName":"max_mode","expireDate":"20991231:235959"},"lastDefaultMode":"max_mode"}}    ${ID}
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCommandFileLog}    ${PathLogActivate5GMode}
    SetLogNull    ${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ProduceKafka    ${delete_qa.5GModeActivated}    ${Produce_qa.activate5GMode}    {"key":"Key_TST_F13_1_1_068","invokeId":"InvokeId_TST_F13_1_1_068","command":"mfaf.activate5GMode","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812344008","transactionId":"TST_F13_1_1_068"},"dataBody":{"accessToken":"SSB_TOKEN","msisdn":"66812344008","networkType":"CPE","modeName":"game_mode","promotionCode":"promo1","packType":"pack1","effectiveOption":"try"}}}
    #Consume คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ConsumeKafka    ${Consume_qa.5GModeActivated}    ${TC_Number}
    log    ${ConsumeResult}
    # check ค่า
    VerifyDataConsume    ${ConsumeResult}    {"key":"Key_TST_F13_1_1_068","invokeId":"InvokeId_TST_F13_1_1_068","command":"qa.5GModeActivated","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812344008","transactionId":"TST_F13_1_1_068"},"dataBody":{"resultCode":"20000","resultDesc":"Success","developerMessage":"Success","modeName":"game_mode"}}}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    FlushLogbyCommandName    ${NameCommandFileLog}    ${TC_Number}    ${PathLogActivate5GMode}
    FlushLogbyCommandName    ${NameCommandFileLogChkAddPack}    ${TC_Number}_${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    # querydata
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    ${JsondataexpireDate}    ${JsondataexpireDateTime}    GetExpireDateFromJson    ${Jsondata}
    #check db
    ${currentDate}    CurrentDate
    ${CurrentDateAndTime+1hour}    CurrentDateAndTime+1hour
    ${expireDate}    CurrentDateAndTimeNow
    ${CurrentDateAndTime+1hour-1min}    CurrentDateAndTime+1hour-1min
    IF    '${CurrentDateAndTime+1hour}'=='${JsondataexpireDateTime}' or '${CurrentDateAndTime+1hour-1min}'=='${JsondataexpireDateTime}'
        ${expireDate}    BuiltIn.Set Variable    ${JsondataexpireDate}
    END
    VerifyMongoDB    ${Jsondata}    {"msisdn":"66812344008","package":{"currentPackage":"O2103P210305313","productSequenceId":"0002480109997","freeUnitExpireTime":"20240401000000+0800"},"5GMode":{"changeModePerday":{"count":1,"currentDate":"${currentDate}"},"currentMode":{"modeName":"game_mode","expireDate":"${expireDate}"},"lastDefaultMode":"max_mode"}}
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    DeleteDataFromID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${ID}
    [Teardown]    Close All Connections

TST_F13_1_1_069
    #กำหนดค่าในเคส
    ${msisdn}    BuiltIn.Set Variable    {"msisdn" : "66812344009"}
    ${TC_Number}    BuiltIn.Set Variable    TST_F13_1_1_069
    #หาในDB ว่ามี msisdn ไหม
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    #ข้ามขั้นตอนนี้ เพราะ app จะไป insert ค่าให้
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    {"msisdn":"66812344009","package":{"currentPackage":"O2103P210305313","productSequenceId":"0002480109997","freeUnitExpireTime":"20240401000000+0800"},"5GMode":{"changeModePerday":{"count":10,"currentDate":"20230401"},"currentMode":{"modeName":"max_mode","expireDate":"20991231:235959"},"lastDefaultMode":"max_mode"}}    ${ID}
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCommandFileLog}    ${PathLogActivate5GMode}
    SetLogNull    ${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ProduceKafka    ${delete_qa.5GModeActivated}    ${Produce_qa.activate5GMode}    {"key":"Key_TST_F13_1_1_069","invokeId":"InvokeId_TST_F13_1_1_069","command":"mfaf.activate5GMode","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812344009","transactionId":"TST_F13_1_1_069"},"dataBody":{"accessToken":"SSB_TOKEN","msisdn":"66812344009","networkType":"CPE","modeName":"game_mode","promotionCode":"promo1","packType":"pack1","effectiveOption":"try"}}}
    #Consume คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ConsumeKafka    ${Consume_qa.5GModeActivated}    ${TC_Number}
    log    ${ConsumeResult}
    # check ค่า
    VerifyDataConsume    ${ConsumeResult}    {"key":"Key_TST_F13_1_1_069","invokeId":"InvokeId_TST_F13_1_1_069","command":"qa.5GModeActivated","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812344009","transactionId":"TST_F13_1_1_069"},"dataBody":{"resultCode":"20000","resultDesc":"Success","developerMessage":"Success","modeName":"game_mode"}}}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    FlushLogbyCommandName    ${NameCommandFileLog}    ${TC_Number}    ${PathLogActivate5GMode}
    FlushLogbyCommandName    ${NameCommandFileLogChkAddPack}    ${TC_Number}_${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    # querydata
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    ${JsondataexpireDate}    ${JsondataexpireDateTime}    GetExpireDateFromJson    ${Jsondata}
    #check db
    ${currentDate}    CurrentDate
    ${CurrentDateAndTime+1hour}    CurrentDateAndTime+1hour
    ${expireDate}    CurrentDateAndTimeNow
    ${CurrentDateAndTime+1hour-1min}    CurrentDateAndTime+1hour-1min
    IF    '${CurrentDateAndTime+1hour}'=='${JsondataexpireDateTime}' or '${CurrentDateAndTime+1hour-1min}'=='${JsondataexpireDateTime}'
        ${expireDate}    BuiltIn.Set Variable    ${JsondataexpireDate}
    END
    VerifyMongoDB    ${Jsondata}    {"msisdn":"66812344009","package":{"currentPackage":"O2103P210305313","productSequenceId":"0002480109997","freeUnitExpireTime":"20240401000000+0800"},"5GMode":{"changeModePerday":{"count":1,"currentDate":"${currentDate}"},"currentMode":{"modeName":"game_mode","expireDate":"${expireDate}"},"lastDefaultMode":"max_mode"}}
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    DeleteDataFromID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${ID}
    [Teardown]    Close All Connections

TST_F13_1_1_075
    #กำหนดค่าในเคส
    ${msisdn}    BuiltIn.Set Variable    {"msisdn" : "66812344011"}
    ${TC_Number}    BuiltIn.Set Variable    TST_F13_1_1_075
    #หาในDB ว่ามี msisdn ไหม
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    #ข้ามขั้นตอนนี้ เพราะ app จะไป insert ค่าให้
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    {"msisdn":"66812344011","package":{"currentPackage":"O2103P210305313","productSequenceId":"0002480109997","freeUnitExpireTime":"20240401000000+0800"},"5GMode":{"changeModePerday":{"count":0,"currentDate":"20230405"},"currentMode":{"modeName":"game_mode","expireDate":"20991231:235959"},"lastDefaultMode":"game_mode"}}    ${ID}
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCommandFileLog}    ${PathLogActivate5GMode}
    SetLogNull    ${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ProduceKafka    ${delete_qa.5GModeActivated}    ${Produce_qa.activate5GMode}    {"key":"key_TST_F13_1_1_075","invokeId":"invokeId_TST_F13_1_1_075","command":"mfaf.activate5GMode","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812344011","transactionId":"TST_F13_1_1_075"},"dataBody":{"accessToken":"token","msisdn":"66812344011","networkType":"CPE","modeName":"boost_mode","promotionCode":"promo1","packType":"pack1","effectiveOption":"try"}}}
    #Consume คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ConsumeKafka    ${Consume_qa.5GModeActivated}    ${TC_Number}
    log    ${ConsumeResult}
    # check ค่า
    VerifyDataConsume    ${ConsumeResult}    {"key":"key_TST_F13_1_1_075","invokeId":"invokeId_TST_F13_1_1_075","command":"qa.5GModeActivated","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812344011","transactionId":"TST_F13_1_1_075"},"dataBody":{"resultCode":"20000","resultDesc":"Success","developerMessage":"Success","modeName":"boost_mode"}}}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    FlushLogbyCommandName    ${NameCommandFileLog}    ${TC_Number}    ${PathLogActivate5GMode}
    FlushLogbyCommandName    ${NameCommandFileLogChkAddPack}    ${TC_Number}_${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    # querydata
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    ${JsondataexpireDate}    ${JsondataexpireDateTime}    GetExpireDateFromJson    ${Jsondata}
    #check db
    ${currentDate}    CurrentDate
    ${CurrentDateAndTime+1hour}    CurrentDateAndTime+1hour
    ${expireDate}    CurrentDateAndTimeNow
    ${CurrentDateAndTime+1hour-1min}    CurrentDateAndTime+1hour-1min
    IF    '${CurrentDateAndTime+1hour}'=='${JsondataexpireDateTime}' or '${CurrentDateAndTime+1hour-1min}'=='${JsondataexpireDateTime}'
        ${expireDate}    BuiltIn.Set Variable    ${JsondataexpireDate}
    END
    VerifyMongoDB    ${Jsondata}    {"msisdn":"66812344011","package":{"currentPackage":"O2103P210305313","productSequenceId":"0002480109997","freeUnitExpireTime":"20240401000000+0800"},"5GMode":{"changeModePerday":{"count":1,"currentDate":"${currentDate}"},"currentMode":{"modeName":"boost_mode","expireDate":"${expireDate}"},"lastDefaultMode":"max_mode"}}
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    DeleteDataFromID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${ID}
    [Teardown]    Close All Connections

TST_F13_1_1_076
    #กำหนดค่าในเคส
    ${msisdn}    BuiltIn.Set Variable    {"msisdn" : "66812344012"}
    ${TC_Number}    BuiltIn.Set Variable    TST_F13_1_1_076
    #หาในDB ว่ามี msisdn ไหม
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    #ข้ามขั้นตอนนี้ เพราะ app จะไป insert ค่าให้
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    {"msisdn":"66812344012","package":{"currentPackage":"O2103P210305313","productSequenceId":"0002480109997","freeUnitExpireTime":"20240401000000+0800"},"5GMode":{"changeModePerday":{"count":10,"currentDate":"20230405"},"currentMode":{"modeName":"game_mode","expireDate":"20991231:235959"},"lastDefaultMode":"eco_mode"}}    ${ID}
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCommandFileLog}    ${PathLogActivate5GMode}
    SetLogNull    ${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ProduceKafka    ${delete_qa.5GModeActivated}    ${Produce_qa.activate5GMode}    {"key":"Key_TST_F13_1_1_076","invokeId":"InvokeId_TST_F13_1_1_076","command":"qa.activate5GMode","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812344012","transactionId":"TST_F13_1_1_076"},"dataBody":{"accessToken":"SSB_TOKEN","msisdn":"66812344012","networkType":"CPE","modeName":"boost_mode","promotionCode":"promo1","packType":"pack1","effectiveOption":"try"}}}
    #Consume คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ConsumeKafka    ${Consume_qa.5GModeActivated}    ${TC_Number}
    log    ${ConsumeResult}
    # check ค่า
    VerifyDataConsume    ${ConsumeResult}    {"key":"Key_TST_F13_1_1_076","invokeId":"InvokeId_TST_F13_1_1_076","command":"qa.5GModeActivated","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812344012","transactionId":"TST_F13_1_1_076"},"dataBody":{"resultCode":"20000","resultDesc":"Success","developerMessage":"Success","modeName":"boost_mode"}}}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    FlushLogbyCommandName    ${NameCommandFileLog}    ${TC_Number}    ${PathLogActivate5GMode}
    FlushLogbyCommandName    ${NameCommandFileLogChkAddPack}    ${TC_Number}_${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    # querydata
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    ${JsondataexpireDate}    ${JsondataexpireDateTime}    GetExpireDateFromJson    ${Jsondata}
    #check db
    ${currentDate}    CurrentDate
    ${CurrentDateAndTime+1hour}    CurrentDateAndTime+1hour
    ${expireDate}    CurrentDateAndTimeNow
    ${CurrentDateAndTime+1hour-1min}    CurrentDateAndTime+1hour-1min
    IF    '${CurrentDateAndTime+1hour}'=='${JsondataexpireDateTime}' or '${CurrentDateAndTime+1hour-1min}'=='${JsondataexpireDateTime}'
        ${expireDate}    BuiltIn.Set Variable    ${JsondataexpireDate}
    END
    VerifyMongoDB    ${Jsondata}    {"msisdn":"66812344012","package":{"currentPackage":"O2103P210305313","productSequenceId":"0002480109997","freeUnitExpireTime":"20240401000000+0800"},"5GMode":{"changeModePerday":{"count":1,"currentDate":"${currentDate}"},"currentMode":{"modeName":"boost_mode","expireDate":"${expireDate}"},"lastDefaultMode":"max_mode"}}
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    DeleteDataFromID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${ID}
    [Teardown]    Close All Connections

TST_F13_1_1_077
    #กำหนดค่าในเคส
    ${msisdn}    BuiltIn.Set Variable    {"msisdn" : "66812344013"}
    ${TC_Number}    BuiltIn.Set Variable    TST_F13_1_1_077
    #หาในDB ว่ามี msisdn ไหม
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    #ข้ามขั้นตอนนี้ เพราะ app จะไป insert ค่าให้
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    {"msisdn":"66812344013","package":{"currentPackage":"O2103P210305313_default_success","productSequenceId":"0002480109997","freeUnitExpireTime":"20230401000000+0800"}}    ${ID}
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCommandFileLog}    ${PathLogActivate5GMode}
    SetLogNull    ${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ProduceKafka    ${delete_qa.5GModeActivated}    ${Produce_qa.activate5GMode}    {"key":"Key_TST_F13_1_1_077","invokeId":"InvokeId_TST_F13_1_1_077","command":"qa.activate5GMode","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812344013","transactionId":"TST_F13_1_1_077"},"dataBody":{"accessToken":"SSB_TOKEN","msisdn":"66812344013","networkType":"CPE","modeName":"boost_mode","promotionCode":"promo1","packType":"pack1","effectiveOption":"try"}}}
    #Consume คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ConsumeKafka    ${Consume_qa.5GModeActivated}    ${TC_Number}
    log    ${ConsumeResult}
    # check ค่า
    VerifyDataConsume    ${ConsumeResult}    {"key":"Key_TST_F13_1_1_077","invokeId":"InvokeId_TST_F13_1_1_077","command":"qa.5GModeActivated","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812344013","transactionId":"TST_F13_1_1_077"},"dataBody":{"resultCode":"20000","resultDesc":"Success","developerMessage":"Success","modeName":"boost_mode"}}}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    FlushLogbyCommandName    ${NameCommandFileLog}    ${TC_Number}    ${PathLogActivate5GMode}
    FlushLogbyCommandName    ${NameCommandFileLogChkAddPack}    ${TC_Number}_${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    # querydata
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    ${JsondataexpireDate}    ${JsondataexpireDateTime}    GetExpireDateFromJson    ${Jsondata}
    #check db
    ${currentDate}    CurrentDate
    ${CurrentDateAndTime+1hour}    CurrentDateAndTime+1hour
    ${expireDate}    CurrentDateAndTimeNow
    ${CurrentDateAndTime+1hour-1min}    CurrentDateAndTime+1hour-1min
    IF    '${CurrentDateAndTime+1hour}'=='${JsondataexpireDateTime}' or '${CurrentDateAndTime+1hour-1min}'=='${JsondataexpireDateTime}'
        ${expireDate}    BuiltIn.Set Variable    ${JsondataexpireDate}
    END
    VerifyMongoDB    ${Jsondata}    {"msisdn":"66812344013","package":{"currentPackage":"O2103P210305313_default_success","productSequenceId":"0002480109997","freeUnitExpireTime":"20230401000000+0800"},"5GMode":{"changeModePerday":{"count":1,"currentDate":"${currentDate}"},"currentMode":{"modeName":"boost_mode","expireDate":"${expireDate}"},"lastDefaultMode":"max_mode"}}
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    DeleteDataFromID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${ID}
    [Teardown]    Close All Connections

TST_F13_1_1_079
    #กำหนดค่าในเคส
    ${msisdn}    BuiltIn.Set Variable    {"msisdn" : "66812344016"}
    ${TC_Number}    BuiltIn.Set Variable    TST_F13_1_1_079
    #หาในDB ว่ามี msisdn ไหม
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    #ข้ามขั้นตอนนี้ เพราะ app จะไป insert ค่าให้
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    {"msisdn":"66812344016","package":{"currentPackage":"O2103P210305313","productSequenceId":"0002480109997","freeUnitExpireTime":"20240401000000+0800"},"5GMode":{"changeModePerday":{"count":0,"currentDate":"20230401"},"currentMode":{"modeName":"eco_mode","expireDate":"20991231:235959"},"lastDefaultMode":"eco_mode"}}    ${ID}
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCommandFileLog}    ${PathLogActivate5GMode}
    SetLogNull    ${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ProduceKafka    ${delete_qa.5GModeActivated}    ${Produce_qa.activate5GMode}    {"key":"Key_TST_F13_1_1_079","invokeId":"InvokeId_TST_F13_1_1_079","command":"qa.activate5GMode","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812344016","transactionId":"TST_F13_1_1_079"},"dataBody":{"accessToken":"SSB_TOKEN","msisdn":"66812344016","networkType":"CPE","modeName":"boost_mode","promotionCode":"promo1","packType":"pack1","effectiveOption":"try"}}}
    #Consume คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ConsumeKafka    ${Consume_qa.5GModeActivated}    ${TC_Number}
    log    ${ConsumeResult}
    # check ค่า
    VerifyDataConsume    ${ConsumeResult}    {"key":"Key_TST_F13_1_1_079","invokeId":"InvokeId_TST_F13_1_1_079","command":"qa.5GModeActivated","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812344016","transactionId":"TST_F13_1_1_079"},"dataBody":{"resultCode":"20000","resultDesc":"Success","developerMessage":"Success","modeName":"boost_mode"}}}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    FlushLogbyCommandName    ${NameCommandFileLog}    ${TC_Number}    ${PathLogActivate5GMode}
    FlushLogbyCommandName    ${NameCommandFileLogChkAddPack}    ${TC_Number}_${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    # querydata
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    ${JsondataexpireDate}    ${JsondataexpireDateTime}    GetExpireDateFromJson    ${Jsondata}
    #check db
    ${currentDate}    CurrentDate
    ${CurrentDateAndTime+1hour}    CurrentDateAndTime+1hour
    ${expireDate}    CurrentDateAndTimeNow
    ${CurrentDateAndTime+1hour-1min}    CurrentDateAndTime+1hour-1min
    IF    '${CurrentDateAndTime+1hour}'=='${JsondataexpireDateTime}' or '${CurrentDateAndTime+1hour-1min}'=='${JsondataexpireDateTime}'
        ${expireDate}    BuiltIn.Set Variable    ${JsondataexpireDate}
    END
    VerifyMongoDB    ${Jsondata}    {"msisdn":"66812344016","package":{"currentPackage":"O2103P210305313","productSequenceId":"0002480109997","freeUnitExpireTime":"20240401000000+0800"},"5GMode":{"changeModePerday":{"count":1,"currentDate":"${currentDate}"},"currentMode":{"modeName":"boost_mode","expireDate":"${expireDate}"},"lastDefaultMode":"max_mode"}}
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    DeleteDataFromID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${ID}
    [Teardown]    Close All Connections

TST_F13_1_1_080
    #กำหนดค่าในเคส
    ${msisdn}    BuiltIn.Set Variable    {"msisdn" : "66812344017"}
    ${TC_Number}    BuiltIn.Set Variable    TST_F13_1_1_080
    #หาในDB ว่ามี msisdn ไหม
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    #ข้ามขั้นตอนนี้ เพราะ app จะไป insert ค่าให้
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    {"msisdn":"66812344017","package":{"currentPackage":"O2103P210305313","productSequenceId":"0002480109997","freeUnitExpireTime":"20240401000000+0800"},"5GMode":{"changeModePerday":{"count":10,"currentDate":"20230401"},"currentMode":{"modeName":"eco_mode","expireDate":"20991231:235959"},"lastDefaultMode":"max_mode"}}    ${ID}
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCommandFileLog}    ${PathLogActivate5GMode}
    SetLogNull    ${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ProduceKafka    ${delete_qa.5GModeActivated}    ${Produce_qa.activate5GMode}    {"key":"Key_TST_F13_1_1_080","invokeId":"InvokeId_TST_F13_1_1_080","command":"qa.activate5GMode","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812344017","transactionId":"TST_F13_1_1_080"},"dataBody":{"accessToken":"SSB_TOKEN","msisdn":"66812344017","networkType":"CPE","modeName":"boost_mode","promotionCode":"promo1","packType":"pack1","effectiveOption":"try"}}}
    #Consume คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ConsumeKafka    ${Consume_qa.5GModeActivated}    ${TC_Number}
    log    ${ConsumeResult}
    # check ค่า
    VerifyDataConsume    ${ConsumeResult}    {"key":"Key_TST_F13_1_1_080","invokeId":"InvokeId_TST_F13_1_1_080","command":"qa.5GModeActivated","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812344017","transactionId":"TST_F13_1_1_080"},"dataBody":{"resultCode":"20000","resultDesc":"Success","developerMessage":"Success","modeName":"boost_mode"}}}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    FlushLogbyCommandName    ${NameCommandFileLog}    ${TC_Number}    ${PathLogActivate5GMode}
    FlushLogbyCommandName    ${NameCommandFileLogChkAddPack}    ${TC_Number}_${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    # querydata
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    ${JsondataexpireDate}    ${JsondataexpireDateTime}    GetExpireDateFromJson    ${Jsondata}
    #check db
    ${currentDate}    CurrentDate
    ${CurrentDateAndTime+1hour}    CurrentDateAndTime+1hour
    ${expireDate}    CurrentDateAndTimeNow
    ${CurrentDateAndTime+1hour-1min}    CurrentDateAndTime+1hour-1min
    IF    '${CurrentDateAndTime+1hour}'=='${JsondataexpireDateTime}' or '${CurrentDateAndTime+1hour-1min}'=='${JsondataexpireDateTime}'
        ${expireDate}    BuiltIn.Set Variable    ${JsondataexpireDate}
    END
    VerifyMongoDB    ${Jsondata}    {"msisdn":"66812344017","package":{"currentPackage":"O2103P210305313","productSequenceId":"0002480109997","freeUnitExpireTime":"20240401000000+0800"},"5GMode":{"changeModePerday":{"count":1,"currentDate":"${currentDate}"},"currentMode":{"modeName":"boost_mode","expireDate":"${expireDate}"},"lastDefaultMode":"max_mode"}}
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    DeleteDataFromID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${ID}
    [Teardown]    Close All Connections

TST_F13_1_1_081
    #กำหนดค่าในเคส
    ${msisdn}    BuiltIn.Set Variable    {"msisdn" : "66812344018"}
    ${TC_Number}    BuiltIn.Set Variable    TST_F13_1_1_081
    #หาในDB ว่ามี msisdn ไหม
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    #ข้ามขั้นตอนนี้ เพราะ app จะไป insert ค่าให้
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    {"msisdn":"66812344018","package":{"currentPackage":"O2103P210305313","productSequenceId":"0002480109997","freeUnitExpireTime":"20240401000000+0800"},"5GMode":{"changeModePerday":{"count":0,"currentDate":"20230405:235959"},"currentMode":{"modeName":"max_mode","expireDate":"20991231:235959"},"lastDefaultMode":"max_mode"}}    ${ID}
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCommandFileLog}    ${PathLogActivate5GMode}
    SetLogNull    ${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ProduceKafka    ${delete_qa.5GModeActivated}    ${Produce_qa.activate5GMode}    {"key":"Key_TST_F13_1_1_081","invokeId":"InvokeId_TST_F13_1_1_081","command":"qa.activate5GMode","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812344018","transactionId":"TST_F13_1_1_081"},"dataBody":{"accessToken":"SSB_TOKEN","msisdn":"66812344018","networkType":"CPE","modeName":"boost_mode","promotionCode":"promo1","packType":"pack1","effectiveOption":"try"}}}
    #Consume คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ConsumeKafka    ${Consume_qa.5GModeActivated}    ${TC_Number}
    log    ${ConsumeResult}
    # check ค่า
    VerifyDataConsume    ${ConsumeResult}    {"key":"Key_TST_F13_1_1_081","invokeId":"InvokeId_TST_F13_1_1_081","command":"qa.5GModeActivated","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812344018","transactionId":"TST_F13_1_1_081"},"dataBody":{"resultCode":"20000","resultDesc":"Success","developerMessage":"Success","modeName":"boost_mode"}}}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    FlushLogbyCommandName    ${NameCommandFileLog}    ${TC_Number}    ${PathLogActivate5GMode}
    FlushLogbyCommandName    ${NameCommandFileLogChkAddPack}    ${TC_Number}_${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    # querydata
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    ${JsondataexpireDate}    ${JsondataexpireDateTime}    GetExpireDateFromJson    ${Jsondata}
    #check db
    ${currentDate}    CurrentDate
    ${CurrentDateAndTime+1hour}    CurrentDateAndTime+1hour
    ${expireDate}    CurrentDateAndTimeNow
    ${CurrentDateAndTime+1hour-1min}    CurrentDateAndTime+1hour-1min
    IF    '${CurrentDateAndTime+1hour}'=='${JsondataexpireDateTime}' or '${CurrentDateAndTime+1hour-1min}'=='${JsondataexpireDateTime}'
        ${expireDate}    BuiltIn.Set Variable    ${JsondataexpireDate}
    END
    VerifyMongoDB    ${Jsondata}    {"msisdn":"66812344018","package":{"currentPackage":"O2103P210305313","productSequenceId":"0002480109997","freeUnitExpireTime":"20240401000000+0800"},"5GMode":{"changeModePerday":{"count":1,"currentDate":"${currentDate}"},"currentMode":{"modeName":"boost_mode","expireDate":"${expireDate}"},"lastDefaultMode":"max_mode"}}
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    DeleteDataFromID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${ID}
    [Teardown]    Close All Connections

TST_F13_1_1_082
    #กำหนดค่าในเคส
    ${msisdn}    BuiltIn.Set Variable    {"msisdn" : "66812344019"}
    ${TC_Number}    BuiltIn.Set Variable    TST_F13_1_1_082
    #หาในDB ว่ามี msisdn ไหม
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    #ข้ามขั้นตอนนี้ เพราะ app จะไป insert ค่าให้
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    {"msisdn":"66812344019","package":{"currentPackage":"O2103P210305313","productSequenceId":"0002480109997","freeUnitExpireTime":"20240401000000+0800"},"5GMode":{"changeModePerday":{"count":10,"currentDate":"20230401"},"currentMode":{"modeName":"max_mode","expireDate":"20991231:235959"},"lastDefaultMode":"max_mode"}}    ${ID}
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCommandFileLog}    ${PathLogActivate5GMode}
    SetLogNull    ${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ProduceKafka    ${delete_qa.5GModeActivated}    ${Produce_qa.activate5GMode}    {"key":"Key_TST_F13_1_1_082","invokeId":"InvokeId_TST_F13_1_1_082","command":"qa.activate5GMode","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812344019","transactionId":"TST_F13_1_1_082"},"dataBody":{"accessToken":"SSB_TOKEN","msisdn":"66812344019","networkType":"CPE","modeName":"boost_mode","promotionCode":"promo1","packType":"pack1","effectiveOption":"try"}}}
    #Consume คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ConsumeKafka    ${Consume_qa.5GModeActivated}    ${TC_Number}
    log    ${ConsumeResult}
    # check ค่า
    VerifyDataConsume    ${ConsumeResult}    {"key":"Key_TST_F13_1_1_082","invokeId":"InvokeId_TST_F13_1_1_082","command":"qa.5GModeActivated","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812344019","transactionId":"TST_F13_1_1_082"},"dataBody":{"resultCode":"20000","resultDesc":"Success","developerMessage":"Success","modeName":"boost_mode"}}}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    FlushLogbyCommandName    ${NameCommandFileLog}    ${TC_Number}    ${PathLogActivate5GMode}
    FlushLogbyCommandName    ${NameCommandFileLogChkAddPack}    ${TC_Number}_${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    # querydata
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    ${JsondataexpireDate}    ${JsondataexpireDateTime}    GetExpireDateFromJson    ${Jsondata}
    #check db
    ${currentDate}    CurrentDate
    ${CurrentDateAndTime+1hour}    CurrentDateAndTime+1hour
    ${expireDate}    CurrentDateAndTimeNow
    ${CurrentDateAndTime+1hour-1min}    CurrentDateAndTime+1hour-1min
    IF    '${CurrentDateAndTime+1hour}'=='${JsondataexpireDateTime}' or '${CurrentDateAndTime+1hour-1min}'=='${JsondataexpireDateTime}'
        ${expireDate}    BuiltIn.Set Variable    ${JsondataexpireDate}
    END
    VerifyMongoDB    ${Jsondata}    {"msisdn":"66812344019","package":{"currentPackage":"O2103P210305313","productSequenceId":"0002480109997","freeUnitExpireTime":"20240401000000+0800"},"5GMode":{"changeModePerday":{"count":1,"currentDate":"${currentDate}"},"currentMode":{"modeName":"boost_mode","expireDate":"${expireDate}"},"lastDefaultMode":"max_mode"}}
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    DeleteDataFromID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${ID}
    [Teardown]    Close All Connections

TST_F13_1_1_091
    #กำหนดค่าในเคส
    ${msisdn}    BuiltIn.Set Variable    {"msisdn" : "66812340023"}
    ${TC_Number}    BuiltIn.Set Variable    TST_F13_1_1_091
    #หาในDB ว่ามี msisdn ไหม
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    #ข้ามขั้นตอนนี้ เพราะ app จะไป insert ค่าให้
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    {"msisdn":"66812340023","package":{"currentPackage":"O2103P210305313","productSequenceId":"0002480109997","freeUnitExpireTime":"20230430235959+0700"},"5GMode":{"changeModePerday":{"count":2,"currentDate":"20230331"},"currentMode":{"modeName":"eco_mode","expireDate":"20230331:000000"},"lastDefaultMode":"game_mode"}}    ${ID}
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCommandFileLog}    ${PathLogActivate5GMode}
    SetLogNull    ${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ProduceKafka    ${delete_qa.5GModeActivated}    ${Produce_qa.activate5GMode}    {"key":"Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId":"ios-20230327111117974MRPusL4Tsc","command":"mfaf.activate5GMode","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812340023","transactionId":"TST_F13_1_1_091"},"dataBody":{"accessToken":"02eyJhbGciOiJIUzI1NiJ9.eyJtb2JpbGVObyI6IjA5MTAwMzEzNDYiLCJuZXR3b3JrVHlwZSI6Ik1BU1MiLCJ0aW1lc3RhbXAiOiIyMDIzLTAzLTE1VDE0OjEwOjE0KzA3OjAwIn0.jTwLjjC9p0t9IbVC5w3nI8R7WBahJuVC_J2BrKEypJ0","msisdn":"66812340023","networkType":"CPE","modeName":"max_mode"}}}
    #Consume คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ConsumeKafka    ${Consume_qa.5GModeActivated}    ${TC_Number}
    log    ${ConsumeResult}
    # check ค่า
    VerifyDataConsume    ${ConsumeResult}    {"key":"Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId":"ios-20230327111117974MRPusL4Tsc","command":"qa.5GModeActivated","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812340023","transactionId":"TST_F13_1_1_091"},"dataBody":{"resultCode":"20000","resultDesc":"Success","developerMessage":"Success","modeName":"max_mode"}}}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    FlushLogbyCommandName    ${NameCommandFileLog}    ${TC_Number}    ${PathLogActivate5GMode}
    FlushLogbyCommandName    ${NameCommandFileLogChkAddPack}    ${TC_Number}_${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    # querydata
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    #check db
    ${currentDate}    CurrentDate
    VerifyMongoDB    ${Jsondata}    {"msisdn":"66812340023","package":{"currentPackage":"O2103P210305313","productSequenceId":"0002480109997","freeUnitExpireTime":"20230430235959+0700"},"5GMode":{"changeModePerday":{"count":0,"currentDate":"${currentDate}"},"currentMode":{"modeName":"max_mode","expireDate":"20991231:235959"},"lastDefaultMode":"max_mode"}}
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    DeleteDataFromID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${ID}
    [Teardown]    Close All Connections

TST_F13_1_1_092
    #กำหนดค่าในเคส
    ${msisdn}    BuiltIn.Set Variable    {"msisdn" : "66812340024"}
    ${TC_Number}    BuiltIn.Set Variable    TST_F13_1_1_092
    #หาในDB ว่ามี msisdn ไหม
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    #ข้ามขั้นตอนนี้ เพราะ app จะไป insert ค่าให้
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    {"msisdn":"66812340024","package":{"currentPackage":"O2103P210305313","productSequenceId":"0002480109997","freeUnitExpireTime":"20230331235959+0700"},"5GMode":{"changeModePerday":{"count":2,"currentDate":"20230331"},"currentMode":{"modeName":"game_mode","expireDate":"20230331:000000"},"lastDefaultMode":"boost_mode"}}    ${ID}
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCommandFileLog}    ${PathLogActivate5GMode}
    SetLogNull    ${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ProduceKafka    ${delete_qa.5GModeActivated}    ${Produce_qa.activate5GMode}    {"key":"Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId":"ios-20230327111117974MRPusL4Tsc","command":"mfaf.activate5GMode","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812340024","transactionId":"TST_F13_1_1_092"},"dataBody":{"accessToken":"02eyJhbGciOiJIUzI1NiJ9.eyJtb2JpbGVObyI6IjA5MTAwMzEzNDYiLCJuZXR3b3JrVHlwZSI6Ik1BU1MiLCJ0aW1lc3RhbXAiOiIyMDIzLTAzLTE1VDE0OjEwOjE0KzA3OjAwIn0.jTwLjjC9p0t9IbVC5w3nI8R7WBahJuVC_J2BrKEypJ0","msisdn":"66812340024","networkType":"CPE","modeName":"max_mode"}}}
    #Consume คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ConsumeKafka    ${Consume_qa.5GModeActivated}    ${TC_Number}
    log    ${ConsumeResult}
    # check ค่า
    VerifyDataConsume    ${ConsumeResult}    {"key":"Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId":"ios-20230327111117974MRPusL4Tsc","command":"qa.5GModeActivated","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812340024","transactionId":"TST_F13_1_1_092"},"dataBody":{"resultCode":"20000","resultDesc":"Success","developerMessage":"Success","modeName":"max_mode"}}}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    FlushLogbyCommandName    ${NameCommandFileLog}    ${TC_Number}    ${PathLogActivate5GMode}
    FlushLogbyCommandName    ${NameCommandFileLogChkAddPack}    ${TC_Number}_${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    # querydata
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    #check db
    ${currentDate}    CurrentDate
    VerifyMongoDB    ${Jsondata}    {"msisdn":"66812340024","package":{"currentPackage":"O2103P210305313","productSequenceId":"0002480109997","freeUnitExpireTime":"20230331235959+0700"},"5GMode":{"changeModePerday":{"count":0,"currentDate":"${currentDate}"},"currentMode":{"modeName":"max_mode","expireDate":"20991231:235959"},"lastDefaultMode":"max_mode"}}
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    DeleteDataFromID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${ID}
    [Teardown]    Close All Connections

TST_F13_1_1_093
    #กำหนดค่าในเคส
    ${msisdn}    BuiltIn.Set Variable    {"msisdn" : "66812340025"}
    ${TC_Number}    BuiltIn.Set Variable    TST_F13_1_1_093
    #หาในDB ว่ามี msisdn ไหม
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    #ข้ามขั้นตอนนี้ เพราะ app จะไป insert ค่าให้
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    {"msisdn":"66812340025","package":{"currentPackage":"O2103P210305313","productSequenceId":"0002480109997","freeUnitExpireTime":"20230331235959+0700"},"5GMode":{"changeModePerday":{"count":2,"currentDate":"20230331"},"currentMode":{"modeName":"boost_mode","expireDate":"20230331:000000"},"lastDefaultMode":"eco_mode"}}    ${ID}
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCommandFileLog}    ${PathLogActivate5GMode}
    SetLogNull    ${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ProduceKafka    ${delete_qa.5GModeActivated}    ${Produce_qa.activate5GMode}    {"key":"Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId":"ios-20230327111117974MRPusL4Tsc","command":"mfaf.activate5GMode","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812340025","transactionId":"TST_F13_1_1_093"},"dataBody":{"accessToken":"02eyJhbGciOiJIUzI1NiJ9.eyJtb2JpbGVObyI6IjA5MTAwMzEzNDYiLCJuZXR3b3JrVHlwZSI6Ik1BU1MiLCJ0aW1lc3RhbXAiOiIyMDIzLTAzLTE1VDE0OjEwOjE0KzA3OjAwIn0.jTwLjjC9p0t9IbVC5w3nI8R7WBahJuVC_J2BrKEypJ0","msisdn":"66812340025","networkType":"CPE","modeName":"max_mode"}}}
    #Consume คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ConsumeKafka    ${Consume_qa.5GModeActivated}    ${TC_Number}
    log    ${ConsumeResult}
    # check ค่า
    VerifyDataConsume    ${ConsumeResult}    {"key":"Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId":"ios-20230327111117974MRPusL4Tsc","command":"qa.5GModeActivated","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812340025","transactionId":"TST_F13_1_1_093"},"dataBody":{"resultCode":"20000","resultDesc":"Success","developerMessage":"Success","modeName":"max_mode"}}}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    FlushLogbyCommandName    ${NameCommandFileLog}    ${TC_Number}    ${PathLogActivate5GMode}
    FlushLogbyCommandName    ${NameCommandFileLogChkAddPack}    ${TC_Number}_${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    # querydata
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    #check db
    ${currentDate}    CurrentDate
    VerifyMongoDB    ${Jsondata}    {"msisdn":"66812340025","package":{"currentPackage":"O2103P210305313","productSequenceId":"0002480109997","freeUnitExpireTime":"20230331235959+0700"},"5GMode":{"changeModePerday":{"count":0,"currentDate":"${currentDate}"},"currentMode":{"modeName":"max_mode","expireDate":"20991231:235959"},"lastDefaultMode":"max_mode"}}
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    DeleteDataFromID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${ID}
    [Teardown]    Close All Connections

TST_F13_1_1_100
    #กำหนดค่าในเคส
    ${msisdn}    BuiltIn.Set Variable    {"msisdn" : "66812340050"}
    ${TC_Number}    BuiltIn.Set Variable    TST_F13_1_1_100
    #หาในDB ว่ามี msisdn ไหม
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    #ข้ามขั้นตอนนี้ เพราะ app จะไป insert ค่าให้
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    {"msisdn":"66812340050","package":{"currentPackage":"O2103P210305313","productSequenceId":"0002480109997","freeUnitExpireTime":"20230430235959+0700"},"5GMode":{"changeModePerday":{"count":0,"currentDate":"20230401"},"currentMode":{"modeName":"max_mode","expireDate":"20991231:235959"},"lastDefaultMode":"max_mode"}}    ${ID}
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCommandFileLog}    ${PathLogActivate5GMode}
    SetLogNull    ${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ProduceKafka    ${delete_qa.5GModeActivated}    ${Produce_qa.activate5GMode}    {"key":"Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId":"ios-20230327111117974MRPusL4Tsc","command":"mfaf.activate5GMode","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812340050","transactionId":"TST_F13_1_1_100"},"dataBody":{"accessToken":"02eyJhbGciOiJIUzI1NiJ9.eyJtb2JpbGVObyI6IjA5MTAwMzEzNDYiLCJuZXR3b3JrVHlwZSI6Ik1BU1MiLCJ0aW1lc3RhbXAiOiIyMDIzLTAzLTE1VDE0OjEwOjE0KzA3OjAwIn0.jTwLjjC9p0t9IbVC5w3nI8R7WBahJuVC_J2BrKEypJ0","msisdn":"66812340050","networkType":"CPE","modeName":"max_mode"}}}
    #Consume คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ConsumeKafka    ${Consume_qa.5GModeActivated}    ${TC_Number}
    log    ${ConsumeResult}
    # check ค่า
    VerifyDataConsume    ${ConsumeResult}    {"key":"Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId":"ios-20230327111117974MRPusL4Tsc","command":"qa.5GModeActivated","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812340050","transactionId":"TST_F13_1_1_100"},"dataBody":{"resultCode":"20000","resultDesc":"Success","developerMessage":"Success","modeName":"max_mode"}}}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    FlushLogbyCommandName    ${NameCommandFileLog}    ${TC_Number}    ${PathLogActivate5GMode}
    FlushLogbyCommandName    ${NameCommandFileLogChkAddPack}    ${TC_Number}_${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    # querydata
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    #check db
    ${currentDate}    CurrentDate
    VerifyMongoDB    ${Jsondata}    {"msisdn":"66812340050","package":{"currentPackage":"O2103P210305313","productSequenceId":"0002480109997","freeUnitExpireTime":"20230430235959+0700"},"5GMode":{"changeModePerday":{"count":0,"currentDate":"${currentDate}"},"currentMode":{"modeName":"max_mode","expireDate":"20991231:235959"},"lastDefaultMode":"max_mode"}}
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    DeleteDataFromID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${ID}
    [Teardown]    Close All Connections

TST_F13_1_1_101
    #กำหนดค่าในเคส
    ${msisdn}    BuiltIn.Set Variable    {"msisdn" : "66812340051"}
    ${TC_Number}    BuiltIn.Set Variable    TST_F13_1_1_101
    ${CurrentDateFromLibrary}    CurrentDateFromLibrary
    #หาในDB ว่ามี msisdn ไหม
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    #ข้ามขั้นตอนนี้ เพราะ app จะไป insert ค่าให้
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    {"msisdn":"66812340051","package":{"currentPackage":"O2103P210305313","productSequenceId":"0002480109997","freeUnitExpireTime":"20230430235959+0700"},"5GMode":{"changeModePerday":{"count":0,"currentDate":"${CurrentDateFromLibrary}"},"currentMode":{"modeName":"max_mode","expireDate":"20991231:235959"},"lastDefaultMode":"max_mode"}}    ${ID}
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCommandFileLog}    ${PathLogActivate5GMode}
    SetLogNull    ${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ProduceKafka    ${delete_qa.5GModeActivated}    ${Produce_qa.activate5GMode}    {"key":"Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId":"ios-20230327111117974MRPusL4Tsc","command":"mfaf.activate5GMode","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812340051","transactionId":"TST_F13_1_1_101"},"dataBody":{"accessToken":"02eyJhbGciOiJIUzI1NiJ9.eyJtb2JpbGVObyI6IjA5MTAwMzEzNDYiLCJuZXR3b3JrVHlwZSI6Ik1BU1MiLCJ0aW1lc3RhbXAiOiIyMDIzLTAzLTE1VDE0OjEwOjE0KzA3OjAwIn0.jTwLjjC9p0t9IbVC5w3nI8R7WBahJuVC_J2BrKEypJ0","msisdn":"66812340051","networkType":"CPE","modeName":"max_mode"}}}
    #Consume คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ConsumeKafka    ${Consume_qa.5GModeActivated}    ${TC_Number}
    log    ${ConsumeResult}
    # check ค่า
    VerifyDataConsume    ${ConsumeResult}    {"key":"Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId":"ios-20230327111117974MRPusL4Tsc","command":"qa.5GModeActivated","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812340051","transactionId":"TST_F13_1_1_101"},"dataBody":{"resultCode":"20000","resultDesc":"Success","developerMessage":"Success","modeName":"max_mode"}}}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    FlushLogbyCommandName    ${NameCommandFileLog}    ${TC_Number}    ${PathLogActivate5GMode}
    FlushLogbyCommandName    ${NameCommandFileLogChkAddPack}    ${TC_Number}_${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    # querydata
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    #check db
    ${currentDate}    CurrentDate
    VerifyMongoDB    ${Jsondata}    {"msisdn":"66812340051","package":{"currentPackage":"O2103P210305313","productSequenceId":"0002480109997","freeUnitExpireTime":"20230430235959+0700"},"5GMode":{"changeModePerday":{"count":0,"currentDate":"${currentDate}"},"currentMode":{"modeName":"max_mode","expireDate":"20991231:235959"},"lastDefaultMode":"max_mode"}}
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    DeleteDataFromID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${ID}
    [Teardown]    Close All Connections

TST_F13_1_1_102
    #กำหนดค่าในเคส
    ${msisdn}    BuiltIn.Set Variable    {"msisdn" : "66812340052"}
    ${TC_Number}    BuiltIn.Set Variable    TST_F13_1_1_102
    ${CurrentDateFromLibrary}    CurrentDateFromLibrary
    #หาในDB ว่ามี msisdn ไหม
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    #ข้ามขั้นตอนนี้ เพราะ app จะไป insert ค่าให้
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    {"msisdn":"66812340052","package":{"currentPackage":"O2103P210305313","productSequenceId":"0002480109997","freeUnitExpireTime":"20230430235959+0700"},"5GMode":{"changeModePerday":{"count":1,"currentDate":"${CurrentDateFromLibrary}"},"currentMode":{"modeName":"max_mode","expireDate":"20991231:235959"},"lastDefaultMode":"max_mode"}}    ${ID}
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCommandFileLog}    ${PathLogActivate5GMode}
    SetLogNull    ${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ProduceKafka    ${delete_qa.5GModeActivated}    ${Produce_qa.activate5GMode}    {"key":"Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId":"ios-20230327111117974MRPusL4Tsc","command":"mfaf.activate5GMode","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812340052","transactionId":"TST_F13_1_1_102"},"dataBody":{"accessToken":"02eyJhbGciOiJIUzI1NiJ9.eyJtb2JpbGVObyI6IjA5MTAwMzEzNDYiLCJuZXR3b3JrVHlwZSI6Ik1BU1MiLCJ0aW1lc3RhbXAiOiIyMDIzLTAzLTE1VDE0OjEwOjE0KzA3OjAwIn0.jTwLjjC9p0t9IbVC5w3nI8R7WBahJuVC_J2BrKEypJ0","msisdn":"66812340052","networkType":"CPE","modeName":"max_mode"}}}
    #Consume คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ConsumeKafka    ${Consume_qa.5GModeActivated}    ${TC_Number}
    log    ${ConsumeResult}
    # check ค่า
    VerifyDataConsume    ${ConsumeResult}    {"key":"Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId":"ios-20230327111117974MRPusL4Tsc","command":"qa.5GModeActivated","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812340052","transactionId":"TST_F13_1_1_102"},"dataBody":{"resultCode":"20000","resultDesc":"Success","developerMessage":"Success","modeName":"max_mode"}}}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    FlushLogbyCommandName    ${NameCommandFileLog}    ${TC_Number}    ${PathLogActivate5GMode}
    FlushLogbyCommandName    ${NameCommandFileLogChkAddPack}    ${TC_Number}_${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    # querydata
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    #check db
    ${currentDate}    CurrentDate
    VerifyMongoDB    ${Jsondata}    {"msisdn":"66812340052","package":{"currentPackage":"O2103P210305313","productSequenceId":"0002480109997","freeUnitExpireTime":"20230430235959+0700"},"5GMode":{"changeModePerday":{"count":1,"currentDate":"${currentDate}"},"currentMode":{"modeName":"max_mode","expireDate":"20991231:235959"},"lastDefaultMode":"max_mode"}}
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    DeleteDataFromID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${ID}
    [Teardown]    Close All Connections

TST_F13_1_1_103
    #กำหนดค่าในเคส
    ${msisdn}    BuiltIn.Set Variable    {"msisdn" : "66812340053"}
    ${TC_Number}    BuiltIn.Set Variable    TST_F13_1_1_103
    #หาในDB ว่ามี msisdn ไหม
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    #ข้ามขั้นตอนนี้ เพราะ app จะไป insert ค่าให้
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    {"msisdn":"66812340053","package":{"currentPackage":"O2103P210305313","productSequenceId":"0002480109997","freeUnitExpireTime":"20230430235959+0700"},"5GMode":{"changeModePerday":{"count":0,"currentDate":"20230401"},"currentMode":{"modeName":"max_mode","expireDate":"20991231:235959"},"lastDefaultMode":"max_mode"}}    ${ID}
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCommandFileLog}    ${PathLogActivate5GMode}
    SetLogNull    ${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ProduceKafka    ${delete_qa.5GModeActivated}    ${Produce_qa.activate5GMode}    {"key":"Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId":"ios-20230327111117974MRPusL4Tsc","command":"mfaf.activate5GMode","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812340053","transactionId":"TST_F13_1_1_103"},"dataBody":{"accessToken":"02eyJhbGciOiJIUzI1NiJ9.eyJtb2JpbGVObyI6IjA5MTAwMzEzNDYiLCJuZXR3b3JrVHlwZSI6Ik1BU1MiLCJ0aW1lc3RhbXAiOiIyMDIzLTAzLTE1VDE0OjEwOjE0KzA3OjAwIn0.jTwLjjC9p0t9IbVC5w3nI8R7WBahJuVC_J2BrKEypJ0","msisdn":"66812340053","networkType":"CPE","modeName":"eco_mode","promotionCode":"0002480109997","packType":"ontop","effectiveOption":"I"}}}
    #Consume คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ConsumeKafka    ${Consume_qa.5GModeActivated}    ${TC_Number}
    log    ${ConsumeResult}
    # check ค่า
    VerifyDataConsume    ${ConsumeResult}    {"key":"Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId":"ios-20230327111117974MRPusL4Tsc","command":"qa.5GModeActivated","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812340053","transactionId":"TST_F13_1_1_103"},"dataBody":{"resultCode":"20000","resultDesc":"Success","developerMessage":"Success","modeName":"eco_mode"}}}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    FlushLogbyCommandName    ${NameCommandFileLog}    ${TC_Number}    ${PathLogActivate5GMode}
    FlushLogbyCommandName    ${NameCommandFileLogChkAddPack}    ${TC_Number}_${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    # querydata
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    #check db
    ${currentDate}    CurrentDate
    VerifyMongoDB    ${Jsondata}    {"msisdn":"66812340053","package":{"currentPackage":"O2103P210305313","productSequenceId":"0002480109997","freeUnitExpireTime":"20230430235959+0700"},"5GMode":{"changeModePerday":{"count":1,"currentDate":"${currentDate}"},"currentMode":{"modeName":"eco_mode","expireDate":"20991231:235959"},"lastDefaultMode":"max_mode"}}
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    DeleteDataFromID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${ID}
    [Teardown]    Close All Connections

TST_F13_1_1_104
    #กำหนดค่าในเคส
    ${msisdn}    BuiltIn.Set Variable    {"msisdn" : "66812340054"}
    ${TC_Number}    BuiltIn.Set Variable    TST_F13_1_1_104
    ${CurrentDateFromLibrary}    CurrentDateFromLibrary
    #หาในDB ว่ามี msisdn ไหม
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    #ข้ามขั้นตอนนี้ เพราะ app จะไป insert ค่าให้
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    {"msisdn":"66812340054","package":{"currentPackage":"O2103P210305313","productSequenceId":"0002480109997","freeUnitExpireTime":"20230430235959+0700"},"5GMode":{"changeModePerday":{"count":0,"currentDate":"${CurrentDateFromLibrary}"},"currentMode":{"modeName":"max_mode","expireDate":"20991231:235959"},"lastDefaultMode":"max_mode"}}    ${ID}
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCommandFileLog}    ${PathLogActivate5GMode}
    SetLogNull    ${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ProduceKafka    ${delete_qa.5GModeActivated}    ${Produce_qa.activate5GMode}    {"key":"Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId":"ios-20230327111117974MRPusL4Tsc","command":"mfaf.activate5GMode","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812340054","transactionId":"TST_F13_1_1_104"},"dataBody":{"accessToken":"02eyJhbGciOiJIUzI1NiJ9.eyJtb2JpbGVObyI6IjA5MTAwMzEzNDYiLCJuZXR3b3JrVHlwZSI6Ik1BU1MiLCJ0aW1lc3RhbXAiOiIyMDIzLTAzLTE1VDE0OjEwOjE0KzA3OjAwIn0.jTwLjjC9p0t9IbVC5w3nI8R7WBahJuVC_J2BrKEypJ0","msisdn":"66812340054","networkType":"CPE","modeName":"eco_mode","promotionCode":"0002480109997","packType":"ontop","effectiveOption":"I"}}}
    #Consume คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ConsumeKafka    ${Consume_qa.5GModeActivated}    ${TC_Number}
    log    ${ConsumeResult}
    # check ค่า
    VerifyDataConsume    ${ConsumeResult}    {"key":"Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId":"ios-20230327111117974MRPusL4Tsc","command":"qa.5GModeActivated","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812340054","transactionId":"TST_F13_1_1_104"},"dataBody":{"resultCode":"20000","resultDesc":"Success","developerMessage":"Success","modeName":"eco_mode"}}}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    FlushLogbyCommandName    ${NameCommandFileLog}    ${TC_Number}    ${PathLogActivate5GMode}
    FlushLogbyCommandName    ${NameCommandFileLogChkAddPack}    ${TC_Number}_${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    # querydata
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    #check db
    ${currentDate}    CurrentDate
    VerifyMongoDB    ${Jsondata}    {"msisdn":"66812340054","package":{"currentPackage":"O2103P210305313","productSequenceId":"0002480109997","freeUnitExpireTime":"20230430235959+0700"},"5GMode":{"changeModePerday":{"count":1,"currentDate":"${currentDate}"},"currentMode":{"modeName":"eco_mode","expireDate":"20991231:235959"},"lastDefaultMode":"max_mode"}}
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    DeleteDataFromID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${ID}
    [Teardown]    Close All Connections

TST_F13_1_1_105
    #กำหนดค่าในเคส
    ${msisdn}    BuiltIn.Set Variable    {"msisdn" : "66812340055"}
    ${TC_Number}    BuiltIn.Set Variable    TST_F13_1_1_105
    #หาในDB ว่ามี msisdn ไหม
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    #ข้ามขั้นตอนนี้ เพราะ app จะไป insert ค่าให้
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    {"msisdn":"66812340055","package":{"currentPackage":"O2103P210305313","productSequenceId":"0002480109997","freeUnitExpireTime":"20230430235959+0700"},"5GMode":{"changeModePerday":{"count":10,"currentDate":"20230401"},"currentMode":{"modeName":"max_mode","expireDate":"20991231:235959"},"lastDefaultMode":"max_mode"}}    ${ID}
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCommandFileLog}    ${PathLogActivate5GMode}
    SetLogNull    ${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ProduceKafka    ${delete_qa.5GModeActivated}    ${Produce_qa.activate5GMode}    {"key":"Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId":"ios-20230327111117974MRPusL4Tsc","command":"mfaf.activate5GMode","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812340055","transactionId":"TST_F13_1_1_105"},"dataBody":{"accessToken":"02eyJhbGciOiJIUzI1NiJ9.eyJtb2JpbGVObyI6IjA5MTAwMzEzNDYiLCJuZXR3b3JrVHlwZSI6Ik1BU1MiLCJ0aW1lc3RhbXAiOiIyMDIzLTAzLTE1VDE0OjEwOjE0KzA3OjAwIn0.jTwLjjC9p0t9IbVC5w3nI8R7WBahJuVC_J2BrKEypJ0","msisdn":"66812340055","networkType":"CPE","modeName":"game_mode","promotionCode":"0002480109997","packType":"ontop","effectiveOption":"I"}}}
    #Consume คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ConsumeKafka    ${Consume_qa.5GModeActivated}    ${TC_Number}
    log    ${ConsumeResult}
    # check ค่า
    VerifyDataConsume    ${ConsumeResult}    {"key":"Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId":"ios-20230327111117974MRPusL4Tsc","command":"qa.5GModeActivated","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812340055","transactionId":"TST_F13_1_1_105"},"dataBody":{"resultCode":"20000","resultDesc":"Success","developerMessage":"Success","modeName":"game_mode"}}}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    FlushLogbyCommandName    ${NameCommandFileLog}    ${TC_Number}    ${PathLogActivate5GMode}
    FlushLogbyCommandName    ${NameCommandFileLogChkAddPack}    ${TC_Number}_${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    # querydata
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    ${JsondataexpireDate}    ${JsondataexpireDateTime}    GetExpireDateFromJson    ${Jsondata}
    #check db
    ${currentDate}    CurrentDate
    ${CurrentDateAndTime+1hour}    CurrentDateAndTime+1hour
    ${expireDate}    CurrentDateAndTimeNow
    ${CurrentDateAndTime+1hour-1min}    CurrentDateAndTime+1hour-1min
    IF    '${CurrentDateAndTime+1hour}'=='${JsondataexpireDateTime}' or '${CurrentDateAndTime+1hour-1min}'=='${JsondataexpireDateTime}'
        ${expireDate}    BuiltIn.Set Variable    ${JsondataexpireDate}
    END
    VerifyMongoDB    ${Jsondata}    {"msisdn":"66812340055","package":{"currentPackage":"O2103P210305313","productSequenceId":"0002480109997","freeUnitExpireTime":"20230430235959+0700"},"5GMode":{"changeModePerday":{"count":1,"currentDate":"${currentDate}"},"currentMode":{"modeName":"game_mode","expireDate":"${expireDate}"},"lastDefaultMode":"max_mode"}}
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    DeleteDataFromID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${ID}
    [Teardown]    Close All Connections

TST_F13_1_1_106
    #กำหนดค่าในเคส
    ${msisdn}    BuiltIn.Set Variable    {"msisdn" : "66812340056"}
    ${TC_Number}    BuiltIn.Set Variable    TST_F13_1_1_106
    ${CurrentDateFromLibrary}    CurrentDateFromLibrary
    #หาในDB ว่ามี msisdn ไหม
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    #ข้ามขั้นตอนนี้ เพราะ app จะไป insert ค่าให้
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    {"msisdn":"66812340056","package":{"currentPackage":"O2103P210305313","productSequenceId":"0002480109997","freeUnitExpireTime":"20230430235959+0700"},"5GMode":{"changeModePerday":{"count":1,"currentDate":"${CurrentDateFromLibrary}"},"currentMode":{"modeName":"max_mode","expireDate":"20991231:235959"},"lastDefaultMode":"max_mode"}}    ${ID}
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCommandFileLog}    ${PathLogActivate5GMode}
    SetLogNull    ${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ProduceKafka    ${delete_qa.5GModeActivated}    ${Produce_qa.activate5GMode}    {"key":"Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId":"ios-20230327111117974MRPusL4Tsc","command":"mfaf.activate5GMode","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812340056","transactionId":"TST_F13_1_1_106"},"dataBody":{"accessToken":"02eyJhbGciOiJIUzI1NiJ9.eyJtb2JpbGVObyI6IjA5MTAwMzEzNDYiLCJuZXR3b3JrVHlwZSI6Ik1BU1MiLCJ0aW1lc3RhbXAiOiIyMDIzLTAzLTE1VDE0OjEwOjE0KzA3OjAwIn0.jTwLjjC9p0t9IbVC5w3nI8R7WBahJuVC_J2BrKEypJ0","msisdn":"66812340056","networkType":"CPE","modeName":"game_mode","promotionCode":"0002480109997","packType":"ontop","effectiveOption":"I"}}}
    #Consume คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ConsumeKafka    ${Consume_qa.5GModeActivated}    ${TC_Number}
    log    ${ConsumeResult}
    # check ค่า
    VerifyDataConsume    ${ConsumeResult}    {"key":"Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId":"ios-20230327111117974MRPusL4Tsc","command":"qa.5GModeActivated","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812340056","transactionId":"TST_F13_1_1_106"},"dataBody":{"resultCode":"20000","resultDesc":"Success","developerMessage":"Success","modeName":"game_mode"}}}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    FlushLogbyCommandName    ${NameCommandFileLog}    ${TC_Number}    ${PathLogActivate5GMode}
    FlushLogbyCommandName    ${NameCommandFileLogChkAddPack}    ${TC_Number}_${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    # querydata
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    ${JsondataexpireDate}    ${JsondataexpireDateTime}    GetExpireDateFromJson    ${Jsondata}
    #check db
    ${currentDate}    CurrentDate
    ${CurrentDateAndTime+1hour}    CurrentDateAndTime+1hour
    ${expireDate}    CurrentDateAndTimeNow
    ${CurrentDateAndTime+1hour-1min}    CurrentDateAndTime+1hour-1min
    IF    '${CurrentDateAndTime+1hour}'=='${JsondataexpireDateTime}' or '${CurrentDateAndTime+1hour-1min}'=='${JsondataexpireDateTime}'
        ${expireDate}    BuiltIn.Set Variable    ${JsondataexpireDate}
    END
    VerifyMongoDB    ${Jsondata}    {"msisdn":"66812340056","package":{"currentPackage":"O2103P210305313","productSequenceId":"0002480109997","freeUnitExpireTime":"20230430235959+0700"},"5GMode":{"changeModePerday":{"count":2,"currentDate":"${currentDate}"},"currentMode":{"modeName":"game_mode","expireDate":"${expireDate}"},"lastDefaultMode":"max_mode"}}
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    DeleteDataFromID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${ID}
    [Teardown]    Close All Connections

TST_F13_1_1_107
    #กำหนดค่าในเคส
    ${msisdn}    BuiltIn.Set Variable    {"msisdn" : "66812340057"}
    ${TC_Number}    BuiltIn.Set Variable    TST_F13_1_1_107
    #หาในDB ว่ามี msisdn ไหม
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    #ข้ามขั้นตอนนี้ เพราะ app จะไป insert ค่าให้
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    {"msisdn":"66812340057","package":{"currentPackage":"O2103P210305313","productSequenceId":"0002480109997","freeUnitExpireTime":"20230430235959+0700"},"5GMode":{"changeModePerday":{"count":5,"currentDate":"20230401"},"currentMode":{"modeName":"eco_mode","expireDate":"20991231:235959"},"lastDefaultMode":"max_mode"}}    ${ID}
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCommandFileLog}    ${PathLogActivate5GMode}
    SetLogNull    ${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ProduceKafka    ${delete_qa.5GModeActivated}    ${Produce_qa.activate5GMode}    {"key":"Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId":"ios-20230327111117974MRPusL4Tsc","command":"mfaf.activate5GMode","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812340057","transactionId":"TST_F13_1_1_107"},"dataBody":{"accessToken":"02eyJhbGciOiJIUzI1NiJ9.eyJtb2JpbGVObyI6IjA5MTAwMzEzNDYiLCJuZXR3b3JrVHlwZSI6Ik1BU1MiLCJ0aW1lc3RhbXAiOiIyMDIzLTAzLTE1VDE0OjEwOjE0KzA3OjAwIn0.jTwLjjC9p0t9IbVC5w3nI8R7WBahJuVC_J2BrKEypJ0","msisdn":"66812340057","networkType":"CPE","modeName":"boost_mode","promotionCode":"0002480109997","packType":"ontop","effectiveOption":"I"}}}
    #Consume คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ConsumeKafka    ${Consume_qa.5GModeActivated}    ${TC_Number}
    log    ${ConsumeResult}
    # check ค่า
    VerifyDataConsume    ${ConsumeResult}    {"key":"Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId":"ios-20230327111117974MRPusL4Tsc","command":"qa.5GModeActivated","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812340057","transactionId":"TST_F13_1_1_107"},"dataBody":{"resultCode":"20000","resultDesc":"Success","developerMessage":"Success","modeName":"boost_mode"}}}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    FlushLogbyCommandName    ${NameCommandFileLog}    ${TC_Number}    ${PathLogActivate5GMode}
    FlushLogbyCommandName    ${NameCommandFileLogChkAddPack}    ${TC_Number}_${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    # querydata
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    ${JsondataexpireDate}    ${JsondataexpireDateTime}    GetExpireDateFromJson    ${Jsondata}
    #check db
    ${currentDate}    CurrentDate
    ${CurrentDateAndTime+1hour}    CurrentDateAndTime+1hour
    ${expireDate}    CurrentDateAndTimeNow
    ${CurrentDateAndTime+1hour-1min}    CurrentDateAndTime+1hour-1min
    IF    '${CurrentDateAndTime+1hour}'=='${JsondataexpireDateTime}' or '${CurrentDateAndTime+1hour-1min}'=='${JsondataexpireDateTime}'
        ${expireDate}    BuiltIn.Set Variable    ${JsondataexpireDate}
    END
    VerifyMongoDB    ${Jsondata}    {"msisdn":"66812340057","package":{"currentPackage":"O2103P210305313","productSequenceId":"0002480109997","freeUnitExpireTime":"20230430235959+0700"},"5GMode":{"changeModePerday":{"count":1,"currentDate":"${currentDate}"},"currentMode":{"modeName":"boost_mode","expireDate":"${expireDate}"},"lastDefaultMode":"max_mode"}}
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    DeleteDataFromID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${ID}
    [Teardown]    Close All Connections

TST_F13_1_1_108
    #กำหนดค่าในเคส
    ${msisdn}    BuiltIn.Set Variable    {"msisdn" : "66812340058"}
    ${TC_Number}    BuiltIn.Set Variable    TST_F13_1_1_108
    ${CurrentDateFromLibrary}    CurrentDateFromLibrary
    #หาในDB ว่ามี msisdn ไหม
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    #ข้ามขั้นตอนนี้ เพราะ app จะไป insert ค่าให้
    CheckResultAndInsertDelectData    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    {"msisdn":"66812340058","package":{"currentPackage":"O2103P210305313","productSequenceId":"0002480109997","freeUnitExpireTime":"20230430235959+0700"},"5GMode":{"changeModePerday":{"count":5,"currentDate":"${CurrentDateFromLibrary}"},"currentMode":{"modeName":"game_mode","expireDate":"20230419:201954"},"lastDefaultMode":"max_mode"}}    ${ID}
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCommandFileLog}    ${PathLogActivate5GMode}
    SetLogNull    ${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ProduceKafka    ${delete_qa.5GModeActivated}    ${Produce_qa.activate5GMode}    {"key":"Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId":"ios-20230327111117974MRPusL4Tsc","command":"mfaf.activate5GMode","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812340058","transactionId":"TST_F13_1_1_108"},"dataBody":{"accessToken":"02eyJhbGciOiJIUzI1NiJ9.eyJtb2JpbGVObyI6IjA5MTAwMzEzNDYiLCJuZXR3b3JrVHlwZSI6Ik1BU1MiLCJ0aW1lc3RhbXAiOiIyMDIzLTAzLTE1VDE0OjEwOjE0KzA3OjAwIn0.jTwLjjC9p0t9IbVC5w3nI8R7WBahJuVC_J2BrKEypJ0","msisdn":"66812340058","networkType":"CPE","modeName":"boost_mode","promotionCode":"0002480109997","packType":"ontop","effectiveOption":"I"}}}
    #Consume คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ConsumeKafka    ${Consume_qa.5GModeActivated}    ${TC_Number}
    log    ${ConsumeResult}
    # check ค่า
    VerifyDataConsume    ${ConsumeResult}    {"key":"Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId":"ios-20230327111117974MRPusL4Tsc","command":"qa.5GModeActivated","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812340058","transactionId":"TST_F13_1_1_108"},"dataBody":{"resultCode":"20000","resultDesc":"Success","developerMessage":"Success","modeName":"boost_mode"}}}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    FlushLogbyCommandName    ${NameCommandFileLog}    ${TC_Number}    ${PathLogActivate5GMode}
    FlushLogbyCommandName    ${NameCommandFileLogChkAddPack}    ${TC_Number}_${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    # querydata
    ${Jsondata}    QueryDataReturnJson    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    ${JsondataexpireDate}    ${JsondataexpireDateTime}    GetExpireDateFromJson    ${Jsondata}
    #check db
    ${currentDate}    CurrentDate
    ${CurrentDateAndTime+1hour}    CurrentDateAndTime+1hour
    ${expireDate}    CurrentDateAndTimeNow
    ${CurrentDateAndTime+1hour-1min}    CurrentDateAndTime+1hour-1min
    IF    '${CurrentDateAndTime+1hour}'=='${JsondataexpireDateTime}' or '${CurrentDateAndTime+1hour-1min}'=='${JsondataexpireDateTime}'
        ${expireDate}    BuiltIn.Set Variable    ${JsondataexpireDate}
    END
    VerifyMongoDB    ${Jsondata}    {"msisdn":"66812340058","package":{"currentPackage":"O2103P210305313","productSequenceId":"0002480109997","freeUnitExpireTime":"20230430235959+0700"},"5GMode":{"changeModePerday":{"count":6,"currentDate":"${currentDate}"},"currentMode":{"modeName":"boost_mode","expireDate":"${expireDate}"},"lastDefaultMode":"max_mode"}}
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${msisdn}
    DeleteDataFromID    ${DataBaseNameNSB}    ${CollactionNameLivingNetworkMSISDN}    ${ID}
    [Teardown]    Close All Connections

TST_F13_0_1_027
    #กำหนดค่าในเคส
    ${TC_Number}    BuiltIn.Set Variable    TST_F13_0_1_027
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCommandFileLog}    ${PathLogActivate5GMode}
    SetLogNull    ${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ProduceKafka    ${delete_qa.5GModeActivated}    ${Produce_qa.activate5GMode}    {"key":"Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId":"ios-20230327111117974MRPusL4Tsc","command":"mfaf.activate5GMode","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812340015","transactionId":"TST_F13_0_1_027"},"dataBody":{"accessToken":"02eyJhbGciOiJIUzI1NiJ9.eyJtb2JpbGVObyI6IjA5MTAwMzEzNDYiLCJuZXR3b3JrVHlwZSI6Ik1BU1MiLCJ0aW1lc3RhbXAiOiIyMDIzLTAzLTE1VDE0OjEwOjE0KzA3OjAwIn0.jTwLjjC9p0t9IbVC5w3nI8R7WBahJuVC_J2BrKEypJ0","msisdn":"66812340015","networkType":"CPE","modeName":"max_mode"}}}
    #Consume คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ConsumeKafka    ${Consume_qa.5GModeActivated}    ${TC_Number}
    log    ${ConsumeResult}
    # check ค่า
    VerifyDataConsume    ${ConsumeResult}    {"key":"Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId":"ios-20230327111117974MRPusL4Tsc","command":"qa.5GModeActivated","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812340015","transactionId":"TST_F13_0_1_027"},"dataBody":{"resultCode":"40400","resultDesc":"Not Found","developerMessage":"Not found data in Mongo DB","modeName":""}}}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    FlushLogbyCommandName    ${NameCommandFileLog}    ${TC_Number}    ${PathLogActivate5GMode}
    FlushLogbyCommandName    ${NameCommandFileLogChkAddPack}    ${TC_Number}_${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    [Teardown]    Close All Connections

TST_F13_0_1_028
    #กำหนดค่าในเคส
    ${TC_Number}    BuiltIn.Set Variable    TST_F13_0_1_028
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCommandFileLog}    ${PathLogActivate5GMode}
    SetLogNull    ${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ProduceKafka    ${delete_qa.5GModeActivated}    ${Produce_qa.activate5GMode}    {"key":"Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId":"ios-20230327111117974MRPusL4Tsc","command":"mfaf.activate5GMode","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812340016","transactionId":"TST_F13_0_1_028"},"dataBody":{"accessToken":"02eyJhbGciOiJIUzI1NiJ9.eyJtb2JpbGVObyI6IjA5MTAwMzEzNDYiLCJuZXR3b3JrVHlwZSI6Ik1BU1MiLCJ0aW1lc3RhbXAiOiIyMDIzLTAzLTE1VDE0OjEwOjE0KzA3OjAwIn0.jTwLjjC9p0t9IbVC5w3nI8R7WBahJuVC_J2BrKEypJ0","msisdn":"66812340016","networkType":"CPE","modeName":"boost_mode","promotionCode":"0002480109997","packType":"ontop","effectiveOption":"I"}}}
    #Consume คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ConsumeKafka    ${Consume_qa.5GModeActivated}    ${TC_Number}
    log    ${ConsumeResult}
    # check ค่า
    VerifyDataConsume    ${ConsumeResult}    {"key":"Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId":"ios-20230327111117974MRPusL4Tsc","command":"qa.5GModeActivated","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812340016","transactionId":"TST_F13_0_1_028"},"dataBody":{"resultCode":"40400","resultDesc":"Not Found","developerMessage":"Not found data from Mongo DB","modeName":""}}}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    FlushLogbyCommandName    ${NameCommandFileLog}    ${TC_Number}    ${PathLogActivate5GMode}
    FlushLogbyCommandName    ${NameCommandFileLogChkAddPack}    ${TC_Number}_${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    [Teardown]    Close All Connections

TST_F13_0_1_024
    #กำหนดค่าในเคส
    ${TC_Number}    BuiltIn.Set Variable    TST_F13_0_1_024
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCommandFileLog}    ${PathLogActivate5GMode}
    SetLogNull    ${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    #Set AC Response Timeout
    SetMockupResponse    ${PathConfigAntiCorruptResponse_Default}    ${PathConfigAntiCorruptResponse_Timeout}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ProduceKafka    ${delete_qa.5GModeActivated}    ${Produce_qa.activate5GMode}    {"key":"Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId":"ios-20230327111117974MRPusL4Tsc","command":"qa.activate5GMode","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812340019","transactionId":"TST_F13_0_1_024"},"dataBody":{"accessToken":"02eyJhbGciOiJIUzI1NiJ9.eyJtb2JpbGVObyI6IjA5MTAwMzEzNDYiLCJuZXR3b3JrVHlwZSI6Ik1BU1MiLCJ0aW1lc3RhbXAiOiIyMDIzLTAzLTE1VDE0OjEwOjE0KzA3OjAwIn0.jTwLjjC9p0t9IbVC5w3nI8R7WBahJuVC_J2BrKEypJ0","msisdn":"66812340019","networkType":"CPE","modeName":"boost_mode","promotionCode":"0002480109997","packType":"ontop","effectiveOption":"I"}}}
    #Consume คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ConsumeKafka    ${Consume_qa.5GModeActivated}    ${TC_Number}
    log    ${ConsumeResult}
    # check ค่า
    VerifyDataConsume    ${ConsumeResult}    {"key":"Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId":"ios-20230327111117974MRPusL4Tsc","command":"qa.5GModeActivated","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812340019","transactionId":"TST_F13_0_1_024"},"dataBody":{"resultCode":"50100","resultDesc":"timeout","developerMessage":"Send Request to addPackage : timeout","modeName":""}}}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    FlushLogbyCommandName    ${NameCommandFileLog}    ${TC_Number}    ${PathLogActivate5GMode}
    FlushLogbyCommandName    ${NameCommandFileLogChkAddPack}    ${TC_Number}_${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    #Set AC Response Success (Default)
    SetMockupResponse    ${PathConfigAntiCorruptResponse_Default}    ${PathConfigAntiCorruptResponse_Success}
    [Teardown]    Close All Connections

TST_F13_0_1_025
    #กำหนดค่าในเคส
    ${TC_Number}    BuiltIn.Set Variable    TST_F13_0_1_025
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCommandFileLog}    ${PathLogActivate5GMode}
    SetLogNull    ${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    #Set AC Response Data Not Found
    SetMockupResponse    ${PathConfigAntiCorruptResponse_Default}    ${PathConfigAntiCorruptResponse_Data_Not_Found}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ProduceKafka    ${delete_qa.5GModeActivated}    ${Produce_qa.activate5GMode}    {"key":"Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId":"ios-20230327111117974MRPusL4Tsc","command":"qa.activate5GMode","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812340020","transactionId":"TST_F13_0_1_025"},"dataBody":{"accessToken":"02eyJhbGciOiJIUzI1NiJ9.eyJtb2JpbGVObyI6IjA5MTAwMzEzNDYiLCJuZXR3b3JrVHlwZSI6Ik1BU1MiLCJ0aW1lc3RhbXAiOiIyMDIzLTAzLTE1VDE0OjEwOjE0KzA3OjAwIn0.jTwLjjC9p0t9IbVC5w3nI8R7WBahJuVC_J2BrKEypJ0","msisdn":"66812340020","networkType":"CPE","modeName":"boost_mode","promotionCode":"0002480109997","packType":"ontop","effectiveOption":"I"}}}
    #Consume คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ConsumeKafka    ${Consume_qa.5GModeActivated}    ${TC_Number}
    log    ${ConsumeResult}
    # check ค่า
    VerifyDataConsume    ${ConsumeResult}    {"key":"Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId":"ios-20230327111117974MRPusL4Tsc","command":"qa.5GModeActivated","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812340020","transactionId":"TST_F13_0_1_025"},"dataBody":{"resultCode":"40400","resultDesc":"Data Not Found","developerMessage":"Send Request to addPackage : Data Not Found","modeName":""}}}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    FlushLogbyCommandName    ${NameCommandFileLog}    ${TC_Number}    ${PathLogActivate5GMode}
    FlushLogbyCommandName    ${NameCommandFileLogChkAddPack}    ${TC_Number}_${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    #Set AC Response Success (Default)
    SetMockupResponse    ${PathConfigAntiCorruptResponse_Default}    ${PathConfigAntiCorruptResponse_Success}
    [Teardown]    Close All Connections

TST_F13_0_1_026
    #กำหนดค่าในเคส
    ${TC_Number}    BuiltIn.Set Variable    TST_F13_0_1_026
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCommandFileLog}    ${PathLogActivate5GMode}
    SetLogNull    ${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    #Set AC Response Missing or Invalid parameter
    SetMockupResponse    ${PathConfigAntiCorruptResponse_Default}    ${PathConfigAntiCorruptResponse_Missing_or_Invalid}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ProduceKafka    ${delete_qa.5GModeActivated}    ${Produce_qa.activate5GMode}    {"key":"Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId":"ios-20230327111117974MRPusL4Tsc","command":"qa.activate5GMode","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812340021","transactionId":"TST_F13_0_1_026"},"dataBody":{"accessToken":"02eyJhbGciOiJIUzI1NiJ9.eyJtb2JpbGVObyI6IjA5MTAwMzEzNDYiLCJuZXR3b3JrVHlwZSI6Ik1BU1MiLCJ0aW1lc3RhbXAiOiIyMDIzLTAzLTE1VDE0OjEwOjE0KzA3OjAwIn0.jTwLjjC9p0t9IbVC5w3nI8R7WBahJuVC_J2BrKEypJ0","msisdn":"66812340021","networkType":"CPE","modeName":"boost_mode","promotionCode":"0002480109997","packType":"ontop","effectiveOption":"I"}}}
    #Consume คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ConsumeKafka    ${Consume_qa.5GModeActivated}    ${TC_Number}
    log    ${ConsumeResult}
    # check ค่า
    VerifyDataConsume    ${ConsumeResult}    {"key":"Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId":"ios-20230327111117974MRPusL4Tsc","command":"qa.5GModeActivated","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812340021","transactionId":"TST_F13_0_1_026"},"dataBody":{"resultCode":"40300","resultDesc":"Missing or Invalid parameter","developerMessage":"Send Request to addPackage : Missing or Invalid parameter","modeName":""}}}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    FlushLogbyCommandName    ${NameCommandFileLog}    ${TC_Number}    ${PathLogActivate5GMode}
    FlushLogbyCommandName    ${NameCommandFileLogChkAddPack}    ${TC_Number}_${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    #Set AC Response Success (Default)
    SetMockupResponse    ${PathConfigAntiCorruptResponse_Default}    ${PathConfigAntiCorruptResponse_Success}
    [Teardown]    Close All Connections

TST_F13_0_1_030
    #กำหนดค่าในเคส
    ${TC_Number}    BuiltIn.Set Variable    TST_F13_0_1_030
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCommandFileLog}    ${PathLogActivate5GMode}
    SetLogNull    ${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    #Set AC Response System Error
    SetMockupResponse    ${PathConfigAntiCorruptResponse_Default}    ${PathConfigAntiCorruptResponse_System_Error}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ProduceKafka    ${delete_qa.5GModeActivated}    ${Produce_qa.activate5GMode}    {"key":"Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId":"ios-20230327111117974MRPusL4Tsc","command":"qa.activate5GMode","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812340060","transactionId":"TST_F13_0_1_030"},"dataBody":{"accessToken":"02eyJhbGciOiJIUzI1NiJ9.eyJtb2JpbGVObyI6IjA5MTAwMzEzNDYiLCJuZXR3b3JrVHlwZSI6Ik1BU1MiLCJ0aW1lc3RhbXAiOiIyMDIzLTAzLTE1VDE0OjEwOjE0KzA3OjAwIn0.jTwLjjC9p0t9IbVC5w3nI8R7WBahJuVC_J2BrKEypJ0","msisdn":"66812340060","networkType":"CPE","modeName":"eco_mode","promotionCode":"0002480109997","packType":"ontop","effectiveOption":"I"}}}
    #Consume คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ConsumeKafka    ${Consume_qa.5GModeActivated}    ${TC_Number}
    log    ${ConsumeResult}
    # check ค่า
    VerifyDataConsume    ${ConsumeResult}    {"key":"Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId":"ios-20230327111117974MRPusL4Tsc","command":"qa.5GModeActivated","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812340060","transactionId":"TST_F13_0_1_030"},"dataBody":{"resultCode":"50000","resultDesc":"System Error","developerMessage":"Send Request to addPackage : System Error","modeName":""}}}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    FlushLogbyCommandName    ${NameCommandFileLog}    ${TC_Number}    ${PathLogActivate5GMode}
    FlushLogbyCommandName    ${NameCommandFileLogChkAddPack}    ${TC_Number}_${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    #Set AC Response Success (Default)
    SetMockupResponse    ${PathConfigAntiCorruptResponse_Default}    ${PathConfigAntiCorruptResponse_Success}

TST_F13_0_1_031
    #กำหนดค่าในเคส
    ${TC_Number}    BuiltIn.Set Variable    TST_F13_0_1_031
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCommandFileLog}    ${PathLogActivate5GMode}
    SetLogNull    ${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    #Set AC Response Missing resultCode
    SetMockupResponse    ${PathConfigAntiCorruptResponse_Default}    ${PathConfigAntiCorruptResponse_TST_F13_0_1_031}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ProduceKafka    ${delete_qa.5GModeActivated}    ${Produce_qa.activate5GMode}    {"key":"Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId":"ios-20230327111117974MRPusL4Tsc","command":"qa.activate5GMode","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812340061","transactionId":"TST_F13_0_1_031"},"dataBody":{"accessToken":"02eyJhbGciOiJIUzI1NiJ9.eyJtb2JpbGVObyI6IjA5MTAwMzEzNDYiLCJuZXR3b3JrVHlwZSI6Ik1BU1MiLCJ0aW1lc3RhbXAiOiIyMDIzLTAzLTE1VDE0OjEwOjE0KzA3OjAwIn0.jTwLjjC9p0t9IbVC5w3nI8R7WBahJuVC_J2BrKEypJ0","msisdn":"66812340061","networkType":"CPE","modeName":"game_mode","promotionCode":"0002480109997","packType":"ontop","effectiveOption":"I"}}}
    #Consume คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ConsumeKafka    ${Consume_qa.5GModeActivated}    ${TC_Number}
    log    ${ConsumeResult}
    # check ค่า
    VerifyDataConsume    ${ConsumeResult}    {"key":"Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId":"ios-20230327111117974MRPusL4Tsc","command":"qa.5GModeActivated","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812340061","transactionId":"TST_F13_0_1_031"},"dataBody":{"resultCode":"","resultDesc":"Success","developerMessage":"Send Request to addPackage : Success","modeName":""}}}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    FlushLogbyCommandName    ${NameCommandFileLog}    ${TC_Number}    ${PathLogActivate5GMode}
    FlushLogbyCommandName    ${NameCommandFileLogChkAddPack}    ${TC_Number}_${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    #Set AC Response Success (Default)
    SetMockupResponse    ${PathConfigAntiCorruptResponse_Default}    ${PathConfigAntiCorruptResponse_Success}

TST_F13_0_1_032
    #กำหนดค่าในเคส
    ${TC_Number}    BuiltIn.Set Variable    TST_F13_0_1_032
    #set log ให้ว่าง
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCommandFileLog}    ${PathLogActivate5GMode}
    SetLogNull    ${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    #Set AC Response Null resultCode
    SetMockupResponse    ${PathConfigAntiCorruptResponse_Default}    ${PathConfigAntiCorruptResponse_TST_F13_0_1_032}
    #produce คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ProduceKafka    ${delete_qa.5GModeActivated}    ${Produce_qa.activate5GMode}    {"key":"Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId":"ios-20230327111117974MRPusL4Tsc","command":"qa.activate5GMode","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812340062","transactionId":"TST_F13_0_1_032"},"dataBody":{"accessToken":"02eyJhbGciOiJIUzI1NiJ9.eyJtb2JpbGVObyI6IjA5MTAwMzEzNDYiLCJuZXR3b3JrVHlwZSI6Ik1BU1MiLCJ0aW1lc3RhbXAiOiIyMDIzLTAzLTE1VDE0OjEwOjE0KzA3OjAwIn0.jTwLjjC9p0t9IbVC5w3nI8R7WBahJuVC_J2BrKEypJ0","msisdn":"66812340062","networkType":"CPE","modeName":"game_mode","promotionCode":"0002480109997","packType":"ontop","effectiveOption":"I"}}}
    #Consume คำสั่ง ลง kafka
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ConsumeKafka    ${Consume_qa.5GModeActivated}    ${TC_Number}
    log    ${ConsumeResult}
    # check ค่า
    VerifyDataConsume    ${ConsumeResult}    {"key":"Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId":"ios-20230327111117974MRPusL4Tsc","command":"qa.5GModeActivated","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812340062","transactionId":"TST_F13_0_1_032"},"dataBody":{"resultCode":"","resultDesc":"Success","developerMessage":"Send Request to addPackage : Success","modeName":""}}}
    #เก็บ log'
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    FlushLogbyCommandName    ${NameCommandFileLog}    ${TC_Number}    ${PathLogActivate5GMode}
    FlushLogbyCommandName    ${NameCommandFileLogChkAddPack}    ${TC_Number}_${NameCommandFileLogChkAddPack}    ${PathLogActivate5GMode}
    #Set AC Response Success (Default)
    SetMockupResponse    ${PathConfigAntiCorruptResponse_Default}    ${PathConfigAntiCorruptResponse_Success}
