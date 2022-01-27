-- Profile of t_objectproperties for tests

--- Invariants 
-- example of too many colours as a Property 
SELECT 
  tob.[Object_Type] as 'Table_OT'
, tob.[Stereotype] as 'Table'  
, tob.[Name] as 'Name' 
, tobp.[Property] as 'Attr_Name' 
, COUNT(*) CT 

FROM [sparxDB].[dbo].[t_object] tob 
INNER JOIN [sparxDB].[dbo].[t_objectproperties] tobp ON tobp.[Object_ID] = tob.[Object_ID] 
-- filter out all guids 
WHERE tobp.[Value] NOT LIKE '{%'
GROUP BY tob.[Object_Type] , tob.[Stereotype] , tobp.[Property] , tob.[Name]


-- full key is tob.[Stereotype]  , tob.[Name] , tobp.[Property] 
-- This normalisation only exists some packages. 
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
GROUP BY  tob.[Stereotype] , tob.[Name] , tobp.[Property] 
ORDER BY tob.[Stereotype] , tob.[Name] , tobp.[Property] 
--CT DESC 

-- example of too many colours as a Property 
-- This is denormalised. 
--	Is this due to the relation types used? 
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
GROUP BY  tob.[Stereotype] , tob.[Name] , tobp.[Property] 
ORDER BY CT DESC 
--tob.[Stereotype] , tob.[Name] , tobp.[Property] 

-- Normalised, if package name is included. 
-- full key is tp.[Name] tob.[Stereotype]  , tob.[Name] , tobp.[Property] 
SELECT 
--  tob.[Object_Type] as 'Table_OT', --, tob.[Package_ID] as 'Package' 
  tp.[Name] as 'PackageName' 
, tob.[Stereotype] as 'Table'  
, tob.[Name] as 'Name' 
, tobp.[Property] as 'Attr_Name' 
--, tobp.[Value] as 'Attr_Value' 
, COUNT(*) CT 
FROM [sparxDB].[dbo].[t_object] tob 
INNER JOIN [sparxDB].[dbo].[t_objectproperties] tobp ON tobp.[Object_ID] = tob.[Object_ID] 
INNER JOIN [sparxDB].[dbo].[t_package] tp ON tob.[Package_ID] = tp.[Package_ID]  
-- filter out all guids 
WHERE tobp.[Value] NOT LIKE '{%' 
GROUP BY  tp.[Name] , tob.[Stereotype] , tob.[Name] , tobp.[Property] 
ORDER BY CT DESC 
--tob.[Stereotype] , tob.[Name] , tobp.[Property] 

SELECT 
--  tob.[Object_Type] as 'Table_OT', --, tob.[Package_ID] as 'Package' 
  tp.[Name] as 'PackageName' 
, tob.[Stereotype] as 'Table'  
, tob.[Name] as 'Name' 
, tobp.[Property] as 'Attr_Name' 
--, tobp.[Value] as 'Attr_Value' 
, COUNT(*) CT 
FROM [sparxDB].[dbo].[t_object] tob 
INNER JOIN [sparxDB].[dbo].[t_objectproperties] tobp ON tobp.[Object_ID] = tob.[Object_ID] 
INNER JOIN [sparxDB].[dbo].[t_package] tp ON tob.[Package_ID] = tp.[Package_ID]  
-- filter out all guids 
WHERE tobp.[Value] NOT LIKE '{%' 
GROUP BY  tp.[Name] , tob.[Stereotype] , tob.[Name] , tobp.[Property] 
ORDER BY CT DESC 
--tob.[Stereotype] , tob.[Name] , tobp.[Property] 

