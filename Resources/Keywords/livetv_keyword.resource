*** Settings ***
Resource    ../../TestSuites/resource_init.robot

*** Keywords ***
Select Live TV In Menu Bar
    [Documentation]    Owner: Kachain.a
    ...                กดเพื่อเข้าไปที่ Live TV Page
    [Tags]      keyword_action
    Wait For Elements State     ${mnu_livetv_sidemenu}    visible             
    Scroll To Element           ${mnu_livetv_sidemenu}
    Click      ${mnu_livetv_sidemenu}

Verify Live TV Page
    [Documentation]    Owner: Kachain.a
    ...    Description : ตัวอย่างการ verify live tv page แบบคร่าวๆครับ
    [Tags]      keyword_action
    Wait For Elements State               ${pnl_tvprogram_guides}                visible
    Wait For Elements State               ${lbl_Livetv_channel_active}           visible
    Wait For Elements State               ${lbl_Livetv_channel_nameactive}       visible
    Wait For Elements State               ${img_Logo_channel_active}             visible
    ${channel_number}       Get Text      ${lbl_Livetv_channel_active}
    ${channel_name}         Get Text      ${lbl_Livetv_channel_nameactive}
    Log     Chanel is... ${channel_number} : ${channel_name}    console=${True}
    Take Screenshot                       fullPage=${True}

Select Channel Number Is ${channel} And Verify Change Channel
    [Documentation]    Owner: Kachain.a
    [Tags]      keyword_action
    Wait For Elements State                      ${pnl_tvprogram_guides}                visible
    ${before_channel_number}       Get Text      ${lbl_Livetv_channel_active}
    Take Screenshot                fullPage=${True}
    Click      ${lbl_channel}\[normalize-space(text())="${channel}"]
    ${after_channel_number}        Get Text      ${lbl_Livetv_channel_active}
    Should Not Be Equal            ${before_channel_number}       ${after_channel_number}
    Should Be Equal                ${after_channel_number}        ${channel}
    Log     Before Channel Number Is ${before_channel_number}, After Channel Number Is ${after_channel_number}    console=${True}
    Take Screenshot    fullPage=${True}