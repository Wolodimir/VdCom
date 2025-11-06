1) Требуется отобрать периоды в которых значение Value отличается от значения Value в предыдущем периоде.
  Выводимые поля: PeriodID, Value
SELECT PeriodID,
       Value
FROM (
  SELECT PeriodID,
         Value,
         LAG(Value) OVER (ORDER BY PeriodID) AS prev
  FROM Periods
)
WHERE Value != prev OR prevValue IS NULL
  
2) Требуется удалить из таблицы периоды в которых значение Value равно значению Value в предыдущем периоде.
  Выводимые поля: PeriodID, Value
DELETE FROM Periods
WHERE PeriodID IN (
  SELECT PeriodID
  FROM (
    SELECT PeriodID,
           Value,
           LAG(Value) OVER (ORDER BY PeriodID) AS prev
    FROM Periods
  )
  WHERE Value = prev
)
