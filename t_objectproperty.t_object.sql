-- Profile of t_objectproperties joined to t_object 


-- 355 rows 
SELECT  tob.[Object_Type] , tp.[Name] as 'Package', tob.[Stereotype] , topr.[Property]
, count(*) CT 
  FROM [sparxDB].[dbo].[t_objectproperties] topr
  INNER JOIN [sparxDB].[dbo].[t_object] tob ON topr.[Object_ID] = tob.[Object_ID] 
  INNER JOIN [sparxDB].[dbo].[t_package] tp ON tob.[Package_ID] = tp.[Package_ID]  
  GROUP BY tob.[Object_Type] , tp.[Name] , tob.[Stereotype] , topr.[Property] 

-- 2,539 rows 
SELECT topr.[Property] , topr.[Value] , tob.[Object_Type] ,  tob.[Stereotype] , tob.[Package_ID] 
, count(*) CT 
  FROM [sparxDB].[dbo].[t_objectproperties] topr
  INNER JOIN [sparxDB].[dbo].[t_object] tob ON topr.[Object_ID] = tob.[Object_ID] 
  GROUP BY topr.[Property] , topr.[Value] , tob.[Object_Type] ,  tob.[Stereotype] , tob.[Package_ID] 

-- 1,677 rows 
SELECT tob.[Stereotype] , topr.[Property] , topr.[Value] 
, count(*) CT 
  FROM [sparxDB].[dbo].[t_objectproperties] topr
  INNER JOIN [sparxDB].[dbo].[t_object] tob ON topr.[Object_ID] = tob.[Object_ID] 
  GROUP BY tob.[Stereotype] , topr.[Property] , topr.[Value] 

