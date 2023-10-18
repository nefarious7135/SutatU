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
Resource          ../Valiables/CommonValiable/CommonValiable.robot
Resource          MongoDB.robot
Resource          Common.robot
*** Keywords ***
ConnectSecureCRT
    [Arguments]    ${HostURL}
    SSHLibrary.Open Connection    ${HostURL}    timeout=1 hour
    SSHLibrary.Login    serveradm    R3dh@t!@#
    Enable SSH Logging    test.log

ConnectSecureCRTkafaka
    [Arguments]    ${HostURL}
    SSHLibrary.Open Connection    ${HostURL}    timeout=1 hour
    SSHLibrary.Login    serveradm    ;kfw;hrecall
    Enable SSH Logging    test.log

ConnectSecureCRTLog
    [Arguments]    ${HostURL}
    SSHLibrary.Open Connection    ${HostURL}    timeout=1 hour
    SSHLibrary.Login    serveradm    otsohkmv'

ConnectSecureCRTLog1
    [Arguments]    ${HostURL}
    SSHLibrary.Open Connection    ${HostURL}    timeout=1 hour
    SSHLibrary.Login    serveradm    otsohkmv'
    Write	su root    loglevel=DEBUG
    ${output}	Read    delay=1s
    Write	otsohkmv'    loglevel=DEBUG
    ${output}=	Read	delay=1s	# Shown in the console due to loglevel
    Should Contain	${output}	root@

ProduceKafka
    [Arguments]    ${cmdDeleteMassage}    ${cmdProduce}    ${produce}
    [Documentation]    ${cmdDeleteMassage} --> ลบ message
    ...    ${cmdProduce} --> คำสั่ง produce
    ...    ${produce} --> message ที่ต้องการ produce
    #เช็ค path ปัจจุบัน
    ${pwd}    SSHLibrary.Execute Command    pwd
    log    ${pwd}
    #ลบ message ก่อนหน้าออกไปก่อน
    ${stdout}    SSHLibrary.Write    ${cmdDeleteMassage}
    Comment    sleep    5
    #run คำสัง produce
    ${stdout}    SSHLibrary.Write    ${cmdProduce}    loglevel=DEBUG
    sleep    3
    #ใส่ข้อมูล produce
    SSHLibrary.Write    ${produce}    loglevel=DEBUG
    log    ${produce}

