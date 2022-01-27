-- group object by package and stereotype 


SELECT [Object_Type] , [Package_ID] , [Stereotype] , count(*) CT
  FROM [sparxDB].[dbo].[t_object] 
  where [Object_Type] <> 'Text'
  GROUP BY [Object_Type] , [Package_ID] , [Stereotype]
  ORDER BY [Object_Type] , [Package_ID] , [Stereotype]
