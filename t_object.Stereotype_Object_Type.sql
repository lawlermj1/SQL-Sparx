-- Profile of t_object with All Object_Types

SELECT [Object_Type] , [Stereotype], count(*) CT  FROM [sparxDB].[dbo].[t_object] tob  group by [Object_Type] , [Stereotype] ; 

-- 	Object_Type	Stereotype	CT
-- 	Artifact	NULL	3
-- 	Boundary	NULL	1
-- 	Class	aBPMDataConcept	41
-- 	Class	AnalyticDCRule	161
-- 	Class	AnalyticFeature	56
-- 	Class	AnalyticFeatureRule	54
-- 	Class	BPMEntity	395
-- 	Class	BusinessProject	10
-- 	Class	DatasetBPMRule	6
-- 	Class	DatasetDCRule	75
-- 	Class	DatasetEntityRule	2
-- 	Class	DomainGroup	2
-- 	Class	Implementation Item	7482
-- 	Class	Implementation Item Type	25
-- 	Class	Implementation Source Type	8
-- 	Class	LogicalEntity	291
-- 	Class	LookupData	217
-- 	Class	PredictiveModelInputs	1
-- 	Class	PredictiveModelOutputs	1
-- 	Class	widget	9
-- 	Event	NULL	2
-- 	Note	NULL	2
-- 	Object	datastore	2
-- 	Object	NULL	2
-- 	Package	AnalyticalBPMPackage	5
-- 	Package	dashboard	2
-- 	Package	DatasetBPMPackage	23
-- 	Package	Implementation Source	19
-- 	Package	NULL	15
-- 	Package	SubjectArea	11
-- 	StateNode	NULL	2
-- 	Text	NULL	66
