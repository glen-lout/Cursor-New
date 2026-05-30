# TCR1 Schema Results Summary

This document summarizes the uploaded schema discovery results for the `TCR1` SQL Server database. Raw tab-separated result exports are stored in [`schema-results/`](schema-results/).

## Database overview

| Database | Compatibility level | Collation | Recovery model | Created |
| --- | --- | --- | --- | --- |
| TCR1 | 160 | SQL_Latin1_General_CP1_CI_AS | FULL | 2026-04-06 12:05:25.550 |

## Uploaded source files

| File | Rows | Columns |
| --- | --- | --- |
| database_overview.tsv | 1 | database_name	compatibility_level	collation_name	recovery_model_desc	create_date |
| schemas.tsv | 28 | schema_name	owner_name |
| columns.tsv | 75049 | schema_name	object_name	object_type	column_id	column_name	data_type	character_or_binary_length	precision	scale	is_nullable	is_identity	is_computed	default_definition	computed_definition	collation_name |
| primary_keys.tsv | 4285 | schema_name	table_name	constraint_name	constraint_type	key_columns |
| foreign_keys.tsv | 5069 | foreign_key_name	parent_schema_name	parent_table_name	parent_columns	referenced_schema_name	referenced_table_name	referenced_columns	update_referential_action_desc	delete_referential_action_desc	is_disabled	is_not_trusted |
| indexes.tsv | 8578 | schema_name	table_name	index_name	index_type	is_unique	is_primary_key	is_unique_constraint	has_filter	filter_definition	key_columns	included_columns |
| check_constraints.tsv | 64 | schema_name	table_name	check_constraint_name	definition	is_disabled	is_not_trusted |
| routine_parameters.tsv | 80830 | schema_name	routine_name	routine_type	parameter_id	parameter_name	data_type	character_or_binary_length	precision	scale	is_output	has_default_value	default_value |
| routine_dependencies.tsv | 104036 | referencing_schema_name	referencing_object_name	referencing_object_type	referenced_schema_name	referenced_entity_name	referenced_object_type (partial: dependency chunks 1 through 3 of 4 imported) |

## Coverage summary

| Area | Rows or count | Notes |
| --- | --- | --- |
| Schemas | 28 | Schema names and owners |
| Known tables from provided exports | 4578 | Derived from uploaded columns, primary keys, foreign keys, indexes, and constraints |
| Column rows | 75049 | 4842 objects represented: 4578 tables and 264 views/other objects |
| Primary key constraints | 4285 | 4283 tables with primary key rows |
| Foreign key relationships | 5069 | 2465 parent tables, 1404 referenced tables |
| Indexes | 8578 | 4340 tables with index rows |
| Check constraints | 64 | 49 tables with check constraints |
| Routine parameter rows | 80830 | 18569 distinct routines/functions with parameter metadata |
| Dependency rows uploaded so far | 104036 | 17302 referencing objects and 9614 referenced entities; partial dependency inventory, chunks 1 through 3 of 4 imported |

## Schemas

| Schema | Owner |
| --- | --- |
| ASCLOUD\A711233 | ASCLOUD\A711233 |
| aspnet_ChangeNotification_ReceiveNotificationsOnlyAccess | aspnet_ChangeNotification_ReceiveNotificationsOnlyAccess |
| bd50e95f_CC | bd50e95f_CC |
| bd51e8ab_CC | bd51e8ab_CC |
| bd51e8ab_EDI | bd51e8ab_EDI |
| bd5b0e62_CC | bd5b0e62_CC |
| bd5b0e62_EDI | bd5b0e62_EDI |
| c27b8079_CC | c27b8079_CC |
| c27b8079_EDI | c27b8079_EDI |
| c656f0e5_CC | c656f0e5_CC |
| c656f0e5_EDI | c656f0e5_EDI |
| c880a6d7_CC | c880a6d7_CC |
| c880a6d7_EDI | c880a6d7_EDI |
| cdc | cdc |
| cde91d87_CC | cde91d87_CC |
| cde91d87_EDI | cde91d87_EDI |
| dbo | dbo |
| HVCUser | HVCUser |
| persistenceUsers | persistenceUsers |
| prime\asprod22 | dbo |
| PRIME\lmenari1 | dbo |
| PRIME\suppor3 | dbo |
| state_persistence_users | state_persistence_users |
| System.Activities.DurableInstancing | HVCUser |
| TCR\PrdScmServices | TCR\PrdScmServices |
| tracking_profilereaderwriter | tracking_profilereaderwriter |
| tracking_reader | tracking_reader |
| tracking_writer | tracking_writer |

## Column inventory

