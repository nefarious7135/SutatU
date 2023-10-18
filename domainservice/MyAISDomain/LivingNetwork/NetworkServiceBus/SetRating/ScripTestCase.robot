*** Settings ***
Resource          Valiable.robot
Resource          ../../Keyword/Common.robot
Resource          ../../Keyword/MongoDB.robot
Resource          ../../Keyword/SecureCRT.robot
Resource          ../../Keyword/Stat.robot
Resource          ../../Valiables/CommonValiable/CommonValiable.robot
Resource          ../../Valiables/CommonValiable/CommonValiable.robot
*** Test Cases ***
Test Prepare Mongo
    #หา Id ใน MongoDB
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameSetRatingLevel}    {"id" : "TST_F12_1_1_008"}
    Log    ${ID}
    #ลบ Id ใน MongoDB ก่อน Test
    ${ID}    DeleteDataFromID    ${DataBaseNameNSB}    ${CollactionNameSetRatingLevel}    ${ID}
    Log    ${ID}
    Sleep    5
    #prepare MongoDB
    InsertDataFromJson    ${DataBaseNameNSB}    ${CollactionNameSetRatingLevel}    ${JsonInsert_TST_F12_1_1_008} 
    Sleep    5

TST_F12_1_1_001
    #หา Id ใน MongoDB
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameSetRatingLevel}    {"id" : "TST_F12_1_1_001"}
    Log    ${ID}
    #ลบ Id ใน MongoDB ก่อน Test
    ${ID}    DeleteDataFromID    ${DataBaseNameNSB}    ${CollactionNameSetRatingLevel}    ${ID}
    Log    ${ID}
    ${testcase}    BuiltIn.Set Variable    TST_F12_1_1_001
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCmdFileLog_setRating}    ${PathLogsetRating}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDeleteMassage_qa.setRatingRequested}    ${CmdProduce_qa.requestSetRating}    {"header":{"version":"2.0","timestamp":"2023-05-04T14:51:06.157Z","orgService":"living_network_repository","from":"CustomerOrderValidation","tid":"23493487987345","lastTid":"345345345345","channel":"","broker":"","useCase":"","useCaseStep":"","useCaseAge":"0","session":"234709834750982345","transaction":"TST_F12_1_1_001","communication":"unicast","groupTags":[],"identity":{"device":["324897098709872103948709"]},"tmfSpec":"TMF679","baseApiVersion":"4.0.0","schemaVersion":"1.0.0"},"body":{"msisdn":"66836077888","ratingLevel":1,"reason":"low_signaling","suggestion":"สัญญาณเน็ตไม่ค่อยดี_lowsignal2"}}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    Consume Kafka    ${Consume_qa.setRatingRequested}    ${testcase} 
    log    'consumeResult='${ConsumeResult}
    #check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    {"body":{"developerMessage":"Success","resultCode":"20000","resultDesc":"Success"},"header":{"baseApiVersion":"4.0.0","broker":"","channel":"","communication":"unicast","from":"nsb-set-rating","groupTags":[],"identity":{"device":["324897098709872103948709"]},"lastTid":"345345345345","orgService":"living_network_repository","schemaVersion":"1.0.0","session":"234709834750982345","tid":"23493487987345","timestamp":"2023-05-04T14:51:06.157Z","tmfSpec":"TMF679","transaction":"TST_F12_1_1_001","useCase":"","useCaseAge":"1","useCaseStep":"","version":"2.0"}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    Sleep    10s
    FlushLogAndStatbyCommandName    ${NameCmdFileLog_setRating}    ${testcase}    ${PathLogsetRating}
    #Verify Stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    ${testcase}    nsb-set-rating    service-set-rating    SUCCESS
    # ${result}    Common.VerifyStat    DMASTERSQA0001_service-set-rating    ${PathLogsetRating}
    # SuccessSetRating    ${result}
    [Teardown]    Close All Connections

