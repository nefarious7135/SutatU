*** Settings ***
Resource          ../../Keyword/Common.robot
Resource          ../../Keyword/MongoDB.robot
Resource          ../../Keyword/SecureCRT.robot
Resource          ../../Valiables/CommonValiable/CommonValiable.robot
Resource          Variable.robot
*** Test Cases ***
TST_F15_1_1_001
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCmdFileLog_ServiceAuthentication}    ${PathLogServiceAuthentication}
    #Set AC Response
    SetMockupResponse    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_TST_F15_1_1_001}
    #produce kafka : requestAccessToken
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    Produce Kafka    ${CmdDelete_accessTokenRequested}    ${CmdProduce_requestAccessToken}    ${DataProduce_TST_F15_1_1_001}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ${ConsumeResult}    Consume Kafka    ${CmdConsume_accessTokenRequested}    TST_F15_1_1_001
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F15_1_1_001}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    Flush Log by Command Name    ${NameCmdFileLog_ServiceAuthentication}    TST_F15_1_1_001    ${PathLogServiceAuthentication}
    [Teardown]    Close All Connections

TST_F15_1_1_002
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCmdFileLog_ServiceAuthentication}    ${PathLogServiceAuthentication}
    #Set AC Response
    SetMockupResponse    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_TST_F15_1_1_002}
    #produce kafka : requestAccessToken
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    Produce Kafka    ${CmdDelete_accessTokenRequested}    ${CmdProduce_requestAccessToken}    ${DataProduce_TST_F15_1_1_002}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ${ConsumeResult}    Consume Kafka    ${CmdConsume_accessTokenRequested}    TST_F15_1_1_002
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F15_1_1_002}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    Flush Log by Command Name    ${NameCmdFileLog_ServiceAuthentication}    TST_F15_1_1_002    ${PathLogServiceAuthentication}
    [Teardown]    Close All Connections

TST_F15_1_1_003
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCmdFileLog_ServiceAuthentication}    ${PathLogServiceAuthentication}
    #Set AC Response
    SetMockupResponse    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_TST_F15_1_1_003}
    #produce kafka : requestAccessToken
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    Produce Kafka    ${CmdDelete_accessTokenRequested}    ${CmdProduce_requestAccessToken}    ${DataProduce_TST_F15_1_1_003}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ${ConsumeResult}    Consume Kafka    ${CmdConsume_accessTokenRequested}    TST_F15_1_1_003
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F15_1_1_003}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    Flush Log by Command Name    ${NameCmdFileLog_ServiceAuthentication}    TST_F15_1_1_003    ${PathLogServiceAuthentication}
    [Teardown]    Close All Connections

TST_F15_1_1_004
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCmdFileLog_ServiceAuthentication}    ${PathLogServiceAuthentication}
    #Set AC Response
    SetMockupResponse    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_TST_F15_1_1_004}
    #produce kafka : requestAccessToken
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    Produce Kafka    ${CmdDelete_accessTokenRequested}    ${CmdProduce_requestAccessToken}    ${DataProduce_TST_F15_1_1_004}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ${ConsumeResult}    Consume Kafka    ${CmdConsume_accessTokenRequested}    TST_F15_1_1_004
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F15_1_1_004}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    Flush Log by Command Name    ${NameCmdFileLog_ServiceAuthentication}    TST_F15_1_1_004    ${PathLogServiceAuthentication}
    [Teardown]    Close All Connections

TST_F15_1_1_005
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCmdFileLog_ServiceAuthentication}    ${PathLogServiceAuthentication}
    #Set AC Response
    SetMockupResponse    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_TST_F15_1_1_005}
    #produce kafka : requestAccessToken
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    Produce Kafka    ${CmdDelete_accessTokenRequested}    ${CmdProduce_requestAccessToken}    ${DataProduce_TST_F15_1_1_005}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ${ConsumeResult}    Consume Kafka    ${CmdConsume_accessTokenRequested}    TST_F15_1_1_005
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F15_1_1_005}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    Flush Log by Command Name    ${NameCmdFileLog_ServiceAuthentication}    TST_F15_1_1_005    ${PathLogServiceAuthentication}
    [Teardown]    Close All Connections

TST_F15_1_1_006
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCmdFileLog_ServiceAuthentication}    ${PathLogServiceAuthentication}
    #Set AC Response
    SetMockupResponse    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_TST_F15_1_1_006}
    #produce kafka : requestAccessToken
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    Produce Kafka    ${CmdDelete_accessTokenRequested}    ${CmdProduce_requestAccessToken}    ${DataProduce_TST_F15_1_1_006}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ${ConsumeResult}    Consume Kafka    ${CmdConsume_accessTokenRequested}    TST_F15_1_1_006
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F15_1_1_006}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    Flush Log by Command Name    ${NameCmdFileLog_ServiceAuthentication}    TST_F15_1_1_006    ${PathLogServiceAuthentication}
    [Teardown]    Close All Connections

TST_F15_1_1_007
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCmdFileLog_ServiceAuthentication}    ${PathLogServiceAuthentication}
    #Set AC Response
    SetMockupResponse    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_TST_F15_1_1_007}
    #produce kafka : requestAccessToken
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    Produce Kafka    ${CmdDelete_accessTokenRequested}    ${CmdProduce_requestAccessToken}    ${DataProduce_TST_F15_1_1_007}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ${ConsumeResult}    Consume Kafka    ${CmdConsume_accessTokenRequested}    TST_F15_1_1_007
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F15_1_1_007}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    Flush Log by Command Name    ${NameCmdFileLog_ServiceAuthentication}    TST_F15_1_1_007    ${PathLogServiceAuthentication}
    [Teardown]    Close All Connections

TST_F15_1_1_008
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCmdFileLog_ServiceAuthentication}    ${PathLogServiceAuthentication}
    #Set AC Response
    SetMockupResponse    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_TST_F15_1_1_008}
    #produce kafka : requestAccessToken
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    Produce Kafka    ${CmdDelete_accessTokenRequested}    ${CmdProduce_requestAccessToken}    ${DataProduce_TST_F15_1_1_008}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ${ConsumeResult}    Consume Kafka    ${CmdConsume_accessTokenRequested}    TST_F15_1_1_008
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F15_1_1_008}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    Flush Log by Command Name    ${NameCmdFileLog_ServiceAuthentication}    TST_F15_1_1_008    ${PathLogServiceAuthentication}
    [Teardown]    Close All Connections

TST_F15_1_1_009
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCmdFileLog_ServiceAuthentication}    ${PathLogServiceAuthentication}
    #Set AC Response
    SetMockupResponse    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_TST_F15_1_1_009}
    #produce kafka : requestAccessToken
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    Produce Kafka    ${CmdDelete_accessTokenRequested}    ${CmdProduce_requestAccessToken}    ${DataProduce_TST_F15_1_1_009}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ${ConsumeResult}    Consume Kafka    ${CmdConsume_accessTokenRequested}    TST_F15_1_1_009
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F15_1_1_009}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    Flush Log by Command Name    ${NameCmdFileLog_ServiceAuthentication}    TST_F15_1_1_009    ${PathLogServiceAuthentication}
    [Teardown]    Close All Connections

TST_F15_1_1_010
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCmdFileLog_ServiceAuthentication}    ${PathLogServiceAuthentication}
    #Set AC Response
    SetMockupResponse    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_TST_F15_1_1_010}
    #produce kafka : requestAccessToken
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    Produce Kafka    ${CmdDelete_accessTokenRequested}    ${CmdProduce_requestAccessToken}    ${DataProduce_TST_F15_1_1_010}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ${ConsumeResult}    Consume Kafka    ${CmdConsume_accessTokenRequested}    TST_F15_1_1_010
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F15_1_1_010}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    Flush Log by Command Name    ${NameCmdFileLog_ServiceAuthentication}    TST_F15_1_1_010    ${PathLogServiceAuthentication}
    [Teardown]    Close All Connections