Column inventory chunks 1 through 3 have been imported into [`schema-results/columns.tsv`](schema-results/columns.tsv).

### Most common column data types

| Data type | Column rows |
| --- | --- |
| varchar | 21208 |
| int | 14568 |
| bit | 6131 |
| datetimeoffset | 5881 |
| uniqueidentifier | 5824 |
| datetime | 4110 |
| HVCIDdt | 3810 |
| bigint | 3747 |
| timestamp | 2546 |
| smallint | 1753 |
| nvarchar | 1024 |
| numeric | 1017 |
| tinyint | 1009 |
| char | 658 |
| date | 500 |
| SXACurrencyDt | 432 |
| varbinary | 182 |
| xml | 181 |
| SXARateDt | 96 |
| decimal | 75 |

### Column rows by schema

| Schema | Column rows |
| --- | --- |
| dbo | 74590 |
| System.Activities.DurableInstancing | 306 |
| PRIME\suppor3 | 111 |
| ASCLOUD\A711233 | 42 |

### Objects with the most column rows

| Object | Object type | Column row count |
| --- | --- | --- |
| dbo.SXARCMEDIVisitInfo | USER_TABLE | 249 |
| dbo.CV3VisitListJoin | VIEW | 218 |
| dbo.CV3VisitListInactiveJoin | VIEW | 210 |
| dbo.CV3EnterpriseChartData | USER_TABLE | 163 |
| dbo.CV3EnterpriseVisitData | USER_TABLE | 163 |
| dbo.CV3EnterpriseClientData | USER_TABLE | 162 |
| dbo.CV3AlternateOrder | USER_TABLE | 118 |
| dbo.CV3Order | USER_TABLE | 118 |
| dbo.CV3OutpatientOrder | USER_TABLE | 118 |
| dbo.SXACCFutureOrder | USER_TABLE | 118 |
| dbo.CV3AllOrdersVw | VIEW | 117 |
| dbo.SXACCAllOrders2Vw | VIEW | 117 |
| dbo.CV3OrderRequestByJoin | VIEW | 115 |
| dbo.SXARCMEDIVisitInfoExt | USER_TABLE | 110 |
| dbo.CV3ObsCatalogMasterItem | USER_TABLE | 108 |
| dbo.CV3OrderAddnlInfo | USER_TABLE | 101 |
| dbo.KB1551835_SXAAMBClientPrescription | USER_TABLE | 98 |
| dbo.SXAAMBClientPrescription | USER_TABLE | 98 |
| dbo.vUAISXAAMBClientPrescription | VIEW | 98 |
| dbo.CV3FutureOrderByDeptJoinVw | VIEW | 96 |

## Dependency inventory, partial upload

Dependency inventory is currently partial: chunks 1 through 3 of 4 have been imported into [`schema-results/routine_dependencies.tsv`](schema-results/routine_dependencies.tsv).

### Referencing object types uploaded so far

| Referencing object type | Dependency rows |
| --- | --- |
| CHECK_CONSTRAINT | 68 |
| DEFAULT_CONSTRAINT | 795 |
| SQL_INLINE_TABLE_VALUED_FUNCTION | 1133 |
| SQL_SCALAR_FUNCTION | 729 |
| SQL_STORED_PROCEDURE | 98558 |
| SQL_TABLE_VALUED_FUNCTION | 297 |
| SQL_TRIGGER | 1635 |
| USER_TABLE | 37 |
| VIEW | 784 |

### Referenced object types uploaded so far

| Referenced object type | Dependency rows |
| --- | --- |
| NULL | 17877 |
| SEQUENCE_OBJECT | 28 |
| SERVICE_QUEUE | 37 |
| SQL_INLINE_TABLE_VALUED_FUNCTION | 7373 |
| SQL_SCALAR_FUNCTION | 5673 |
| SQL_STORED_PROCEDURE | 311 |
| SQL_TABLE_VALUED_FUNCTION | 422 |
| SYNONYM | 536 |
| USER_TABLE | 68714 |
| VIEW | 3065 |

### Dependency rows by referencing schema uploaded so far

| Referencing schema | Dependency rows |
| --- | --- |
| dbo | 103540 |
| cdc | 495 |
| cde91d87_EDI | 1 |

### Most referenced entities uploaded so far

