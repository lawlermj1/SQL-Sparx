-- All occurences of ea_guid across all tables. This is a shadow PK used for object reification. 

-- 130,658 rows 
SELECT '[t_object]' as TN, [ea_guid] , [Object_ID] , 0 as PID FROM [sparxDB].[dbo].[t_object]
UNION 
SELECT '[t_package]' TN, tp.[ea_guid] , tob.[Object_ID] , 0 FROM [sparxDB].[dbo].[t_package] tp
   INNER JOIN [sparxDB].[dbo].[t_object] tob ON tp.[ea_guid] = tob.[ea_guid] 
UNION 
SELECT '[t_objectproperties]' , [ea_guid] , [Object_ID] , [PropertyID] FROM [sparxDB].[dbo].[t_objectproperties]
UNION 
SELECT '[t_objectproperties].Value' , [Value] , [Object_ID] , [PropertyID] FROM [sparxDB].[dbo].[t_objectproperties] 
   WHERE [Value] LIKE '{[0-9a-fA-F][0-9a-fA-F]%'  
UNION
SELECT '[t_attribute]' , [ea_guid] , [Object_ID] , [ID] FROM [sparxDB].[dbo].[t_attribute] 
UNION 
SELECT '[t_attributetag]' , [ea_guid] , [ElementID], [PropertyID]  FROM [sparxDB].[dbo].[t_attributetag]
UNION 
SELECT '[t_attributetag].Value' , [Value] , [ElementID], [PropertyID]  FROM [sparxDB].[dbo].[t_attributetag] 
   WHERE [Value] LIKE '{[0-9a-fA-F][0-9a-fA-F]%'  
UNION 
SELECT '[t_xref]' TN, [XrefID] , 0 , 0 FROM [sparxDB].[dbo].[t_xref] 
UNION
SELECT '[t_xref]' TN, [Client] , 0 , 0 FROM [sparxDB].[dbo].[t_xref] 
UNION
SELECT '[t_connector]' TN, [ea_guid] , [Start_Object_ID] , [End_Object_ID] FROM [sparxDB].[dbo].[t_connector] 

-- This may be enough to create performance issues?  

-- matching GUID 
-- This matches first 3 chars of GUID. 
-- All 8,991 rows 
SELECT 't_object' as TN, [ea_guid] , [Object_ID] , 0 as PID FROM [sparxDB].[dbo].[t_object]
WHERE [ea_guid] LIKE '{[0-9a-fA-F][0-9a-fA-F]%'  
-- additional matches 
--WHERE [ea_guid] LIKE '{%'  
--WHERE [ea_guid] LIKE '{[0-9a-fA-F]%' 
--WHERE [ea_guid] LIKE (CONCAT ( '{' , '%' )) 
--WHERE [ea_guid] LIKE '{' + '%'  
-- this does not work - not sure why. 
-- WHERE [ea_guid] LIKE (CONCAT ( '{' , REPLICATE('[0-9a-fA-F][0-9a-fA-F]' , 7) , '%' ))  
-- SQL Server does not support regex. 
-- The regex for a UUID is 
-- /^\{?[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}\}?$/
-- Using LIKE on the first 3 chars produces a reasonable match. 

