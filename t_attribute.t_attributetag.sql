-- Profile of t_attribute t_attributetag

  SELECT ta.[Stereotype] as 'AttrST',  ta.[Type] as 'AttrType' , tat.[Property] , tat.[VALUE] 
--, count(*) CT 
-- ta.[Name] as 'AttrName' ,
 FROM [sparxDB].[dbo].[t_attribute] ta
 INNER JOIN [sparxDB].[dbo].[t_attributetag] tat ON ta.[ID] = tat.[ElementID]
 WHERE tat.[Value] NOT LIKE '{%' 
 --GROUP BY ta.[Stereotype] , ta.[Name]  , ta.[Type]   , tob.[Object_Type] , tob.[Stereotype] 
 
 SELECT DISTINCT [Property] ,[VALUE] 
  FROM [sparxDB].[dbo].[t_attributetag]
    WHERE [Value] NOT LIKE '{%' 
    ORDER BY [Property] ,[VALUE] 
    
-- Invariant? 
-- This shows the t_attribute that do not have an t_attributetag 
-- There are not many. 13 rows. 
-- They seem to be all related to the UI work. 
SELECT * FROM  [sparxDB].[dbo].[t_attribute] ta 
WHERE ta.[ID] NOT IN (SELECT  DISTINCT [ElementID] FROM [sparxDB].[dbo].[t_attributetag]) 
