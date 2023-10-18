*** Variables ***
#Common
${NameCmdFileLog_5GModeResourceActivation}    deb-5g-mode-resource-activation-5755f48758-9h9qv_MFAF_
${PathLogNSB}     /LOCAL-NAS/livingnetwork/deb/deb-5g-mode-resource-activation/logs/log
${CmdDeleteMassage_qa.5GModeActivated}    /app/kafka/kafka_2.13-3.2.3/bin/kafka-delete-records.sh --bootstrap-server DMYAISNEB-0003:9093 --command-config /app/kafka/kafka_2.13-3.2.3/config/admin-sasl.properties --offset-json-file /home/serveradm/delete-qa.5GModeActivated.json
${Consume_qa.5GModeActivated}    /app/kafka/kafka_2.13-3.2.3/bin/kafka-console-producer.sh --bootstrap-server DMYAISNSB-0002:9093 --producer.config /app/kafka/kafka_2.13-3.2.3/config/admin-sasl.properties --topic mfaf.5GModeActivated --from-beginning
${CmdProduce_qa.5GModeActivated}    /app/kafka/kafka_2.13-3.2.3/bin/kafka-console-producer.sh --bootstrap-server DMYAISNSB-0002:9093 --producer.config /app/kafka/kafka_2.13-3.2.3/config/admin-sasl.properties --topic mfaf.5GModeActivated

${DataBaseNameNEB_QA}    mfaf_neb
${msisdn}           {"msisdn" : "66843230000"}
#TST_F10_1_1_000
${msisdn_TST_F10_1_1_000}    {"msisdn" : "66843230000"}
${DataProduce_TST_F10_1_1_000}    {"header":{"version":"1.0","timestamp":"2023-05-04T14:51:06.157Z","orgService":"CustomerOrderValidation","tid":"32459837450987.12394870934","lastTid":"32459837450987.12394870934","session":"234709834750982345","transaction":"3456987612389746","communication":"unicast","groupTags":[],"identity":{"device":"324897098709872103948709"},"tmfSpec":"TMF679","baseApiVersion":"4.0.0","schemaVersion":"1.0.0"},"body":{"msisdn":"66843230000","resultCode":"20000","resultDesc":"Success","developerMessage":"Success","modeName":"boost_mode"}}

#TST_F10_1_1_001
${msisdn_TST_F10_1_1_001}    {"msisdn" : "66843230001"}
${DataProduce_TST_F10_1_1_001}    {"header":{"version":"1.0","timestamp":"2023-05-04T14:51:06.157Z","orgService":"CustomerOrderValidation","tid":"32459837450987.12394870934","lastTid":"32459837450987.12394870934","session":"234709834750982345","transaction":"3456987612389746","communication":"unicast","groupTags":[],"identity":{"device":"324897098709872103948709"},"tmfSpec":"TMF679","baseApiVersion":"4.0.0","schemaVersion":"1.0.0"},"body":{"msisdn":"66843230001","resultCode":"20000","resultDesc":"Success","developerMessage":"Success","modeName":"game_mode"}}

#TST_F10_1_1_002
@{msisdn_TST_F10_1_1_002}    {"msisdn" : "66843230002"}
${JsonInsertCellUserLocation_TST_F10_1_1_002}    {"msisdn" : "66843230002","dateTime" : "20230324155000","geometry" : {"type" : "Point","coordinates" : [100.565713,13.7489660000001]},"imei" : "IMEI","imsi" : "IMSI","properties" : {"LAC" : 10011.0,"CI" : "37471","STATION_TYPE" : "Macro","SYSTEM_TYPE" : "3G","LATITUDE_WGS84" : "13.748966","LONGITUDE_WGS84" : "100.565713","CGI" : "520151001137471","CGI_HEX" : "52003092BA9135R"},"5GMode" : false}
${JsonInsertCellResourceInventory_TST_F10_1_1_002}    {"cellId" : "52003092BA9135R","capacity" : 5,"current5GModeEnabler" : 1}
${DataProduce_TST_F10_1_1_002}    {"key": "Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId": "ios-20230327111117974MRPusL4Tsc","command": "mfaf.5GModeActivated","value": {"invokeId": "ios-20230326170246006vUoCVQc4dD", "headerBody": {"msisdn": "66843230002","transactionId": "TST_F10_1_1_002_transactionId"},"dataBody": {"resultCode": "20000","resultDesc": "Success", "developerMessage": "Success","modeName": "max_mode"}}}