ProduceKafkaHeader
    [Arguments]    ${cmdDeleteMassage}    ${cmdProduce}    ${produce}
    [Documentation]    ${cmdDeleteMassage} --> ลบ message
    ...    ${cmdProduce} --> คำสั่ง produce
    ...    ${produce} --> message ที่ต้องการ produce
    #เช็ค path ปัจจุบัน
    ${pwd}    SSHLibrary.Execute Command    pwd
    log    ${pwd}
    #ลบ message ก่อนหน้าออกไปก่อน
    ${stdout}    SSHLibrary.Write    ${cmdDeleteMassage}
    Comment    sleep    10
    #run คำสัง produce
    ${stdout}    SSHLibrary.Write    ${cmdProduce}    loglevel=DEBUG
    sleep    3
    #ใส่ข้อมูล produce
    Comment    ${json}    BuiltIn.Set Variable    ${produce}
    Comment    ${DataHeader}    BuiltIn.Set Variable    ${Header}
    Comment    ${Value1}    Replace String    ${json}    {    ${DataHeader}    count=1
    Comment    BuiltIn.Log Many    {${Value1}}
    Comment    ${produce}    BuiltIn.Set Variable    {${Value1}}
    SSHLibrary.Write    ${produce}    loglevel=DEBUG
    log    ${produce}

ConsumeKafka
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
    sleep    3s
    ${output}    BuiltIn.Wait Until Keyword Succeeds    24x    5s    CheckConsumeNull    ${cmdConsume}    ${ConsumeResultFile}    ${pwd}
    [Return]    ${output}
ConsumeKafkaNEB
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
    sleep    3s
    ${output}    BuiltIn.Wait Until Keyword Succeeds    24x    5s     CheckConsumeNullNEB    ${cmdConsume}    ${ConsumeResultFile}    ${pwd}
    [Return]    ${output}    

SetLogNull
    [Arguments]    ${Command_Name}    ${pathLog}
    ${CurrentDate}    Get Current Date
    ${CurrentDate}    Split String    ${CurrentDate}    ${SPACE}
    ${CurrentDate}    BuiltIn.Set Variable    ${CurrentDate}[0]
    Comment    Log    ${CurrentDate}
    ${filename}    SSHLibrary.Execute Command    find ${pathLog}/log/ -type f -newermt "${CurrentDate}" | grep ${Command_Name} |cut -d '/' -f8    #find file : edit current day
    log    ${filename}
    IF    "${filename}" != ""
    SSHLibrary.Execute Command    echo "" > ${pathLog}/log/${filename}
    END
    #Set Stat Null
    ${filename_Stat}    SSHLibrary.Execute Command    find ${pathLog}/stat/ -type f \ -newermt "${CurrentDate}"
    IF    "${filename_Stat}" != ""
    SSHLibrary.Execute Command    echo "" > ${filename_Stat}
    END

FlushLogbyCommandName
    [Arguments]    ${Command_Name}    ${Number_TestCase}    ${pathLog}
    ${pwd}    SSHLibrary.Execute Command    pwd
    log    ${pwd}
    BuiltIn.Sleep    2
    ${stdout}    SSHLibrary.Execute Command    cd ${pathLog}/log/
    log    ${stdout}
    ${filename}    SSHLibrary.Execute Command    find ${pathLog}/log/ -type f -mmin -5 -prune| grep ${Command_Name} |cut -d '/' -f8
    log    ${filename}
    Comment    SSHLibrary.Execute Command    cp ${pathLog}/log/${filename} /app/mfaf/TestResult/${Number_TestCase}.log
    SSHLibrary.Execute Command    cp ${pathLog}/log/${filename} /LOCAL-NAS/livingnetwork/nsb/log_mfaf/TestResult/${Number_TestCase}.log
    ${ls}    SSHLibrary.Execute Command    ls -lrt /app/mfaf/TestResult/
    log    ${ls}

SetMockupResponse
    [Arguments]    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse}
    [Documentation]    ตอนเรียกใช้ควรวางต่อกับ keyword setLogNull เพราะ mockup อยู่ในเครื่อง 66 เครื่องเดียวกับ log จะได้ ConnectSecureCRT ครั้งเดียว
    ...    แต่ถ้าไม่วางต่อจาก setLog จะต้อง ConnectSecureCRT ก่อนทุกครั้ง
    ...
    ...
    ...    ${PathConfigAntiCorruptResponse} คือ Path ที่ \ Mockup อ่าน Response
    ...    ${PathDataAntiCorruptResponse} คือ Path file \ Data AntiCorrup Response ที่ต้องการ
    #Connect CRT
    Comment    ${PathData}    BuiltIn.Set Variable    ${PathDataAntiCorruptResponse}/${FileName}
    SSHLibrary.Execute Command    cp ${PathDataAntiCorruptResponse} ${PathConfigAntiCorruptResponse}


SetLogNull_NEB
    [Arguments]    ${Command_Name}    ${pathLog}
    ${filename}    SSHLibrary.Execute Command    find ${pathLog}/ -type f -mmin -5 -prune | grep ${Command_Name} |cut -d '/' -f8
    log    ${filename}
    IF    "${filename}" != ""
    SSHLibrary.Execute Command    echo "" > ${pathLog}/${filename}
    Sleep    3
    END
    
FlushLogbyCommandName_NEB
    [Arguments]    ${Command_Name}    ${Number_TestCase}    ${pathLog}
    ${pwd}    SSHLibrary.Execute Command    pwd
    log    ${pwd}
    BuiltIn.Sleep    2
    ${stdout}    SSHLibrary.Execute Command    cd ${pathLog}
    log    ${stdout}
    ${filename}    SSHLibrary.Execute Command    find ${pathLog}/ -type f -mmin -5 -prune| grep ${Command_Name} |cut -d '/' -f8 
    log    ${filename}
    SSHLibrary.Execute Command    cp ${pathLog}/${filename} /home/serveradm/LogResult/${Number_TestCase}.txt
    ${ls}    SSHLibrary.Execute Command    ls -lrt /home/serveradm/LogResult/
    log    ${ls}

