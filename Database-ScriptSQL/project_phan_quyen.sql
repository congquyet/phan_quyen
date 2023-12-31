USE [project_phan_quyen]
GO
/****** Object:  Table [dbo].[Groups]    Script Date: 8/16/2023 2:46:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Groups](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NULL,
	[Arrange] [float] NULL,
 CONSTRAINT [PK_PermissionGroup] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Menus]    Script Date: 8/16/2023 2:46:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NULL,
	[ControllerName] [nvarchar](500) NULL,
	[Link] [nvarchar](500) NULL,
	[Arrange] [float] NULL,
 CONSTRAINT [PK_Menus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MenusGroups]    Script Date: 8/16/2023 2:46:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenusGroups](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MenuId] [int] NULL,
	[GroupId] [int] NULL,
 CONSTRAINT [PK_MenusPermissionGroup] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 8/16/2023 2:46:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NULL,
	[Email] [nvarchar](500) NULL,
	[Password] [nvarchar](500) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UsersGroups]    Script Date: 8/16/2023 2:46:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersGroups](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[GroupId] [int] NULL,
 CONSTRAINT [PK_UsersPermissionGroups] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Groups] ON 

INSERT [dbo].[Groups] ([Id], [Name], [Arrange]) VALUES (1, N'User', 1)
INSERT [dbo].[Groups] ([Id], [Name], [Arrange]) VALUES (2, N'Admin', 2)
SET IDENTITY_INSERT [dbo].[Groups] OFF
SET IDENTITY_INSERT [dbo].[Menus] ON 

INSERT [dbo].[Menus] ([Id], [Name], [ControllerName], [Link], [Arrange]) VALUES (2, N'Menu admin', N'AdminController', N'/Admin/Menus', 2)
INSERT [dbo].[Menus] ([Id], [Name], [ControllerName], [Link], [Arrange]) VALUES (3, N'Nhóm quyền', N'GroupsController', N'/Admin/Groups', 3)
INSERT [dbo].[Menus] ([Id], [Name], [ControllerName], [Link], [Arrange]) VALUES (4, N'Tài khoản admin', N'UsersController', N'/Admin/Users', 4)
INSERT [dbo].[Menus] ([Id], [Name], [ControllerName], [Link], [Arrange]) VALUES (5, N'Khách hàng', N'CustomersController', N'/Admin/Customers', 5)
INSERT [dbo].[Menus] ([Id], [Name], [ControllerName], [Link], [Arrange]) VALUES (6, N'Tag', N'TagsController', N'/Admin/Tags', 6)
INSERT [dbo].[Menus] ([Id], [Name], [ControllerName], [Link], [Arrange]) VALUES (7, N'Quảng cáo', N'AdvController', N'/Admin/Adv', 7)
INSERT [dbo].[Menus] ([Id], [Name], [ControllerName], [Link], [Arrange]) VALUES (8, N'Đơn hàng', N'OrdersController', N'/Admin/Orders', 8)
INSERT [dbo].[Menus] ([Id], [Name], [ControllerName], [Link], [Arrange]) VALUES (9, N'Tin tức', N'NewsController', N'/Admin/News', 9)
INSERT [dbo].[Menus] ([Id], [Name], [ControllerName], [Link], [Arrange]) VALUES (10, N'Sản phẩm', N'ProductsController', N'/Admin/Products', 10)
INSERT [dbo].[Menus] ([Id], [Name], [ControllerName], [Link], [Arrange]) VALUES (11, N'Categories', N'CategoriesController', N'/Admin/Categories', 11)
SET IDENTITY_INSERT [dbo].[Menus] OFF
SET IDENTITY_INSERT [dbo].[MenusGroups] ON 

INSERT [dbo].[MenusGroups] ([Id], [MenuId], [GroupId]) VALUES (40, 11, 2)
INSERT [dbo].[MenusGroups] ([Id], [MenuId], [GroupId]) VALUES (41, 10, 2)
INSERT [dbo].[MenusGroups] ([Id], [MenuId], [GroupId]) VALUES (42, 9, 2)
INSERT [dbo].[MenusGroups] ([Id], [MenuId], [GroupId]) VALUES (43, 8, 2)
INSERT [dbo].[MenusGroups] ([Id], [MenuId], [GroupId]) VALUES (44, 7, 2)
INSERT [dbo].[MenusGroups] ([Id], [MenuId], [GroupId]) VALUES (45, 6, 2)
INSERT [dbo].[MenusGroups] ([Id], [MenuId], [GroupId]) VALUES (46, 5, 2)
INSERT [dbo].[MenusGroups] ([Id], [MenuId], [GroupId]) VALUES (47, 4, 2)
INSERT [dbo].[MenusGroups] ([Id], [MenuId], [GroupId]) VALUES (48, 3, 2)
INSERT [dbo].[MenusGroups] ([Id], [MenuId], [GroupId]) VALUES (49, 2, 2)
SET IDENTITY_INSERT [dbo].[MenusGroups] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Name], [Email], [Password]) VALUES (1, N'Nguyễn Văn A', N'nva@gmail.com', N'$2a$11$61G.em05kF/ZoDcm5I4BieVZ13kThIROocOj/M5nScChh9gvvfMZe')
INSERT [dbo].[Users] ([Id], [Name], [Email], [Password]) VALUES (2, N'Nguyễn Văn B', N'nvb@gmail.com', N'$2a$11$61G.em05kF/ZoDcm5I4BieVZ13kThIROocOj/M5nScChh9gvvfMZe')
INSERT [dbo].[Users] ([Id], [Name], [Email], [Password]) VALUES (3, N'Nguyễn Văn C', N'nvc@gmail.com', N'$2a$11$61G.em05kF/ZoDcm5I4BieVZ13kThIROocOj/M5nScChh9gvvfMZe')
INSERT [dbo].[Users] ([Id], [Name], [Email], [Password]) VALUES (4, N'Nguyễn Văn D', N'nvd@gmail.com', N'$2a$11$61G.em05kF/ZoDcm5I4BieVZ13kThIROocOj/M5nScChh9gvvfMZe')
INSERT [dbo].[Users] ([Id], [Name], [Email], [Password]) VALUES (5, N'Nguyễn Văn E', N'nve@gmail.com', N'$2a$11$61G.em05kF/ZoDcm5I4BieVZ13kThIROocOj/M5nScChh9gvvfMZe')
SET IDENTITY_INSERT [dbo].[Users] OFF
SET IDENTITY_INSERT [dbo].[UsersGroups] ON 

INSERT [dbo].[UsersGroups] ([Id], [UserId], [GroupId]) VALUES (21, 3, 1)
INSERT [dbo].[UsersGroups] ([Id], [UserId], [GroupId]) VALUES (22, 2, 1)
INSERT [dbo].[UsersGroups] ([Id], [UserId], [GroupId]) VALUES (23, 1, 2)
SET IDENTITY_INSERT [dbo].[UsersGroups] OFF