| Referenced entity | Dependency row count |
| --- | --- |
| NULL.HVCIDdt | 5567 |
| dbo.SXADBBuildFn | 2304 |
| NULL.CV3ClientVisit | 2265 |
| dbo.SXADBGetEnterpriseNowTblFn | 2184 |
| NULL.CV3Location | 1596 |
| NULL.CV3User | 1483 |
| dbo.SXADBGetEnterpriseOffsetNowTblFn | 1261 |
| dbo.SCMSiteIDFn | 1119 |
| NULL.CV3Client | 1060 |
| NULL.CV3Order | 912 |
| NULL.HVCEnvProfile | 690 |
| NULL.CV3CareProvider | 614 |
| NULL.CV3ClientDocument | 588 |
| NULL.CV3EnumReference | 555 |
| NULL.SXARCMWorksheet | 514 |
| NULL.SXARCMTransaction | 465 |
| NULL.SXARCMEpisode | 447 |
| NULL.SXAGNBigintTbl | 438 |
| NULL.CV3OrderCatalogMasterItem | 431 |
| NULL.CV3UserSecurityGroup | 419 |

### Objects with the most dependency rows uploaded so far

| Referencing object | Dependency row count |
| --- | --- |
| dbo.SXAAMVisitMergeUpdPr | 161 |
| dbo.SXAAMMoveVisitUpdPr | 144 |
| dbo.SXAAMDictionarySelPR | 135 |
| dbo.SXAHL7ADTTransGetPr | 96 |
| dbo.SXARCMSavePGCycleBillingStatementDetailPr | 93 |
| dbo.CV3ChartFlagsSelPr | 83 |
| dbo.SXARCMSavePGStatementDetailPr | 77 |
| dbo.SXAAMCTDictionarySelPr | 75 |
| dbo.SXARCMSRFloridaOutpatientAS105ExtractRptInsPr | 75 |
| dbo.SXARCMSRFloridaOutpatientAS103ExtractRptInsPr | 70 |
| dbo.SXAAMBSVChartFlagsSelPr | 69 |
| dbo.SXARCMSRFloridaInpatientPD105ExtractRptInsPr | 68 |
| dbo.SCMEnvProfileValidatePr | 65 |
| dbo.SXARCMGetTransactionDetailPr | 63 |
| dbo.SXAReportableInfoMsgQueueBioSelPr | 62 |
| dbo.SXAAMMiniVisitsSelPr | 61 |
| dbo.SXACCFHIRCarePlanSelPR | 61 |
| dbo.SXACCFHIRCarePlanV3SelPR | 61 |
| dbo.SXACDFHIRDocumentReferenceByPatientV3SelPr | 60 |
| dbo.SXACDFHIRDocumentReferenceForPopulationV3SelPr | 60 |

## Constraint and relationship signals

| Signal | Count | Meaning |
| --- | --- | --- |
| Nullable columns | 24504 | Complete uploaded column inventory |
| Identity columns | 3202 | Complete uploaded column inventory |
| Computed columns | 9 | Complete uploaded column inventory |
| Columns with defaults | 19921 | Complete uploaded column inventory |
| Composite primary keys | 429 | Primary keys with more than one key column |
| Disabled foreign keys | 699 | Foreign keys currently disabled |
| Untrusted foreign keys | 733 | Foreign keys SQL Server cannot assume are trusted |
| Cascade delete foreign keys | 316 | Relationships that cascade deletes |
| Unique indexes | 5606 | Includes primary key and unique indexes |
| Primary key indexes | 4283 | Indexes backing primary keys |
| Filtered indexes | 32 | Indexes with filter predicates |
| Disabled check constraints | 0 | Check constraints currently disabled |
| Untrusted check constraints | 4 | Check constraints SQL Server cannot assume are trusted |

## Index types

| Index type | Count |
| --- | --- |
| CLUSTERED | 4285 |
| CLUSTERED COLUMNSTORE | 1 |
| NONCLUSTERED | 4279 |
| NONCLUSTERED COLUMNSTORE | 8 |
| XML | 5 |

## Routine/function inventory

| Routine type | Parameter rows |
| --- | --- |
| SQL_INLINE_TABLE_VALUED_FUNCTION | 2053 |
| SQL_SCALAR_FUNCTION | 1352 |
| SQL_STORED_PROCEDURE | 77165 |
| SQL_TABLE_VALUED_FUNCTION | 260 |

### Routines by schema

| Schema | Parameter rows |
| --- | --- |
| dbo | 79207 |
| cdc | 1440 |
| System.Activities.DurableInstancing | 181 |
| cde91d87_EDI | 1 |
| PRIME\lmenari1 | 1 |

### Most common routine parameter data types