-- reused guids 
-- 13,771 rows 
Select [ea_guid] , COUNT(*) CT 
FROM 
(
SELECT '[t_object]' as TN, [ea_guid] , [Object_ID] , 0 as PID FROM [sparxDB].[dbo].[t_object]
UNION 
SELECT '[t_package]' TN, tp.[ea_guid] , tob.[Object_ID] , 0 FROM [sparxDB].[dbo].[t_package] tp
   INNER JOIN [sparxDB].[dbo].[t_object] tob ON tp.[ea_guid] = tob.[ea_guid] 
UNION 
SELECT '[t_objectproperties]' , [ea_guid] , [Object_ID] , [PropertyID] FROM [sparxDB].[dbo].[t_objectproperties]
UNION 
SELECT '[t_objectproperties].Value' , [Value] , [Object_ID] , [PropertyID] FROM [sparxDB].[dbo].[t_objectproperties] 
   WHERE [Value] LIKE '{[0-9a-fA-F][0-9a-fA-F]%'  
UNION
SELECT '[t_attribute]' , [ea_guid] , [Object_ID] , [ID] FROM [sparxDB].[dbo].[t_attribute] 
UNION 
SELECT '[t_attributetag]' , [ea_guid] , [ElementID], [PropertyID]  FROM [sparxDB].[dbo].[t_attributetag]
UNION 
SELECT '[t_attributetag].Value' , [Value] , [ElementID], [PropertyID]  FROM [sparxDB].[dbo].[t_attributetag] 
   WHERE [Value] LIKE '{[0-9a-fA-F][0-9a-fA-F]%'  
UNION 
SELECT '[t_xref]' TN, [XrefID] , 0 , 0 FROM [sparxDB].[dbo].[t_xref] 
UNION
SELECT '[t_xref]' TN, [Client] , 0 , 0 FROM [sparxDB].[dbo].[t_xref] 
UNION
SELECT '[t_connector]' TN, [ea_guid] , [Start_Object_ID] , [End_Object_ID] FROM [sparxDB].[dbo].[t_connector] 

) as EA 
GROUP BY [ea_guid] 
HAVING COUNT(*) > 1 
ORDER  BY CT DESC 


-- This was used to profile where PK ea_guids were used on the FK ea_guid tables. 
-- 29,757 rows 
--WHERE EAPKTable.OIPK <> EAFKTable.OIFK -> 15,957 rows 

SELECT * 
FROM 
( 
SELECT '[t_object]' as TNPK, [ea_guid] EAPK, [Object_ID] OIPK, 0 as PID FROM [sparxDB].[dbo].[t_object]
UNION 
SELECT '[t_package]' TN, tp.[ea_guid] , tob.[Object_ID] , 0 FROM [sparxDB].[dbo].[t_package] tp
   INNER JOIN [sparxDB].[dbo].[t_object] tob ON tp.[ea_guid] = tob.[ea_guid] 
UNION 
SELECT '[t_objectproperties]' , [ea_guid] , [Object_ID] , [PropertyID] FROM [sparxDB].[dbo].[t_objectproperties]
UNION
SELECT '[t_attribute]' , [ea_guid] , [Object_ID] , [ID] FROM [sparxDB].[dbo].[t_attribute] 
UNION 
SELECT '[t_attributetag]' , [ea_guid] , [ElementID], [PropertyID]  FROM [sparxDB].[dbo].[t_attributetag]
UNION 
SELECT '[t_xref]' TN, [XrefID] , 0 , 0 FROM [sparxDB].[dbo].[t_xref] 
UNION
SELECT '[t_connector]' TN, [ea_guid] , [Start_Object_ID] , [End_Object_ID] FROM [sparxDB].[dbo].[t_connector] 
) as EAPKTable  
INNER JOIN 
(
SELECT '[t_objectproperties].Value' TNFK, [Value] EAFK , [Object_ID] OIFK FROM [sparxDB].[dbo].[t_objectproperties] 
   WHERE [Value] LIKE '{[0-9a-fA-F][0-9a-fA-F]%'  
UNION 
SELECT '[t_attributetag].Value' , [Value] , [ElementID]   FROM [sparxDB].[dbo].[t_attributetag] 
   WHERE [Value] LIKE '{[0-9a-fA-F][0-9a-fA-F]%'  
UNION
SELECT '[t_xref].[t_object]' TN, [Client] , tob.[Object_ID] FROM [sparxDB].[dbo].[t_xref] tx 
   INNER JOIN [sparxDB].[dbo].[t_object] tob ON tx.[Client] = tob.[ea_guid] 
UNION
SELECT '[t_xref].[t_attribute]' TN, [Client] , ta.[Object_ID] FROM [sparxDB].[dbo].[t_xref] tx 
   INNER JOIN [sparxDB].[dbo].[t_attribute] ta ON tx.[Client] = ta.[ea_guid]   
UNION
SELECT '[t_xref].[t_connector]' TN, [Client] , tc.[Start_Object_ID] FROM [sparxDB].[dbo].[t_xref] tx 
   INNER JOIN [sparxDB].[dbo].[t_connector] tc ON tx.[Client] = tc.[ea_guid]     
) as EAFKTable 
ON EAPKTable.EAPK = EAFKTable.EAFK 
--WHERE EAPKTable.OIPK <> EAFKTable.OIFK 