TST_F15_1_1_011
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCmdFileLog_ServiceAuthentication}    ${PathLogServiceAuthentication}
    #Set AC Response
    SetMockupResponse    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_TST_F15_1_1_011}
    #produce kafka : requestAccessToken
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    Produce Kafka    ${CmdDelete_accessTokenRequested}    ${CmdProduce_requestAccessToken}    ${DataProduce_TST_F15_1_1_011}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ${ConsumeResult}    Consume Kafka    ${CmdConsume_accessTokenRequested}    TST_F15_1_1_011
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F15_1_1_011}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    Flush Log by Command Name    ${NameCmdFileLog_ServiceAuthentication}    TST_F15_1_1_011    ${PathLogServiceAuthentication}
    [Teardown]    Close All Connections

TST_F15_1_1_012
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCmdFileLog_ServiceAuthentication}    ${PathLogServiceAuthentication}
    #Set AC Response
    SetMockupResponse    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_TST_F15_1_1_012}
    #produce kafka : requestAccessToken
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    Produce Kafka    ${CmdDelete_accessTokenRequested}    ${CmdProduce_requestAccessToken}    ${DataProduce_TST_F15_1_1_012}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ${ConsumeResult}    Consume Kafka    ${CmdConsume_accessTokenRequested}    TST_F15_1_1_012
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F15_1_1_012}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    Flush Log by Command Name    ${NameCmdFileLog_ServiceAuthentication}    TST_F15_1_1_012    ${PathLogServiceAuthentication}
    [Teardown]    Close All Connections

TST_F15_1_1_013
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCmdFileLog_ServiceAuthentication}    ${PathLogServiceAuthentication}
    #Set AC Response
    SetMockupResponse    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_TST_F15_1_1_013}
    #produce kafka : requestAccessToken
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    Produce Kafka    ${CmdDelete_accessTokenRequested}    ${CmdProduce_requestAccessToken}    ${DataProduce_TST_F15_1_1_013}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ${ConsumeResult}    Consume Kafka    ${CmdConsume_accessTokenRequested}    TST_F15_1_1_013
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F15_1_1_013}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    Flush Log by Command Name    ${NameCmdFileLog_ServiceAuthentication}    TST_F15_1_1_013    ${PathLogServiceAuthentication}
    [Teardown]    Close All Connections

TST_F15_1_1_014
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCmdFileLog_ServiceAuthentication}    ${PathLogServiceAuthentication}
    #Set AC Response
    SetMockupResponse    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_TST_F15_1_1_014}
    #produce kafka : requestAccessToken
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    Produce Kafka    ${CmdDelete_accessTokenRequested}    ${CmdProduce_requestAccessToken}    ${DataProduce_TST_F15_1_1_014}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ${ConsumeResult}    Consume Kafka    ${CmdConsume_accessTokenRequested}    TST_F15_1_1_014
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F15_1_1_014}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    Flush Log by Command Name    ${NameCmdFileLog_ServiceAuthentication}    TST_F15_1_1_014    ${PathLogServiceAuthentication}
    [Teardown]    Close All Connections

TST_F15_1_1_015
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCmdFileLog_ServiceAuthentication}    ${PathLogServiceAuthentication}
    #Set AC Response
    SetMockupResponse    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_TST_F15_1_1_015}
    #produce kafka : requestAccessToken
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    Produce Kafka    ${CmdDelete_accessTokenRequested}    ${CmdProduce_requestAccessToken}    ${DataProduce_TST_F15_1_1_015}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ${ConsumeResult}    Consume Kafka    ${CmdConsume_accessTokenRequested}    TST_F15_1_1_015
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F15_1_1_015}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    Flush Log by Command Name    ${NameCmdFileLog_ServiceAuthentication}    TST_F15_1_1_015    ${PathLogServiceAuthentication}
    [Teardown]    Close All Connections

TST_F15_1_1_016
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCmdFileLog_ServiceAuthentication}    ${PathLogServiceAuthentication}
    #Set AC Response
    SetMockupResponse    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_TST_F15_1_1_016}
    #produce kafka : requestAccessToken
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    Produce Kafka    ${CmdDelete_accessTokenRequested}    ${CmdProduce_requestAccessToken}    ${DataProduce_TST_F15_1_1_016}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ${ConsumeResult}    Consume Kafka    ${CmdConsume_accessTokenRequested}    TST_F15_1_1_016
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F15_1_1_016}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    Flush Log by Command Name    ${NameCmdFileLog_ServiceAuthentication}    TST_F15_1_1_002    ${PathLogServiceAuthentication}
    [Teardown]    Close All Connections

TST_F15_1_1_017
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCmdFileLog_ServiceAuthentication}    ${PathLogServiceAuthentication}
    #Set AC Response
    SetMockupResponse    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_TST_F15_1_1_017}
    #produce kafka : requestAccessToken
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    Produce Kafka    ${CmdDelete_accessTokenRequested}    ${CmdProduce_requestAccessToken}    ${DataProduce_TST_F15_1_1_017}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ${ConsumeResult}    Consume Kafka    ${CmdConsume_accessTokenRequested}    TST_F15_1_1_017
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F15_1_1_017}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    Flush Log by Command Name    ${NameCmdFileLog_ServiceAuthentication}    TST_F15_1_1_017    ${PathLogServiceAuthentication}
    [Teardown]    Close All Connections

TST_F15_1_1_018
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCmdFileLog_ServiceAuthentication}    ${PathLogServiceAuthentication}
    #Set AC Response
    SetMockupResponse    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_TST_F15_1_1_018}
    #produce kafka : requestAccessToken
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    Produce Kafka    ${CmdDelete_accessTokenRequested}    ${CmdProduce_requestAccessToken}    ${DataProduce_TST_F15_1_1_018}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ${ConsumeResult}    Consume Kafka    ${CmdConsume_accessTokenRequested}    TST_F15_1_1_018
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F15_1_1_018}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    Flush Log by Command Name    ${NameCmdFileLog_ServiceAuthentication}    TST_F15_1_1_018    ${PathLogServiceAuthentication}
    [Teardown]    Close All Connections

TST_F15_1_1_019
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCmdFileLog_ServiceAuthentication}    ${PathLogServiceAuthentication}
    #Set AC Response
    SetMockupResponse    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_TST_F15_1_1_019}
    #produce kafka : requestAccessToken
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    Produce Kafka    ${CmdDelete_accessTokenRequested}    ${CmdProduce_requestAccessToken}    ${DataProduce_TST_F15_1_1_019}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ${ConsumeResult}    Consume Kafka    ${CmdConsume_accessTokenRequested}    TST_F15_1_1_019
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F15_1_1_019}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    Flush Log by Command Name    ${NameCmdFileLog_ServiceAuthentication}    TST_F15_1_1_019    ${PathLogServiceAuthentication}
    [Teardown]    Close All Connections

TST_F15_0_1_050
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCmdFileLog_ServiceAuthentication}    ${PathLogServiceAuthentication}
    #Set AC Response
    SetMockupResponse    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_TST_F15_0_1_050}
    #produce kafka : requestAccessToken
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    Produce Kafka    ${CmdDelete_accessTokenRequested}    ${CmdProduce_requestAccessToken}    ${DataProduce_TST_F15_0_1_050}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ${ConsumeResult}    Consume Kafka    ${CmdConsume_accessTokenRequested}    TST_F15_0_1_050
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F15_0_1_050}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    Flush Log by Command Name    ${NameCmdFileLog_ServiceAuthentication}    TST_F15_0_1_050    ${PathLogServiceAuthentication}
    [Teardown]    Close All Connections

TST_F15_0_1_051
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCmdFileLog_ServiceAuthentication}    ${PathLogServiceAuthentication}
    #Set AC Response
    SetMockupResponse    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_TST_F15_0_1_051}
    #produce kafka : requestAccessToken
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    Produce Kafka    ${CmdDelete_accessTokenRequested}    ${CmdProduce_requestAccessToken}    ${DataProduce_TST_F15_0_1_051}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ${ConsumeResult}    Consume Kafka    ${CmdConsume_accessTokenRequested}    TST_F15_0_1_051
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F15_0_1_051}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    Flush Log by Command Name    ${NameCmdFileLog_ServiceAuthentication}    TST_F15_0_1_051    ${PathLogServiceAuthentication}
    [Teardown]    Close All Connections

