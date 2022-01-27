-- Profiles the only 2 status columns on t_object and t_statustypes - not linked 


-- Most status are controlled through object properties 
SELECT distinct tob.Status , 't_object'   TB  
  FROM [sparxDB].[dbo].[t_object] tob 
 UNION 
 SELECT distinct tst.Status , 't_statustypes'    
  FROM [sparxDB].[dbo].t_statustypes tst 

--TB  Status
--t_object  Development
--t_object  Proposed
--t_object  Approved
--t_statustypes Approved
--t_statustypes Implemented
--t_statustypes Mandatory
--t_statustypes Proposed
--t_statustypes Validated
