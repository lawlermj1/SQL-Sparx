-- Profile of t_object with ImplementationItem stereotype 

SELECT tob.[Stereotype] , [Package_ID] , tob.[Name] , [ParentID] , [Property]  
 , ta.[Name] ,ta.[Stereotype] , ta.[Pos] , ta.[Length] , ta.[Classifier] , ta.[Type] , ta.[Notes] 
 -- tob.[Object_ID] ,[Object_Type] ,topr.[Object_ID] ,[Value]    [Object_ID] , ,[ID] ,ta.[ea_guid] ,topr.[ea_guid]
  FROM [sparxDB].[dbo].[t_object] tob 
  INNER JOIN  [sparxDB].[dbo].[t_objectproperties] topr 
  ON tob.[Object_ID] = topr.[Object_ID] 
  INNER JOIN  [sparxDB].[dbo].[t_attribute] ta 
  ON topr.[Value] = ta.[ea_guid] 
 
 
SELECT [Object_ID] ,[Object_Type] ,[Name] ,[Package_ID] ,[Stereotype] ,[ea_guid] ,[ParentID] 
FROM  [sparxDB].[dbo].[t_object] tob 

-- Object_ID    Object_Type Name    Package_ID  Stereotype  ea_guid ParentID
--10464 Class   M204 Field  127 Implementation Item Type    {A2452DEC-EE54-4d45-A80E-BEE1129D837F}  10463


SELECT distinct 
      topr.[Property] ,topr.[Value]
      , tob.Object_ID , tob.Name , tob.[Stereotype] , tob.ParentID 
  FROM [sparxDB].[dbo].[t_objectproperties] topr 
    INNER JOIN  [sparxDB].[dbo].[t_object] tob 
 --ON tob.[Object_ID] = topr.[Object_ID] 
 ON topr.[Value] = tob.ea_guid

--Property  Value   Object_ID   Name    Stereotype  ParentID
--Level 1   {A2452DEC-EE54-4d45-A80E-BEE1129D837F}  10464   M204 Field  Implementation Item Type    10463


SELECT tob.[Object_ID] ,[Object_Type] ,tob.[Name] ,[Author] ,[Package_ID] ,tob.[Stereotype] 
      ,tob.[ea_guid] ,[ParentID] 
--    ,topr.[PropertyID] ,topr.[Object_ID] ,topr.[Property] ,topr.[Value] ,topr.[ea_guid]
--    [Object_ID] ,ta.[Name] ,ta.[Stereotype] ,[Containment] ,ta.[Notes] ,[ID] ,[Pos] ,[Length]       ,ta.[Classifier] ,[Type] ,ta.[ea_guid] 
  FROM [sparxDB].[dbo].[t_object] tob 
