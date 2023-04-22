Create Database SQLQuery
Go
--Sử dụng DB SQLQuery
Use SQLQuery
Go
--Tạo bảng Giáo Viên có 2 thuộc tính
Create Table GiaoVien
(

	MaGV nvarchar(10),
	Name nvarchar(100)

)
Go
Create Table Hocsinh
(

	MaHs nvarchar(10),
	Name nvarchar(100)

)
Go
-- Sửa bảng, Thêm cột ngày sinh 
Alter Table Hocsinh Add Ngaysinh date
go
-- Xóa toàn bộ dữ liệu của bảng
Truncate Table Hocsinh
go
-- Gỡ bản khỏi DB
Drop Table Hocsinh
Go
