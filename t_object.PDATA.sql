-- Profile of PDATAx columns 


SELECT [PDATA2] ,[PDATA3] ,[PDATA4] ,[PDATA5] , COUNT(*) CT 
  FROM [sparxDB].[dbo].[t_object]
  GROUP BY [PDATA2] ,[PDATA3] ,[PDATA4] ,[PDATA5] 

-- 	PDATA2	PDATA3	PDATA4	PDATA5	CT
-- 	NULL	NULL	0	NULL	5789
-- 	Java	NULL	0	NULL	3043
-- 	NULL	NULL	NULL	NULL	88
-- 	VBNet	NULL	0	NULL	3
-- 	1	0	NULL	NULL	1
-- 	Java	NULL	0	user identifier schedule	1
-- 	NULL	0	NULL	NULL	66
