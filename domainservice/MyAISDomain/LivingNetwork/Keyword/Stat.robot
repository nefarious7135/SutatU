*** Keywords ***
SuccessCheckAgreeTC20000
    [Arguments]    ${result}
    Should Contain    ${result}    Receive_Request_From_Kafka|Consume_Message|Success|Success|qa.requestCheckAgreeTC2|consume|
    Should Contain    ${result}    Send_Request_To_Mongo|FindOne_qaPrivacyProfile|Success|Success|qaPrivacyProfile|read|20000
    Should Contain    ${result}    Send_Request_To_Mongo|FindOne_qaPrivacyProfile_ProcessTime|||qaPrivacyProfile|read
    Should Contain    ${result}    Send_Request_To_Kafka|Produce_Message|Success|Success|qa.checkAgreeTCRequested2|produce|20000
    Should Contain    ${result}    Send_Request_To_Kafka|Produce_Message_ProcessTime|||qa.checkAgreeTCRequested2|produce|
    Should Contain    ${result}    Summary|Summary|Success|Success|||
    Should Contain    ${result}    Summary|Summary_ProcessTime|||||

ErrorCheckAgreeTC40401
    [Arguments]    ${result}
    Should Contain    ${result}    Receive_Request_From_Kafka|Consume_Message|Success|Success|qa.requestCheckAgreeTC2|consume|
    Should Contain    ${result}    Send_Request_To_Mongo|FindOne_qaPrivacyProfile|Error|mongo: no documents in result|qaPrivacyProfile|read|40400
    Should Contain    ${result}    Send_Request_To_Mongo|FindOne_qaPrivacyProfile_ProcessTime|||qaPrivacyProfile|read|
    Should Contain    ${result}    Send_Request_To_Kafka|Produce_Message|Success|Success|qa.checkAgreeTCRequested2|produce|20000
    Should Contain    ${result}    Send_Request_To_Kafka|Produce_Message_ProcessTime|||qa.checkAgreeTCRequested2|produce|
    Should Contain    ${result}    Summary|Summary|Error|Error|||
    Should Contain    ${result}    Summary|Summary_ProcessTime|||||

ErrorCheckAgreeTC50000
    [Arguments]    ${result}
    Should Contain    ${result}    Receive_Request_From_Kafka|Consume_Message|Success|Success|qa.requestCheckAgreeTC2|consume|
    Should Not Contain    ${result}    Send_Request_To_Mongo|FindOne_qaPrivacyProfile|Error|mongo: no documents in result|qaPrivacyProfile|read|40400
    Should Not Contain    ${result}    Send_Request_To_Mongo|FindOne_qaPrivacyProfile_ProcessTime|||qaPrivacyProfile|read|
    Should Contain    ${result}    Send_Request_To_Kafka|Produce_Message|Success|Success|qa.checkAgreeTCRequested2|produce|20000
    Should Contain    ${result}    Send_Request_To_Kafka|Produce_Message_ProcessTime|||qa.checkAgreeTCRequested2|produce|
    Should Contain    ${result}    Summary|Summary|Error|Error|||
    Should Contain    ${result}    Summary|Summary_ProcessTime|||||

ErrorCheckAgreeTCNull
    [Arguments]    ${result}
    Should Contain    ${result}    Receive_Request_From_Kafka|Consume_Message|Success|Success|qa.requestCheckAgreeTC2|consume|
    Should Not Contain    ${result}    Send_Request_To_Mongo|FindOne_qaPrivacyProfile|Error|mongo: no documents in result|qaPrivacyProfile|read|40400
    Should Not Contain    ${result}    Send_Request_To_Mongo|FindOne_qaPrivacyProfile_ProcessTime|||qaPrivacyProfile|read|
    Should Not Contain    ${result}    Send_Request_To_Kafka|Produce_Message|Success|Success|qa.checkAgreeTCRequested2|produce|20000
    Should Not Contain    ${result}    Send_Request_To_Kafka|Produce_Message_ProcessTime|||qa.checkAgreeTCRequested2|produce|
    Should Contain    ${result}    Summary|Summary|Error|Error|||
    Should Contain    ${result}    Summary|Summary_ProcessTime|||||
    #nsb-set-rating

SuccessSetRating
    [Arguments]    ${result}
    Should Contain    ${result}    Receive_Request_From_Kafka|Consume_Message|Success|Success|qa.requestSetRating|consume|
    Should Contain    ${result}    Send_Request_To_Mongo|Update_qaSetRatingLevel|Success|Success|qaSetRatingLevel|update|20000
    Should Contain    ${result}    Send_Request_To_Mongo|Update_qaSetRatingLevel_ProcessTime|||qaSetRatingLevel|update|
    Should Contain    ${result}    Send_Request_To_Kafka|Produce_Message|Success|Success|qa.setRatingRequested|produce|20000
    Should Contain    ${result}    Send_Request_To_Kafka|Produce_Message_ProcessTime|||qa.setRatingRequested|produce|
    Should Contain    ${result}    Summary|Summary|Success|Success|||
    Should Contain    ${result}    Summary|Summary_ProcessTime|||||