TST_F12_1_1_002
    #หา Id ใน MongoDB
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameSetRatingLevel}    {"id" : "TST_F12_1_1_002"}
    Log    ${ID}
    #ลบ Id ใน MongoDB ก่อน Test
    ${ID}    DeleteDataFromID    ${DataBaseNameNSB}    ${CollactionNameSetRatingLevel}    ${ID}
    Log    ${ID}
    ${testcase}    BuiltIn.Set Variable    TST_F12_1_1_002
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCmdFileLog_setRating}    ${PathLogsetRating}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDeleteMassage_qa.setRatingRequested}    ${CmdProduce_qa.requestSetRating}    {"header":{"version":"2.0","timestamp":"2023-05-04T14:51:06.157Z","orgService":"living_network_repository","from":"CustomerOrderValidation","tid":"23493487987345","lastTid":"345345345345","channel":"","broker":"","useCase":"","useCaseStep":"","useCaseAge":"0","session":"234709834750982345","transaction":"TST_F12_1_1_002","communication":"unicast","groupTags":[],"identity":{"device":["324897098709872103948709"]},"tmfSpec":"TMF679","baseApiVersion":"4.0.0","schemaVersion":"1.0.0"},"body":{"msisdn":"66836077888","ratingLevel":2,"reason":"low_signaling","suggestion":"สัญญาณเน็ตหาย บ่อยๆ _lowsignal3"}}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    Consume Kafka    ${Consume_qa.setRatingRequested}    ${testcase} 
    log    'consumeResult='${ConsumeResult}
    #check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    {"body":{"developerMessage":"Success","resultCode":"20000","resultDesc":"Success"},"header":{"baseApiVersion":"4.0.0","broker":"","channel":"","communication":"unicast","from":"nsb-set-rating","groupTags":[],"identity":{"device":["324897098709872103948709"]},"lastTid":"345345345345","orgService":"living_network_repository","schemaVersion":"1.0.0","session":"234709834750982345","tid":"23493487987345","timestamp":"2023-05-04T14:51:06.157Z","tmfSpec":"TMF679","transaction":"TST_F12_1_1_002","useCase":"","useCaseAge":"1","useCaseStep":"","version":"2.0"}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    Sleep    10s
    FlushLogAndStatbyCommandName    ${NameCmdFileLog_setRating}    ${testcase}    ${PathLogsetRating}
    #Verify Stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    ${testcase}    nsb-set-rating    service-set-rating    SUCCESS
    [Teardown]    Close All Connections


TST_F12_1_1_003
    #หา Id ใน MongoDB
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameSetRatingLevel}    {"id" : "TST_F12_1_1_003"}
    Log    ${ID}
    #ลบ Id ใน MongoDB ก่อน Test
    ${ID}    DeleteDataFromID    ${DataBaseNameNSB}    ${CollactionNameSetRatingLevel}    ${ID}
    Log    ${ID}
    ${testcase}    BuiltIn.Set Variable    TST_F12_1_1_003
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCmdFileLog_setRating}    ${PathLogsetRating}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDeleteMassage_qa.setRatingRequested}    ${CmdProduce_qa.requestSetRating}    {"header":{"version":"2.0","timestamp":"2023-05-04T14:51:06.157Z","orgService":"living_network_repository","from":"CustomerOrderValidation","tid":"23493487987345","lastTid":"345345345345","channel":"","broker":"","useCase":"","useCaseStep":"","useCaseAge":"0","session":"234709834750982345","transaction":"TST_F12_1_1_003","communication":"unicast","groupTags":[],"identity":{"device":["324897098709872103948709"]},"tmfSpec":"TMF679","baseApiVersion":"4.0.0","schemaVersion":"1.0.0"},"body":{"msisdn":"66836077888","ratingLevel":3,"reason":"fair","suggestion":"ใช้งานสัญาณเน็ตได้ปกติ_fair"}}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    Consume Kafka    ${Consume_qa.setRatingRequested}    ${testcase} 
    log    'consumeResult='${ConsumeResult}
    #check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    {"body":{"developerMessage":"Success","resultCode":"20000","resultDesc":"Success"},"header":{"baseApiVersion":"4.0.0","broker":"","channel":"","communication":"unicast","from":"nsb-set-rating","groupTags":[],"identity":{"device":["324897098709872103948709"]},"lastTid":"345345345345","orgService":"living_network_repository","schemaVersion":"1.0.0","session":"234709834750982345","tid":"23493487987345","timestamp":"2023-05-04T14:51:06.157Z","tmfSpec":"TMF679","transaction":"TST_F12_1_1_003","useCase":"","useCaseAge":"1","useCaseStep":"","version":"2.0"}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    Sleep    10s
    FlushLogAndStatbyCommandName    ${NameCmdFileLog_setRating}    ${testcase}    ${PathLogsetRating}
    #Verify Stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    ${testcase}    nsb-set-rating    service-set-rating    SUCCESS
    [Teardown]    Close All Connections