-- By table to table to show that all patterns have been found, for equal ea_guid and any objects 
SELECT EAPKTable.TNPK , EAFKTable.TNFK , COUNT(*) CT 
FROM 
( 
SELECT '[t_object]' as TNPK, [ea_guid] EAPK, [Object_ID] OIPK, 0 as PID FROM [sparxDB].[dbo].[t_object]
UNION 
SELECT '[t_package]' TN, tp.[ea_guid] , tob.[Object_ID] , 0 FROM [sparxDB].[dbo].[t_package] tp
   INNER JOIN [sparxDB].[dbo].[t_object] tob ON tp.[ea_guid] = tob.[ea_guid] 
UNION 
SELECT '[t_objectproperties]' , [ea_guid] , [Object_ID] , [PropertyID] FROM [sparxDB].[dbo].[t_objectproperties]
UNION
SELECT '[t_attribute]' , [ea_guid] , [Object_ID] , [ID] FROM [sparxDB].[dbo].[t_attribute] 
UNION 
SELECT '[t_attributetag]' , [ea_guid] , [ElementID], [PropertyID]  FROM [sparxDB].[dbo].[t_attributetag]
UNION 
SELECT '[t_xref]' TN, [XrefID] , 0 , 0 FROM [sparxDB].[dbo].[t_xref] 
UNION
SELECT '[t_connector]' TN, [ea_guid] , [Start_Object_ID] , [End_Object_ID] FROM [sparxDB].[dbo].[t_connector] 
) as EAPKTable  
INNER JOIN 
(
SELECT '[t_objectproperties].Value' TNFK, [Value] EAFK , [Object_ID] OIFK FROM [sparxDB].[dbo].[t_objectproperties] 
   WHERE [Value] LIKE '{[0-9a-fA-F][0-9a-fA-F]%'  
UNION 
SELECT '[t_attributetag].Value' , [Value] , [ElementID]   FROM [sparxDB].[dbo].[t_attributetag] 
   WHERE [Value] LIKE '{[0-9a-fA-F][0-9a-fA-F]%'  
UNION
SELECT '[t_xref].[t_object]' TN, [Client] , tob.[Object_ID] FROM [sparxDB].[dbo].[t_xref] tx 
   INNER JOIN [sparxDB].[dbo].[t_object] tob ON tx.[Client] = tob.[ea_guid] 
UNION
SELECT '[t_xref].[t_attribute]' TN, [Client] , ta.[Object_ID] FROM [sparxDB].[dbo].[t_xref] tx 
   INNER JOIN [sparxDB].[dbo].[t_attribute] ta ON tx.[Client] = ta.[ea_guid]   
UNION
SELECT '[t_xref].[t_connector]' TN, [Client] , tc.[Start_Object_ID] FROM [sparxDB].[dbo].[t_xref] tx 
   INNER JOIN [sparxDB].[dbo].[t_connector] tc ON tx.[Client] = tc.[ea_guid]     
) as EAFKTable 
ON EAPKTable.EAPK = EAFKTable.EAFK 
GROUP BY EAPKTable.TNPK , EAFKTable.TNFK 
ORDER BY EAPKTable.TNPK , EAFKTable.TNFK 

