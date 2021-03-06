
/****** Object:  Schema [Pms]    Script Date: 17-02-2019 21:07:34 ******/
CREATE SCHEMA [Pms]
GO
/****** Object:  Table [Pms].[Modules]    Script Date: 17-02-2019 21:07:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Pms].[Modules](
	[ModuleId] [uniqueidentifier] NOT NULL,
	[ModuleName] [varchar](50) NOT NULL,
	[TenantId] [uniqueidentifier] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [varchar](50) NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [varchar](50) NULL,
	[Status] [bit] NOT NULL,
	[ModuleIconClass] [varchar](100) NULL,
	[ModuleDisplayName] [varchar](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[ModuleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Pms].[Privileges]    Script Date: 17-02-2019 21:07:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Pms].[Privileges](
	[PrivilegeId] [uniqueidentifier] NOT NULL,
	[PrivilegeName] [varchar](150) NOT NULL,
	[ModuleId] [uniqueidentifier] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [varchar](50) NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [varchar](50) NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PrivilegeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Pms].[RolePrivileges]    Script Date: 17-02-2019 21:07:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Pms].[RolePrivileges](
	[RolePrivilegeid] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
	[PrivilegeId] [uniqueidentifier] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [varchar](50) NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [varchar](50) NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RolePrivilegeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Pms].[TenantDetails]    Script Date: 17-02-2019 21:08:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Pms].[TenantDetails](
	[TenantId] [uniqueidentifier] NOT NULL,
	[TenantName] [varchar](100) NOT NULL,
	[TenantDescription] [nvarchar](max) NULL,
	[TenantAddress] [nvarchar](max) NOT NULL,
	[TenantContactNumber] [varchar](150) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [varchar](50) NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [varchar](50) NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TenantId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [Pms].[Modules] ([ModuleId], [ModuleName], [TenantId], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Status], [ModuleIconClass], [ModuleDisplayName]) VALUES (N'3f8924c3-2fdf-4c1f-8260-9bc2d5d1cd47', N'Examination', N'24f045fb-0092-444e-aa36-4b072ce1f691', CAST(N'2019-02-17T10:22:03.193' AS DateTime), N'edupms', NULL, NULL, 1, N'fas fa-file-alt', N'Examination')
GO
INSERT [Pms].[Privileges] ([PrivilegeId], [PrivilegeName], [ModuleId], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Status]) VALUES (N'0f2e3f41-ce66-48be-bd34-483ab6f741c3', N'View_Examination', N'3f8924c3-2fdf-4c1f-8260-9bc2d5d1cd47', CAST(N'2019-02-17T10:22:03.947' AS DateTime), N'edupms', NULL, NULL, 1)
GO
INSERT [Pms].[RolePrivileges] ([RolePrivilegeid], [RoleId], [PrivilegeId], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Status]) VALUES (N'cd67d24c-9a8d-42ae-98b3-a018d81e379e', N'5055db57-9100-4e34-aa39-3f6ed00e94d5', N'0f2e3f41-ce66-48be-bd34-483ab6f741c3', CAST(N'2019-02-17T10:22:05.580' AS DateTime), N'edupms', NULL, NULL, 1)
GO
INSERT [Pms].[TenantDetails] ([TenantId], [TenantName], [TenantDescription], [TenantAddress], [TenantContactNumber], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [Status]) VALUES (N'24f045fb-0092-444e-aa36-4b072ce1f691', N'Development Tenant', N'Tenant created for development purpose', N'Test Address', N'Test Contact', CAST(N'2019-02-17T10:22:02.263' AS DateTime), N'edupms', NULL, NULL, 1)
GO
ALTER TABLE [Pms].[Modules] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [Pms].[Modules] ADD  DEFAULT (suser_sname()) FOR [CreatedBy]
GO
ALTER TABLE [Pms].[Privileges] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [Pms].[Privileges] ADD  DEFAULT (suser_sname()) FOR [CreatedBy]
GO
ALTER TABLE [Pms].[RolePrivileges] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [Pms].[RolePrivileges] ADD  DEFAULT (suser_sname()) FOR [CreatedBy]
GO
ALTER TABLE [Pms].[TenantDetails] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [Pms].[TenantDetails] ADD  DEFAULT (suser_sname()) FOR [CreatedBy]
GO
ALTER TABLE [Pms].[Modules]  WITH CHECK ADD FOREIGN KEY([TenantId])
REFERENCES [Pms].[TenantDetails] ([TenantId])
GO
ALTER TABLE [Pms].[Privileges]  WITH CHECK ADD FOREIGN KEY([ModuleId])
REFERENCES [Pms].[Modules] ([ModuleId])
GO
ALTER TABLE [Pms].[RolePrivileges]  WITH CHECK ADD FOREIGN KEY([PrivilegeId])
REFERENCES [Pms].[Privileges] ([PrivilegeId])
GO
/****** Object:  StoredProcedure [dbo].[USP_SeedDataInsertScripts]    Script Date: 17-02-2019 21:08:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--schema - Pms
/******************************
** Name: USP_SeedDataInsertSctipts
** Desc: This SP will insert seed data
** Auth: Saravanan C.
** Date: 29/12/2018
**************************
** Change History
**************************
** PR   Date         Author      Description 
** --   --------     -------     ------------------------------------
** 1    29/12/2018   Saravanan   Created the SP with insert script for seed data for product admin tenant
** 2	29/12/2018	 Saravanan	 Insert script for seed data for product admin user
*******************************/
--adminUserId --
--Exec USP_SeedDataInsertScripts
CREATE proc [dbo].[USP_SeedDataInsertScripts]
as 
begin
/*
SEED DATA FOR TENANT DETAILS TABLE
*/
  begin
    
	if(exists(select object_id from sys.objects where name like '%TenantDetails%') and not exists(select Tenant_Id from Pms.TenantDetails where Tenant_Id='2D0255FE-1DC9-4DD4-9135-B6E34C263EA6'))
	begin
	  INSERT INTO Pms.TenantDetails(
	  Tenant_Id
      ,Tenant_Name
      ,Tenant_Description
      ,Tenant_Address
      ,Tenant_Website
      ,Tenant_Contact
      ,Tenant_BillingType
      ,Tenant_PaymentDetails
      ,Tenant_BillingContact
      ,Tenant_BillingAddress
      ,Tenant_IsProductAdmin
      ,Tenant_URL
      ,Tenant_CreatedBy
      ,Tenant_CreatedOn
      ,Tenant_UpdatedOn
      ,Tenant_UpdatedBy
      ,Tenant_Status
      ,Tenant_ApprovalStatus
	  )
	  VALUES(
	  '2D0255FE-1DC9-4DD4-9135-B6E34C263EA6'
	  ,'Product Admin'
	  ,'Admin Tenant for creating other users and tenants.'
	  ,NULL
	  ,NULL
	  ,NULL
	  ,NULL
	  ,NULL
	  ,NULL
	  ,NULL
	  ,1
	  ,NULL
	  ,'Product Admin'
	  ,GETDATE()
	  ,NULL
	  ,NULL
	  ,1
	  ,1
	  )
	end

  end
