*** Settings ***
Library           SSHLibrary
Library           DatabaseLibrary
Library           psycopg2
Library           RobotMongoDBLibrary.Insert
Library           RobotMongoDBLibrary.Update
Library           RobotMongoDBLibrary.Find
Library           RobotMongoDBLibrary.Delete
Library           pymongo
Library           BuiltIn
Library           String
Library           OperatingSystem
Library           MongoDBLibrary
*** Variables ***
&{MONGODB_CONNECT_STRING}    connection=mongodb://mfafApp:Ais%402023@10.138.38.233:25000,10.138.38.234:25000,10.138.38.235:25000/?authSource=mfaf_neb&replicaSet=replSet01    database=mfaf_neb    collection=cellUserLocation
${RESULT}         ${EMPTY}
${ID}             ${EMPTY}
${JSONINSERT}     {"msisdn" : "66836077444","dateTime" : "20230216155001", "geometry" : { "type" : "Point", "coordinates" : [100.539715,13.7758630000001]},"imei" : "","imsi" : "","properties" : {"LAC" : 1020,"CI" : "10060","STATION_TYPE" : "Macro","SYSTEM_TYPE" : "2G","LATITUDE_WGS84" : "13.775863","LONGITUDE_WGS84" : "100.539715","CGI" : "520010102010060","CGI_HEX" : "5200103FC274C"}}
${CMD_NAME}       'CSLIVINGNWA002_service-qualification2_'
${TC_NUM}         TST_F14_1_1_001
${Consume_dev.5GModeActivated}    /app/kafka/kafka_2.13-3.2.3/bin/kafka-console-consumer.sh --bootstrap-server DMYAISNSB-0001:9093,DMYAISNSB-0002:9093,DMYAISNSB-0003:9093 --consumer.config /app/kafka/kafka_2.13-3.2.3/config/client-ssl.properties --topic dev.5GModeActivated --from-beginning
${JSON}           {"msisdn" : "66836077444"}
${msisdn}         {"msisdn" : "66896800888"}
${Consume_dev.activate5GMode}    /app/kafka/kafka_2.13-3.2.3/bin/kafka-console-consumer.sh --bootstrap-server DMYAISNSB-0001:9093,DMYAISNSB-0002:9093,DMYAISNSB-0003:9093 --consumer.config /app/kafka/kafka_2.13-3.2.3/config/client-ssl.properties --topic dev.activate5GMode --from-beginning
${ConsumeResult}    \
${JSONTST_F18_1_1_001}    {"msisdn" : "66896800888","package" : {"currentPackage" : "O2103P210305313","productSequenceId" : "0002480109997","freeUnitExpireTime" : "20230401000000+0800"},"5GMode" : {"changeModePerday" : {"count" : 4,"currentDate" : "20230331"},"currentMode" : {"modeName" : "max_mode","expireDate" : "20991231:235959"},"lastDefaultMode" : "max_mode"}}
${CmdProduce}     /app/kafka/kafka_2.13-3.2.3/bin/kafka-console-producer.sh --bootstrap-server DMYAISNSB-0001:9093,DMYAISNSB-0002:9093,DMYAISNSB-0003:9093 --producer.config /app/kafka/kafka_2.13-3.2.3/config/client-ssl.properties --topic qa.requestServiceProfile
${CmdDeleteMassage}    /app/kafka/kafka_2.13-3.2.3/bin/kafka-delete-records.sh \ --bootstrap-server DMYAISNSB-0001:9093,DMYAISNSB-0002:9093,DMYAISNSB-0003:9093 \ --command-config /app/kafka/kafka_2.13-3.2.3/config/client-ssl.properties --offset-json-file /home/serveradm/delete-dev.service-profile.json
${DataProduce}    {"key": "Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId": "ios-20230327111117974MRPusL4Tsc","command": "mfaf.requestAccessToken","value": { "invokeId": "ios-20230327111117974MRPusL4Tsc","headerBody": { "msisdn": "66896800888","transactionId": "666123456789" } , "dataBody": { "msisdn": "66896800888"}}}
${Consume_qa.requestServiceProfile}    /app/kafka/kafka_2.13-3.2.3/bin/kafka-console-consumer.sh --bootstrap-server DMYAISNSB-0001:9093,DMYAISNSB-0002:9093,DMYAISNSB-0003:9093 --consumer.config /app/kafka/kafka_2.13-3.2.3/config/client-ssl.properties --topic qa.requestServiceProfile --from-beginning
${Consume_qa.serviceProfileRequested}    /app/kafka/kafka_2.13-3.2.3/bin/kafka-console-consumer.sh --bootstrap-server DMYAISNSB-0001:9093,DMYAISNSB-0002:9093,DMYAISNSB-0003:9093 --consumer.config /app/kafka/kafka_2.13-3.2.3/config/client-ssl.properties --topic qa.serviceProfileRequested --from-beginning
${DataExpectedqa.serviceProfileRequested}    {"key":"Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId":"ios-20230327111117974MRPusL4Tsc","command":"qa.serviceProfileRequested","value":{"invokeId":"ios-20230327111117974MRPusL4Tsc","headerBody":{"msisdn":"66896800888","transactionId":"666123456789"},"dataBody":{"resultCode":"20000","resultDesc":"Success","developerMessage":"Success","data":{"msisdn":"66896800888","package":{"currentPackage":"O2103P210305313","productSequenceId":"0002480109997","freeUnitExpireTime":"20230401000000+0800"},"5GMode":{"changeModePerDay":{"count":4,"currentDate":"20230331"},"currentMode":{"modeName":"max_mode","expireDate":"20991231:235959"},"lastDefaultMode":"max_mode"}}}}}


