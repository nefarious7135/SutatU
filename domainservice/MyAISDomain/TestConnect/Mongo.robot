*** Settings ***
Library           RobotMongoDBLibrary.Insert
Library           RobotMongoDBLibrary.Update
Library           RobotMongoDBLibrary.Find
Library           RobotMongoDBLibrary.Delete
Library           pymongo
Library           BuiltIn
Library           MongoDBLibrary
Library           JSONLibrary
Library           String
Library           SSHLibrary
Resource          ../LivingNetWork/Keyword/Common.robot
Resource          ../LivingNetWork/Keyword/MongoDB.robot
Resource          ../LivingNetWork/Keyword/SecureCRT.robot
*** Variables ***
# CONNECT WITH PARAMS
# &{MONGODB_CONNECT_STRING} \ \ \ host=127.0.0.1,10.138.38.234:25000,10.138.38.233:25000 \ \ \ port=27017 \ \ username=admin \ \ password=password \ \ \ database=robotdb \ \ \ \ collection=customer
# CONNECT WITH CONNECTION STRING CLUSTER
&{MONGODB_CONNECT_STRING}    connection=mongodb://mfafApp:Ais%402023@10.138.38.233:25000,10.138.38.234:25000,10.138.38.235:25000/?authSource=mfaf_neb&replicaSet=replSet01    database=mfaf_neb    collection=cellUserLocation
${JSONINSERT}     {"msisdn" : "66836077444","dateTime" : "20230216155001", "geometry" : { "type" : "Point", "coordinates" : [100.539715,13.7758630000001]},"imei" : "","imsi" : "","properties" : {"LAC" : 1020,"CI" : "10060","STATION_TYPE" : "Macro","SYSTEM_TYPE" : "2G","LATITUDE_WGS84" : "13.775863","LONGITUDE_WGS84" : "100.539715","CGI" : "520010102010060","CGI_HEX" : "5200103FC274C"}}

*** Test Cases ***
Test insert data into mongodb
    Comment    ${QueryJSON}    Set Variable    ${JSONINSERT}
    &{DATA}    Create Dictionary    msisdn=66836077444    dateTime=20230216155001    geometry={type="Point",coordinates="[100.539715,13.7758630000001]"}    imei=    imsi=
    ${MSG}    Insert One    ${MONGODB_CONNECT_STRING}    ${DATA}
    Should Be Equal    ${MSG}    INSERTED SUCCESS
    Retrieve And Update One Mongodb Record

Test find by fillter data from mongodb
    &{FILLTER}    Create Dictionary    msisdn=66836077444
    ${RESULTS}    Find    ${MONGODB_CONNECT_STRING}    ${FILLTER}
    BuiltIn.Log Many    ${RESULTS}
    FOR    ${RESULT}    IN    @{RESULTS}
        ${ID}    BuiltIn.Get Variable Value    ${RESULT["_id"]}
        IF    '${RESULT["_id"]}'!=""
        ${RESULT}    BuiltIn.Set Global Variable    ${RESULT}
        ${ID}    BuiltIn.Set Global Variable    ${ID}
        END
        ${count}    BuiltIn.Set Global Variable    +1
    END

Test update data phone into mongodb by ID
    &{NEWDATA} Create Dictionary phone=0649359xxx
    ${MSG} Update ${MONGODB_CONNECT_STRING} X100001 ${NEWDATA}
    Should Be Equal ${MSG} UPDATED SUCCESS

Test find data by ID from mongodb
    ${QueryJSON} Set Variable 641d2c7ef3b03ffd2da359ba
    ${RESULTS} Find One By ID ${MONGODB_CONNECT_STRING} ${QueryJSON}
    Log ${MONGODB_CONNECT_STRING}
    Log ${RESULTS}

Test delete data by ID into mongodb
    ${MSG}    DeleteOneByID    ${MONGODB_CONNECT_STRING}    6433d2f0b5a2b82101e8ad13
    Should Be Equal    ${MSG}    DELETED SUCCESS

Test Connect DB
    Connect To MongoDB    mongodb://mfafApp:Ais%402023@10.138.38.233:25000,10.138.38.234:25000,10.138.38.235:25000/?authSource=mfaf_neb&replicaSet=replSet01
    Comment    @{allCollections}    Get MongoDB Collections    mfaf_neb
    Comment    Log Many    @{allCollections}
    ${misidn_query}    Retrieve Some Mongodb Records    mfaf_neb    cellUserLocation    {"msisdn" : "66935311000"}
    Log Many    ${misidn_query}
    Comment    ${count}=    BuiltIn.Get Count    ${misidn_query}    ${misidn_query}
    Comment    FOR    ${count}    IN    ${misidn_query}
    ${_id}    Retrieve MongoDB Records With Desired Fields    mfaf_neb    cellUserLocation    {"msisdn" : "66935311000"}    _id    True    True

