-- Profile of all t_objectProperty 

SELECT   
 tob.[Stereotype] , tob.[Name] 
, tobp.[Object_ID] , [PropertyID] 
, [Property] , [Value] 
, dbo.RemoveNonAlphaCharacters ([Note] ) as ObjectNoteFix 
, dbo.RemoveNonAlphaCharacters (tobp.[Notes]) as PropertyNoteFix 
FROM [sparxDB].[dbo].[t_object] tob 
INNER JOIN [sparxDB].[dbo].[t_package] tp ON tp.Package_ID = tob.Package_ID 
INNER JOIN [sparxDB].[dbo].[t_objectproperties] tobp ON tob.[Object_ID] = tobp.[Object_ID]
Where Object_Type = 'Class' 
ORDER BY tob.[Name] , [Property] 