*** Test Cases ***
TestConnect
    SSHLibrary.Open Connection    10.138.38.229    timeout=1 hour
    SSHLibrary.Login    serveradm    R3dh@t!@#
    Enable SSH Logging    test.log
    ${pwd}    SSHLibrary.Execute Command    pwd
    log    ${pwd}
    Comment    ${stdout}    SSHLibrary.Write    /app/kafka/kafka_2.13-3.2.3/bin/kafka-console-producer.sh --bootstrap-server DMYAISNEB-0001:9093,DMYAISNEB-0002:9093,DMYAISNEB-0003:9093 --producer.config /app/kafka/kafka_2.13-3.2.3/config/client-ssl.properties --topic mfaf.checkCurrentCellAvailability    loglevel=DEBUG
    ${stdout}    SSHLibrary.Write    /app/kafka/kafka_2.13-3.2.3/bin/kafka-console-producer.sh --bootstrap-server DMYAISNSB-0001:9093,DMYAISNSB-0002:9093,DMYAISNSB-0003:9093 --producer.config /app/kafka/kafka_2.13-3.2.3/config/client-ssl.properties --topic mfaf.deactivate5GMode    loglevel=DEBUG
    sleep    10
    Comment    ${produce}    SSHLibrary.Write    {"key":"TST_F11_1_004_key","invokeId":"TST_F11_1_004_invokeId","command":"mfaf.checkCurrentCellAvailability","value":{"invokeId":"TST_F11_1_004_invokeId","headerBody":{"msisdn":"66836077200","transactionId":"TST_F11_1_004_transactionId"},"dataBody":{}}}    loglevel=DEBUG
    ${produce}    SSHLibrary.Write    {"key": "TST_F12_1_000_key","invokeId":"TST_F12_1_000_invokeId","value":{"invokeId":"TST_F12_1_000_invokeId",{"headerBody": {"msisdn": "66896800885","transactionId":"12345678944"},"dataBody": {"accessToken":"TST_F12_1_000_accessToken","msisdn": "668123456789","networkType": "CPE","effectiveOption": "I","packages":[{"code": "P200128060","name": "Boost_Mode_Free_0_Baht"}]}}}}    loglevel=DEBUG
    log    ${produce}
    sleep    10
    Close Connection

