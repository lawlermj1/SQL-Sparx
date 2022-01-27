-- This is all the profiling SQL, which is not included in the data Design document. 


-- LogicalEntity to SubjectArea 
SELECT [Object_ID] , [Object_Type] , tob.[Stereotype] , tob.[Name] , [dbo].[RemoveNonAlphaCharacters] (tob.[Note]) as ObjNotes 
, tob.[Package_ID] , tpp.[Name] , [dbo].[RemoveNonAlphaCharacters] (tpp.Notes) as PkgNotes 
  FROM [sparxDB].[dbo].[t_object] tob 
  INNER JOIN [sparxDB].[dbo].[t_package] tpp ON tob.Package_ID = tpp.Package_ID 
  

-- Contents of Notes column. 
-- This may be useful for matching. 
-- Note the use of a function called [dbo].[RemoveNonAlphaCharacters] which filters all unprintable chars including hard returns.  
-- all PV notes 
-- 50 rows 
SELECT DISTINCT 
 't_objectproperties' as TB 
, topr.[Property] 
, [dbo].[RemoveNonAlphaCharacters] (topr.[Notes] ) as NotesFix
  FROM [sparxDB].[dbo].[t_objectproperties] topr
  WHERE topr.[Notes] IS NOT NULL  
UNION 
SELECT DISTINCT 
  't_attributetag' as TB
, tat.[Property] 
, [dbo].[RemoveNonAlphaCharacters] (tat.[Notes] ) as NotesFix
  FROM [sparxDB].[dbo].[t_attributetag] tat  
  WHERE tat.[Notes] IS NOT NULL 

-- all object notes 
-- 3,547 rows 
SELECT DISTINCT 
 't_object' as TB 
, tob.[Stereotype] 
, tob.[Object_Type]  
, tob.[Name]
, [dbo].[RemoveNonAlphaCharacters] (tob.[Note] ) as NotesFix
  FROM [sparxDB].[dbo].[t_object] tob 
  WHERE tob.[Note] IS NOT NULL  
  ORDER BY tob.[Stereotype] , tob.[Object_Type] , tob.[Name]

-- all attribute notes 
-- 2,117 rows
SELECT DISTINCT 
  't_attribute' as TB
, ta.[Stereotype] 
, ta.[Type] 
, ta.[Name] 
, [dbo].[RemoveNonAlphaCharacters] (ta.[Notes] ) as NotesFix
 FROM [sparxDB].[dbo].[t_attribute] ta 
 WHERE ta.[Notes] is NOT NULL 
ORDER BY ta.[Stereotype] , ta.[Type] , ta.[Name] 
   

-- Reification Object Pattern SQL 
-- TROPB1 
-- 32 rows 
SELECT [Stereotype], [Object_Type], count(*) CT 
      FROM [sparxDB].[dbo].[t_object]
  Group By [Stereotype], [Object_Type]
  Order by [Object_Type], [Stereotype] 

-- 24 rows 
SELECT [Stereotype], count(*) CT 
      FROM [sparxDB].[dbo].[t_object]
  Group By [Stereotype] 
  ORDER BY [Stereotype] 

-- STAll 
-- All Stereotypes across all tables with this column. 
SELECT distinct tob.[Stereotype] , 't_object'  TN  
  FROM [sparxDB].[dbo].[t_object] tob 
  UNION 
SELECT distinct ta.[Stereotype] , 't_attribute'    
  FROM [sparxDB].[dbo].[t_attribute] ta 
  UNION 
SELECT distinct tc.[Stereotype] , 't_connector'    
  FROM [sparxDB].[dbo].t_connector tc 
  UNION 
SELECT distinct td.[Stereotype] , 't_diagram'    
  FROM [sparxDB].[dbo].t_diagram td 
  UNION 
SELECT distinct ts.[Stereotype] , 't_stereotypes'    
  FROM [sparxDB].[dbo].t_stereotypes ts 
  UNION 
SELECT distinct too.[Stereotype] , 't_operation'    
  FROM [sparxDB].[dbo].t_operation too 


