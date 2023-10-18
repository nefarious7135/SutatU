*** Variables ***
${Consume_dev.5GModeActivated}    /app/kafka/kafka_2.13-3.2.3/bin/kafka-console-consumer.sh --bootstrap-server DMYAISNSB-0001:9093,DMYAISNSB-0002:9093,DMYAISNSB-0003:9093 --consumer.config /app/kafka/kafka_2.13-3.2.3/config/client-ssl.properties --topic dev.5GModeActivated --from-beginning
${Consume_dev.activate5GMode}    /app/kafka/kafka_2.13-3.2.3/bin/kafka-console-consumer.sh --bootstrap-server DMYAISNSB-0001:9093,DMYAISNSB-0002:9093,DMYAISNSB-0003:9093 --consumer.config /app/kafka/kafka_2.13-3.2.3/config/client-ssl.properties --topic dev.activate5GMode --from-beginning
${delete_dev.5GModeActivated}    /app/kafka/kafka_2.13-3.2.3/bin/kafka-console-consumer.sh --bootstrap-server DMYAISNSB-0001:9093,DMYAISNSB-0002:9093,DMYAISNSB-0003:9093 --consumer.config /app/kafka/kafka_2.13-3.2.3/config/client-ssl.properties --topic dev.5GModeActivated --from-beginning
${Produce_dev.activate5GMode}    /app/kafka/kafka_2.13-3.2.3/bin/kafka-console-producer.sh --bootstrap-server DMYAISNSB-0001:9093,DMYAISNSB-0002:9093,DMYAISNSB-0003:9093 --producer.config /app/kafka/kafka_2.13-3.2.3/config/client-ssl.properties --topic dev.activate5GMode
${Consume_qa.5GModeActivated}    /app/kafka/kafka_2.13-3.2.3/bin/kafka-console-consumer.sh --bootstrap-server DMYAISNSB-0001:9093,DMYAISNSB-0002:9093,DMYAISNSB-0003:9093 --consumer.config /app/kafka/kafka_2.13-3.2.3/config/client-ssl.properties --topic qa.5GModeActivated --from-beginning
${Consume_qa.activate5GMode}    /app/kafka/kafka_2.13-3.2.3/bin/kafka-console-consumer.sh --bootstrap-server DMYAISNSB-0001:9093,DMYAISNSB-0002:9093,DMYAISNSB-0003:9093 --consumer.config /app/kafka/kafka_2.13-3.2.3/config/client-ssl.properties --topic qa.activate5GMode --from-beginning
${delete_qa.5GModeActivated}    /app/kafka/kafka_2.13-3.2.3/bin/kafka-delete-records.sh \ --bootstrap-server DMYAISNSB-0001:9093,DMYAISNSB-0002:9093,DMYAISNSB-0003:9093 \ --command-config /app/kafka/kafka_2.13-3.2.3/config/client-ssl.properties --offset-json-file /home/serveradm/delete-qa.5GModeActivated.json
${Produce_qa.activate5GMode}    /app/kafka/kafka_2.13-3.2.3/bin/kafka-console-producer.sh --bootstrap-server DMYAISNSB-0001:9093,DMYAISNSB-0002:9093,DMYAISNSB-0003:9093 --producer.config /app/kafka/kafka_2.13-3.2.3/config/client-ssl.properties --topic qa.activate5GMode
${PathLogActivate5GMode}    /app/mfaf/network-service-bus/5g-mode-service-activation/logs
${NameCommandFileLog}    CSLIVINGNWA002_5g-mode-service-activation_
${NameCommandFileLogChkAddPack}    5g-mode-service-activation.debug
#Anti Corrupt Resonse
${PathConfigAntiCorruptResponse_Default}    /app/mockup/http_mockup/configs/response/addPackage/default.json
${PathConfigAntiCorruptResponse_Success}    /app/mockup/http_mockup/configs/response/addPackage/success.json
${PathConfigAntiCorruptResponse_Timeout}    /app/mockup/http_mockup/configs/response/addPackage/timeout.json
${PathConfigAntiCorruptResponse_Data_Not_Found}    /app/mockup/http_mockup/configs/response/addPackage/data_not_found.json
${PathConfigAntiCorruptResponse_Missing_or_Invalid}    /app/mockup/http_mockup/configs/response/addPackage/missing_or_invalid.json
${PathConfigAntiCorruptResponse_System_Error}    /app/mockup/http_mockup/configs/response/addPackage/system_error.json
${PathConfigAntiCorruptResponse_TST_F13_0_1_031}    /app/mockup/http_mockup/configs/response/addPackage/missing_resultCode.json
${PathConfigAntiCorruptResponse_TST_F13_0_1_032}    /app/mockup/http_mockup/configs/response/addPackage/null_resultCode.json
