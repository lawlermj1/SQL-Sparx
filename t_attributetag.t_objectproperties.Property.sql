-- Profile of Property columns - nothing in common 

SELECT distinct ta.Property , 't_attributetag'   TB 
  FROM [sparxDB].[dbo].t_attributetag ta
 UNION 
 SELECT distinct topr.Property , 't_objectproperties'    
  FROM [sparxDB].[dbo].t_objectproperties topr

   -- 	Property	Sparx Table	D
 -- 	Analytic Component Type	t_objectproperties	0
 -- 	Analytic Data Element	t_objectproperties	0
 -- 	Analytic Feature	t_objectproperties	0
 -- 	Analytic Product Type	t_objectproperties	0
 -- 	Author	t_objectproperties	0
 -- 	BPM Data Element	t_objectproperties	0
 -- 	BPM Entity	t_objectproperties	0
 -- 	Business Project	t_objectproperties	0
 -- 	Colour	t_objectproperties	0
 -- 	Context Diagram	t_objectproperties	0
 -- 	Data Quality Alert	t_attributetag	0
 -- 	Data Steward Contact Email (Interim)	t_attributetag	0
 -- 	Data Stewardship Contact Email	t_objectproperties	0
 -- 	Data Stewardship Contact Email (Interim)	t_objectproperties	0
 -- 	Data Type	t_objectproperties	0
 -- 	Dataset Product Type	t_objectproperties	0
 -- 	derivation	t_objectproperties	0
 -- 	Dissemination Classification	t_attributetag	0
 -- 	Dissemination Classification	t_objectproperties	1
 -- 	Document Date	t_objectproperties	0
 -- 	Exchange Reference	t_objectproperties	0
 -- 	External Preferred Source of Truth	t_attributetag	0
 -- 	Feature Type	t_objectproperties	0
 -- 	Form Identifier Code	t_objectproperties	0
 -- 	fractionDigits	t_objectproperties	0
 -- 	Governance Entity	t_objectproperties	0
 -- 	Guidance	t_attributetag	0
 -- 	Guidance	t_objectproperties	1
 -- 	Implements	t_objectproperties	0
 -- 	Industry Standard	t_objectproperties	0
 -- 	Internal or External	t_objectproperties	0
 -- 	Internal Preferred Source of Truth	t_attributetag	0
 -- 	Is Business Key	t_attributetag	0
 -- 	Item Type	t_objectproperties	0
 -- 	Level 1	t_objectproperties	0
 -- 	Level 2	t_objectproperties	0
 -- 	Level 3	t_objectproperties	0
 -- 	Level 4	t_objectproperties	0
 -- 	Max Length	t_attributetag	0
 -- 	maxLength	t_objectproperties	0
 -- 	maxOccurs	t_objectproperties	0
 -- 	minOccurs	t_objectproperties	0
 -- 	modelGroup	t_objectproperties	0
 -- 	Optionality	t_attributetag	0
 -- 	Order	t_objectproperties	0
 -- 	Parent Object	t_objectproperties	0
 -- 	pattern	t_objectproperties	0
 -- 	Precision	t_attributetag	0
 -- 	Published Date	t_objectproperties	0
 -- 	Rule Type	t_objectproperties	0
 -- 	Security Classification	t_attributetag	0
 -- 	Security Classification	t_objectproperties	1
 -- 	Selected Use	t_attributetag	0
 -- 	Selected Use	t_objectproperties	1
 -- 	Semantic Map	t_attributetag	0
 -- 	Semantic Map	t_objectproperties	1
 -- 	Source Code File	t_objectproperties	0
 -- 	Source Code Location	t_objectproperties	0
 -- 	Source Location	t_objectproperties	0
 -- 	Source Type	t_objectproperties	0
 -- 	Source Version	t_objectproperties	0
 -- 	Status	t_attributetag	0
 -- 	Status	t_objectproperties	1
 -- 	Subject Area	t_objectproperties	0
 -- 	Synonym	t_attributetag	0
 -- 	Tile image	t_objectproperties	0
 -- 	totalDigits	t_objectproperties	0
 -- 	Version	t_objectproperties	0
