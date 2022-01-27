-- Profile packages for Subject Areas 

SELECT 
  PS.GPNM , PS.PPNM , PS.OBST, PS.OBNM , PS.PPID , tob.[Stereotype] , tob.[Name]  
, tob.[Object_ID] , tob.ParentID 
--,tob.[Object_Type] 
  FROM [sparxDB].[dbo].[t_object] tob 
LEFT JOIN ( 
-- used as lookup table to package hierarchy 
SELECT  tpi.Package_ID ,  tpgp.[Name] GPNM , tpp.[Name] PPNM , tob.[Stereotype] OBST, tob.[Name] OBNM
, tpp.Package_ID PPID
--, tpp.Parent_ID , tpi.Package_ID, tpi.Parent_ID , tob.Package_ID , tob.[PDATA1] 
FROM [sparxDB].[dbo].[t_object] tob 
--    tob.Package_ID -> parent or join to parent 
INNER JOIN [sparxDB].[dbo].[t_package] tpp ON tob.Package_ID = tpp.Package_ID 
--    tob.[PDATA1] -> instance or join to instance  
INNER JOIN [sparxDB].[dbo].[t_package] tpi ON tob.[PDATA1] = tpi.Package_ID 
-- grandparent 
INNER JOIN [sparxDB].[dbo].[t_package] tpgp ON tpp.Parent_ID = tpgp.Package_ID 
where tob.[Object_Type] = 'Package' and tob.[Stereotype] is not null 
) PS ON tob.[Package_ID] = PS.[Package_ID]
  WHERE tob.[Object_Type] = 'Class' 
  --and tob.ParentID = 0 