-- TROPB2 
-- Join to object, so no relations for all objects 
SELECT  tob.[Object_Type] , tob.[Stereotype] , topr.[Property]
, count(*) CT 
  FROM [sparxDB].[dbo].[t_objectproperties] topr
  INNER JOIN [sparxDB].[dbo].[t_object] tob ON topr.[Object_ID] = tob.[Object_ID] 
  GROUP BY tob.[Object_Type] , tob.[Stereotype] , topr.[Property] 
  ORDER BY tob.[Object_Type] , tob.[Stereotype] , topr.[Property] 

-- TROPG1 
-- With All Codes 
-- 220 [Stereotype] and [Type] cross product rows 
SELECT [Stereotype], [Type] 
, CASE WHEN [Stereotype] = 'Attr_Code' THEN 1 ELSE 0 END Is_Code
, Count(*) CT 
FROM [sparxDB].[dbo].[t_attribute] 
GROUP BY [Stereotype], [Type]  
ORDER BY Is_Code, [Stereotype], [Type]  
--CT DESC 


-- TROPG1 
SELECT [Stereotype] ,  count(*) CT
FROM [sparxDB].[dbo].[t_attribute] 
GROUP BY [Stereotype] 
ORDER BY [Stereotype] 


-- TROPG2 
-- 14,085 rows 
SELECT 
 tob.[Object_Type] , tob.[Stereotype] , tob.[Name] , tob.[Package_ID]
, ta.[Name] , ta.[Stereotype] , ta.[Type]
, tag.[Property] , tag.[VALUE]
  FROM [sparxDB].[dbo].[t_attributetag] tag 
  INNER JOIN [sparxDB].[dbo].[t_attribute] ta ON tag.ElementID = ta.[ID]
  INNER JOIN [sparxDB].[dbo].[t_object] tob ON ta.[Object_ID] = tob.[Object_ID] 
  WHERE tag.[Value] NOT LIKE '{%'

-- Non-relations only  
SELECT [Property], count(*) CT 
  FROM [sparxDB].[dbo].[t_attributetag]
  WHERE [Value] NOT LIKE '{%'
  GROUP by [Property] 

-- All 
SELECT [Property], count(*) CT 
  FROM [sparxDB].[dbo].[t_attributetag]
  group by [Property] 

--  Property  CT
--  Data Quality Alert  2115
--  Data Steward Contact Email (Interim)  2115
--  Dissemination Classification  2115
--  External Preferred Source of Truth  2115
--  Guidance  1721
--  Internal Preferred Source of Truth  2115
--  Is Business Key 1437
--  Max Length  1465
--  Optionality 1721
--  Precision 366
--  Security Classification 2115
--  Selected Use  2409
--  Semantic Map  1725
--  Status  2115
--  Synonym 2116


-- CROPASA 
--- 2,550 rows 
-- full key is tob.[Stereotype] , tob.[Name] , tobp.[Property] 
-- This normalisation only exists  in the SubjectArea 83 package. 
SELECT 
--  tob.[Object_Type] as 'Table_OT', 
  tob.[Stereotype] as 'Table'  
, tob.[Name] as 'Name' 
, tobp.[Property] as 'Attr_Name' 
--, tobp.[Value] as 'Attr_Value' 
, COUNT(*) CT 
FROM [sparxDB].[dbo].[t_object] tob 
INNER JOIN [sparxDB].[dbo].[t_objectproperties] tobp ON tobp.[Object_ID] = tob.[Object_ID] 
INNER JOIN [sparxDB].[dbo].[t_package] tp ON tob.[Package_ID] = tp.[Package_ID]  
-- filter out all guids 
WHERE tobp.[Value] NOT LIKE '{%' 
-- AND tp.[Parent_ID] in ( 83  ) 
--, 128
GROUP BY  tob.[Stereotype] , tob.[Name] , tobp.[Property] 
ORDER BY tob.[Stereotype] , tob.[Name] , tobp.[Property] 

-- CROPASAVal
--  and with values 
SELECT 
--  tob.[Object_Type] as 'Table_OT', 
  tob.[Stereotype] as 'Table'  
