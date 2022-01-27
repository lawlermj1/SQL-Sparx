-- Invariants ; Tests to identify invalid Sparx data 

-- All primary keys 
-- Note the lack of a consistent naming convention for primary keys 
-- Also the reuse of [PropertyID] on 2 critical tables. These do not join. 

SELECT [Object_ID] , count(*) CT FROM [sparxDB].[dbo].[t_object] group by [Object_ID]  order by CT desc ; 

SELECT [PropertyID] , count(*) CT FROM [sparxDB].[dbo].[t_objectproperties] group by [PropertyID]  order by CT desc ; 

SELECT [ID] , count(*) CT FROM [sparxDB].[dbo].[t_attribute] group by [ID]  order by CT desc ; 

SELECT [PropertyID] , count(*) CT FROM [sparxDB].[dbo].[t_attributetag] group by [PropertyID]  order by CT desc ; 

SELECT [Package_ID] , count(*) CT FROM [sparxDB].[dbo].[t_package] group by [Package_ID]  order by CT desc ;

SELECT [Object_Type] , count(*) CT FROM [sparxDB].[dbo].[t_objecttypes] group by [Object_Type] order by CT desc ;

SELECT [XrefID] , count(*) CT FROM [sparxDB].[dbo].[t_xref] group by [XrefID] order by CT desc ;

-- Possible errors 
--  0. On [t_attribute] [Stereotype] and [Type] should not be null 
--  1. [Stereotype] should be populated with standard types. - not Att_*, etc 
--  2. Use Stereotype lookup SQL 
--  3. Allow missing types from Aristotle 

--[Stereotype]
--NULL -> error? 
--Att_Code -> error? 
--Att_Text -> error? 
--Attr_Amount
--Attr_Code
--Attr_Count
--Attr_Date
--Attr_Datetime
--Attr_Identifier
--Attr_Indicator
--Attr_Number
--Attr_Percent
--Attr_Text
--Attr_Time
--Attr_URL
--BPMDataConcept -> error? 

-- Invariant for t_objectproperties 
-- 	An object can only have 1 object property tuple ([Object_ID] , [Property]) if the tobp VALUE is not a guid. 
--	if the tobp VALUE is a GUID, then this is a relation, and there can be multiple values.  

-- invariant 
-- the PK should be tob.[Stereotype] , tob.[Name] , ta.[Name] , tat.[Property]  
-- this has 3 duplicates
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
HAVING count(*) >1 

Select * 
FROM [sparxDB].[dbo].[t_objectproperties] tobp1  
INNER JOIN 
(SELECT  [Object_ID] , [Property] 
  FROM [sparxDB].[dbo].[t_objectproperties] tobp 
  WHERE tobp.[Value] NOT LIKE '{%'
  GROUP BY [Object_ID] , [Property] 
  HAVING count(*) > 1 ) tobp2 
  ON tobp1.[Object_ID] = tobp2.[Object_ID] 
  AND tobp1.[Property] = tobp2.[Property] 
  ORDER BY tobp1.[Object_ID] , tobp1.[Property]

-- An t_objectproperties has a unique tuple (tob.[Name] , [Property] ), if in a Subject Area package. 

-- Do Enum checks. Restrict string columns to a subset of valid values. 


