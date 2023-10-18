*** Variables ***
${NameCommandFileLog}    CSLIVINGNWA001_neb-user-cell-movement_
${NameCommandFileLogUser}    CSLIVINGNWA001_neb-cell-user-location_
${PathLogNEB_Log}    /app/mfaf/network-event-bus/logs/log
${CmdConsume_qa.cellUserLocation}    /app/kafka/kafka_2.13-3.2.3/bin/kafka-console-consumer.sh --bootstrap-server DMYAISNEB-0001:9093,DMYAISNEB-0002:9093,DMYAISNEB-0003:9093 --consumer.config /app/kafka/kafka_2.13-3.2.3/config/admin-sasl.properties --topic qa.cellUserLocation
${CmdDeleteMassage_qa.controlUserPlaneNetworkEvent}    /app/kafka/kafka_2.13-3.2.3/bin/kafka-delete-records.sh \ --bootstrap-server DMYAISNSB-0001:9093,DMYAISNSB-0002:9093,DMYAISNSB-0003:9093 \ --command-config /app/kafka/kafka_2.13-3.2.3/config/admin-sasl.properties --offset-json-file /home/serveradm/delete-qa.controlUserPlaneNetworkEvent.json
${CmdProduce_qa.cellUserLocation}    /app/kafka/kafka_2.13-3.2.3/bin/kafka-console-producer.sh --bootstrap-server DMYAISNEB-0001:9093,DMYAISNEB-0002:9093,DMYAISNEB-0003:9093 --producer.config /app/kafka/kafka_2.13-3.2.3/config/admin-sasl.properties --topic qa.cellUserLocation
${CmdDeleteMassage_qa.cellUserLocation}    /app/kafka/kafka_2.13-3.2.3/bin/kafka-delete-records.sh \ --bootstrap-server DMYAISNSB-0001:9093,DMYAISNSB-0002:9093,DMYAISNSB-0003:9093 \ --command-config /app/kafka/kafka_2.13-3.2.3/config/admin-sasl.properties --offset-json-file /home/serveradm/delete-qa.cellUserLocation.json
##DataProduce_cellUserLocation##

