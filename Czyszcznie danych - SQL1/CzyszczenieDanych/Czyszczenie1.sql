-- Czyszczenie danych w DimDate --
SELECT 
  TOP (1000) [DateKey], 
  [FullDateAlternateKey] AS Data, 
  --[DayNumberOfWeek]
  [EnglishDayNameOfWeek] AS Dzien, 
  --[SpanishDayNameOfWeek]
  --,[FrenchDayNameOfWeek]
  --,[DayNumberOfMonth]
  --,[DayNumberOfYear]
  [WeekNumberOfYear] AS Tydzien, 
  [EnglishMonthName] AS Miesiac, 
  LEFT ([EnglishMonthName], 3) AS Mies, 
  --[SpanishMonthName],
  --[FrenchMonthName], 
  [MonthNumberOfYear] AS NumerMiesiaca, 
  [CalendarQuarter] AS Kwartal, 
  [CalendarYear] AS Rok --[CalendarSemester],
  --[FiscalQuarter],
  --[FiscalYear],
  --[FiscalSemester]
FROM 
  [AdventureWorksDW2019].[dbo].[DimDate] 
WHERE 
  CalendarYear >= 2019