ErrorSetRating
    [Arguments]    ${result}
    Should Contain    ${result}    Receive_Request_From_Kafka|Consume_Message|Success|Success|qa.requestSetRating|consume|
    Should Contain    ${result}    Send_Request_To_Kafka|Produce_Message|Success|Success|qa.setRatingRequested|produce|20000
    Should Contain    ${result}    Send_Request_To_Kafka|Produce_Message_ProcessTime|||qa.setRatingRequested|produce|
    Should Contain    ${result}    Summary|Summary|Error|Error|||
    Should Contain    ${result}    Summary|Summary_ProcessTime|||||
    #nsb-set-agree-tc

AddNewSetAgreeTC20100
    [Arguments]    ${result}
    Should Contain    ${result}    Receive_Request_From_Kafka|Consume_Message|Success|Success|qa.requestSetAgreeTC|consume|
    Should Contain    ${result}    Send_Request_To_Mongo|Update_qaPrivacyProfile|Success|Success|qaPrivacyProfile|update|20000
    Should Contain    ${result}    Send_Request_To_Mongo|Update_qaPrivacyProfile_ProcessTime|||qaPrivacyProfile|update|
    Should Contain    ${result}    Send_Request_To_Kafka|Produce_Message|Success|Success|qa.setAgreeTCRequested2|produce|20000
    Should Contain    ${result}    Send_Request_To_Kafka|Produce_Message_ProcessTime|||qa.setAgreeTCRequested2|produce|
    Should Contain    ${result}    Summary|Summary|Success|Success|||
    Should Contain    ${result}    Summary|Summary_ProcessTime|||||

InsertSetAgreeTC20000
    [Arguments]    ${result}
    Should Contain    ${result}    Receive_Request_From_Kafka|Consume_Message|Success|Success|qa.requestSetAgreeTC|consume|
    Should Contain    ${result}    Send_Request_To_Mongo|Update_qaPrivacyProfile|Success|Success|qaPrivacyProfile|update|20000
    Should Contain    ${result}    Send_Request_To_Mongo|Update_qaPrivacyProfile_ProcessTime|||qaPrivacyProfile|update|
    Should Contain    ${result}    Send_Request_To_Kafka|Produce_Message|Success|Success|qa.setAgreeTCRequested2|produce|20000
    Should Contain    ${result}    Send_Request_To_Kafka|Produce_Message_ProcessTime|||qa.setAgreeTCRequested2|produce|
    Should Contain    ${result}    Summary|Summary|Success|Success|||
    Should Contain    ${result}    Summary|Summary_ProcessTime|||||

ErrorSetAgreeTC50000
    [Arguments]    ${result}
    Should Contain    ${result}    Receive_Request_From_Kafka|Consume_Message|Success|Success|qa.requestSetAgreeTC|consume|
    Should Contain    ${result}    Send_Request_To_Kafka|Produce_Message|Success|Success|qa.setAgreeTCRequested2|produce|20000
    Should Contain    ${result}    Send_Request_To_Kafka|Produce_Message_ProcessTime|||qa.setAgreeTCRequested2|produce|
    Should Contain    ${result}    Summary|Summary|Error|Error|||
    Should Contain    ${result}    Summary|Summary_ProcessTime|||||