--TNPK  TNFK  CT
--[t_object]  [t_objectproperties].Value 8543
--[t_object]  [t_attributetag].Value  2114
--[t_object]  [t_xref].[t_object]  8899

--[t_attribute]  [t_objectproperties].Value 3069
--[t_attribute]  [t_attributetag].Value  1725
--[t_attribute]  [t_xref].[t_attribute]  3839

--[t_connector]  [t_xref].[t_connector]  1002

--[t_package] [t_xref].[t_object]  60
--[t_package] [t_objectproperties].Value 506


-- By table to table to show that all patterns have been found, for equal ea_guid and unequal objects 
-- This is the case when connecting different objects. 

--TNPK  TNFK  CT
--[t_attribute]  [t_attributetag].Value  1725
--[t_attribute]  [t_objectproperties].Value 3069
--[t_object]  [t_attributetag].Value  2114
--[t_object]  [t_objectproperties].Value 8543
--[t_package] [t_objectproperties].Value 506

SELECT EAPKTable.TNPK , EAFKTable.TNFK , COUNT(*) CT 
FROM 
( 
SELECT '[t_object]' as TNPK, [ea_guid] EAPK, [Object_ID] OIPK, 0 as PID FROM [sparxDB].[dbo].[t_object]
UNION 
SELECT '[t_package]' TN, tp.[ea_guid] , tob.[Object_ID] , 0 FROM [sparxDB].[dbo].[t_package] tp
   INNER JOIN [sparxDB].[dbo].[t_object] tob ON tp.[ea_guid] = tob.[ea_guid] 
UNION 
SELECT '[t_objectproperties]' , [ea_guid] , [Object_ID] , [PropertyID] FROM [sparxDB].[dbo].[t_objectproperties]
UNION
SELECT '[t_attribute]' , [ea_guid] , [Object_ID] , [ID] FROM [sparxDB].[dbo].[t_attribute] 
UNION 
SELECT '[t_attributetag]' , [ea_guid] , [ElementID], [PropertyID]  FROM [sparxDB].[dbo].[t_attributetag]
UNION 
SELECT '[t_xref]' TN, [XrefID] , 0 , 0 FROM [sparxDB].[dbo].[t_xref] 
UNION
SELECT '[t_connector]' TN, [ea_guid] , [Start_Object_ID] , [End_Object_ID] FROM [sparxDB].[dbo].[t_connector] 
) as EAPKTable  
INNER JOIN 
(
SELECT '[t_objectproperties].Value' TNFK, [Value] EAFK , [Object_ID] OIFK FROM [sparxDB].[dbo].[t_objectproperties] 
   WHERE [Value] LIKE '{[0-9a-fA-F][0-9a-fA-F]%'  
UNION 
SELECT '[t_attributetag].Value' , [Value] , [ElementID]   FROM [sparxDB].[dbo].[t_attributetag] 
   WHERE [Value] LIKE '{[0-9a-fA-F][0-9a-fA-F]%'  
UNION
SELECT '[t_xref].[t_object]' TN, [Client] , tob.[Object_ID] FROM [sparxDB].[dbo].[t_xref] tx 
   INNER JOIN [sparxDB].[dbo].[t_object] tob ON tx.[Client] = tob.[ea_guid] 
UNION
SELECT '[t_xref].[t_attribute]' TN, [Client] , ta.[Object_ID] FROM [sparxDB].[dbo].[t_xref] tx 
   INNER JOIN [sparxDB].[dbo].[t_attribute] ta ON tx.[Client] = ta.[ea_guid]   
UNION
SELECT '[t_xref].[t_connector]' TN, [Client] , tc.[Start_Object_ID] FROM [sparxDB].[dbo].[t_xref] tx 
   INNER JOIN [sparxDB].[dbo].[t_connector] tc ON tx.[Client] = tc.[ea_guid]     
) as EAFKTable 
ON EAPKTable.EAPK = EAFKTable.EAFK 
WHERE EAPKTable.OIPK <> EAFKTable.OIFK 
GROUP BY EAPKTable.TNPK , EAFKTable.TNFK 
ORDER BY EAPKTable.TNPK , EAFKTable.TNFK 

