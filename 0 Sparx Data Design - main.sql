-- Profiling SQL used for a generic Sparx data design doct

-- DBTables 
SELECT  A.Name as TableName, AVG(B.rows) AS 'Row Count'
FROM sys.objects A
INNER JOIN sys.partitions B ON A.object_id = B.object_id
WHERE A.type = 'U' 
--AND AVG(B.rows) > 0 
GROUP BY A.Name 
ORDER BY AVG(B.rows) DESC

-- DBRelations 
SELECT 't_attribute' ptn, 'ea_guid' pcn, 't_attributetag' ctn, 'VALUE' ccn, Count(*) CT, Count(distinct ct.VALUE) CTDIS FROM [sparxDB].[dbo].t_attributetag ct Inner Join [sparxDB].[dbo].t_attribute pt On ct.VALUE = pt.ea_guid union 
SELECT 't_attribute' ptn, 'ID' pcn, 't_attributetag' ctn, 'ElementID' ccn, Count(*) CT, Count(distinct ct.ElementID) CTDIS FROM [sparxDB].[dbo].t_attributetag ct Inner Join [sparxDB].[dbo].t_attribute pt On ct.ElementID = pt.ID union 
SELECT 't_attribute' ptn, 'ea_guid' pcn, 't_objectproperties' ctn, 'VALUE' ccn, Count(*) CT, Count(distinct ct.VALUE) CTDIS FROM [sparxDB].[dbo].t_objectproperties ct Inner Join [sparxDB].[dbo].t_attribute pt On ct.VALUE = pt.ea_guid union 
SELECT 't_cardinality' ptn, 'Cardinality' pcn, 't_connector' ctn, 'DestCard' ccn, Count(*) CT, Count(distinct ct.DestCard) CTDIS FROM [sparxDB].[dbo].t_connector ct Inner Join [sparxDB].[dbo].t_cardinality pt On ct.DestCard = pt.Cardinality union 
SELECT 't_cardinality' ptn, 'Cardinality' pcn, 't_connector' ctn, 'SourceCard' ccn, Count(*) CT, Count(distinct ct.SourceCard) CTDIS FROM [sparxDB].[dbo].t_connector ct Inner Join [sparxDB].[dbo].t_cardinality pt On ct.SourceCard = pt.Cardinality union 
SELECT 't_connector' ptn, 'Connector_ID' pcn, 't_diagramlinks' ctn, 'ConnectorID' ccn, Count(*) CT, Count(distinct ct.ConnectorID) CTDIS FROM [sparxDB].[dbo].t_diagramlinks ct Inner Join [sparxDB].[dbo].t_connector pt On ct.ConnectorID = pt.Connector_ID union 
SELECT 't_connectortypes' ptn, 'Connector_Type' pcn, 't_connector' ctn, 'Connector_Type' ccn, Count(*) CT, Count(distinct ct.Connector_Type) CTDIS FROM [sparxDB].[dbo].t_connector ct Inner Join [sparxDB].[dbo].t_connectortypes pt On ct.Connector_Type = pt.Connector_Type union 
SELECT 't_diagram' ptn, 'Diagram_ID' pcn, 't_diagramlinks' ctn, 'DiagramID' ccn, Count(*) CT, Count(distinct ct.DiagramID) CTDIS FROM [sparxDB].[dbo].t_diagramlinks ct Inner Join [sparxDB].[dbo].t_diagram pt On ct.DiagramID = pt.Diagram_ID union 
SELECT 't_diagram' ptn, 'Diagram_ID' pcn, 't_diagramobjects' ctn, 'Diagram_ID' ccn, Count(*) CT, Count(distinct ct.Diagram_ID) CTDIS FROM [sparxDB].[dbo].t_diagramobjects ct Inner Join [sparxDB].[dbo].t_diagram pt On ct.Diagram_ID = pt.Diagram_ID union 
SELECT 't_diagramtypes' ptn, 'Diagram_Type' pcn, 't_diagram' ctn, 'Diagram_Type' ccn, Count(*) CT, Count(distinct ct.Diagram_Type) CTDIS FROM [sparxDB].[dbo].t_diagram ct Inner Join [sparxDB].[dbo].t_diagramtypes pt On ct.Diagram_Type = pt.Diagram_Type union 
SELECT 't_document' ptn, 'DocID' pcn, 't_object' ctn, 'ea_guid' ccn, Count(*) CT, Count(distinct ct.ea_guid) CTDIS FROM [sparxDB].[dbo].t_object ct Inner Join [sparxDB].[dbo].t_document pt On ct.ea_guid = pt.DocID union 
SELECT 't_document' ptn, 'ElementID' pcn, 't_object' ctn, 'ea_guid' ccn, Count(*) CT, Count(distinct ct.ea_guid) CTDIS FROM [sparxDB].[dbo].t_object ct Inner Join [sparxDB].[dbo].t_document pt On ct.ea_guid = pt.ElementID union 
SELECT 't_object' ptn, 'Object_ID' pcn, 't_attribute' ctn, 'Object_ID' ccn, Count(*) CT, Count(distinct ct.Object_ID) CTDIS FROM [sparxDB].[dbo].t_attribute ct Inner Join [sparxDB].[dbo].t_object pt On ct.Object_ID = pt.Object_ID union 
SELECT 't_object' ptn, 'ea_guid' pcn, 't_attributetag' ctn, 'VALUE' ccn, Count(*) CT, Count(distinct ct.VALUE) CTDIS FROM [sparxDB].[dbo].t_attributetag ct Inner Join [sparxDB].[dbo].t_object pt On ct.VALUE = pt.ea_guid union 
SELECT 't_object' ptn, 'Object_ID' pcn, 't_connector' ctn, 'End_Object_ID' ccn, Count(*) CT, Count(distinct ct.End_Object_ID) CTDIS FROM [sparxDB].[dbo].t_connector ct Inner Join [sparxDB].[dbo].t_object pt On ct.End_Object_ID = pt.Object_ID union 
SELECT 't_object' ptn, 'Object_ID' pcn, 't_connector' ctn, 'Start_Object_ID' ccn, Count(*) CT, Count(distinct ct.Start_Object_ID) CTDIS FROM [sparxDB].[dbo].t_connector ct Inner Join [sparxDB].[dbo].t_object pt On ct.Start_Object_ID = pt.Object_ID union 
SELECT 't_object' ptn, 'Object_ID' pcn, 't_diagramobjects' ctn, 'Object_ID' ccn, Count(*) CT, Count(distinct ct.Object_ID) CTDIS FROM [sparxDB].[dbo].t_diagramobjects ct Inner Join [sparxDB].[dbo].t_object pt On ct.Object_ID = pt.Object_ID union 
SELECT 't_object' ptn, 'ParentID' pcn, 't_object' ctn, 'Object_ID' ccn, Count(*) CT, Count(distinct ct.Object_ID) CTDIS FROM [sparxDB].[dbo].t_object ct Inner Join [sparxDB].[dbo].t_object pt On ct.Object_ID = pt.ParentID union 
SELECT 't_object' ptn, 'ea_guid' pcn, 't_objectproperties' ctn, 'VALUE' ccn, Count(*) CT, Count(distinct ct.VALUE) CTDIS FROM [sparxDB].[dbo].t_objectproperties ct Inner Join [sparxDB].[dbo].t_object pt On ct.VALUE = pt.ea_guid union 
SELECT 't_object' ptn, 'Object_ID' pcn, 't_objectproperties' ctn, 'Object_ID' ccn, Count(*) CT, Count(distinct ct.Object_ID) CTDIS FROM [sparxDB].[dbo].t_objectproperties ct Inner Join [sparxDB].[dbo].t_object pt On ct.Object_ID = pt.Object_ID union 
SELECT 't_object' ptn, 'ea_guid' pcn, 't_package' ctn, 'ea_guid' ccn, Count(*) CT, Count(distinct ct.ea_guid) CTDIS FROM [sparxDB].[dbo].t_package ct Inner Join [sparxDB].[dbo].t_object pt On ct.ea_guid = pt.ea_guid union 
SELECT 't_object' ptn, 'ea_guid' pcn, 't_xref' ctn, 'Client' ccn, Count(*) CT, Count(distinct ct.Client) CTDIS FROM [sparxDB].[dbo].t_xref ct Inner Join [sparxDB].[dbo].t_object pt On ct.Client = pt.ea_guid union 
SELECT 't_objecttypes' ptn, 'Object_Type' pcn, 't_object' ctn, 'Object_Type' ccn, Count(*) CT, Count(distinct ct.Object_Type) CTDIS FROM [sparxDB].[dbo].t_object ct Inner Join [sparxDB].[dbo].t_objecttypes pt On ct.Object_Type = pt.Object_Type union 
SELECT 't_package' ptn, 'Package_ID' pcn, 't_diagram' ctn, 'Package_ID' ccn, Count(*) CT, Count(distinct ct.Package_ID) CTDIS FROM [sparxDB].[dbo].t_diagram ct Inner Join [sparxDB].[dbo].t_package pt On ct.Package_ID = pt.Package_ID union 
SELECT 't_package' ptn, 'Package_ID' pcn, 't_diagramtypes' ctn, 'Package_ID' ccn, Count(*) CT, Count(distinct ct.Package_ID) CTDIS FROM [sparxDB].[dbo].t_diagramtypes ct Inner Join [sparxDB].[dbo].t_package pt On ct.Package_ID = pt.Package_ID union 
SELECT 't_package' ptn, 'ea_guid' pcn, 't_object' ctn, 'ea_guid' ccn, Count(*) CT, Count(distinct ct.ea_guid) CTDIS FROM [sparxDB].[dbo].t_object ct Inner Join [sparxDB].[dbo].t_package pt On ct.ea_guid = pt.ea_guid union 
SELECT 't_package' ptn, 'Package_ID' pcn, 't_object' ctn, 'PDATA1' ccn, Count(*) CT, Count(distinct ct.PDATA1) CTDIS FROM [sparxDB].[dbo].t_object ct Inner Join [sparxDB].[dbo].t_package pt On ct.PDATA1 = pt.Package_ID union 
SELECT 't_package' ptn, 'Package_ID' pcn, 't_object' ctn, 'Package_ID' ccn, Count(*) CT, Count(distinct ct.Package_ID) CTDIS FROM [sparxDB].[dbo].t_object ct Inner Join [sparxDB].[dbo].t_package pt On ct.Package_ID = pt.Package_ID union 
SELECT 't_package' ptn, 'Parent_ID' pcn, 't_package' ctn, 'Package_ID' ccn, Count(*) CT, Count(distinct ct.Package_ID) CTDIS FROM [sparxDB].[dbo].t_package ct Inner Join [sparxDB].[dbo].t_package pt On ct.Package_ID = pt.Parent_ID union 
SELECT 't_statustypes' ptn, 'Status' pcn, 't_object' ctn, 'Status' ccn, Count(*) CT, Count(distinct ct.Status) CTDIS FROM [sparxDB].[dbo].t_object ct Inner Join [sparxDB].[dbo].t_statustypes pt On ct.Status = pt.Status union 
SELECT 't_stereotypes' ptn, 'Stereotype' pcn, 't_object' ctn, 'Stereotype' ccn, Count(*) CT, Count(distinct ct.Stereotype) CTDIS FROM [sparxDB].[dbo].t_object ct Inner Join [sparxDB].[dbo].t_stereotypes pt On ct.Stereotype = pt.Stereotype union 
SELECT 't_attribute' ptn, 'ea_guid' pcn, 't_attributetag' ctn, 'ea_guid' ccn, Count(*) CT, Count(distinct ct.ea_guid) CTDIS FROM [sparxDB].[dbo].t_attributetag ct Inner Join [sparxDB].[dbo].t_attribute pt On ct.ea_guid = pt.ea_guid union 
SELECT 't_diagram' ptn, 'Diagram_ID' pcn, 't_connector' ctn, 'DiagramID' ccn, Count(*) CT, Count(distinct ct.DiagramID) CTDIS FROM [sparxDB].[dbo].t_connector ct Inner Join [sparxDB].[dbo].t_diagram pt On ct.DiagramID = pt.Diagram_ID union 
SELECT 't_diagram' ptn, 'ParentID' pcn, 't_diagram' ctn, 'Diagram_ID' ccn, Count(*) CT, Count(distinct ct.Diagram_ID) CTDIS FROM [sparxDB].[dbo].t_diagram ct Inner Join [sparxDB].[dbo].t_diagram pt On ct.Diagram_ID = pt.ParentID union 
SELECT 't_diagram' ptn, 'Diagram_ID' pcn, 't_object' ctn, 'Diagram_ID' ccn, Count(*) CT, Count(distinct ct.Diagram_ID) CTDIS FROM [sparxDB].[dbo].t_object ct Inner Join [sparxDB].[dbo].t_diagram pt On ct.Diagram_ID = pt.Diagram_ID union 
SELECT 't_image' ptn, 'ImageID' pcn, 't_objecttypes' ctn, 'ImageID' ccn, Count(*) CT, Count(distinct ct.ImageID) CTDIS FROM [sparxDB].[dbo].t_objecttypes ct Inner Join [sparxDB].[dbo].t_image pt On ct.ImageID = pt.ImageID union 
SELECT 't_object' ptn, 'ea_guid' pcn, 't_attribute' ctn, 'ea_guid' ccn, Count(*) CT, Count(distinct ct.ea_guid) CTDIS FROM [sparxDB].[dbo].t_attribute ct Inner Join [sparxDB].[dbo].t_object pt On ct.ea_guid = pt.ea_guid union 
SELECT 't_object' ptn, 'ea_guid' pcn, 't_attributetag' ctn, 'ea_guid' ccn, Count(*) CT, Count(distinct ct.ea_guid) CTDIS FROM [sparxDB].[dbo].t_attributetag ct Inner Join [sparxDB].[dbo].t_object pt On ct.ea_guid = pt.ea_guid union 
SELECT 't_object' ptn, 'ea_guid' pcn, 't_diagram' ctn, 'ea_guid' ccn, Count(*) CT, Count(distinct ct.ea_guid) CTDIS FROM [sparxDB].[dbo].t_diagram ct Inner Join [sparxDB].[dbo].t_object pt On ct.ea_guid = pt.ea_guid union 
SELECT 't_stereotypes' ptn, 'Stereotype' pcn, 't_attribute' ctn, 'Stereotype' ccn, Count(*) CT, Count(distinct ct.Stereotype) CTDIS FROM [sparxDB].[dbo].t_attribute ct Inner Join [sparxDB].[dbo].t_stereotypes pt On ct.Stereotype = pt.Stereotype union 
SELECT 't_stereotypes' ptn, 'Stereotype' pcn, 't_connector' ctn, 'Stereotype' ccn, Count(*) CT, Count(distinct ct.Stereotype) CTDIS FROM [sparxDB].[dbo].t_connector ct Inner Join [sparxDB].[dbo].t_stereotypes pt On ct.Stereotype = pt.Stereotype union 
SELECT 't_stereotypes' ptn, 'Stereotype' pcn, 't_diagram' ctn, 'Stereotype' ccn, Count(*) CT, Count(distinct ct.Stereotype) CTDIS FROM [sparxDB].[dbo].t_diagram ct Inner Join [sparxDB].[dbo].t_stereotypes pt On ct.Stereotype = pt.Stereotype  