CopyFileLM
    [Arguments]    ${pathFile}    ${filename}
    ${pwd}    SSHLibrary.Execute Command    pwd
    log    ${pwd}
    BuiltIn.Sleep    2
    ${stdout}    SSHLibrary.Execute Command    cd ${pathFile}
    log    ${stdout}
    ${filename}    SSHLibrary.Execute Command    find ${pathFile}/${filename}
    log    ${filename}
    SSHLibrary.Execute Command    cp ${pathFile}/${filename} /app/mfaf/network-event-bus/files/process/LM

FlushLogAndStatbyCommandName
    [Arguments]    ${Command_Name}    ${Number_TestCase}    ${pathLog}
    [Documentation]    Format : FlushLogAndStatbyCommandName | ${Command_Name} | ${Number_TestCase} | ${pathLog}
    ...
    ...    *Example :*
    ...    FlushLogAndStatbyCommandName | DMASTERSQA0001_MFAF_ | TST_Fx_1_1_001 | /home/serveradm/nsb/service-set-count-mode/logs
    ...
    ...    --------------------------------------------------------------------------------------------
    ...
    ...    ${Command_Name} : แนะนำให้ใส่ชื่อไฟล์ที่ log ที่เทสโดยที่ไม่ต้องใส่วันเดือนปีเวลาเข้ามาเพราะ keyword จะทำการ หาให้ว่าไฟล์ไหนที่ถูกแก้ภายใน 1 วันล่าสุด
    ...
    ...    ${pathLog} : path ที่ log อยู่
    ...
    ...    ${Number_TestCase} : เลขเทสเคส ที่แปลว่าเลขเทสเคส เก็บ log เทสเคสนั้นๆอ่ะ
    ${CurrentDate}    Get Current Date
    ${CurrentDate}    Split String    ${CurrentDate}    ${SPACE}
    ${CurrentDate}    BuiltIn.Set Variable    ${CurrentDate}[0]
    Comment    Log    ${CurrentDate}
    ${pwd}    SSHLibrary.Execute Command    pwd
    log    ${pwd}
    BuiltIn.Sleep    2
    #Process : Keep Log
    SSHLibrary.Execute Command    cd ${pathLog}/log/
    ${stdout}    SSHLibrary.Execute Command    cd ${pathLog}/log/
    log    ${stdout}
    ${filename}    SSHLibrary.Execute Command    find ${pathLog}/log/ -type f \ -newermt "${CurrentDate}"| grep ${Command_Name} |cut -d '/' -f8    #find file : edit current day\n
    log    ${filename}
    #Create Folder Log : F/Number_Testcase
    ${NameFolder}    Split String    ${Number_TestCase}    _
    ${F}    Fetch From Right    ${NameFolder}[1]    _
    Log    ${F}
    SSHLibrary.Execute Command    mkdir /LOCAL-NAS/livingnetwork/nsb/log_mfaf/TestResult/${F}
    SSHLibrary.Execute Command    mkdir /LOCAL-NAS/livingnetwork/nsb/log_mfaf/TestResult/${F}/${Number_TestCase}
    #Copy Log To Folder : Number_Testcase
    SSHLibrary.Execute Command    cp ${pathLog}/log/${filename} /LOCAL-NAS/livingnetwork/nsb/log_mfaf/TestResult/${F}/${Number_TestCase}/${Number_TestCase}.log
    Comment    ${ls}    SSHLibrary.Execute Command    ls -lrt /LOCAL-NAS/livingnetwork/nsb/log_mfaf/TestResult/${Number_TestCase}
    Comment    log    ${ls}
    #Process : Keep Stat
    SSHLibrary.Execute Command    cd ${pathLog}/stat/
    ${filenameStat}    SSHLibrary.Execute Command    find ${pathLog}/stat/ -type f \ -newermt "${CurrentDate}"
    ${stdout}    SSHLibrary.Execute Command    less ${filenameStat}
    Log    ${stdout}
    BuiltIn.Wait Until Keyword Succeeds    12x    5s    CheckStatNull    ${filenameStat}
    #Copy Stat To Folder : Number_Testcase
    ${filenameStat}    SSHLibrary.Execute Command    find ${pathLog}/stat/ -type f \ -newermt "${CurrentDate}"
    SSHLibrary.Execute Command    cp ${filenameStat} /LOCAL-NAS/livingnetwork/nsb/log_mfaf/TestResult/${F}/${Number_TestCase}/${Number_TestCase}.stat
    ${ls}    SSHLibrary.Execute Command    ls -lrt /LOCAL-NAS/livingnetwork/nsb/log_mfaf/TestResult/${F}/${Number_TestCase}
    log    ${ls}