-- By table to table to show that all patterns have been found, for equal ea_guid and equal objects 
-- This is the case when enhancing or elaborating the same object. 
-- Always t_xref 

--TNPK  TNFK  CT
--[t_attribute]  [t_xref].[t_attribute]  3839
--[t_connector]  [t_xref].[t_connector]  1002
--[t_object]  [t_xref].[t_object]  8899
--[t_package] [t_xref].[t_object]  60

SELECT EAPKTable.TNPK , EAFKTable.TNFK , COUNT(*) CT 
FROM 
( 
SELECT '[t_object]' as TNPK, [ea_guid] EAPK, [Object_ID] OIPK, 0 as PID FROM [sparxDB].[dbo].[t_object]
UNION 
SELECT '[t_package]' TN, tp.[ea_guid] , tob.[Object_ID] , 0 FROM [sparxDB].[dbo].[t_package] tp
   INNER JOIN [sparxDB].[dbo].[t_object] tob ON tp.[ea_guid] = tob.[ea_guid] 
UNION 
SELECT '[t_objectproperties]' , [ea_guid] , [Object_ID] , [PropertyID] FROM [sparxDB].[dbo].[t_objectproperties]
UNION
SELECT '[t_attribute]' , [ea_guid] , [Object_ID] , [ID] FROM [sparxDB].[dbo].[t_attribute] 
UNION 
SELECT '[t_attributetag]' , [ea_guid] , [ElementID], [PropertyID]  FROM [sparxDB].[dbo].[t_attributetag]
UNION 
SELECT '[t_xref]' TN, [XrefID] , 0 , 0 FROM [sparxDB].[dbo].[t_xref] 
UNION
SELECT '[t_connector]' TN, [ea_guid] , [Start_Object_ID] , [End_Object_ID] FROM [sparxDB].[dbo].[t_connector] 
) as EAPKTable  
INNER JOIN 
(
SELECT '[t_objectproperties].Value' TNFK, [Value] EAFK , [Object_ID] OIFK FROM [sparxDB].[dbo].[t_objectproperties] 
   WHERE [Value] LIKE '{[0-9a-fA-F][0-9a-fA-F]%'  
UNION 
SELECT '[t_attributetag].Value' , [Value] , [ElementID]   FROM [sparxDB].[dbo].[t_attributetag] 
   WHERE [Value] LIKE '{[0-9a-fA-F][0-9a-fA-F]%'  
UNION
SELECT '[t_xref].[t_object]' TN, [Client] , tob.[Object_ID] FROM [sparxDB].[dbo].[t_xref] tx 
   INNER JOIN [sparxDB].[dbo].[t_object] tob ON tx.[Client] = tob.[ea_guid] 
UNION
SELECT '[t_xref].[t_attribute]' TN, [Client] , ta.[Object_ID] FROM [sparxDB].[dbo].[t_xref] tx 
   INNER JOIN [sparxDB].[dbo].[t_attribute] ta ON tx.[Client] = ta.[ea_guid]   
UNION
SELECT '[t_xref].[t_connector]' TN, [Client] , tc.[Start_Object_ID] FROM [sparxDB].[dbo].[t_xref] tx 
   INNER JOIN [sparxDB].[dbo].[t_connector] tc ON tx.[Client] = tc.[ea_guid]     
) as EAFKTable 
ON EAPKTable.EAPK = EAFKTable.EAFK 
WHERE EAPKTable.OIPK = EAFKTable.OIFK 
GROUP BY EAPKTable.TNPK , EAFKTable.TNFK 
ORDER BY EAPKTable.TNPK , EAFKTable.TNFK 