, tob.[Name] as 'Name' 
, tobp.[Property] as 'Attr_Name' 
, tobp.[Value] as 'Attr_Value' 
, COUNT(*) CT 
FROM [sparxDB].[dbo].[t_object] tob 
INNER JOIN [sparxDB].[dbo].[t_objectproperties] tobp ON tobp.[Object_ID] = tob.[Object_ID] 
INNER JOIN [sparxDB].[dbo].[t_package] tp ON tob.[Package_ID] = tp.[Package_ID]  
-- filter out all guids 
WHERE tobp.[Value] NOT LIKE '{%' 
-- AND tp.[Parent_ID] in ( 83  ) 
--, 128
GROUP BY  tob.[Stereotype] , tob.[Name] , tobp.[Property] , tobp.[Value]
ORDER BY tob.[Stereotype] , tob.[Name] , tobp.[Property] 

-- CROPG 
-- There are 2 kinds; one just using data from attribute, and the other showing all column properties from TA and TAT. 
-- this shows the object child table created from the join of [t_object] and [t_attribute] 
-- this shows the object grandchild table created from the join of [t_object], [t_attribute] and [t_attributetag] tables. 

-- There may be some checks on t_attribute stereotypes, etc for Subject Area. 
-- 2,116 rows 
 SELECT tp.Name 'TP_Name', tob.[Stereotype] 'TOB_ST', tob.Name 'TOB_Name'
, ta.Name as 'TA_Name' , ta.[Stereotype] 'TA_ST', ta.Type 'TA_Type' 
 FROM [sparxDB].[dbo].[t_object] tob 
 INNER JOIN [sparxDB].[dbo].[t_attribute] ta ON tob.[Object_ID] = ta.[Object_ID]  
 INNER JOIN [sparxDB].[dbo].[t_package] tp ON tob.[Package_ID] = tp.[Package_ID]  
WHERE tob.[Stereotype] IN ( 'LogicalEntity' , 'LookupData' ) 

-- For Subject Area and BPMEntity 
--  3,417 rows 
SELECT tob.[Object_Type] as 'Table_OT'
, tob.[Stereotype] as 'Table_ST' 
, ta.[Stereotype] as 'Attr_ST'
, ta.[Type] as 'Attr_Type'  
, tob.Name as 'Table_Name'
, ta.Name as 'Attr_Name'
, count(*) CT 
 FROM [sparxDB].[dbo].[t_object] tob 
 INNER JOIN [sparxDB].[dbo].[t_attribute] ta ON ta.[Object_ID] = tob.[Object_ID] 
 WHERE tob.[Stereotype] IN ( 'BPMEntity' , 'LogicalEntity' , 'LookupData' )
 GROUP BY ta.[Stereotype] , ta.[Type] , tob.[Object_Type] , tob.[Stereotype], tob.Name , ta.Name
 ORDER BY tob.[Stereotype] , ta.[Stereotype] , ta.[Type] 


-- This shows 10 attributes in an object child table, with the key only.  
SELECT 
  tob.[Stereotype] as 'TableNameParent' 
, tob.[Name] as 'TableName' 
, ta.[Name] as 'ColumnName' 
, count(*) CT 
 FROM [sparxDB].[dbo].[t_object] tob 
 INNER JOIN [sparxDB].[dbo].[t_attribute] ta ON ta.[Object_ID] = tob.[Object_ID] 
-- WHERE tob.[Stereotype] IN (  'LogicalEntity' , 'LookupData' ) AND tob.[Name] = 'Unemployment Situation' 
GROUP BY tob.[Stereotype] , tob.[Name] , ta.[Name]  
ORDER BY CT desc 

-- This shows all attributes 
-- 2,226 rows 
SELECT 
  tob.[Stereotype] as 'TableNameParent' 
, tob.[Name] as 'TableName' 
, ta.[Name] as 'ColumnName' 
, count(*) CT 
 FROM [sparxDB].[dbo].[t_object] tob 
 INNER JOIN [sparxDB].[dbo].[t_attribute] ta ON ta.[Object_ID] = tob.[Object_ID] 
-- WHERE tob.[Stereotype] IN (  'LogicalEntity' , 'LookupData' )  --AND tob.[Name] = 'Loan' 
 -- 'BPMEntity' , 
