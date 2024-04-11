USE [KursBd]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 11.04.2024 9:59:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[CartId] [int] IDENTITY(1,1) NOT NULL,
	[ClientId] [int] NOT NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[CartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart_Products]    Script Date: 11.04.2024 9:59:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart_Products](
	[Cart_Product_Id] [int] IDENTITY(1,1) NOT NULL,
	[CartId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[ProductAmountInCart] [int] NOT NULL,
 CONSTRAINT [PK_Cart_Products] PRIMARY KEY CLUSTERED 
(
	[Cart_Product_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 11.04.2024 9:59:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Product]    Script Date: 11.04.2024 9:59:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Product](
	[Order_Product_Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
 CONSTRAINT [PK_Order_Product] PRIMARY KEY CLUSTERED 
(
	[Order_Product_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 11.04.2024 9:59:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[OrderClient] [int] NOT NULL,
	[OrderStatus] [int] NOT NULL,
	[OrderCreateDate] [date] NOT NULL,
	[OrderPrice] [int] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderStatuses]    Script Date: 11.04.2024 9:59:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderStatuses](
	[StatusId] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_OrderStatuses] PRIMARY KEY CLUSTERED 
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 11.04.2024 9:59:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [varchar](50) NOT NULL,
	[ProductDescription] [text] NOT NULL,
	[ProductPrice] [varchar](50) NOT NULL,
	[ProductAmount] [varchar](50) NOT NULL,
	[ProductCategory] [int] NOT NULL,
	[ProductImage] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 11.04.2024 9:59:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 11.04.2024 9:59:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[UserSurname] [varchar](50) NOT NULL,
	[UserPatronimyc] [varchar](50) NULL,
	[UserEMail] [varchar](50) NOT NULL,
	[UserPassword] [varchar](50) NOT NULL,
	[UserRole] [int] NOT NULL,
	[UserLogin] [varchar](50) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cart] ON 

INSERT [dbo].[Cart] ([CartId], [ClientId]) VALUES (6, 2)
SET IDENTITY_INSERT [dbo].[Cart] OFF
GO
SET IDENTITY_INSERT [dbo].[Cart_Products] ON 

INSERT [dbo].[Cart_Products] ([Cart_Product_Id], [CartId], [ProductId], [ProductAmountInCart]) VALUES (1, 6, 1, 1)
INSERT [dbo].[Cart_Products] ([Cart_Product_Id], [CartId], [ProductId], [ProductAmountInCart]) VALUES (2, 6, 5, 1)
SET IDENTITY_INSERT [dbo].[Cart_Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (1, N'Готовая сборка')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (2, N'Материские платы')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (3, N'Оперативная память')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (4, N'Видеокарты')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (5, N'Накопители')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (6, N'Процессоры')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (7, N'Блоки питания')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (8, N'Охлаждение')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Order_Product] ON 

INSERT [dbo].[Order_Product] ([Order_Product_Id], [OrderId], [ProductId]) VALUES (1, 2, 1)
INSERT [dbo].[Order_Product] ([Order_Product_Id], [OrderId], [ProductId]) VALUES (2, 2, 5)
SET IDENTITY_INSERT [dbo].[Order_Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderId], [OrderClient], [OrderStatus], [OrderCreateDate], [OrderPrice]) VALUES (2, 3, 1, CAST(N'2023-03-18' AS Date), 39998)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderStatuses] ON 

INSERT [dbo].[OrderStatuses] ([StatusId], [StatusName]) VALUES (1, N'В обработке')
INSERT [dbo].[OrderStatuses] ([StatusId], [StatusName]) VALUES (2, N'В пути')
INSERT [dbo].[OrderStatuses] ([StatusId], [StatusName]) VALUES (3, N'Доставлен')
SET IDENTITY_INSERT [dbo].[OrderStatuses] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [ProductPrice], [ProductAmount], [ProductCategory], [ProductImage]) VALUES (1, N'Процессор AMD Ryzen 7 3700X', N'Процессор AMD Ryzen 7 3700X OEM отличается высокой мощностью и производительностью, что позволит использовать его для оснащения игровых компьютеров. Выполненный на основе 7-нм техпроцесса, чип имеет 8 ядер Matisse. Они обрабатывают данные в 16 потоков, благодаря чему поддерживается высокая скорость при решении рабочих задач и выполнении действий в играх. Частота процессора варьируется в зависимости от нагрузки в пределах 3.6-4.4 ГГц. Свободный множитель позволит еще увеличить данный показатель.
К процессору AMD Ryzen 7 3700X OEM можно подключать оперативную память формата DDR4, которая обладает объемом 128 ГБ и рабочей частотой 3200 МГц. Контроллер PCI-E 4.0 обеспечивает быстрый обмен данными между процессором и подключенными модулями. Поддерживаемая технология виртуализации позволяет оптимизировать мощность процессора, используя эмуляторы разных операционных систем и игр. Тепловыделение на уровне 65 Вт предусматривает применение стандартной системы охлаждения.', N'17999', N'100', 6, N'/Images/ryzen53700X.png')
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [ProductPrice], [ProductAmount], [ProductCategory], [ProductImage]) VALUES (2, N'Процессор Intel Core i7-11700F', N'Процессор Intel Core i7-11700F OEM 11-го поколения предназначен для настольных компьютеров. Он оснащен 8 ядрами и 16 потоками, с тактовой частотой от 2.5 ГГц до 4.9 ГГц в режиме Turbo Boost. Он базируется на архитектуре Intel Rocket Lake, которая предполагает улучшенную производительность и энергоэффективность в сравнении с предыдущими поколениями.
Intel Core i7-11700F OEM поддерживает технологии Hyper-Threading, Turbo Boost 2.0 и Turbo Boost Max 3.0, что обеспечивает эффективность при выполнении многозадачных операций и работе «требовательных» к ресурсу приложений. Он также поддерживает память DDR4-3200 и имеет 16 МБ кэш L3.', N'21999', N'90', 6, N'/Images/i711700F.jpg')
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [ProductPrice], [ProductAmount], [ProductCategory], [ProductImage]) VALUES (3, N'Процессор Intel Core i3-12100', N'Процессор Intel Core i3-12100 OEM предназначен для использования в настольных компьютерах. Он основан на архитектуре Intel Core 12-го поколения (Alder Lake-S) и имеет 4 ядра и 8 потоков. Базовая тактовая частота составляет 3.3 ГГц с возможностью повышения до 4.3 ГГц в режиме Turbo Boost.
Процессор поддерживает оперативную память вплоть до уровня DDR5 с частотой до 4.8 ГГц и имеет 12 МБ кэш L3. Он также обладает интегрированным графическим ядром Intel UHD Graphics 730. Все это делает Intel Core i3-12100 OEM оптимальным выбором для решения повседневных задач, таких как веб-серфинг, просмотр видео, работа с офисными приложениями и «легкие» игры.', N'12299', N'50', 6, N'/Images/i312100.jpg')
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [ProductPrice], [ProductAmount], [ProductCategory], [ProductImage]) VALUES (4, N'Процессор AMD Ryzen 3 3200G', N'Процессор AMD Ryzen 3 3200G BOX сделает офисный или домашний компьютер производительным и удобным для работы и развлечений. К нему прилагается система охлаждения, которая обеспечивает стабильность выполнения всех процессов при высоких нагрузках. 4-ядерная архитектура основана на техпроцессе GlobalFoundries 12LP, что увеличивает частотный потенциал и сокращает энергопотребление чипа. Базовая частота может повышаться автоматически с 3.6 до 4 ГГц. Для увеличения производительности в процессоре предусмотрена кэш-память 2 и 3 уровня.
Процессор AMD Ryzen 3 3200G BOX эффективно взаимодействует с модулями оперативной памяти DDR4 общим объемом 64 ГБ. Наличие встроенного графического ядра AMD Radeon Vega 8 позволяет обойтись без установки дополнительной видеокарты. 8-линейный контроллер PCI-E 3.0 обеспечивает стабильность и высокую скорость обмена данными между процессором и подключенными устройствами. Технология виртуализации позволит использовать разные операционные системы без их переустановки.', N'9999', N'150', 6, N'/Images/ryzen33200G.jpg')
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [ProductPrice], [ProductAmount], [ProductCategory], [ProductImage]) VALUES (5, N'Материнская плата GIGABYTE B650M GAMING X AX', N'Материнская плата GIGABYTE B650M GAMING X AX из игровой серии создана для обеспечения мощного вычислительного потенциала при запуске требовательных компьютерных игр. Она выполнена в компактном типоразмере Micro-ATX и подходит для использования в ограниченном пространстве. В плате реализованы 4 слота под установку до 192 ГБ оперативной памяти стандарта DDR5, слоты расширения PCI-E x16 и PCI-E x1 для графического адаптера, 2 разъема M.2 и 4 слота SATA для накопителей.
GIGABYTE B650M GAMING X AX оснащена сетевым адаптером со скоростью 2.5 Гбит/с и интегрированным модулем с поддержкой стандартов Wi-Fi/Bluetooth. С боковой стороны предусмотрено множество разъемов: USB, HDMI, LAN, аудио. Плата выделяется массивными охлаждающими радиаторами и светодиодной подсветкой.', N'21999', N'160', 2, N'/Images/gigabyteB650MGAMINGXAX.png')
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [ProductPrice], [ProductAmount], [ProductCategory], [ProductImage]) VALUES (6, N'Материнская плата DEXP B450M-HDV/DX', N'Материнская плата DEXP B450M-HDV/DX с компактными размерами 230x210 мм позволяет подсоединить производительные компоненты для работы с приложениями и запуска мультимедийного контента. Она поддерживает до 64 ГБ оперативной памяти с помощью двух слотов DDR4. Для установки процессора AMD есть сокет AM4. Дискретный графический адаптер можно задействовать с помощью слотов PCI-E x16 и PCI-E x1. Стандарт NVMe предоставляет возможность подключения твердотельного накопителя.
Встроенный контроллер Realtek RTL8111H обеспечивает доступ к Интернету со скоростью 1 Гбит/с. Адаптер Realtek ALC887/897 и аудиоконденсаторы ELNA позволяют воспроизводить звук без искажений. Благодаря протестированной элементной базе и системе питания 6 фаз плата DEXP B450M-HDV/DX гарантирует стабильную работу.Материнская плата DEXP B450M-HDV/DX с компактными размерами 230x210 мм позволяет подсоединить производительные компоненты для работы с приложениями и запуска мультимедийного контента. Она поддерживает до 64 ГБ оперативной памяти с помощью двух слотов DDR4. Для установки процессора AMD есть сокет AM4. Дискретный графический адаптер можно задействовать с помощью слотов PCI-E x16 и PCI-E x1. Стандарт NVMe предоставляет возможность подключения твердотельного накопителя.
Встроенный контроллер Realtek RTL8111H обеспечивает доступ к Интернету со скоростью 1 Гбит/с. Адаптер Realtek ALC887/897 и аудиоконденсаторы ELNA позволяют воспроизводить звук без искажений. Благодаря протестированной элементной базе и системе питания 6 фаз плата DEXP B450M-HDV/DX гарантирует стабильную работу.', N'5699', N'75', 2, N'/Images/dexpB450MHDVDX.jpg')
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [ProductPrice], [ProductAmount], [ProductCategory], [ProductImage]) VALUES (7, N'Материнская плата MSI PRO B760M-P DDR4', N'Материнская плата MSI PRO B760M-P DDR4 – производительная и надежная основа для сборки профессиональной рабочей станции. Она выполнена в компактном форм-факторе и поддерживает работу с процессором Intel Core 12/13/14-го поколения. Модель отличается наличием 4 модулей DIMM DDR4, 1 слотом расширения PCI-E x16, 2 разъемами M.2 и 4 слотами SATA.
MSI PRO B760M-P оборудована сетевым адаптером со скоростью 1 Гбит/с для соединения с Интернетом. Качественная элементная база с протестированными компонентами гарантирует исключительную надежность. С помощью фирменного ПО можно осуществлять мониторинг и управлять параметрами ПК.', N'10399', N'75', 2, N'/Images/msiPROB760MPDDR4.jpg')
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [ProductPrice], [ProductAmount], [ProductCategory], [ProductImage]) VALUES (8, N'Материнская плата MSI PRO H510M-B', N'Материнская плата MSI PRO H510M-B из профессиональной серии обеспечивает высокую производительность и надежность. Она предназначена для сборки рабочих станций и домашних ПК универсального назначения. Плата выполнена в компактном форм-факторе Micro-ATX и поддерживает работу с процессором Intel (LGA 1200). Функционал модели предусматривает установку максимум двух модулей DDR4, графического адаптера в один слот расширения PCI-E x16, накопителей с помощью 1 разъема M.2 и 4 слотов SATA.
MSI PRO H510M-B оборудована сетевым адаптером со скоростью 1 Гбит/с и проводными интерфейсами для подключения различных периферийных устройств. Надежная элементная база с протестированными компонентами гарантирует исключительную стабильность. Фирменные утилиты помогают контролировать параметры и осуществлять их настройку.', N'5799', N'50', 2, N'/Images/msiPROH510MB.jpg')
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleId], [RoleName]) VALUES (1, N'Администратор')
INSERT [dbo].[Roles] ([RoleId], [RoleName]) VALUES (2, N'Клиент')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserId], [UserName], [UserSurname], [UserPatronimyc], [UserEMail], [UserPassword], [UserRole], [UserLogin]) VALUES (1, N'Иван', N'Иванович', N'Иванов', N'admin@comp.shop', N'root', 1, N'Root')
INSERT [dbo].[Users] ([UserId], [UserName], [UserSurname], [UserPatronimyc], [UserEMail], [UserPassword], [UserRole], [UserLogin]) VALUES (2, N'Эмир', N'Волков', N'Степанович', N'doghome@gmail.com', N'dog12345', 2, N'doglover')
INSERT [dbo].[Users] ([UserId], [UserName], [UserSurname], [UserPatronimyc], [UserEMail], [UserPassword], [UserRole], [UserLogin]) VALUES (3, N'Даниил', N'Фролов', N'Глебович', N'zauteivafouwe-1365@yopmail.com', N'XezyhoYufKpECGVL', 2, N'sporesanimalists')
INSERT [dbo].[Users] ([UserId], [UserName], [UserSurname], [UserPatronimyc], [UserEMail], [UserPassword], [UserRole], [UserLogin]) VALUES (4, N'Пётр', N'Алексеев', N'Иванович', N'jipraucrounoddou-3508@yopmail.com', N'ZCeBHEidGMuKGuwV', 2, N'hyssopjettisoned')
INSERT [dbo].[Users] ([UserId], [UserName], [UserSurname], [UserPatronimyc], [UserEMail], [UserPassword], [UserRole], [UserLogin]) VALUES (5, N'Иван', N'Соколов', N'Тимофеевич', N'veitrourizori-4218@yopmail.com', N'haGWrznSrHhEbwIG', 2, N'largenhighwaymen')
INSERT [dbo].[Users] ([UserId], [UserName], [UserSurname], [UserPatronimyc], [UserEMail], [UserPassword], [UserRole], [UserLogin]) VALUES (6, N'Тимур', N'Волков', N'Андреевич', N'beimmonauhusu-7680@yopmail.com', N'GSicSjkeHXtgwRma', 2, N'gagmandecolorant')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Users1] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Users1]
GO
ALTER TABLE [dbo].[Cart_Products]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Products_Cart] FOREIGN KEY([CartId])
REFERENCES [dbo].[Cart] ([CartId])
GO
ALTER TABLE [dbo].[Cart_Products] CHECK CONSTRAINT [FK_Cart_Products_Cart]
GO
ALTER TABLE [dbo].[Cart_Products]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Products_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[Cart_Products] CHECK CONSTRAINT [FK_Cart_Products_Products]
GO
ALTER TABLE [dbo].[Order_Product]  WITH CHECK ADD  CONSTRAINT [FK_Order_Product_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderId])
GO
ALTER TABLE [dbo].[Order_Product] CHECK CONSTRAINT [FK_Order_Product_Orders]
GO
ALTER TABLE [dbo].[Order_Product]  WITH CHECK ADD  CONSTRAINT [FK_Order_Product_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[Order_Product] CHECK CONSTRAINT [FK_Order_Product_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_OrderStatuses] FOREIGN KEY([OrderStatus])
REFERENCES [dbo].[OrderStatuses] ([StatusId])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_OrderStatuses]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users] FOREIGN KEY([OrderClient])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([ProductCategory])
REFERENCES [dbo].[Categories] ([CategoryId])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([UserRole])
REFERENCES [dbo].[Roles] ([RoleId])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
