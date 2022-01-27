-- Profile t_xref - not used for relations or columns 

-- none of these are useful for Table MD. 
-- Not used to define relations, or columns or types. 
-- all are needed for EA to work somehow. 

-- (Name, Type)  tuples 
SELECT [Name] , [Type] , COUNT(*) CT 
  FROM [sparxDB].[dbo].[t_xref] 
  GROUP BY [Name] , [Type] 
  ORDER BY [Name] , [Type] 
-- > 
-- Name  Type  CT
-- CustomProperties  attribute property  2318
-- CustomProperties  element property  48
-- Stereotypes attribute property  3839
-- Stereotypes connector property  1002
-- Stereotypes element property  8898

-- So, this table has CustomProperties for attribute and element (object) 
-- This table also has additional information for Stereotypes for attribute, element (object) and connector 

-- These columns are unused 
-- The columns that are used for relations are the Link and Supplier columns.  
-- These are not used in Meta. 
SELECT DISTINCT [Visibility] ,[Namespace] ,[Requirement] ,[Constraint] ,[Behavior] ,[Partition] ,[Supplier] ,[Link]
  FROM [sparxDB].[dbo].[t_xref] 
-- > 
-- Visibility  Namespace Requirement Constraint  Behavior  Partition Supplier  Link
-- Public  NULL  NULL  NULL  NULL  0 NULL  NULL
-- Public  NULL  NULL  NULL  NULL  0 <none>  NULL

-- Meta only uses the [Description] to add individual properties to the object, attribute and connector only. 
-- All examples follow the pattern 
-- @<tag>;<list>@End<tag> 
--   where <tag> is PROP or STEREO 
-- <list> is semi colon separated list. 
-- e.g. @PROP=@NAME=isID@ENDNAME;@TYPE=Boolean@ENDTYPE;@VALU=0@ENDVALU;@PRMT=@ENDPRMT;@ENDPROP;
-- 59 rows 
SELECT [Name] , [Type] , [Description] 
, COUNT(*) CT 
  FROM [sparxDB].[dbo].[t_xref] 
  GROUP BY [Name] , [Type] , [Description] 
  ORDER BY [Name] , [Type] , [Description] 
-- 
-- all of the extra 
SELECT tx.[Name] , tx.[Type] , [Object_Type] , [Stereotype] , [Package_ID] , tx.[Description] , COUNT(*) CT 
  FROM [sparxDB].[dbo].[t_xref] tx
  INNER JOIN [sparxDB].[dbo].[t_object] tob   ON tx.[Client] = tob.[ea_guid] 
 GROUP BY tx.[Name] , tx.[Type] , tx.[Description] , [Object_Type] , [Stereotype] , [Package_ID] 
 ORDER BY tx.[Name] , tx.[Type] , [Object_Type] , [Stereotype] , [Package_ID] , tx.[Description] 

-- Stereotypes across all 3 
-- 72 rows 
SELECT '[t_object]' Tab , tx.[Name] , tx.[Type] , [Stereotype] , tx.[Description] , COUNT(*) CT 
-- , [Object_Type] , [Package_ID]
  FROM [sparxDB].[dbo].[t_xref] tx
  INNER JOIN [sparxDB].[dbo].[t_object] tob   ON tx.[Client] = tob.[ea_guid] 
 GROUP BY tx.[Name] , tx.[Type] , [Stereotype] , tx.[Description]

UNION 
SELECT '[t_attribute]' Tab , tx.[Name] , tx.[Type] , [Stereotype] , tx.[Description] , COUNT(*) CT 
 -- ta.[Type] ,
  FROM [sparxDB].[dbo].[t_xref] tx
  INNER JOIN [sparxDB].[dbo].[t_attribute] ta ON tx.[Client] = ta.[ea_guid] 
 GROUP BY tx.[Name] , tx.[Type] , [Stereotype] , tx.[Description] 

UNION 
SELECT '[t_connector]' Tab , tx.[Name] , tx.[Type] , [Stereotype] , tx.[Description] , COUNT(*) CT 
 -- ta.[Type] ,
  FROM [sparxDB].[dbo].[t_xref] tx
  INNER JOIN [sparxDB].[dbo].[t_connector] tc ON tx.[Client] = tc.[ea_guid] 
 GROUP BY tx.[Name] , tx.[Type] , [Stereotype] , tx.[Description] 
 ORDER BY tx.[Name] , tx.[Type] , [Stereotype] , tx.[Description] 

-- GUIDs used only for Att_Code , Att_Text, dashboard , datastore and widget 
-- Are Att_Code , Att_Text Ok or is this broken? 
-- 5 rows 
SELECT '[t_object]' Tab , tx.[Name] , tx.[Type] , [Stereotype] , tx.[Description] , COUNT(*) CT 
-- , [Object_Type] , [Package_ID]
  FROM [sparxDB].[dbo].[t_xref] tx
  INNER JOIN [sparxDB].[dbo].[t_object] tob   ON tx.[Client] = tob.[ea_guid] 
  WHERE CHARINDEX('GUID', [Description]) <> 0 
 GROUP BY tx.[Name] , tx.[Type] , [Stereotype] , tx.[Description]

 UNION 