GROUP BY tob.[Stereotype] , tob.[Name] , ta.[Name]  
ORDER BY CT desc 

-- 20,171 rows 
SELECT 
  tob.[Stereotype] as 'TableNameParent' 
, tob.[Name] as 'TableName' 
, ta.[Name] as 'ColumnName' 
, tat.[Property] as 'ColumnProperty'
-- , tat.[VALUE]
, count(*) CT 
 FROM [sparxDB].[dbo].[t_object] tob 
 INNER JOIN [sparxDB].[dbo].[t_attribute] ta ON ta.[Object_ID] = tob.[Object_ID] 
 LEFT JOIN [sparxDB].[dbo].[t_attributetag] tat ON ta.[ID] = tat.[ElementID]
-- WHERE tob.[Stereotype] IN (  'LogicalEntity' , 'LookupData' )
 -- 'BPMEntity' , 
GROUP BY tob.[Stereotype] , tob.[Name] , ta.[Name] , tat.[Property] 
ORDER BY CT desc 


-- These are the duplicate rows. 
SELECT 
  tob.[Stereotype] as 'TableNameParent' 
, tob.[Name] as 'TableName' 
, ta.[Name] as 'ColumnName' 
, tat.[Property] as 'ColumnProperty'
, tat.[VALUE]
--, count(*) CT 
 FROM [sparxDB].[dbo].[t_object] tob 
 INNER JOIN [sparxDB].[dbo].[t_attribute] ta ON ta.[Object_ID] = tob.[Object_ID] 
 LEFT JOIN [sparxDB].[dbo].[t_attributetag] tat ON ta.[ID] = tat.[ElementID]
-- WHERE tob.[Stereotype] IN (  'LogicalEntity' , 'LookupData' )
 -- 'BPMEntity' , 
-- AND tob.[Name] IN ( 'Individual' , 'Margin Loan'  ) 
-- AND ta.[Name] IN ( 'Birth Date' , 'APIR Code' ) 
-- AND tat.[Property] IN ( 'Synonym' , 'Is Business Key' , 'Max Length' ) 
--GROUP BY tob.[Stereotype] , tob.[Name] , ta.[Name] , tat.[Property] HAVING count(*) > 1 

-- PROPA1 
-- shows object counts by packages 
SELECT 
    PS.GPNM 'GrandParent Package'  
  , PS.PPNM 'Parent Package' 
  , PS.OBST 'Child Package Stereotype'
  , PS.OBNM 'Child Package'
  , tob.[Stereotype] 'Object Stereotype' 
  , count(*) Object_CT 
  FROM [sparxDB].[dbo].[t_object] tob 
LEFT JOIN ( 
SELECT  tpi.Package_ID ,  tpgp.[Name] GPNM , tpp.[Name] PPNM , tob.[Stereotype] OBST, tob.[Name] OBNM
FROM [sparxDB].[dbo].[t_object] tob 
--  tob.Package_ID -> parent or join to parent 
INNER JOIN [sparxDB].[dbo].[t_package] tpp ON tob.Package_ID = tpp.Package_ID 
--  tob.[PDATA1] -> instance or join to instance  
INNER JOIN [sparxDB].[dbo].[t_package] tpi ON tob.[PDATA1] = tpi.Package_ID 
-- grandparent 
INNER JOIN [sparxDB].[dbo].[t_package] tpgp ON tpp.Parent_ID = tpgp.Package_ID 
where tob.[Object_Type] = 'Package' and tob.[Stereotype] is not null 
) PS ON tob.[Package_ID] = PS.[Package_ID]
  WHERE tob.[Object_Type] = 'Class' 
GROUP BY PS.GPNM , PS.PPNM , PS.OBST, PS.OBNM , tob.[Stereotype] 
ORDER BY PS.GPNM , PS.PPNM , PS.OBST, PS.OBNM , tob.[Stereotype] 

-- PROPA2 
-- 1,336 rows 
SELECT [ParentID]  , COUNT(*) CT 
  FROM [sparxDB].[dbo].[t_object]
  GROUP BY [ParentID]  
  ORDER BY CT DESC 