-- Packages 
-- used as lookup table to package hierarchy 
SELECT DISTINCT tpp.Package_ID PPID ,  tpgp.[Name] GPNM , tpp.[Name] PPNM , tob.[Stereotype] OBST
--, tob.[Name] OBNM
--, tpp.Parent_ID , tpi.Package_ID, tpi.Parent_ID , tob.Package_ID , tob.[PDATA1] 
FROM [sparxDB].[dbo].[t_object] tob 
--  tob.Package_ID -> parent or join to parent 
INNER JOIN [sparxDB].[dbo].[t_package] tpp ON tob.Package_ID = tpp.Package_ID 
--  tob.[PDATA1] -> instance or join to instance  
INNER JOIN [sparxDB].[dbo].[t_package] tpi ON tob.[PDATA1] = tpi.Package_ID 
-- grandparent 
INNER JOIN [sparxDB].[dbo].[t_package] tpgp ON tpp.Parent_ID = tpgp.Package_ID 
where tob.[Object_Type] = 'Package' and tob.[Stereotype] is not null 


-- TROPB1 
-- These are the primary Stereotypes used. 
-- 23 rows 
SELECT [Stereotype], [Object_Type] 
, CASE WHEN tob.[Stereotype] IN ( 'LogicalEntity' , 'LookupData' , 'BPMEntity' ) THEN 'Glass' ELSE 'Blob' END Child_BG 
, count(*) CT 
 FROM [sparxDB].[dbo].[t_object] tob 
 WHERE [Stereotype] IS NOT NULL 
  AND [Object_Type] <> 'Object' 
 GROUP By [Stereotype], [Object_Type]
 ORDER by [Object_Type], [Stereotype] 