#TST_F10_1_1_003
@{msisdn_TST_F10_1_1_003}    {"msisdn" : "66843230003"}
${JsonInsertCellUserLocation_TST_F10_1_1_003}    {"msisdn" : "66843230003","dateTime" : "20230324155000","geometry" : {"type" : "Point","coordinates" : [100.565713,13.7489660000001]},"imei" : "IMEI","imsi" : "IMSI","properties" : {"LAC" : 10011.0,"CI" : "37471","STATION_TYPE" : "Macro","SYSTEM_TYPE" : "3G","LATITUDE_WGS84" : "13.748966","LONGITUDE_WGS84" : "100.565713","CGI" : "520151001137471","CGI_HEX" : "52003092BA9405k"},"5GMode" : true,}
${JsonInsertCellResourceInventory_TST_F10_1_1_003}    {"cellId" : "52003092BA9405k","capacity" : 5,"current5GModeEnabler" : 1}
${DataProduce_TST_F10_1_1_003}    {"key": "Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId": "ios-20230327111117974MRPusL4Tsc","command": "mfaf.5GModeActivated","value": {"invokeId": "ios-20230326170246006vUoCVQc4dD", "headerBody": {"msisdn": "66843230003","transactionId": "TST_F10_1_1_003_transactionId"},"dataBody": {"resultCode": "20000","resultDesc": "Success", "developerMessage": "Success","modeName": "eco_mode"}}}
#TST_F10_1_1_004
@{msisdn_TST_F10_1_1_004}    {"msisdn" : "66843230004"}
${JsonInsertCellUserLocation_TST_F10_1_1_004}    {"msisdn" : "66843230004","dateTime" : "20230324155000","geometry" : {"type" : "Point","coordinates" : [100.565713,13.7489660000001]},"imei" : "IMEI","imsi" : "IMSI","properties" : {"LAC" : 10011.0,"CI" : "37471","STATION_TYPE" : "Macro","SYSTEM_TYPE" : "3G","LATITUDE_WGS84" : "13.748966","LONGITUDE_WGS84" : "100.565713","CGI" : "520151001137471","CGI_HEX" : "522337R8EBA9405k"},"5GMode" : false,}
${JsonInsertCellResourceInventory_TST_F10_1_1_004}    {"cellId" : "522337R8EBA9405k","capacity" : 5,"current5GModeEnabler" : 1}
${DataProduce_TST_F10_1_1_004}    {"key": "Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId": "ios-20230327111117974MRPusL4Tsc","command": "mfaf.5GModeActivated","value": {"invokeId": "ios-20230326170246006vUoCVQc4dD", "headerBody": {"msisdn": "66843230004","transactionId": "TST_F10_1_1_004_transactionId"},"dataBody": {"resultCode": "20000","resultDesc": "Success", "developerMessage": "Success","modeName": "eco_mode"}}}
#TST_F10_1_1_005
@{msisdn_TST_F10_1_1_005}    {"msisdn" : "66843230005"}
${JsonInsertCellUserLocation_TST_F10_1_1_005}    {"msisdn" : "66843230005","dateTime" : "20230324155000","geometry" : {"type" : "Point","coordinates" : [100.565713,13.7489660000001]},"imei" : "IMEI","imsi" : "IMSI","properties" : {"LAC" : 10011.0,"CI" : "37471","STATION_TYPE" : "Macro","SYSTEM_TYPE" : "3G","LATITUDE_WGS84" : "13.748966","LONGITUDE_WGS84" : "100.565713","CGI" : "520151001137471","CGI_HEX" : "520037R8EBA9405k"},"5GMode" : true,}
${JsonInsertCellResourceInventory_TST_F10_1_1_005}    {"cellId" : "520037R8EBA9405k","capacity" : 5,"current5GModeEnabler" : 1}
${DataProduce_TST_F10_1_1_005}    {"key": "Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId": "ios-20230327111117974MRPusL4Tsc","command": "mfaf.5GModeActivated","value": {"invokeId": "ios-20230326170246006vUoCVQc4dD", "headerBody": {"msisdn": "66843230005","transactionId": "TST_F10_1_1_005_transactionId"},"dataBody": {"resultCode": "20000","resultDesc": "Success", "developerMessage": "Success","modeName": "boost_mode"}}}
#TST_F10_1_1_006
@{msisdn_TST_F10_1_1_006}    {"msisdn" : "66843230006"}
${JsonInsertCellUserLocation_TST_F10_1_1_006}    {"msisdn" : "66843230006","dateTime" : "20230324155000","geometry" : {"type" : "Point","coordinates" : [100.565713,13.7489660000001]},"imei" : "IMEI","imsi" : "IMSI","properties" : {"LAC" : 10011.0,"CI" : "37471","STATION_TYPE" : "Macro","SYSTEM_TYPE" : "3G","LATITUDE_WGS84" : "13.748966","LONGITUDE_WGS84" : "100.565713","CGI" : "520151001137471","CGI_HEX" : "52003092BA91R06"},"5GMode" : false,}
${JsonInsertCellResourceInventory_TST_F10_1_1_006}    {"cellId" : "52003092BA91R06","capacity" : 5,"current5GModeEnabler" : 1}
${DataProduce_TST_F10_1_1_006}    {"key": "Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId": "ios-20230327111117974MRPusL4Tsc","command": "mfaf.5GModeActivated","value": {"invokeId": "ios-20230326170246006vUoCVQc4dD", "headerBody": {"msisdn": "66843230006","transactionId": "TST_F10_1_1_006_transactionId"},"dataBody": {"resultCode": "20000","resultDesc": "Success", "developerMessage": "Success","modeName": "boost_mode"}}}
#TST_F10_1_1_007
@{msisdn_TST_F10_1_1_007}    {"msisdn" : "66843230007"}
${JsonInsertCellUserLocation_TST_F10_1_1_007}    {"msisdn" : "66843230007","dateTime" : "20230324155000","geometry" : {"type" : "Point","coordinates" : [100.565713,13.7489660000001]},"imei" : "IMEI","imsi" : "IMSI","properties" : {"LAC" : 10011.0,"CI" : "37471","STATION_TYPE" : "Macro","SYSTEM_TYPE" : "3G","LATITUDE_WGS84" : "13.748966","LONGITUDE_WGS84" : "100.565713","CGI" : "520151001137471","CGI_HEX" : "52003092BA91R07"},"5GMode" : true,}
${JsonInsertCellResourceInventory_TST_F10_1_1_007}    {"cellId" : "52003092BA91R07","capacity" : 5,"current5GModeEnabler" : 1}
${DataProduce_TST_F10_1_1_007}    {"key": "Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId": "ios-20230327111117974MRPusL4Tsc","command": "mfaf.5GModeActivated","value": {"invokeId": "ios-20230326170246006vUoCVQc4dD", "headerBody": {"msisdn": "66843230007","transactionId": "TST_F10_1_1_007_transactionId"},"dataBody": {"resultCode": "20000","resultDesc": "Success", "developerMessage": "Success","modeName": "game_mode"}}}
#TST_F10_1_1_008
@{msisdn_TST_F10_1_1_008}    {"msisdn" : "66843230008"}
${JsonInsertCellUserLocation_TST_F10_1_1_008}    {"msisdn" : "66843230008","dateTime" : "20230324155000","geometry" : {"type" : "Point","coordinates" : [100.565713,13.7489660000001]},"imei" : "IMEI","imsi" : "IMSI","properties" : {"LAC" : 10011.0,"CI" : "37471","STATION_TYPE" : "Macro","SYSTEM_TYPE" : "3G","LATITUDE_WGS84" : "13.748966","LONGITUDE_WGS84" : "100.565713","CGI" : "520151001137471","CGI_HEX" : "52003092BA91R08"},"5GMode" : false,}
${JsonInsertCellResourceInventory_TST_F10_1_1_008}    {"cellId" : "52003092BA91R08","capacity" : 5,"current5GModeEnabler" : 1}
${DataProduce_TST_F10_1_1_008}    {"key": "Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId": "ios-20230327111117974MRPusL4Tsc","command": "mfaf.5GModeActivated","value": {"invokeId": "ios-20230326170246006vUoCVQc4dD", "headerBody": {"msisdn": "66843230008","transactionId": "TST_F10_1_1_008_transactionId"},"dataBody": {"resultCode": "20000","resultDesc": "Success", "developerMessage": "Success","modeName": "game_mode"}}}
#TST_F10_1_1_009
@{msisdn_TST_F10_1_1_009}    {"msisdn" : "66843230008"}
${DataProduce_TST_F10_1_1_009}    {"key": "Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId": "ios-20230327111117974MRPusL4Tsc","command": "mfaf.5GModeActivated","value": {"invokeId": "ios-20230326170246006vUoCVQc4dD", "headerBody": {"msisdn": "66843230008","transactionId": "TST_F10_1_1_009_transactionId"},"dataBody": {"resultCode": "20000","resultDesc": "Success", "developerMessage": "Success","modeName": " "}}}
#TST_F10_1_1_010
@{msisdn_TST_F10_1_1_010}    {"msisdn" : "66843230008"}
${DataProduce_TST_F10_1_1_010}    {"key": "Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId": "ios-20230327111117974MRPusL4Tsc","command": "mfaf.5GModeActivated","value": {"invokeId": "ios-20230326170246006vUoCVQc4dD", "headerBody": {"msisdn": "66843230008","transactionId": "TST_F10_1_1_010_transactionId"},"dataBody": {"resultCode": "20000","resultDesc": "Success", "developerMessage": "Success","modeName": "game"}}}
#TST_F10_1_1_011
@{msisdn_TST_F10_1_1_011}    {"msisdn" : "66843230008"}
${DataProduce_TST_F10_1_1_011}    {"key": "Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId": "ios-20230327111117974MRPusL4Tsc","command": "mfaf.5GModeActivated","value": {"invokeId": "ios-20230326170246006vUoCVQc4dD", "headerBody": {"msisdn": "66843230008","transactionId": "TST_F10_1_1_011_transactionId"},"dataBody": {"resultCode": "20000","resultDesc": "Success", "developerMessage": "Success"}}}
#TST_F10_1_1_012
@{msisdn_TST_F10_1_1_012}    {"msisdn" : "66843230012"}
${JsonInsertCellUserLocation_TST_F10_1_1_012}    {"msisdn" : "66843230012","dateTime" : "20230324155000","geometry" : {"type" : "Point","coordinates" : [100.565713, 13.7489660000001]},"imei" : "IMEI","imsi" : "IMSI","properties" : {"LAC" : 10011,"CI" : "37471","STATION_TYPE" : "Macro","SYSTEM_TYPE" : "3G","LATITUDE_WGS84" : "13.748966","LONGITUDE_WGS84" : "100.565713","CGI" : "520151001137471","CGI_HEX" : "52003092BA91R12"}}
${JsonInsertCellResourceInventory_TST_F10_1_1_012}    {"cellId" : "52003092BA91R12","capacity" : 5,"current5GModeEnabler" : 1}
${DataProduce_TST_F10_1_1_012}    {"key": "Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId": "ios-20230327111117974MRPusL4Tsc","command": "mfaf.5GModeActivated","value": {"invokeId": "ios-20230326170246006vUoCVQc4dD", "headerBody": {"msisdn": "66843230012","transactionId": "TST_F10_1_1_012_transactionId"},"dataBody": {"resultCode": "20000","resultDesc": "Success", "developerMessage": "Success","modeName": "game_mode"}}}
#TST_F10_1_1_013
@{msisdn_TST_F10_1_1_013}    {"msisdn" : "666843230013"}
${JsonInsertCellUserLocation_TST_F10_1_1_013}    {"msisdn" : "666843230013","dateTime" : "20230324155000","geometry" : {"type" : "Point","coordinates" : [100.565713,13.7489660000001]},"imei" : "IMEI","imsi" : "IMSI","properties" : {"LAC" : 10011.0,"CI" : "37471","STATION_TYPE" : "Macro","SYSTEM_TYPE" : "3G","LATITUDE_WGS84" : "13.748966","LONGITUDE_WGS84" : "100.565713","CGI" : "520151001137471","CGI_HEX" : "52003092BA91R13"},"5GMode" : true}
${DataProduce_TST_F10_1_1_013}    {"key": "Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId": "ios-20230327111117974MRPusL4Tsc","command": "mfaf.5GModeActivated","value": {"invokeId": "ios-20230326170246006vUoCVQc4dD", "headerBody": {"msisdn": "66843230104","transactionId": "TST_F10_0_1_004_transactionId"},"dataBody": {"resultCode": "20000","resultDesc": "Success", "developerMessage": "Success","modeName": "game_mode"}}}
#TST_F10_1_1_014
@{msisdn_TST_F10_1_1_014}    {"msisdn" : "666843230014"}
${JsonInsertCellUserLocation_TST_F10_1_1_014}    {"msisdn" : "666843230014","dateTime" : "20230324155000","geometry" : {"type" : "Point","coordinates" : [100.565713,13.7489660000001]},"imei" : "IMEI","imsi" : "IMSI","5GMode" : true}
${DataProduce_TST_F10_1_1_014}    {"key": "Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId": "ios-20230327111117974MRPusL4Tsc","command": "mfaf.5GModeActivated","value": {"invokeId": "ios-20230326170246006vUoCVQc4dD", "headerBody": {"msisdn": "666843230014","transactionId": "TST_F10_1_1_014_transactionId"},"dataBody": {"resultCode": "20000","resultDesc": "Success", "developerMessage": "Success","modeName": "game_mode"}}}
#TST_F10_1_1_000
@{msisdn_TST_F10_1_1_000}    {"msisdn" : "66843230000"}
${JsonInsert_TST_F10_1_1_000}    {"msisdn" : "66843230000","dateTime" : "20230324155000","geometry" : {"type" : "Point","coordinates" :[ 100.565713, 13.7489660000001]},"imei" : "IMEI","imsi" : "IMSI","properties" : {"LAC" : 10011.0,"CI" : "37471","STATION_TYPE" : "Macro","SYSTEM_TYPE" : "3G","LATITUDE_WGS84" : "13.748966","LONGITUDE_WGS84" : "100.565713","CGI" : "520151001137471","CGI_HEX" : "52003092BB313AR"},"5GMode" : false,"5GModeStartTime" : ISODate("2023-05-30T03:55:37.412Z")}
${DataProduce_TST_F10_1_1_000}    {"key": "Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId": "ios-20230327111117974MRPusL4Tsc","command": "mfaf.5GModeActivated","value": {"invokeId": "ios-20230326170246006vUoCVQc4dD", "headerBody": {"msisdn": "66843230000","transactionId": "TST_F10_1_1_000_transactionId"},"dataBody": {"resultCode": "20000","resultDesc": "Success", "developerMessage": "Success","modeName": "eco_mode"}}}