StatSetCountMode
    [Arguments]    ${result}    ${DOS_Stat}    ${ServiceNameAPP}    ${Status}
    IF    "${Status}"=="SUCCESS"
    Should Contain    ${result}    ${DOS_Stat}|Receive_Request_From_Kafka|Consume_Message|Success|Success|${${ServiceNameAPP}}[Consume]|consume|
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Mongo|FindOne_${${ServiceNameAPP}}[MongoDB]_ProcessTime|||${${ServiceNameAPP}}[MongoDB]|read|
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Mongo|FindOne_${${ServiceNameAPP}}[MongoDB]|Success|Success|${${ServiceNameAPP}}[MongoDB]|read|20000
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Mongo|Update_${${ServiceNameAPP}}[MongoDB]|Success|Success|${${ServiceNameAPP}}[MongoDB]|update|20000
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Mongo|Update_${${ServiceNameAPP}}[MongoDB]_ProcessTime|||${${ServiceNameAPP}}[MongoDB]|update|
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Kafka|Produce_Message|Success|Success|${${ServiceNameAPP}}[Produce]|produce|20000
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Kafka|Produce_Message_ProcessTime|||${${ServiceNameAPP}}[Produce]|produce|
    Should Contain    ${result}    ${DOS_Stat}|Summary|Summary_ProcessTime|||||
    Should Contain    ${result}    ${DOS_Stat}|Summary|Summary|Success|Success|||
    ELSE IF    "${Status}"=="ERROR_DB40400"
    Should Contain    ${result}    ${DOS_Stat}|Receive_Request_From_Kafka|Consume_Message|Success|Success|${${ServiceNameAPP}}[Consume]|consume|
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Mongo|FindOne_${${ServiceNameAPP}}[MongoDB]_ProcessTime|||${${ServiceNameAPP}}[MongoDB]|read|
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Mongo|FindOne_${${ServiceNameAPP}}[MongoDB]|Error|mongo: no documents in result|${${ServiceNameAPP}}[MongoDB]|read|40400
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Kafka|Produce_Message|Success|Success|${${ServiceNameAPP}}[Produce]|produce|20000
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Kafka|Produce_Message_ProcessTime|||${${ServiceNameAPP}}[Produce]|produce|
    Should Contain    ${result}    ${DOS_Stat}|Summary|Summary_ProcessTime|||||
    Should Contain    ${result}    ${DOS_Stat}|Summary|Summary|Error|Error|||
    ELSE IF    "${Status}"=="ERROR_CONSUME"
    Should Contain    ${result}    ${DOS_Stat}|Receive_Request_From_Kafka|Consume_Message|Success|Success|${${ServiceNameAPP}}[Consume]|consume|
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Kafka|Produce_Message|Success|Success|${${ServiceNameAPP}}[Produce]|produce|20000
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Kafka|Produce_Message_ProcessTime|||${${ServiceNameAPP}}[Produce]|produce|
    Should Contain    ${result}    ${DOS_Stat}|Summary|Summary_ProcessTime|||||
    Should Contain    ${result}    ${DOS_Stat}|Summary|Summary|Error|Error|||
    BuiltIn.Should Not Contain    ${result}    ${DOS_Stat}|Send_Request_To_Mongo
    ELSE IF    "${Status}"=="ERROR_DB20000"
    Should Contain    ${result}    ${DOS_Stat}|Receive_Request_From_Kafka|Consume_Message|Success|Success|${${ServiceNameAPP}}[Consume]|consume|
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Mongo|FindOne_${${ServiceNameAPP}}[MongoDB]_ProcessTime|||${${ServiceNameAPP}}[MongoDB]|read|
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Mongo|FindOne_${${ServiceNameAPP}}[MongoDB]|Success|Success|${${ServiceNameAPP}}[MongoDB]|read|20000
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Kafka|Produce_Message|Success|Success|${${ServiceNameAPP}}[Produce]|produce|20000
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Kafka|Produce_Message_ProcessTime|||${${ServiceNameAPP}}[Produce]|produce|
    Should Contain    ${result}    ${DOS_Stat}|Summary|Summary_ProcessTime|||||
    Should Contain    ${result}    ${DOS_Stat}|Summary|Summary|Error|Error|||
    ELSE
    BuiltIn.Should Be True    "${Status}"=="Verify Stat Error"
    END