-- TROPB2Base 
-- These shows the property on each kind of base Object, and filters out derieved objects. 
-- Join to object, so no relations for base objects only
-- 41 rows 
SELECT  tob.[Object_Type] , tob.[Stereotype] , topr.[Property]
, count(*) CT 
  FROM [sparxDB].[dbo].[t_objectproperties] topr
  INNER JOIN [sparxDB].[dbo].[t_object] tob ON topr.[Object_ID] = tob.[Object_ID] 
  WHERE  tob.[Stereotype] in (
    'Implementation Item' , 'Implementation Item Type' , 'Implementation Source Type' , 'LogicalEntity' , 'LookupData' 
    , 'Implementation Source' , 'SubjectArea' )
  GROUP BY tob.[Object_Type] , tob.[Stereotype] , topr.[Property] 
  ORDER BY tob.[Object_Type] , tob.[Stereotype] , topr.[Property] 

-- TROPB2Critical 
-- These show the most important or critial Properties and their values for data integration.  
-- 41 rows 
SELECT topr.[Property] , topr.[Value] , count(*) CT 
  FROM [sparxDB].[dbo].[t_objectproperties] topr
  WHERE topr.[Value] NOT LIKE '{%' 
  AND topr.[Property] IN ('Dissemination Classification' , 'Data Type' , 'Governance Entity' , 'Industry Standard' , 'Security Classification' , 'Status' )
  GROUP BY topr.[Property] , topr.[Value] 
  ORDER BY topr.[Property] , topr.[Value] 