#TST_F10_0_1_000
@{msisdn_TST_F10_0_1_000}    {"msisdn" : "66843230100"}
${DataProduce_TST_F10_0_1_000}    {"key": "Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId": "ios-20230327111117974MRPusL4Tsc","command": "mfaf.5GModeActivated","value": {"invokeId": "ios-20230326170246006vUoCVQc4dD", "headerBody": {"msisdn": "66843230100","transactionId": "TST_F10_0_1_000_transactionId"},"dataBody": {"resultCode": "20000","resultDesc": "Success", "developerMessage": "Success","modeName": "game_mode"}}}


#TST_F10_0_1_001
@{msisdn_TST_F10_0_1_001}    {"msisdn" : "66843230100"}
${DataProduce_TST_F10_0_1_001}    {"key": "Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId": "ios-20230327111117974MRPusL4Tsc","command": "mfaf.5GModeActivated","value": {"invokeId": "ios-20230326170246006vUoCVQc4dD", "headerBody": {"msisdn": " ","transactionId": "TST_F10_0_1_001_transactionId"},"dataBody": {"resultCode": "20000","resultDesc": "Success", "developerMessage": "Success","modeName": "boost_mode"}}}

#TST_F10_0_1_002
@{msisdn_TST_F10_0_1_002}    {"msisdn" : "66836077991"}
${DataProduce_TST_F10_0_1_002}    {"key": "Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId": "ios-20230327111117974MRPusL4Tsc","command": "mfaf.5GModeActivated","value": {"invokeId": "ios-20230326170246006vUoCVQc4dD", "headerBody": {"msisdn": "66836077991","transactionId": "$transaction"},"dataBody": {"resultCode": "20000","resultDesc": "Success", "developerMessage": "Success","modeName": "boost_mode"}}}


