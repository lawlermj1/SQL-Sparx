-- Profile of t_object and their parents

SELECT  
tob.[Object_ID] 
      ,[Object_Type]
      ,tob.[Name]
      ,[Author]
      ,[Package_ID]
      ,tob.[Stereotype]
      ,[CreatedDate]
      ,[ModifiedDate]
      ,[Status]
,[PDATA1]
      ,[PDATA2]
      ,[PDATA3]
      ,[PDATA4]
      ,[PDATA5]
    ,tob.[ea_guid]
      ,[ParentID]
      ,[TPos]
  FROM [sparxDB].[dbo].[t_object] tob 
  WHERE tob.[Object_ID] in 
(SELECT distinct [ParentID] FROM [sparxDB].[dbo].[t_object] tob ) ; 

SELECT  DISTINCT tob.[Name] FROM [sparxDB].[dbo].[t_object] tob WHERE tob.[ParentID] = 0 ; 