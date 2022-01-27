-- Profile of t_object with any stereotype

-- not used yet, as these are new areas 
SELECT [Object_ID] ,[Object_Type] ,TOB.[Name] ,[Author] ,TOB.[Package_ID] ,[Stereotype]  
, TP.[Name] , TP.Parent_ID
  FROM [sparxDB].[dbo].[t_object] TOB
  INNER JOIN [sparxDB].[dbo].[t_package] TP 
  ON TOB.[Package_ID] = TP.[Package_ID]
--    Where TOB. [Stereotype] = 'DomainGroup' 

--Object_ID	Object_Type	Name	Author	Package_ID	Stereotype	Name	Parent_ID
--18016	Class	NESM	Canonical Solutions	158	DomainGroup	Domain Groups	80
--18017	Class	STP	Canonical Solutions	158	DomainGroup	Domain Groups	80
