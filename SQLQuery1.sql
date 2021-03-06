/****** Script for SelectTopNRows command from SSMS  ******/
SELECT *
  FROM [SQL Portfolio].[dbo].[laptop_price];

-- check null values
SELECT * FROM [SQL Portfolio].[dbo].[laptop_price]
WHERE Company is null; --no null values found

-- breaking out screen resolution and standadize data format

ALTER TABLE [SQL Portfolio].[dbo].[laptop_price] ADD resolution Nvarchar(255);

UPDATE [SQL Portfolio].[dbo].[laptop_price] SET resolution = ScreenResolution;

SELECT right(resolution, 4)
FROM [SQL Portfolio].[dbo].[laptop_price];

UPDATE [SQL Portfolio].[dbo].[laptop_price] SET resolution = right(resolution, 4);

UPDATE [SQL Portfolio].[dbo].[laptop_price] SET resolution = replace(resolution,'x', '');

UPDATE [SQL Portfolio].[dbo].[laptop_price] SET resolution = CONVERT(float, resolution);

-- breaking out CPU brand and standadize data format

SELECT SUBSTRING(Cpu, 1, 3)
FROM [SQL Portfolio].[dbo].[laptop_price]; --Int = Intel

ALTER TABLE [SQL Portfolio].[dbo].[laptop_price] ADD Processor Nvarchar(255);

UPDATE [SQL Portfolio].[dbo].[laptop_price] SET Processor = SUBSTRING(Cpu, 1, 3);

-- breaking out GPU brand and standadize data format

SELECT SUBSTRING(Gpu, 1, 3)
FROM [SQL Portfolio].[dbo].[laptop_price]; --Int = Intel Nvi=Nvidia

ALTER TABLE [SQL Portfolio].[dbo].[laptop_price] ADD Graphic Nvarchar(255);

UPDATE [SQL Portfolio].[dbo].[laptop_price] SET Graphic = SUBSTRING(Gpu, 1, 3);

-- breaking out Memory and standadize data format
SELECT Memory,
CASE
	WHEN Memory LIKE '%HDD%' THEN 'HDD'
	WHEN Memory LIKE '%SSD%' THEN 'SSD'
	ELSE 'Flash Storage'
END
FROM [SQL Portfolio].[dbo].[laptop_price];


ALTER TABLE [SQL Portfolio].[dbo].[laptop_price] ADD HardDrive Nvarchar(255);

UPDATE [SQL Portfolio].[dbo].[laptop_price] SET HardDrive = (
CASE
	WHEN Memory LIKE '%HDD%' THEN 'HDD'
	WHEN Memory LIKE '%SSD%' THEN 'SSD'
	ELSE 'Flash Storage'
END)
FROM [SQL Portfolio].[dbo].[laptop_price];

--Data has been cleaned and organized. Will use Tableau to visualize data.