-- used across all Stereotypes 
SELECT tob.[Stereotype] , COUNT(*) CT 
  FROM [sparxDB].[dbo].[t_object] tob
  WHERE  tob.[ParentID] IS NOT NULL 
  GROUP BY tob.[Stereotype] 

-- [Classifier] is not used for a parent self join by Meta - but it could!  
SELECT [Classifier] , [Classifier_guid] , COUNT(*) CT 
  FROM [sparxDB].[dbo].[t_object]
  GROUP BY [Classifier] , [Classifier_guid]  
  ORDER BY CT DESC 


-- DROPName 
-- Relations with object names 
-- This is a useful invariant, as all rows should have a count of 1. 
-- 9,365 rows 
SELECT 'DROPA2A' as ROPType  
, CASE WHEN tobc.[Stereotype] IN ( 'LogicalEntity' , 'LookupData' , 'BPMEntity' ) THEN 'Glass' ELSE 'Blob' END Child_BG 
, tobp1.[Property] as Child2Parent  
, CASE WHEN tobp.[Stereotype] IN ( 'LogicalEntity' , 'LookupData' , 'BPMEntity' ) THEN 'Glass' ELSE 'Blob' END Parent_BG 
, tobc.Object_Type as Child_OT
, tobc.[Stereotype] as Child_ST
, tobc.[Name] as Child_Name
, tobp.Object_Type as Parent_OT
, tobp.[Stereotype] as Parent_ST
, tobp.[Name] as Parent_Name
, COUNT(*) CT 
FROM [sparxDB].[dbo].[t_object] tobp 
INNER JOIN [sparxDB].[dbo].[t_objectproperties] tobp1 ON tobp.[ea_guid] = tobp1.Value 
INNER JOIN [sparxDB].[dbo].[t_object] tobc  ON tobp1.[Object_ID] = tobc.[Object_ID]  
GROUP BY tobp.[Stereotype] , tobc.[Stereotype] , tobp1.[Property]  , tobp.Object_Type , tobc.Object_Type , tobc.[Name] , tobp.[Name]

UNION 
SELECT 'DROPA2G' as ROPType  
, CASE WHEN tobc.[Stereotype] IN ( 'LogicalEntity' , 'LookupData' , 'BPMEntity' ) THEN 'Glass' ELSE 'Blob' END Child_BG 
, tobp1.[Property] as Child2Parent
, CASE WHEN tobp.[Stereotype] IN ( 'LogicalEntity' , 'LookupData' , 'BPMEntity' ) THEN 'Glass' ELSE 'Blob' END Parent_BG 
, tobc.Object_Type as Child_OT
, tobc.[Stereotype] as Child_ST
, tobc.[Name] as Child_Name
, tobp.Object_Type as Parent_OT
, tobp.[Stereotype] as Parent_ST 
, tobp.[Name] as Parent_Name
, COUNT(*) CT 
FROM [sparxDB].[dbo].[t_object] tobc 
INNER JOIN [sparxDB].[dbo].[t_objectproperties] tobp1 ON tobc.[Object_ID]  = tobp1.[Object_ID] 
INNER JOIN [sparxDB].[dbo].[t_attribute] ta ON  tobp1.Value = ta.[ea_guid] 
INNER JOIN [sparxDB].[dbo].[t_object] tobp ON  ta.[Object_ID]  = tobp.[Object_ID] 
GROUP BY tobc.Object_Type , tobc.[Stereotype] , tobp1.[Property] , tobp.Object_Type , tobp.[Stereotype] , tobc.[Name] , tobp.[Name] 

