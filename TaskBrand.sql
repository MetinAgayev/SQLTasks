Create Database Task
Use Task
Create Table Brand
(
ID int primary key identity,
[Name] nvarchar(25)

)
Create Table NoteBooks
(
ID int primary key identity,
[Name] nvarchar(25),
Price smallmoney,
BrandID int references Brand(ID)
)
Create Table Phones
(
ID int primary key identity,
[Name] nvarchar(25),
Price smallmoney,
BrandID int references Brand(ID)
)

Select NoteBooks.Name,Brand.Name 'BrandName' from NoteBooks inner join Brand on NoteBooks.BrandID=Brand.ID
Select Phones.Name,Brand.Name 'BrandName' from Phones inner join Brand on Phones.BrandID=Brand.ID
Select NoteBooks.Name,Brand.Name 'BrandName' from NoteBooks inner join Brand on NoteBooks.BrandID=Brand.ID where brand.Name like '%s%'
Select NoteBooks.Name,Brand.Name,NoteBooks.Price 'BrandName' from NoteBooks inner join Brand on NoteBooks.BrandID=Brand.ID where (NoteBooks.Price>2000 and NoteBooks.Price<5000) or NoteBooks.Price>5000
Select Phones.Name,Brand.Name,Phones.Price 'BrandName' from Phones inner join Brand on Phones.BrandID=Brand.ID where (Phones.Price>1000 and Phones.Price<1500) or Phones.Price>1500
Select Brand.Name 'BrandName', COUNT(*) 'Phones' from Phones s inner join Brand on s.BrandID=Brand.ID Group by s.Name,Brand.Name
Select Brand.Name 'BrandName', COUNT(*) 'NoteBooks' from NoteBooks s inner join Brand on s.BrandID=Brand.ID Group by s.Name,Brand.Name
Select * from (Select * from NoteBooks s Union All Select * from Phones g ) as [TBl]  order by BrandID 
Select * from (Select * from NoteBooks s Union All Select * from Phones g ) as [TBl] inner  join Brand on BrandID=Brand.ID order by BrandID 
Select Brand.Name 'BrandName',Sum(s.Price) 'TotalPrice',COUNT(*) 'ProductInfo' from Phones s inner join Brand on s.BrandID=Brand.ID Group by Brand.Name
Select Brand.Name 'BrandName',Sum(s.Price) 'TotalPrice' from NoteBooks s inner join Brand on s.BrandID=Brand.ID where (Select COUNT(NoteBooks.ID) from NoteBooks)=3   and (Select COUNT(NoteBooks.ID) from NoteBooks)>3       Group by Brand.Name