TST_F12_1_1_004
    #หา Id ใน MongoDB
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameSetRatingLevel}    {"id" : "TST_F12_1_1_004"}
    Log    ${ID}
    #ลบ Id ใน MongoDB ก่อน Test
    ${ID}    DeleteDataFromID    ${DataBaseNameNSB}    ${CollactionNameSetRatingLevel}    ${ID}
    Log    ${ID}
    ${testcase}    BuiltIn.Set Variable    TST_F12_1_1_004
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCmdFileLog_setRating}    ${PathLogsetRating}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDeleteMassage_qa.setRatingRequested}    ${CmdProduce_qa.requestSetRating}    {"header":{"version":"2.0","timestamp":"2023-05-04T14:51:06.157Z","orgService":"living_network_repository","from":"CustomerOrderValidation","tid":"23493487987345","lastTid":"345345345345","channel":"","broker":"","useCase":"","useCaseStep":"","useCaseAge":"0","session":"234709834750982345","transaction":"TST_F12_1_1_004","communication":"unicast","groupTags":[],"identity":{"device":["324897098709872103948709"]},"tmfSpec":"TMF679","baseApiVersion":"4.0.0","schemaVersion":"1.0.0"},"body":{"msisdn":"66836077899","ratingLevel":4,"reason":"good","suggestion":"สัญญาณเน็ตดีค่ะ"}}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    Consume Kafka    ${Consume_qa.setRatingRequested}    ${testcase} 
    log    'consumeResult='${ConsumeResult}
    #check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    {"body":{"developerMessage":"Success","resultCode":"20000","resultDesc":"Success"},"header":{"baseApiVersion":"4.0.0","broker":"","channel":"","communication":"unicast","from":"nsb-set-rating","groupTags":[],"identity":{"device":["324897098709872103948709"]},"lastTid":"345345345345","orgService":"living_network_repository","schemaVersion":"1.0.0","session":"234709834750982345","tid":"23493487987345","timestamp":"2023-05-04T14:51:06.157Z","tmfSpec":"TMF679","transaction":"TST_F12_1_1_004","useCase":"","useCaseAge":"1","useCaseStep":"","version":"2.0"}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    Sleep    10s
    FlushLogAndStatbyCommandName    ${NameCmdFileLog_setRating}    ${testcase}    ${PathLogsetRating}
    #Verify Stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    ${testcase}    nsb-set-rating    service-set-rating    SUCCESS
    [Teardown]    Close All Connections


TST_F12_1_1_005
    #หา Id ใน MongoDB
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameSetRatingLevel}    {"id" : "TST_F12_1_1_005"}
    Log    ${ID}
    #ลบ Id ใน MongoDB ก่อน Test
    ${ID}    DeleteDataFromID    ${DataBaseNameNSB}    ${CollactionNameSetRatingLevel}    ${ID}
    Log    ${ID}
    ${testcase}    BuiltIn.Set Variable    TST_F12_1_1_005
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCmdFileLog_setRating}    ${PathLogsetRating}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDeleteMassage_qa.setRatingRequested}    ${CmdProduce_qa.requestSetRating}    {"header":{"version":"2.0","timestamp":"2023-05-04T14:51:06.157Z","orgService":"living_network_repository","from":"CustomerOrderValidation","tid":"23493487987345","lastTid":"345345345345","channel":"","broker":"","useCase":"","useCaseStep":"","useCaseAge":"0","session":"234709834750982345","transaction":"TST_F12_1_1_005","communication":"unicast","groupTags":[],"identity":{"device":["324897098709872103948709"]},"tmfSpec":"TMF679","baseApiVersion":"4.0.0","schemaVersion":"1.0.0"},"body":{"msisdn":"66836077899","ratingLevel":5,"reason":"VeryGood","suggestion":"สัญญาณเน็ตดีมากๆเลย_VeryGood"}}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    Consume Kafka    ${Consume_qa.setRatingRequested}    ${testcase} 
    log    'consumeResult='${ConsumeResult}
    #check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    {"body":{"developerMessage":"Success","resultCode":"20000","resultDesc":"Success"},"header":{"baseApiVersion":"4.0.0","broker":"","channel":"","communication":"unicast","from":"nsb-set-rating","groupTags":[],"identity":{"device":["324897098709872103948709"]},"lastTid":"345345345345","orgService":"living_network_repository","schemaVersion":"1.0.0","session":"234709834750982345","tid":"23493487987345","timestamp":"2023-05-04T14:51:06.157Z","tmfSpec":"TMF679","transaction":"TST_F12_1_1_005","useCase":"","useCaseAge":"1","useCaseStep":"","version":"2.0"}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    Sleep    10s
    FlushLogAndStatbyCommandName    ${NameCmdFileLog_setRating}    ${testcase}    ${PathLogsetRating}
    #Verify Stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    ${testcase}    nsb-set-rating    service-set-rating    SUCCESS
    [Teardown]    Close All Connections