SELECT '[t_attribute]' Tab , tx.[Name] , tx.[Type] , [Stereotype] , tx.[Description] , COUNT(*) CT 
 -- ta.[Type] ,
  FROM [sparxDB].[dbo].[t_xref] tx
  INNER JOIN [sparxDB].[dbo].[t_attribute] ta ON tx.[Client] = ta.[ea_guid] 
  WHERE CHARINDEX('GUID', [Description]) <> 0 
 GROUP BY tx.[Name] , tx.[Type] , [Stereotype] , tx.[Description] 

UNION 
SELECT '[t_connector]' Tab , tx.[Name] , tx.[Type] , [Stereotype] , tx.[Description] , COUNT(*) CT 
 -- ta.[Type] ,
  FROM [sparxDB].[dbo].[t_xref] tx
  INNER JOIN [sparxDB].[dbo].[t_connector] tc ON tx.[Client] = tc.[ea_guid] 
  WHERE CHARINDEX('GUID', [Description]) <> 0 
 GROUP BY tx.[Name] , tx.[Type] , [Stereotype] , tx.[Description] 
 ORDER BY tx.[Name] , tx.[Type] , [Stereotype] , tx.[Description] 

-- CSMDg are the rules applied to these rows. 
-- Standrd string. They all contain FQName=CSMDG::<Stereotype> 
-- @STEREO;Name=SubjectArea;FQName=CSMDG::SubjectArea;@ENDSTEREO; 
-- FQName = Fully Qualified Name 
-- 
-- 52 rows 
SELECT '[t_object]' Tab , tx.[Name] , tx.[Type] , [Stereotype] , tx.[Description] , COUNT(*) CT 
-- , [Object_Type] , [Package_ID]
  FROM [sparxDB].[dbo].[t_xref] tx
  INNER JOIN [sparxDB].[dbo].[t_object] tob   ON tx.[Client] = tob.[ea_guid] 
  WHERE CHARINDEX('CSMDG', [Description]) <> 0 
 GROUP BY tx.[Name] , tx.[Type] , [Stereotype] , tx.[Description]

 UNION 
SELECT '[t_attribute]' Tab , tx.[Name] , tx.[Type] , [Stereotype] , tx.[Description] , COUNT(*) CT 
 -- ta.[Type] ,
  FROM [sparxDB].[dbo].[t_xref] tx
  INNER JOIN [sparxDB].[dbo].[t_attribute] ta ON tx.[Client] = ta.[ea_guid] 
  WHERE CHARINDEX('CSMDG', [Description]) <> 0 
 GROUP BY tx.[Name] , tx.[Type] , [Stereotype] , tx.[Description] 

UNION 
SELECT '[t_connector]' Tab , tx.[Name] , tx.[Type] , [Stereotype] , tx.[Description] , COUNT(*) CT 
 -- ta.[Type] ,
  FROM [sparxDB].[dbo].[t_xref] tx
  INNER JOIN [sparxDB].[dbo].[t_connector] tc ON tx.[Client] = tc.[ea_guid] 
  WHERE CHARINDEX('CSMDG', [Description]) <> 0 
 GROUP BY tx.[Name] , tx.[Type] , [Stereotype] , tx.[Description] 
 ORDER BY tx.[Name] , tx.[Type] , [Stereotype] , tx.[Description] 


-- Not CSMDG or GUID 
-- defines an isID property on 14 attribute Stereotypes, and 1 called Flat structure 
-- 15 rows 
SELECT '[t_object]' Tab , tx.[Name] , tx.[Type] , [Stereotype] , tx.[Description] , COUNT(*) CT 
-- , [Object_Type] , [Package_ID]
  FROM [sparxDB].[dbo].[t_xref] tx
  INNER JOIN [sparxDB].[dbo].[t_object] tob   ON tx.[Client] = tob.[ea_guid] 
  WHERE CHARINDEX('CSMDG', [Description]) = 0 AND CHARINDEX('GUID', [Description]) = 0
 GROUP BY tx.[Name] , tx.[Type] , [Stereotype] , tx.[Description]

 UNION 
SELECT '[t_attribute]' Tab , tx.[Name] , tx.[Type] , [Stereotype] , tx.[Description] , COUNT(*) CT 
 -- ta.[Type] ,
  FROM [sparxDB].[dbo].[t_xref] tx
  INNER JOIN [sparxDB].[dbo].[t_attribute] ta ON tx.[Client] = ta.[ea_guid] 
  WHERE CHARINDEX('CSMDG', [Description]) = 0 AND CHARINDEX('GUID', [Description]) = 0
 GROUP BY tx.[Name] , tx.[Type] , [Stereotype] , tx.[Description] 

UNION 
SELECT '[t_connector]' Tab , tx.[Name] , tx.[Type] , [Stereotype] , tx.[Description] , COUNT(*) CT 
 -- ta.[Type] ,
  FROM [sparxDB].[dbo].[t_xref] tx
  INNER JOIN [sparxDB].[dbo].[t_connector] tc ON tx.[Client] = tc.[ea_guid] 
  WHERE CHARINDEX('CSMDG', [Description]) = 0 AND CHARINDEX('GUID', [Description]) = 0
 GROUP BY tx.[Name] , tx.[Type] , [Stereotype] , tx.[Description] 
 ORDER BY tx.[Name] , tx.[Type] , [Stereotype] , tx.[Description] 

