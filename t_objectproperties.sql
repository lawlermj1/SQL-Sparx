-- Profile of t_objectproperties Property 

-- non-relation properties 
SELECT [Property], count(*) CT 
  FROM [sparxDB].[dbo].[t_objectproperties]
  WHERE topr.[Value] NOT LIKE '{%' 
  group by [Property] 
  ORDER BY [Property] 



-- all properties 
SELECT [Property], count(*) CT 
  FROM [sparxDB].[dbo].[t_objectproperties]
  group by [Property] 
  ORDER BY [Property] 

	-- 	Property	CT
-- 	Analytic Component Type	5
-- 	Analytic Data Element	161
-- 	Analytic Feature	54
-- 	Analytic Product Type	5
-- 	Author	28
-- 	BPM Data Element	141
-- 	BPM Entity	2
-- 	Business Project	34
-- 	Colour	1705
-- 	Context Diagram	28
-- 	Data Stewardship Contact Email	11
-- 	Data Stewardship Contact Email (Interim)	508
-- 	Data Type	7482
-- 	Dataset Product Type	23
-- 	derivation	2811
-- 	Dissemination Classification	508
-- 	Document Date	28
-- 	Exchange Reference	23
-- 	Feature Type	99
-- 	Form Identifier Code	1
-- 	fractionDigits	42
-- 	Governance Entity	23
-- 	Guidance	23
-- 	Implements	8193
-- 	Industry Standard	217
-- 	Internal or External	23
-- 	Item Type	7482
-- 	Level 1	8
-- 	Level 2	8
-- 	Level 3	8
-- 	Level 4	8
-- 	maxLength	2737
-- 	maxOccurs	3840
-- 	minOccurs	3840
-- 	modelGroup	596
-- 	Order	298
-- 	Parent Object	215
-- 	pattern	41
-- 	Published Date	1
-- 	Rule Type	298
-- 	Security Classification	508
-- 	Selected Use	97
-- 	Semantic Map	97
-- 	Source Code File	56
-- 	Source Code Location	56
-- 	Source Location	19
-- 	Source Type	19
-- 	Source Version	19
-- 	Status	566
-- 	Subject Area	508
-- 	Tile image	11
-- 	totalDigits	72
-- 	Version	1