/*
SEED DATA FOR USER DETAILS
*/
  begin

  if(exists(select object_id from sys.objects where name like '%Users%') and not exists(select User_ID from Pms.Users where User_ID='1A9937DA-7DF4-452F-AE04-91DDC41642F4'))
  begin
    INSERT INTO Pms.Users(
	User_ID
	,User_TenantID
	,User_UserName
	,User_EmailID
	,User_Comment
	,User_Password
	,User_PasswordQuestion
	,User_PasswordAnswer
	,User_IsApproved
	,User_LastActivityDate
	,User_LastLoginDate
	,User_LastPasswordChangedDate
	,User_CreationDate
	,User_IsLockedOut
	,User_LastLockedOutDate
	,User_FailedPasswordAttemptCount
	,User_FailedPasswordAttemptWindowStart
	,User_FailedPasswordAnswerAttemptCount
	,User_FailedPasswordAnswerAttemptWindowStart
	,User_Status
	)
	VALUES (
	'1A9937DA-7DF4-452F-AE04-91DDC41642F4'
	,'2D0255FE-1DC9-4DD4-9135-B6E34C263EA6'
	,'padmin@edupms.com'
	,'padmin@edupms.com'
	,'Product Admin'
	,'3CE5B9408BE4F343A44650F2C802A072'
	,NULL
	,NULL
	,1
	,NULL
	,NULL
	,NULL
	,GETDATE()
	,0
	,NULL
	,NULL
	,NULL
	,NULL
	,NULL
	,1
	)
  end

  end
end




GO
