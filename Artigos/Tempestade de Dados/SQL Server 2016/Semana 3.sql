--Restaurar banco de dados
USE [master]
RESTORE DATABASE [WideWorldImporters] FROM  DISK = N'C:\Minhas Palestras e Cursos\Minas Programam\WideWorldImporters-Full.bak' WITH  FILE = 1,  MOVE N'WWI_Primary' TO N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\WideWorldImporters.mdf',  MOVE N'WWI_UserData' TO N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\WideWorldImporters_UserData.ndf',  MOVE N'WWI_Log' TO N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\WideWorldImporters.ldf',  MOVE N'WWI_InMemory_Data_1' TO N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\WideWorldImporters_InMemory_Data_1',  NOUNLOAD,  STATS = 5

GO


--Usando ALIAS e o Nome da tabela - ERRO
select [Orders].[OrderDate], S.[ExpectedDeliveryDate]
from [Sales].[Orders] AS S 

-- ESQUECER A VÍRGULA ENTRE AS COLUNAS - ERRO
select [OrderDate] [ExpectedDeliveryDate]
from [Sales].[Orders] 

--RETORNO DE UMA EXPRESSÃO SEM ALIAS - NÃO É BOA PRÁTICA
SELECT [Quantity] * 8
FROM [Sales].[InvoiceLines]

--RETORNO DE UMA EXPRESSÃO COM ALIAS
SELECT [Quantity] * 8 AS EXPRESSAO_ALIAS
FROM [Sales].[InvoiceLines]


--USANDO COMPARAÇÃO COM NULOS NO WHERE - ERRADO-
SELECT [CreditNoteReason],[Comments]
FROM [Sales].[Invoices]
WHERE [CreditNoteReason] = NULL

--USANDO COMPARAÇÃO COM NULOS NO WHERE
SELECT [DeliveryRun] , [Comments]
FROM [Sales].[Invoices]
WHERE [CreditNoteReason] IS NULL

--USANDO COMPARAÇÃO COM NULOS NO WHERE
SELECT [DeliveryInstructions] 
FROM [Sales].[Invoices]
WHERE [DeliveryInstructions] IS NOT NULL

--SOMENTE COMANDO SELECT
select 'SQL' as colA, 'Server' colb