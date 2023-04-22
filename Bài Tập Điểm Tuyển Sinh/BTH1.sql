--1.10 Tạo Truy Vấn Để Hiển Thị Tổng Số Sinh Viên Theo Từng Lớp(Lưu ý : Những lớp chưa có sinh viên cũng được hiện thị), bao gồm những thông tin: Mã Lớp, Tên Lớp, tổng số sinh viên

select L.MaLop,TenLop,
	COUNT(MaSinhVien) 'Tổng Sinh Viên'
from LOP L left join SinhVien S
on L.MaLop = S.MaLop
Group By L.MaLop, TenLop

--1.11 Tạo Truy Vấn Để Hiển Thị Những lớp chưa có Sinh Viên, bao gồm những thông tin: Mã Lớp, Tên Lớp

select L.MaLop,TenLop,
	COUNT(MaSinhVien) 'Tổng Sinh Viên'
from LOP L left join SinhVien S
on L.MaLop = S.MaLop
Group By L.MaLop, TenLop
Having COUNT(MaSinhVien) =0

--1.12 Tạo Truy Vấn Để Hiển Thị 05 Tỉnh (dựa vào nơi sinh của sinh viên) có sinh viên theo học nhiều nhất, bao gồm những thông tin : Nơi Sinh, Tổng Số Sinh Viên

SELECT TOP 5 NoiSinh, COUNT(*) as 'Tổng Sinh Viên'
FROM SINHVIEN
GROUP BY NoiSinh
ORDER BY N'Tổng Sinh Viên' DESC

--1.13 Tạo truy vấn để hiển thị 05 sinh viên được xét học bổng, là những sinh viên có điểm trung bình ba môn cao nhất, ưu tiên những sinh viên nữ bao gồm những thông tin : Mã sinh viên, Họ và Tên
--(họ đệm + tên), ngày sinh, giới tính, mã lớp, tên lớp, DTB(điểm trung bình)

select top 5 d.MaSinhVien,
			 s.HoDem,
			 s.Ten,
			 s.NgaySinh,
			 s.GioiTinh,
			 l.MaLop,
			 l.TenLop,
			 (d.Diemmon1+ d.Diemmon2 + d.Diemmon3) / 3 as DTB
from SINHVIEN as s 
inner join LOP as l on s.MaLop = l.MaLop
inner join DIEMTS as d on s.MaSinhVien = d.MaSinhVien
where GioiTinh = 0 
order by DTB Desc
--1.14 Tạo bảng SINHVIEN_HO_LE có cấu trúc giống với bảng SINHVIEN để lưu thông tin các sinh viên họ "Lê"
--(Lưu ý: Sử dụng chức năng Generate Scripts để thực hiện việc cấu trúc bảng)
insert into SINHVIEN_HOLE 
select * 
from SINHVIEN
where HoDem like N'Lê%'
select *
from SINHVIEN_HOLE

--1.15 Lọc tất cả những sinh viên họ "Lê" từ bảng SINHVIEN, sau đó đưa dữ liệu vào bảng SINHVIEN_HO_LE
UPDATE SINHVIEN_HOLE 
SET MaLop = sv.MaLop, HoDem = sv.HoDem, Ten = sv.Ten, NgaySinh = sv.NgaySinh, GioiTinh = sv.GioiTinh, NoiSinh = sv.NoiSinh
FROM SINHVIEN_HOLE sh
INNER JOIN SINHVIEN sv ON sh.MaSinhVien = sv.MaSinhVien
where sv.HoDem like N'Lê%'
Select *
from SINHVIEN_HOLE
--1.16 Trong bảng SINHVIEN_HO_LE, cập nhật trường nơi sinh là "Quảng Bình" đối
-- với sinh viên có mã sinh viên kết thúc bằng chuỗi "03"
update SINHVIEN_HOLE
set NoiSinh = N'Quảng Bình'
where MaSinhVien like '%03'
select *
from SINHVIEN_HOLE
--1.17 Trong Bảng SINHVIEN_HO_LE, xóa tất cả sinh viên từ tháng 3 đến tháng 10 năm 1991
delete SINHVIEN_HOLE
Where NgaySinh between '1991-03-01' and '1991-10-31'
select *
from SINHVIEN_HOLE
--1.5 -> 1.7 
-- truy van con
--1.5 Tạo Truy Vấn để hiển thị những sinh viên từ tháng 3 đến tháng 8 năm 1992, bao gồm những thông tin :
-- Mã sinh viên, Họ và Tên(họ đệm + tên), ngày sinh, giới tính, tên lớp.
select 
	sv.MaSinhVien,
	sv.HoDem,
	sv.Ten,
	sv.NgaySinh,
	sv.GioiTinh,
	l.TenLop
from SINHVIEN as sv 
inner join LOP as l on sv.MaLop = l.MaLop
where sv.NgaySinh between '1992-03-01' and '1992-08-31'
--1.6 Tạo Truy Vấn để hiện thị những sinh viên nữ hoặc những sinh viên trong lớp sinh viên từ tháng 5 đến tháng 11, bao gồm những thông tin :
-- Mã Sinh Viên, Họ và tên(họ đêm + tên), ngày sinh, giới tính, tên lớp.
select 
	sv.MaSinhVien,
	sv.HoDem,
	sv.Ten,
	sv.NgaySinh,
	sv.GioiTinh,
	l.TenLop
from SINHVIEN as sv 
inner join LOP as l on sv.MaLop = l.MaLop
where sv.GioiTinh = 0 and MONTH(sv.NgaySinh) between '5' and '11'
--1.7 Tạo truy vấn để hiển thị những sinh viên không phải họ "Lê","Trần","Võ", "Nguyễn", bao gồm những thông tin :
-- Mã Sinh Viên, Họ và tên(họ đêm + tên), ngày sinh, giới tính, tên lớp.
select 
	sv.MaSinhVien,
	sv.HoDem,
	sv.Ten,
	sv.NgaySinh,
	sv.GioiTinh,
	l.TenLop
from SINHVIEN as sv 
inner join LOP as l on sv.MaLop = l.MaLop
where NOT(sv.HoDem  like N'Lê %' or sv.HoDem like N'Trần %' or sv.HoDem like N'Võ %' or sv.HoDem like N'Nguyễn %' or sv.HoDem  = N'Lê' or sv.HoDem = N'Trần' or sv.HoDem = N'Võ'or sv.Hodem= N'Nguyễn') 
--
insert into SINHVIEN_HUE
select *
from SINHVIEN
where NoiSinh like N'%Quảng Bình%'
select *
from SINHVIEN_HUE

UPDATE SINHVIEN_HUE
SET MaLop = sv.MaLop, HoDem = sv.HoDem, Ten = sv.Ten, NgaySinh = sv.NgaySinh, GioiTinh = sv.GioiTinh, NoiSinh = sv.NoiSinh
FROM SINHVIEN_HOLE sh
INNER JOIN SINHVIEN sv ON sh.MaSinhVien = sv.MaSinhVien
where sv.NoiSinh like N'%Huế%'
Select *
from SINHVIEN_HUE