-- TROPG1 
-- [Stereotype] on [t_attribute] is reasonably consistent, with only a few errors. 
-- [Type] on [t_attribute] is a mix up code and primitive data types 
-- [Stereotype] and [Type] are loosely related. 
-- [Stereotype] = Attr_Code seems to have correct values in [Type], except when [Type] = string 
-- [Stereotype] = Attr_Text sometimes links to a Code or type.  

-- With No Codes 
-- 30 rows 
SELECT [Stereotype], [Type] , Count(*) CT 
FROM [sparxDB].[dbo].[t_attribute] 
WHERE [Stereotype] <> 'Attr_Code'
GROUP BY [Stereotype], [Type]  
ORDER BY [Stereotype], [Type]  

-- TOPGG2 
-- Example for Address 
-- 60 rows 
SELECT 
  tob.[Stereotype] , tob.[Name] 
, ta.[Name] , ta.[Stereotype] , ta.[Type]
, tag.[Property] , tag.[VALUE]
-- tob.[Object_Type] , , tob.[Package_ID] 
  FROM [sparxDB].[dbo].[t_attributetag] tag 
  INNER JOIN [sparxDB].[dbo].[t_attribute] ta ON tag.ElementID = ta.[ID]
  INNER JOIN [sparxDB].[dbo].[t_object] tob ON ta.[Object_ID] = tob.[Object_ID] 
  WHERE tag.[Value] NOT LIKE '{%'
  AND  tob.[Stereotype] = 'LogicalEntity' and  tob.[Name] = 'Address'  
  ORDER BY ta.[Name] , tag.[Property] 

-- gets critical examples  
-- 7 rows 
SELECT  tat.[Property] , tat.[VALUE] , count(*) CT 
 FROM [sparxDB].[dbo].[t_attributetag] tat 
 WHERE tat.[Value] NOT LIKE '{%' 
 AND tat.[Property] IN ('Dissemination Classification' , 'Data Type' , 'Governance Entity' , 'Industry Standard' , 'Security Classification' , 'Status' )
 GROUP BY tat.[Property] , tat.[VALUE] 
 ORDER BY tat.[Property] , tat.[VALUE] 

