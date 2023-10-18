*** Variables ***
#Common
${NameCmdFileLog_setRating}    DMASTERSQA0001_MFAF_2023
${PathLogsetRating}    /home/serveradm/nsb/service-set-rating/logs
${CmdDeleteMassage_qa.setRatingRequested}    /app/kafka/kafka_2.13-3.2.3/bin/kafka-delete-records.sh    --bootstrap-server DMYAISNSB-0002:9093    --command-config /app/kafka/kafka_2.13-3.2.3/config/admin-sasl.properties --offset-json-file /home/serveradm/delete-qa.setRatingRequested.json
${Consume_qa.setRatingRequested}    /app/kafka/kafka_2.13-3.2.3/bin/kafka-console-consumer.sh --bootstrap-server DMYAISNSB-0002:9093 --consumer.config /app/kafka/kafka_2.13-3.2.3/config/admin-sasl.properties --topic qa.setRatingRequested --from-beginning
${CmdProduce_qa.requestSetRating}    /app/kafka/kafka_2.13-3.2.3/bin/kafka-console-producer.sh --bootstrap-server DMYAISNSB-0002:9093 --producer.config /app/kafka/kafka_2.13-3.2.3/config/admin-sasl.properties --topic qa.requestSetRating
${NameCmdFileLog_CheckAgreeTCDebug}    service-set-rating.log
${CollactionNameSetRatingLevel}    qaSetRatingLevel

#JsonDB
${JsonInsert_TST_F12_1_1_008}    {"id":"TST_F12_1_1_008","msisdn":"66836077811","ratingLevel":4,"reason":"Good","suggestion":"สัญญาณเน็ตดีค่ะ_Good"}
