-- Profile of t_diagram types and links 

SELECT [Diagram_Type] , count(*) CT 
  FROM [sparxDB].[dbo].[t_diagram]
  Group By [Diagram_Type] 

SELECT [DiagramID] , [ConnectorID] , count(*) CT 
  FROM [sparxDB].[dbo].[t_diagramlinks]
  group by [DiagramID] , [ConnectorID] 

