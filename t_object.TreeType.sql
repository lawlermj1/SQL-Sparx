-- Profile of the object type tree created through t_objectproperties 


SELECT DISTINCT 

't_object' as T1  
, tob1.Object_Type 
, tob1.[Stereotype]

, 't_objectproperties' TP1 
, tobp1.[Property]
, 't_object' as T2  
, tob2.Object_Type 
, tob2.[Stereotype]

, 't_objectproperties' TP2 
, tobp2.[Property] 
, 't_object' as T3 
, tob3.Object_Type 
, tob3.[Stereotype]

, 't_objectproperties' TP3 
, tobp3.[Property] 
, 't_object' as T4
, tob4.Object_Type 
, tob4.[Stereotype]

, 't_objectproperties' TP4 
, tobp4.[Property] 
, 't_object' as T5
, tob5.Object_Type 
, tob5.[Stereotype]


FROM [sparxDB].[dbo].[t_object] tob1 
INNER JOIN [sparxDB].[dbo].[t_objectproperties] tobp1 ON tob1.[ea_guid] = tobp1.Value 
INNER JOIN [sparxDB].[dbo].[t_object] tob2  ON tobp1.[Object_ID] = tob2.[Object_ID]  
LEFT JOIN [sparxDB].[dbo].[t_objectproperties] tobp2 ON tob2.[ea_guid] = tobp2.Value 
LEFT JOIN [sparxDB].[dbo].[t_object] tob3  ON tobp2.[Object_ID] = tob3.[Object_ID]  
LEFT JOIN [sparxDB].[dbo].[t_objectproperties] tobp3 ON tob3.[ea_guid] = tobp3.Value 
LEFT JOIN [sparxDB].[dbo].[t_object] tob4  ON tobp3.[Object_ID] = tob4.[Object_ID]  
LEFT JOIN [sparxDB].[dbo].[t_objectproperties] tobp4 ON tob4.[ea_guid] = tobp4.Value 
LEFT JOIN [sparxDB].[dbo].[t_object] tob5  ON tobp4.[Object_ID] = tob5.[Object_ID]  

ORDER BY tob5.[Stereotype] , tob4.[Stereotype] , tob3.[Stereotype] , tob2.[Stereotype] , tob1.[Stereotype]
