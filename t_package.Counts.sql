-- counts objects in Parent packages 

--	product of package By Object Stereotype 
SELECT tpp.[Name] , tp.[Name] , tob.[Stereotype] , count(*) as Objects  
-- tp.[Package_ID] , tp.[Parent_ID]
, dbo.RemoveNonAlphaCharacters (tp.[Notes] ) as Package_Notes 
FROM [sparxDB].[dbo].[t_object] tob 
INNER JOIN [sparxDB].[dbo].[t_package] tp ON tp.Package_ID = tob.Package_ID 
INNER JOIN [sparxDB].[dbo].[t_package] tpp ON tpp.Package_ID = tp.[Parent_ID] 
Where tob.[Stereotype] is not null 
group by tpp.[Name] , tp.[Name]  , tob.[Stereotype] 
, dbo.RemoveNonAlphaCharacters (tp.[Notes] )
order by tpp.[Name] , tp.[Name], tob.[Stereotype]; 
