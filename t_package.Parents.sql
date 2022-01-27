-- Shows package parents and grandparents 


SELECT  tpgp.[Name] Package_GrandParent 
,  tpp.[Name] Package_Parent , tpi.[Name] Package_Name 
, tob.[Stereotype] Object_Stereotype, tob.[Name] 'Object_Name' 
, tpp.Package_ID, tpp.Parent_ID , tpi.Package_ID, tpi.Parent_ID , tob.Package_ID , tob.[PDATA1]  
, dbo.RemoveNonAlphaCharacters (tob.[Note]) Object_Note  
--, tpi.Notes Package_Note ,
FROM [sparxDB].[dbo].[t_object] tob 
--  tob.Package_ID -> parent or join to parent 
INNER JOIN  [sparxDB].[dbo].[t_package] tpp ON tob.Package_ID = tpp.Package_ID 
--  tob.[PDATA1] -> instance or join to instance  
INNER JOIN  [sparxDB].[dbo].[t_package] tpi 
-- Note the either tob.[PDATA1] or tob.[ea_guid] join works! 
ON tob.[PDATA1] = tpi.Package_ID 
--ON tob.[ea_guid] = tpi.[ea_guid] 
-- grandparent 
INNER JOIN [sparxDB].[dbo].[t_package] tpgp ON tpp.Parent_ID = tpgp.Package_ID 
where tob.[Object_Type] = 'Package'
ORDER BY tob.Package_ID , cast (tob.[PDATA1] as INT) , tob.[Name] 