StatCheckAgreeTC
    [Arguments]    ${result}    ${DOS_Stat}    ${ServiceNameAPP}    ${Status}
    IF    "${Status}"=="SUCCESS"
    Should Contain    ${result}    ${DOS_Stat}|Receive_Request_From_Kafka|Consume_Message|Success|Success|${${ServiceNameAPP}}[Consume]|consume|
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Mongo|FindOne_${${ServiceNameAPP}}[MongoDB]|Success|Success|${${ServiceNameAPP}}[MongoDB]|read|20000
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Mongo|FindOne_${${ServiceNameAPP}}[MongoDB]_ProcessTime|||${${ServiceNameAPP}}[MongoDB]|read|
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Kafka|Produce_Message|Success|Success|${${ServiceNameAPP}}[Produce]|produce|20000
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Kafka|Produce_Message_ProcessTime|||${${ServiceNameAPP}}[Produce]|produce|
    Should Contain    ${result}    ${DOS_Stat}|Summary|Summary|Success|Success|||
    Should Contain    ${result}    ${DOS_Stat}|Summary|Summary_ProcessTime|||||
    ELSE IF    "${Status}"=="ERROR_DB40400"
    Should Contain    ${result}    ${DOS_Stat}|Receive_Request_From_Kafka|Consume_Message|Success|Success|${${ServiceNameAPP}}[Consume]|consume|
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Mongo|FindOne_${${ServiceNameAPP}}[MongoDB]|Error|mongo: no documents in result|${${ServiceNameAPP}}[MongoDB]|read|40400
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Mongo|FindOne_${${ServiceNameAPP}}[MongoDB]_ProcessTime|||${${ServiceNameAPP}}[MongoDB]|read|
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Kafka|Produce_Message|Success|Success|${${ServiceNameAPP}}[Produce]|produce|20000
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Kafka|Produce_Message_ProcessTime|||${${ServiceNameAPP}}[Produce]|produce|
    Should Contain    ${result}    ${DOS_Stat}|Summary|Summary|Error|Error|||
    Should Contain    ${result}    ${DOS_Stat}|Summary|Summary_ProcessTime|||||
    ELSE IF    "${Status}"=="ERROR_CONSUME"
    Should Contain    ${result}    ${DOS_Stat}|Receive_Request_From_Kafka|Consume_Message|Success|Success|${${ServiceNameAPP}}[Consume]|consume|
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Kafka|Produce_Message|Success|Success|${${ServiceNameAPP}}[Produce]|produce|20000
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Kafka|Produce_Message_ProcessTime|||${${ServiceNameAPP}}[Produce]|produce|
    Should Contain    ${result}    ${DOS_Stat}|Summary|Summary|Error|Error|||
    Should Contain    ${result}    ${DOS_Stat}|Summary|Summary_ProcessTime|||||
    BuiltIn.Should Not Contain    ${result}    ${DOS_Stat}|Send_Request_To_Mongo
    ELSE IF    "${Status}"=="ERROR_NULL"
    Should Contain    ${result}    ${DOS_Stat}|Receive_Request_From_Kafka|Consume_Message|Success|Success|${${ServiceNameAPP}}[Consume]|consume|
    Should Contain    ${result}    ${DOS_Stat}|Summary|Summary|Error|Error|||
    Should Contain    ${result}    ${DOS_Stat}|Summary|Summary_ProcessTime|||||
    BuiltIn.Should Not Contain    ${result}    ${DOS_Stat}|Send_Request_To_Mongo
    BuiltIn.Should Not Contain    ${result}    ${DOS_Stat}|Send_Request_To_Kafka|Produce
    ELSE
    BuiltIn.Should Be True    "${Status}"=="Verify Stat Error"
    END

StatSetAgreeTC
    [Arguments]    ${result}    ${DOS_Stat}    ${ServiceNameAPP}    ${Status}
    IF    "${Status}"=="SUCCESS"
    Should Contain    ${result}    ${DOS_Stat}|Receive_Request_From_Kafka|Consume_Message|Success|Success|${${ServiceNameAPP}}[Consume]|consume|
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Mongo|Update_${${ServiceNameAPP}}[MongoDB]|Success|Success|${${ServiceNameAPP}}[MongoDB]|update|20000
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Mongo|Update_${${ServiceNameAPP}}[MongoDB]_ProcessTime|||${${ServiceNameAPP}}[MongoDB]|update|
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Kafka|Produce_Message|Success|Success|${${ServiceNameAPP}}[Produce]|produce|20000
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Kafka|Produce_Message_ProcessTime|||${${ServiceNameAPP}}[Produce]|produce|
    Should Contain    ${result}    ${DOS_Stat}|Summary|Summary|Success|Success|||
    Should Contain    ${result}    ${DOS_Stat}|Summary|Summary_ProcessTime|||||
    ELSE IF    "${Status}"=="ERROR"
    Should Contain    ${result}    ${DOS_Stat}|Receive_Request_From_Kafka|Consume_Message|Success|Success|${${ServiceNameAPP}}[Consume]|consume|
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Kafka|Produce_Message|Success|Success|${${ServiceNameAPP}}[Produce]|produce|20000
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Kafka|Produce_Message_ProcessTime|||${${ServiceNameAPP}}[Produce]|produce|
    Should Contain    ${result}    ${DOS_Stat}|Summary|Summary|Error|Error|||
    Should Contain    ${result}    ${DOS_Stat}|Summary|Summary_ProcessTime|||||
    BuiltIn.Should Not Contain    ${result}    ${DOS_Stat}|Send_Request_To_Mongo
    ELSE
    BuiltIn.Should Be True    "${Status}"=="Verify Stat Error"
    END

