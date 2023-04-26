--2
select MaThanhVien,HoDem,Ten,NgaySinh,GioiTinh,NoiSinh
from THANHVIEN
where Year(NgaySinh) = 1992 and Month(NgaySinh) between 9 and 12 or HoDem like N'Võ %' or HoDem = N'Võ'
--3
select MaThanhVien, HoDem,Ten,NgaySinh,GioiTinh,NoiSinh
from THANHVIEN
where GioiTinh = 0 and NOT(HoDem like N'%Thị' or HoDem like N'%Thị%')
--4
select TOP 8 MaThanhVien, HoDem, Ten,NgaySinh,GioiTinh,NoiSinh
from THANHVIEN
where Not(NoiSinh is NULL)
order by NgaySinh asc
--5
select hsvv.MaHoSo,hsvv.LaiSuat,count(hsvvtv.MaHoSo) as N'Tổng Số Thành Viên'
from HOSOVAYVON_THANHVIEN hsvvtv
inner join HOSOVAYVON as hsvv on hsvvtv.MaHoSo = hsvv.MaHoSo
group by hsvv.MaHoSo,hsvv.LaiSuat
Having Count(hsvvtv.MaHoSo) >= 2 
--6
select tv.MaThanhVien,tv.HoDem,tv.Ten,tv.NgaySinh,tv.GioiTinh,Sum(hsvvtv.SoVonVay) as N'Tổng Số Vốn Vay'
from HOSOVAYVON_THANHVIEN hsvvtv
inner join THANHVIEN tv on hsvvtv.MaThanhVien = tv.MaThanhVien
group by tv.MaThanhVien,tv.HoDem,tv.Ten,tv.NgaySinh,tv.GioiTinh
--7
select MaThanhVien, HoDem, Ten, NgaySinh,GioiTinh,NoiSinh
from THANHVIEN
where NoiSinh = (select NoiSinh from THANHVIEN 
				where MaThanhVien = N'TV01')

--9
insert into THANHVIEN_HANOI
select *
from THANHVIEN
Where NoiSinh = N'Hà Nội'
select *
from THANHVIEN_HANOI
--10
delete THANHVIEN_HANOI
where HoDem like N'Nguyễn %' or HoDem = N'Nguyễn'
select *
from THANHVIEN_HANOI