#TST_F10_0_1_003
@{msisdn_TST_F10_0_1_003}    {"msisdn" : "66836077991"}
${DataProduce_TST_F10_0_1_003}    {"key": "Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId": "ios-20230327111117974MRPusL4Tsc","command": "mfaf.5GModeActivated","value": {"invokeId": "ios-20230326170246006vUoCVQc4dD", "headerBody": {"msisdn": "66836077991","transactionId": "$transaction"},"dataBody": {"resultCode": "20000","resultDesc": "Success", "developerMessage": "Success","modeName": "boost_mode"}}}


#TST_F10_0_1_004
@{msisdn_TST_F10_0_1_004}    {"msisdn" : "66836077991"}
${DataProduce_TST_F10_0_1_004}    {"key": "Io7gE8Pkgup64lxy66ulNly+7hxeIpExpUQP0TN86Dc49kOUwt+iD6wrr6aD1ZHX","invokeId": "ios-20230327111117974MRPusL4Tsc","command": "mfaf.5GModeActivated","value": {"invokeId": "ios-20230326170246006vUoCVQc4dD", "headerBody": {"transactionId": "TST_F10_0_1_004_transactionId"},"dataBody": {"resultCode": "20000","resultDesc": "Success", "developerMessage": "Success","modeName": "boost_mode"}}}
