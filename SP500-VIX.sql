/****** Script for SelectTopNRows command from SSMS  ******/

SELECT *
FROM [SQL Portfolio].[dbo].[vix-daily_csv]
INNER JOIN [SQL Portfolio].[dbo].[s&p_data_csv] ON [SQL Portfolio].[dbo].[vix-daily_csv].Date = [SQL Portfolio].[dbo].[s&p_data_csv].Date;




SELECT a.Date, a.[VIX Close], b.SP500, b.[Consumer Price Index], b.[Long Interest Rate] INTO Vix_SP500
FROM [SQL Portfolio].[dbo].[vix-daily_csv] a
INNER JOIN [SQL Portfolio].[dbo].[s&p_data_csv] b ON a.Date = b.Date;
