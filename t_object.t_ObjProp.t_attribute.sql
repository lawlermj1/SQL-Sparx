-- Profile of t_objectproperties used for relations 


SELECT  
  tob1.Object_Type as T1_OT
, tob1.[Stereotype] as T1_ST
, tob1.Name as T1_NM 
, tobp1.[Property] as REL1TO2 
, ta.[Name] as T1_AT
, ta.[Stereotype]  as T1_AT_ST
--, ta.[Notes]   as T1_AT_NT
, ta.[Type]   as T1_AT_TY
, COUNT(*) CT 
FROM [sparxDB].[dbo].[t_object] tob1 
INNER JOIN [sparxDB].[dbo].[t_objectproperties] tobp1 ON tob1.[Object_ID]  = tobp1.[Object_ID] 
INNER JOIN [sparxDB].[dbo].[t_attribute] ta ON  tobp1.Value = ta.[ea_guid]  
GROUP BY   tob1.Object_Type , tob1.[Stereotype] , tob1.Name , tobp1.[Property] , ta.[Name] , ta.[Stereotype]  , ta.[Type] 

