CREATE DATABASE	P224
USE P224
CREATE TABLE WORKERS
(
NAME nvarchar(25),
SurName nvarchar(25),
Position nvarchar(30),
Salary decimal
) 
INSERT INTO WORKERS 
VALUES('Metin','Agayev','Ceo',8500),
('Ferid','Qaya','Developer',3500),
('Asim','Salahov','Accountant',6000)

Select AVG(Salary) [Avarage Salary] From WORKERS
Select Name,SurName,Salary 'Ad Soyad Maas' From Workers Where Salary>(Select AVG(Salary)  From WORKERS)
Select Min(Salary) From Workers
Select Max(Salary) From Workers