TST_F15_0_1_052
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCmdFileLog_ServiceAuthentication}    ${PathLogServiceAuthentication}
    #Set AC Response
    SetMockupResponse    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_TST_F15_0_1_052}
    #produce kafka : requestAccessToken
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    Produce Kafka    ${CmdDelete_accessTokenRequested}    ${CmdProduce_requestAccessToken}    ${DataProduce_TST_F15_0_1_052}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ${ConsumeResult}    Consume Kafka    ${CmdConsume_accessTokenRequested}    TST_F15_0_1_052
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F15_0_1_052}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    Flush Log by Command Name    ${NameCmdFileLog_ServiceAuthentication}    TST_F15_0_1_052    ${PathLogServiceAuthentication}
    [Teardown]    Close All Connections

TST_F15_0_1_053
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCmdFileLog_ServiceAuthentication}    ${PathLogServiceAuthentication}
    #Set AC Response
    SetMockupResponse    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_TST_F15_0_1_053}
    #produce kafka : requestAccessToken
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    Produce Kafka    ${CmdDelete_accessTokenRequested}    ${CmdProduce_requestAccessToken}    ${DataProduce_TST_F15_0_1_053}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ${ConsumeResult}    Consume Kafka    ${CmdConsume_accessTokenRequested}    TST_F15_0_1_053
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F15_0_1_053}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    Flush Log by Command Name    ${NameCmdFileLog_ServiceAuthentication}    TST_F15_0_1_053    ${PathLogServiceAuthentication}
    [Teardown]    Close All Connections

TST_F15_0_1_054
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCmdFileLog_ServiceAuthentication}    ${PathLogServiceAuthentication}
    #Set AC Response
    SetMockupResponse    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_TST_F15_0_1_054}
    #produce kafka : requestAccessToken
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    Produce Kafka    ${CmdDelete_accessTokenRequested}    ${CmdProduce_requestAccessToken}    ${DataProduce_TST_F15_0_1_054}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ${ConsumeResult}    Consume Kafka    ${CmdConsume_accessTokenRequested}    TST_F15_0_1_054
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F15_0_1_054}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    Flush Log by Command Name    ${NameCmdFileLog_ServiceAuthentication}    TST_F15_0_1_054    ${PathLogServiceAuthentication}
    [Teardown]    Close All Connections

TST_F15_0_1_055
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCmdFileLog_ServiceAuthentication}    ${PathLogServiceAuthentication}
    #Set AC Response
    SetMockupResponse    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_TST_F15_0_1_055}
    #produce kafka : requestAccessToken
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    Produce Kafka    ${CmdDelete_accessTokenRequested}    ${CmdProduce_requestAccessToken}    ${DataProduce_TST_F15_0_1_055}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ${ConsumeResult}    Consume Kafka    ${CmdConsume_accessTokenRequested}    TST_F15_0_1_055
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F15_0_1_055}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    Flush Log by Command Name    ${NameCmdFileLog_ServiceAuthentication}    TST_F15_0_1_055    ${PathLogServiceAuthentication}
    [Teardown]    Close All Connections

TST_F15_0_1_056
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCmdFileLog_ServiceAuthentication}    ${PathLogServiceAuthentication}
    #Set AC Response
    SetMockupResponse    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_TST_F15_0_1_056}
    #produce kafka : requestAccessToken
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    Produce Kafka    ${CmdDelete_accessTokenRequested}    ${CmdProduce_requestAccessToken}    ${DataProduce_TST_F15_0_1_056}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ${ConsumeResult}    Consume Kafka    ${CmdConsume_accessTokenRequested}    TST_F15_0_1_056
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F15_0_1_056}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    Flush Log by Command Name    ${NameCmdFileLog_ServiceAuthentication}    TST_F15_0_1_056    ${PathLogServiceAuthentication}
    [Teardown]    Close All Connections

TST_F15_0_1_059
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCmdFileLog_ServiceAuthentication}    ${PathLogServiceAuthentication}
    #Set AC Response
    SetMockupResponse    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_TST_F15_0_1_059}
    #produce kafka : requestAccessToken
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    Produce Kafka    ${CmdDelete_accessTokenRequested}    ${CmdProduce_requestAccessToken}    ${DataProduce_TST_F15_0_1_059}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ${ConsumeResult}    Consume Kafka    ${CmdConsume_accessTokenRequested}    TST_F15_0_1_059
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F15_0_1_059}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    Flush Log by Command Name    ${NameCmdFileLog_ServiceAuthentication}    TST_F15_0_1_059    ${PathLogServiceAuthentication}
    [Teardown]    Close All Connections

TST_F15_0_1_060
    #Connect CRT
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    SetLogNull    ${NameCmdFileLog_ServiceAuthentication}    ${PathLogServiceAuthentication}
    #Set AC Response
    SetMockupResponse    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse_TST_F15_0_1_060}
    #produce kafka : requestAccessToken
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    Produce Kafka    ${CmdDelete_accessTokenRequested}    ${CmdProduce_requestAccessToken}    ${DataProduce_TST_F15_0_1_060}
    #Consume kafka : accessTokenRequested
    ConnectSecureCRT    ${HostURL_10.138.38.229}
    ${ConsumeResult}    Consume Kafka    ${CmdConsume_accessTokenRequested}    TST_F15_0_1_060
    # check app produce accessTokenRequested
    VerifyDataConsume    ${ConsumeResult}    ${DataExpect_TST_F15_0_1_060}
    #Keep Log
    ConnectSecureCRTLog    ${HostURL_10.137.30.66}
    Flush Log by Command Name    ${NameCmdFileLog_ServiceAuthentication}    TST_F15_0_1_060    ${PathLogServiceAuthentication}
    [Teardown]    Close All Connections