${DataProduceUser_TST_F4_1_1_000}    {"invokeId": "TST_F4_1_1_000","dateTime":"20230324142800","msisdn":"66909411000","cgiHex":"5200411F0A0A0","imsi":"IMSI","imei":"IMEI","cgiHexPrev":"5200411FC000C","5GMode":true}
${DataProduceUser_TST_F4_1_1_001}    {"invokeId": "TST_F4_1_1_001","dateTime":"20230324160200","msisdn":"66909411001","cgiHex":"5200411F0A0A1","imsi":"IMSI","imei":"IMEI","cgiHexPrev":"5200411FC001C","5GMode":true}
${DataProduceUser_TST_F4_1_1_002}    {"invokeId": "TST_F4_1_1_002","dateTime":"20230324172400","msisdn":"66909411002","cgiHex":"5200411F0A0A2","imsi":"IMSI","imei":"IMEI","cgiHexPrev":"5200411FC002C","5GMode":true}
${DataProduceUser_TST_F4_1_1_003}    {"invokeId": "TST_F4_1_1_003","dateTime":"20230324194900","msisdn":"66909411003","cgiHex":"5200411F0A0A3","imsi":"IMSI","imei":"IMEI","cgiHexPrev":"5200411FC003C","5GMode":true}
${DataProduceUser_TST_F4_1_1_004}    {"invokeId": "TST_F4_1_1_004","dateTime":"20230324201100","msisdn":"66909411004","cgiHex":"5200411F0A0A4","imsi":"IMSI","imei":"IMEI","cgiHexPrev":"5200411FC004C","5GMode":true}
${DataProduceUser_TST_F4_1_1_005}    {"invokeId": "TST_F4_1_1_005","dateTime":"20230324201200","msisdn":"66909411005","cgiHex":"5200411F0A0A5","imsi":"IMSI","imei":"IMEI","cgiHexPrev":"5200411FC005C","5GMode":false}
${DataProduceUser_TST_F4_1_1_006}    {"invokeId": "TST_F4_1_1_006","dateTime":"20230325153700","msisdn":"66909411006","cgiHex":"5200411F0A0A6","imsi":"IMSI","imei":"IMEI","cgiHexPrev":"5200411FC006C","5GMode":true}
${DataProduceUser_TST_F4_1_1_007}    {"invokeId": "TST_F4_1_1_007","dateTime":"20230325153900","msisdn":"66909411007","cgiHex":"5200411F0A0A7","imsi":"IMSI","imei":"IMEI","cgiHexPrev":"5200411FC007C","5GMode":true}
${DataProduceUser_TST_F4_1_1_008}    {"invokeId": "TST_F4_1_1_008","dateTime":"2023032515400","msisdn":"66909411008","cgiHex":"5200411F0A0A8","imsi":"IMSI","imei":"IMEI","5GMode":true}
${DataProduceUser_TST_F4_1_1_009}    {"invokeId": "TST_F4_1_1_009","dateTime":"20230324220900","msisdn":"66909411009","cgiHex":"5200411F0A0A9","imsi":"IMSI","imei":"IMEI","cgiHexPrev":"5200411FC009C"}
${DataProduceUser_TST_F4_1_1_010}    {"invokeId": "TST_F4_1_1_010","dateTime":"20230325161400","msisdn":"66909411010","cgiHex":"5200411F0A1A0","imsi":"","imei":"IMEI","cgiHexPrev":"5200411FC010C","5GMode":true}
${DataProduceUser_TST_F4_1_1_011}    {"invokeId": "TST_F4_1_1_011","dateTime":"20230325161500","msisdn":"66909411011","cgiHex":"5200411F0A1A1","imsi":"IMSI","imei":"","cgiHexPrev":"5200411FC011C","5GMode":true}
${DataProduceUser_TST_F4_1_1_012}    {"invokeId": "TST_F4_1_1_012","dateTime":"20230325162500","msisdn":"66909411012","cgiHex":"5200411F0A1A2","imsi":"IMSI","imei":"IMEI","cgiHexPrev":"","5GMode":true}
${DataProduceUser_TST_F4_1_1_013-1}    {"invokeId": "TST_F4_1_1_013-1","dateTime":"20230325181700","msisdn":"66909411013","cgiHex":"5200411FC013C","imsi":"IMSI","imei":"IMEI","cgiHexPrev":"","5GMode":true}
${DataProduceUser_TST_F4_1_1_013-2}    {"invokeId": "TST_F4_1_1_013-2","dateTime":"20230325181800","msisdn":"66909411013","cgiHex":"5200411F0A1A3","imsi":"IMSI","imei":"IMEI","cgiHexPrev":"5200411FC013C","5GMode":true}
${DataProduceUser_TST_F4_1_1_014}    {"invokeId": "TST_F4_1_1_014","dateTime":"20230325175900","msisdn":"66909411014","cgiHex":"520050187030064","imsi":"IMSI","imei":"IMEI","cgiHexPrev":"","5GMode":true}
${DataProduceUser_TST_F4_1_1_015}    {"invokeId": "TST_F4_1_1_015","dateTime":"20230325195900","msisdn":"66909411015","cgiHex":"5200411F0A1A5","imsi1":"IMSI","immei":"IMEI","cgiHexPrev":"","5GMode":true}
${DataProduceUser_TST_F4_1_1_016}    {"invokeId": "TST_F4_1_1_016","dateTime":"20230325203500","msisdn":"66909411016","cgiHex":"5200411F0A1A6","imsi":"IMSI","immei":"IMEI","cgiHexPrev":"","5GMode":true}
${DataProduceUser_TST_F4_1_1_017}    {"invokeId": "TST_F4_1_1_017","dateTime":"20230325204600","msisdn":"66909411017","cgiHex":"5200411F0A1A7","imsi":"IMSI","imei":"IMEI","cgiHexPrevz":"5200411FC017C","5GMode":true}
${DataProduceUser_TST_F4_1_1_018}    {"invokeId": "TST_F4_1_1_018","dateTime":"20230325211500","msisdn":"66909411018","cgiHex":"5200411F0A1A8","imsi":"IMSI","imei":"IMEI","cgiHexPrev":"","4GMode":true}
${DataProduceUser_TST_F4_0_1_000}    {"invokeId": "TST_F4_0_1_000","dateTime":"20230324204300","msisdn":"66909401000","cgiHex":"5200401F0A0A0","imsi":"IMSI","imei":"IMEI","cgiHexPrev":"5200401FC000C","5GMode":}
${DataProduceUser_TST_F4_0_1_001}    "invokeId": "TST_F4_0_1_001","dateTime":"20230325183000","msisdn":"66909401001","cgiHex":"5200401F0A0A1","imsi":"IMSI","imei":"IMEI","cgiHexPrev":"5200401FC001C","5GMode":true}
${DataProduceUser_TST_F4_0_1_002}    {"invokeId": "TST_F4_0_1_002","dateTime":"20230325183500","msisdn":"66909401002","cgiHex":"5200401F0A0A2","imsi":"IMSI","imei":"IMEI","cgiHexPrev":"5200401FC002C","5GMode":true
${DataProduceUser_TST_F4_0_1_003}    {"invokeId": "TST_F4_0_1_003","dateTime":"20230325183700","msisdn":"66909401003",cgiHex:"5200401F0A0A3","imsi":"IMSI","imei":"IMEI","cgiHexPrev":"5200401FC003C","5GMode":true}
${DataProduceUser_TST_F4_0_1_004}    {"invokeId": "TST_F4_0_1_004","dateTime":"20230325183900","msisdn":"66909401004","cgiHex":"5200401F0A0A4","imsi":"IMSI","imei":"IMEI","cgiHexPrev""5200401FC004C","5GMode":true}
${DataProduceUser_TST_F4_0_1_005}    {"invokeId": "TST_F4_0_1_005","dateTime":"20230325184500","msisdn":"66909401005","cgiHex":"5200401F0A0A5""imsi":"IMSI","imei":"IMEI","cgiHexPrev":"5200401FC005C","5GMode":true}
${DataProduceUser_TST_F4_0_1_006}    {"invokeId": "TST_F4_0_1_006","msisdn":"66909401006","cgiHex":"5200401F0A0A6","imsi":"IMSI","imei":"IMEI","cgiHexPrev":"5200401FC006C","5GMode":true}
${DataProduceUser_TST_F4_0_1_007}    {"invokeId": "TST_F4_0_1_007","dateTime":"20230325153200","cgiHex":"5200401F0A0A7","imsi":"IMSI","imei":"IMEI","cgiHexPrev":"5200401FC007C","5GMode":true}
${DataProduceUser_TST_F4_0_1_008}    {"invokeId": "TST_F4_0_1_008","dateTime":"20230325153200","msisdn":"66909401008","imsi":"IMSI","imei":"IMEI","cgiHexPrev":"5200401FC008C","5GMode":true}
${DataProduceUser_TST_F4_0_1_009}    {"invokeId": "TST_F4_0_1_009","dateTime":"","msisdn":"66909401009","cgiHex":"5200401F0A0A9","imsi":"IMSI","imei":"IMEI","cgiHexPrev":"5200401FC009C","5GMode":true}
${DataProduceUser_TST_F4_0_1_010}    {"invokeId": "TST_F4_0_1_010","dateTime":"20230325161200","msisdn":"","cgiHex":"5200401F0A1A0","imsi":"IMSI","imei":"IMEI","cgiHexPrev":"5200401FC010C","5GMode":true}
${DataProduceUser_TST_F4_0_1_011}    {"invokeId": "TST_F4_0_1_011","dateTime":"20230325161300","msisdn":"66909401011","cgiHex":"","imsi":"IMSI","imei":"IMEI","cgiHexPrev":"5200401FC011C","5GMode":true}
${DataProduceUser_TST_F4_0_1_012}    {"invokeId": "TST_F4_0_1_012","dateTimee":"20230325192300","msisdn":"66909401012","cgiHex":"5200401F0A1A2","imsi":"IMSI","imei":"IMEI","cgiHexPrev":"","5GMode":true}
${DataProduceUser_TST_F4_0_1_013}    {"invokeId": "TST_F4_0_1_013","dateTime":"20230325192500","msissdn":"66909401013","cgiHex":"5200401F0A1A3","imsi":"IMSI","imei":"IMEI","cgiHexPrev":"","5GMode":true}
${DataProduceUser_TST_F4_0_1_014}    {"invokeId": "TST_F4_0_1_014","dateTime":"20230325193500","msisdn":"66909401014","cgiex":"5200401F0A1A4","imsi":"IMSI","imei":"IMEI","cgiHexPrev":"","5GMode":true}
${DataProduceUser_TST_F4_0_1_015}    {"invokeId": "TST_F4_0_1_005","dateTime":"20230325184500","msisdn":"66909401005","cgiHex":"5200401F0A0A5""imsi":"IMSI","imei":"IMEI","cgiHexPrev":"5200401FC005C","5GMode":true}






##CGI_MongoDB_CellResourceInventory##
${cellId_TST_F4_1_1_000}    {"cellId" : "5200411F0A0A0"}
${cellId_TST_F4_1_1_000_1}    {"cellId" : "5200411FC000C"}
${cellId_TST_F4_1_1_001}    {"cellId" : "5200411F0A0A1"}
${cellId_TST_F4_1_1_001_1}    {"cellId" : "5200411FC001C"}
${cellId_TST_F4_1_1_002}    {"cellId" : "5200411F0A0A2"}
${cellId_TST_F4_1_1_002_1}    {"cellId" : "5200411FC002C"}
${cellId_TST_F4_1_1_003}    {"cellId" : "5200411F0A0A3"}
${cellId_TST_F4_1_1_003_1}    {"cellId" : "5200411FC003C"}
${cellId_TST_F4_1_1_004}    {"cellId" : "5200411F0A0A4"}
${cellId_TST_F4_1_1_004_1}    {"cellId" : "5200411FC004C"}
${cellId_TST_F4_1_1_005}    {"cellId" : "5200411F0A0A5"}
${cellId_TST_F4_1_1_005_1}    {"cellId" : "5200411FC005C"}
${cellId_TST_F4_1_1_006}    {"cellId" : "5200411F0A0A6"}
${cellId_TST_F4_1_1_006_1}    {"cellId" : "5200411FC006C"}
${cellId_TST_F4_1_1_007}    {"cellId" : "5200411F0A0A7"}
${cellId_TST_F4_1_1_007_1}    {"cellId" : "5200411FC007C"}
${cellId_TST_F4_1_1_008}    {"cellId" : "5200411F0A0A8"}
${cellId_TST_F4_1_1_008_1}    {"cellId" : "5200411FC008C"}
${cellId_TST_F4_1_1_009}    {"cellId" : "5200411F0A0A9"}
${cellId_TST_F4_1_1_009_1}    {"cellId" : "5200411FC009C"}
${cellId_TST_F4_1_1_010}    {"cellId" : "5200411F0A1A0"}
${cellId_TST_F4_1_1_010_1}    {"cellId" : "5200411FC010C"}
${cellId_TST_F4_1_1_011}    {"cellId" : "5200411F0A1A1"}
${cellId_TST_F4_1_1_011_1}    {"cellId" : "5200411FC011C"}
${cellId_TST_F4_1_1_012}    {"cellId" : "5200411F0A1A2"}
${cellId_TST_F4_1_1_012_1}    {"cellId" : "5200411FC012C"}
${cellId_TST_F4_1_1_013}    {"cellId" : "5200411F0A1A3"}
${cellId_TST_F4_1_1_013_1}    {"cellId" : "5200411FC013C"}
${cellId_TST_F4_1_1_014}    {"cellId" : "520050187030064"}
${cellId_TST_F4_1_1_015}    {"cellId" : "5200411F0A1A5"}
${cellId_TST_F4_1_1_016}    {"cellId" : "5200411F0A1A6"}
${cellId_TST_F4_1_1_017}    {"cellId" : "5200411F0A1A7"}
${cellId_TST_F4_1_1_018}    {"cellId" : "5200411F0A1A8"}
${cellId_TST_F4_0_1_000}    {"cellId" : "66935301000"}
${cellId_TST_F4_0_1_001}    {"cellId" : "66935301001"}
${cellId_TST_F4_0_1_002}    {"cellId" : "66935301002"}
${cellId_TST_F4_0_1_003}    {"cellId" : "66935301003"}
${cellId_TST_F4_0_1_004}    {"cellId" : "66935301004"}
${cellId_TST_F4_0_1_005}    {"cellId" : "66935301005"}
${cellId_TST_F4_0_1_006}    {"cellId" : "66935301006"}
##DataExpected_Insert_at_MongoDB_CellMaster##

${JsonInsert_TST_F4_1_1_001}    {"cellId":"5200411F0A0A1","current5GModeEnabler":99,"currentCapacity":99}
${JsonInsert_TST_F4_1_1_002}    {"cellId":"5200411F0A0A2","current5GModeEnabler":50,"currentCapacity":50}
${JsonInsert_TST_F4_1_1_002_1}    {"cellId":"5200411FC002C","current5GModeEnabler":50,"currentCapacity":50}
${JsonInsert_TST_F4_1_1_003}    {"cellId":"5200411FC003C","current5GModeEnabler":45,"currentCapacity":45}
${JsonInsert_TST_F4_1_1_004}    {"cellId":"5200411F0A0A4","current5GModeEnabler":0,"currentCapacity":10}
${JsonInsert_TST_F4_1_1_004_1}    {"cellId":"5200411FC004C","current5GModeEnabler":0,"currentCapacity":10}
${JsonInsert_TST_F4_1_1_005}    {"cellId":"5200411F0A0A5","current5GModeEnabler":0,"currentCapacity":10}
${JsonInsert_TST_F4_1_1_005_1}    {"cellId":"5200411FC005C","current5GModeEnabler":0,"currentCapacity":10}
${JsonInsert_TST_F4_1_1_014}    {"cellId":"520050187030064","capacity":5}
${JsonInsert_TST_F4_1_1_008}    {"properties":{"LAC":7025,"CI":"18286","NAME":"Soi RAMKHAMHAENG SOI 43/1_R431MW2136","REGION":"BKK","SYSTEM":"3G2100","PROVINCE":"BANGKOK","DISTRICT":"WANG THONGLANG","SUB_DISTRICT":"PHLAPPHLA","SITE_NAME":"Soi RAMKHAMHAENG SOI 43/1","STATION_TYPE":"Macro","SYSTEM_TYPE":"3G","LATITUDE_WGS84":"13.765010","LONGITUDE_WGS84":"100.616490","RADIUS":null,"PERCENT_UTILIZATION_AVG":25.9671,"PERCENT_UTILIZATION_PEAK":32.7253,"UTILIZATION_PEAK_TIME":null,"USAGE_VOICE":10.5088,"USAGE_DATA":14075.2019,"PROMO_FLAG":null,"PROMO_NAME":null,"PROMO_STARTDATE":null,"PROMO_ENDDATE":null,"CGI":"520030702518286","CGI_HEX":"520031B71476E","CELL_CODE":"R431MW2136","SITE_ID":"433228"},"geometry":{"type":"Point","coordinates":[100.61649000000006,13.765010000000075]},"type":"Feature"}
${JsonInsert_TST_F4_1_1_009}    {}
${JsonInsert_TST_F4_1_1_010}    {"properties":{"UTILIZATION_PEAK_TIME":null,"SITE_ID":"596751","CI":"10054","REGION":"BKK","SITE_NAME":"ANUSAWALEE CHAI SAMORAPHUM 2","RADIUS":null,"PERCENT_UTILIZATION_PEAK":null,"PROMO_NAME":null,"CGI":"520010102010054","CGI_HEX":"5200103FC2746","SYSTEM":"2G900","PROVINCE":"BANGKOK","LONGITUDE_WGS84":"100.538747","USAGE_VOICE":2.3353,"USAGE_DATA":37.9936,"DISTRICT":"RATCHATHEWI","PERCENT_UTILIZATION_AVG":null,"PROMO_FLAG":null,"PROMO_STARTDATE":null,"LATITUDE_WGS84":"13.763787","PROMO_ENDDATE":null,"LAC":1020,"NAME":"ANUSAWALEE CHAI SAMORAPHUM 2_ASC2MB0911","SUB_DISTRICT":"THANON PHAYA THAI","STATION_TYPE":"Macro","SYSTEM_TYPE":"2G"},"geometry":{"type":"Point","coordinates":[100.53874700000006,13.763787000000036]},"type":"Feature"}
${JsonInsert_TST_F4_1_1_011}    {"properties":{"LAC":7025,"CI":"18286","NAME":"Soi RAMKHAMHAENG SOI 43/1_R431MW2136","REGION":"BKK","SYSTEM":"3G2100","PROVINCE":"BANGKOK","DISTRICT":"WANG THONGLANG","SUB_DISTRICT":"PHLAPPHLA","SITE_NAME":"Soi RAMKHAMHAENG SOI 43/1","STATION_TYPE":"Macro","SYSTEM_TYPE":"3G","LATITUDE_WGS84":"13.765010","LONGITUDE_WGS84":"100.616490","RADIUS":null,"PERCENT_UTILIZATION_AVG":25.9671,"PERCENT_UTILIZATION_PEAK":32.7253,"UTILIZATION_PEAK_TIME":null,"USAGE_VOICE":10.5088,"USAGE_DATA":14075.2019,"PROMO_FLAG":null,"PROMO_NAME":null,"PROMO_STARTDATE":null,"PROMO_ENDDATE":null,"CGI":"520030702518286","CGI_HEX":"520031B71476E","CELL_CODE":"R431MW2136","SITE_ID":"433228"},"geometry":{"type":"Point","coordinates":[100.61649000000006,13.765010000000075]},"type":"Feature"}
${JsonInsert_TST_F4_0_1_000}    {"properties":{"CELL_CODE":"ROSHMW2136","NAME":"ROSE HOTEL_ROSHMW2136","STATION_TYPE":"Macro","LONGITUDE_WGS84":"100.530717","USAGE_DATA":2724.582,"RADIUS":null,"LAC":20025,"SYSTEM":"3G2100","LATITUDE_WGS84":"13.730267","PROMO_NAME":null,"PROMO_ENDDATE":null,"PROVINCE":"BANGKOK","DISTRICT":"BANG RAK","PERCENT_UTILIZATION_AVG":17.465,"UTILIZATION_PEAK_TIME":{"$numberLong":"1579082400000"},"SITE_NAME":"ROSE HOTEL","SYSTEM_TYPE":"3G","CGI":"520032002554116","SUB_DISTRICT":"SI PHRAYA","PERCENT_UTILIZATION_PEAK":20.7356,"CGI_HEX":"520034E39D364","REGION":"BKK","PROMO_STARTDATE":null,"CI":"54116","USAGE_VOICE":3.0588,"PROMO_FLAG":null,"SITE_ID":"385827"},"geometry":{"type":"Point","coordinates":[100.53071700000004,13.730267000000026]},"type":"Feature"}
${JsonInsert_TST_F4_0_1_001}    {"properties":{"SYSTEM_TYPE":"3G","PERCENT_UTILIZATION_AVG":24.5196,"CI":"54115","NAME":"Chamchuri Square (DTAC Office)_CRSQPD213P","SUB_DISTRICT":"PATHUM WAN","CGI_HEX":"520034E39D363","STATION_TYPE":"Pico","LATITUDE_WGS84":"13.732721","UTILIZATION_PEAK_TIME":{"$numberLong":"1675339200000"},"CGI":"520032002554115","SITE_ID":"386347","PROVINCE":"BANGKOK","DISTRICT":"PATHUM WAN","USAGE_DATA":7162.1122,"CELL_CODE":"CRSQPD213P","PROMO_FLAG":null,"PROMO_STARTDATE":null,"PROMO_ENDDATE":null,"LAC":20025,"REGION":"BKK","RADIUS":null,"LONGITUDE_WGS84":"100.531008","PROMO_NAME":null,"SYSTEM":"3G2100","SITE_NAME":"Chamchuri Square (DTAC Office)","PERCENT_UTILIZATION_PEAK":29.2114,"USAGE_VOICE":3.5922},"geometry":{"type":"Point","coordinates":[100.53100800000004,13.732721000000026]},"type":"Feature"}
${JsonInsert_TST_F4_0_1_002}    {"properties":{"LAC":7025,"CI":"18306","NAME":"WAT SANSUK_WSSKMW2136","REGION":"BKK","SYSTEM":"3G2100","PROVINCE":"BANGKOK","DISTRICT":"MIN BURI","SUB_DISTRICT":"SAEN SAEP","SITE_NAME":"WAT SANSUK","STATION_TYPE":"Macro","SYSTEM_TYPE":"3G","LATITUDE_WGS84":"13.817063","LONGITUDE_WGS84":"100.743690","RADIUS":null,"PERCENT_UTILIZATION_AVG":22.2314,"PERCENT_UTILIZATION_PEAK":27.2303,"UTILIZATION_PEAK_TIME":{"$numberLong":"1670601600000"},"USAGE_VOICE":4.6837,"USAGE_DATA":5627.2114,"PROMO_FLAG":null,"PROMO_NAME":null,"PROMO_STARTDATE":null,"PROMO_ENDDATE":null,"CGI":"520030702518306","CGI_HEX":"520031B714782","CELL_CODE":"WSSKMW2136","SITE_ID":"391430"},"geometry":{"type":"Point","coordinates":[100.74369000000007,13.817063000000076]},"type":"Feature"}
${JsonInsert_TST_F4_0_1_003}    {}
${JsonInsert_TST_F4_0_1_004}    {"properties":{"LATITUDE_WGS84":"13.734166","UTILIZATION_PEAK_TIME":{"$numberLong":"1675339200000"},"USAGE_DATA":4222.9314,"SITE_NAME":"CHULALONGKORN 1","PROMO_FLAG":null,"PROMO_STARTDATE":null,"SYSTEM":"3G2100","PERCENT_UTILIZATION_AVG":19.6378,"PROVINCE":"BANGKOK","NAME":"CHULALONGKORN 1_CHU1MW2131","REGION":"BKK","SYSTEM_TYPE":"3G","LAC":20025,"DISTRICT":"PATHUM WAN","PERCENT_UTILIZATION_PEAK":21.3836,"SUB_DISTRICT":"PATHUM WAN","RADIUS":null,"PROMO_NAME":null,"STATION_TYPE":"Macro","USAGE_VOICE":6.3835,"PROMO_ENDDATE":null,"CGI":"520032002554129","CGI_HEX":"520034E39D371","CELL_CODE":"CHU1MW2131","SITE_ID":"385553","CI":"54129","LONGITUDE_WGS84":"100.531717"},"geometry":{"type":"Point","coordinates":[100.53171700000007,13.734166000000073]},"type":"Feature"}
${JsonInsert_TST_F4_0_1_005}    {"properties":{"LAC":7025,"CI":"18299","NAME":"WAT SANSUK_WSSKMW2131","REGION":"BKK","SYSTEM":"3G2100","PROVINCE":"BANGKOK","DISTRICT":"MIN BURI","SUB_DISTRICT":"SAEN SAEP","SITE_NAME":"WAT SANSUK","STATION_TYPE":"Macro","SYSTEM_TYPE":"3G","LATITUDE_WGS84":"13.817063","LONGITUDE_WGS84":"100.743690","RADIUS":null,"PERCENT_UTILIZATION_AVG":22.1548,"PERCENT_UTILIZATION_PEAK":23.3617,"UTILIZATION_PEAK_TIME":{"$numberLong":"1670601600000"},"USAGE_VOICE":7.3252,"USAGE_DATA":3714.1529,"PROMO_FLAG":null,"PROMO_NAME":null,"PROMO_STARTDATE":null,"PROMO_ENDDATE":null,"CGI":"520030702518299","CGI_HEX":"520031B71477B","CELL_CODE":"WSSKMW2131","SITE_ID":"391430"},"geometry":{"type":"Point","coordinates":[100.74369000000007,13.817063000000076]},"type":"Feature"}
${JsonInsert_TST_F4_0_1_006}    {"properties":{"CELL_CODE":"ROSHMW2136","NAME":"ROSE HOTEL_ROSHMW2136","STATION_TYPE":"Macro","LONGITUDE_WGS84":"100.530717","USAGE_DATA":2724.582,"RADIUS":null,"LAC":20025,"SYSTEM":"3G2100","LATITUDE_WGS84":"13.730267","PROMO_NAME":null,"PROMO_ENDDATE":null,"PROVINCE":"BANGKOK","DISTRICT":"BANG RAK","PERCENT_UTILIZATION_AVG":17.465,"UTILIZATION_PEAK_TIME":{"$numberLong":"1579082400000"},"SITE_NAME":"ROSE HOTEL","SYSTEM_TYPE":"3G","CGI":"520032002554116","SUB_DISTRICT":"SI PHRAYA","PERCENT_UTILIZATION_PEAK":20.7356,"CGI_HEX":"520034E39D364","REGION":"BKK","PROMO_STARTDATE":null,"CI":"54116","USAGE_VOICE":3.0588,"PROMO_FLAG":null,"SITE_ID":"385827"},"geometry":{"type":"Point","coordinates":[100.53071700000004,13.730267000000026]},"type":"Feature"}

${Jsonupsert_TST_F4_1_1_000}    {"cellId": "5200411F0A0A0","current5GModeEnabler": 1,"currentCapacity": 1}
${Jsonupsert_TST_F4_1_1_000_1}    {"cellId":"5200411FC000C","current5GModeEnabler":-1,"currentCapacity":-1}
${Jsonupsert_TST_F4_1_1_001}    {"cellId":"5200411F0A0A1","current5GModeEnabler":100,"currentCapacity":100}
${Jsonupsert_TST_F4_1_1_001_1}    {"cellId":"5200411FC001C","current5GModeEnabler":-1,"currentCapacity":-1}
${Jsonupsert_TST_F4_1_1_002}    {"cellId":"5200411F0A0A2","current5GModeEnabler":51,"currentCapacity":51}
${Jsonupsert_TST_F4_1_1_002_1}    {"cellId":"5200411FC002C","current5GModeEnabler":49,"currentCapacity":49}
${Jsonupsert_TST_F4_1_1_003}    {"cellId":"5200411F0A0A3","current5GModeEnabler":1,"currentCapacity":1}
${Jsonupsert_TST_F4_1_1_003_1}    {"cellId":"5200411FC003C","current5GModeEnabler":44,"currentCapacity":44}
${Jsonupsert_TST_F4_1_1_004}    {"cellId":"5200411F0A0A4","current5GModeEnabler":1,"currentCapacity":11}
${Jsonupsert_TST_F4_1_1_004_1}    {"cellId":"5200411FC004C","current5GModeEnabler":-1,"currentCapacity":9}
${Jsonupsert_TST_F4_1_1_005}    {"cellId":"5200411F0A0A5","current5GModeEnabler":0,"currentCapacity":11}
${Jsonupsert_TST_F4_1_1_005_1}    {"cellId":"5200411FC005C","current5GModeEnabler":0,"currentCapacity":9}
${Jsonupsert_TST_F4_1_1_006}    {"cellId":"5200411F0A0A6","current5GModeEnabler":1,"currentCapacity":1}
${Jsonupsert_TST_F4_1_1_006_1}    {"cellId":"5200411FC006C","current5GModeEnabler":-1,"currentCapacity":-1}
${Jsonupsert_TST_F4_1_1_007}    {"cellId":"5200411F0A0A7","current5GModeEnabler":1,"currentCapacity":1}
${Jsonupsert_TST_F4_1_1_007_1}    {"cellId":"5200411FC007C","current5GModeEnabler":-1,"currentCapacity":-1}
${Jsonupsert_TST_F4_1_1_008}    {"cellId":"5200411F0A0A8","current5GModeEnabler":1,"currentCapacity":1}
${Jsonupsert_TST_F4_1_1_009}    {"cellId":"5200411F0A0A9","currentCapacity":1}
${Jsonupsert_TST_F4_1_1_009_1}    {"cellId":"5200411FC009C","currentCapacity":-1}
${Jsonupsert_TST_F4_1_1_010}    {"cellId":"5200411F0A1A0","current5GModeEnabler":1,"currentCapacity":1}
${Jsonupsert_TST_F4_1_1_010_1}    {"cellId":"5200411FC010C","current5GModeEnabler":-1,"currentCapacity":-1}
${Jsonupsert_TST_F4_1_1_011}    {"cellId":"5200411F0A1A1","current5GModeEnabler":1,"currentCapacity":1}
${Jsonupsert_TST_F4_1_1_011_1}    {"cellId":"5200411FC011C","current5GModeEnabler":-1,"currentCapacity":-1}
${Jsonupsert_TST_F4_1_1_012}    {"cellId":"5200411F0A1A2","current5GModeEnabler":1,"currentCapacity":1}
${Jsonupsert_TST_F4_1_1_013}    {"cellId":"5200411FC013C","current5GModeEnabler":1,"currentCapacity":1}
${Jsonupsert_TST_F4_1_1_013-1}    {"cellId":"5200411F0A1A3","current5GModeEnabler":1,"currentCapacity":1}
${Jsonupsert_TST_F4_1_1_013-1_1}    {"cellId":"5200411FC013C","current5GModeEnabler":0,"currentCapacity":0}
${Jsonupsert_TST_F4_1_1_014}    {"cellId":"520050187030064","capacity":5,"current5GModeEnabler":1,"currentCapacity":1}
${Jsonupsert_TST_F4_1_1_015}    {"cellId":"5200411F0A1A5","current5GModeEnabler":1,"currentCapacity":1}
${Jsonupsert_TST_F4_1_1_016}    {"cellId":"5200411F0A1A6","current5GModeEnabler":1,"currentCapacity":1}
${Jsonupsert_TST_F4_1_1_017}    {"cellId":"5200411F0A1A7","current5GModeEnabler":1,"currentCapacity":1}
${Jsonupsert_TST_F4_1_1_018}    {"cellId":"5200411F0A1A8","currentCapacity":1}



${DataExpectedqa.TST_F4_0_1_000}