-- Pattern Types 
-- Boilerplate  
-- This shows all boilerplate columns in the 3 reify tables. 
-- The subset of reusable boilerplate columns are manually determined. 
-- 107 rows 
SELECT [TABLE_CATALOG]
      ,[TABLE_SCHEMA]
      ,[TABLE_NAME]
      ,[COLUMN_NAME]
      ,[ORDINAL_POSITION]
      ,[IS_NULLABLE]
      ,[DATA_TYPE]
      ,[CHARACTER_MAXIMUM_LENGTH]
      ,[NUMERIC_PRECISION]
      ,[NUMERIC_PRECISION_RADIX]
      ,[DATETIME_PRECISION]
      ,[CHARACTER_SET_NAME]
  FROM [INFORMATION_SCHEMA].[COLUMNS] 
  WHERE [TABLE_NAME] IN ( 't_package' , 't_object' , 't_attribute' ) 
  --, 't_objectproperties', 't_attributetag' ) 
  ORDER BY [TABLE_NAME] , [ORDINAL_POSITION] 


-- PatternPV 
-- aka PVUsage type 
-- This shows all the properties already defined, and therefore available for other object tables. 
-- Name only, with type info implied by the values 
-- tobp and tat are really just a (k,v) or PV tuple attached to an object or attribute. 
-- when creating new PV columns, check this list first to see if there is a match. 
-- If not, make a new one. 
-- 46 rows 

SELECT CTS2.[Property] , MAX(CTS2.[Value]) Max_Value, 't_objectproperties' PVTable
FROM 
(SELECT tobp3.[Property] , tobp3.[Value] , COUNT(*) CT 
  FROM [sparxDB].[dbo].[t_objectproperties] tobp3  
   WHERE tobp3.[Value] NOT LIKE '{%' 
    GROUP BY tobp3.[Property] , tobp3.[Value]) CTS2 

  INNER JOIN (
    SELECT tobp2.[Property] , MAX(CT) MAX_CT
    FROM [sparxDB].[dbo].[t_objectproperties] tobp2 
    INNER JOIN 
      (SELECT [Property] , [Value] , COUNT(*) CT 
       FROM [sparxDB].[dbo].[t_objectproperties] tobp 
       WHERE tobp.[Value] NOT LIKE '{%' 
       GROUP BY [Property] , [Value]
      ) CTS ON tobp2.[Property] = CTS.[Property] 
    WHERE tobp2.[Value] NOT LIKE '{%' 
    GROUP BY tobp2.[Property]
    ) CTMAX 
    ON CTS2.[Property] = CTMAX.[Property] 
    AND CTS2.CT = CTMAX.MAX_CT
GROUP BY CTS2.[Property]

UNION 

SELECT CTS2.[Property] , MAX(CTS2.[Value]) Max_Value, 't_attributetag' PVTable
FROM 
(SELECT tobp3.[Property] , tobp3.[Value] , COUNT(*) CT 
  FROM [sparxDB].[dbo].[t_attributetag] tobp3  
   WHERE tobp3.[Value] NOT LIKE '{%' 
    GROUP BY tobp3.[Property] , tobp3.[Value]) CTS2 

  INNER JOIN (
    SELECT tobp2.[Property] , MAX(CT) MAX_CT
    FROM [sparxDB].[dbo].[t_attributetag] tobp2 
    INNER JOIN 
      (SELECT [Property] , [Value] , COUNT(*) CT 
       FROM [sparxDB].[dbo].[t_attributetag] tobp 
       WHERE tobp.[Value] NOT LIKE '{%' 
       GROUP BY [Property] , [Value]
      ) CTS ON tobp2.[Property] = CTS.[Property] 
    WHERE tobp2.[Value] NOT LIKE '{%' 
    GROUP BY tobp2.[Property]
    ) CTMAX 
    ON CTS2.[Property] = CTMAX.[Property] 
    AND CTS2.CT = CTMAX.MAX_CT
GROUP BY CTS2.[Property]

-- CROPA  
-- this shows the object child table created from the join of [t_object] and [t_objectproperties] tables. 
-- This shows relations between Stereotypes and Columns. 
-- For Base, and for Derived 
-- This shows the reified columns aka properties used in the base object layer. 
-- 20 rows 

SELECT tob.[Stereotype] TN , tobp.[Property] CN, 'PropertyValue' ColType , COUNT(*) CT 
FROM [sparxDB].[dbo].[t_object] tob 
INNER JOIN [sparxDB].[dbo].[t_objectproperties] tobp ON tobp.[Object_ID] = tob.[Object_ID] 
INNER JOIN [sparxDB].[dbo].[t_package] tp ON tob.[Package_ID] = tp.[Package_ID]  
-- filter out all guids 
WHERE tobp.[Value] NOT LIKE '{%' 
-- base objects only 
AND tp.[Parent_ID] in ( 83 , 128 ) 
-- dervied objects only 
--AND tp.[Parent_ID] = 96 
GROUP BY tob.[Stereotype] ,tobp.[Property] 
ORDER BY tob.[Stereotype] ,tobp.[Property]

