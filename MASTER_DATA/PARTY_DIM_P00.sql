/* FILE NAME: PARTY_DIM_P00.SQL
--
-- DESCRIPTION:  THE SCRIPT HAS BEEN CREATED TO INSERT/UPDATE DATA INTO PARTY_DIM 
-- AUTHOR(S):
-- 
--
-- LATEST REVISION:
-- 20210527 DRAFT CODE
---------------------------- */
	
 -----------------------------------UPDATE PARTY_DIM SQL------------------------------------------- 
 
UPDATE %TOBI_MDM%.PARTY_DIM--DB NAME TO BE PICKED FROM PYTHON PARAMETER
FROM (
SELECT
PARTY_DIM.PK_PARTY_DIM_ID,
STG_DIM_PARTY_CHANGES.FK_TERRITORY_DIM_ID,
STG_DIM_PARTY_CHANGES.PARTY_CD_NK,
STG_DIM_PARTY_CHANGES.PTYPE,
CASE WHEN STG_DIM_PARTY_CHANGES.SUPPRESS_INVOICE_REMINDER_FLAG='y' THEN 'Suppress Invoice Reminder'  ELSE 
CASE WHEN STG_DIM_PARTY_CHANGES.SUPPRESS_INVOICE_REMINDER_FLAG='n'THEN 'Allow Invoice Reminder' ELSE NULL END END AS SUPPRESS_INVOICE_REMINDER_FLAG,
CASE WHEN STG_DIM_PARTY_CHANGES.SELF_BILLING='y' THEN 'Self Billing' ELSE CASE WHEN STG_DIM_PARTY_CHANGES.SELF_BILLING='n' THEN 'No Self Billing' ELSE NULL END END AS SELF_BILLING,
STG_DIM_PARTY_CHANGES.VAT_NUM,
CASE WHEN STG_DIM_PARTY_CHANGES.DIRECT_DEBIT_FLAG='y' THEN 'Direct Debit' ELSE CASE WHEN  STG_DIM_PARTY_CHANGES.DIRECT_DEBIT_FLAG='n' THEN 'Not Applicable' ELSE NULL END END AS DIRECT_DEBIT_FLAG,
STG_DIM_PARTY_CHANGES.BAD_DEBT,
STG_DIM_PARTY_CHANGES.PAYMENT_PREF,
STG_DIM_PARTY_CHANGES.CREDIT_STAT,
STG_DIM_PARTY_CHANGES.TERMS_OF_PAYMENT_NUM,
STG_DIM_PARTY_CHANGES.CREDIT_LIMIT_DT,
STG_DIM_PARTY_CHANGES.CREDIT_LIMIT_AMT,
STG_DIM_PARTY_CHANGES.TITLE_PERSON,
STG_DIM_PARTY_CHANGES."PREFIX",
STG_DIM_PARTY_CHANGES.FIRST_NAME,
STG_DIM_PARTY_CHANGES.INITIALS,
STG_DIM_PARTY_CHANGES.SURNAME,
STG_DIM_PARTY_CHANGES.GENDER,
STG_DIM_PARTY_CHANGES.BIRTHDATE_DT,
STG_DIM_PARTY_CHANGES.START_DT,
STG_DIM_PARTY_CHANGES.END_DT,
CAST(CAST(CURRENT_TIMESTAMP AS CHAR(19)) AS TIMESTAMP(0)) AS CREATED_DT,
CAST(CAST(CURRENT_TIMESTAMP AS CHAR(19)) AS TIMESTAMP(0)) AS UPDATE_DT,
STG_DIM_PARTY_CHANGES.EXPIRED,
STG_DIM_PARTY_CHANGES.HOME_STREET1,
STG_DIM_PARTY_CHANGES.HOME_STREET2,
STG_DIM_PARTY_CHANGES.HOME_STREET3,
STG_DIM_PARTY_CHANGES.HOME_CITY,
STG_DIM_PARTY_CHANGES.HOME_ZIPCODE,
STG_DIM_PARTY_CHANGES.DEL_STREET1,
STG_DIM_PARTY_CHANGES.DEL_STREET2,
STG_DIM_PARTY_CHANGES.DEL_STREET3,
STG_DIM_PARTY_CHANGES.DEL_CITY,
STG_DIM_PARTY_CHANGES.DEL_ZIPCODE,
STG_DIM_PARTY_CHANGES.POST_STREET1,
STG_DIM_PARTY_CHANGES.POST_STREET2,
STG_DIM_PARTY_CHANGES.POST_STREET3,
STG_DIM_PARTY_CHANGES.POST_CITY,
STG_DIM_PARTY_CHANGES.POST_ZIPCODE,
STG_DIM_PARTY_CHANGES.INV_STREET1,
STG_DIM_PARTY_CHANGES.INV_STREET2,
STG_DIM_PARTY_CHANGES.INV_STREET3,
STG_DIM_PARTY_CHANGES.INV_CITY,
STG_DIM_PARTY_CHANGES.INV_ZIPCODE,
STG_DIM_PARTY_CHANGES.RET_STREET1,
STG_DIM_PARTY_CHANGES.RET_STREET2,
STG_DIM_PARTY_CHANGES.RET_STREET3,
STG_DIM_PARTY_CHANGES.RET_CITY,
STG_DIM_PARTY_CHANGES.RET_ZIPCODE,
STG_DIM_PARTY_CHANGES.LA_STREET1,
STG_DIM_PARTY_CHANGES.LA_STREET2,
STG_DIM_PARTY_CHANGES.LA_STREET3,
STG_DIM_PARTY_CHANGES.LA_CITY,
STG_DIM_PARTY_CHANGES.LA_ZIPCODE,
STG_DIM_PARTY_CHANGES.CONTACT_NOS,
STG_DIM_PARTY_CHANGES.APPROVED,
STG_DIM_PARTY_CHANGES.DISPLAY_NAME,
CASE WHEN STG_DIM_PARTY_CHANGES.DELETION_INDICATOR= 1 THEN 'Y' ELSE NULL END AS DELETED_FROM_MACCS,
STG_DIM_PARTY_CHANGES.CIRCUIT_CATEGORY,
STG_DIM_PARTY_CHANGES.PAYER_GROUP,
STG_DIM_PARTY_CHANGES.FK_PAYER_GROUP,
STG_DIM_PARTY_CHANGES.FK_PAYER_CIRCUIT,
STG_DIM_PARTY_CHANGES.FISCAL_CODE,
STG_DIM_PARTY_CHANGES.CODE_TERMS_CATEGORY,
STG_DIM_PARTY_CHANGES.TERMS_CATEGORY_DESC,
STG_DIM_PARTY_CHANGES.CREATION_DATE,
STG_DIM_PARTY_CHANGES.CREDIT_REMARK_DESC,
STG_DIM_PARTY_CHANGES.CREDIT_STATUS_DATE,
STG_DIM_PARTY_CHANGES.ACCOUNTMGR,
STG_DIM_PARTY_CHANGES.CODE_LOCAL,
STG_DIM_PARTY_CHANGES.RELN_VAT_NUMBER,
COSTCENTRE_DIM.PK_COSTCENTRE_DIM_ID AS FK_COSTCENTRE_DIM_ID,
STG_DIM_PARTY_CHANGES.PAYER_CITY_CODE,
STG_DIM_PARTY_CHANGES.DESCRIPTION AS PAYER_CATEGORY_DESC,
STG_DIM_PARTY_CHANGES.CHAMBER_OF_COMMERCE,
STG_DIM_PARTY_CHANGES.DC_NUMBER
FROM    %TOBI_STG%.STG_DIM_PARTY_CHANGES STG_DIM_PARTY_CHANGES
LEFT OUTER JOIN %TOBI_MDM%.COSTCENTRE_DIM COSTCENTRE_DIM ON 
(COSTCENTRE_DIM.COSTCENTRE_CD_NK=STG_DIM_PARTY_CHANGES.CODE_COST_CENTRE)
LEFT OUTER JOIN %TOBI_MDM%.PARTY_DIM PARTY_DIM ON 
( PARTY_DIM.FK_TERRITORY_DIM_ID = STG_DIM_PARTY_CHANGES.FK_TERRITORY_DIM_ID
AND PARTY_DIM.PARTY_CD_NK = STG_DIM_PARTY_CHANGES.PARTY_CD_NK
AND PARTY_DIM.PTYPE = STG_DIM_PARTY_CHANGES.PTYPE )
WHERE STG_DIM_PARTY_CHANGES.FK_TERRITORY_DIM_ID IN
                  (SELECT TERRITORY_ID
                FROM %TOBI_ADMIN%.FDDM_LOAD_TERRITORIES
                WHERE LOAD_STATUS = 'COMPLETED'
                      AND REGION_ID = (SELECT DISTINCT REGION_ID FROM %TOBI_ADMIN%.TOBI_CONFIG WHERE RUN_FLAG='Y'))
AND PARTY_DIM.PK_PARTY_DIM_ID IS NOT NULL
)UPD_SET
SET              
FK_TERRITORY_DIM_ID           =UPD_SET.FK_TERRITORY_DIM_ID           ,
PARTY_CD_NK                   =UPD_SET.PARTY_CD_NK                   ,
PTYPE                         =UPD_SET.PTYPE                         ,
SUPPRESS_INVOICE_REMINDER_FLAG=UPD_SET.SUPPRESS_INVOICE_REMINDER_FLAG,
SELF_BILLING                  =UPD_SET.SELF_BILLING                  ,
VAT_NUM                       =UPD_SET.VAT_NUM                       ,
DIRECT_DEBIT_FLAG             =UPD_SET.DIRECT_DEBIT_FLAG             ,
BAD_DEBT                      =UPD_SET.BAD_DEBT                      ,
PAYMENT_PREF                  =UPD_SET.PAYMENT_PREF                  ,
CREDIT_STAT                   =UPD_SET.CREDIT_STAT                   ,
TERMS_OF_PAYMENT_NUM          =UPD_SET.TERMS_OF_PAYMENT_NUM          ,
CREDIT_LIMIT_DT               =UPD_SET.CREDIT_LIMIT_DT               ,
CREDIT_LIMIT_AMT              =UPD_SET.CREDIT_LIMIT_AMT              ,
TITLE_PERSON                  =UPD_SET.TITLE_PERSON                  ,
"PREFIX"                      =UPD_SET."PREFIX"                      ,
FIRST_NAME                    =UPD_SET.FIRST_NAME                    ,
INITIALS                      =UPD_SET.INITIALS                      ,
SURNAME                       =UPD_SET.SURNAME                       ,
GENDER                        =UPD_SET.GENDER                        ,
BIRTHDATE_DT                  =UPD_SET.BIRTHDATE_DT                  ,
START_DT                      =UPD_SET.START_DT                      ,
END_DT                        =UPD_SET.END_DT                        ,
UPDATE_DT                     =UPD_SET.UPDATE_DT                     ,
EXPIRED                       =UPD_SET.EXPIRED                       ,
HOME_STREET1                  =UPD_SET.HOME_STREET1                  ,
HOME_STREET2                  =UPD_SET.HOME_STREET2                  ,
HOME_STREET3                  =UPD_SET.HOME_STREET3                  ,
HOME_CITY                     =UPD_SET.HOME_CITY                     ,
HOME_ZIPCODE                  =UPD_SET.HOME_ZIPCODE                  ,
DEL_STREET1                   =UPD_SET.DEL_STREET1                   ,
DEL_STREET2                   =UPD_SET.DEL_STREET2                   ,
DEL_STREET3                   =UPD_SET.DEL_STREET3                   ,
DEL_CITY                      =UPD_SET.DEL_CITY                      ,
DEL_ZIPCODE                   =UPD_SET.DEL_ZIPCODE                   ,
POST_STREET1                  =UPD_SET.POST_STREET1                  ,
POST_STREET2                  =UPD_SET.POST_STREET2                  ,
POST_STREET3                  =UPD_SET.POST_STREET3                  ,
POST_CITY                     =UPD_SET.POST_CITY                     ,
POST_ZIPCODE                  =UPD_SET.POST_ZIPCODE                  ,
INV_STREET1                   =UPD_SET.INV_STREET1                   ,
INV_STREET2                   =UPD_SET.INV_STREET2                   ,
INV_STREET3                   =UPD_SET.INV_STREET3                   ,
INV_CITY                      =UPD_SET.INV_CITY                      ,
INV_ZIPCODE                   =UPD_SET.INV_ZIPCODE                   ,
RET_STREET1                   =UPD_SET.RET_STREET1                   ,
RET_STREET2                   =UPD_SET.RET_STREET2                   ,
RET_STREET3                   =UPD_SET.RET_STREET3                   ,
RET_CITY                      =UPD_SET.RET_CITY                      ,
RET_ZIPCODE                   =UPD_SET.RET_ZIPCODE                   ,
LA_STREET1                    =UPD_SET.LA_STREET1                    ,
LA_STREET2                    =UPD_SET.LA_STREET2                    ,
LA_STREET3                    =UPD_SET.LA_STREET3                    ,
LA_CITY                       =UPD_SET.LA_CITY                       ,
LA_ZIPCODE                    =UPD_SET.LA_ZIPCODE                    ,
CONTACT_NOS                   =UPD_SET.CONTACT_NOS                   ,
APPROVED                      =UPD_SET.APPROVED                      ,
DISPLAY_NAME                  =UPD_SET.DISPLAY_NAME                  ,
DELETED_FROM_MACCS            =UPD_SET.DELETED_FROM_MACCS            ,
CIRCUIT_CATEGORY              =UPD_SET.CIRCUIT_CATEGORY              ,
PAYER_GROUP                   =UPD_SET.PAYER_GROUP                   ,
FK_PAYER_GROUP                =UPD_SET.FK_PAYER_GROUP                ,
FK_PAYER_CIRCUIT              =UPD_SET.FK_PAYER_CIRCUIT              ,
FISCAL_CODE                   =UPD_SET.FISCAL_CODE                   ,
CODE_TERMS_CATEGORY           =UPD_SET.CODE_TERMS_CATEGORY           ,
TERMS_CATEGORY_DESC           =UPD_SET.TERMS_CATEGORY_DESC           ,
CREATION_DATE                 =UPD_SET.CREATION_DATE                 ,
CREDIT_REMARK_DESC            =UPD_SET.CREDIT_REMARK_DESC            ,
CREDIT_STATUS_DATE            =UPD_SET.CREDIT_STATUS_DATE            ,
ACCOUNTMGR                    =UPD_SET.ACCOUNTMGR                    ,
CODE_LOCAL                    =UPD_SET.CODE_LOCAL                    ,
RELN_VAT_NUMBER               =UPD_SET.RELN_VAT_NUMBER               ,
FK_COSTCENTRE_DIM_ID          =UPD_SET.FK_COSTCENTRE_DIM_ID          ,
PAYER_CITY_CODE               =UPD_SET.PAYER_CITY_CODE               ,
PAYER_CATEGORY_DESC           =UPD_SET.PAYER_CATEGORY_DESC           ,
chamber_of_commerce           =UPD_SET.chamber_of_commerce           ,
DC_NUMBER                     =UPD_SET.DC_NUMBER                     
WHERE PARTY_DIM.PK_PARTY_DIM_ID=UPD_SET.PK_PARTY_DIM_ID;

