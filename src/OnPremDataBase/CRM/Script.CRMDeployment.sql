:r .\sps\usp_post_crm.sql
:r .\sps\usp_pre_crm.sql

INSERT INTO [comm].[AZConfigOnPrem]
     VALUES
           (2
           ,'crm'
           ,0
           ,GETDATE()
           ,'hperezbermudez'
           ,GETDATE()
		   ,'hperezbermudez')
GO