TST_F12_1_1_006
    #หา Id ใน MongoDB
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameSetRatingLevel}    {"id" : "TST_F12_1_1_006"}
    Log    ${ID}
    #ลบ Id ใน MongoDB ก่อน Test
    ${ID}    DeleteDataFromID    ${DataBaseNameNSB}    ${CollactionNameSetRatingLevel}    ${ID}
    Log    ${ID}
    ${testcase}    BuiltIn.Set Variable    TST_F12_1_1_006
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCmdFileLog_setRating}    ${PathLogsetRating}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDeleteMassage_qa.setRatingRequested}    ${CmdProduce_qa.requestSetRating}    {"header":{"version":"2.0","timestamp":"2023-05-04T14:51:06.157Z","orgService":"living_network_repository","from":"CustomerOrderValidation","tid":"23493487987345","lastTid":"345345345345","channel":"","broker":"","useCase":"","useCaseStep":"","useCaseAge":"0","session":"234709834750982345","transaction":"TST_F12_1_1_006","communication":"unicast","groupTags":[],"identity":{"device":["324897098709872103948709"]},"tmfSpec":"TMF679","baseApiVersion":"4.0.0","schemaVersion":"1.0.0"},"body":{"msisdn":"66836077888","ratingLevel":5,"suggestion":"สัญญาณเน็ตดีมากๆเลย_VeryGood"}}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    Consume Kafka    ${Consume_qa.setRatingRequested}    ${testcase} 
    log    'consumeResult='${ConsumeResult}
    #check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    {"body":{"developerMessage":"Success","resultCode":"20000","resultDesc":"Success"},"header":{"baseApiVersion":"4.0.0","broker":"","channel":"","communication":"unicast","from":"nsb-set-rating","groupTags":[],"identity":{"device":["324897098709872103948709"]},"lastTid":"345345345345","orgService":"living_network_repository","schemaVersion":"1.0.0","session":"234709834750982345","tid":"23493487987345","timestamp":"2023-05-04T14:51:06.157Z","tmfSpec":"TMF679","transaction":"TST_F12_1_1_006","useCase":"","useCaseAge":"1","useCaseStep":"","version":"2.0"}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    Sleep    10s
    FlushLogAndStatbyCommandName    ${NameCmdFileLog_setRating}    ${testcase}    ${PathLogsetRating}
    #Verify Stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    ${testcase}    nsb-set-rating    service-set-rating    SUCCESS
    [Teardown]    Close All Connections


TST_F12_1_1_007
    #หา Id ใน MongoDB
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameSetRatingLevel}    {"id" : "TST_F12_1_1_007"}
    Log    ${ID}
    #ลบ Id ใน MongoDB ก่อน Test
    ${ID}    DeleteDataFromID    ${DataBaseNameNSB}    ${CollactionNameSetRatingLevel}    ${ID}
    Log    ${ID}
    ${testcase}    BuiltIn.Set Variable    TST_F12_1_1_007
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}    
    SetLogNull    ${NameCmdFileLog_setRating}    ${PathLogsetRating}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDeleteMassage_qa.setRatingRequested}    ${CmdProduce_qa.requestSetRating}    {"header":{"version":"2.0","timestamp":"2023-05-04T14:51:06.157Z","orgService":"living_network_repository","from":"CustomerOrderValidation","tid":"23493487987345","lastTid":"345345345345","channel":"","broker":"","useCase":"","useCaseStep":"","useCaseAge":"0","session":"234709834750982345","transaction":"TST_F12_1_1_007","communication":"unicast","groupTags":[],"identity":{"device":["324897098709872103948709"]},"tmfSpec":"TMF679","baseApiVersion":"4.0.0","schemaVersion":"1.0.0"},"body":{"msisdn":"66836077888","ratingLevel":5,"reason":"VeryGood"}}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    Consume Kafka    ${Consume_qa.setRatingRequested}    ${testcase} 
    log    'consumeResult='${ConsumeResult}
    #check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    {"body":{"developerMessage":"Success","resultCode":"20000","resultDesc":"Success"},"header":{"baseApiVersion":"4.0.0","broker":"","channel":"","communication":"unicast","from":"nsb-set-rating","groupTags":[],"identity":{"device":["324897098709872103948709"]},"lastTid":"345345345345","orgService":"living_network_repository","schemaVersion":"1.0.0","session":"234709834750982345","tid":"23493487987345","timestamp":"2023-05-04T14:51:06.157Z","tmfSpec":"TMF679","transaction":"TST_F12_1_1_007","useCase":"","useCaseAge":"1","useCaseStep":"","version":"2.0"}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    Sleep    10s
    FlushLogAndStatbyCommandName    ${NameCmdFileLog_setRating}    ${testcase}    ${PathLogsetRating}
    #Verify Stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    ${testcase}    nsb-set-rating    service-set-rating    SUCCESS
    # ${result}    Common.VerifyStat    DMASTERSQA0001_service-set-rating    ${PathLogsetRating}
    # SuccessSetRating    ${result}
    [Teardown]    Close All Connections


