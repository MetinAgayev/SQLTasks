Create DataBase [Library]
Use [Library]

Create Table Authors
(
ID int primary key identity,
[Name] nvarchar(25),
Surname nvarchar(35)
)
Create Table Books
(
ID int primary key identity,
[Name]  nvarchar(25) check(Len([Name])>2 and Len([Name])<100),
[PageCount] int check([Pagecount]>10),
AuthorsID int references  Authors(ID)
)

CREATE VIEW usv_GetAllBooksByAuthor As 
Select s.ID,s.PageCount,s.Name,(a.[Name]+' '+a.Surname) 'AuthorFullName' from Books s inner join Authors a on s.AuthorsID=a.ID 

Select * from usv_GetAllBooksByAuthor

Create view usv_GetAuthorFullName as
Select (a.[Name]+' '+a.Surname) 'AuthorFullName' from Authors a

Create  Procedure usp_GetBookinfo @Searchpoint nvarchar(40)
as 
Begin (Select b.ID,b.[Name],b.[PageCount],(Select * from usv_GetAuthorFullName) from Books b inner join Authors on b.AuthorsID=Authors.ID where b.Name=@Searchpoint)
End

exec usp_GetBookinfo Book1

Create Procedure usp_Insert @name nvarchar(35),@surname nvarchar(35)
as
Begin
Insert into Authors values
(@name,@surname)
End
exec usp_Insert 'Metin6','Agayev6'

Create Procedure usp_Update @ColumnName nvarchar(35)
as
Begin
Update Authors set Name=@ColumnName
Where Authors.ID=1
End

exec usp_Update 'Metin1'

Create Procedure usp_Delete @ColumnName nvarchar(35)
as
Begin
Delete from Authors  where @ColumnName=Authors.Name
End

exec usp_Delete 'Metin1'

Create view usp_GetAllAuthorsinfo as
Select a.ID,(a.[Name]+' '+a.Surname) 'AuthorFullName',Count(*) 'BooksCount',Max(b.[PageCount]) 'MaxPageCount'   from Authors a inner join Books b on b.AuthorsID=a.ID group by b.AuthorsID,a.ID,a.Name,a.Surname

Select * from  usp_GetAllAuthorsinfo