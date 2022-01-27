-- Profile of t_object with LookupData stereotype


SELECT [Stereotype] , tob.[Name] , dbo.RemoveNonAlphaCharacters ([Note] ) as NoteFix 
FROM [sparxDB].[dbo].[t_package] tp 
INNER JOIN [sparxDB].[dbo].[t_object] tob 
ON tp.Package_ID = tob.Package_ID 
Where Object_Type = 'Class' 
ORDER BY tob.[Name] ; 

SELECT tp.[Package_ID] , [Parent_ID] , [Object_ID]
, tp.[Name] , [Object_Type] , [Stereotype] 
, tob.[Name] , tob.[ea_guid] , dbo.RemoveNonAlphaCharacters ([Note] ) as NoteFix 
FROM [sparxDB].[dbo].[t_package] tp 
INNER JOIN [sparxDB].[dbo].[t_object] tob 
ON tp.Package_ID = tob.Package_ID ;

-- Only relationship for LookupData is to the parent configuratio Subject area. 

SELECT 
  tob1.Object_Type as T1_OT
, tob1.[Stereotype] as T1_ST
, tob1.Name as T1_NM 
, tobp1.[Property] as REL1TO2 
, tob2.Object_Type as T2_OT
, tob2.[Stereotype] as T2_ST
, tob2.Name as T2_NM 
, COUNT(*) CT 
FROM [sparxDB].[dbo].[t_object] tob1 
INNER JOIN [sparxDB].[dbo].[t_objectproperties] tobp1 ON tob1.[ea_guid] = tobp1.Value 
INNER JOIN [sparxDB].[dbo].[t_object] tob2  ON tobp1.[Object_ID] = tob2.[Object_ID]  
GROUP BY tob1.Object_Type , tob1.[Stereotype] , tob1.Name , tobp1.[Property] , tob2.Object_Type , tob2.[Stereotype] , tob2.Name 

-- 	Stereotype	Name	NoteFix
-- 	LookupData	ANZSIC Type	ANZSIC codes are fourdigit numbers. The Australian Taxation Office ATO uses fivedigit codes referred to as Business Industry Codes.