TestMongo
    ${ID}    find by fillter return ID    mfaf_neb    cellUserLocation    ${JSON}
    check Result    mfaf_neb    cellUserLocation    ${JSONINSERT}    ${ID}
    Comment    ${jsondata}    find data returnData    mfaf_neb    cellUserLocation    ${JSON}
    Comment    BuiltIn.Log Many    ${jsondata}

ConnectCRT
    SSHLibrary.Open Connection    10.137.30.66    timeout=1 hour
    SSHLibrary.Login    serveradm    otsohkmv'
    ${pwd}    SSHLibrary.Execute Command    pwd
    log    ${pwd}
    ${stdout}    SSHLibrary.Execute Command    cd /app/mfaf/network-service-bus/logs/log
    log    ${stdout}
    ${filename}    SSHLibrary.Execute Command    find /app/mfaf/network-service-bus/logs/log/ -type f -mmin -120 -prune | grep 'CSLIVINGNWA002_5g' |cut -d '/' -f7
    log    ${filename}
    SSHLibrary.Execute Command    cp /app/mfaf/network-service-bus/logs/log/${filename} /app/mfaf/network-service-bus/logs/TestResult/TST_F1.0.0.0.log
    ${ls}    SSHLibrary.Execute Command    ls -lrt /app/mfaf/network-service-bus/logs/TestResult/
    log    ${ls}

Testcase_pop
    SSHLibrary.Open Connection    10.137.30.66    timeout=1 hour
    SSHLibrary.Login    serveradm    otsohkmv'
    Comment    Enable SSH Logging    test.log
    ${pwd}    SSHLibrary.Execute Command    pwd
    log    ${pwd}
    ${mfaf}    SSHLibrary.Write    cd /app/mfaf/network-service-bus/logs/log
    log    ${mfaf}
    ${find}    SSHLibrary.Execute Command    find /app/mfaf/network-service-bus/logs/log -mmin -1
    log    ${find}
    sleep    5
    ${Testcase}    Remove    ${find}
    log    ${Testcase}
    ${cp}    Set Variable    cp
    ${pathTestRusult}    Set Variable    /app/mfaf/network-service-bus/logs/TestResult/Fx/TST_F12_1_000
    Comment    ${testNum}    Set Variable    TST_F12_1_000
    ${copyCase}    Set Variable    ${cp} ${Testcase} ${pathTestRusult}
    ${write}    SSHLibrary.Write    ${copyCase}

FlushLog
    SSHLibrary.Open Connection    10.137.30.66    timeout=1 hour
    SSHLibrary.Login    serveradm    otsohkmv'
    Flush Log by Command Name    CSLIVINGNWA002_service-profile_    TST_F18_1_1_001    /app/mfaf/network-service-bus/logs

SetNullLog
    SSHLibrary.Open Connection    10.137.30.66    timeout=1 hour
    SSHLibrary.Login    serveradm    otsohkmv'
    Set Log Null    ${CMD_NAME}

TestConsume
    SSHLibrary.Open Connection    10.138.38.229    timeout=1 hour
    SSHLibrary.Login    serveradm    R3dh@t!@#
    Enable SSH Logging    test.log
    Consume Kafka    ${cmdConsume_5GModeActivated}
    Read Consume And Write File    ${pwd_Consume_path}    TST_F13_1_1_000