| Data type | Parameter rows |
| --- | --- |
| varchar | 24281 |
| int | 13969 |
| HVCIDdt | 10551 |
| bit | 8098 |
| bigint | 5191 |
| datetime | 3528 |
| numeric | 2011 |
| nvarchar | 1500 |
| datetimeoffset | 1397 |
| NULL | 1356 |
| uniqueidentifier | 1004 |
| binary | 998 |
| smallint | 745 |
| char | 572 |
| date | 480 |
| tinyint | 466 |
| SXAGNStringDtTbl | 452 |
| SXAGNBigintTbl | 415 |
| SXAGNBigintBigintTbl | 325 |
| decimal | 307 |

### Routines with the most parameter rows

| Routine | Routine type | Parameter row count |
| --- | --- | --- |
| dbo.SXAMMNonFormularyDrugInsPr | SQL_STORED_PROCEDURE | 110 |
| dbo.SXACDObsConfigUpdPr | SQL_STORED_PROCEDURE | 102 |
| dbo.SXAMMCV3OrderTempSelPr | SQL_STORED_PROCEDURE | 96 |
| dbo.CV3OrderIP | SQL_STORED_PROCEDURE | 93 |
| dbo.SXAAMBClientPrescriptionInsPr | SQL_STORED_PROCEDURE | 91 |
| dbo.SXAAMVisitDemographicsUpdPr | SQL_STORED_PROCEDURE | 89 |
| dbo.SXAMMFillingLabelDataUpdPr | SQL_STORED_PROCEDURE | 87 |
| dbo.SXAMMFillingLabelDataInsPr | SQL_STORED_PROCEDURE | 85 |
| dbo.SXAMMNonFormularySelPr | SQL_STORED_PROCEDURE | 73 |
| dbo.SXAAMBClientPrescriptionUpdPr | SQL_STORED_PROCEDURE | 70 |
| dbo.SXAHMScheduledEventOccurrenceUpdAllPr | SQL_STORED_PROCEDURE | 66 |
| dbo.SXAMMFillingReportDataUpdPr | SQL_STORED_PROCEDURE | 66 |
| System.Activities.DurableInstancing.InsertPromotedProperties | SQL_STORED_PROCEDURE | 66 |
| dbo.SXAHMMarkAsDoneUpdAllPr | SQL_STORED_PROCEDURE | 63 |
| dbo.SXAAMClientUpdPR | SQL_STORED_PROCEDURE | 62 |
| dbo.SXAMMGenericItemSelPr | SQL_STORED_PROCEDURE | 62 |
| dbo.CV3EnterpriseChartDataIP | SQL_STORED_PROCEDURE | 61 |
| dbo.CV3EnterpriseVisitDataIP | SQL_STORED_PROCEDURE | 61 |
| dbo.SXAAMClientInsPR | SQL_STORED_PROCEDURE | 61 |
| dbo.SXAAMVisitInsPr | SQL_STORED_PROCEDURE | 61 |

## Most referenced tables by foreign keys

| Referenced table | Foreign key count |
| --- | --- |
| dbo.CV3Client | 146 |
| dbo.CV3ClientVisit | 146 |
| dbo.CV3User | 140 |
| dbo.SXARCMTransactionCodeMaster | 128 |
| dbo.CV3Location | 98 |
| dbo.SXARCMWorksheet | 50 |
| dbo.CV3CareProvider | 47 |
| dbo.SXARCMTransaction | 44 |
| dbo.CV3Order | 40 |
| dbo.CV3Chart | 36 |
| dbo.CV3PatientCareDocument | 35 |
| dbo.CV3Rights | 34 |
| dbo.SXARCMEDIVisitInfo | 31 |
| dbo.SXASRGCase | 30 |
| dbo.SXACRCatalogTile | 29 |

## Tables with the most outgoing foreign keys

| Parent table | Foreign key count |
| --- | --- |
| dbo.SXARCMRevenueCycleDetail | 33 |
| dbo.SXARCMDenial | 22 |
| dbo.CV3Order | 18 |
| dbo.SXACCFutureOrder | 18 |
| dbo.SXAGNTaskItem | 17 |
| dbo.SXAGNTaskItemCompleted | 17 |
| dbo.SXAAMREFIncomingReferral | 14 |
| dbo.SXARCMPatientGuarantorRemitLocationConfig | 14 |
| dbo.SXARCMPaymentAdjustmentTransactionDetail | 14 |
| dbo.CV3OrderTaskOccurrence | 13 |
| dbo.SXARCMLockboxProcessingTransactionCodeSetup | 13 |
| dbo.SXARCMWorksheet | 12 |
| dbo.SXAAMBClientPrescription | 11 |
| dbo.SXARCMEpisode | 11 |
| dbo.SXARCMERATransactionSetErrorLog | 11 |

## Tables with the most indexes