StatSetRating
    [Arguments]    ${result}    ${DOS_Stat}    ${ServiceNameAPP}    ${Status}
    IF    "${Status}"=="SUCCESS"
    Should Contain    ${result}    ${DOS_Stat}|Receive_Request_From_Kafka|Consume_Message|Success|Success|${${ServiceNameAPP}}[Consume]|consume|
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Mongo|Update_${${ServiceNameAPP}}[MongoDB]|Success|Success|${${ServiceNameAPP}}[MongoDB]|update|20000
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Mongo|Update_${${ServiceNameAPP}}[MongoDB]_ProcessTime|||${${ServiceNameAPP}}[MongoDB]|update|
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Kafka|Produce_Message|Success|Success|${${ServiceNameAPP}}[Produce]|produce|20000
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Kafka|Produce_Message_ProcessTime|||${${ServiceNameAPP}}[Produce]|produce|
    Should Contain    ${result}    ${DOS_Stat}|Summary|Summary|Success|Success|||
    Should Contain    ${result}    ${DOS_Stat}|Summary|Summary_ProcessTime|||||
    ELSE IF    "${Status}"=="ERROR"
    Should Contain    ${result}    ${DOS_Stat}|Receive_Request_From_Kafka|Consume_Message|Success|Success|${${ServiceNameAPP}}[Consume]|consume|
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Kafka|Produce_Message|Success|Success|${${ServiceNameAPP}}[Produce]|produce|20000
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Kafka|Produce_Message_ProcessTime|||${${ServiceNameAPP}}[Produce]|produce|
    Should Contain    ${result}    ${DOS_Stat}|Summary|Summary|Error|Error|||
    Should Contain    ${result}    ${DOS_Stat}|Summary|Summary_ProcessTime|||||
    BuiltIn.Should Not Contain    ${result}    ${DOS_Stat}|Send_Request_To_Mongo
    ELSE
    BuiltIn.Should Be True    "${Status}"=="Verify Stat Error"
    END