-----------------------------------INSERT PARTY_DIM SQL------------------------------------------- 

INSERT into %TOBI_MDM%.PARTY_DIM --DB NAME TO BE PICKED FROM PYTHON PARAMETER
(
PK_PARTY_DIM_ID               
,FK_TERRITORY_DIM_ID           
,PARTY_CD_NK                   
,PTYPE                         
,SUPPRESS_INVOICE_REMINDER_FLAG
,SELF_BILLING                  
,VAT_NUM                       
,DIRECT_DEBIT_FLAG             
,BAD_DEBT                      
,PAYMENT_PREF                  
,CREDIT_STAT                   
,TERMS_OF_PAYMENT_NUM          
,CREDIT_LIMIT_DT               
,CREDIT_LIMIT_AMT              
,TITLE_PERSON                  
,"PREFIX "                       
,FIRST_NAME                    
,INITIALS                      
,SURNAME                       
,GENDER                        
,BIRTHDATE_DT                  
,START_DT                      
,END_DT                        
,CREATED_DT                    
,UPDATE_DT
,EXPIRED                                            
,HOME_STREET1                  
,HOME_STREET2                  
,HOME_STREET3                  
,HOME_CITY                     
,HOME_ZIPCODE                  
,DEL_STREET1                   
,DEL_STREET2                   
,DEL_STREET3                   
,DEL_CITY                      
,DEL_ZIPCODE                   
,POST_STREET1                  
,POST_STREET2                  
,POST_STREET3                  
,POST_CITY                     
,POST_ZIPCODE                  
,INV_STREET1                   
,INV_STREET2                   
,INV_STREET3                   
,INV_CITY                      
,INV_ZIPCODE                   
,RET_STREET1                   
,RET_STREET2                   
,RET_STREET3                   
,RET_CITY                      
,RET_ZIPCODE                   
,LA_STREET1                    
,LA_STREET2                    
,LA_STREET3                    
,LA_CITY                       
,LA_ZIPCODE                    
,CONTACT_NOS                   
,APPROVED                      
,DISPLAY_NAME                  
,DELETED_FROM_MACCS            
,CIRCUIT_CATEGORY              
,PAYER_GROUP                   
,FK_PAYER_GROUP                
,FK_PAYER_CIRCUIT              
,FISCAL_CODE                   
,CODE_TERMS_CATEGORY           
,TERMS_CATEGORY_DESC           
,CREATION_DATE                 
,CREDIT_REMARK_DESC            
,CREDIT_STATUS_DATE            
,ACCOUNTMGR                    
,CODE_LOCAL                    
,RELN_VAT_NUMBER               
,FK_COSTCENTRE_DIM_ID          
,PAYER_CITY_CODE               
,PAYER_CATEGORY_DESC           
,chamber_of_commerce           
,DC_NUMBER                     
)
SELECT
ROW_NUMBER()OVER(ORDER BY STG_DIM_PARTY_CHANGES.FK_TERRITORY_DIM_ID,STG_DIM_PARTY_CHANGES.PARTY_CD_NK,STG_DIM_PARTY_CHANGES.PTYPE) + coalesce(ID_MX,0) AS PK_PARTY_DIM_ID,
STG_DIM_PARTY_CHANGES.FK_TERRITORY_DIM_ID,
STG_DIM_PARTY_CHANGES.PARTY_CD_NK,
STG_DIM_PARTY_CHANGES.PTYPE,
CASE WHEN STG_DIM_PARTY_CHANGES.SUPPRESS_INVOICE_REMINDER_FLAG='y' THEN 'Suppress Invoice Reminder'  ELSE 
CASE WHEN STG_DIM_PARTY_CHANGES.SUPPRESS_INVOICE_REMINDER_FLAG='n'THEN 'Allow Invoice Reminder' ELSE NULL END END AS SUPPRESS_INVOICE_REMINDER_FLAG,
CASE WHEN STG_DIM_PARTY_CHANGES.SELF_BILLING='y' THEN 'Self Billing' ELSE CASE WHEN STG_DIM_PARTY_CHANGES.SELF_BILLING='n' THEN 'No Self Billing' ELSE NULL END END AS SELF_BILLING,
STG_DIM_PARTY_CHANGES.VAT_NUM,
CASE WHEN STG_DIM_PARTY_CHANGES.DIRECT_DEBIT_FLAG='y' THEN 'Direct Debit' ELSE CASE WHEN  STG_DIM_PARTY_CHANGES.DIRECT_DEBIT_FLAG='n' THEN 'Not Applicable' ELSE NULL END END AS DIRECT_DEBIT_FLAG,
STG_DIM_PARTY_CHANGES.BAD_DEBT,
STG_DIM_PARTY_CHANGES.PAYMENT_PREF,
STG_DIM_PARTY_CHANGES.CREDIT_STAT,
STG_DIM_PARTY_CHANGES.TERMS_OF_PAYMENT_NUM,
STG_DIM_PARTY_CHANGES.CREDIT_LIMIT_DT,
STG_DIM_PARTY_CHANGES.CREDIT_LIMIT_AMT,
STG_DIM_PARTY_CHANGES.TITLE_PERSON,
STG_DIM_PARTY_CHANGES."PREFIX",
STG_DIM_PARTY_CHANGES.FIRST_NAME,
STG_DIM_PARTY_CHANGES.INITIALS,
STG_DIM_PARTY_CHANGES.SURNAME,
STG_DIM_PARTY_CHANGES.GENDER,
STG_DIM_PARTY_CHANGES.BIRTHDATE_DT,
STG_DIM_PARTY_CHANGES.START_DT,
STG_DIM_PARTY_CHANGES.END_DT,
CAST(CAST(CURRENT_TIMESTAMP AS CHAR(19)) AS TIMESTAMP(0)) AS CREATED_DT,
CAST(CAST(CURRENT_TIMESTAMP AS CHAR(19)) AS TIMESTAMP(0)) AS UPDATE_DT,
STG_DIM_PARTY_CHANGES.EXPIRED,
STG_DIM_PARTY_CHANGES.HOME_STREET1,
STG_DIM_PARTY_CHANGES.HOME_STREET2,
STG_DIM_PARTY_CHANGES.HOME_STREET3,
STG_DIM_PARTY_CHANGES.HOME_CITY,
STG_DIM_PARTY_CHANGES.HOME_ZIPCODE,
STG_DIM_PARTY_CHANGES.DEL_STREET1,
STG_DIM_PARTY_CHANGES.DEL_STREET2,
STG_DIM_PARTY_CHANGES.DEL_STREET3,
STG_DIM_PARTY_CHANGES.DEL_CITY,
STG_DIM_PARTY_CHANGES.DEL_ZIPCODE,
STG_DIM_PARTY_CHANGES.POST_STREET1,
STG_DIM_PARTY_CHANGES.POST_STREET2,
STG_DIM_PARTY_CHANGES.POST_STREET3,
STG_DIM_PARTY_CHANGES.POST_CITY,
STG_DIM_PARTY_CHANGES.POST_ZIPCODE,
STG_DIM_PARTY_CHANGES.INV_STREET1,
STG_DIM_PARTY_CHANGES.INV_STREET2,
STG_DIM_PARTY_CHANGES.INV_STREET3,
STG_DIM_PARTY_CHANGES.INV_CITY,
STG_DIM_PARTY_CHANGES.INV_ZIPCODE,
STG_DIM_PARTY_CHANGES.RET_STREET1,
STG_DIM_PARTY_CHANGES.RET_STREET2,
STG_DIM_PARTY_CHANGES.RET_STREET3,
STG_DIM_PARTY_CHANGES.RET_CITY,
STG_DIM_PARTY_CHANGES.RET_ZIPCODE,
STG_DIM_PARTY_CHANGES.LA_STREET1,
STG_DIM_PARTY_CHANGES.LA_STREET2,
STG_DIM_PARTY_CHANGES.LA_STREET3,
STG_DIM_PARTY_CHANGES.LA_CITY,
STG_DIM_PARTY_CHANGES.LA_ZIPCODE,
STG_DIM_PARTY_CHANGES.CONTACT_NOS,
STG_DIM_PARTY_CHANGES.APPROVED,
STG_DIM_PARTY_CHANGES.DISPLAY_NAME,
CASE WHEN STG_DIM_PARTY_CHANGES.DELETION_INDICATOR= 1 THEN 'Y' ELSE NULL END AS DELETED_FROM_MACCS,
STG_DIM_PARTY_CHANGES.CIRCUIT_CATEGORY,
STG_DIM_PARTY_CHANGES.PAYER_GROUP,
STG_DIM_PARTY_CHANGES.FK_PAYER_GROUP,
STG_DIM_PARTY_CHANGES.FK_PAYER_CIRCUIT,
STG_DIM_PARTY_CHANGES.FISCAL_CODE,
STG_DIM_PARTY_CHANGES.CODE_TERMS_CATEGORY,
STG_DIM_PARTY_CHANGES.TERMS_CATEGORY_DESC,
STG_DIM_PARTY_CHANGES.CREATION_DATE,
STG_DIM_PARTY_CHANGES.CREDIT_REMARK_DESC,
STG_DIM_PARTY_CHANGES.CREDIT_STATUS_DATE,
STG_DIM_PARTY_CHANGES.ACCOUNTMGR,
STG_DIM_PARTY_CHANGES.CODE_LOCAL,
STG_DIM_PARTY_CHANGES.RELN_VAT_NUMBER,
COSTCENTRE_DIM.PK_COSTCENTRE_DIM_ID AS FK_COSTCENTRE_DIM_ID,
STG_DIM_PARTY_CHANGES.PAYER_CITY_CODE,
STG_DIM_PARTY_CHANGES.DESCRIPTION AS PAYER_CATEGORY_DESC,
STG_DIM_PARTY_CHANGES.CHAMBER_OF_COMMERCE,
STG_DIM_PARTY_CHANGES.DC_NUMBER
FROM 
%TOBI_STG%.STG_DIM_PARTY_CHANGES STG_DIM_PARTY_CHANGES
LEFT OUTER JOIN %TOBI_MDM%.COSTCENTRE_DIM COSTCENTRE_DIM ON 
(COSTCENTRE_DIM.COSTCENTRE_CD_NK=STG_DIM_PARTY_CHANGES.CODE_COST_CENTRE)
LEFT OUTER JOIN %TOBI_MDM%.PARTY_DIM PARTY_DIM ON 
( PARTY_DIM.FK_TERRITORY_DIM_ID = STG_DIM_PARTY_CHANGES.FK_TERRITORY_DIM_ID
AND PARTY_DIM.PARTY_CD_NK = STG_DIM_PARTY_CHANGES.PARTY_CD_NK
AND PARTY_DIM.PTYPE = STG_DIM_PARTY_CHANGES.PTYPE )
CROSS JOIN (SELECT MAX(PK_PARTY_DIM_ID) AS ID_MX FROM %TOBI_MDM%.PARTY_DIM) AS MX
WHERE STG_DIM_PARTY_CHANGES.FK_TERRITORY_DIM_ID IN
(SELECT TERRITORY_ID
                FROM %TOBI_ADMIN%.FDDM_LOAD_TERRITORIES
                WHERE LOAD_STATUS = 'COMPLETED'
                      AND REGION_ID = (SELECT DISTINCT REGION_ID FROM %TOBI_ADMIN%.TOBI_CONFIG WHERE RUN_FLAG='Y'))
 AND PARTY_DIM.PK_PARTY_DIM_ID IS  NULL;

-------- completed----------------