| Table | Index count |
| --- | --- |
| dbo.CV3ClientVisit | 16 |
| dbo.SXARCMWorksheet | 14 |
| dbo.CV3AdvancedVisitListData | 13 |
| dbo.SXAESAppointment | 11 |
| dbo.SXARCMTransaction | 11 |
| dbo.SXASRGCase | 11 |
| dbo.CV3ActiveVisitList | 10 |
| dbo.CV3ObservationEntryItem | 10 |
| dbo.SXAAMBClientPrescription | 10 |
| dbo.SXARCMEpisode | 10 |
| dbo.SXARCMPaymentAdjustmentTransactionDetail | 10 |
| dbo.CV3User | 9 |
| dbo.SXAAMREFIncomingReferral | 9 |
| dbo.SXARCMWorksheetTransactionAllocation | 9 |
| dbo.SXAVWFTask | 9 |
| dbo.SXAVWFTaskARC | 9 |
| dbo.CV3Location | 8 |
| dbo.SXAAMFreeTextCareProvider | 8 |
| dbo.SXARCMWorksheetTransferTransaction | 8 |
| dbo.SXAVWFTaskHistory | 8 |

## Check constraints by table

| Table | Check constraint count |
| --- | --- |
| dbo.ACS_EMCalcRule | 5 |
| dbo.ACS_EMCategory | 2 |
| dbo.ACS_EmChargeRule | 2 |
| dbo.ACS_EMComponentMapping | 2 |
| dbo.ACS_EMProfessionalGroup | 2 |
| dbo.ACS_EMProfessionalGroupObs | 2 |
| dbo.CV3ClientDocumentARC | 2 |
| dbo.CV3ClientDocumentCUR | 2 |
| dbo.SXAEISExpressionComponent | 2 |
| dbo.SXAEISRelationshipDefinition | 2 |
| dbo.SXAEISTemplateExpressionComponent | 2 |
| dbo.SXARCMThirdPartyCode | 2 |
| dbo.CV3ClientDocDetailARC | 1 |
| dbo.CV3ClientDocDetailCUR | 1 |
| dbo.CV3ClientDocDetailHistXrefARC | 1 |
| dbo.CV3ClientDocDetailHistXrefCUR | 1 |
| dbo.CV3ClientDocHistoryARC | 1 |
| dbo.CV3ClientDocHistoryCUR | 1 |
| dbo.CV3ClientDocProviderXrefARC | 1 |
| dbo.CV3ClientDocProviderXrefCUR | 1 |
| dbo.CV3ClientVisit | 1 |
| dbo.CV3ObservationARC | 1 |
| dbo.CV3ObservationCUR | 1 |
| dbo.CV3ObservationDocumentARC | 1 |
| dbo.CV3ObservationDocumentCUR | 1 |
| dbo.CV3ObservationXInfoARC | 1 |
| dbo.CV3ObservationXInfoCUR | 1 |
| dbo.SXACDChartedFormDecorativeLabelARC | 1 |
| dbo.SXACDChartedFormDecorativeLabelCUR | 1 |
| dbo.SXACDClientDocDetailTextARC | 1 |
| dbo.SXACDClientDocDetailTextCUR | 1 |
| dbo.SXAEHIFullDBRequest | 1 |
| dbo.SXAEHIRequest | 1 |
| dbo.SXAEISAttributeDefinition | 1 |
| dbo.SXAEISAttributeExpression | 1 |
| dbo.SXAEISDataModel | 1 |
| dbo.SXAEISEntityDefinition | 1 |
| dbo.SXAEISEntityUniquenessConstraintXref | 1 |
| dbo.SXAEISExpressionFunctionArgument | 1 |
| dbo.SXAEISExpressionImplementationType | 1 |
| dbo.SXAEISInstanceSet | 1 |
| dbo.SXAEISQueryDefinition | 1 |
| dbo.SXAEISQueryExecution | 1 |
| dbo.SXAEISQuerySchema | 1 |
| dbo.SXAEISRequestExecution | 1 |
| dbo.SXAEISSchemaDefinition | 1 |
| dbo.SXAEISSchemaEntity | 1 |
| dbo.SXAEISSelectionExpression | 1 |
| dbo.SXARCMEReimbursementMethodDetail | 1 |

## Check constraint details