StatNetworkStatus
    [Arguments]    ${result}    ${DOS_Stat}    ${ServiceNameAPP}    ${Status}
    IF    "${Status}"=="SUCCESS"
    Should Contain    ${result}    ${DOS_Stat}|Receive_Request_From_Kafka|Consume_Message|Success|Success|${${ServiceNameAPP}}[Consume]|consume|
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Mongo|FindOne_${${ServiceNameAPP}}[MongoDBProfilePaper]|Success|Success|${${ServiceNameAPP}}[MongoDBProfilePaper]|read|20000
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Mongo|FindOne_${${ServiceNameAPP}}[MongoDBProfilePaper]_ProcessTime|||${${ServiceNameAPP}}[MongoDBProfilePaper]|read|
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Mongo|FindOne_${${ServiceNameAPP}}[MongoDBPerformanceLevel]|Success|Success|${${ServiceNameAPP}}[MongoDBPerformanceLevel]|read|20000
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Mongo|FindOne_${${ServiceNameAPP}}[MongoDBPerformanceLevel]_ProcessTime|||${${ServiceNameAPP}}[MongoDBPerformanceLevel]|read|
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Mongo|FindOne_${${ServiceNameAPP}}[MongoDBNetworkQualityStatus]|Success|Success|${${ServiceNameAPP}}[MongoDBNetworkQualityStatus]|read|20000
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Mongo|FindOne_${${ServiceNameAPP}}[MongoDBNetworkQualityStatus]_ProcessTime|||${${ServiceNameAPP}}[MongoDBNetworkQualityStatus]|read|
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Mongo|Update_${${ServiceNameAPP}}[MongoDBNetworkStatusPaper]|Success|Success|${${ServiceNameAPP}}[MongoDBNetworkStatusPaper]|update|20000
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Mongo|Update_${${ServiceNameAPP}}[MongoDBNetworkStatusPaper]_ProcessTime|||${${ServiceNameAPP}}[MongoDBNetworkStatusPaper]|update|
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Kafka|Produce_Message|Success|Success|${${ServiceNameAPP}}[Produce]|produce|20000
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Kafka|Produce_Message_ProcessTime|||${${ServiceNameAPP}}[Produce]|produce|
    Should Contain    ${result}    ${DOS_Stat}|Summary|Summary|Success|Success|||
    Should Contain    ${result}    ${DOS_Stat}|Summary|Summary_ProcessTime|||||
    ELSE IF    "${Status}"=="SUCCESS_DB40400"
    Should Contain    ${result}    ${DOS_Stat}|Receive_Request_From_Kafka|Consume_Message|Success|Success|${${ServiceNameAPP}}[Consume]|consume|
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Mongo|FindOne_${${ServiceNameAPP}}[MongoDBProfilePaper]|Success|Success|${${ServiceNameAPP}}[MongoDBProfilePaper]|read|20000
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Mongo|FindOne_${${ServiceNameAPP}}[MongoDBProfilePaper]_ProcessTime|||${${ServiceNameAPP}}[MongoDBProfilePaper]|read|
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Mongo|FindOne_${${ServiceNameAPP}}[MongoDBPerformanceLevel]|Success|Success|${${ServiceNameAPP}}[MongoDBPerformanceLevel]|read|20000
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Mongo|FindOne_${${ServiceNameAPP}}[MongoDBPerformanceLevel]_ProcessTime|||${${ServiceNameAPP}}[MongoDBPerformanceLevel]|read|
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Mongo|FindOne_${${ServiceNameAPP}}[MongoDBNetworkQualityStatus]|Error|mongo: no documents in result|${${ServiceNameAPP}}[MongoDBNetworkQualityStatus]|read|40400
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Mongo|FindOne_${${ServiceNameAPP}}[MongoDBNetworkQualityStatus]_ProcessTime|||${${ServiceNameAPP}}[MongoDBNetworkQualityStatus]|read|
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Mongo|Update_${${ServiceNameAPP}}[MongoDBNetworkStatusPaper]|Success|Success|${${ServiceNameAPP}}[MongoDBNetworkStatusPaper]|update|20000
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Mongo|Update_${${ServiceNameAPP}}[MongoDBNetworkStatusPaper]_ProcessTime|||${${ServiceNameAPP}}[MongoDBNetworkStatusPaper]|update|
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Kafka|Produce_Message|Success|Success|${${ServiceNameAPP}}[Produce]|produce|20000
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Kafka|Produce_Message_ProcessTime|||${${ServiceNameAPP}}[Produce]|produce|
    Should Contain    ${result}    ${DOS_Stat}|Summary|Summary|Success|Success|||
    Should Contain    ${result}    ${DOS_Stat}|Summary|Summary_ProcessTime|||||
    ELSE IF    "${Status}"=="SUCCESS_DB_PER40400"
    Should Contain    ${result}    ${DOS_Stat}|Receive_Request_From_Kafka|Consume_Message|Success|Success|${${ServiceNameAPP}}[Consume]|consume|
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Mongo|FindOne_${${ServiceNameAPP}}[MongoDBProfilePaper]|Success|Success|${${ServiceNameAPP}}[MongoDBProfilePaper]|read|20000
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Mongo|FindOne_${${ServiceNameAPP}}[MongoDBProfilePaper]_ProcessTime|||${${ServiceNameAPP}}[MongoDBProfilePaper]|read|
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Mongo|FindOne_${${ServiceNameAPP}}[MongoDBPerformanceLevel]|Error|mongo: no documents in result|${${ServiceNameAPP}}[MongoDBPerformanceLevel]|read|40400
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Mongo|FindOne_${${ServiceNameAPP}}[MongoDBPerformanceLevel]_ProcessTime|||${${ServiceNameAPP}}[MongoDBPerformanceLevel]|read|
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Mongo|FindOne_${${ServiceNameAPP}}[MongoDBNetworkQualityStatus]|Success|Success|${${ServiceNameAPP}}[MongoDBNetworkQualityStatus]|read|20000
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Mongo|FindOne_${${ServiceNameAPP}}[MongoDBNetworkQualityStatus]_ProcessTime|||${${ServiceNameAPP}}[MongoDBNetworkQualityStatus]|read|
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Mongo|Update_${${ServiceNameAPP}}[MongoDBNetworkStatusPaper]|Success|Success|${${ServiceNameAPP}}[MongoDBNetworkStatusPaper]|update|20000
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Mongo|Update_${${ServiceNameAPP}}[MongoDBNetworkStatusPaper]_ProcessTime|||${${ServiceNameAPP}}[MongoDBNetworkStatusPaper]|update|
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Kafka|Produce_Message|Success|Success|${${ServiceNameAPP}}[Produce]|produce|20000
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Kafka|Produce_Message_ProcessTime|||${${ServiceNameAPP}}[Produce]|produce|
    Should Contain    ${result}    ${DOS_Stat}|Summary|Summary|Success|Success|||
    Should Contain    ${result}    ${DOS_Stat}|Summary|Summary_ProcessTime|||||
    ELSE IF    "${Status}"=="ERROR_MISSING_INVALID"
    Should Contain    ${result}    ${DOS_Stat}|Receive_Request_From_Kafka|Consume_Message|Success|Success|${${ServiceNameAPP}}[Consume]|consume|
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Mongo|Update_${${ServiceNameAPP}}[MongoDBNetworkStatusPaper]|Success|Success|${${ServiceNameAPP}}[MongoDBNetworkStatusPaper]|update|20000
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Mongo|Update_${${ServiceNameAPP}}[MongoDBNetworkStatusPaper]_ProcessTime|||${${ServiceNameAPP}}[MongoDBNetworkStatusPaper]|update|
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Kafka|Produce_Message|Success|Success|${${ServiceNameAPP}}[Produce]|produce|20000
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Kafka|Produce_Message_ProcessTime|||${${ServiceNameAPP}}[Produce]|produce|
    Should Contain    ${result}    ${DOS_Stat}|Summary|Summary|Success|Success|||
    Should Contain    ${result}    ${DOS_Stat}|Summary|Summary_ProcessTime|||||
    BuiltIn.Should Not Contain    ${result}    ${DOS_Stat}|Send_Request_To_Mongo|FindOne_
    ELSE
    BuiltIn.Should Be True    "${Status}"=="Verify Stat Error"
    END

