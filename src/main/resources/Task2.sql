1) Выбрать все книги, а поле дата должно быть заполнено только у тех, у которых дата регистрации больше 01.02.2005
SELECT BookID, 
  Name, 
  CASE WHEN Date > '01.02.2005' THEN date
  ELSE NULL
FROM tblBook
  LEFT JOIN tblBookInLibrary ON tblBook.BookID = tblBookInLibrary.BookID


2) Выбрать все книги, у которых дата регистрации в библиотеке больше 01.02.2005 либо не задана вообще
  SELECT * FROM tblBook
  LEFT JOIN tblBookInLibrary ON tblBook.BookID = tblBookInLibrary.BookID
  WHERE tblBookInLibrary.Date IS AFTER '01.02.2005' OR tblBookInLibrary.Date IS NULL
