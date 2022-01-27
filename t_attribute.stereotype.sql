-- Profile of t_attribute stereotypes 

SELECT [Stereotype] , [Type] ,  Count(*) CT   FROM [sparxDB].[dbo].[t_attribute]   
-- where [Stereotype] not in (  'Att_Code' , 'Att_Text',  'BPMDataConcept') 
GROUP BY [Stereotype]  , [Type] 
order by [Stereotype] 
; 
-- 'Attr_Code' , 
 -- Stereotype  Type    CT
 -- Attr_Amount Amount  53
 -- Attr_Amount decimal 199
 -- Attr_Count  Count   26
 -- Attr_Count  integer 77
 -- Attr_Date   date    198
 -- Attr_Date   dateTime    25
 -- Attr_Date   string  1
 -- Attr_Datetime   Datetime    27
 -- Attr_Identifier bigint  1
 -- Attr_Identifier string  72
 -- Attr_Indicator  boolean 399
 -- Attr_Number integer 89
 -- Attr_Number Postcode Type   1
 -- Attr_Number string  2
 -- Attr_Percent    decimal 21
 -- Attr_Percent    integer 1
 -- Attr_Text   NULL    5
 -- Attr_Text   boolean 1
 -- Attr_Text   Country Type    2
 -- Attr_Text   Employment Paid Leave Type  1
 -- Attr_Text   Party Identifier Type   1
 -- Attr_Text   string  374
 -- Attr_Text   Suburb Type 1
 -- Attr_Time   time    1
 -- Attr_URL    string  6

