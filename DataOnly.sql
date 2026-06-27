USE [LibraryDb]
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'0e14ae08-bde8-41a5-aa6f-797b659f49e8', N'Admin', N'ADMIN', NULL)
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'1863ec25-e93a-4596-a62c-bc94a42ab8ac', N'Librarian', N'LIBRARIAN', NULL)
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'ea1187d7-a197-4b57-b7ed-fd6b41b8e46f', N'Staff', N'STAFF', NULL)
GO
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'1c05cf9a-5410-4039-8c47-05869cb5e755', N'abdo ezzat', N'abdo', N'ABDO', N'abdo@gmail', N'ABDO@GMAIL', 0, N'AQAAAAIAAYagAAAAEA+CyguReLy7oBiw1jXEBrhFzdjD+8EKAT6ikTfeM2p8AGMewnmQQxxd+jbybph0Ew==', N'YOQ76AYNUBOZMRPZATTETNHINYXUVSVG', N'035a8db3-6b13-48cf-913f-7610ac7b0f8c', NULL, 0, 0, NULL, 1, 0)
GO
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'c940239f-32bb-4c05-9ada-7bb6ed70c496', N'System Admin', N'admin', N'ADMIN', N'admin@library.com', N'ADMIN@LIBRARY.COM', 1, N'AQAAAAIAAYagAAAAED1S19HwJ6CCsvaAi1rJg1EZvini7ObqJufhxfElgm/sOvCz1Mps1nsEN4U5ndUb5w==', N'2ML7JBDQLLWQOF4URWAAU3KGCTWR6FN6', N'3398530b-92d3-4195-ae09-5a1b13162c43', NULL, 0, 0, NULL, 1, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'c940239f-32bb-4c05-9ada-7bb6ed70c496', N'0e14ae08-bde8-41a5-aa6f-797b659f49e8')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'1c05cf9a-5410-4039-8c47-05869cb5e755', N'1863ec25-e93a-4596-a62c-bc94a42ab8ac')
GO
SET IDENTITY_INSERT [dbo].[Authors] ON 
GO
INSERT [dbo].[Authors] ([Id], [Name], [Summary], [CreatedAt], [UpdateAt], [DeleteAt], [IsDeleted]) VALUES (1, N'Mohamed Hassan', N'Software engineer', CAST(N'2026-06-27T21:31:39.6525292+00:00' AS DateTimeOffset), CAST(N'2026-06-27T21:33:35.0531591+00:00' AS DateTimeOffset), NULL, 0)
GO
INSERT [dbo].[Authors] ([Id], [Name], [Summary], [CreatedAt], [UpdateAt], [DeleteAt], [IsDeleted]) VALUES (2, N'Ali Mohamed', N'Software engineer', CAST(N'2026-06-27T21:32:08.3943941+00:00' AS DateTimeOffset), NULL, NULL, 0)
GO
INSERT [dbo].[Authors] ([Id], [Name], [Summary], [CreatedAt], [UpdateAt], [DeleteAt], [IsDeleted]) VALUES (3, N'Ahmed Mohamed', N'.Net Developer ', CAST(N'2026-06-27T21:32:31.4537537+00:00' AS DateTimeOffset), NULL, NULL, 0)
GO
SET IDENTITY_INSERT [dbo].[Authors] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 
GO
INSERT [dbo].[Categories] ([Id], [ParentId], [Name], [CreatedAt], [UpdateAt], [DeleteAt], [IsDeleted]) VALUES (1, NULL, N'Computer science', CAST(N'2026-06-27T21:20:29.0091867+00:00' AS DateTimeOffset), CAST(N'2026-06-27T23:09:01.4730233+00:00' AS DateTimeOffset), NULL, 0)
GO
INSERT [dbo].[Categories] ([Id], [ParentId], [Name], [CreatedAt], [UpdateAt], [DeleteAt], [IsDeleted]) VALUES (2, 1, N'Programing', CAST(N'2026-06-27T21:26:58.4588890+00:00' AS DateTimeOffset), NULL, NULL, 0)
GO
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Publishers] ON 
GO
INSERT [dbo].[Publishers] ([Id], [Name], [CreatedAt], [UpdateAt], [DeleteAt], [IsDeleted]) VALUES (1, N'Scholastic', CAST(N'2026-06-27T21:35:14.8142946+00:00' AS DateTimeOffset), CAST(N'2026-06-27T21:36:53.2271537+00:00' AS DateTimeOffset), NULL, 0)
GO
INSERT [dbo].[Publishers] ([Id], [Name], [CreatedAt], [UpdateAt], [DeleteAt], [IsDeleted]) VALUES (2, N'HarperCollins', CAST(N'2026-06-27T21:35:38.2448414+00:00' AS DateTimeOffset), NULL, NULL, 0)
GO
INSERT [dbo].[Publishers] ([Id], [Name], [CreatedAt], [UpdateAt], [DeleteAt], [IsDeleted]) VALUES (3, N'Simon & Schuster', CAST(N'2026-06-27T21:35:55.8342774+00:00' AS DateTimeOffset), NULL, NULL, 0)
GO
SET IDENTITY_INSERT [dbo].[Publishers] OFF
GO
SET IDENTITY_INSERT [dbo].[Books] ON 
GO
INSERT [dbo].[Books] ([Id], [Title], [ISBN], [PublicationYear], [Language], [Summary], [CoverImageUrl], [IsAvailable], [PublisherId], [CategoryId], [CreatedAt], [UpdateAt], [DeleteAt], [IsDeleted]) VALUES (1, N'Clean Code', N'9780132350884', 2008, N'En', N'A practical guide to writing clean, maintainable, and readable code.', N'Uploads/786ad967-2c12-419a-ab6f-06b6ed536c90.png', 0, 1, 1, CAST(N'2026-06-27T21:54:46.1834599+00:00' AS DateTimeOffset), CAST(N'2026-06-27T22:03:07.6617920+00:00' AS DateTimeOffset), NULL, 0)
GO
INSERT [dbo].[Books] ([Id], [Title], [ISBN], [PublicationYear], [Language], [Summary], [CoverImageUrl], [IsAvailable], [PublisherId], [CategoryId], [CreatedAt], [UpdateAt], [DeleteAt], [IsDeleted]) VALUES (2, N'The Pragmatic Programmer', N'9780201616224', 2008, N'En', N'Best practices and techniques for becoming a better software developer.', N'Uploads/c1181cfe-fb91-43f2-9e48-271b7b98f8b0.png', 0, 2, 1, CAST(N'2026-06-27T22:05:34.6167935+00:00' AS DateTimeOffset), CAST(N'2026-06-27T22:05:34.6169537+00:00' AS DateTimeOffset), NULL, 0)
GO
SET IDENTITY_INSERT [dbo].[Books] OFF
GO
INSERT [dbo].[BookAuthors] ([BookId], [AuthorId]) VALUES (1, 1)
GO
INSERT [dbo].[BookAuthors] ([BookId], [AuthorId]) VALUES (1, 2)
GO
INSERT [dbo].[BookAuthors] ([BookId], [AuthorId]) VALUES (2, 2)
GO
INSERT [dbo].[BookAuthors] ([BookId], [AuthorId]) VALUES (1, 3)
GO
INSERT [dbo].[BookAuthors] ([BookId], [AuthorId]) VALUES (2, 3)
GO
SET IDENTITY_INSERT [dbo].[Members] ON 
GO
INSERT [dbo].[Members] ([Id], [FullName], [NationalID], [Email], [Address], [Phone], [CreatedAt], [UpdateAt], [DeleteAt], [IsDeleted]) VALUES (1, N'Ahmed Hassan', N'29801011234567', N'ahmed.hassan@example.com', N'15 Tahrir St, Cairo, Egypt', N'+201001234567', CAST(N'2026-06-27T21:38:02.9789319+00:00' AS DateTimeOffset), NULL, NULL, 0)
GO
INSERT [dbo].[Members] ([Id], [FullName], [NationalID], [Email], [Address], [Phone], [CreatedAt], [UpdateAt], [DeleteAt], [IsDeleted]) VALUES (2, N'Sara Mohamed', N'29905222345678', N'sara.mohamed@example.com', N'22 El Geish Rd, Alexandria, Egypt', N'+201112345678', CAST(N'2026-06-27T21:38:23.9549548+00:00' AS DateTimeOffset), NULL, NULL, 0)
GO
INSERT [dbo].[Members] ([Id], [FullName], [NationalID], [Email], [Address], [Phone], [CreatedAt], [UpdateAt], [DeleteAt], [IsDeleted]) VALUES (3, N'Omar Ali', N'30008153456789', N'omar.ali@example.com', N'10 Nile Corniche, Giza, Egypt', N'+201223456789', CAST(N'2026-06-27T21:38:51.1608510+00:00' AS DateTimeOffset), CAST(N'2026-06-27T21:42:59.4479725+00:00' AS DateTimeOffset), NULL, 0)
GO
INSERT [dbo].[Members] ([Id], [FullName], [NationalID], [Email], [Address], [Phone], [CreatedAt], [UpdateAt], [DeleteAt], [IsDeleted]) VALUES (4, N'Mariam Adel', N'30111044567890', N'mariam.adel@example.com', N'7 University St, Mansoura, Egypt', N'+201334567890', CAST(N'2026-06-27T21:39:10.1509510+00:00' AS DateTimeOffset), NULL, NULL, 0)
GO
SET IDENTITY_INSERT [dbo].[Members] OFF
GO
SET IDENTITY_INSERT [dbo].[BorrowTransactions] ON 
GO
INSERT [dbo].[BorrowTransactions] ([Id], [BookId], [IsReturned], [MemberId], [BorrowDate], [DueDate], [ReturnDate], [CreatedAt], [UpdateAt], [DeleteAt], [IsDeleted]) VALUES (1, 1, 0, 1, CAST(N'2026-06-27T22:08:16.7494037+00:00' AS DateTimeOffset), CAST(N'2026-06-27T22:07:55.7120000+00:00' AS DateTimeOffset), CAST(N'2026-06-27T22:08:31.9257004+00:00' AS DateTimeOffset), CAST(N'2026-06-27T22:08:16.7492597+00:00' AS DateTimeOffset), NULL, NULL, 0)
GO
INSERT [dbo].[BorrowTransactions] ([Id], [BookId], [IsReturned], [MemberId], [BorrowDate], [DueDate], [ReturnDate], [CreatedAt], [UpdateAt], [DeleteAt], [IsDeleted]) VALUES (2, 1, 0, 1, CAST(N'2026-06-27T22:09:01.2073669+00:00' AS DateTimeOffset), CAST(N'2026-06-27T22:07:55.7120000+00:00' AS DateTimeOffset), CAST(N'2026-06-27T22:09:28.9925527+00:00' AS DateTimeOffset), CAST(N'2026-06-27T22:09:01.2073663+00:00' AS DateTimeOffset), NULL, NULL, 0)
GO
INSERT [dbo].[BorrowTransactions] ([Id], [BookId], [IsReturned], [MemberId], [BorrowDate], [DueDate], [ReturnDate], [CreatedAt], [UpdateAt], [DeleteAt], [IsDeleted]) VALUES (3, 1, 0, 2, CAST(N'2026-06-27T22:09:32.9337404+00:00' AS DateTimeOffset), CAST(N'2026-06-27T22:07:55.7120000+00:00' AS DateTimeOffset), NULL, CAST(N'2026-06-27T22:09:32.9337395+00:00' AS DateTimeOffset), NULL, NULL, 0)
GO
SET IDENTITY_INSERT [dbo].[BorrowTransactions] OFF
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20260626220513_Books', N'8.0.26')
GO
SET IDENTITY_INSERT [dbo].[ActivityLogs] ON 
GO
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Action], [EntityName], [EntityId], [CreatedAt]) VALUES (1, N'1c05cf9a-5410-4039-8c47-05869cb5e755', N'Create', N'Category', 1, CAST(N'2026-06-27T21:20:29.2967860+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Action], [EntityName], [EntityId], [CreatedAt]) VALUES (2, N'1c05cf9a-5410-4039-8c47-05869cb5e755', N'Update', N'Category', 1, CAST(N'2026-06-27T21:21:37.0208322+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Action], [EntityName], [EntityId], [CreatedAt]) VALUES (3, N'1c05cf9a-5410-4039-8c47-05869cb5e755', N'Update', N'Category', 1, CAST(N'2026-06-27T21:22:47.1773554+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Action], [EntityName], [EntityId], [CreatedAt]) VALUES (4, N'1c05cf9a-5410-4039-8c47-05869cb5e755', N'Update', N'Category', 1, CAST(N'2026-06-27T21:26:31.7862258+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Action], [EntityName], [EntityId], [CreatedAt]) VALUES (5, N'1c05cf9a-5410-4039-8c47-05869cb5e755', N'Create', N'Category', 2, CAST(N'2026-06-27T21:26:58.4735059+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Action], [EntityName], [EntityId], [CreatedAt]) VALUES (6, N'1c05cf9a-5410-4039-8c47-05869cb5e755', N'Create', N'Author', 1, CAST(N'2026-06-27T21:31:40.0020178+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Action], [EntityName], [EntityId], [CreatedAt]) VALUES (7, N'1c05cf9a-5410-4039-8c47-05869cb5e755', N'Create', N'Author', 2, CAST(N'2026-06-27T21:32:08.4247519+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Action], [EntityName], [EntityId], [CreatedAt]) VALUES (8, N'1c05cf9a-5410-4039-8c47-05869cb5e755', N'Create', N'Author', 3, CAST(N'2026-06-27T21:32:31.4651248+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Action], [EntityName], [EntityId], [CreatedAt]) VALUES (9, N'1c05cf9a-5410-4039-8c47-05869cb5e755', N'Update', N'Author', 1, CAST(N'2026-06-27T21:33:35.0713893+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Action], [EntityName], [EntityId], [CreatedAt]) VALUES (10, N'1c05cf9a-5410-4039-8c47-05869cb5e755', N'Create', N'Publisher', 1, CAST(N'2026-06-27T21:35:14.8671241+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Action], [EntityName], [EntityId], [CreatedAt]) VALUES (11, N'1c05cf9a-5410-4039-8c47-05869cb5e755', N'Create', N'Publisher', 2, CAST(N'2026-06-27T21:35:38.2652801+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Action], [EntityName], [EntityId], [CreatedAt]) VALUES (12, N'1c05cf9a-5410-4039-8c47-05869cb5e755', N'Create', N'Publisher', 3, CAST(N'2026-06-27T21:35:55.8577969+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Action], [EntityName], [EntityId], [CreatedAt]) VALUES (13, N'1c05cf9a-5410-4039-8c47-05869cb5e755', N'Update', N'Publisher', 1, CAST(N'2026-06-27T21:36:53.2575506+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Action], [EntityName], [EntityId], [CreatedAt]) VALUES (14, N'1c05cf9a-5410-4039-8c47-05869cb5e755', N'Create', N'Member', 1, CAST(N'2026-06-27T21:38:03.0218459+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Action], [EntityName], [EntityId], [CreatedAt]) VALUES (15, N'1c05cf9a-5410-4039-8c47-05869cb5e755', N'Create', N'Member', 2, CAST(N'2026-06-27T21:38:23.9803950+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Action], [EntityName], [EntityId], [CreatedAt]) VALUES (16, N'1c05cf9a-5410-4039-8c47-05869cb5e755', N'Create', N'Member', 3, CAST(N'2026-06-27T21:38:51.1690951+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Action], [EntityName], [EntityId], [CreatedAt]) VALUES (17, N'1c05cf9a-5410-4039-8c47-05869cb5e755', N'Create', N'Member', 4, CAST(N'2026-06-27T21:39:10.1669974+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Action], [EntityName], [EntityId], [CreatedAt]) VALUES (18, N'1c05cf9a-5410-4039-8c47-05869cb5e755', N'Update', N'Member', 3, CAST(N'2026-06-27T21:42:32.7930873+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Action], [EntityName], [EntityId], [CreatedAt]) VALUES (19, N'1c05cf9a-5410-4039-8c47-05869cb5e755', N'Update', N'Member', 3, CAST(N'2026-06-27T21:42:59.4612027+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Action], [EntityName], [EntityId], [CreatedAt]) VALUES (20, N'1c05cf9a-5410-4039-8c47-05869cb5e755', N'Create', N'Book', 1, CAST(N'2026-06-27T21:54:46.5280639+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Action], [EntityName], [EntityId], [CreatedAt]) VALUES (21, N'1c05cf9a-5410-4039-8c47-05869cb5e755', N'Update', N'Book', 1, CAST(N'2026-06-27T22:01:44.9137437+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Action], [EntityName], [EntityId], [CreatedAt]) VALUES (22, N'1c05cf9a-5410-4039-8c47-05869cb5e755', N'Update', N'Book', 1, CAST(N'2026-06-27T22:03:07.6826692+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Action], [EntityName], [EntityId], [CreatedAt]) VALUES (23, N'1c05cf9a-5410-4039-8c47-05869cb5e755', N'Create', N'Book', 2, CAST(N'2026-06-27T22:05:34.6386169+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Action], [EntityName], [EntityId], [CreatedAt]) VALUES (24, N'1c05cf9a-5410-4039-8c47-05869cb5e755', N'Borrow', N'BorrowTransaction', 1, CAST(N'2026-06-27T22:08:16.8185457+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Action], [EntityName], [EntityId], [CreatedAt]) VALUES (25, N'1c05cf9a-5410-4039-8c47-05869cb5e755', N'Return', N'BorrowTransaction', 1, CAST(N'2026-06-27T22:08:31.9367280+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Action], [EntityName], [EntityId], [CreatedAt]) VALUES (26, N'1c05cf9a-5410-4039-8c47-05869cb5e755', N'Borrow', N'BorrowTransaction', 2, CAST(N'2026-06-27T22:09:01.2170516+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Action], [EntityName], [EntityId], [CreatedAt]) VALUES (27, N'1c05cf9a-5410-4039-8c47-05869cb5e755', N'Return', N'BorrowTransaction', 2, CAST(N'2026-06-27T22:09:29.0068761+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Action], [EntityName], [EntityId], [CreatedAt]) VALUES (28, N'1c05cf9a-5410-4039-8c47-05869cb5e755', N'Borrow', N'BorrowTransaction', 3, CAST(N'2026-06-27T22:09:32.9527993+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Action], [EntityName], [EntityId], [CreatedAt]) VALUES (29, N'1c05cf9a-5410-4039-8c47-05869cb5e755', N'Update', N'Category', 1, CAST(N'2026-06-27T23:07:56.3882859+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[ActivityLogs] ([Id], [UserId], [Action], [EntityName], [EntityId], [CreatedAt]) VALUES (30, N'1c05cf9a-5410-4039-8c47-05869cb5e755', N'Update', N'Category', 1, CAST(N'2026-06-27T23:09:01.4824314+00:00' AS DateTimeOffset))
GO
SET IDENTITY_INSERT [dbo].[ActivityLogs] OFF
GO
