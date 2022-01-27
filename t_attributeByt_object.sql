-- Profile of t_attribute by t_object


  SELECT  tob.[Object_Type] , tob.[Stereotype] ,
  ta.[Stereotype] as 'AttrST', ta.[Name] as 'AttrName' , ta.[Type] as 'AttrType'   
, count(*) CT 
  FROM [sparxDB].[dbo].[t_attribute] ta
 INNER JOIN [sparxDB].[dbo].[t_object] tob ON ta.[Object_ID] = tob.[Object_ID] 
 GROUP BY ta.[Stereotype] , ta.[Name]  , ta.[Type]   , tob.[Object_Type] , tob.[Stereotype] 
 