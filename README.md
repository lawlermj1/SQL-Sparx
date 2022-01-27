
# SQL Sparx 

SQL needed to profile a generic CS Sparx implementation. 


## SQL names and usages 
0 | Name | Usage
 --  | ---- | -----
1 | 0 Sparx Data Design - main | Profiling SQL used for a generic Sparx data design doct
2 | 0 Sparx Data Design - unused | Extra SQL not included in data design doct
3 | ea_guid | All occurences of ea_guid across all tables. This is a shadow PK used for object reification. 
4 | EASchema_1220_SQLServer | Script to create EA schema - generated. Dated 2016 - old version.
5 | Invariants | Tests to identify invalid Sparx data
6 | t_attribute.stereotype | Profile of t_attribute stereotypes
7 | t_attribute.t_attributetag | Profile of t_attribute t_attributetag
8 | t_attribute.unused | Profile of unused t_attribute columns
9 | t_attributeByt_object | Profile of t_attribute by t_object
10 | t_attributetag.t_objectproperties.Property | Profile of Property columns - nothing in common 
11 | t_diagram | Profile of t_diagram types and links 
12 | t_object.any | Profile of t_object with any stereotype
13 | t_object.ImplementationItem | Profile of t_object with ImplementationItem stereotype
14 | t_object.LookupData | Profile of t_object with LookupData stereotype
15 | t_object.PDATA | Profile of PDATAx columns
16 | t_object.Stereotype | Profile of t_object with All stereotypes
17 | t_object.Stereotype_Object_Type | Profile of t_object with All Object_Types
18 | t_object.t_attribute | Profile of t_object and t_attribute with All ta stereotype
19 | t_object.t_objectProperty | Profile of all t_objectProperty
20 | t_object.t_ObjProp.t_attribute | Profile of t_objectproperties used for relations
21 | t_object.TreeName | Profile of the object tree created through t_objectproperties 
22 | t_object.TreeType | Profile of the object type tree created through t_objectproperties 
23 | t_object.unused | Unused columns from t_object, t_attribute and t_package
24 | t_object_parents | Profile of t_object and their parents
25 | t_object_type | Profile of t_object_type
26 | t_objectproperties | Profile of t_objectproperties Property 
27 | t_objectproperty | Profile of t_objectproperties for tests
28 | t_objectproperty.t_object | Profile of t_objectproperties joined to t_object 
29 | t_package.Counts | counts objects in Parent packages 
30 | t_package.groupby | group object by package and stereotype 
31 | t_package.Parents | Shows package parents and grandparents
32 | t_package.SubjectArea | Profile packages for Subject Areas
33 | t_package.t_objects | Profile objects by packages for All Packages 
34 | t_packages | Shows packages hierarchy 
35 | t_statustypes | Profiles the only 2 status columns on t_object and t_statustypes - not linked
36 | t_stereotype | Profiles t_stereotypes - not linked to other Stereotypes 
37 | t_xref | Profile t_xref - not used for relations or columns
38 | Z MD.xlsx | Has sample Sparx DB metadata