UNION 
SELECT 'DROPG2A' as ROPType  
, CASE WHEN tobc.[Stereotype] IN ( 'LogicalEntity' , 'LookupData' , 'BPMEntity' ) THEN 'Glass' ELSE 'Blob' END Child_BG 
, tat.[Property] as Child2Parent 
, CASE WHEN tobp.[Stereotype] IN ( 'LogicalEntity' , 'LookupData' , 'BPMEntity' ) THEN 'Glass' ELSE 'Blob' END Parent_BG 
, tobc.Object_Type as Child_OT
, tobc.[Stereotype] as Child_ST
, tobc.[Name] as Child_Name
, tobp.Object_Type as Parent_OT
, tobp.[Stereotype] as Parent_ST 
, tobp.[Name] as Parent_Name
, COUNT(*) CT 
  FROM [sparxDB].[dbo].[t_object] tobc 
  INNER JOIN [sparxDB].[dbo].[t_attribute] ta ON tobc.[Object_ID] = ta.[Object_ID] 
  INNER JOIN [sparxDB].[dbo].[t_attributetag] tat ON ta.[ID] = tat.[ElementID]  
  INNER JOIN [sparxDB].[dbo].[t_object] tobp ON tat.[VALUE] = tobp.[ea_guid]  
-- include [t_attributetag] used for relations 
--  WHERE tat.[Property] =  'Selected Use' 
  --AND tat.[Value] like '{%' 
  GROUP BY  tobc.Object_Type , tobc.[Stereotype] , tat.[Property] ,tobp.Object_Type, tobp.[Stereotype] , tobc.[Name] , tobp.[Name] 

-- DROPCDTType
-- This shows additional type information on the data types. 
--  Still only Semantic Map 
-- 104 rows 
SELECT  'DROPCDT' as ROPType  
, tob1.Object_Type as Table_OT
, tob1.[Stereotype] as Table_ST
, ta.[Stereotype] as Column_ST 
, ta.[Type] as Column_Type 
, tat.[Property] as Column2CDT 
, ta2.[Stereotype] as ColumnData_ST 
, ta2.[Type] as ColumnDatatype  
, COUNT(*) CT 
 FROM [sparxDB].[dbo].[t_object] tob1 
  INNER JOIN [sparxDB].[dbo].[t_attribute] ta ON tob1.[Object_ID] = ta.[Object_ID] 
  INNER JOIN [sparxDB].[dbo].[t_attributetag] tat ON tat.[ElementID] = ta.[ID] 
  INNER JOIN [sparxDB].[dbo].[t_attribute] ta2 ON tat.[VALUE] = ta2.[ea_guid] 
  GROUP BY tob1.Object_Type , tob1.[Stereotype] , ta.[Stereotype] , ta.[Type] , tat.[Property] , ta2.[Stereotype] , ta2.[Type]

-- DROPCDTName
-- This shows table and column names. 
--  Still only Semantic Map 
-- 1,304 rows 
SELECT  'DROPCDT' as ROPType  
, tob1.Object_Type as Table_OT
, tob1.[Stereotype] as Table_ST
, tob1.[Name] as Table_Name 
, ta.[Stereotype] as Column_ST 
, ta.[Type] as Column_Type 
, ta.[Name] as Column_Name  
, tat.[Property] as Column2CDT 
, ta2.[Stereotype] as ColumnData_ST 
, ta2.[Type] as ColumnDatatype  
, ta2.[Name] as ColumnData_Name  
, COUNT(*) CT 
 FROM [sparxDB].[dbo].[t_object] tob1 
  INNER JOIN [sparxDB].[dbo].[t_attribute] ta ON tob1.[Object_ID] = ta.[Object_ID] 
  INNER JOIN [sparxDB].[dbo].[t_attributetag] tat ON tat.[ElementID] = ta.[ID] 
  INNER JOIN [sparxDB].[dbo].[t_attribute] ta2 ON tat.[VALUE] = ta2.[ea_guid] 
  GROUP BY tob1.Object_Type , tob1.[Stereotype] , ta.[Stereotype] , ta.[Type] , tat.[Property] 
  , ta2.[Stereotype] , ta2.[Type] , tob1.[Name] , ta.[Name] , ta2.[Name] 