TST_F12_1_1_008
    #หา Id ใน MongoDB
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameSetRatingLevel}    {"id" : "TST_F12_1_1_008"}
    Log    ${ID}
    #ลบ Id ใน MongoDB ก่อน prepare data
    ${ID}    DeleteDataFromID    ${DataBaseNameNSB}    ${CollactionNameSetRatingLevel}    ${ID}
    Log    ${ID}
    #prepare MongoDB
    InsertDataFromJson    ${DataBaseNameNSB}    ${CollactionNameSetRatingLevel}    ${JsonInsert_TST_F12_1_1_008} 
    ${testcase}    BuiltIn.Set Variable    TST_F12_1_1_008
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCmdFileLog_setRating}    ${PathLogsetRating}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDeleteMassage_qa.setRatingRequested}    ${CmdProduce_qa.requestSetRating}    {"header":{"version":"2.0","timestamp":"2023-05-04T14:51:06.157Z","orgService":"living_network_repository","from":"CustomerOrderValidation","tid":"23493487987345","lastTid":"345345345345","channel":"","broker":"","useCase":"","useCaseStep":"","useCaseAge":"0","session":"234709834750982345","transaction":"TST_F12_1_1_008","communication":"unicast","groupTags":[],"identity":{"device":["324897098709872103948709"]},"tmfSpec":"TMF679","baseApiVersion":"4.0.0","schemaVersion":"1.0.0"},"body":{"msisdn":"66836077810","ratingLevel":4,"reason":"Good","suggestion":"สัญญาณเน็ตดีค่ะ_Good"}}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    Consume Kafka    ${Consume_qa.setRatingRequested}    ${testcase} 
    log    'consumeResult='${ConsumeResult}
    #check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    {"body":{"developerMessage":"Success","resultCode":"20000","resultDesc":"Success"},"header":{"baseApiVersion":"4.0.0","broker":"","channel":"","communication":"unicast","from":"nsb-set-rating","groupTags":[],"identity":{"device":["324897098709872103948709"]},"lastTid":"345345345345","orgService":"living_network_repository","schemaVersion":"1.0.0","session":"234709834750982345","tid":"23493487987345","timestamp":"2023-05-04T14:51:06.157Z","tmfSpec":"TMF679","transaction":"TST_F12_1_1_008","useCase":"","useCaseAge":"1","useCaseStep":"","version":"2.0"}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    Sleep    10s
    FlushLogAndStatbyCommandName    ${NameCmdFileLog_setRating}    ${testcase}    ${PathLogsetRating}
    #Verify Stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    ${testcase}    nsb-set-rating    service-set-rating    SUCCESS
    # ${result}    Common.VerifyStat    DMASTERSQA0001_service-set-rating    ${PathLogsetRating}
    # SuccessSetRating    ${result}
    [Teardown]    Close All Connections


TST_F12_1_1_009
    #หา Id ใน MongoDB
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameSetRatingLevel}    {"id" : "TST_F12_1_1_009"}
    Log    ${ID}
    #ลบ Id ใน MongoDB ก่อน Test
    ${ID}    DeleteDataFromID    ${DataBaseNameNSB}    ${CollactionNameSetRatingLevel}    ${ID}
    Log    ${ID}
    ${testcase}    BuiltIn.Set Variable    TST_F12_1_1_009
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCmdFileLog_setRating}    ${PathLogsetRating}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDeleteMassage_qa.setRatingRequested}    ${CmdProduce_qa.requestSetRating}    {"header":{"version":"2.0","timestamp":"2023-05-04T14:51:06.157Z","orgService":"living_network_repository","from":"CustomerOrderValidation","tid":"23493487987345","lastTid":"345345345345","channel":"","broker":"","useCase":"","useCaseStep":"","useCaseAge":"0","session":"234709834750982345","transaction":"TST_F12_1_1_009","communication":"unicast","groupTags":[],"identity":{"device":["324897098709872103948709"]},"tmfSpec":"TMF679","baseApiVersion":"4.0.0","schemaVersion":"1.0.0"},"body":{"msisdn":"66836077801","ratingLevel":7,"reason":"VeryGood","suggestion":"สัญญาณเน็ตดีมากๆค่ะ_Good"}}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    Consume Kafka    ${Consume_qa.setRatingRequested}    ${testcase} 
    log    'consumeResult='${ConsumeResult}
    #check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    {"body":{"developerMessage":"Success","resultCode":"20000","resultDesc":"Success"},"header":{"baseApiVersion":"4.0.0","broker":"","channel":"","communication":"unicast","from":"nsb-set-rating","groupTags":[],"identity":{"device":["324897098709872103948709"]},"lastTid":"345345345345","orgService":"living_network_repository","schemaVersion":"1.0.0","session":"234709834750982345","tid":"23493487987345","timestamp":"2023-05-04T14:51:06.157Z","tmfSpec":"TMF679","transaction":"TST_F12_1_1_009","useCase":"","useCaseAge":"1","useCaseStep":"","version":"2.0"}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    Sleep    10s
    FlushLogAndStatbyCommandName    ${NameCmdFileLog_setRating}    ${testcase}    ${PathLogsetRating}
    #Verify Stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    ${testcase}    nsb-set-rating    service-set-rating    SUCCESS
    # ${result}    Common.VerifyStat    DMASTERSQA0001_service-set-rating    ${PathLogsetRating}
    # SuccessSetRating    ${result}
    [Teardown]    Close All Connections