-- GROPG1 
-- This example shows 10 attributes in an object child table, showing the combination of the attribute boilerplate. 
SELECT 
  tob.[Stereotype] as 'TableNameParent' 
, ta.Object_ID 
, tob.[Name] as 'TableName' 
, ta.[Name] as 'ColumnName' 
, ta.Scope, ta.Stereotype, Notes, ID, Pos, ta.Classifier, Type
 FROM [sparxDB].[dbo].[t_object] tob 
 INNER JOIN [sparxDB].[dbo].[t_attribute] ta ON ta.[Object_ID] = tob.[Object_ID] 
 WHERE tob.[Stereotype] IN (  'LogicalEntity' , 'LookupData' )
 AND tob.[Name] = 'Unemployment Situation' 

-- GROPG2 
-- This shows a simple example of the columns on the object child Full table. 
-- 16 rows. 
-- There are only 2 columns, but each one has 8 boilerplate ColumnProperty values. 
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
 WHERE tob.[Stereotype] IN (  'LogicalEntity' , 'LookupData' )
 AND tob.[Name] = 'Loan' 
 -- 'BPMEntity' , 
GROUP BY tob.[Stereotype] , tob.[Name] , ta.[Name] , tat.[Property]
ORDER BY CT desc 

-- PROPA1 
-- shows object counts by packages without child package name 
SELECT 
    PS.GPNM 'GrandParent Package'  
  , PS.PPNM 'Parent Package' 
  , PS.OBST 'Child Package Stereotype'
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
GROUP BY PS.GPNM , PS.PPNM , PS.OBST, tob.[Stereotype] 
ORDER BY PS.GPNM , PS.PPNM , PS.OBST, tob.[Stereotype] 

-- PROPA2 
-- standard parent self join is only used by Implementation Items by Meta 
-- 3 rows 
SELECT 'PROPA2' as ROPType  
, tobc.Object_Type as Child_OT
, tobc.[Stereotype] as Child_ST
, 'isChildOf' as Child2Parent 
, tobp.Object_Type as Parent_OT
, tobp.[Stereotype] as Parent_ST
, COUNT(*) CT 
FROM [sparxDB].[dbo].[t_object] tobc 
INNER JOIN [sparxDB].[dbo].[t_object] tobp ON tobp.[Object_ID] = tobc.[ParentID]
GROUP BY tobc.[Stereotype] , tobp.[Stereotype] , tobc.Object_Type , tobp.Object_Type

--PROPType  Child_OT  Child_ST  Child2Parent  Parent_OT Parent_ST CT
--PROPA Class Implementation Item isChildOf Class Implementation Item 7140
--PROPA Class Implementation Item Type  isChildOf Class Implementation Item Type  17
--PROPA Class Implementation Item Type  isChildOf Class Implementation Source Type  8


-- DROPAll 
-- This shows the ROP patterns used for each relation name.  
-- Relations only 
-- Note the reuse of Selected Use for DROPA2A and DROPG2A patterns. 
-- Also the reuse of Semantic Map for DROPA2G and DROPCDT patterns.
-- 18 rows 
SELECT 'DROPA2A' as ROPType  
, tobp1.[Property] as Parent2Child  
, COUNT(*) CT 
FROM [sparxDB].[dbo].[t_object] tobc 
INNER JOIN [sparxDB].[dbo].[t_objectproperties] tobp1 ON tobc.[ea_guid] = tobp1.Value 
INNER JOIN [sparxDB].[dbo].[t_object] tobp  ON tobp1.[Object_ID] = tobp.[Object_ID]  
GROUP BY tobp1.[Property]   

UNION 
SELECT 'DROPA2G' as ROPType  
, tobp1.[Property] as Child2Parent
, COUNT(*) CT 
FROM [sparxDB].[dbo].[t_object] tobc 
INNER JOIN [sparxDB].[dbo].[t_objectproperties] tobp1 ON tobc.[Object_ID]  = tobp1.[Object_ID] 
INNER JOIN [sparxDB].[dbo].[t_attribute] ta ON  tobp1.Value = ta.[ea_guid] 
INNER JOIN [sparxDB].[dbo].[t_object] tobp ON  ta.[Object_ID]  = tobp.[Object_ID] 
GROUP BY  tobp1.[Property] 

UNION 
SELECT 'DROPG2A' as ROPType  
, tat.[Property] as Child2Parent 
, COUNT(*) CT 
  FROM [sparxDB].[dbo].[t_object] tobc 
  INNER JOIN [sparxDB].[dbo].[t_attribute] ta ON tobc.[Object_ID] = ta.[Object_ID] 
  INNER JOIN [sparxDB].[dbo].[t_attributetag] tat ON ta.[ID] = tat.[ElementID]  
  INNER JOIN [sparxDB].[dbo].[t_object] tobp ON tat.[VALUE] = tobp.[ea_guid]  
  GROUP BY tat.[Property] 

