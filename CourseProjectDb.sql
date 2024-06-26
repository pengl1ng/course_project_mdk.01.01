USE [KursBd]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 22.05.2024 15:49:02 ******/
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
/****** Object:  Table [dbo].[Cart_Products]    Script Date: 22.05.2024 15:49:02 ******/
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
/****** Object:  Table [dbo].[Categories]    Script Date: 22.05.2024 15:49:02 ******/
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
/****** Object:  Table [dbo].[Order_Product]    Script Date: 22.05.2024 15:49:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Product](
	[Order_Product_Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[ProductAmount] [int] NOT NULL,
 CONSTRAINT [PK_Order_Product] PRIMARY KEY CLUSTERED 
(
	[Order_Product_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 22.05.2024 15:49:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[OrderClient] [int] NOT NULL,
	[OrderStatus] [int] NOT NULL,
	[OrderCreateDate] [date] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderStatuses]    Script Date: 22.05.2024 15:49:02 ******/
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
/****** Object:  Table [dbo].[Products]    Script Date: 22.05.2024 15:49:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [varchar](150) NOT NULL,
	[ProductDescription] [text] NOT NULL,
	[ProductPrice] [int] NOT NULL,
	[ProductAmount] [int] NOT NULL,
	[ProductCategory] [int] NOT NULL,
	[ProductImage] [varchar](50) NOT NULL,
	[ProductManufacturer] [varchar](50) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 22.05.2024 15:49:02 ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 22.05.2024 15:49:02 ******/
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
	[UserLogin] [varchar](50) NOT NULL,
	[UserPassword] [varchar](50) NOT NULL,
	[UserRole] [int] NOT NULL,
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

INSERT [dbo].[Cart_Products] ([Cart_Product_Id], [CartId], [ProductId], [ProductAmountInCart]) VALUES (1, 6, 1, 4)
INSERT [dbo].[Cart_Products] ([Cart_Product_Id], [CartId], [ProductId], [ProductAmountInCart]) VALUES (2, 6, 5, 5)
INSERT [dbo].[Cart_Products] ([Cart_Product_Id], [CartId], [ProductId], [ProductAmountInCart]) VALUES (3, 6, 2, 8)
INSERT [dbo].[Cart_Products] ([Cart_Product_Id], [CartId], [ProductId], [ProductAmountInCart]) VALUES (4, 6, 4, 13)
INSERT [dbo].[Cart_Products] ([Cart_Product_Id], [CartId], [ProductId], [ProductAmountInCart]) VALUES (5, 6, 6, 6)
INSERT [dbo].[Cart_Products] ([Cart_Product_Id], [CartId], [ProductId], [ProductAmountInCart]) VALUES (6, 6, 7, 2)
INSERT [dbo].[Cart_Products] ([Cart_Product_Id], [CartId], [ProductId], [ProductAmountInCart]) VALUES (7, 6, 8, 1)
INSERT [dbo].[Cart_Products] ([Cart_Product_Id], [CartId], [ProductId], [ProductAmountInCart]) VALUES (8, 6, 13, 1)
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

INSERT [dbo].[Order_Product] ([Order_Product_Id], [OrderId], [ProductId], [ProductAmount]) VALUES (1, 2, 1, 1)
INSERT [dbo].[Order_Product] ([Order_Product_Id], [OrderId], [ProductId], [ProductAmount]) VALUES (2, 2, 5, 1)
SET IDENTITY_INSERT [dbo].[Order_Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderId], [OrderClient], [OrderStatus], [OrderCreateDate]) VALUES (2, 2, 1, CAST(N'2023-03-18' AS Date))
INSERT [dbo].[Orders] ([OrderId], [OrderClient], [OrderStatus], [OrderCreateDate]) VALUES (3, 2, 1, CAST(N'2024-05-22' AS Date))
INSERT [dbo].[Orders] ([OrderId], [OrderClient], [OrderStatus], [OrderCreateDate]) VALUES (4, 2, 1, CAST(N'2024-05-22' AS Date))
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderStatuses] ON 

