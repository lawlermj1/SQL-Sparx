-- Profile of t_object with All stereotypes

SELECT  [Stereotype], count(*) as CT  FROM [sparxDB].[dbo].[t_object] group by [Stereotype] order by [Stereotype] ; 

-- 	Stereotype	CT
-- 	NULL	93
-- 	aBPMDataConcept	41
-- 	AnalyticalBPMPackage	5
-- 	AnalyticDCRule	161
-- 	AnalyticFeature	56
-- 	AnalyticFeatureRule	54
-- 	BPMEntity	395
-- 	BusinessProject	10
-- 	dashboard	2
-- 	DatasetBPMPackage	23
-- 	DatasetBPMRule	6
-- 	DatasetDCRule	75
-- 	DatasetEntityRule	2
-- 	datastore	2
-- 	DomainGroup	2
-- 	Implementation Item	7,482
-- 	Implementation Item Type	25
-- 	Implementation Source	19
-- 	Implementation Source Type	8
-- 	LogicalEntity	291
-- 	LookupData	217
-- 	PredictiveModelInputs	1
-- 	PredictiveModelOutputs	1
-- 	SubjectArea	11
-- 	widget	9