StatNetworkStatusProblem
    [Arguments]    ${result}    ${DOS_Stat}    ${ServiceNameAPP}    ${Status}
    IF    "${Status}"=="SUCCESS"
    Should Contain    ${result}    ${DOS_Stat}|Receive_Request_From_Kafka|Consume_Message|Success|Success|${${ServiceNameAPP}}[Consume]|consume|
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Mongo|FindOne_${${ServiceNameAPP}}[MongoDB]_ProcessTime|||${${ServiceNameAPP}}[MongoDB]|read|
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Mongo|FindOne_${${ServiceNameAPP}}[MongoDB]|Success|Success|${${ServiceNameAPP}}[MongoDB]|read|20000
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Mongo|DeleteOne_${${ServiceNameAPP}}[MongoDB]|Success|Success|${${ServiceNameAPP}}[MongoDB]|delete|20000
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Mongo|DeleteOne_${${ServiceNameAPP}}[MongoDB]_ProcessTime|||${${ServiceNameAPP}}[MongoDB]|delete|
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Kafka|Produce_Message|Success|Success|${${ServiceNameAPP}}[Produce]|produce|20000
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Kafka|Produce_Message_ProcessTime|||${${ServiceNameAPP}}[Produce]|produce|
    Should Contain    ${result}    ${DOS_Stat}|Summary|Summary_ProcessTime|||||
    Should Contain    ${result}    ${DOS_Stat}|Summary|Summary|Success|Success|||
    ELSE IF    "${Status}"=="ERROR"
    Should Contain    ${result}    ${DOS_Stat}|Receive_Request_From_Kafka|Consume_Message|Success|Success|${${ServiceNameAPP}}[Consume]|consume|
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Mongo|FindOne_${${ServiceNameAPP}}[MongoDB]_ProcessTime|||${${ServiceNameAPP}}[MongoDB]|read|
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Mongo|FindOne_${${ServiceNameAPP}}[MongoDB]|Success|Success|${${ServiceNameAPP}}[MongoDB]|read|20000
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Mongo|DeleteOne_${${ServiceNameAPP}}[MongoDB]|Success|Success|${${ServiceNameAPP}}[MongoDB]|delete|20000
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Mongo|DeleteOne_${${ServiceNameAPP}}[MongoDB]_ProcessTime|||${${ServiceNameAPP}}[MongoDB]|delete|
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Kafka|Produce_Message|Success|Success|${${ServiceNameAPP}}[Produce]|produce|20000
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Kafka|Produce_Message_ProcessTime|||${${ServiceNameAPP}}[Produce]|produce|
    Should Contain    ${result}    ${DOS_Stat}|Summary|Summary|Error|Error|||
    Should Contain    ${result}    ${DOS_Stat}|Summary|Summary_ProcessTime|||||
    ELSE IF    "${Status}"=="ERROR_NOTFOUND_DB"
    Should Contain    ${result}    ${DOS_Stat}|Receive_Request_From_Kafka|Consume_Message|Success|Success|${${ServiceNameAPP}}[Consume]|consume|
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Mongo|FindOne_${${ServiceNameAPP}}[MongoDB]_ProcessTime|||${${ServiceNameAPP}}[MongoDB]|read|
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Mongo|FindOne_${${ServiceNameAPP}}[MongoDB]|Error|mongo: no documents in result|${${ServiceNameAPP}}[MongoDB]|read|40400
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Kafka|Produce_Message|Success|Success|${${ServiceNameAPP}}[Produce]|produce|20000
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Kafka|Produce_Message_ProcessTime|||${${ServiceNameAPP}}[Produce]|produce|
    Should Contain    ${result}    ${DOS_Stat}|Summary|Summary_ProcessTime|||||
    Should Contain    ${result}    ${DOS_Stat}|Summary|Summary|Error|Error|||
    BuiltIn.Should Not Contain    ${result}    ${DOS_Stat}|Send_Request_To_Mongo|DeleteOne_
    ELSE IF    "${Status}"=="ERROR_MISSING_INVALID"
    Should Contain    ${result}    ${DOS_Stat}|Receive_Request_From_Kafka|Consume_Message|Success|Success|${${ServiceNameAPP}}[Consume]|consume|
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Kafka|Produce_Message|Success|Success|${${ServiceNameAPP}}[Produce]|produce|20000
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Kafka|Produce_Message_ProcessTime|||${${ServiceNameAPP}}[Produce]|produce|
    Should Contain    ${result}    ${DOS_Stat}|Summary|Summary_ProcessTime|||||
    Should Contain    ${result}    ${DOS_Stat}|Summary|Summary|Error|Error|||
    BuiltIn.Should Not Contain    ${result}    ${DOS_Stat}|Send_Request_To_Mongo
    ELSE
    BuiltIn.Should Be True    "${Status}"=="Verify Stat Error"
    END