INSERT [dbo].[OrderStatuses] ([StatusId], [StatusName]) VALUES (1, N'В обработке')
INSERT [dbo].[OrderStatuses] ([StatusId], [StatusName]) VALUES (2, N'В пути')
INSERT [dbo].[OrderStatuses] ([StatusId], [StatusName]) VALUES (3, N'Доставлен')
SET IDENTITY_INSERT [dbo].[OrderStatuses] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [ProductPrice], [ProductAmount], [ProductCategory], [ProductImage], [ProductManufacturer]) VALUES (1, N'Процессор AMD Ryzen 7 3700X', N'Процессор AMD Ryzen 7 3700X OEM отличается высокой мощностью и производительностью, что позволит использовать его для оснащения игровых компьютеров. Выполненный на основе 7-нм техпроцесса, чип имеет 8 ядер Matisse. Они обрабатывают данные в 16 потоков, благодаря чему поддерживается высокая скорость при решении рабочих задач и выполнении действий в играх. Частота процессора варьируется в зависимости от нагрузки в пределах 3.6-4.4 ГГц. Свободный множитель позволит еще увеличить данный показатель.
К процессору AMD Ryzen 7 3700X OEM можно подключать оперативную память формата DDR4, которая обладает объемом 128 ГБ и рабочей частотой 3200 МГц. Контроллер PCI-E 4.0 обеспечивает быстрый обмен данными между процессором и подключенными модулями. Поддерживаемая технология виртуализации позволяет оптимизировать мощность процессора, используя эмуляторы разных операционных систем и игр. Тепловыделение на уровне 65 Вт предусматривает применение стандартной системы охлаждения.', 17999, 100, 6, N'/Images/ryzen53700X.png', N'AMD')
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [ProductPrice], [ProductAmount], [ProductCategory], [ProductImage], [ProductManufacturer]) VALUES (2, N'Процессор Intel Core i7-11700F', N'Процессор Intel Core i7-11700F OEM 11-го поколения предназначен для настольных компьютеров. Он оснащен 8 ядрами и 16 потоками, с тактовой частотой от 2.5 ГГц до 4.9 ГГц в режиме Turbo Boost. Он базируется на архитектуре Intel Rocket Lake, которая предполагает улучшенную производительность и энергоэффективность в сравнении с предыдущими поколениями.
Intel Core i7-11700F OEM поддерживает технологии Hyper-Threading, Turbo Boost 2.0 и Turbo Boost Max 3.0, что обеспечивает эффективность при выполнении многозадачных операций и работе «требовательных» к ресурсу приложений. Он также поддерживает память DDR4-3200 и имеет 16 МБ кэш L3.', 21999, 90, 6, N'/Images/i711700F.jpg', N'Intel')
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [ProductPrice], [ProductAmount], [ProductCategory], [ProductImage], [ProductManufacturer]) VALUES (3, N'Процессор Intel Core i3-12100', N'Процессор Intel Core i3-12100 OEM предназначен для использования в настольных компьютерах. Он основан на архитектуре Intel Core 12-го поколения (Alder Lake-S) и имеет 4 ядра и 8 потоков. Базовая тактовая частота составляет 3.3 ГГц с возможностью повышения до 4.3 ГГц в режиме Turbo Boost.
Процессор поддерживает оперативную память вплоть до уровня DDR5 с частотой до 4.8 ГГц и имеет 12 МБ кэш L3. Он также обладает интегрированным графическим ядром Intel UHD Graphics 730. Все это делает Intel Core i3-12100 OEM оптимальным выбором для решения повседневных задач, таких как веб-серфинг, просмотр видео, работа с офисными приложениями и «легкие» игры.', 12299, 50, 6, N'/Images/i312100.jpg', N'Intel')
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [ProductPrice], [ProductAmount], [ProductCategory], [ProductImage], [ProductManufacturer]) VALUES (4, N'Процессор AMD Ryzen 3 3200G', N'Процессор AMD Ryzen 3 3200G BOX сделает офисный или домашний компьютер производительным и удобным для работы и развлечений. К нему прилагается система охлаждения, которая обеспечивает стабильность выполнения всех процессов при высоких нагрузках. 4-ядерная архитектура основана на техпроцессе GlobalFoundries 12LP, что увеличивает частотный потенциал и сокращает энергопотребление чипа. Базовая частота может повышаться автоматически с 3.6 до 4 ГГц. Для увеличения производительности в процессоре предусмотрена кэш-память 2 и 3 уровня.
Процессор AMD Ryzen 3 3200G BOX эффективно взаимодействует с модулями оперативной памяти DDR4 общим объемом 64 ГБ. Наличие встроенного графического ядра AMD Radeon Vega 8 позволяет обойтись без установки дополнительной видеокарты. 8-линейный контроллер PCI-E 3.0 обеспечивает стабильность и высокую скорость обмена данными между процессором и подключенными устройствами. Технология виртуализации позволит использовать разные операционные системы без их переустановки.', 9999, 150, 6, N'/Images/ryzen33200G.jpg', N'AMD')
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [ProductPrice], [ProductAmount], [ProductCategory], [ProductImage], [ProductManufacturer]) VALUES (5, N'Материнская плата GIGABYTE B650M GAMING X AX', N'Материнская плата GIGABYTE B650M GAMING X AX из игровой серии создана для обеспечения мощного вычислительного потенциала при запуске требовательных компьютерных игр. Она выполнена в компактном типоразмере Micro-ATX и подходит для использования в ограниченном пространстве. В плате реализованы 4 слота под установку до 192 ГБ оперативной памяти стандарта DDR5, слоты расширения PCI-E x16 и PCI-E x1 для графического адаптера, 2 разъема M.2 и 4 слота SATA для накопителей.
GIGABYTE B650M GAMING X AX оснащена сетевым адаптером со скоростью 2.5 Гбит/с и интегрированным модулем с поддержкой стандартов Wi-Fi/Bluetooth. С боковой стороны предусмотрено множество разъемов: USB, HDMI, LAN, аудио. Плата выделяется массивными охлаждающими радиаторами и светодиодной подсветкой.', 21999, 160, 2, N'/Images/gigabyteB650MGAMINGXAX.png', N'Gigabyte')
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [ProductPrice], [ProductAmount], [ProductCategory], [ProductImage], [ProductManufacturer]) VALUES (6, N'Материнская плата DEXP B450M-HDV/DX', N'Материнская плата DEXP B450M-HDV/DX с компактными размерами 230x210 мм позволяет подсоединить производительные компоненты для работы с приложениями и запуска мультимедийного контента. Она поддерживает до 64 ГБ оперативной памяти с помощью двух слотов DDR4. Для установки процессора AMD есть сокет AM4. Дискретный графический адаптер можно задействовать с помощью слотов PCI-E x16 и PCI-E x1. Стандарт NVMe предоставляет возможность подключения твердотельного накопителя.
Встроенный контроллер Realtek RTL8111H обеспечивает доступ к Интернету со скоростью 1 Гбит/с. Адаптер Realtek ALC887/897 и аудиоконденсаторы ELNA позволяют воспроизводить звук без искажений. Благодаря протестированной элементной базе и системе питания 6 фаз плата DEXP B450M-HDV/DX гарантирует стабильную работу.Материнская плата DEXP B450M-HDV/DX с компактными размерами 230x210 мм позволяет подсоединить производительные компоненты для работы с приложениями и запуска мультимедийного контента. Она поддерживает до 64 ГБ оперативной памяти с помощью двух слотов DDR4. Для установки процессора AMD есть сокет AM4. Дискретный графический адаптер можно задействовать с помощью слотов PCI-E x16 и PCI-E x1. Стандарт NVMe предоставляет возможность подключения твердотельного накопителя.
Встроенный контроллер Realtek RTL8111H обеспечивает доступ к Интернету со скоростью 1 Гбит/с. Адаптер Realtek ALC887/897 и аудиоконденсаторы ELNA позволяют воспроизводить звук без искажений. Благодаря протестированной элементной базе и системе питания 6 фаз плата DEXP B450M-HDV/DX гарантирует стабильную работу.', 5699, 75, 2, N'/Images/dexpB450MHDVDX.jpg', N'DEXP')
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [ProductPrice], [ProductAmount], [ProductCategory], [ProductImage], [ProductManufacturer]) VALUES (7, N'Материнская плата MSI PRO B760M-P DDR4', N'Материнская плата MSI PRO B760M-P DDR4 – производительная и надежная основа для сборки профессиональной рабочей станции. Она выполнена в компактном форм-факторе и поддерживает работу с процессором Intel Core 12/13/14-го поколения. Модель отличается наличием 4 модулей DIMM DDR4, 1 слотом расширения PCI-E x16, 2 разъемами M.2 и 4 слотами SATA.
MSI PRO B760M-P оборудована сетевым адаптером со скоростью 1 Гбит/с для соединения с Интернетом. Качественная элементная база с протестированными компонентами гарантирует исключительную надежность. С помощью фирменного ПО можно осуществлять мониторинг и управлять параметрами ПК.', 10399, 75, 2, N'/Images/msiPROB760MPDDR4.jpg', N'MSI')
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [ProductPrice], [ProductAmount], [ProductCategory], [ProductImage], [ProductManufacturer]) VALUES (8, N'Материнская плата MSI PRO H510M-B', N'Материнская плата MSI PRO H510M-B из профессиональной серии обеспечивает высокую производительность и надежность. Она предназначена для сборки рабочих станций и домашних ПК универсального назначения. Плата выполнена в компактном форм-факторе Micro-ATX и поддерживает работу с процессором Intel (LGA 1200). Функционал модели предусматривает установку максимум двух модулей DDR4, графического адаптера в один слот расширения PCI-E x16, накопителей с помощью 1 разъема M.2 и 4 слотов SATA.
MSI PRO H510M-B оборудована сетевым адаптером со скоростью 1 Гбит/с и проводными интерфейсами для подключения различных периферийных устройств. Надежная элементная база с протестированными компонентами гарантирует исключительную стабильность. Фирменные утилиты помогают контролировать параметры и осуществлять их настройку.', 5799, 50, 2, N'/Images/msiPROH510MB.jpg', N'MSI')
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [ProductPrice], [ProductAmount], [ProductCategory], [ProductImage], [ProductManufacturer]) VALUES (13, N'Видеокарта ASRock AMD Radeon RX 6500 XT Phantom Gaming D OC', N'Видеокарта ASRock AMD Radeon RX 6500 XT Phantom Gaming D OC с архитектурой AMD RDNA 2 является производительным и надежным решением для использования в составе геймерских ПК. Графический процессор работает на частоте в пределах 2820 МГц в режиме разгона, обеспечивая плавность и стабильность воспроизведения графики в играх. Данная модель оснащена 4 ГБ памяти стандарта GDDR6. Для подключения к мониторам предлагаются по одному разъему DisplayPort и HDMI. Активная система охлаждения с двумя вентиляторами быстро отводит тепло от внутренних компонентов, помогая предотвратить перегрев ASRock Phantom Gaming D OC при продолжительных нагрузках.Видеокарта ASRock AMD Radeon RX 6500 XT Phantom Gaming D OC с архитектурой AMD RDNA 2 является производительным и надежным решением для использования в составе геймерских ПК. Графический процессор работает на частоте в пределах 2820 МГц в режиме разгона, обеспечивая плавность и стабильность воспроизведения графики в играх. Данная модель оснащена 4 ГБ памяти стандарта GDDR6. Для подключения к мониторам предлагаются по одному разъему DisplayPort и HDMI. Активная система охлаждения с двумя вентиляторами быстро отводит тепло от внутренних компонентов, помогая предотвратить перегрев ASRock Phantom Gaming D OC при продолжительных нагрузках.', 18299, 200, 4, N'/Images/radeonrx6500xt.jpg', N'ASRock')
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [ProductPrice], [ProductAmount], [ProductCategory], [ProductImage], [ProductManufacturer]) VALUES (14, N'Видеокарта ZOTAC GAMING GeForce GTX-1650 AMP Core', N'Видеокарта ZOTAC GAMING GeForce GTX 1650 AMP Core – модель от всемирно известного производителя высокотехнологичных компьютерных комплектующих. Видеокарта предназначена для монтажа в системные блоки, преимущественно используемые для игр. Несмотря на высокий уровень производительности, устройство компактно: длина видеоадаптера равна лишь 162.4 мм. Величина этого параметра свидетельствует об увеличении свободы выбора корпуса для сборки системы.', 18299, 500, 4, N'/Images/zotacgtx1650.jpg', N'Zotac')
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [ProductPrice], [ProductAmount], [ProductCategory], [ProductImage], [ProductManufacturer]) VALUES (15, N'Видеокарта MSI Geforce RTX 3050 LP OC ', N'Видеокарта MSI Geforce RTX 3050 LP OC позволяет усовершенствовать игровую систему. Используя видеочип с микроархитектурой NVIDIA Ampere, этот компонент обеспечивает прирост производительности благодаря памяти GDDR6 объемом 6 ГБ, улучшенным вычислительным блокам. Среди них потоковые мультипроцессоры, тензоные ядра, RT-ядра. Работая на штатной частоте 1042 МГц, видеочип поддерживает разгон до показателя 1492 МГц в режиме турбочастоты.
Подключается видеокарта MSI Geforce RTX 3050 LP OC через слот расширения PCI-E 4.0. Низкопрофильная система охлаждения предусматривает наличие двух вентиляторов. Благодаря усиленному статическому давлению вентиляторы повышают эффективность охлаждения. Для защиты обратной стороны видеокарты используется прочная шлифованная пластина. Видеоразъемы DisplayPort и 2x HDMI обеспечивают подключение видеокарты к мониторам. Вы можете одновременно работать с 3 мониторами с поддержкой разрешения Ultra HD 8K (7680x4320).Видеокарта MSI Geforce RTX 3050 LP OC позволяет усовершенствовать игровую систему. Используя видеочип с микроархитектурой NVIDIA Ampere, этот компонент обеспечивает прирост производительности благодаря памяти GDDR6 объемом 6 ГБ, улучшенным вычислительным блокам. Среди них потоковые мультипроцессоры, тензоные ядра, RT-ядра. Работая на штатной частоте 1042 МГц, видеочип поддерживает разгон до показателя 1492 МГц в режиме турбочастоты.
Подключается видеокарта MSI Geforce RTX 3050 LP OC через слот расширения PCI-E 4.0. Низкопрофильная система охлаждения предусматривает наличие двух вентиляторов. Благодаря усиленному статическому давлению вентиляторы повышают эффективность охлаждения. Для защиты обратной стороны видеокарты используется прочная шлифованная пластина. Видеоразъемы DisplayPort и 2x HDMI обеспечивают подключение видеокарты к мониторам. Вы можете одновременно работать с 3 мониторами с поддержкой разрешения Ultra HD 8K (7680x4320).', 19999, 30, 4, N'/Images/msirtx3050.png', N'MSI')
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [ProductPrice], [ProductAmount], [ProductCategory], [ProductImage], [ProductManufacturer]) VALUES (16, N'Видеокарта ASRock Intel Arc A750 Challenger D OC', N'Видеокарта ASRock Intel Arc A750 Challenger D OC выделяется мощными характеристиками, эффективным охлаждением с низким уровнем шума и компактной конструкцией. Она содержит архитектуру Xe-HPG и отличается частотой в пределах 2200 МГц при разгоне. Платформа графического ускорителя дополнена 8 ГБ памяти стандарта GDDR6.
Вывод изображения на внешние мониторы может осуществляться с помощью предусмотренных 4 разъемов: по 2 DisplayPort и 2 HDMI. ASRock Intel Arc A750 Challenger D обладает надежной элементной базой и металлической пластиной жесткости на тыловой стороне. Кулер с двумя массивными вентиляторами за счет быстрого отведения тепла гарантирует поддержание низкой температуры нагрева видеокарты. С помощью фирменной утилиты можно осуществлять мониторинг состояния.Видеокарта ASRock Intel Arc A750 Challenger D OC выделяется мощными характеристиками, эффективным охлаждением с низким уровнем шума и компактной конструкцией. Она содержит архитектуру Xe-HPG и отличается частотой в пределах 2200 МГц при разгоне. Платформа графического ускорителя дополнена 8 ГБ памяти стандарта GDDR6.
Вывод изображения на внешние мониторы может осуществляться с помощью предусмотренных 4 разъемов: по 2 DisplayPort и 2 HDMI. ASRock Intel Arc A750 Challenger D обладает надежной элементной базой и металлической пластиной жесткости на тыловой стороне. Кулер с двумя массивными вентиляторами за счет быстрого отведения тепла гарантирует поддержание низкой температуры нагрева видеокарты. С помощью фирменной утилиты можно осуществлять мониторинг состояния.', 26999, 75, 4, N'/Images/asrockintelarc.jpg', N'ASRock')
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleId], [RoleName]) VALUES (1, N'Администратор')
INSERT [dbo].[Roles] ([RoleId], [RoleName]) VALUES (2, N'Клиент')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserId], [UserName], [UserSurname], [UserPatronimyc], [UserEMail], [UserLogin], [UserPassword], [UserRole]) VALUES (1, N'Иван', N'Иванович', N'Иванов', N'admin@comp.shop', N'root', N'root', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserSurname], [UserPatronimyc], [UserEMail], [UserLogin], [UserPassword], [UserRole]) VALUES (2, N'Эмир', N'Волков', N'Степанович', N'doghome@gmail.com', N'user1', N'user1', 2)
INSERT [dbo].[Users] ([UserId], [UserName], [UserSurname], [UserPatronimyc], [UserEMail], [UserLogin], [UserPassword], [UserRole]) VALUES (3, N'Даниил', N'Фролов', N'Глебович', N'zauteivafouwe-1365@yopmail.com', N'sporesanimalists', N'XezyhoYufKpECGVL', 2)
INSERT [dbo].[Users] ([UserId], [UserName], [UserSurname], [UserPatronimyc], [UserEMail], [UserLogin], [UserPassword], [UserRole]) VALUES (4, N'Пётр', N'Алексеев', N'Иванович', N'jipraucrounoddou-3508@yopmail.com', N'hyssopjettisoned', N'ZCeBHEidGMuKGuwV', 2)
INSERT [dbo].[Users] ([UserId], [UserName], [UserSurname], [UserPatronimyc], [UserEMail], [UserLogin], [UserPassword], [UserRole]) VALUES (5, N'Иван', N'Соколов', N'Тимофеевич', N'veitrourizori-4218@yopmail.com', N'largenhighwaymen', N'haGWrznSrHhEbwIG', 2)
INSERT [dbo].[Users] ([UserId], [UserName], [UserSurname], [UserPatronimyc], [UserEMail], [UserLogin], [UserPassword], [UserRole]) VALUES (6, N'Тимур', N'Волков', N'Андреевич', N'beimmonauhusu-7680@yopmail.com', N'gagmandecolorant', N'GSicSjkeHXtgwRma', 2)
INSERT [dbo].[Users] ([UserId], [UserName], [UserSurname], [UserPatronimyc], [UserEMail], [UserLogin], [UserPassword], [UserRole]) VALUES (7, N'Егор', N'Кузнецов', N'Артёмович', N'zuzeseirulli-6773@yopmail.com', N'washerinterreges', N'\Z5Q5ix,`%zk)yfb', 2)
INSERT [dbo].[Users] ([UserId], [UserName], [UserSurname], [UserPatronimyc], [UserEMail], [UserLogin], [UserPassword], [UserRole]) VALUES (8, N'Данила', N'Щукин', N'Андреевич', N'cubremassugo-1712@yopmail.com', N'lithicalbuminate', N'B5d+@=pp?@e/6I:@', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserSurname], [UserPatronimyc], [UserEMail], [UserLogin], [UserPassword], [UserRole]) VALUES (9, N'Даниил', N'Туманов', N'Максимович', N'xeuxoirouraupra-8306@yopmail.com', N'ideaedsmallgoods', N'$!V_{al7%ik._d,:', 2)
INSERT [dbo].[Users] ([UserId], [UserName], [UserSurname], [UserPatronimyc], [UserEMail], [UserLogin], [UserPassword], [UserRole]) VALUES (10, N'Полина', N'Кузина', N'Ивановна', N'peiffavogroigroi-7072@yopmail.com', N'plainsbenzpyrene', N'dwIqjCY*H$co].eB', 2)
INSERT [dbo].[Users] ([UserId], [UserName], [UserSurname], [UserPatronimyc], [UserEMail], [UserLogin], [UserPassword], [UserRole]) VALUES (11, N'Александр', N'Березин', N'Глебович', N'dugroimideunna-5424@yopmail.com', N'sheenydisorderly', N'w)KRf{WrnIZel|4', 2)
INSERT [dbo].[Users] ([UserId], [UserName], [UserSurname], [UserPatronimyc], [UserEMail], [UserLogin], [UserPassword], [UserRole]) VALUES (12, N'Глеб', N'Романов', N'Дмитриевич', N'xaddeulladamou-4601@yopmail.com', N'chiralheterogamy', N'F(2MPIWB$\}oK=g', 2)
INSERT [dbo].[Users] ([UserId], [UserName], [UserSurname], [UserPatronimyc], [UserEMail], [UserLogin], [UserPassword], [UserRole]) VALUES (13, N'Максим', N'Иванов', N'Кириллович', N'jeuquifrounugreu-5624@yopmail.com', N'unipodnidamental', N'_LtGv;_w)@D[\(o', 1)
INSERT [dbo].[Users] ([UserId], [UserName], [UserSurname], [UserPatronimyc], [UserEMail], [UserLogin], [UserPassword], [UserRole]) VALUES (14, N'Варвара', N'Иванова', N'Давидовна', N'granauprefrava-1957@yopmail.com', N'smearsdistasting', N'esdhA%CY_P;N%{>,', 2)
INSERT [dbo].[Users] ([UserId], [UserName], [UserSurname], [UserPatronimyc], [UserEMail], [UserLogin], [UserPassword], [UserRole]) VALUES (15, N'София', N'Туманова', N'Руслановна', N'jobeiwefeuda-4201@yopmail.com', N'toastsvictorious', N's-J!0LT`tsIPv+8H', 2)
INSERT [dbo].[Users] ([UserId], [UserName], [UserSurname], [UserPatronimyc], [UserEMail], [UserLogin], [UserPassword], [UserRole]) VALUES (16, N'Дана', N'Клюева', N'Артёмовна', N'yeuddeimoucoppa-2191@yopmail.com', N'jubbahdeployment', N'jubbahdeployment', 2)
INSERT [dbo].[Users] ([UserId], [UserName], [UserSurname], [UserPatronimyc], [UserEMail], [UserLogin], [UserPassword], [UserRole]) VALUES (17, N'Алиса', N'Кузнецова', N'Давидовна', N'beiqueugrautteza-2906@yopmail.com', N'rumpedembassador', N'PQOZ#Kle#wtK6b', 2)
INSERT [dbo].[Users] ([UserId], [UserName], [UserSurname], [UserPatronimyc], [UserEMail], [UserLogin], [UserPassword], [UserRole]) VALUES (18, N'Алексей', N'Петров', N'Константинович', N'voguqualeuddou-6303@yopmail.com', N'planckyellowhead', N'N85)U4,~/~HdHw,~', 2)
INSERT [dbo].[Users] ([UserId], [UserName], [UserSurname], [UserPatronimyc], [UserEMail], [UserLogin], [UserPassword], [UserRole]) VALUES (19, N'Анна', N'Владимирова', N'Платоновна', N'gurussasouqui-5778@yopmail.com', N'ousterluxuriancy', N'v1{R[$Rz1"U:{w2^', 1)
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
ALTER TABLE [dbo].[Cart_Products]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Products_Products1] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[Cart_Products] CHECK CONSTRAINT [FK_Cart_Products_Products1]
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
