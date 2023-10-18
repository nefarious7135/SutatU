*** Settings ***
Resource          Variable.robot
Resource          ../../Keyword/Common.robot
Resource          ../../Keyword/MongoDB.robot
Resource          ../../Keyword/SecureCRT.robot
Resource          Variable.robot
*** Test Cases ***
TST_F1_1_1_000
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull_NEB    ${NameCommandFileLog}    ${PathLogNEB_Log}
    CopyFileLM    ${PathFileLM}    LM_CELL_BKK.geojson
    FlushLogbyCommandName_NEB    ${NameCommandFileLog}    TST_F1_1_1_000    ${PathLogNEB_Log}

TST_F1_1_1_001
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull_NEB    ${NameCommandFileLog}    ${PathLogNEB_Log}
    CopyFileLM    ${PathFileLM}    LM_CELL_BKK_QA1.geojson
    CopyFileLM    ${PathFileLM}    LM_CELL_BKK_QA2.geojson
    CopyFileLM    ${PathFileLM}    LM_CELL_BKK_QA3.geojson
    CopyFileLM    ${PathFileLM}    LM_CELL_BKK_QA4.geojson
    CopyFileLM    ${PathFileLM}    LM_CELL_BKK_QA5.geojson
    FlushLogbyCommandName_NEB    ${NameCommandFileLog}    TST_F1_1_1_000    ${PathLogNEB_Log}

TST_F1_1_1_002
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull_NEB    ${NameCommandFileLog}    ${PathLogNEB_Log}
    CopyFileLM    ${PathFileLM}    LM_CELL_BKK_QA.geojson
    FlushLogbyCommandName_NEB    ${NameCommandFileLog}    TST_F1_1_1_000    ${PathLogNEB_Log}

TST_F1_1_1_003
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull_NEB    ${NameCommandFileLog}    ${PathLogNEB_Log}
    CopyFileLM    ${PathFileLM}    LM_CELL_BKK_QA14.geojson
    FlushLogbyCommandName_NEB    ${NameCommandFileLog}    TST_F1_1_1_000    ${PathLogNEB_Log}

TST_F1_1_1_004
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull_NEB    ${NameCommandFileLog}    ${PathLogNEB_Log}
    CopyFileLM    ${PathFileLM}    LM_WIFI_PA_BKK._QA.geojson
    FlushLogbyCommandName_NEB    ${NameCommandFileLog}    TST_F1_1_1_000    ${PathLogNEB_Log}

TST_F1_1_1_005
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull_NEB    ${NameCommandFileLog}    ${PathLogNEB_Log}
    CopyFileLM    ${PathFileLM}    LM_CELL_LM_WIFI_PA_BKK_QA_2.geojson
    FlushLogbyCommandName_NEB    ${NameCommandFileLog}    TST_F1_1_1_000    ${PathLogNEB_Log}

TST_F1_1_1_006
    ConnectSecureCRTLog    ${HostURL_10.137.30.65}
    SetLogNull_NEB    ${NameCommandFileLog}    ${PathLogNEB_Log}
    CopyFileLM    ${PathFileLM}    LM_WIFI_PA_BKK_QA.geojson
    FlushLogbyCommandName_NEB    ${NameCommandFileLog}    TST_F1_1_1_000    ${PathLogNEB_Log}