-- DROPDBColumn 
-- This is all the table columns defined in Meta. 
-- Note that the path from column to schema uses the [ParentID] column i.e. PROP pattern. 
-- But the link from item to Table COlumn uses the DROPA2A pattern. 
-- 1,118 rows 
SELECT 'DROPA2A' as ROPType  
, CASE WHEN tobc.[Stereotype] IN ( 'LogicalEntity' , 'LookupData' , 'BPMEntity' ) THEN 'Glass' ELSE 'Blob' END Child_BG 
, tobp1.[Property] as Child2Parent  
, CASE WHEN tobp.[Stereotype] IN ( 'LogicalEntity' , 'LookupData' , 'BPMEntity' ) THEN 'Glass' ELSE 'Blob' END Parent_BG 
, tobc.Object_Type as Child_OT
, tobc.[Stereotype] as Child_ST
, tobc.[Name] as TableColumn 
, tobp.Object_Type as Parent_OT
, tobp.[Stereotype] as Parent_ST
, tobp.[Name] as Parent_Name
, tobcp.[Name] as RelationalTable 
, tobcpp.[Name] as DatabaseSchema
, COUNT(*) CT 
FROM [sparxDB].[dbo].[t_object] tobp 
INNER JOIN [sparxDB].[dbo].[t_objectproperties] tobp1 ON tobp.[ea_guid] = tobp1.Value 
INNER JOIN [sparxDB].[dbo].[t_object] tobc ON tobp1.[Object_ID] = tobc.[Object_ID] 
INNER JOIN [sparxDB].[dbo].[t_object] tobcp ON tobcp.[Object_ID] = tobc.[ParentID]  
INNER JOIN [sparxDB].[dbo].[t_object] tobcpp ON tobcpp.[Object_ID] = tobcp.[ParentID]  
WHERE tobp1.[Property] = 'Item Type'  AND tobp.Name = 'Table Column'  
 -- AND tobp.Name = 'Database Schema'  
GROUP BY tobp.[Stereotype] , tobc.[Stereotype] , tobp1.[Property]  , tobp.Object_Type , tobc.Object_Type 
, tobc.[Name] , tobp.[Name] , tobcp.[Name] , tobcpp.[Name]

-- GROPA2A 
-- relation only 
SELECT 'GROPA2A' as ROPType  
, tc.[Stereotype] as Child2Parent 
, count(*) CT 
  FROM [sparxDB].[dbo].[t_connector] tc
  INNER JOIN  [sparxDB].[dbo].[t_object] tobs   ON tc.Start_Object_ID = tobs.Object_ID 
  INNER JOIN  [sparxDB].[dbo].[t_object] tobe   ON tc.End_Object_ID = tobe.Object_ID 
  WHERE tobs.Stereotype IS NOT NULL AND tc.Stereotype IS NOT NULL AND tobe.Stereotype IS NOT NULL
  GROUP BY  tc.[Stereotype] 
  ORDER BY CT DESC 

--ROPType Child2Parent  CT
--GROPA2A BPMEntityAssociation  314
--GROPA2A AnalyticAssociation 188
--GROPA2A Generalization  133
--GROPA2A Association1  132
--GROPA2A Association2  85
--GROPA2A BPMEntitySubtype  83
--GROPA2A Association4  30
--GROPA2A Association3  24
--GROPA2A Association5  6
--GROPA2A Association6  5
--GROPA2A Association7  2

--- relations with Name 
-- 888 rows 

SELECT 'GROPA2A' as ROPType  
, tobs.Object_Type as Child_OT 
, tobs.Stereotype as Child_ST 
, tobs.[Name] as Child_NM 
, tc.[Stereotype] as Child2Parent
, tobe.Object_Type as Parent_OT  
, tobe.Stereotype as Parent_ST 
, tobe.Name as Parent_NM 
, count(*) CT 
  FROM [sparxDB].[dbo].[t_connector] tc
  INNER JOIN  [sparxDB].[dbo].[t_object] tobs   ON tc.Start_Object_ID = tobs.Object_ID 
  INNER JOIN  [sparxDB].[dbo].[t_object] tobe   ON tc.End_Object_ID = tobe.Object_ID 
  WHERE tobs.Stereotype IS NOT NULL AND tc.Stereotype IS NOT NULL AND tobe.Stereotype IS NOT NULL
  GROUP BY tobs.Object_Type , tobs.Stereotype , tc.[Stereotype] , tobe.Object_Type , tobe.Stereotype 
      , tobs.[Name] , tobe.Name

