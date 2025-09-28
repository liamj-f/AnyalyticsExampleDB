create table Calendar 
([Date] date primary key,
[DayName] NVARCHAR(20),
[DayOfWeek] INT,
[WeekOfYear] INT,
[MonthName] NVARCHAR(20),
[Month] INT,
[Year] INT,
[IsWeekend] BIT
)

declare @StartDate date 
declare @EndDate date
set @StartDate = '2005-01-01'
set @EndDate = curdate()

declare @LoopDate date
set @LoopDate = @StartDate

while @LoopDate <= @EndDate

begin 
  insert into [Calendar] ([Date], [DayName], [DayOfWeek], [WeekOfYear], [MonthName], [Month], [Year], [IsWeekend])
  values (@Loopdate, 
          Date_Format(@LoopDate, %W),
          Date_Format(@LoopDate, %w),
          Date_Format(@LoopDate, %v),
          Date_Format(@LoopDate, %M),
          Date_Format(@LoopDate, %m),
          Date_Format(@LoopDate, %Y),
          case when Date_Format(@LoopDate, %v) in (0,7) then 1 else 0 end
          )

set @LoopDate = dateadd(@LoopDate INTERVAL 1 DAY)
end
