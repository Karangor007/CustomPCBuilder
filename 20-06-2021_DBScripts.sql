USE [CustomPCBuilderDB]
GO
/****** Object:  Table [dbo].[USER_MASTER]    Script Date: 06/20/2021 07:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USER_MASTER](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[usrname] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[type] [nvarchar](50) NULL,
	[fname] [nvarchar](100) NULL,
	[lname] [nvarchar](100) NULL,
	[email] [nvarchar](50) NULL,
	[address] [nvarchar](max) NULL,
	[createAt] [datetime] NULL,
	[createBy] [nvarchar](50) NULL,
	[updateAt] [datetime] NULL,
	[updateBy] [nvarchar](50) NULL,
	[isActive] [bit] NULL,
	[contact] [nvarchar](100) NULL,
 CONSTRAINT [PK_USER_MASTER] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[USER_MASTER] ON
INSERT [dbo].[USER_MASTER] ([user_id], [usrname], [password], [type], [fname], [lname], [email], [address], [createAt], [createBy], [updateAt], [updateBy], [isActive], [contact]) VALUES (1, N'Karan@123', N'admin', N'Admin', N'Karan', N'Rajgor', N'', N'', CAST(0x0000AD0F00000000 AS DateTime), N'admin', CAST(0x0000AD2700000000 AS DateTime), N'karan@123', 1, N'')
INSERT [dbo].[USER_MASTER] ([user_id], [usrname], [password], [type], [fname], [lname], [email], [address], [createAt], [createBy], [updateAt], [updateBy], [isActive], [contact]) VALUES (7, N'dhruv', N'dhruv', N'null', N'', N'', N'', N'', CAST(0x0000AD4000000000 AS DateTime), N'User', CAST(0x0000AD4000000000 AS DateTime), N'Karan@123', 0, N'')
INSERT [dbo].[USER_MASTER] ([user_id], [usrname], [password], [type], [fname], [lname], [email], [address], [createAt], [createBy], [updateAt], [updateBy], [isActive], [contact]) VALUES (8, N'abhi@123', N'123', N'null', N'', N'', N'', N'', CAST(0x0000AD4000000000 AS DateTime), N'User', CAST(0x0000AD4000000000 AS DateTime), N'Karan@123', 0, N'')
SET IDENTITY_INSERT [dbo].[USER_MASTER] OFF
/****** Object:  Table [dbo].[mst_WiFiCard]    Script Date: 06/20/2021 07:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mst_WiFiCard](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[model] [nvarchar](50) NULL,
	[brand] [nvarchar](50) NULL,
	[speed] [nvarchar](50) NULL,
	[interface] [nvarchar](50) NULL,
	[price] [nvarchar](50) NULL,
	[in_stock] [nvarchar](50) NULL,
	[image] [nvarchar](500) NULL,
	[isActive] [bit] NULL,
	[createAt] [datetime] NULL,
	[createBy] [nvarchar](50) NULL,
	[updateAt] [datetime] NULL,
	[updateBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_mst_WiFiCard] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[mst_WiFiCard] ON
INSERT [dbo].[mst_WiFiCard] ([id], [model], [brand], [speed], [interface], [price], [in_stock], [image], [isActive], [createAt], [createBy], [updateAt], [updateBy]) VALUES (1, N'TL-WN821N', N'TP-LINK', N'300', N'', N'599', N'9', N'9c2341Dw7T93RBL._AC_SL1000_.jpg', 1, CAST(0x0000AD1B0151D460 AS DateTime), N'karan@123', CAST(0x0000AD1B01521AB0 AS DateTime), N'karan@123')
SET IDENTITY_INSERT [dbo].[mst_WiFiCard] OFF
/****** Object:  Table [dbo].[mst_storage]    Script Date: 06/20/2021 07:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mst_storage](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[model] [nvarchar](50) NULL,
	[brand] [nvarchar](50) NULL,
	[size] [nvarchar](50) NULL,
	[interface] [nvarchar](50) NULL,
	[price] [nvarchar](50) NULL,
	[in_stock] [nvarchar](50) NULL,
	[image] [nvarchar](500) NULL,
	[isActive] [bit] NULL,
	[createAt] [datetime] NULL,
	[createBy] [nvarchar](50) NULL,
	[updateAt] [datetime] NULL,
	[updateBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_mst_storage] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[mst_storage] ON
INSERT [dbo].[mst_storage] ([id], [model], [brand], [size], [interface], [price], [in_stock], [image], [isActive], [createAt], [createBy], [updateAt], [updateBy]) VALUES (1, N'BX500', N'Crucial', N'240', N'NAND SATA', N'3,216', N'5', N'2d0651HIx1CNZxL._AC_SL1007_.jpg', 1, CAST(0x0000AD1A014E4250 AS DateTime), N'karan@123', CAST(0x0000AD1A014E4250 AS DateTime), N'karan@123')
SET IDENTITY_INSERT [dbo].[mst_storage] OFF
/****** Object:  Table [dbo].[mst_smps]    Script Date: 06/20/2021 07:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mst_smps](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[model] [nvarchar](50) NULL,
	[brand] [nvarchar](50) NULL,
	[wattage] [nvarchar](50) NULL,
	[price] [nvarchar](50) NULL,
	[in_stock] [nvarchar](50) NULL,
	[image] [nvarchar](500) NULL,
	[isActive] [bit] NULL,
	[createAt] [datetime] NULL,
	[createBy] [nvarchar](50) NULL,
	[updateAt] [datetime] NULL,
	[updateBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_mst_smps] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[mst_smps] ON
INSERT [dbo].[mst_smps] ([id], [model], [brand], [wattage], [price], [in_stock], [image], [isActive], [createAt], [createBy], [updateAt], [updateBy]) VALUES (1, N'Zebronics Gaming', N'Zebronics', N'500', N'3,055', N'6', N'ab5291ZE86SwCuL._AC_SL1500_.jpg', 1, CAST(0x0000AD18014D2910 AS DateTime), N'karan@123', CAST(0x0000AD18014E4250 AS DateTime), N'karan@123')
SET IDENTITY_INSERT [dbo].[mst_smps] OFF
/****** Object:  Table [dbo].[mst_ram]    Script Date: 06/20/2021 07:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mst_ram](
	[ram_id] [int] IDENTITY(1,1) NOT NULL,
	[brand] [nvarchar](50) NULL,
	[type] [nvarchar](50) NULL,
	[size] [nvarchar](50) NULL,
	[price] [nvarchar](50) NULL,
	[createAt] [datetime] NULL,
	[createBy] [nvarchar](50) NULL,
	[updateAt] [datetime] NULL,
	[updateBy] [nvarchar](50) NULL,
	[isActive] [bit] NULL,
	[img] [nvarchar](50) NULL,
	[in_stock] [nvarchar](50) NULL,
	[frequency] [nvarchar](50) NULL,
	[channel] [nvarchar](50) NULL,
	[model] [nvarchar](50) NULL,
 CONSTRAINT [PK_mst_ram] PRIMARY KEY CLUSTERED 
(
	[ram_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[mst_ram] ON
INSERT [dbo].[mst_ram] ([ram_id], [brand], [type], [size], [price], [createAt], [createBy], [updateAt], [updateBy], [isActive], [img], [in_stock], [frequency], [channel], [model]) VALUES (5, N'Crucial', N'DDR4', N'8', N'3,250', CAST(0x0000AD1500E629E0 AS DateTime), N'karan@123', CAST(0x0000AD210140CD00 AS DateTime), N'karan@123', 1, N'dd6d61gws-rVpiL._AC_SL1127_.jpg', N'3', N'2666 MHz', N'16X2', N'Crucial RAM')
INSERT [dbo].[mst_ram] ([ram_id], [brand], [type], [size], [price], [createAt], [createBy], [updateAt], [updateBy], [isActive], [img], [in_stock], [frequency], [channel], [model]) VALUES (6, N'HyperX', N'DDR4', N'8', N'4,530', CAST(0x0000AD1500E74320 AS DateTime), N'karan@123', CAST(0x0000AD1500EA8EE0 AS DateTime), N'karan@123', 1, N'ca9061Udx3CqBtL._AC_SL1428_.jpg', N'7', N'3200 MHz', N'8X4', N'HyperX Fury')
INSERT [dbo].[mst_ram] ([ram_id], [brand], [type], [size], [price], [createAt], [createBy], [updateAt], [updateBy], [isActive], [img], [in_stock], [frequency], [channel], [model]) VALUES (7, N'Acer', N'DDR4', N'8', N'4,972', CAST(0x0000AD2101438C20 AS DateTime), N'karan@123', CAST(0x0000AD2101438C20 AS DateTime), N'karan@123', 1, N'3a0c7143Oilq6vS._AC_SL1500_.jpg', N'4', N'2666MHz', N'16X2', N'UD100 U-DIMM')
INSERT [dbo].[mst_ram] ([ram_id], [brand], [type], [size], [price], [createAt], [createBy], [updateAt], [updateBy], [isActive], [img], [in_stock], [frequency], [channel], [model]) VALUES (8, N'Ballistix', N'DDR4', N'16', N'8,399', CAST(0x0000AD2101445F10 AS DateTime), N'karan@123', CAST(0x0000AD2101469190 AS DateTime), N'karan@123', 1, N'f86761UeiitbWYL._AC_SL1280_.jpg', N'3', N'3000 MHz', N'CL15', N'BL2K8G30C15U4RL RGB')
SET IDENTITY_INSERT [dbo].[mst_ram] OFF
/****** Object:  Table [dbo].[mst_products]    Script Date: 06/20/2021 07:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mst_products](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[model] [nvarchar](50) NULL,
	[brand] [nvarchar](50) NULL,
	[price] [nvarchar](50) NULL,
	[in_stock] [nvarchar](50) NULL,
	[type] [nvarchar](50) NULL,
	[image] [nvarchar](50) NULL,
	[details] [nvarchar](500) NULL,
	[isActive] [bit] NULL,
	[createAt] [datetime] NULL,
	[createBy] [nvarchar](50) NULL,
	[updateAt] [datetime] NULL,
	[updateBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_mst_products] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[mst_products] ON
INSERT [dbo].[mst_products] ([id], [model], [brand], [price], [in_stock], [type], [image], [details], [isActive], [createAt], [createBy], [updateAt], [updateBy]) VALUES (1, N'Clutch GM08', N'MSI', N'1,299', N'4', N'7', N'2036mouse.png', N'The MSI Clutch GM08 Gaming Mouse equips the everyday gamer with great precision and resilience.', 1, CAST(0x0000AD390169FFE0 AS DateTime), N'Karan@123', CAST(0x0000AD4401662780 AS DateTime), N'Karan@123')
INSERT [dbo].[mst_products] ([id], [model], [brand], [price], [in_stock], [type], [image], [details], [isActive], [createAt], [createBy], [updateAt], [updateBy]) VALUES (2, N'Vigor GK20 Gaming', N'MSI', N'1,899', N'2', N'10', N'4ec8msiKeyBoard.png', N'Enjoy lengthy gaming sessions with the VIGOR GK20 Backlit Gaming Keyboard from MSI. The 12+ million key stroke life makes this keyboard ideal for a wide range of uses, such as gaming as well as word processing and casual use. This keyboard is a cost-effective solution, giving you some gaming-related capabilities such as ergonomically designed keycaps for comfortable typing, and 12 anti-ghosting keys for enhanced in-game controls.', 1, CAST(0x0000AD3B0139A8E0 AS DateTime), N'Karan@123', CAST(0x0000AD4401662780 AS DateTime), N'Karan@123')
INSERT [dbo].[mst_products] ([id], [model], [brand], [price], [in_stock], [type], [image], [details], [isActive], [createAt], [createBy], [updateAt], [updateBy]) VALUES (3, N'BlackShark V2 X', N'Razer', N'6,400', N'9', N'9', N'08f2razorHeadSets.png', N'Face the competition head-on with a lightweight esports headset that thrives under pressure. Introducing the Razer BlackShark V2 X—a triple threat of amazing audio, superior mic clarity and supreme sound isolation that’s approved by pros.', 1, CAST(0x0000AD3B0139EF30 AS DateTime), N'Karan@123', CAST(0x0000AD4401666DD0 AS DateTime), N'Karan@123')
INSERT [dbo].[mst_products] ([id], [model], [brand], [price], [in_stock], [type], [image], [details], [isActive], [createAt], [createBy], [updateAt], [updateBy]) VALUES (4, N'Optix G24', N'MSI', N'16,499', N'4', N'8', N'b4acmsiMonitors.png', N'Bring you’re A-game with the Optix G24C curved gaming monitor. Equipped with a 144Hz refresh rate, 1ms response time VA panel, the Optix G24C will help you see your opponents and aim with ease. Built with AMD Freesync adaptive sync technology, the G24C can match the display’s refresh rate with your GPU for ultra-smooth gameplay. Make sure you can hit your mark with all the latest technologies built-in the Optix G24C for competitive play.', 1, CAST(0x0000AD3B013A3580 AS DateTime), N'Karan@123', CAST(0x0000AD4401666DD0 AS DateTime), N'Karan@123')
INSERT [dbo].[mst_products] ([id], [model], [brand], [price], [in_stock], [type], [image], [details], [isActive], [createAt], [createBy], [updateAt], [updateBy]) VALUES (5, N'TL-WN821N', N'TP-LINK', N'599', N'5', N'6', N'7c0d41Dw7T93RBL._AC_SL1000_.jpg', N'details', 0, CAST(0x0000AD3B0142FF80 AS DateTime), N'Karan@123', CAST(0x0000AD4401678710 AS DateTime), N'Karan@123')
INSERT [dbo].[mst_products] ([id], [model], [brand], [price], [in_stock], [type], [image], [details], [isActive], [createAt], [createBy], [updateAt], [updateBy]) VALUES (6, N'Viper Mini', N'Razer', N'3,600', N'2', N'7', N'9f59unnamed (1)-228x228.png', N'Born to push the very limits of ultra-lightweight gaming, the Razer Viper Mini takes up a smaller form that remains just as big in performance. Shortening its length and grip width, we’ve worked with enthusiasts and esports athletes to hone its design even further, ensuring that absolute control now belongs in the hands of more gamers— so take hold of our leanest and lightest gaming mouse yet.', 1, CAST(0x0000AD4401659AE0 AS DateTime), N'Karan@123', CAST(0x0000000000000000 AS DateTime), N'')
SET IDENTITY_INSERT [dbo].[mst_products] OFF
/****** Object:  Table [dbo].[mst_product_cat]    Script Date: 06/20/2021 07:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mst_product_cat](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[isActive] [bigint] NULL,
	[createAt] [datetime] NULL,
	[createBy] [nvarchar](50) NULL,
	[updateAt] [datetime] NULL,
	[updateBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_mst_product_cat] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[mst_product_cat] ON
INSERT [dbo].[mst_product_cat] ([id], [name], [isActive], [createAt], [createBy], [updateAt], [updateBy]) VALUES (5, N'yhtyrty', 0, CAST(0x0000AD4300000000 AS DateTime), N'Karan@123', CAST(0x0000AD4800000000 AS DateTime), N'Karan@123')
INSERT [dbo].[mst_product_cat] ([id], [name], [isActive], [createAt], [createBy], [updateAt], [updateBy]) VALUES (6, N'Wifi-Card', 1, CAST(0x0000AD4400000000 AS DateTime), N'Karan@123', CAST(0x0000000000000000 AS DateTime), N'')
INSERT [dbo].[mst_product_cat] ([id], [name], [isActive], [createAt], [createBy], [updateAt], [updateBy]) VALUES (7, N'Mouse', 1, CAST(0x0000AD4400000000 AS DateTime), N'Karan@123', CAST(0x0000000000000000 AS DateTime), N'')
INSERT [dbo].[mst_product_cat] ([id], [name], [isActive], [createAt], [createBy], [updateAt], [updateBy]) VALUES (8, N'Monitors', 1, CAST(0x0000AD4400000000 AS DateTime), N'Karan@123', CAST(0x0000000000000000 AS DateTime), N'')
INSERT [dbo].[mst_product_cat] ([id], [name], [isActive], [createAt], [createBy], [updateAt], [updateBy]) VALUES (9, N'Headsets', 1, CAST(0x0000AD4400000000 AS DateTime), N'Karan@123', CAST(0x0000000000000000 AS DateTime), N'')
INSERT [dbo].[mst_product_cat] ([id], [name], [isActive], [createAt], [createBy], [updateAt], [updateBy]) VALUES (10, N'Keyboards', 1, CAST(0x0000AD4400000000 AS DateTime), N'Karan@123', CAST(0x0000000000000000 AS DateTime), N'')
SET IDENTITY_INSERT [dbo].[mst_product_cat] OFF
/****** Object:  Table [dbo].[mst_product_cart]    Script Date: 06/20/2021 07:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mst_product_cart](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [nvarchar](50) NULL,
	[type] [nvarchar](50) NULL,
	[quantity] [nvarchar](50) NULL,
	[price] [nchar](10) NULL,
	[isActive] [bit] NULL,
	[createBy] [nvarchar](50) NULL,
	[createAt] [datetime] NULL,
	[updateBy] [nvarchar](50) NULL,
	[updateAt] [datetime] NULL,
 CONSTRAINT [PK_mst_product_cart] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[mst_product_cart] ON
INSERT [dbo].[mst_product_cart] ([id], [product_id], [type], [quantity], [price], [isActive], [createBy], [createAt], [updateBy], [updateAt]) VALUES (1, N'1', N'7', N'', N'1,299     ', 1, N'Karan@123', CAST(0x0000AD4900000000 AS DateTime), N'', CAST(0x0000000000000000 AS DateTime))
INSERT [dbo].[mst_product_cart] ([id], [product_id], [type], [quantity], [price], [isActive], [createBy], [createAt], [updateBy], [updateAt]) VALUES (2, N'1', N'7', N'', N'1,299     ', 1, N'Karan@123', CAST(0x0000AD4900000000 AS DateTime), N'', CAST(0x0000000000000000 AS DateTime))
INSERT [dbo].[mst_product_cart] ([id], [product_id], [type], [quantity], [price], [isActive], [createBy], [createAt], [updateBy], [updateAt]) VALUES (3, N'1', N'7', N'', N'1,299     ', 1, N'Karan@123', CAST(0x0000AD4900000000 AS DateTime), N'', CAST(0x0000000000000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[mst_product_cart] OFF
/****** Object:  Table [dbo].[mst_processor]    Script Date: 06/20/2021 07:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mst_processor](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[model] [nvarchar](50) NULL,
	[brand] [nvarchar](50) NULL,
	[socket_type] [nvarchar](50) NULL,
	[clock_speed] [nvarchar](50) NULL,
	[createAt] [datetime] NULL,
	[createBy] [nvarchar](50) NULL,
	[updateAt] [datetime] NULL,
	[updateBy] [nvarchar](50) NULL,
	[isActive] [bit] NULL,
	[image] [nvarchar](50) NULL,
	[in_stock] [nvarchar](50) NULL,
	[price] [nvarchar](50) NULL,
 CONSTRAINT [PK_mst_processor] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[mst_processor] ON
INSERT [dbo].[mst_processor] ([id], [model], [brand], [socket_type], [clock_speed], [createAt], [createBy], [updateAt], [updateBy], [isActive], [image], [in_stock], [price]) VALUES (3, N'Ryzen 5 3600 Desktop Processor 6 Cores', N'AMD', N'AM4', N'4.2 GHz', CAST(0x0000AD2401666DD0 AS DateTime), N'karan@123', CAST(0x0000000000000000 AS DateTime), N'', 1, N'3e5a71WPGXQLcLL._AC_SL1384_.jpg', N'15', N'17,964')
INSERT [dbo].[mst_processor] ([id], [model], [brand], [socket_type], [clock_speed], [createAt], [createBy], [updateAt], [updateBy], [isActive], [image], [in_stock], [price]) VALUES (4, N'Core i5-9400F', N'Intel', N'lga 1151', N'2.9ghz', CAST(0x0000AD400176E890 AS DateTime), N'Karan@123', CAST(0x0000AD4001772EE0 AS DateTime), N'Karan@123', 0, N'5e90download.jpg', N'2', N'9000')
SET IDENTITY_INSERT [dbo].[mst_processor] OFF
/****** Object:  Table [dbo].[mst_PreBuiltPC]    Script Date: 06/20/2021 07:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mst_PreBuiltPC](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[model] [nvarchar](50) NULL,
	[brand] [nvarchar](50) NULL,
	[details] [nvarchar](500) NULL,
	[PCType] [nvarchar](50) NULL,
	[in_stock] [nvarchar](50) NULL,
	[price] [nvarchar](50) NULL,
	[platform] [nvarchar](50) NULL,
	[cpu] [nvarchar](50) NULL,
	[motherboard] [nvarchar](50) NULL,
	[cooler] [nvarchar](50) NULL,
	[gpu] [nvarchar](50) NULL,
	[smps] [nvarchar](50) NULL,
	[ram] [nvarchar](50) NULL,
	[pcCase] [nvarchar](50) NULL,
	[storage1] [nvarchar](50) NULL,
	[storage2] [nvarchar](50) NULL,
	[wifiCard] [nvarchar](50) NULL,
	[wattage] [nvarchar](50) NULL,
	[image] [nvarchar](500) NULL,
	[isActive] [bit] NULL,
	[createAt] [datetime] NULL,
	[createBy] [nvarchar](50) NULL,
	[updateAt] [datetime] NULL,
	[updateBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_mst_PreBuiltPC] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[mst_PreBuiltPC] ON
INSERT [dbo].[mst_PreBuiltPC] ([id], [model], [brand], [details], [PCType], [in_stock], [price], [platform], [cpu], [motherboard], [cooler], [gpu], [smps], [ram], [pcCase], [storage1], [storage2], [wifiCard], [wattage], [image], [isActive], [createAt], [createBy], [updateAt], [updateBy]) VALUES (1, N'Freeman', N'Freeman', N'A system with some serious firepower and an abundance of sex appeal and - without the crazy price tag that comes with it. Whether you are a veteran gamer looking for a performance packed gaming rig, or if this is your first high performance gaming PC, it has everything you need, and then some. Say hello to the all new Freeman.', N'Gaming', N'5', N'121,444', N'Intel', N'Core i3-10100F upto 4.30 Ghz', N'Gigabyte - B460M DS3H AC Wifi', N'Stock - Stock Cooler  GPU', N'RTX 3060 - Gigabyte Gaming OC 12 GB', N'Antec - NE 550M Bronze', N'8x1 - Gskill Ripjaw 8GB 3000', N'Gigabyte - C200', N'Seagate - Barracuda 1TB', N'Kingston - 120 GB (A 400)', N'None - None', N'316 Watts', N'84fbgaming-pcjpg.png', 1, CAST(0x0000AD3801643B50 AS DateTime), N'Karan@123', CAST(0x0000AD40016E1E90 AS DateTime), N'Karan@123')
INSERT [dbo].[mst_PreBuiltPC] ([id], [model], [brand], [details], [PCType], [in_stock], [price], [platform], [cpu], [motherboard], [cooler], [gpu], [smps], [ram], [pcCase], [storage1], [storage2], [wifiCard], [wattage], [image], [isActive], [createAt], [createBy], [updateAt], [updateBy]) VALUES (3, N'Diablo', N'Diablo', N'Named after the legendary antagonist of the eponymous Diablo - the fire power this has to offer is second to none for the budget. RTX Check. Overclocking Check. Sleek and industrial design double check. You cant go wrong with this beast of a machine', N'Gaming', N'8', N'158,709', N'AMD', N'Ryzen5 - 5600X upto 4.60 Ghz', N'Gigabyte - B550 M DS3H AC', N'Lian Li - Galahad 240', N'RTX3060ti - GIGABYTE Eagle OC 8GB', N'Coolermaster - MWE V2 650W Bronze', N'8x2 - Corsair Veng 16GB 3200', N'Lian Li - Lancool 215', N'Seagate - Barracuda 1TB', N'Kingston - A2000 500GB Nvme', N'None - None', N'349 Watts', N'82f5diablo-gaming.png', 1, CAST(0x0000AD3C0157DF40 AS DateTime), N'Karan@123', CAST(0x0000AD3C0157DF40 AS DateTime), N'Karan@123')
INSERT [dbo].[mst_PreBuiltPC] ([id], [model], [brand], [details], [PCType], [in_stock], [price], [platform], [cpu], [motherboard], [cooler], [gpu], [smps], [ram], [pcCase], [storage1], [storage2], [wifiCard], [wattage], [image], [isActive], [createAt], [createBy], [updateAt], [updateBy]) VALUES (4, N'Juggernaut', N'Juggernaut', N'Juggernaut. The best of the best. Every single component may seem over powered or overkill - but is it really ? When you want to crank every bit of power for uncompromising performance this is the build to go for. The build specifically keeps in mind the need for future proofing, there is practically no game that you can throw at it which will make this sweat. Can it run Crysis though ? Yes. How does alt tabbing between three different AAA games sound ?', N'Gaming', N'2', N'467,109', N'Intel', N'Core i9-11900K upto 5.30 Ghz', N'Gigabyte - Z490 Vision D', N'Corsair - H150i Pro', N'RTX 3090 - GIGABYTE Gaming OC 24GB', N'Corsair - RM850XModular', N'16X1 - Gskill Ripjaw 16GB 3200', N'Corsair - 570X RGB', N'Seagate - Barracuda 4TB', N'Samsung - 1 TB (970 EVO Plus) M.2 NVME', N'None - None', N'459 Watts', N'770eJuggernaut-gaming.png', 1, CAST(0x0000AD3C0158F880 AS DateTime), N'Karan@123', CAST(0x0000000000000000 AS DateTime), N'')
INSERT [dbo].[mst_PreBuiltPC] ([id], [model], [brand], [details], [PCType], [in_stock], [price], [platform], [cpu], [motherboard], [cooler], [gpu], [smps], [ram], [pcCase], [storage1], [storage2], [wifiCard], [wattage], [image], [isActive], [createAt], [createBy], [updateAt], [updateBy]) VALUES (5, N'Tensor', N'Tensor', N'Tensor is a powered by dual NVidia RTX 3090 having the latest Threadripper 3 3960X designed for leading-edge AI development. This machine has flexibility to add another GPU and can support upto 128 Gigs of RAM', N'Research', N'1', N'829,429', N'AMD', N'Threadripper - 3960X Upto 4.5Ghz', N'Gigabyte - TRX40 Aorus Pro Wifi', N'CM - Master Liquid 360R TR4', N'SLI - RTX 3090 (2 nos.)', N'Corsair - AX1600i Platinum', N'16X1 - Corsair Veng 16GB 3000', N'TT - View 71', N'Seagate - Barracuda 4TB', N'Gigabyte - 1 TB Gen4 M.2 (GP-AG41TB)', N'None - None', N'1114 Watts', N'df6btensor-research.png', 1, CAST(0x0000AD3C015A11C0 AS DateTime), N'Karan@123', CAST(0x0000AD3C015A11C0 AS DateTime), N'Karan@123')
INSERT [dbo].[mst_PreBuiltPC] ([id], [model], [brand], [details], [PCType], [in_stock], [price], [platform], [cpu], [motherboard], [cooler], [gpu], [smps], [ram], [pcCase], [storage1], [storage2], [wifiCard], [wattage], [image], [isActive], [createAt], [createBy], [updateAt], [updateBy]) VALUES (6, N'Turing', N'Turing', N'Turing is specially designed for Deep Learning purpose which harnesses the power of dual RTX TITAN GPUs bringing 12 TFLOPs of single precision, 672GB/s of memory bandwidth and 24GB of memory per card. This is underpinned by AMD threadrippers flagship TRX 40 CPU platform which delivers the immense bandwidth required to harness the capabilities of the world’s fastest GPU configuration.', N'Research', N'2', N'911,920', N'AMD', N'Threadripper - 3970X Upto 4.5Ghz', N'MSI - TRX40 Creator', N'Corsair - H115i Pro', N'SLI - RTX 3090 (2 nos.)', N'Corsair - AX1600i Platinum', N'16X1 - Gskill Ripjaw 16GB 3200', N'TT - View 71', N'Seagate - Barracuda 4TB', N'Gigabyte - 1 TB Gen4 M.2 (GP-AG41TB)', N'None - None', N'1114 Watts', N'1ab6tensor-research.png', 1, CAST(0x0000AD3C015AE4B0 AS DateTime), N'Karan@123', CAST(0x0000000000000000 AS DateTime), N'')
INSERT [dbo].[mst_PreBuiltPC] ([id], [model], [brand], [details], [PCType], [in_stock], [price], [platform], [cpu], [motherboard], [cooler], [gpu], [smps], [ram], [pcCase], [storage1], [storage2], [wifiCard], [wattage], [image], [isActive], [createAt], [createBy], [updateAt], [updateBy]) VALUES (7, N'Raphael', N'Raphael', N'Designed for Photoshop, after effects - and some entry level 3d modelling for users in need of additional speed and performance. Raphael is fully customizable and upgradeable to tackle home video editing, graphic design, heavy multitasking, and so much more. Configure a machine that exceeds your expectations with this remarkably versatile desktop. And the best part - lifetime phone support comes standard.', N'Content Creation', N'2', N'69,238', N'Intel', N'Core i5-10400F upto 4.30 Ghz', N'Gigabyte - B460M DS3H AC Wifi', N'Stock - Stock Cooler', N'GTX1050Ti - Gigabyte 4GB', N'Coolermaster - MWE V2 550W Bronze', N'8x2 - Corsair Veng 16GB 3000', N'CM - K501L', N'Seagate - Barracuda 1TB', N'Kingston - 240 GB (A 400)', N'None - None', N'221 Watts', N'79caRaphael-content.png', 1, CAST(0x0000AD3C015C4440 AS DateTime), N'Karan@123', CAST(0x0000000000000000 AS DateTime), N'')
INSERT [dbo].[mst_PreBuiltPC] ([id], [model], [brand], [details], [PCType], [in_stock], [price], [platform], [cpu], [motherboard], [cooler], [gpu], [smps], [ram], [pcCase], [storage1], [storage2], [wifiCard], [wattage], [image], [isActive], [createAt], [createBy], [updateAt], [updateBy]) VALUES (8, N'Michelangelo', N'Michelangelo', N'Designed for professional-level workstation applications, the Michelangelo is perfect for multimedia creation, 4K video editing, 3D modeling, and CAD. Powering up with Intel I7-10700k having 32 GIGs of RAM and 1TB m.2 technology to faster the system boot to OS, program launch and faster file save.', N'Content Creation', N'2', N'199,293', N'Intel', N'Core i7-10700k upto 5.1 Ghz', N'Gigabyte - Z490 UD AC', N'CM - Master Liquid ML240R ARGB', N'RTX3060ti - MSI Gaming X Trio 8GB (Out Of Stock )', N'Corsair - CV 650 Bronze', N'8X4 - Gskill TridentZ RGB 16GB 3200', N'Cougar - Blazer Essence', N'Seagate - Barracuda 2TB', N'Kingston - A2000 1TB Nvme M.2', N'None - None', N'379 Watts', N'8f8eMichelangelo-content.png', 1, CAST(0x0000AD3C015D1730 AS DateTime), N'Karan@123', CAST(0x0000000000000000 AS DateTime), N'')
SET IDENTITY_INSERT [dbo].[mst_PreBuiltPC] OFF
/****** Object:  Table [dbo].[mst_PreBuilt_cart]    Script Date: 06/20/2021 07:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mst_PreBuilt_cart](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [nvarchar](50) NULL,
	[type] [nvarchar](50) NULL,
	[quantity] [nvarchar](50) NULL,
	[price] [nvarchar](50) NULL,
	[isActive] [bit] NULL,
	[createBy] [nvarchar](50) NULL,
	[createAt] [datetime] NULL,
	[updateBy] [nvarchar](50) NULL,
	[updateAt] [datetime] NULL,
 CONSTRAINT [PK_mst_cart] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mst_Platform]    Script Date: 06/20/2021 07:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mst_Platform](
	[pt_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[brand] [nvarchar](50) NULL,
	[createdBy] [nvarchar](50) NULL,
	[createAt] [datetime] NULL,
	[updateby] [nvarchar](50) NULL,
	[updateAt] [datetime] NULL,
	[isActive] [bit] NULL,
	[image] [nvarchar](50) NULL,
 CONSTRAINT [PK_mst_Platform] PRIMARY KEY CLUSTERED 
(
	[pt_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[mst_Platform] ON
INSERT [dbo].[mst_Platform] ([pt_id], [name], [brand], [createdBy], [createAt], [updateby], [updateAt], [isActive], [image]) VALUES (1, N'AMD', N'AMD', N'karan@123', CAST(0x0000AD150107F250 AS DateTime), N'karan@123', CAST(0x0000AD15010F5CC0 AS DateTime), 1, N'4873download (1).jpg')
INSERT [dbo].[mst_Platform] ([pt_id], [name], [brand], [createdBy], [createAt], [updateby], [updateAt], [isActive], [image]) VALUES (2, N'Intel', N'Intel', N'karan@123', CAST(0x0000AD1501163A90 AS DateTime), N'', CAST(0x0000000000000000 AS DateTime), 1, N'11cddownload.jpg')
SET IDENTITY_INSERT [dbo].[mst_Platform] OFF
/****** Object:  Table [dbo].[mst_motherboard]    Script Date: 06/20/2021 07:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mst_motherboard](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[model] [nvarchar](50) NULL,
	[brand] [nvarchar](50) NULL,
	[storage] [nvarchar](50) NULL,
	[price] [nvarchar](50) NULL,
	[in_stock] [nvarchar](50) NULL,
	[image] [nvarchar](500) NULL,
	[isActive] [bit] NULL,
	[createAt] [datetime] NULL,
	[createBy] [nvarchar](50) NULL,
	[updateAt] [datetime] NULL,
	[updateBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_mst_motherboard] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[mst_motherboard] ON
INSERT [dbo].[mst_motherboard] ([id], [model], [brand], [storage], [price], [in_stock], [image], [isActive], [createAt], [createBy], [updateAt], [updateBy]) VALUES (1, N'B550M AORUS', N'GIGABYTE', N'128', N'12000', N'6', N'019e71mq3U1iaPL._AC_SL1500_.jpg', 1, CAST(0x0000AD160136E9C0 AS DateTime), N'karan@123', CAST(0x0000AD250159CB70 AS DateTime), N'karan@123')
INSERT [dbo].[mst_motherboard] ([id], [model], [brand], [storage], [price], [in_stock], [image], [isActive], [createAt], [createBy], [updateAt], [updateBy]) VALUES (2, N'EX-A320M Gaming AMD Motherboard', N'ASUS', N'2', N'5,349', N'11', N'e9e471ktAXjFBAL._AC_SL1001_.jpg', 1, CAST(0x0000AD25015A5810 AS DateTime), N'karan@123', CAST(0x0000000000000000 AS DateTime), N'')
INSERT [dbo].[mst_motherboard] ([id], [model], [brand], [storage], [price], [in_stock], [image], [isActive], [createAt], [createBy], [updateAt], [updateBy]) VALUES (3, N'Prime A320M-K AM4 uATX', N'ASUS', N'32', N'4,390.00', N'15', N'30c5A1-6iwZmJ4L._AC_SL1500_.jpg', 1, CAST(0x0000AD25015AE4B0 AS DateTime), N'karan@123', CAST(0x0000000000000000 AS DateTime), N'')
SET IDENTITY_INSERT [dbo].[mst_motherboard] OFF
/****** Object:  Table [dbo].[mst_gpu]    Script Date: 06/20/2021 07:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mst_gpu](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[model] [nvarchar](50) NULL,
	[brand] [nvarchar](50) NULL,
	[ram_size] [nvarchar](50) NULL,
	[ram_type] [nvarchar](50) NULL,
	[interface] [nvarchar](50) NULL,
	[price] [nvarchar](50) NULL,
	[in_stock] [nvarchar](50) NULL,
	[image] [nvarchar](500) NULL,
	[isActive] [bit] NULL,
	[createAt] [datetime] NULL,
	[createBy] [nvarchar](50) NULL,
	[updateAt] [datetime] NULL,
	[updateBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_mst_gpu] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[mst_gpu] ON
INSERT [dbo].[mst_gpu] ([id], [model], [brand], [ram_size], [ram_type], [interface], [price], [in_stock], [image], [isActive], [createAt], [createBy], [updateAt], [updateBy]) VALUES (1, N'GeForce GT 710', N'ASUS', N'2', N'GDDR5', N'HDMI VGA DVI', N'3,599', N'9', N'79fbA1IbPGy732L._AC_SL1500_.jpg', 1, CAST(0x0000AD16014AB040 AS DateTime), N'karan@123', CAST(0x0000AD16014C0FD0 AS DateTime), N'karan@123')
INSERT [dbo].[mst_gpu] ([id], [model], [brand], [ram_size], [ram_type], [interface], [price], [in_stock], [image], [isActive], [createAt], [createBy], [updateAt], [updateBy]) VALUES (2, N'ZOTAC GT 730', N'GeForce', N'4', N'DDR3', N'PCI-E', N'6,998', N'2', N'89e381B4f41wzZL._AC_SL1500_.jpg', 1, CAST(0x0000AD25016208D0 AS DateTime), N'karan@123', CAST(0x0000000000000000 AS DateTime), N'')
INSERT [dbo].[mst_gpu] ([id], [model], [brand], [ram_size], [ram_type], [interface], [price], [in_stock], [image], [isActive], [createAt], [createBy], [updateAt], [updateBy]) VALUES (3, N'Zotac  GTX 1050 Ti OC Edition', N'GeForce', N'4', N'DDR3', N'PCI-E', N'15,399', N'3', N'c6368115eXWTcL_AC_SL1500_.jpg', 1, CAST(0x0000AD2501624F20 AS DateTime), N'karan@123', CAST(0x0000AD250162DBC0 AS DateTime), N'karan@123')
SET IDENTITY_INSERT [dbo].[mst_gpu] OFF
/****** Object:  Table [dbo].[mst_customPc_cart]    Script Date: 06/20/2021 07:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mst_customPc_cart](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [nvarchar](50) NULL,
	[type] [nvarchar](50) NULL,
	[quantity] [nvarchar](50) NULL,
	[price] [nvarchar](50) NULL,
	[isActive] [bit] NULL,
	[createBy] [nvarchar](50) NULL,
	[createAt] [datetime] NULL,
	[updateBy] [nvarchar](50) NULL,
	[updateAt] [datetime] NULL,
 CONSTRAINT [PK_mst_customPc_cart] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mst_cooler]    Script Date: 06/20/2021 07:49:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mst_cooler](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[model] [nvarchar](50) NULL,
	[brand] [nvarchar](50) NULL,
	[wattage] [nvarchar](50) NULL,
	[price] [nvarchar](50) NULL,
	[in_stock] [nvarchar](50) NULL,
	[image] [nvarchar](500) NULL,
	[isActive] [bit] NULL,
	[createAt] [datetime] NULL,
	[createBy] [nvarchar](50) NULL,
	[updateAt] [datetime] NULL,
	[updateBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_mst_cooler] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[mst_cooler] ON
INSERT [dbo].[mst_cooler] ([id], [model], [brand], [wattage], [price], [in_stock], [image], [isActive], [createAt], [createBy], [updateAt], [updateBy]) VALUES (1, N'Hyper 410R', N'Cooler Master', N'2.28', N'1,999', N'2', N'b76c51cboW32qDL._AC_SL1000_.jpg', 1, CAST(0x0000AD190146D7E0 AS DateTime), N'karan@123', CAST(0x0000AD1A013FB3C0 AS DateTime), N'karan@123')
SET IDENTITY_INSERT [dbo].[mst_cooler] OFF
/****** Object:  StoredProcedure [dbo].[getCartProductCount]    Script Date: 06/20/2021 07:49:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[getCartProductCount]
@UserName nvarchar(50)
as
begin
select (select COUNT(*)  from mst_product_cart where createby = @UserName)
+
(select COUNT(*)  from mst_PreBuilt_cart where createby = @UserName)
+
(select COUNT(*)  from mst_custompc_cart where createby = @UserName) as Cart_Data_Count
end
GO
/****** Object:  StoredProcedure [dbo].[AdminRecordCount]    Script Date: 06/20/2021 07:49:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[AdminRecordCount]
as
select (select count(id)  from mst_cooler) as cntCooler,
(select count(id)  from mst_gpu) as cntGPU,
(select count(id)  from mst_motherboard) as cntMotherBoard,
(select count(pt_id)  from mst_Platform) as cntPlatform,
(select count(id)  from mst_PreBuiltPC) as cntPreBuiltPC,
(select count(id)  from mst_processor) as cntProcessor,
(select count(id)  from mst_products) as cntProducts,
(select count(ram_id)  from mst_ram) as cntRam,
(select count(id)  from mst_smps) as cntSMPS,
(select count(id)  from mst_storage) as cntStorage,
(select count(id)  from mst_WiFiCard) as cntWiFI,
(select count(user_id)  from USER_MASTER) as cntUsers
GO