TestKafka
    ${RESULT} =    Publish    DMYAISNSB-0001:9093 DMYAISNSB-0002:9093 DMYAISNSB-0003:9093    activate5GMode    {"key":"Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId":"ios-20230327111117974MRPusL4Tsc","command":"mfaf.activate5GMode","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812340001","transactionId":"TST_F13_1_1_000"},"dataBody":{"accessToken":"02eyJhbGciOiJIUzI1NiJ9.eyJtb2JpbGVObyI6IjA5MTAwMzEzNDYiLCJuZXR3b3JrVHlwZSI6Ik1BU1MiLCJ0aW1lc3RhbXAiOiIyMDIzLTAzLTE1VDE0OjEwOjE0KzA3OjAwIn0.jTwLjjC9p0t9IbVC5w3nI8R7WBahJuVC_J2BrKEypJ0","msisdn":"66812340001","networkType":"CPE","modeName":"max_mode"}}}
    log    ${RESULT}
    Log to console    ${RESULT}
    Comment    ${MSG} =    Subscribe    DMYAISNSB-0001:9093 DMYAISNSB-0002:9093 DMYAISNSB-0003:9093    mfaf.5GModeActivated    timeout=0.5s
    Comment    log    ${MSG}
    Comment    Log to console    ${MSG}

TestProduceAndConsume
    SSHLibrary.Open Connection    10.138.38.229    timeout=1 hour
    SSHLibrary.Login    serveradm    R3dh@t!@#
    Enable SSH Logging    test.log
    Produce Kafka    /app/kafka/kafka_2.13-3.2.3/bin/kafka-delete-records.sh \ --bootstrap-server DMYAISNSB-0001:9093,DMYAISNSB-0002:9093,DMYAISNSB-0003:9093 \ --command-config /app/kafka/kafka_2.13-3.2.3/config/client-ssl.properties --offset-json-file /home/serveradm/delete-dev.activate5GMode.json    /app/kafka/kafka_2.13-3.2.3/bin/kafka-console-producer.sh --bootstrap-server DMYAISNSB-0001:9093,DMYAISNSB-0002:9093,DMYAISNSB-0003:9093 --producer.config /app/kafka/kafka_2.13-3.2.3/config/client-ssl.properties --topic dev.activate5GMode    {"key":"Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId":"ios-20230327111117974MRPusL4Tsc","command":"dev.activate5GMode","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812340001","transactionId":"TST_F13_1_1_000"},"dataBody":{"accessToken":"02eyJhbGciOiJIUzI1NiJ9.eyJtb2JpbGVObyI6IjA5MTAwMzEzNDYiLCJuZXR3b3JrVHlwZSI6Ik1BU1MiLCJ0aW1lc3RhbXAiOiIyMDIzLTAzLTE1VDE0OjEwOjE0KzA3OjAwIn0.jTwLjjC9p0t9IbVC5w3nI8R7WBahJuVC_J2BrKEypJ0","msisdn":"66812340001","networkType":"CPE","modeName":"max_mode"}}}
    SSHLibrary.Open Connection    10.138.38.229    timeout=1 hour
    SSHLibrary.Login    serveradm    R3dh@t!@#
    Enable SSH Logging    test.log
    Consume Kafka    ${Consume_dev.activate5GMode}    TST_F13_1_1_001
    log    ${ConsumeResult}
    VerifyDataConsume    ${ConsumeResult}    {"key":"Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId":"ios-20230327111117974MRPusL4Tsc","command":"dev.activate5GMode","value":{"invokeId":"ios-20230326170246006vUoCVQc4dD","headerBody":{"msisdn":"66812340001","transactionId":"TST_F13_1_1_000"},"dataBody":{"accessToken":"02eyJhbGciOiJIUzI1NiJ9.eyJtb2JpbGVObyI6IjA5MTAwMzEzNDYiLCJuZXR3b3JrVHlwZSI6Ik1BU1MiLCJ0aW1lc3RhbXAiOiIyMDIzLTAzLTE1VDE0OjEwOjE0KzA3OjAwIn0.jTwLjjC9p0t9IbVC5w3nI8R7WBahJuVC_J2BrKEypJ0","msisdn":"66812340001","networkType":"CPE","modeName":"max_mode"}}}
    ${db_actual}    find data returnData    mfaf_nsb    livingNetworkMSISDN    {"msisdn" : "66896800888"}
    VerifyMongoDB    ${db_actual}    {'msisdn': '66896800888', 'package': {'currentPackage': 'O2103P210305313', 'productSequenceId': '0002480109997', 'freeUnitExpireTime': '20230401000000+0800'}, '5GMode': {'changeModePerday': {'count': 4, 'currentDate': '20230331'}, 'currentMode': {'modeName': 'max_mode', 'expireDate': '20991231:235959'}, 'lastDefaultMode': 'max_mode'}}