TST_F12_1_1_010
    #หา Id ใน MongoDB
    ${ID}    QueryDataReturnID    ${DataBaseNameNSB}    ${CollactionNameSetRatingLevel}    {"id" : "TST_F12_1_1_010"}
    Log    ${ID}
    #ลบ Id ใน MongoDB ก่อน Test
    ${ID}    DeleteDataFromID    ${DataBaseNameNSB}    ${CollactionNameSetRatingLevel}    ${ID}
    Log    ${ID}
    ${testcase}    BuiltIn.Set Variable    TST_F12_1_1_010
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCmdFileLog_setRating}    ${PathLogsetRating}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDeleteMassage_qa.setRatingRequested}    ${CmdProduce_qa.requestSetRating}    {"header":{"version":"2.0","timestamp":"2023-05-04T14:51:06.157Z","orgService":"living_network_repository","from":"CustomerOrderValidation","tid":"23493487987345","lastTid":"345345345345","channel":"","broker":"","useCase":"1","useCaseStep":"2","useCaseAge":"3","session":"234709834750982345","transaction":"TST_F12_1_1_010","communication":"unicast","groupTags":[],"identity":{"device":["324897098709872103948709"]},"tmfSpec":"TMF679","baseApiVersion":"4.0.0","schemaVersion":"1.0.0"},"body":{"msisdn":"66836077888","ratingLevel":5,"reason":"VeryGood","suggestion":"สัญญาณเน็ตดีมากๆเลย_VeryGood"}}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    Consume Kafka    ${Consume_qa.setRatingRequested}    ${testcase} 
    log    'consumeResult='${ConsumeResult}
    #check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    {"body":{"developerMessage":"Success","resultCode":"20000","resultDesc":"Success"},"header":{"baseApiVersion":"4.0.0","broker":"","channel":"","communication":"unicast","from":"nsb-set-rating","groupTags":[],"identity":{"device":["324897098709872103948709"]},"lastTid":"345345345345","orgService":"living_network_repository","schemaVersion":"1.0.0","session":"234709834750982345","tid":"23493487987345","timestamp":"2023-05-04T14:51:06.157Z","tmfSpec":"TMF679","transaction":"TST_F12_1_1_010","useCase":"1","useCaseAge":"4","useCaseStep":"2","version":"2.0"}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    Sleep    10s
    FlushLogAndStatbyCommandName    ${NameCmdFileLog_setRating}    ${testcase}     ${PathLogsetRating}
    #Verify Stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    ${testcase}    nsb-set-rating    service-set-rating    SUCCESS
    [Teardown]    Close All Connections


TST_F12_0_1_001
    ${testcase}    BuiltIn.Set Variable    TST_F12_0_1_001
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCmdFileLog_setRating}    ${PathLogsetRating}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDeleteMassage_qa.setRatingRequested}    ${CmdProduce_qa.requestSetRating}    {"header":{"version":"2.0","timestamp":"2023-05-04T14:51:06.157Z","orgService":"living_network_repository","from":"CustomerOrderValidation","tid":"23493487987345","lastTid":"345345345345","channel":"","broker":"","useCase":"","useCaseStep":"","useCaseAge":"0","session":"234709834750982345","transaction":"TST_F12_0_1_001","communication":"unicast","groupTags":[],"identity":{"device":["324897098709872103948709"]},"tmfSpec":"TMF679","baseApiVersion":"4.0.0","schemaVersion":"1.0.0"},"body":{"ratingLevel":5,"reason":"Good","suggestion":"สัญญาณเน็ตดีมากๆค่ะ_Good"}}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    Consume Kafka    ${Consume_qa.setRatingRequested}    ${testcase} 
    log    'consumeResult='${ConsumeResult}
    #check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    {"body":{"developerMessage":"msisdn is missing or invalid","resultCode":"50000","resultDesc":"System Error"},"header":{"baseApiVersion":"4.0.0","broker":"","channel":"","communication":"unicast","from":"nsb-set-rating","groupTags":[],"identity":{"device":["324897098709872103948709"]},"lastTid":"345345345345","orgService":"living_network_repository","schemaVersion":"1.0.0","session":"234709834750982345","tid":"23493487987345","timestamp":"2023-05-04T14:51:06.157Z","tmfSpec":"TMF679","transaction":"TST_F12_0_1_001","useCase":"","useCaseAge":"1","useCaseStep":"","version":"2.0"}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    Sleep    10s
    FlushLogAndStatbyCommandName    ${NameCmdFileLog_setRating}    ${testcase}    ${PathLogsetRating}
    #Verify Stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    ${testcase}    nsb-set-rating    service-set-rating    ERROR
    [Teardown]    Close All Connections