CheckStatNull
    [Arguments]    ${filenameStat}
    ${stdout}    SSHLibrary.Execute Command    less ${filenameStat}
    Log    ${stdout}
    BuiltIn.Should Not Be Empty    ${stdout}
    BuiltIn.Should Not Be Equal    ${stdout}    value|typeline|dos|event|method|status|message|tableName|tableMethod|tableResultCode

CheckConsumeNull
    [Arguments]    ${cmdConsume}    ${ConsumeResultFile}    ${pwd}
    [Documentation]    ${cmdConsume} --> คำสั่ง consume
    ...    ${ConsumeResultFile} --> ชื่อไฟล์ที่จะเก็บข้อมูล consume
    ...
    ...    keyword นี้จะ consume ข้อมูลมา read และเก็บข้อมูล write ใส่ไฟล์เก็บไว้
    ...
    ...    return ข้อมูลที่ได้กลับไป (${output}) --> เรียกใช้โดย ${ConsumeResult}
    #read ข้อมูลที่ได้จากการ consume
    ${output}=    SSHLibrary.Read    loglevel=DEBUG    # Shown in the console due to loglevel
    #ตัดค่า > ที่ติดมากับข้อมูล
    ${output}    String.Replace String    ${output}    \r    ${EMPTY}
    ${output}    String.Replace String    ${output}    \n    ${EMPTY}
    Comment    ${output}    String.Replace String    ${output}    ${SPACE}    ${EMPTY}
    ${output}    String.Replace String    ${output}        ${EMPTY}
    ${output}    String.Replace String    ${output}    [?2004l    ${EMPTY}
    log    ${output}
    BuiltIn.Should Contain    ${output}    {
    #เขียนข้อมูลที่ read มาได้จาก consume ลงไฟล์
    SSHLibrary.Execute Command    echo '${output}' >${pwd}/ConsumeResult/${ConsumeResultFile}.txt
    BuiltIn.Set Global Variable    ${ConsumeResult}    ${output}
    [Return]    ${output}

CheckConsumeNullNEB
    [Arguments]    ${cmdConsume}    ${ConsumeResultFile}    ${pwd}
    [Documentation]    ${cmdConsume} --> คำสั่ง consume
    ...    ${ConsumeResultFile} --> ชื่อไฟล์ที่จะเก็บข้อมูล consume
    ...
    ...    keyword นี้จะ consume ข้อมูลมา read และเก็บข้อมูล write ใส่ไฟล์เก็บไว้
    ...
    ...    return ข้อมูลที่ได้กลับไป (${output}) --> เรียกใช้โดย ${ConsumeResult}
    #read ข้อมูลที่ได้จากการ consume
    Sleep    5
    ${output}=    SSHLibrary.Read    loglevel=DEBUG    # Shown in the console due to loglevel
    log    ${output}
    #ตัดค่า > ที่ติดมากับข้อมูล
    ${output}    String.Replace String    ${output}    \r    ${EMPTY}
    ${output}    String.Replace String    ${output}    \n    ${EMPTY}
    Comment    ${output}    String.Replace String    ${output}    ${SPACE}    ${EMPTY}
    ${output}    String.Replace String    ${output}        ${EMPTY}
    ${output}    String.Replace String    ${output}    [?2004l    ${EMPTY}
    log    ${output}
    #เขียนข้อมูลที่ read มาได้จาก consume ลงไฟล์
    SSHLibrary.Execute Command    echo '${output}' > ${pwd}/ConsumeResult/${ConsumeResultFile}.txt
    BuiltIn.Set Global Variable    ${ConsumeResult}    ${output}
    [Return]    ${output}    
