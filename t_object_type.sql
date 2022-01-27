-- Profile of t_object_type 

SELECT [Object_Type], count(*) CT       
  FROM [sparxDB].[dbo].[t_object] 
  GROUP BY [Object_Type]
  order by CT desc ; 

--  Object_Type	CT
--Class	8836
--Package	75
--Text	66
--Object	4
--Artifact	3
--Event	2
--Note	2
--StateNode	2
--Boundary	1

-- unused ??
SELECT [Object_Type]
      ,[Name]
	  ,[Object_ID]
      ,[Package_ID]
      ,[Stereotype]
      ,[NType]
      ,[Note]
  FROM [sparxDB].[dbo].[t_object]
  WHERE [Object_Type] not in ( 'Class' , 'Package' , 'Text'	) 
  ORDER BY [Package_ID], [Object_Type], [Name] ; 
  
-- 	Object_Type	Name	Object_ID	Package_ID	Stereotype	NType
-- 	Artifact	Party.docx	9090	84	NULL	0
-- 	Artifact	Welfare.docx	9291	88	NULL	0
-- 	Artifact	Accounting.docx	9303	89	NULL	0
-- 	Boundary	NULL	9317	91	NULL	0
-- 	Event	Data extraction	9703	103	NULL	0
-- 	Event	Data ingestion	9704	103	NULL	0
-- 	Object	Daily MI Report PDF	9700	103	NULL	0
-- 	Object	Enterprise Data Warehouse	9701	103	datastore	5
-- 	Object	Excel XML output file	9707	103	NULL	0
-- 	Object	Tableau Data Visualisation	9702	103	datastore	5
-- 	StateNode	NULL	9705	103	NULL	100
-- 	StateNode	NULL	9706	103	NULL	101
-- 	Note	NULL	9867	107	NULL	0
-- 	Note	NULL	9868	107	NULL	0


