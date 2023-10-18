*** Variables ***
${HostURL_10.137.30.66}    10.137.30.66
${HostURL_10.137.30.65}    10.137.30.65
${HostURL_10.138.38.229}    10.138.38.229
${HostURL_10.138.38.228}    10.138.38.228
${HostURL_10.137.45.30}    10.137.45.30
${HostURL_10.138.42.190}    10.138.42.190
${HostURL_10.138.42.184}    10.138.42.184
${DataBaseNameNSB}    mfaf_nsb
${DataBaseNameNEB}    mfaf_neb
${DataBaseNameNEB_qa}    mfaf_neb_qa
${PathLogNSB}     /app/mfaf/network-service-bus/logs
${PathLogNEB}     /app/mfaf/network-event-bus/logs
${CollactionNameLivingNetworkMSISDN}    livingNetworkMSISDN
${CollactionNameLivingNetwork5GModePackage}    livingNetwork5GModePackage
${CollectionNameLivingNetwork5GModePackage_QA}    QA_livingNetwork5GModePackage
${CollactionNameCellResourceInventory}    cellResourceInventory
${CollactionNameCellUserLocation}    cellUserLocation
${CollactionNameUserLocation}    userLocation
${CollactionNameLocationMasterCell}    locationMasterCell
${CollactionNamemyNetworkUserLocation}    myNetworkUserLocation
${CollactionNameLocationMasterCcmsAisShop}    locationMasterCcmsAisShop
${CollactionNameLocationMasterPOI}    locationMasterPOI
${ConsumeResult}    ${EMPTY}
${CollactionNamenetworkStatusPaper}    QA_networkStatusPaper
${CollactionNamenetworkQualityStatus}    QA_networkQualityStatus
${CollactionNameperformanceLevel}    QA_performanceLevel
${CollectionNameSetAgreeTC}    privacyProfile
${CollectionNameqaServicePackageConfiguration}    qaServicePackageConfiguration
${CollectionNameqaNetworkStatusPaper_F2}    qaNetworkStatusPaper_F2
${CollectionNameqaNetworkStatusPaper}    qaNetworkStatusPaper
${CollectionNameqaNetworkQualityStatus}    qaNetworkQualityStatus
${CollectionNameqaPerformanceLevel}    qaPerformanceLevel
${CollectionNameqaPerformanceLevel_F2}    qaPerformanceLevel_fah
${CollectionNameqaProfilePaper}    qaProfilePaper
${CollectionNameSetRatingLevel}    qaSetRatingLevel
${Header}         ${EMPTY}
#For Keyword VerifyStatBy Command : Config ListNameService
&{service-network-status-problem-may}    Consume=qa.problemAreaCellRequested_may    Produce=qa.networkStatusRequested_may    MongoDB=qaNetworkStatusPaper_may
&{service-network-status-problem}    Consume=qa.problemAreaCellRequested    Produce=qa.networkStatusRequested    MongoDB=qaNetworkStatusPaper
&{service-set-count-mode}    Consume=qa.requestSetCountMode    Produce=qa.setCountModeRequested    MongoDB=qaProfilePaper
&{service-network-status}    Consume=qa.requestNetworkStatus    Produce=qa.requestProblemAreaCell    MongoDBProfilePaper=qaProfilePaper    MongoDBPerformanceLevel=qaPerformanceLevel_fah    MongoDBNetworkQualityStatus=qaNetworkQualityStatus    MongoDBNetworkStatusPaper=qaNetworkStatusPaper_F2
&{service-network-status-01}    Consume=qa.requestNetworkStatus01    Produce=qa.requestProblemAreaCell01    MongoDBProfilePaper=qaProfilePaper    MongoDBPerformanceLevel=qaPerformanceLevel    MongoDBNetworkQualityStatus=qaNetworkQualityStatus    MongoDBNetworkStatusPaper=qaNetworkStatusPaper
&{service-network-status-02}    Consume=qa.requestNetworkStatus_02    Produce=qa.requestProblemAreaCell_02    MongoDBProfilePaper=qaProfilePaper    MongoDBPerformanceLevel=qaPerformanceLevel    MongoDBNetworkQualityStatus=qaNetworkQualityStatus    MongoDBNetworkStatusPaper=qaNetworkStatusPaper
&{service-check-agree-tc}    Consume=qa.requestCheckAgreeTC2    Produce=qa.checkAgreeTCRequested2    MongoDB=qaPrivacyProfile
&{service-set-agree-tc}    Consume=qa.requestSetAgreeTC    Produce=qa.setAgreeTCRequested2    MongoDB=qaPrivacyProfile
&{service-set-rating}    Consume=qa.requestSetRating    Produce=qa.setRatingRequested    MongoDB=qaSetRatingLevel
&{service-check-profile-Bo}    Consume=qa.requestCheckProfile_Bo    Produce=qa.checkProfileRequested_Bo    MongoDB=qaProfilePaper_F11
&{service-check-profile-tea}    Consume=qa.requestCheckProfile_tea    Produce=qa.checkProfileRequested_tea    MongoDB=qaProfilePaper
&{service-check-profile-may}    Consume=qa.requestCheckProfile_may    Produce=qa.checkProfileRequested_may    MongoDB=profilePaper
&{DefineListDOS}    nsb-set-count-mode=SetCountMode    nsb-network-status-problem=NetworkStatusProblem    nsb-network-status=NetworkStatus    nsb-check-agree-tc=CheckAgreeTC    nsb-set-agree-tc=SetAgreeTC    nsb-set-rating=SetRating    nsb-check-profile=CheckProfile
${JsonFomatExpectDb}    {"msisdn":"","isUsingFupPackage":false,"networkType":"","5GMode":{"currentMode":"","packageName":"","packageExpireTime":"","productSequenceId":"","initialAmount":0,"remainingAmount":0,"countChangeMode":0,"dateCountChangeMode":""}}