UNION
SELECT 'DROPCDT' as ROPType  
, tat.[Property] as Column2CDT 
, COUNT(*) CT 
 FROM [sparxDB].[dbo].[t_object] tob1 
  INNER JOIN [sparxDB].[dbo].[t_attribute] ta ON tob1.[Object_ID] = ta.[Object_ID] 
  INNER JOIN [sparxDB].[dbo].[t_attributetag] tat ON tat.[ElementID] = ta.[ID] 
  INNER JOIN [sparxDB].[dbo].[t_attribute] ta2 ON tat.[VALUE] = ta2.[ea_guid] 
  GROUP BY tat.[Property] 



-- DROPST 
-- This shows the main 3 ROPtypes for DROPs. 
-- This shows for each relation the child and parent Blob or Glass type, which is determined by Stereotype. 
-- Most DROPA2A relations are between 2 Blobs, but there are a small number where either can be a Glass. 
-- All the DROPA2G relations have a Blob child and a Glass parent. 
-- Finally, there is only one DROPG2A relation which has a Glass child and a Blob parent. 
-- This also shows the child and parent object type which can be class or package. 
-- Packages only appear as Blobs, so these only occur in DROPA2A relations. 
-- Finally, it also shows the child and parent Stereotype, which should make clear these patterns. 
-- There are a few reused Child2Parent relations between different Stereotypes. 
-- 26 rows 
SELECT 'DROPA2A' as ROPType  
, CASE WHEN tobc.[Stereotype] IN ( 'LogicalEntity' , 'LookupData' , 'BPMEntity' ) THEN 'Glass' ELSE 'Blob' END Child_BG 
, tobp1.[Property] as Child2Parent  
, CASE WHEN tobp.[Stereotype] IN ( 'LogicalEntity' , 'LookupData' , 'BPMEntity' ) THEN 'Glass' ELSE 'Blob' END Parent_BG 
, tobc.Object_Type as Child_OT
, tobc.[Stereotype] as Child_ST
, tobp.Object_Type as Parent_OT
, tobp.[Stereotype] as Parent_ST
, COUNT(*) CT 
FROM [sparxDB].[dbo].[t_object] tobp 
INNER JOIN [sparxDB].[dbo].[t_objectproperties] tobp1 ON tobp.[ea_guid] = tobp1.Value 
INNER JOIN [sparxDB].[dbo].[t_object] tobc  ON tobp1.[Object_ID] = tobc.[Object_ID]  
GROUP BY tobp.[Stereotype] , tobc.[Stereotype] , tobp1.[Property]  , tobp.Object_Type , tobc.Object_Type

UNION 
SELECT 'DROPA2G' as ROPType  
, CASE WHEN tobc.[Stereotype] IN ( 'LogicalEntity' , 'LookupData' , 'BPMEntity' ) THEN 'Glass' ELSE 'Blob' END Child_BG 
, tobp1.[Property] as Child2Parent
, CASE WHEN tobp.[Stereotype] IN ( 'LogicalEntity' , 'LookupData' , 'BPMEntity' ) THEN 'Glass' ELSE 'Blob' END Parent_BG 
, tobc.Object_Type as Child_OT
, tobc.[Stereotype] as Child_ST
, tobp.Object_Type as Parent_OT
, tobp.[Stereotype] as Parent_ST 
, COUNT(*) CT 
FROM [sparxDB].[dbo].[t_object] tobc 
INNER JOIN [sparxDB].[dbo].[t_objectproperties] tobp1 ON tobc.[Object_ID]  = tobp1.[Object_ID] 
INNER JOIN [sparxDB].[dbo].[t_attribute] ta ON  tobp1.Value = ta.[ea_guid] 
INNER JOIN [sparxDB].[dbo].[t_object] tobp ON  ta.[Object_ID]  = tobp.[Object_ID] 
GROUP BY tobc.Object_Type , tobc.[Stereotype] , tobp1.[Property] , tobp.Object_Type , tobp.[Stereotype]

UNION 
SELECT 'DROPG2A' as ROPType  
, CASE WHEN tobc.[Stereotype] IN ( 'LogicalEntity' , 'LookupData' , 'BPMEntity' ) THEN 'Glass' ELSE 'Blob' END Child_BG 
, tat.[Property] as Child2Parent 
, CASE WHEN tobp.[Stereotype] IN ( 'LogicalEntity' , 'LookupData' , 'BPMEntity' ) THEN 'Glass' ELSE 'Blob' END Parent_BG 
, tobc.Object_Type as Child_OT
, tobc.[Stereotype] as Child_ST
, tobp.Object_Type as Parent_OT
, tobp.[Stereotype] as Parent_ST 
, COUNT(*) CT 
  FROM [sparxDB].[dbo].[t_object] tobc 
  INNER JOIN [sparxDB].[dbo].[t_attribute] ta ON tobc.[Object_ID] = ta.[Object_ID] 
  INNER JOIN [sparxDB].[dbo].[t_attributetag] tat ON ta.[ID] = tat.[ElementID]  
  INNER JOIN [sparxDB].[dbo].[t_object] tobp ON tat.[VALUE] = tobp.[ea_guid]  
-- include [t_attributetag] used for relations 
--  WHERE tat.[Property] =  'Selected Use' 
  --AND tat.[Value] like '{%' 
  GROUP BY  tobc.Object_Type , tobc.[Stereotype] , tat.[Property] ,tobp.Object_Type, tobp.[Stereotype] 

  
