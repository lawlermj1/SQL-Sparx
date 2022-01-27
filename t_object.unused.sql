-- Unused columns from t_object, t_attribute and t_package 

-- These are Sparx only columns that will not be used for metadata integration. 
-- These columns appear to be used by Sparx for specific features. 

SELECT DISTINCT  GenType, GenFile 
      FROM [sparxDB].[dbo].[t_object] ; 

-- These are Sparx only columns that will not be used for metadata integration. 
-- These columns are either NULL or have very few values. 

SELECT DISTINCT    Backcolor, BorderWidth, Bordercolor, Style, StyleEx, Status, Scope, Diagram_ID, Version, NType, Complexity, Effort, 
BorderStyle, Fontcolor, Abstract, Tagged, Concurrency, Visibility, Persistence, Cardinality, Header1, Header2, Phase, GenOption, GenLinks, 
Classifier, RunState, Classifier_guid, IsRoot, IsLeaf, IsSpec, IsActive, StateFlags, PackageFlags, Multiplicity, EventFlags, ActionFlags 
   FROM [sparxDB].[dbo].[t_object] ; 

SELECT DISTINCT 
Scope, Containment, IsStatic, IsCollection, IsOrdered, AllowDuplicates, LowerBound, UpperBound, Container, Derived, GenOption, Length, 
Precision, Scale, Const, Style, StyleEx
  FROM [sparxDB].[dbo].[t_attribute]

SELECT DISTINCT XMLPath, IsControlled, Version, Protected, PkgOwner, UMLVersion, UseDTD, LogXML, CodePath, Namespace, BatchSave, 
BatchLoad , PackageFlags
  FROM [sparxDB].[dbo].[t_package]

