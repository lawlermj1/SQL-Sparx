-- Profile of t_object and t_attribute with All ta stereotype 


SELECT  ta.[Object_ID] , [ID] 
, tob.[Stereotype] , tob.[Name]  ,ta.[Stereotype] , ta.[Name] 
, [Pos] , [Type] 
, dbo.RemoveNonAlphaCharacters ([Note] ) as ObjectNoteFix 
, dbo.RemoveNonAlphaCharacters (ta.[Notes]) as AttribuetNoteFix 
FROM [sparxDB].[dbo].[t_object] tob 
INNER JOIN [sparxDB].[dbo].[t_package] tp ON tp.Package_ID = tob.Package_ID 
INNER JOIN [sparxDB].[dbo].[t_attribute] ta ON tob.[Object_ID] = ta.[Object_ID]
Where Object_Type = 'Class' 

