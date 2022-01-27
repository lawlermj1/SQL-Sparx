
-- Shows packages hierarchy 

SELECT  tpi.Package_ID ,  tpgp.[Name] GPNM , tpp.[Name] PPNM , tob.[Stereotype] OBST, tob.[Name] OBNM
, tpp.Package_ID PPID
--, tpp.Parent_ID , tpi.Package_ID, tpi.Parent_ID , tob.Package_ID , tob.[PDATA1] 
FROM [sparxDB].[dbo].[t_object] tob 
--	tob.Package_ID -> parent or join to parent 
INNER JOIN [sparxDB].[dbo].[t_package] tpp ON tob.Package_ID = tpp.Package_ID 
--	tob.[PDATA1] -> instance or join to instance  
INNER JOIN [sparxDB].[dbo].[t_package] tpi ON tob.[PDATA1] = tpi.Package_ID 
-- grandparent 
INNER JOIN [sparxDB].[dbo].[t_package] tpgp ON tpp.Parent_ID = tpgp.Package_ID 
where tob.[Object_Type] = 'Package' and tob.[Stereotype] is not null 