-- DROPCDT 
-- This is for column Data Types when representing RBMS metadata. 
-- This shows Stereotypes only  
-- Semantic Map is the only relation. 
-- 12 rows 
SELECT 'DROPCDT' as ROPType  
, tob1.[Stereotype] as Table_ST 
, ta.[Stereotype] as Column_ST 
, tat.[Property] as Column2CDT 
, ta2.[Stereotype] as ColumnData_ST 
, COUNT(*) CT 
 FROM [sparxDB].[dbo].[t_object] tob1 
  INNER JOIN [sparxDB].[dbo].[t_attribute] ta ON tob1.[Object_ID] = ta.[Object_ID] 
  INNER JOIN [sparxDB].[dbo].[t_attributetag] tat ON tat.[ElementID] = ta.[ID] 
  INNER JOIN [sparxDB].[dbo].[t_attribute] ta2 ON tat.[VALUE] = ta2.[ea_guid] 
  GROUP BY tob1.[Stereotype] , ta.[Stereotype] , tat.[Property] , ta2.[Stereotype] 
  
  
-- DROPDBSchema 
-- This shows the databases defined. 
-- 11 rows 
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
WHERE tobp1.[Property] = 'Item Type' and tobp.Name = 'Database Schema'  
GROUP BY tobp.[Stereotype] , tobc.[Stereotype] , tobp1.[Property]  , tobp.Object_Type , tobc.Object_Type , tobc.[Name] , tobp.[Name]

-- DROPDBTable 
-- This shows the Relational Tables and Database Schema defined in Meta. 
-- 141 rows 
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
, tobcp.[Name] as DatabaseSchema
, COUNT(*) CT 
FROM [sparxDB].[dbo].[t_object] tobp 
INNER JOIN [sparxDB].[dbo].[t_objectproperties] tobp1 ON tobp.[ea_guid] = tobp1.Value 
INNER JOIN [sparxDB].[dbo].[t_object] tobc  ON tobp1.[Object_ID] = tobc.[Object_ID] 
INNER JOIN [sparxDB].[dbo].[t_object] tobcp ON tobcp.[Object_ID] = tobc.[ParentID]  
WHERE tobp1.[Property] = 'Item Type' and tobp.Name = 'Relational Table'   
GROUP BY tobp.[Stereotype] , tobc.[Stereotype] , tobp1.[Property]  , tobp.Object_Type , tobc.Object_Type 
, tobc.[Name] , tobp.[Name] , tobcp.[Name] 

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
-- 20 rows 
SELECT 'GROPA2A' as ROPType  
, tobs.Object_Type as Child_OT 
, CASE WHEN tobs.[Stereotype] IN ( 'LogicalEntity' , 'LookupData' , 'BPMEntity' ) THEN 'Glass' ELSE 'Blob' END Child_BG 
, tobs.Stereotype as Child_ST 
, tc.[Stereotype] as Child2Parent 
, tobe.Object_Type as Parent_OT  
, CASE WHEN tobe.[Stereotype] IN ( 'LogicalEntity' , 'LookupData' , 'BPMEntity' ) THEN 'Glass' ELSE 'Blob' END Parent_BG 
, tobe.Stereotype as Parent_ST 
, count(*) CT 
  FROM [sparxDB].[dbo].[t_connector] tc
  INNER JOIN  [sparxDB].[dbo].[t_object] tobs   ON tc.Start_Object_ID = tobs.Object_ID 
  INNER JOIN  [sparxDB].[dbo].[t_object] tobe   ON tc.End_Object_ID = tobe.Object_ID 
  WHERE tobs.Stereotype IS NOT NULL AND tc.Stereotype IS NOT NULL AND tobe.Stereotype IS NOT NULL
  GROUP BY tobs.Object_Type , tobs.Stereotype , tc.[Stereotype] , tobe.Object_Type , tobe.Stereotype  

-- GROPG2G 
-- use case linking Object to a parent classifier as a M:1 
-- Potential for many to many but not used for this. 
-- 4 rows 
SELECT 'GROPG2G' as ROPType  
, tobc.Object_Type as Child_OT
, CASE WHEN tobc.[Stereotype] IN ( 'LogicalEntity' , 'LookupData' , 'BPMEntity' ) THEN 'Glass' ELSE 'Blob' END Child_BG 
, tobc.[Stereotype] as Child_ST
, ta.[Stereotype] as Child2Parent  
, tobp.Object_Type as Parent_OT
, CASE WHEN tobp.[Stereotype] IN ( 'LogicalEntity' , 'LookupData' , 'BPMEntity' ) THEN 'Glass' ELSE 'Blob' END Parent_BG 
, tobp.[Stereotype] as Parent_ST
, COUNT(*) CT 
FROM [sparxDB].[dbo].[t_attribute] ta 
INNER JOIN [sparxDB].[dbo].[t_object] tobc ON ta.[Object_ID] = tobc.[Object_ID]
INNER JOIN [sparxDB].[dbo].[t_object] tobp ON ta.[Classifier] = tobp.[Object_ID]  
GROUP BY tobc.[Stereotype] , tobp.[Stereotype] , tobc.Object_Type , tobp.Object_Type , ta.[Stereotype]