TestLog
    ${Log}    BuiltIn.Set Variable    {"action":"[CONSUMING]","actionDescription":"start consuming event: topic qa.requestCheckProfile_tea, partition 0, offset 91","appName":"mfaf","broker":"B","channel":"A","componentName":"nsb-check-profile","componentVersion":"v1.0.3","device":"324897098709872103948709","instance":"DMASTERSQA0001","level":"info","message":"{\"msisdn\":\"0811110053\"}","originateServiceName":"Event source","public":"none","recordName":"qa.requestCheckProfile_tea","recordType":"detail","sessionId":"234709834750982345","subAction":"N/A","timestamp":"2023-09-21 15:02:17.990","transactionId":"TST_F11_0_1_053","useCase":"C","useCaseStep":"D","user":"none"}\n{"action":"[HTTP_REQUEST]","actionDescription":"send http request to ac","appName":"mfaf","broker":"B","channel":"A","componentName":"nsb-check-profile","componentVersion":"1.0.3","dependency":"ac","device":"324897098709872103948709","instance":"DMASTERSQA0001","level":"info","message":"{\"header\":{null},\"body\":{{\"msisdn\":\"0811110053\"}}}","originateServiceName":"Event source","public":"none","recordName":"qa.requestCheckProfile_tea","recordType":"detail","sessionId":"234709834750982345","subAction":"POST:package","timestamp":"2023-09-21 15:02:17.990","transactionId":"TST_F11_0_1_053","useCase":"C","useCaseStep":"D","user":"none"}\n{"action":"[HTTP_RESPONSE]","actionDescription":"receive http response from ac","appName":"mfaf","broker":"B","channel":"A","componentName":"nsb-check-profile","componentVersion":"1.0.3","dependency":"ac","device":"324897098709872103948709","instance":"DMASTERSQA0001","level":"info","message":"{\n \ \"resultCode\": \"20000\",\n \ \"resultDesc\": \"Success\",\n \ \"developerMessage\": \"Success\",\n \ \"networkType\": \"prepaid\",\n \ \"data\": {\n \ \ \ \"responseHeader\": {\n \ \ \ \ \ \"reTransmit\": \"0\",\n \ \ \ \ \ \"sourceSystem\": \"BSS\",\n \ \ \ \ \ \"userSys\": \"MYAIS\",\n \ \ \ \ \ \"resourceGroupId\": \"MYAIS2023080301594739585189\",\n \ \ \ \ \ \"resourceOrderId\": \"PPGZINQA80XG-PGZINQ-202308031359470263\",\n \ \ \ \ \ \"resultCode\": \"20000\",\n \ \ \ \ \ \"resultDesc\": \"Success\",\n \ \ \ \ \ \"developerMessage\": \"\"\n \ \ \ },\n \ \ \ \"resourceItemList\": [\n \ \ \ \ \ {\n \ \ \ \ \ \ \ \"resourceItemId\": \"MYAIS2023080301594739585189\",\n \ \ \ \ \ \ \ \"resourceName\": \"queryFreeUnitByPack\",\n \ \ \ \ \ \ \ \"resourceItemStatus\": \"Success\",\n \ \ \ \ \ \ \ \"resourceItemErrMessage\": \"Success\",\n \ \ \ \ \ \ \ \"errorFlag\": \"11111\",\n \ \ \ \ \ \ \ \"resourceActivatedDate\": \"20230803135947+0700\",\n \ \ \ \ \ \ \ \"productInfo\": {\n \ \ \ \ \ \ \ \ \ \"currentProduct\": {\n \ \ \ \ \ \ \ \ \ \ \ \"responseCustomerInfoMainProductList\": [\n \ \ \ \ \ \ \ \ \ \ \ \ \ {\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"productId\": \"170001\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"productSequenceId\": \"1288617\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"productName\": \"SO Main Default\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"notificationName\": \"SO Main Default\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"notificationName2\": \"SO Main Default\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"notificationName3\": \"SO Main Default\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"notificationName4\": \"5G MAX Speed package 1099 Baht\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"notificationName5\": \"แพ็กเกจ 5G Max Speed 1099 บาท\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"nextBillDate\": \"20230901000000+0700\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"billDate\": \"20230801000000+0700\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"productCharge\": \"0\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"productBundledFlag\": \"Simple Offering\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"productClass\": \"Individual Offering\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"productStatus\": \"Active\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"productInstInfo\": [],\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"offeringInstProperty\": [\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ {\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"propertyCode\": \"C_DIY_RENT_FEE\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"propertyType\": \"1\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"propertyValue\": \"0\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"offeringSubInstProperty\": [],\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"offeringInstEffectiveTime\": \"20230411112058+0700\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"offeringInstExpireTime\": \"20370101000000+0700\"\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ },\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ {\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"propertyCode\": \"C_DIY_FREE_RENT\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"propertyType\": \"1\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"propertyValue\": \"0\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"offeringSubInstProperty\": [],\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"offeringInstEffectiveTime\": \"20230411112058+0700\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"offeringInstExpireTime\": \"20370101000000+0700\"\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ },\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ {\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"propertyCode\": \"C_DIY_FREE_UNIT_TYPE_AMOUNT\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"propertyType\": \"2\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"offeringSubInstProperty\": [\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ {\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"subPropertyCode\": \"C_FREE_UNIT_TYPE_ID\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"subPropertyValue\": \"303100001\"\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ },\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ {\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"subPropertyCode\": \"C_FREE_UNIT_AMOUNT\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"subPropertyValue\": \"999999999999999\"\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ }\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ ],\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"offeringInstEffectiveTime\": \"20230411112058+0700\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"offeringInstExpireTime\": \"20370101000000+0700\"\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ },\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ {\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"propertyCode\": \"C_DIY_FREE_UNIT_TYPE_AMOUNT\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"propertyType\": \"2\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"offeringSubInstProperty\": [\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ {\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"subPropertyCode\": \"C_FREE_UNIT_TYPE_ID\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"subPropertyValue\": \"243600019\"\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ },\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ {\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"subPropertyCode\": \"C_FREE_UNIT_AMOUNT\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"subPropertyValue\": \"999999999999999\"\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ }\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ ],\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"offeringInstEffectiveTime\": \"20230411112058+0700\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"offeringInstExpireTime\": \"20370101000000+0700\"\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ },\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ {\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"propertyCode\": \"C_DIY_EXT_OFFER_ID\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"propertyType\": \"1\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"propertyValue\": \"O2005P200128060\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"offeringSubInstProperty\": [],\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"offeringInstEffectiveTime\": \"20230411112058+0700\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"offeringInstExpireTime\": \"20370101000000+0700\"\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ },\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ {\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"propertyCode\": \"C_DIY_OFFER_NOTIFY_NAME\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"propertyType\": \"2\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"offeringSubInstProperty\": [\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ {\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"subPropertyCode\": \"C_DIY_OFFER_NOTIFY_NAME1\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"subPropertyValue\": \"5G MAX Speed package 1099 Baht\"\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ },\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ {\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"subPropertyCode\": \"C_DIY_OFFER_NOTIFY_NAME2\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"subPropertyValue\": \"แพ็กเกจ 5G Max Speed 1099 บาท\"\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ }\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ ],\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"offeringInstEffectiveTime\": \"20230411112058+0700\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"offeringInstExpireTime\": \"20370101000000+0700\"\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ }\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ ],\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"productEffectiveTime\": \"20230411112058+0700\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"productExpireTime\": \"20240501000000+0700\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"productActivationTime\": \"20230411112058+0700\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"crmProductId\": \"O2005P200128060\"\n \ \ \ \ \ \ \ \ \ \ \ \ \ }\n \ \ \ \ \ \ \ \ \ \ \ ],\n \ \ \ \ \ \ \ \ \ \ \ \"responseCustomerInfoOntopAndServiceList\": [\n \ \ \ \ \ \ \ \ \ \ \ \ \ {\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"productId\": \"800001\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"productSequenceId\": \"1284476\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"productName\": \"SO Ontop RC(BC)\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"notificationName\": \"SO Ontop RC(BC)\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"notificationName2\": \"SO Ontop RC(BC)\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"notificationName3\": \"SO Ontop RC(BC)\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"notificationName4\": \"5G On-top package monthly fee399Baht Internet 15GB\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"notificationName5\": \"แพ็กเสริม 5G เดือนละ 399บาท เน็ต 15GB\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"nextBillDate\": \"20230901000000+0700\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"billDate\": \"20230801000000+0700\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"productCharge\": \"0\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"productBundledFlag\": \"Simple Offering\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"productClass\": \"Individual Offering\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"productStatus\": \"Active\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"productInstInfo\": [],\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"offeringInstProperty\": [\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ {\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"propertyCode\": \"C_DIY_RENT_FEE\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"propertyType\": \"1\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"propertyValue\": \"0\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"offeringSubInstProperty\": [],\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"offeringInstEffectiveTime\": \"20230331100546+0700\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"offeringInstExpireTime\": \"20370101000000+0700\"\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ },\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ {\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"propertyCode\": \"C_DIY_FREE_RENT\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"propertyType\": \"1\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"propertyValue\": \"0\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"offeringSubInstProperty\": [],\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"offeringInstEffectiveTime\": \"20230331100546+0700\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"offeringInstExpireTime\": \"20370101000000+0700\"\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ },\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ {\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"propertyCode\": \"C_DIY_FREE_UNIT_TYPE_AMOUNT\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"propertyType\": \"2\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"offeringSubInstProperty\": [\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ {\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"subPropertyCode\": \"C_FREE_UNIT_TYPE_ID\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"subPropertyValue\": \"243110001\"\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ },\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ {\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"subPropertyCode\": \"C_FREE_UNIT_AMOUNT\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"subPropertyValue\": \"999999999999999\"\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ }\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ ],\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"offeringInstEffectiveTime\": \"20230331100546+0700\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"offeringInstExpireTime\": \"20370101000000+0700\"\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ },\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ {\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"propertyCode\": \"C_DIY_FREE_UNIT_TYPE_AMOUNT\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"propertyType\": \"2\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"offeringSubInstProperty\": [\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ {\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"subPropertyCode\": \"C_FREE_UNIT_TYPE_ID\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"subPropertyValue\": \"243180004\"\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ },\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ {\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"subPropertyCode\": \"C_FREE_UNIT_AMOUNT\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"subPropertyValue\": \"15728640\"\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ }\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ ],\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"offeringInstEffectiveTime\": \"20230331100546+0700\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"offeringInstExpireTime\": \"20370101000000+0700\"\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ },\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ {\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"propertyCode\": \"C_DIY_EXT_OFFER_ID\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"propertyType\": \"1\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"propertyValue\": \"O2009P200902626\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"offeringSubInstProperty\": [],\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"offeringInstEffectiveTime\": \"20230331100546+0700\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"offeringInstExpireTime\": \"20370101000000+0700\"\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ },\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ {\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"propertyCode\": \"C_DIY_OFFER_NOTIFY_NAME\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"propertyType\": \"2\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"offeringSubInstProperty\": [\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ {\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"subPropertyCode\": \"C_DIY_OFFER_NOTIFY_NAME1\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"subPropertyValue\": \"5G On-top package monthly fee399Baht Internet 15GB\"\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ },\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ {\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"subPropertyCode\": \"C_DIY_OFFER_NOTIFY_NAME2\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"subPropertyValue\": \"แพ็กเสริม 5G เดือนละ 399บาท เน็ต 15GB\"\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ }\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ ],\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"offeringInstEffectiveTime\": \"20230331100546+0700\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"offeringInstExpireTime\": \"20370101000000+0700\"\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ }\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ ],\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"productEffectiveTime\": \"20230331100546+0700\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"productExpireTime\": \"20231001000000+0700\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"productActivationTime\": \"20230331100546+0700\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"crmProductId\": \"O2009P200902626\"\n \ \ \ \ \ \ \ \ \ \ \ \ \ }\n \ \ \ \ \ \ \ \ \ \ \ ]\n \ \ \ \ \ \ \ \ \ },\n \ \ \ \ \ \ \ \ \ \"futureProduct\": {\n \ \ \ \ \ \ \ \ \ \ \ \"responseCustomerInfoMainProductList\": [],\n \ \ \ \ \ \ \ \ \ \ \ \"responseCustomerInfoOntopAndServiceList\": []\n \ \ \ \ \ \ \ \ \ }\n \ \ \ \ \ \ \ },\n \ \ \ \ \ \ \ \"freeUnitInfo\": {\n \ \ \ \ \ \ \ \ \ \"currentProduct\": {\n \ \ \ \ \ \ \ \ \ \ \ \"responseFreeUnitMainProductList\": [\n \ \ \ \ \ \ \ \ \ \ \ \ \ {\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"productId\": \"170001\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"productSequenceId\": \"1288617\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"productName\": \"SO Main Default\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"notificationName\": \"SO Main Default\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"notificationName2\": \"SO Main Default\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"notificationName3\": \"SO Main Default\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"notificationName4\": \"5G MAX Speed package 1099 Baht\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"notificationName5\": \"แพ็กเกจ 5G Max Speed 1099 บาท\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"crmProductId\": \"O2005P200128060\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"freeUnitItemList\": [\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ {\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"freeUnitId\": \"253180004\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"freeUnitName\": \"Internet\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"measureUnit\": \"1107\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"measureUnitName\": \"KB\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"freeUnitLevel\": \"Mobile Level\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"freeUnitItemDetailList\": [\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ {\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"rollOverFlag\": \"N\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"freeUnitInstanceId\": \"701000000000801138\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"freeUnitEffectiveTime\": \"20230801000000+0700\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"remainingAmount\": \"15728640\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"originType\": \"1\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"initialAmount\": \"15728640\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"freeUnitExpireTime\": \"20230901000000+0700\"\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ }\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ ]\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ },\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ {\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"freeUnitId\": \"253110001\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"freeUnitName\": \"Internet\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"measureUnit\": \"1107\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"measureUnitName\": \"KB\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"freeUnitLevel\": \"Mobile Level\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"freeUnitItemDetailList\": [\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ {\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"rollOverFlag\": \"N\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"freeUnitInstanceId\": \"701000000000801139\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"freeUnitEffectiveTime\": \"20230801000000+0700\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"remainingAmount\": \"Unlimited\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"originType\": \"1\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"initialAmount\": \"Unlimited\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"freeUnitExpireTime\": \"20230901000000+0700\"\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ }\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ ]\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ }\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ ]\n \ \ \ \ \ \ \ \ \ \ \ \ \ }\n \ \ \ \ \ \ \ \ \ \ \ ],\n \ \ \ \ \ \ \ \ \ \ \ \"responseFreeUnitOntopAndServiceList\": [\n \ \ \ \ \ \ \ \ \ \ \ \ \ {\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"productId\": \"800001\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"productSequenceId\": \"1284476\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"productName\": \"SO Ontop RC(BC)\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"notificationName\": \"SO Ontop RC(BC)\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"notificationName2\": \"SO Ontop RC(BC)\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"notificationName3\": \"SO Ontop RC(BC)\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"notificationName4\": \"5G On-top package monthly fee399Baht Internet 15GB\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"notificationName5\": \"แพ็กเสริม 5G เดือนละ 399บาท เน็ต 15GB\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"crmProductId\": \"O2009P200902626\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"freeUnitItemList\": [\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ {\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"freeUnitId\": \"303100001\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"freeUnitName\": \"Internet WiFi Unlimited2\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"measureUnit\": \"1107\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"measureUnitName\": \"KB\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"freeUnitLevel\": \"Mobile Level\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"freeUnitItemDetailList\": [\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ {\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"rollOverFlag\": \"N\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"freeUnitInstanceId\": \"701000000000801140\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"freeUnitEffectiveTime\": \"20230801000000+0700\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"remainingAmount\": \"Unlimited\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"originType\": \"1\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"initialAmount\": \"Unlimited\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"freeUnitExpireTime\": \"20230901000000+0700\"\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ }\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ ]\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ },\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ {\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"freeUnitId\": \"303100002\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"freeUnitName\": \"Internet WiFi Unlimited1\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"measureUnit\": \"1107\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"measureUnitName\": \"KB\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"freeUnitLevel\": \"Mobile Level\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"freeUnitItemDetailList\": [\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ {\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"rollOverFlag\": \"N\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"freeUnitInstanceId\": \"701000000000801141\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"freeUnitEffectiveTime\": \"20230801000000+0700\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"remainingAmount\": \"Unlimited\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"originType\": \"1\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"initialAmount\": \"Unlimited\",\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \"freeUnitExpireTime\": \"20230901000000+0700\"\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ }\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ ]\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ }\n \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ ]\n \ \ \ \ \ \ \ \ \ \ \ \ \ }\n \ \ \ \ \ \ \ \ \ \ \ ],\n \ \ \ \ \ \ \ \ \ \ \ \"responseFreeUnitOtherList\": []\n \ \ \ \ \ \ \ \ \ },\n \ \ \ \ \ \ \ \ \ \"futureProduct\": {\n \ \ \ \ \ \ \ \ \ \ \ \"responseFreeUnitMainProductList\": [],\n \ \ \ \ \ \ \ \ \ \ \ \"responseFreeUnitOntopAndServiceList\": [],\n \ \ \ \ \ \ \ \ \ \ \ \"responseFreeUnitOtherList\": []\n \ \ \ \ \ \ \ \ \ }\n \ \ \ \ \ \ \ },\n \ \ \ \ \ \ \ \"specialErrHandling\": {\n \ \ \ \ \ \ \ \ \ \"suppCode\": [],\n \ \ \ \ \ \ \ \ \ \"taskKeyCondition\": [],\n \ \ \ \ \ \ \ \ \ \"taskDeveloperMessage\": []\n \ \ \ \ \ \ \ }\n \ \ \ \ \ }\n \ \ \ ]\n \ }\n}","originateServiceName":"Event source","public":"none","recordName":"qa.requestCheckProfile_tea","recordType":"detail","responseTime":"1.783","resultCode":"20000","sessionId":"234709834750982345","subAction":"POST:package","timestamp":"2023-09-21 15:02:17.992","transactionId":"TST_F11_0_1_053","useCase":"C","useCaseStep":"D","user":"none"}\n{"action":"[DB_REQUEST]","actionDescription":"collection = qaProfilePaper","appName":"mfaf","broker":"B","channel":"A","componentName":"nsb-check-profile","componentVersion":"1.0.3","dependency":"mfaf_nsb","device":"324897098709872103948709","instance":"DMASTERSQA0001","level":"info","message":"{\"filter\":{\"msisdn\":\"0811110053\"}}","originateServiceName":"Event source","public":"none","recordName":"qa.requestCheckProfile_tea","recordType":"detail","sessionId":"234709834750982345","subAction":"READ","timestamp":"2023-09-21 15:02:17.993","transactionId":"TST_F11_0_1_053","useCase":"C","useCaseStep":"D","user":"none"}\n{"action":"[DB_RESPONSE]","actionDescription":"collection = qaProfilePaper","appName":"mfaf","broker":"B","channel":"A","componentName":"nsb-check-profile","componentVersion":"1.0.3","dependency":"mfaf_nsb","device":"324897098709872103948709","instance":"DMASTERSQA0001","level":"info","message":"{\"5GMode\":{\"countChangeMode\":0,\"currentMode\":\"\",\"dateCountChangeMode\":\"20230823\",\"initialAmount\":0,\"packageExpireTime\":\"\",\"packageName\":\"\",\"productSequenceId\":\"\",\"remainingAmount\":0},\"_id\":\"64e369665b5edfb047ada9fb\",\"isUsingFupPackage\":true,\"msisdn\":\"0811110053\",\"networkType\":\"prepaid\"}","originateServiceName":"Event source","public":"none","recordName":"qa.requestCheckProfile_tea","recordType":"detail","responseTime":"6.850","resultCode":"20000","sessionId":"234709834750982345","subAction":"READ","timestamp":"2023-09-21 15:02:18.000","transactionId":"TST_F11_0_1_053","useCase":"C","useCaseStep":"D","user":"none"}\n{"action":"[DB_REQUEST]","actionDescription":"collection = qaProfilePaper","appName":"mfaf","broker":"B","channel":"A","componentName":"nsb-check-profile","componentVersion":"1.0.3","dependency":"mfaf_nsb","device":"324897098709872103948709","instance":"DMASTERSQA0001","level":"info","message":"{\"filter\":{\"msisdn\":\"0811110053\"},\"document\":{\"msisdn\":\"0811110053\",\"isUsingFupPackage\":false,\"networkType\":\"prepaid\",\"5GMode\":{\"currentMode\":\"\",\"packageName\":\"\",\"packageExpireTime\":\"\",\"productSequenceId\":\"\",\"initialAmount\":0,\"remainingAmount\":0,\"countChangeMode\":0,\"dateCountChangeMode\":\"20230921\"}}}","originateServiceName":"Event source","public":"none","recordName":"qa.requestCheckProfile_tea","recordType":"detail","sessionId":"234709834750982345","subAction":"UPDATE","timestamp":"2023-09-21 15:02:18.001","transactionId":"TST_F11_0_1_053","useCase":"C","useCaseStep":"D","user":"none"}\n{"action":"[DB_RESPONSE]","actionDescription":"collection = qaProfilePaper","appName":"mfaf","broker":"B","channel":"A","componentName":"nsb-check-profile","componentVersion":"1.0.3","dependency":"mfaf_nsb","device":"324897098709872103948709","instance":"DMASTERSQA0001","level":"info","message":"{\"MatchedCount\":1,\"ModifiedCount\":1,\"UpsertedCount\":0,\"UpsertedID\":null}","originateServiceName":"Event source","public":"none","recordName":"qa.requestCheckProfile_tea","recordType":"detail","responseTime":"6.193","resultCode":"20000","sessionId":"234709834750982345","subAction":"UPDATE","timestamp":"2023-09-21 15:02:18.007","transactionId":"TST_F11_0_1_053","useCase":"C","useCaseStep":"D","user":"none"}\n{"action":"[PRODUCING]","actionDescription":"start producing event: topic qa.checkProfileRequested_tea, partition 0, offset 148","appName":"mfaf","broker":"B","channel":"A","componentName":"nsb-check-profile","componentVersion":"1.0.3","device":"324897098709872103948709","instance":"DMASTERSQA0001","level":"info","message":"{\"body\":{\"data\":{\"5GMode\":{\"countChangeMode\":0,\"currentMode\":\"\",\"initialAmount\":0,\"packageExpireTime\":\"\",\"packageName\":\"\",\"productSequenceId\":\"\",\"remainingAmount\":0},\"isUsingFupPackage\":false,\"networkType\":\"prepaid\"},\"developerMessage\":\"Success\",\"resultCode\":\"20000\",\"resultDesc\":\"Success\"},\"header\":{\"baseApiVersion\":\"none\",\"broker\":\"B\",\"channel\":\"A\",\"communication\":\"unicast\",\"from\":\"nsb-check-profile\",\"groupTags\":[],\"identity\":{\"device\":\"324897098709872103948709\"},\"lastTid\":\"32459837450987.12394870934\",\"schemaVersion\":\"none\",\"session\":\"234709834750982345\",\"tid\":\"32459837450987.12394870934\",\"timestamp\":\"2023-05-04T14:51:06.157Z\",\"tmfSpec\":\"none\",\"transaction\":\"TST_F11_0_1_053\",\"useCase\":\"C\",\"useCaseAge\":\"1\",\"useCaseStep\":\"D\",\"version\":\"2.0\"}}","originateServiceName":"Event source","public":"none","recordName":"qa.requestCheckProfile_tea","recordType":"detail","responseTime":"1.775","resultCode":"20000","sessionId":"234709834750982345","subAction":"N/A","timestamp":"2023-09-21 15:02:18.009","transactionId":"TST_F11_0_1_053","useCase":"C","useCaseStep":"D","user":"none"}\n{"action":"[EXCEPTION] - Success","actionDescription":"Success","appName":"mfaf","broker":"B","channel":"A","componentName":"nsb-check-profile","componentVersion":"1.0.3","device":"324897098709872103948709","instance":"DMASTERSQA0001","level":"error","message":"Success","originateServiceName":"Event source","public":"none","recordName":"qa.requestCheckProfile_tea","recordType":"detail","responseTime":"1.775","resultCode":"20000","sessionId":"234709834750982345","subAction":"N/A","timestamp":"2023-09-21 15:02:18.009","transactionId":"TST_F11_0_1_053","useCase":"C","useCaseStep":"D","user":"none"}\n{"appName":"mfaf","appResult":"[nsb-check-profile] - Success","appResultCode":"20000","broker":"B","channel":"A","componentName":"nsb-check-profile","componentVersion":"1.0.3","dateTime":"2023-09-21 15:02:18.009","device":"324897098709872103948709","instance":"DMASTERSQA0001","level":"error","originateServiceName":"Event source","public":"none","recordName":"qa.requestCheckProfile_tea","recordType":"summary","serviceTime":"19.263","sessionId":"234709834750982345","stack":"Success","transactionId":"TST_F11_0_1_053","useCase":"C","useCaseStep":"D","user":"none"}
    ${dataproduce}    BuiltIn.Set Variable    {"header":{"version":"2.0","timestamp":"2023-05-04T14:51:06.157Z","from":"ODA","tid":"32459837450987.12394870934","lastTid":"32459837450987.12394870934","session":"234709834750982345","channel":"A","broker":"B","useCase":"C","useCaseStep":"D","useCaseAge":"0","transaction":"TST_F11_0_1_053","communication":"unicast","groupTags":[],"identity":{"device":"324897098709872103948709"},"tmfSpec":"none","baseApiVersion":"none","schemaVersion":"none"},"body":{"msisdn":"0811110053"}}
    ${ResultCodereq}    BuiltIn.Set Variable    "20000"
    ${ComponentNamereq}    BuiltIn.Set Variable    "nsb-check-profile"
    BuiltIn.Log    ${dataproduce}
    ${dataproducejs}    JSONLibrary.Convert String To Json    ${dataproduce}
    ${dataproduceMsisdn}    JSONLibrary.Get Value From Json    ${dataproducejs}    $..msisdn
    ${dataproduceBroker}    JSONLibrary.Get Value From Json    ${dataproducejs}    $..broker
    ${dataproduceChannel}    JSONLibrary.Get Value From Json    ${dataproducejs}    $..channel
    ${dataproduceDevice}    JSONLibrary.Get Value From Json    ${dataproducejs}    $..device
    ${dataproduceSessionId}    JSONLibrary.Get Value From Json    ${dataproducejs}    $..session
    ${dataproduceTransactionId}    JSONLibrary.Get Value From Json    ${dataproducejs}    $..transaction
    ${dataproduceUseCase}    JSONLibrary.Get Value From Json    ${dataproducejs}    $..useCase
    ${dataproduceUseCaseStep}    JSONLibrary.Get Value From Json    ${dataproducejs}    $..useCaseStep
    Comment    ${dataproduceUser}    JSONLibrary.Get Value From Json    ${dataproducejs}    $..user
    BuiltIn.Log    ${dataproduceMsisdn}
    ${JsonLog}    BuiltIn.Set Variable    [${Log}]
    ${dataremove1}    Remove String    ${JsonLog}    ${SPACE}
    ${dataremove3}    Remove String    ${dataremove1}    ${SPACE}
    ${dataremove2}    Remove String    ${dataremove3}    \n
    BuiltIn.Log    ${dataremove2}
    ${dataremove}    Replace String    ${dataremove2}    "user":"none"}    "user":"none"},    count=-1
    ${dataresult}    Replace String    ${dataremove}    },]    }]
    ${dataresult}    Replace String    ${dataresult}    "{    {
    ${dataresult}    Replace String    ${dataresult}    }"    }
    ${dataresult}    Replace String    ${dataresult}    {null}    null
    ${dataresult}    Replace String    ${dataresult}    {{"msisdn":"0811110053"}}}    {"msisdn":"${dataproduceMsisdn[0]}"}}
    BuiltIn.Log    ${dataresult}
    ${dataresult}    JSONLibrary.Convert String To Json    ${dataresult}
    ${ListlogResult}    JSONLibrary.Get Value From Json    ${dataresult}    $..appName
    ${LengthOfItem}    Get Length    ${ListlogResult}
    ${Action}    JSONLibrary.Get Value From Json    ${dataresult}    $..action
    ${Broker}    JSONLibrary.Get Value From Json    ${dataresult}    $..broker
    ${Channel}    JSONLibrary.Get Value From Json    ${dataresult}    $..channel
    ${Device}    JSONLibrary.Get Value From Json    ${dataresult}    $..device
    ${SessionId}    JSONLibrary.Get Value From Json    ${dataresult}    $..sessionId
    ${TransactionId}    JSONLibrary.Get Value From Json    ${dataresult}    $..transactionId
    ${UseCase}    JSONLibrary.Get Value From Json    ${dataresult}    $..useCase
    ${UseCaseStep}    JSONLibrary.Get Value From Json    ${dataresult}    $..useCaseStep
    ${Message}    JSONLibrary.Get Value From Json    ${dataresult}    $..message
    ${RecordType}    JSONLibrary.Get Value From Json    ${dataresult}    $..recordType
    ${SubAction}    JSONLibrary.Get Value From Json    ${dataresult}    $..subAction
    ${ResultCode}    JSONLibrary.Get Value From Json    ${dataresult}    $..resultCode
    ${ComponentName}    JSONLibrary.Get Value From Json    ${dataresult}    $..componentName
    FOR    ${Index}    IN RANGE    ${LengthOfItem}-1
        IF    "${ComponentName}" == ${ComponentNamereq}
            IF    "${Action[${Index}]}" == "[CONSUMING]"
                BuiltIn.Log    "CONSUMING"
                ${Msisdn}    JSONLibrary.Get Value From Json    ${dataresult}    $..message.msisdn
                BuiltIn.Should Be Equal    "${Broker[${Index}]}"    "${dataproduceBroker[0]}"
                BuiltIn.Should Be Equal    "${Channel[${Index}]}"    "${dataproduceChannel[0]}"
                BuiltIn.Should Be Equal    "${Device[${Index}]}"    "${dataproduceDevice[0]}"
                BuiltIn.Should Be Equal    "${SessionId[${Index}]}"    "${dataproduceSessionId[0]}"
                BuiltIn.Should Be Equal    "${TransactionId[${Index}]}"    "${dataproduceTransactionId[0]}"
                BuiltIn.Should Be Equal    "${UseCase[${Index}]}"    "${dataproduceUseCase[0]}"
                BuiltIn.Should Be Equal    "${UseCaseStep[${Index}]}"    "${dataproduceUseCaseStep[0]}"
                BuiltIn.Should Be Equal    "${Msisdn[${Index}]}"    "${dataproduceMsisdn[0]}"
                BuiltIn.Should Be Equal    "${RecordType[${Index}]}"    "detail"
            END
            IF    "${Action[${Index}]}" == "[HTTP_REQUEST]"
                BuiltIn.Log    "HTTP_REQUEST"
                ${Msisdn}    JSONLibrary.Get Value From Json    ${dataresult}    $..message.msisdn
                BuiltIn.Should Be Equal    "${Broker[${Index}]}"    "${dataproduceBroker[0]}"
                BuiltIn.Should Be Equal    "${Channel[${Index}]}"    "${dataproduceChannel[0]}"
                BuiltIn.Should Be Equal    "${Device[${Index}]}"    "${dataproduceDevice[0]}"
                BuiltIn.Should Be Equal    "${SessionId[${Index}]}"    "${dataproduceSessionId[0]}"
                BuiltIn.Should Be Equal    "${TransactionId[${Index}]}"    "${dataproduceTransactionId[0]}"
                BuiltIn.Should Be Equal    "${UseCase[${Index}]}"    "${dataproduceUseCase[0]}"
                BuiltIn.Should Be Equal    "${UseCaseStep[${Index}]}"    "${dataproduceUseCaseStep[0]}"
                BuiltIn.Should Be Equal    "${Msisdn[${Index}]}"    "${dataproduceMsisdn[0]}"
                BuiltIn.Should Be Equal    "${RecordType[${Index}]}"    "detail"
                BuiltIn.Should Be Equal    "${SubAction[${Index}]}"    "POST:package"
                BuiltIn.Should Be Equal    "${ResultCode[${Index}]}"    ${ResultCodereq}
            END
            IF    "${Action[${Index}]}" == "[HTTP_RESPONSE]"
                BuiltIn.Log    "HTTP_RESPONSE"
                ${Msisdn}    JSONLibrary.Get Value From Json    ${dataresult}    $..message.msisdn
                BuiltIn.Should Be Equal    "${Broker[${Index}]}"    "${dataproduceBroker[0]}"
                BuiltIn.Should Be Equal    "${Channel[${Index}]}"    "${dataproduceChannel[0]}"
                BuiltIn.Should Be Equal    "${Device[${Index}]}"    "${dataproduceDevice[0]}"
                BuiltIn.Should Be Equal    "${SessionId[${Index}]}"    "${dataproduceSessionId[0]}"
                BuiltIn.Should Be Equal    "${TransactionId[${Index}]}"    "${dataproduceTransactionId[0]}"
                BuiltIn.Should Be Equal    "${UseCase[${Index}]}"    "${dataproduceUseCase[0]}"
                BuiltIn.Should Be Equal    "${UseCaseStep[${Index}]}"    "${dataproduceUseCaseStep[0]}"
                BuiltIn.Should Be Equal    "${Msisdn[${Index}]}"    "${dataproduceMsisdn[0]}"
                BuiltIn.Should Be Equal    "${RecordType[${Index}]}"    "detail"
            END
            IF    "${Action[${Index}]}" == "[DB_REQUEST]"
                BuiltIn.Log    "DB_REQUEST"
                ${Msisdn}    JSONLibrary.Get Value From Json    ${dataresult}    $..message.msisdn
                BuiltIn.Should Be Equal    "${Broker[${Index}]}"    "${dataproduceBroker[0]}"
                BuiltIn.Should Be Equal    "${Channel[${Index}]}"    "${dataproduceChannel[0]}"
                BuiltIn.Should Be Equal    "${Device[${Index}]}"    "${dataproduceDevice[0]}"
                BuiltIn.Should Be Equal    "${SessionId[${Index}]}"    "${dataproduceSessionId[0]}"
                BuiltIn.Should Be Equal    "${TransactionId[${Index}]}"    "${dataproduceTransactionId[0]}"
                BuiltIn.Should Be Equal    "${UseCase[${Index}]}"    "${dataproduceUseCase[0]}"
                BuiltIn.Should Be Equal    "${UseCaseStep[${Index}]}"    "${dataproduceUseCaseStep[0]}"
                BuiltIn.Should Be Equal    "${Msisdn[${Index}]}"    "${dataproduceMsisdn[0]}"
                BuiltIn.Should Be Equal    "${RecordType[${Index}]}"    "detail"
                BuiltIn.Should Be Equal    "${SubAction[${Index}]}"    "POST:package"
                BuiltIn.Should Be Equal    "${ResultCode[${Index}]}"    ${ResultCodereq}
            END
            IF    "${Action[${Index}]}" == "[DB_RESPONSE]"
                BuiltIn.Log    "DB_RESPONSE"
                ${Msisdn}    JSONLibrary.Get Value From Json    ${dataresult}    $..message.msisdn
                BuiltIn.Should Be Equal    "${Broker[${Index}]}"    "${dataproduceBroker[0]}"
                BuiltIn.Should Be Equal    "${Channel[${Index}]}"    "${dataproduceChannel[0]}"
                BuiltIn.Should Be Equal    "${Device[${Index}]}"    "${dataproduceDevice[0]}"
                BuiltIn.Should Be Equal    "${SessionId[${Index}]}"    "${dataproduceSessionId[0]}"
                BuiltIn.Should Be Equal    "${TransactionId[${Index}]}"    "${dataproduceTransactionId[0]}"
                BuiltIn.Should Be Equal    "${UseCase[${Index}]}"    "${dataproduceUseCase[0]}"
                BuiltIn.Should Be Equal    "${UseCaseStep[${Index}]}"    "${dataproduceUseCaseStep[0]}"
                BuiltIn.Should Be Equal    "${Msisdn[${Index}]}"    "${dataproduceMsisdn[0]}"
                BuiltIn.Should Be Equal    "${RecordType[${Index}]}"    "detail"
            END
            IF    "${Action[${Index}]}" == "[PRODUCING]"
                BuiltIn.Log    "PRODUCING"
                ${Msisdn}    JSONLibrary.Get Value From Json    ${dataresult}    $..message.msisdn
                BuiltIn.Should Be Equal    "${Broker[${Index}]}"    "${dataproduceBroker[0]}"
                BuiltIn.Should Be Equal    "${Channel[${Index}]}"    "${dataproduceChannel[0]}"
                BuiltIn.Should Be Equal    "${Device[${Index}]}"    "${dataproduceDevice[0]}"
                BuiltIn.Should Be Equal    "${SessionId[${Index}]}"    "${dataproduceSessionId[0]}"
                BuiltIn.Should Be Equal    "${TransactionId[${Index}]}"    "${dataproduceTransactionId[0]}"
                BuiltIn.Should Be Equal    "${UseCase[${Index}]}"    "${dataproduceUseCase[0]}"
                BuiltIn.Should Be Equal    "${UseCaseStep[${Index}]}"    "${dataproduceUseCaseStep[0]}"
                BuiltIn.Should Be Equal    "${Msisdn[${Index}]}"    "${dataproduceMsisdn[0]}"
                BuiltIn.Should Be Equal    "${RecordType[${Index}]}"    "detail"
                BuiltIn.Should Be Equal    "${SubAction[${Index}]}"    "POST:package"
                BuiltIn.Should Be Equal    "${ResultCode[${Index}]}"    ${ResultCodereq}
            END
            IF    "${Action[${Index}]}" == "[EXCEPTION]-Success"
                BuiltIn.Log    "[EXCEPTION]-Success"
                ${Msisdn}    JSONLibrary.Get Value From Json    ${dataresult}    $..message.msisdn
                BuiltIn.Should Be Equal    "${Broker[${Index}]}"    "${dataproduceBroker[0]}"
                BuiltIn.Should Be Equal    "${Channel[${Index}]}"    "${dataproduceChannel[0]}"
                BuiltIn.Should Be Equal    "${Device[${Index}]}"    "${dataproduceDevice[0]}"
                BuiltIn.Should Be Equal    "${SessionId[${Index}]}"    "${dataproduceSessionId[0]}"
                BuiltIn.Should Be Equal    "${TransactionId[${Index}]}"    "${dataproduceTransactionId[0]}"
                BuiltIn.Should Be Equal    "${UseCase[${Index}]}"    "${dataproduceUseCase[0]}"
                BuiltIn.Should Be Equal    "${UseCaseStep[${Index}]}"    "${dataproduceUseCaseStep[0]}"
                BuiltIn.Should Be Equal    "${Msisdn[${Index}]}"    "${dataproduceMsisdn[0]}"
                BuiltIn.Should Be Equal    "${RecordType[${Index}]}"    "detail"
                BuiltIn.Should Be Equal    "${SubAction[${Index}]}"    "POST:package"
                BuiltIn.Should Be Equal    "${ResultCode[${Index}]}"    ${ResultCodereq}
            END
        END
    END

