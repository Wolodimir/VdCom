1) Отобрать активные счета по которым есть проводки как имнимум по двум разным активам. 
  Выводимые поля: CounterpartyId, Name, Cnt(количество уникальных активов по которым есть проводки)
SELECT CounterpartyID, 
       Name, 
       COUNT(DISTINCT t.AssetID) AS Cnt 
FROM Accounts a
  JOIN Transactions t ON a.CounterpartyID IN (t.RcvID, t.SndID)
WHERE a.IsActive = 1
GROUP BY a.CounterpartyID, a.name
HAVING COUNT(DISTINCT t.AssetID) >= 2

2) Посчитать суммарное число актива, образовавшееся на активных счетах, в результате проведенных проводок.
  Выводимые поля: CounterpartyID, Name, AssetID, Quantity.
SELECT CounterpartyID,
       Name,
       AssetID,
       SUM(Quantity)
FROM Accounts a
  JOIN Transactions t ON a.CounterpartyID IN (t.RcvID, t.SndID)
WHERE a.IsActive = 1
GROUP BY a.CounterpartyID, a.Name, t.AssetID

3) Посчитать средний дневной оборот по всем счетам, по всем проводкам, считая что AssetID во всех проводках одинаковый.
  Выводимые поля: CounterpartyID, Name, Oborot
SELECT CounterpartyID,
       Name,
       SUM(t.Quantity) / COUNT(DISTINCT t.TransDate) AS Oborot
FROM Accounts a
  JOIN Transactions t ON a.CounterpartyID IN (t.RcvID, t.SndID)
GROUP BY a.CounterpartyID, a.Name

4) Посчитать средний месячный оборот по всем счетам, по всем проводкам, считая что AssetID во всех проводках одинаковый.
  Выводимые поля: CounterpartyID, Name, Oborot
SELECT CounterpartyID,
       Name,
       SUM(t.Quantity) / COUNT(DISTINCT DATE_FORMAT(t.TransDate, 'yyyy-MM')) AS Oborot
FROM Accounts a
  JOIN Transactions t ON a.CounterpartyID IN (t.RcvID, t.SndID)
GROUP BY a.CounterpartyID, a.Name
