USE [december_cohort_db]
GO

SELECT [Year]
      ,[Team]
      ,[NAME ]
      ,[No#]
      ,[Pos]
      ,[Ht]
      ,[Wt]
      ,[Age]
      ,[Exp]
      ,[College]
      ,[FirstName]
      ,[LastName]
      ,[Ft]
      ,[In]
      ,[Inches]
      ,[NumGrp]
  FROM [dbo].['Football Players Data$']

GO


  SELECT [Pos]
         ,AVG ([Ft]*12+[In]) OVER() AS AVG_HT 
  FROM [dbo].['Football Players Data$']


  SELECT [Pos]
         ,AVG ([Ft]*12+[In]) OVER(PARTITION BY [Pos]) AS AVG_HT
  FROM [dbo].['Football Players Data$']


  SELECT [Pos]
         ,AVG ([Wt]) OVER(PARTITION BY [Pos]) AS AVG_HT
  FROM [dbo].['Football Players Data$']


  SELECT [Pos], MAX([Wt]) OVER() AS MAX_WEIGHT
  FROM [dbo].['Football Players Data$']
  ORDER BY [Pos];
  
  
  SELECT [Pos]
         ,AVG ([Wt]) OVER() AS AVG_HT
  FROM [dbo].['Football Players Data$']

  
  WITH MAX_WT AS (
  SELECT [Pos]
         ,MAX ([Wt]) OVER() AS MAX_WEIGHT
  FROM [dbo].['Football Players Data$']
  )
  SELECT 
       [Pos] AS P
	  ,[NAME ] AS P
	  ,[Wt]  AS P
   FROM [dbo].['Football Players Data$'] AS P
   JOIN  MAX_WT AS M
   ON P.[Pos] = M.[Pos] AND P.[Wt] = M.MAX_WT;


  SELECT [Team]
         , RANK() OVER(PARTITION BY [Age] ORDER BY [Team]) AS AGE_RANK
  FROM [dbo].['Football Players Data$']
  

  SELECT [Team]
         , AVG([Inches]) AS AGE_RANK
  FROM [dbo].['Football Players Data$']
  

  WITH MAX_HT AS (
  SELECT[Age],
         AVG([Ft]*12+[In]) OVER (PARTITION BY [Age]) AS AVG_HT
  FROM [dbo].['Football Players Data$']
  )
  SELECT AVG_HT,[Age]
  FROM MAX_HT
  WHERE [Age] > '25';
  
  WITH MAXAVG_HT AS (
  SELECT[Team],[Inches],
         AVG([Ft]*12+[In]) OVER () AS AVG_HT
  FROM [dbo].['Football Players Data$']
  WHERE [Inches] >'73';
  )
  SELECT AVG_HT
  FROM MAXAVG_HT
  WHERE [Inches] > '73';


  SELECT*
  FROM [dbo].['Football Players Data$']


  
  SELECT[Team],
         ([Ft]*12+[In]) OVER () AS AVG_HT
  FROM [dbo].['Football Players Data$'] AS T
  > (
  SELECT [Team],
         AVG([Ft]*12+[In]) OVER () AS AVG_HT
  FROM [dbo].['Football Players Data$'] AS M
  );


  SELECT [LastName]
         ,COUNT(*) AS T
  FROM [dbo].['Football Players Data$']
  GROUP BY [LastName]
  HAVING COUNT(*) > '1';


  SELECT [Pos]
         ,MIN([Ft]*12+[In]) OVER() AS MIN_HEIGHT
  FROM [dbo].['Football Players Data$']


  SELECT [Team]
         ,COUNT(*) AS T
  FROM [dbo].['Football Players Data$']
  GROUP BY [Team]