-- Profiling 
SELECT [Name] , COUNT(*) CT 
 FROM [sparxDB].[dbo].[t_connector] 
 WHERE [Name] IS NOT NULL 
 GROUP BY [Name] 
 ORDER BY CT DESC 
 --
-- Name CT
--is a  216
--may have  48
--must have 37
--provides information about  28

SELECT [Connector_Type], COUNT(*) CT 
  FROM [sparxDB].[dbo].[t_connector] 
  GROUP BY [Connector_Type] 
--
--Connector_Type  CT
--Association 786
--Generalization  216
--ObjectFlow  7

SELECT [Direction] , [Connector_Type] , [Stereotype] , count(*) CT
  FROM [sparxDB].[dbo].[t_connector]
group by   [Direction] , [Connector_Type] , [Stereotype] ; 

-- 1,009 rows 
SELECT tc.[Stereotype], tobs.Stereotype , tobe.Stereotype 
 ,tobs.Name  ,tobe.Name 
-- ,tobs.Note ,tobe.Note 
  FROM [sparxDB].[dbo].[t_connector] tc
  INNER JOIN  [sparxDB].[dbo].[t_object] tobs   ON tc.Start_Object_ID = tobs.Object_ID 
  INNER JOIN  [sparxDB].[dbo].[t_object] tobe   ON tc.End_Object_ID = tobe.Object_ID 
--  where tc.[Stereotype] = 'Generalization' 
-- where tc.[Stereotype] like 'Association%' ; 
  
-- all connectiosn are on a diagram  
SELECT tdl.* , tc.* 
  FROM [sparxDB].[dbo].[t_diagramlinks] tdl 
  inner join [sparxDB].[dbo].[t_connector] tc 
  on tdl.ConnectorID = tc.Connector_ID ;

-- GROPG2G 
-- Attr_Code 
-- The purpose of this is to link a code Attribute to 2 parent Objects: LogicalEntity and LookupData. 
-- This SQL uses the Classfier on [t_attribute] to provide a second object link. 
-- Classfier only exists on [t_attribute] with a [Stereotype] = Attr_Code 
-- Classifier is parent link back to the [Object_ID] on [t_attribute] as well as [t_object] 
-- Then there is link for each Attr back to its Object 

-- 246 rows 
SELECT DISTINCT ta.[Stereotype] Code_ST , ta.[Name] Code_Name , ta.[Type] Code_Type 
, tobc.[Stereotype] Code_Obj_ST , tobc.[Package_ID] Code_PKG , tobc.[Name] Code_Obj_Name , tobc.[Author] Code_Author 
, tobp.[Stereotype] Class_Obj_ST , tobp.[Package_ID] Class_PKG , tobp.[Name] Class_Obj_Name , tobp.[Author] Class_Author 
-- ta.[Object_ID] ,ta.[Classifier] , ta2.[Object_ID] , tob.[Object_Type] Code_Obj_type , tobp.[Object_Type] Class_Obj_type 
  FROM [sparxDB].[dbo].[t_attribute] ta 
  INNER JOIN [sparxDB].[dbo].[t_object] tobc ON ta.[Object_ID] = tobc.[Object_ID]
  INNER JOIN [sparxDB].[dbo].[t_object] tobp ON ta.[Classifier] = tobp.[Object_ID] 
-- WHERE ta.[Classifier] <> 0 


-- This SQL links the code attribute to data type information about the code. 
-- For some reason, most code have both an Attr_Code and an Attr_Text which seems denormalised. 
-- It is self evident that all Attibutes, including codes, require a definition.  
-- 453 rows 
  SELECT DISTINCT ta.[Stereotype] Code_ST , ta.[Name] Code_Name , ta.[Type] Code_Type 
, ta2.[Stereotype] Class_Attr_ST , ta2.[Name] Class_Attr_Name , ta2.[Type] Class_Attr_type
, ta.[Notes] Code_Notes, ta2.[Notes] Class_Notes
  FROM [sparxDB].[dbo].[t_attribute] ta 
  INNER JOIN [sparxDB].[dbo].[t_attribute] ta2 ON ta.[Classifier] = ta2.[Object_ID] 
  ORDER BY ta2.[Type] , ta.[Stereotype] , ta.[Name] 

