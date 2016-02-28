
DROP TABLE HQI_HOSP;
CREATE EXTERNAL TABLE HQI_HOSP (
    ProviderID string,
    HospitalName string,
    Address string,
    City string,
    State string,
    ZIP string,
    CountyName string,
    PhoneNumber string,
    HospitalType string,
    HospitalOwnership string,
    EmergencyServices string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
    "separatorChar" = ",",
    "quoteChar" = '"',
	"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/ds1';


DROP TABLE HQI_HOSP_HCAHPS;
CREATE EXTERNAL TABLE HQI_HOSP_HCAHPS (
    ProviderID string,
    HospitalName string,
    Address string,
    City string,
    State string,
    ZIPCode string,
    CountyName string,
    PhoneNumber string,
    HCAHPSMeasureID string,
    HCAHPSQuestion string,
    HCAHPSAnswerDescription string,
    PatientSurveyStarRating string,
    PatientSurveyStarRatingFootnote string,
    HCAHPSAnswerPercent string,
    HCAHPSAnswerPercentFootnote string,
    HCAHPSLinearMeanValue string,
    NumberofCompletedSurveys string,
    NumberofCompletedSurveysFootnote string,
    SurveyResponseRatePercent string,
    SurveyResponseRatePercentFootnote string,
    MeasureStartDate string,
    MeasureEndDate string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
    "separatorChar" = ",",
    "quoteChar" = '"',
	"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/ds3';


DROP TABLE HQI_HOSPITAL_COMP;
CREATE EXTERNAL TABLE HQI_HOSPITAL_COMP (
    ProviderID string,
    HospitalName string,
    Address string,
    City string,
    State string,
    ZIPCode string,
    CountyName string,
    PhoneNumber string,
    MeasureName string,
    MeasureID string,
    ComparedtoNational string,
    Denominator string,
    Score string,
    LowerEstimate string,
    HigherEstimate string,
    Footnote string,
    MeasureStartDate string,
    MeasureEndDate string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
    "separatorChar" = ",",
    "quoteChar" = '"',
	"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/ds2';


DROP TABLE HQI_OP_Procedure_Volume;
CREATE EXTERNAL TABLE HQI_OP_Procedure_Volume (
    ProviderID string,
    HospitalName string,
    MeasureID string,
    Gastrointestinal string,
    Eye string,
    NervousSystem string,
    Musculoskeletal string,
    Skin string,
    Genitourinary string,
    Cardiovascular string,
    Respiratory string,
    Other string,
    Footnote string,
    StartDate string,
    EndDate string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
    "separatorChar" = ",",
    "quoteChar" = '"',
	"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/ds4';