TST_F12_0_1_002
    ${testcase}    BuiltIn.Set Variable    TST_F12_0_1_002
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCmdFileLog_setRating}    ${PathLogsetRating}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDeleteMassage_qa.setRatingRequested}    ${CmdProduce_qa.requestSetRating}    {"header":{"version":"2.0","timestamp":"2023-05-04T14:51:06.157Z","orgService":"living_network_repository","from":"CustomerOrderValidation","tid":"23493487987345","lastTid":"345345345345","channel":"","broker":"","useCase":"","useCaseStep":"","useCaseAge":"0","session":"234709834750982345","transaction":"TST_F12_0_1_002","communication":"unicast","groupTags":[],"identity":{"device":["324897098709872103948709"]},"tmfSpec":"TMF679","baseApiVersion":"4.0.0","schemaVersion":"1.0.0"},"body":{"msisdn":"","ratingLevel":5,"reason":"VeryGood","suggestion":"สัญญาณเน็ตดีมากๆเลย_VeryGood"}}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    Consume Kafka    ${Consume_qa.setRatingRequested}    ${testcase} 
    log    'consumeResult='${ConsumeResult}
    #check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    {"body":{"developerMessage":"msisdn is missing or invalid","resultCode":"50000","resultDesc":"System Error"},"header":{"baseApiVersion":"4.0.0","broker":"","channel":"","communication":"unicast","from":"nsb-set-rating","groupTags":[],"identity":{"device":["324897098709872103948709"]},"lastTid":"345345345345","orgService":"living_network_repository","schemaVersion":"1.0.0","session":"234709834750982345","tid":"23493487987345","timestamp":"2023-05-04T14:51:06.157Z","tmfSpec":"TMF679","transaction":"TST_F12_0_1_002","useCase":"","useCaseAge":"1","useCaseStep":"","version":"2.0"}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    Sleep    10s
    FlushLogAndStatbyCommandName    ${NameCmdFileLog_setRating}    ${testcase}    ${PathLogsetRating}
    #Verify Stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    ${testcase}    nsb-set-rating    service-set-rating    ERROR
    [Teardown]    Close All Connections

TST_F12_0_1_003
    ${testcase}    BuiltIn.Set Variable    TST_F12_0_1_003
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCmdFileLog_setRating}    ${PathLogsetRating}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDeleteMassage_qa.setRatingRequested}    ${CmdProduce_qa.requestSetRating}    {"header":{"version":"2.0","timestamp":"2023-05-04T14:51:06.157Z","orgService":"living_network_repository","from":"CustomerOrderValidation","tid":"23493487987345","lastTid":"345345345345","channel":"","broker":"","useCase":"","useCaseStep":"","useCaseAge":"0","session":"234709834750982345","transaction":"TST_F12_0_1_003","communication":"unicast","groupTags":[],"identity":{"device":["324897098709872103948709"]},"tmfSpec":"TMF679","baseApiVersion":"4.0.0","schemaVersion":"1.0.0"},"body":{"msisdn":"66836077801","reason":"Good","suggestion":"สัญญาณเน็ตดีมากๆค่ะ_Good"}}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    Consume Kafka    ${Consume_qa.setRatingRequested}    ${testcase} 
    log    'consumeResult='${ConsumeResult}
    #check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    {"body":{"developerMessage":"ratingLevel is missing or invalid","resultCode":"50000","resultDesc":"System Error"},"header":{"baseApiVersion":"4.0.0","broker":"","channel":"","communication":"unicast","from":"nsb-set-rating","groupTags":[],"identity":{"device":["324897098709872103948709"]},"lastTid":"345345345345","orgService":"living_network_repository","schemaVersion":"1.0.0","session":"234709834750982345","tid":"23493487987345","timestamp":"2023-05-04T14:51:06.157Z","tmfSpec":"TMF679","transaction":"TST_F12_0_1_003","useCase":"","useCaseAge":"1","useCaseStep":"","version":"2.0"}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    Sleep    10s
    FlushLogAndStatbyCommandName    ${NameCmdFileLog_setRating}    ${testcase}    ${PathLogsetRating}
    #Verify Stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    ${testcase}    nsb-set-rating    service-set-rating    ERROR
    [Teardown]    Close All Connections


TST_F12_0_1_004
    ${testcase}    BuiltIn.Set Variable    TST_F12_0_1_004
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCmdFileLog_setRating}    ${PathLogsetRating}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDeleteMassage_qa.setRatingRequested}    ${CmdProduce_qa.requestSetRating}    {"header":{"version":"2.0","timestamp":"2023-05-04T14:51:06.157Z","orgService":"living_network_repository","from":"CustomerOrderValidation","tid":"23493487987345","lastTid":"345345345345","channel":"","broker":"","useCase":"","useCaseStep":"","useCaseAge":"0","session":"234709834750982345","transaction":"TST_F12_0_1_004","communication":"unicast","groupTags":[],"identity":{"device":["324897098709872103948709"]},"tmfSpec":"TMF679","baseApiVersion":"4.0.0","schemaVersion":"1.0.0"},"body":{"msisdn":"66836077888","ratingLevel":0,"reason":"VeryGood","suggestion":"สัญญาณเน็ตดีมากๆเลย_VeryGood"}}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Consume Kafka    ${Consume_qa.setRatingRequested}    T${testcase}
    log    ${ConsumeResult}
    #check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    {"body":{"developerMessage":"ratingLevel is missing or invalid","resultCode":"50000","resultDesc":"System Error"},"header":{"baseApiVersion":"4.0.0","broker":"","channel":"","communication":"unicast","from":"nsb-set-rating","groupTags":[],"identity":{"device":["324897098709872103948709"]},"lastTid":"345345345345","orgService":"living_network_repository","schemaVersion":"1.0.0","session":"234709834750982345","tid":"23493487987345","timestamp":"2023-05-04T14:51:06.157Z","tmfSpec":"TMF679","transaction":"TST_F12_0_1_004","useCase":"","useCaseAge":"1","useCaseStep":"","version":"2.0"}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    Sleep    10s
    FlushLogAndStatbyCommandName    ${NameCmdFileLog_setRating}    ${testcase}   ${PathLogsetRating}
    #Verify Stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    ${testcase}    nsb-set-rating    service-set-rating    ERROR
    [Teardown]    Close All Connections