| Schema | Table | Constraint | Definition | Disabled | Not trusted |
| --- | --- | --- | --- | --- | --- |
| dbo | ACS_EMCalcRule | CHK1ACS_EMCalcRule | ([applyWhenAdministered]='N' OR [applyWhenAdministered]='Y') | 0 | 0 |
| dbo | ACS_EMCalcRule | CHK2ACS_EMCalcRule | ([allowMultiples]='N' OR [allowMultiples]='Y') | 0 | 0 |
| dbo | ACS_EMCalcRule | CHK4ACS_EMCalcRule | ([active]='N' OR [active]='Y') | 0 | 0 |
| dbo | ACS_EMCalcRule | CHK5ACS_EMCalcRule | ([locked]='N' OR [locked]='Y') | 0 | 0 |
| dbo | ACS_EMCalcRule | CHKACS_EMCalcRule_DeptType | ([DeptType]='B' OR [DeptType]='A') | 0 | 0 |
| dbo | ACS_EMCategory | CHK2ACS_EMCategory | ([active]='N' OR [active]='Y') | 0 | 0 |
| dbo | ACS_EMCategory | CHK3ACS_EMCategory | ([locked]='N' OR [locked]='Y') | 0 | 0 |
| dbo | ACS_EmChargeRule | CHKACS_EmChargeRule_Temp_active | ([active]='N' OR [active]='Y') | 0 | 0 |
| dbo | ACS_EmChargeRule | CHKACS_EmChargeRule_Temp_DeptType | ([DeptType]='Z' OR [DeptType]='B' OR [DeptType]='A') | 0 | 0 |
| dbo | ACS_EMComponentMapping | CHK2ACS_EMComponentMapping | ([active]='N' OR [active]='Y') | 0 | 0 |
| dbo | ACS_EMComponentMapping | CHK3ACS_EMComponentMapping | ([locked]='N' OR [locked]='Y') | 0 | 0 |
| dbo | ACS_EMProfessionalGroup | CHK2ACS_EMProfessionalGroup | ([active]='N' OR [active]='Y') | 0 | 0 |
| dbo | ACS_EMProfessionalGroup | CHK3ACS_EMProfessionalGroup | ([locked]='N' OR [locked]='Y') | 0 | 0 |
| dbo | ACS_EMProfessionalGroupObs | CHK2ACS_EMProfessionalGroupObs | ([active]='N' OR [active]='Y') | 0 | 0 |
| dbo | ACS_EMProfessionalGroupObs | CHK3ACS_EMProfessionalGroupObs | ([locked]='N' OR [locked]='Y') | 0 | 0 |
| dbo | CV3ClientDocDetailARC | CV3ClientDocDetailARC_ArcTypeCHK | ([ArcType]>(0)) | 0 | 0 |
| dbo | CV3ClientDocDetailCUR | CV3ClientDocDetailCUR_ArcTypeCHK | ([ArcType]=(0)) | 0 | 0 |
| dbo | CV3ClientDocDetailHistXrefARC | CV3ClientDocDetailHistXrefARC_ArcTypeCHK | ([ArcType]>(0)) | 0 | 0 |
| dbo | CV3ClientDocDetailHistXrefCUR | CV3ClientDocDetailHistXrefCUR_ArcTypeCHK | ([ArcType]=(0)) | 0 | 0 |
| dbo | CV3ClientDocHistoryARC | CV3ClientDocHistoryARC_ArcTypeCHK | ([ArcType]>(0)) | 0 | 0 |
| dbo | CV3ClientDocHistoryCUR | CV3ClientDocHistoryCUR_ArcTypeCHK | ([ArcType]=(0)) | 0 | 0 |
| dbo | CV3ClientDocProviderXrefARC | CV3ClientDocProviderXrefARC_ArcTypeCHK | ([ArcType]>(0)) | 0 | 0 |
| dbo | CV3ClientDocProviderXrefCUR | CV3ClientDocProviderXrefCUR_ArcTypeCHK | ([ArcType]=(0)) | 0 | 0 |
| dbo | CV3ClientDocumentARC | CV3ClientDocumentARC_ArcTypeCHK | ([ArcType]>(0)) | 0 | 0 |
| dbo | CV3ClientDocumentARC | CV3ClientDocumentARC_ServiceDtmUTCCHK | ([ServiceDtmUTC] IS NOT NULL) | 0 | 1 |
| dbo | CV3ClientDocumentCUR | CV3ClientDocumentCUR_ArcTypeCHK | ([ArcType]=(0)) | 0 | 0 |
| dbo | CV3ClientDocumentCUR | CV3ClientDocumentCUR_ServiceDtmUTCCHK | ([ServiceDtmUTC] IS NOT NULL) | 0 | 1 |
| dbo | CV3ClientVisit | CV3ClientVisit_ArcTypeCHK | ([ArcType] IS NOT NULL) | 0 | 1 |
| dbo | CV3ObservationARC | CV3ObservationARC_ArcTypeCHK | ([ArcType]>(0)) | 0 | 0 |
| dbo | CV3ObservationCUR | CV3ObservationCUR_ArcTypeCHK | ([ArcType]=(0)) | 0 | 0 |
| dbo | CV3ObservationDocumentARC | CV3ObservationDocumentARC_ArcTypeCHK | ([ArcType]>(0)) | 0 | 0 |
| dbo | CV3ObservationDocumentCUR | CV3ObservationDocumentCUR_ArcTypeCHK | ([ArcType]=(0)) | 0 | 0 |
| dbo | CV3ObservationXInfoARC | CV3ObservationXInfoARC_ArcTypeCHK | ([ArcType]>(0)) | 0 | 0 |
| dbo | CV3ObservationXInfoCUR | CV3ObservationXInfoCUR_ArcTypeCHK | ([ArcType]=(0)) | 0 | 0 |
| dbo | SXACDChartedFormDecorativeLabelARC | SXACDChartedFormDecorativeLabelARC_ArcTypeCHK | ([ArcType]>(0)) | 0 | 0 |
| dbo | SXACDChartedFormDecorativeLabelCUR | SXACDChartedFormDecorativeLabelCUR_ArcTypeCHK | ([ArcType]=(0)) | 0 | 0 |
| dbo | SXACDClientDocDetailTextARC | SXACDClientDocDetailTextARC_ArcTypeCHK | ([ArcType]>(0)) | 0 | 0 |
| dbo | SXACDClientDocDetailTextCUR | SXACDClientDocDetailTextCUR_ArcTypeCHK | ([ArcType]=(0)) | 0 | 0 |
| dbo | SXAEHIFullDBRequest | SXAEHIFullDBRequest_NetworkPathCHK | (right([NetworkPath],(1))<>'\') | 0 | 0 |
| dbo | SXAEHIRequest | SXAEHIRequest_NetworkPathCHK | (right([NetworkPath],(1))<>'\') | 0 | 0 |
| dbo | SXAEISAttributeDefinition | SXAEISAttributeDefinition_ImplementationCategoryCHK | ([ImplementationCategory]='EIS' OR [ImplementationCategory]='OPTL' OR [ImplementationCategory]='CORE') | 0 | 0 |
| dbo | SXAEISAttributeExpression | SXAEISAttributeExpression_ExpressionUsageTypeCHK | ([ExpressionUsageType]='VLDT' OR [ExpressionUsageType]='DFTV' OR [ExpressionUsageType]='CLCV') | 0 | 0 |
| dbo | SXAEISDataModel | SXAEISDataModel_UsageTypeCHK | ([UsageType]='DVLP' OR [UsageType]='BASE' OR [UsageType]='BILD') | 0 | 0 |
| dbo | SXAEISEntityDefinition | SXAEISEntityDefinition_ImplementationCategoryCHK | ([ImplementationCategory]='OPTL' OR [ImplementationCategory]='CORE') | 0 | 0 |
| dbo | SXAEISEntityUniquenessConstraintXref | SXAEISEntityUniquenessConstraintXref_ConstraintTypeCHK | ([ConstraintType]='URQ' OR [ConstraintType]='UCQ') | 0 | 0 |
| dbo | SXAEISExpressionComponent | SXAEISExpressionComponent_BindingRuleCHK | ([BindingRule]='NONE' OR [BindingRule]='EXEC' OR [BindingRule]='OVRD' OR [BindingRule]='DEFN') | 0 | 0 |
| dbo | SXAEISExpressionComponent | SXAEISExpressionComponent_DataSourceTypeCHK | ([DataSourceType]='NONE' OR [DataSourceType]='SELF' OR [DataSourceType]='QRST' OR [DataSourceType]='INDAT' OR [DataSourceType]='SARG' OR [DataSourceType]='DBMS' OR [DataSourceType]='XPRS') | 0 | 0 |
| dbo | SXAEISExpressionFunctionArgument | SXAEISExpressionFunctionArgument_DirectionCHK | ([Direction]='OUT' OR [Direction]='IN') | 0 | 0 |
| dbo | SXAEISExpressionImplementationType | SXAEISExpressionImplementationType_ImplementationTypeNameCHK | ([ImplementationTypeName]='DBCDFT' OR [ImplementationTypeName]='DBPROC' OR [ImplementationTypeName]='EIS') | 0 | 0 |
| dbo | SXAEISInstanceSet | SXAEISInstanceSet_InstanceTypeCHK | ([InstanceType]='SRV' OR [InstanceType]='MGD' OR [InstanceType]='HIS' OR [InstanceType]='CUR') | 0 | 0 |
| dbo | SXAEISQueryDefinition | SXAEISQueryDefinition_ResultSetTypeCHK | ([ResultSetType]='SCMA' OR [ResultSetType]='ALDT' OR [ResultSetType]='IDRF' OR [ResultSetType]='ALL') | 0 | 0 |
| dbo | SXAEISQueryExecution | SXAEISQueryExecution_ExecutionUnitTypeCHK | ([ExecutionUnitType]='SRCHGRP' OR [ExecutionUnitType]='URQGRP' OR [ExecutionUnitType]='UCQGRP' OR [ExecutionUnitType]='QRY') | 0 | 0 |
| dbo | SXAEISQuerySchema | SXAEISQuerySchema_SchemaUsageTypeCHK | ([SchemaUsageType]='SRCHARG' OR [SchemaUsageType]='DBUPDT' OR [SchemaUsageType]='RSLTSET') | 0 | 0 |
| dbo | SXAEISRelationshipDefinition | SXAEISRelationshipDefinition_ActionOnDeleteCHK | ([ActionOnDelete]='CASCADE' OR [ActionOnDelete]='NOACTION') | 0 | 0 |
| dbo | SXAEISRelationshipDefinition | SXAEISRelationshipDefinition_ActionOnUpdateCHK | ([ActionOnUpdate]='CASCADE' OR [ActionOnUpdate]='NOACTION') | 0 | 0 |
| dbo | SXAEISRequestExecution | SXAEISRequestExecution_EventTypeCHK | ([EventType]='RQALL' OR [EventType]='RQABT' OR [EventType]='RQEND' OR [EventType]='RQST' OR [EventType]='SECURITY' OR [EventType]='ERROR' OR [EventType]='INFO') | 0 | 0 |
| dbo | SXAEISSchemaDefinition | SXAEISSchemaDefinition_SchemaTypeCHK | ([SchemaType]='CUST' OR [SchemaType]='LGDM' OR [SchemaType]='ENTY' OR [SchemaType]='DMDL') | 0 | 0 |
| dbo | SXAEISSchemaEntity | SXAEISSchemaEntity_AttributeCollectionTypeCHK | ([AttributeCollectionType]='SCMA' OR [AttributeCollectionType]='ALDT' OR [AttributeCollectionType]='IDRF' OR [AttributeCollectionType]='ALL') | 0 | 0 |
| dbo | SXAEISSelectionExpression | SXAEISSelectionExpression_BuildOptionCHK | ([BuildOption]='DFLT' OR [BuildOption]='CMD' OR [BuildOption]='EXPR') | 0 | 0 |
| dbo | SXAEISTemplateExpressionComponent | SXAEISTemplateExpressionComponent_BindingRuleCHK | ([BindingRule]='NONE' OR [BindingRule]='EXEC' OR [BindingRule]='OVRD' OR [BindingRule]='DEFN') | 0 | 0 |
| dbo | SXAEISTemplateExpressionComponent | SXAEISTemplateExpressionComponent_DataSourceTypeCHK | ([DataSourceType]='NONE' OR [DataSourceType]='SELF' OR [DataSourceType]='QRST' OR [DataSourceType]='INDAT' OR [DataSourceType]='SARG' OR [DataSourceType]='DBMS' OR [DataSourceType]='XPRS') | 0 | 0 |
| dbo | SXARCMEReimbursementMethodDetail | SXARCMEReimbursementMethodDetailCHK | ([MethodVersionID] IS NOT NULL AND [StopLossID] IS NULL AND [ERExceptionID] IS NULL OR [MethodVersionID] IS NULL AND [StopLossID] IS NOT NULL AND [ERExceptionID] IS NULL OR [MethodVersionID] IS NULL AND [StopLossID] IS NULL AND [ERExceptionID] IS NOT NULL OR [MethodVersionID] IS NULL AND [StopLossID] IS NULL AND [ERExceptionID] IS NULL) | 0 | 1 |
| dbo | SXARCMThirdPartyCode | SXARCMThirdPartyCodeProviderIDCHK | ([ThirdPartyCodeTypeID]<>(7) OR len([ProviderID])=(8)) | 0 | 0 |
| dbo | SXARCMThirdPartyCode | SXARCMThirdPartyCodeProviderNPICHK | ([ThirdPartyCodeTypeID]<>(7) OR len([ProviderNPI])=(10)) | 0 | 0 |

## Remaining discovery exports needed

The uploaded results do not include the table/view inventory or dependency chunk 4 from `sql/sqlserver/schema_inventory.sql`. Add these exports next to complete table-level documentation:

- `tables_views.tsv`
- remaining `routine_dependencies.tsv` chunk

Once those are available, use [`schema-document-template.md`](schema-document-template.md) to document each table's purpose, columns, joins, indexes, and stored procedure design notes.