testJson
    ${Json}    BuiltIn.Set Variable    {"msisdn":"0836318001","5GMode":{"currentMode":"","packageName":"","packageExpireTime":"","productSequenceId":"","initialAmount":0,"remainingAmount":0,"countChangeMode":0,"dateCountChangeMode":"20231010"},"isUsingFupPackage":false,"networkType":"prepaid"}
    ${Json}    JSONLibrary.Convert String To Json    ${Json}
    log    ${Json}
    ${Msisdn}    JSONLibrary.Get Value From Json    ${Json}    $..msisdn
    ${isUsingFupPackage}    JSONLibrary.Get Value From Json    ${Json}    $..isUsingFupPackage
    ${networkType}    JSONLibrary.Get Value From Json    ${Json}    $..networkType
    ${currentMode}    JSONLibrary.Get Value From Json    ${Json}    $..currentMode
    ${packageName}    JSONLibrary.Get Value From Json    ${Json}    $..packageName
    ${packageExpireTime}    JSONLibrary.Get Value From Json    ${Json}    $..packageExpireTime
    ${productSequenceId}    JSONLibrary.Get Value From Json    ${Json}    $..productSequenceId
    ${initialAmount}    JSONLibrary.Get Value From Json    ${Json}    $..initialAmount
    ${remainingAmount}    JSONLibrary.Get Value From Json    ${Json}    $..remainingAmount
    ${countChangeMode}    JSONLibrary.Get Value From Json    ${Json}    $..countChangeMode
    ${dateCountChangeMode}    JSONLibrary.Get Value From Json    ${Json}    $..dateCountChangeMode
    ${JsonFomatExpectDb}    BuiltIn.Set Variable    ${JsonFomatExpectDb}
    ${JsonFomatExpectDb}    JSONLibrary.Convert String To Json    ${JsonFomatExpectDb}
    log    ${JsonFomatExpectDb}
    ${JsonFomatExpectDb}=    JSONLibrary.Update Value To Json    ${JsonFomatExpectDb}    $..msisdn    ${Msisdn[0]}
    ${JsonFomatExpectDb}=    JSONLibrary.Update Value To Json    ${JsonFomatExpectDb}    $..isUsingFupPackage    ${isUsingFupPackage[0]}
    ${JsonFomatExpectDb}=    JSONLibrary.Update Value To Json    ${JsonFomatExpectDb}    $..networkType    ${networkType[0]}
    ${JsonFomatExpectDb}=    JSONLibrary.Update Value To Json    ${JsonFomatExpectDb}    $..currentMode    ${currentMode[0]}
    ${JsonFomatExpectDb}=    JSONLibrary.Update Value To Json    ${JsonFomatExpectDb}    $..packageName    ${packageName[0]}
    ${JsonFomatExpectDb}=    JSONLibrary.Update Value To Json    ${JsonFomatExpectDb}    $..packageExpireTime    ${packageExpireTime[0]}
    ${JsonFomatExpectDb}=    JSONLibrary.Update Value To Json    ${JsonFomatExpectDb}    $..productSequenceId    ${productSequenceId[0]}
    ${JsonFomatExpectDb}=    JSONLibrary.Update Value To Json    ${JsonFomatExpectDb}    $..initialAmount    ${initialAmount[0]}
    ${JsonFomatExpectDb}=    JSONLibrary.Update Value To Json    ${JsonFomatExpectDb}    $..remainingAmount    ${remainingAmount[0]}
    ${JsonFomatExpectDb}=    JSONLibrary.Update Value To Json    ${JsonFomatExpectDb}    $..countChangeMode    ${countChangeMode[0]}
    ${JsonFomatExpectDb}=    JSONLibrary.Update Value To Json    ${JsonFomatExpectDb}    $..dateCountChangeMode    ${dateCountChangeMode[0]}
    ${JsonFomatExpectDb}    Convert Json To String    ${JsonFomatExpectDb}
    log    ${JsonFomatExpectDb}