TST_F12_0_1_005
    ${testcase}    BuiltIn.Set Variable    TST_F12_0_1_005
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCmdFileLog_setRating}    ${PathLogsetRating}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDeleteMassage_qa.setRatingRequested}    ${CmdProduce_qa.requestSetRating}    {"header":{"version":"2.0","timestamp":"2023-05-04T14:51:06.157Z","orgService":"living_network_repository","from":"CustomerOrderValidation","tid":"23493487987345","lastTid":"345345345345","channel":"","broker":"","useCase":"","useCaseStep":"","useCaseAge":"0","session":"234709834750982345","transaction":"TST_F12_0_1_005","communication":"unicast","groupTags":[],"identity":{"device":["324897098709872103948709"]},"tmfSpec":"TMF679","baseApiVersion":"4.0.0","schemaVersion":"1.0.0"},"body":{"msisdn":"66836077801","ratingLevel":5.5,"reason":"Good","suggestion":"สัญญาณเน็ตดีมากๆค่ะ_Good"}}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    Consume Kafka    ${Consume_qa.setRatingRequested}    ${testcase} 
    log    'consumeResult='${ConsumeResult}
    #check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    {"body":{"developerMessage":"UNMARSHAL_ERROR","resultCode":"50000","resultDesc":"System Error"},"header":{"baseApiVersion":"4.0.0","broker":"","channel":"","communication":"unicast","from":"nsb-set-rating","groupTags":[],"identity":{"device":["324897098709872103948709"]},"lastTid":"345345345345","orgService":"living_network_repository","schemaVersion":"1.0.0","session":"234709834750982345","tid":"23493487987345","timestamp":"2023-05-04T14:51:06.157Z","tmfSpec":"TMF679","transaction":"TST_F12_0_1_005","useCase":"","useCaseAge":"1","useCaseStep":"","version":"2.0"}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    Sleep    10s
    FlushLogAndStatbyCommandName    ${NameCmdFileLog_setRating}    ${testcase}    ${PathLogsetRating}
    #Verify Stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    ${testcase}    nsb-set-rating    service-set-rating    ERROR
    [Teardown]    Close All Connections

TST_F12_0_1_006
    ${testcase}    BuiltIn.Set Variable    TST_F12_0_1_006
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    SetLogNull    ${NameCmdFileLog_setRating}    ${PathLogsetRating}
    #produce kafka : requestAccessToken
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    Produce Kafka    ${CmdDeleteMassage_qa.setRatingRequested}    ${CmdProduce_qa.requestSetRating}    {"header":{"version":"2.0","timestamp":"2023-05-04T14:51:06.157Z","orgService":"living_network_repository","from":"CustomerOrderValidation","tid":"23493487987345","lastTid":"345345345345","channel":"","broker":"","useCase":"","useCaseStep":"","useCaseAge":"0","session":"234709834750982345","transaction":"TST_F12_0_1_006","communication":"unicast","groupTags":[],"identity":{"device":["324897098709872103948709"]},"tmfSpec":"TMF679","baseApiVersion":"4.0.0","schemaVersion":"1.0.0"},"body":{"msisdn":"66836077801","ratingLevel":"4","reason":"Good","suggestion":"สัญญาณเน็ตดีมากๆค่ะ_Good"}}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRTkafaka    ${HostURL_10.138.42.190}
    ${ConsumeResult}    Consume Kafka    ${Consume_qa.setRatingRequested}    ${testcase} 
    log    'consumeResult='${ConsumeResult}
    #check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    {"body":{"developerMessage":"UNMARSHAL_ERROR","resultCode":"50000","resultDesc":"System Error"},"header":{"baseApiVersion":"4.0.0","broker":"","channel":"","communication":"unicast","from":"nsb-set-rating","groupTags":[],"identity":{"device":["324897098709872103948709"]},"lastTid":"345345345345","orgService":"living_network_repository","schemaVersion":"1.0.0","session":"234709834750982345","tid":"23493487987345","timestamp":"2023-05-04T14:51:06.157Z","tmfSpec":"TMF679","transaction":"TST_F12_0_1_006","useCase":"","useCaseAge":"1","useCaseStep":"","version":"2.0"}}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    Sleep    10s
    FlushLogAndStatbyCommandName    ${NameCmdFileLog_setRating}    ${testcase}    ${PathLogsetRating}
    #Verify Stat
    ConnectSecureCRTLog    ${HostURL_10.137.45.30}
    VerifyStatByCommand    ${testcase}    nsb-set-rating    service-set-rating    ERROR
    [Teardown]    Close All Connections
