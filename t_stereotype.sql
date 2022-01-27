-- Profiles t_stereotypes - not linked to other Stereotypes 


SELECT ts.[Stereotype] , [AppliesTo] , [Description]      
  FROM [sparxDB].[dbo].[t_stereotypes] ts 
  inner join [sparxDB].[dbo].[t_object] tob 
  On ts.Stereotype = tob.Stereotype 

-- Stereotype  AppliesTo Description
-- datastore Object  datastore
-- datastore Object  datastore 

SELECT [AppliesTo] , count(*) CT 
  FROM [sparxDB].[dbo].[t_stereotypes]
  group by [AppliesTo] 
  