StatCheckProfile
    [Arguments]    ${result}    ${DOS_Stat}    ${ServiceNameAPP}    ${Status}
    IF    "${Status}"=="SUCCESS"
    Should Contain    ${result}    ${DOS_Stat}|Receive_Request_From_Kafka|Consume_Message|Success|Success|${${ServiceNameAPP}}[Consume]|consume|
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Server|POST|Success|Success||POST|20000
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Server|POST_ProcessTime||||POST|
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Mongo|FindOne_${${ServiceNameAPP}}[MongoDB]|Success|Success|${${ServiceNameAPP}}[MongoDB]|read|20000
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Mongo|FindOne_${${ServiceNameAPP}}[MongoDB]_ProcessTime|||${${ServiceNameAPP}}[MongoDB]|read|
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Mongo|Update_${${ServiceNameAPP}}[MongoDB]|Success|Success|${${ServiceNameAPP}}[MongoDB]|update|20000
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Mongo|Update_${${ServiceNameAPP}}[MongoDB]_ProcessTime|||${${ServiceNameAPP}}[MongoDB]|update|
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Kafka|Produce_Message|Success|Success|${${ServiceNameAPP}}[Produce]|produce|20000
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Kafka|Produce_Message_ProcessTime|||${${ServiceNameAPP}}[Produce]|produce|
    Should Contain    ${result}    ${DOS_Stat}|Summary|Summary|Success|Success|||
    Should Contain    ${result}    ${DOS_Stat}|Summary|Summary_ProcessTime|||||
    ELSE IF    "${Status}"=="SUCCESS_DB40400"
    Should Contain    ${result}    value|typeline|dos|event|method|status|message|tableName|tableMethod|tableResultCode
    Should Contain    ${result}    ${DOS_Stat}|Summary|Summary_ProcessTime|||||    
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Server|POST|Success|Success||POST|20000
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Kafka|Produce_Message_ProcessTime|||${${ServiceNameAPP}}[Produce]|produce|
    Should Contain    ${result}    ${DOS_Stat}|Receive_Request_From_Kafka|Consume_Message|Success|Success|${${ServiceNameAPP}}[Consume]|consume|    
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Server|POST_ProcessTime||||POST|
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Mongo|FindOne_${${ServiceNameAPP}}[MongoDB]|Error|mongo: no documents in result|${${ServiceNameAPP}}[MongoDB]|read|40400
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Mongo|FindOne_${${ServiceNameAPP}}[MongoDB]_ProcessTime|||${${ServiceNameAPP}}[MongoDB]|read|
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Mongo|Update_${${ServiceNameAPP}}[MongoDB]|Success|Success|${${ServiceNameAPP}}[MongoDB]|update|20000
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Mongo|Update_${${ServiceNameAPP}}[MongoDB]_ProcessTime|||${${ServiceNameAPP}}[MongoDB]|update|
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Kafka|Produce_Message|Success|Success|${${ServiceNameAPP}}[Produce]|produce|20000
    Should Contain    ${result}    ${DOS_Stat}|Summary|Summary|Success|Success|||
    ELSE IF    "${Status}"=="ERROR_Req_MISSING_INVALID"
    Should Contain    ${result}    ${DOS_Stat}|Receive_Request_From_Kafka|Consume_Message|Success|Success|${${ServiceNameAPP}}[Consume]|consume|
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Kafka|Produce_Message|Success|Success|${${ServiceNameAPP}}[Produce]|produce|20000
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Kafka|Produce_Message_ProcessTime|||${${ServiceNameAPP}}[Produce]|produce|
    Should Contain    ${result}    ${DOS_Stat}|Summary|Summary|Error|Error|||
    Should Contain    ${result}    ${DOS_Stat}|Summary|Summary_ProcessTime|||||    
    ELSE IF    "${Status}"=="ERROR_AC_MISSING_INVALID"
    Should Contain    ${result}    ${DOS_Stat}|Receive_Request_From_Kafka|Consume_Message|Success|Success|${${ServiceNameAPP}}[Consume]|consume|
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Kafka|Produce_Message|Success|Success|${${ServiceNameAPP}}[Produce]|produce|20000
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Kafka|Produce_Message_ProcessTime|||${${ServiceNameAPP}}[Produce]|produce|  
    Should Contain    ${result}    ${DOS_Stat}|Send_Request_To_Server|POST|Success|Success||POST|20000
    Should Contain    ${result}    ${DOS_Stat}|Summary|Summary|Error|Error|||
    Should Contain    ${result}    ${DOS_Stat}|Summary|Summary_ProcessTime|||||
    BuiltIn.Should Not Contain    ${result}    ${DOS_Stat}|Send_Request_To_Mongo|FindOne_
    ELSE
    BuiltIn.Should Be True    "${Status}"=="Verify Stat Error"
    END