TST_F18_1_1_001
    #หาในDB ว่ามี msisdn ไหม
    ${ID}    find by fillter return ID    mfaf_nsb    livingNetworkMSISDN    ${msisdn}
    #ข้ามขั้นตอนนี้ เพราะ app จะไป insert ค่าให้
    check Result    mfaf_nsb    livingNetworkMSISDN    ${JSONTST_F18_1_1_001}    ${ID}
    #set log ให้ว่าง
    Connect CRT Log    10.137.30.66
    Set Log Null    CSLIVINGNWA002_service-profile_    /app/mfaf/network-service-bus/logs
    Connect CRT    10.138.38.229
    #produce คำสั่ง ลง kafka
    Produce Kafka    ${CmdDeleteMassage}    ${CmdProduce}    ${DataProduce}
    Connect CRT    10.138.38.229
    #Consume คำสั่ง ลง kafka
    Consume Kafka    ${Consume_qa.serviceProfileRequested}    TST_F19_1_1_001
    log    ${ConsumeResult}
    # check ค่า
    VerifyDataConsume    ${ConsumeResult}    ${DataExpectedqa.serviceProfileRequested}
    #เก็บ log'
    Connect CRT Log    10.137.30.66
    Flush Log by Command Name    CSLIVINGNWA002_service-profile_    TST_F19_1_1_001    /app/mfaf/network-service-bus/logs
    # querydata
    ${Jsondata}    find data returnData    mfaf_nsb    livingNetworkMSISDN    ${msisdn}
    #check db
    VerifyMongoDB    ${Jsondata}    ${JSONTST_F18_1_1_001}
    ${ID}    find by fillter return ID    mfaf_nsb    livingNetworkMSISDN    ${msisdn}
    delete data by ID into mongodb    mfaf_nsb    livingNetworkMSISDN    ${ID}
*** Keywords ***
insert data into mongodb
    [Arguments]    ${DBName}    ${CollectionName}    ${JSONINSERT}
    ${Data_insert}    Set Variable    ${JSONINSERT}
    Connect MongoDB    ${DBName}
    ${data_result}    Save Mongodb Records    ${DBName}    ${CollectionName}    ${Data_insert}
    log    ${data_result}
    BuiltIn.Log To Console    Insert Success

find data returnData
    [Arguments]    ${DBName}    ${CollectionName}    ${JSON}
    [Documentation]    Ex. msisdn=0xxxxxxxx
    Connect MongoDB    ${DBName}
    ${jsondata}    Retrieve MongoDB Records With Desired Fields    ${DBName}    ${CollectionName}    ${JSON}    _id    False    True
    Comment    ${RESULT}    Set Global Variable    ${jsondata[0]}
    BuiltIn.Log Many    ${jsondata[0]}
    [Return]    ${jsondata[0]}

update data phone into mongodb by ID
    &{NEWDATA}    Create Dictionary    phone=0649359xxx
    ${MSG}    Update    ${MONGODB_CONNECT_STRING}    X100001    ${NEWDATA}
    Should Be Equal    ${MSG}    UPDATED SUCCESS