Test mongo
    Connect To MongoDB    mongodb://mfafApp:Ais%402023@10.138.38.233:25000,10.138.38.234:25000,10.138.38.235:25000/?authSource=mfaf_nsb&replicaSet=replSet01
    @{allCollections}    Get MongoDB Collections    mfaf_nsb
    Log Many    @{allCollections}
    ${misidn_query}    Retrieve Some Mongodb Records    mfaf_nsb    livingNetworkMSISDN    {"msisdn" : "66860773622"}
    log    ${misidn_query}
    ${msisdn_save}    Save Mongodb Records    mfaf_nsb    livingNetworkMSISDN    {"msisdn":"66860773622","package":{"currentPackage":"O2103P210305313","productSequenceId":"0002480109997","freeUnitExpireTime":"20230401000000+0800"},"5GMode":{"changeModePerday":{"count":4,"currentDate":"20230331"},"currentMode":{"modeName":"max_mode","expireDate":"20991231:235959"},"lastDefaultMode":"max_mode"}}
    log    ${msisdn_save}
    ${delete}    Remove Mongodb Records    mfaf_nsb    livingNetworkMSISDN    {"msisdn":"66860773622","package":{"currentPackage":"O2103P210305313","productSequenceId":"0002480109997","freeUnitExpireTime":"20230401000000+0800"},"5GMode":{"changeModePerday":{"count":4,"currentDate":"20230331"},"currentMode":{"modeName":"max_mode","expireDate":"20991231:235959"},"lastDefaultMode":"max_mode"}}
    ${misidn}    Retrieve Some Mongodb Records    mfaf_nsb    livingNetworkMSISDN    {"msisdn" : "66860773622"}
    # \ \ \ https://robotframework-thailand.github.io/robotframework-mongodb-library/MongoDBLibrary.html

TestUpserch
    Connect To MongoDB    mongodb://mfafApp:Ais%402023@10.138.38.233:25000,10.138.38.234:25000,10.138.38.235:25000/?authSource=mfaf_nsb&replicaSet=replSet01
    ${QueryJSON}    Set Variable    {"msisdn" : "668123400002"}
    ${UpdateJSON}    Set Variable    {"msisdn" : "668123400002","package" : {"currentPackage" : "O2103P210305313","productSequenceId" : "0002480109997","freeUnitExpireTime" : "20230331235959+0700"},"5GMode" : {"changeModePerday" : {"count" : 2,"currentDate" : "20230330"},"currentMode" : {"modeName" : "boost_mode","expireDate" : "20230330:113503"},"lastDefaultMode": "max_mode"}}
    &{allResults}    Update Many Mongodb Records    mfaf_nsb    livingNetworkMSISDN    ${QueryJSON}    ${UpdateJSON}    upsert=True
    BuiltIn.Log Many    ${allResults}

testrepalce
    ${json}    BuiltIn.Set Variable    {"key":"Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId":"ios-TST_F20_1_1_001","command":"qa.requestNetworkStatus","value":{"invokeId":"ios-TST_F20_1_1_001","headerBody":{"msisdn":"669876543210","transactionId":"123456789"},"dataBody":{"uploadSpeed":"11500000","downloadSpeed":"31000000","latency":"59","latitude":"13.7749","longitude":"100.5197","isUsingFupPackage":"true"}}}
    ${json}    Split String    ${json}    :{
    ${json}    BuiltIn.Set Variable    ${json[3]}
    ${json}    Remove String    ${json}    }
    BuiltIn.Log Many    ${json}
    ${json}    BuiltIn.Set Variable    {${json}}
    ${Data}    BuiltIn.Set Variable    {"header": {"version": "1.0", "timestamp": "xxxx", "orgService": "mfaf.requestNetworkStatus", "tid": "xxxx", "lastTid": "xxxx", "session": "xxxx", "transaction": "Test_DOS_NSB_TST_F2_1_1_001", "communication": "unicast|multicast|broadcast", "groupTags": [], "identity": {"device": "xxxxx", "public": "xxxxx", "user": "xxxxx"}, "tmfSpec": "none|TMFxxx", "baseApiVersion": "none|4.0.0|4.1.0|5.0.0", "schemaVersion": "1.0.0"}}
    ${json_str}=    Convert JSON To String    ${json}
    BuiltIn.Log Many    ${json}
    Comment    ${Value1}    Replace String    ,"body":${json}    }    ${Data}    count=1
    ${Value1}    Replace String    ${Data}    }}    },"body":${json}}    count=1
    BuiltIn.Log Many    ${Value1}
    Comment    BuiltIn.Log Many    ${Value1}
    ${json}    BuiltIn.Set Variable    ${Value1}
    BuiltIn.Log Many    ${json}

testcpfile
    SSHLibrary.Open Connection    10.137.30.65    timeout=1 hour
    SSHLibrary.Login    serveradm    otsohkmv'
    ${pwd}    SSHLibrary.Execute Command    pwd
    log    ${pwd}
    BuiltIn.Sleep    2
    ${stdout}    SSHLibrary.Execute Command    cd /app/mfaf/network-event-bus/files/FileF1
    log    ${stdout}
    ${filename}    SSHLibrary.Execute Command    find /app/mfaf/network-event-bus/files/FileF1/LM_CELL_BKK.geojson
    log    ${filename}
    SSHLibrary.Execute Command    cp /app/mfaf/network-event-bus/files/FileF1/LM_CELL_BKK.geojson /app/mfaf/network-event-bus/files/process/LM

testrepalcejson
    ${Header}    UpdateHeaderJson    D:\\HeaderJson    Header.json    mfaf.requestNetworkStatus    TST_F2_1_1_001    Test_DOS_NSB_TST_F2_1_1_001
    BuiltIn.Log    ${Header}
    ${jsonProduceHeader}    UpdateHeaderDataProduce    {"accessToken":"02eyJhbGciOiJIUzI1NiJ9.eyJtb2JpbGVObyI6IjA5MTAwMzEzNDYiLCJuZXR3b3JrVHlwZSI6Ik1BU1MiLCJ0aW1lc3RhbXAiOiIyMDIzLTAzLTE1VDE0OjEwOjE0KzA3OjAwIn0.jTwLjjC9p0t9IbVC5w3nI8R7WBahJuVC_J2BrKEypJ0","msisdn":"66896800885","networkType":"CPE","effectiveOption":"I","packages":[{"code":"P200128060","name":"Boost_Mode_Free_0_Baht"}]}    ${Header}
    BuiltIn.Log    ${jsonProduceHeader}