find data by ID from mongodb
    ${QueryJSON}    Set Variable    641d2c7ef3b03ffd2da359ba
    ${RESULTS}    Find One By ID    ${MONGODB_CONNECT_STRING}    ${QueryJSON}
    Log    ${MONGODB_CONNECT_STRING}
    Log    ${RESULTS}

delete data by ID into mongodb
    [Arguments]    ${DBName}    ${CollectionName}    ${ID}
    ${ID}    Set Variable    {"_id":"${ID}"}
    ${MSG}    Remove Mongodb Records    ${DBName}    ${CollectionName}    ${ID}

check Result
    [Arguments]    ${DBName}    ${CollectionName}    ${JSONINSERT}    ${ID}
    IF    "${ID}" == ""
    insert data into mongodb    ${DBName}    ${CollectionName}    ${JSONINSERT}
    ELSE
    delete data by ID into mongodb    ${DBName}    ${CollectionName}    ${ID}
    insert data into mongodb    ${DBName}    ${CollectionName}    ${JSONINSERT}
    END

Remove
    [Arguments]    ${Testcase}
    Comment    ${find}    Remove String    ${Testcase}    /app/mfaf/network-service-bus/logs/log/
    ${find}    Remove String    ${Testcase}    /app/mfaf/network-service-bus/logs/log/
    [Return]    ${find}

Set Log Null
    [Arguments]    ${Command_Name}    ${pathLog}
    ${filename}    SSHLibrary.Execute Command    find ${pathLog}/log/ -type f -mmin -120 -prune | grep ${Command_Name} |cut -d '/' -f7
    log    ${filename}
    IF    "${filename}" != ""
    SSHLibrary.Execute Command    echo "" > ${pathLog}/log/${filename}
    END

Flush Log by Command Name
    [Arguments]    ${Command_Name}    ${Number_TestCase}    ${pathLog}
    ${pwd}    SSHLibrary.Execute Command    pwd
    log    ${pwd}
    BuiltIn.Sleep    2
    ${stdout}    SSHLibrary.Execute Command    cd ${pathLog}/log/
    log    ${stdout}
    ${filename}    SSHLibrary.Execute Command    find ${pathLog}/log/ -type f -mmin -120 -prune| grep ${Command_Name} |cut -d '/' -f7
    log    ${filename}
    SSHLibrary.Execute Command    cp ${pathLog}/log/${filename} /app/mfaf/network-service-bus/logs/TestResult/${Number_TestCase}.log
    ${ls}    SSHLibrary.Execute Command    ls -lrt /app/mfaf/network-service-bus/logs/TestResult/
    log    ${ls}

Consume Kafka
    [Arguments]    ${cmdConsume}    ${ConsumeResultFile}
    [Documentation]    ${cmdConsume} --> คำสั่ง consume
    ...    ${ConsumeResultFile} --> ชื่อไฟล์ที่จะเก็บข้อมูล consume
    ...
    ...    keyword นี้จะ consume ข้อมูลมา read และเก็บข้อมูล write ใส่ไฟล์เก็บไว้
    ...
    ...    return ข้อมูลที่ได้กลับไป (${output}) --> เรียกใช้โดย ${ConsumeResult}
    #เช็ค path ปัจจุบัน
    ${pwd}    SSHLibrary.Execute Command    pwd
    log    ${pwd}
    #run คำสัง consume
    ${stdin}    SSHLibrary.Write    ${cmdConsume}    loglevel=DEBUG
    sleep    3
    #read ข้อมูลที่ได้จากการ consume
    ${output}=    SSHLibrary.Read    loglevel=DEBUG    # Shown in the console due to loglevel
    #ตัดค่า > ที่ติดมากับข้อมูล
    ${output}    String.Replace String    ${output}    \r    ${EMPTY}
    ${output}    String.Replace String    ${output}    \n    ${EMPTY}
    ${output}    String.Replace String    ${output}    ${SPACE}    ${EMPTY}
    ${output}    String.Replace String    ${output}        ${EMPTY}
    ${output}    String.Replace String    ${output}    [?2004l    ${EMPTY}
    log    ${output}
    #เขียนข้อมูลที่ read มาได้จาก consume ลงไฟล์
    SSHLibrary.Execute Command    echo '${output}' >${pwd}/ConsumeResult/${ConsumeResultFile}.txt
    BuiltIn.Set Global Variable    ${ConsumeResult}    ${output}
    [Return]    ${output}

find by fillter return ID
    [Arguments]    ${DBName}    ${CollectionName}    ${JSON}
    Connect MongoDB    ${DBName}
    ${ID}    Retrieve MongoDB Records With Desired Fields    ${DBName}    ${CollectionName}    ${JSON}    _id    True    False
    ${ID}    Replace String    ${ID}    '    ${SPACE}
    ${ID}    Remove String    ${ID}    dict_items([( _id
    ${ID}    Remove String    ${ID}    , ObjectId(
    BuiltIn.Log Many    ${ID}
    IF    "${ID}" == ""
    ${ID}    Set Variable    ${EMPTY}
    ELSE
    ${SplitID}=    Split String    ${ID}
    ${ID}    Set Variable    ${SplitID[0]}
    BuiltIn.Log Many    ${ID}
    END
    [Return]    ${ID}

Produce Kafka
    [Arguments]    ${cmdDeleteMassage}    ${cmdProduce}    ${produce}
    [Documentation]    ${cmdDeleteMassage} --> ลบ message
    ...    ${cmdProduce} --> คำสั่ง produce
    ...    ${produce} --> message ที่ต้องการ produce
    #เช็ค path ปัจจุบัน
    ${pwd}    SSHLibrary.Execute Command    pwd
    log    ${pwd}
    #ลบ message ก่อนหน้าออกไปก่อน
    ${stdout}    SSHLibrary.Write    ${cmdDeleteMassage}
    sleep    10
    #run คำสัง produce
    ${stdout}    SSHLibrary.Write    ${cmdProduce}    loglevel=DEBUG
    sleep    10
    #ใส่ข้อมูล produce
    SSHLibrary.Write    ${produce}    loglevel=DEBUG
    log    ${produce}

ConnectMongoDB
    [Arguments]    ${DBName}
    Connect To MongoDB    mongodb://mfafApp:Ais%402023@10.138.38.233:25000,10.138.38.234:25000,10.138.38.235:25000/?authSource=${DBName}&replicaSet=replSet01

VerifyDataConsume
    [Arguments]    ${Data_Actual}    ${Data_Expect}
    [Documentation]    ${Data_Actual} | ${Data_Expect}
    ...
    ...
    ...
    ...    ${Data_Expect} = Expect
    BuiltIn.Should Be Equal    ${Data_Actual}    ${Data_Expect}    #ตอนนี้มันมี ESC ติดมา ไปหาวิธีเอา ESC ออกแล้วค่อยกลับมาใช้
    Comment    BuiltIn.Should Contain    ${Data_Actual}    ${Data_Expect}

VerifyMongoDB
    [Arguments]    ${Data_Actual}    ${Data_Expect}
    [Documentation]    ${Data_Actual} | ${Data_Expect}ฃ
    ...
    ...
    ...
    ...    ${Data_Expect} = Expect
    ${Data_Expect}    BuiltIn.Evaluate    ${Data_Expect}
    BuiltIn.Should Be Equal    ${Data_Actual}    ${Data_Expect}

Connect CRT
    [Arguments]    ${HostURL}
    SSHLibrary.Open Connection    ${HostURL}    timeout=1 hour
    SSHLibrary.Login    serveradm    R3dh@t!@#
    Enable SSH Logging    test.log

Connect CRT Log
    [Arguments]    ${HostURL}
    SSHLibrary.Open Connection    ${HostURL}    timeout=1 hour
    SSHLibrary.Login    serveradm    otsohkmv'
