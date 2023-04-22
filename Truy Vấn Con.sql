﻿
SELECT sv.MaSinhVien, HoDem, Ten, Diemmon1
FROM SINHVIEN AS sv 
INNER JOIN DIEMTS d ON sv.MaSinhVien = d.MaSinhVien
WHERE Diemmon1 >= (SELECT MAX(Diemmon1) FROM DIEMTS )

--5.19 -> 5.21
--6.19 -> 6.21

-- 5.19 : Hãy cho biết thông tin về những khách hàng ở cùng tỉnh/thành với khách hàng có tên là 'Trần Nguyên Phong'
SELECT *
FROM KhachHang kh 
WHERE kh.MaTinh =(SELECT MaTinh FROM KhachHang WHERE TenKhachHang = N'Trần Nguyên Phong')
-- 5.20 : Khách Hàng có tên là "Nguyễn Thanh Bình" nằm cùng nhóm với những khách hàng nào ? 
SELECT TenKhachHang
FROM KhachHang kh 
WHERE kh.MaNhomKH = (SELECT MaNhomKH FROM KhachHang WHERE TenKhachHang = N'Nguyễn Thanh Bình')   
-- 5.21 : Những loại hàng nào có số lượng mặt hàng nhiều nhất, là bao nhiêu ?
select LoaiHang.MaLoaiHang,LoaiHang.TenLoaiHang,Count(MatHang.MaLoaiHang) as N'Số lượng'
from LoaiHang
inner join MatHang on LoaiHang.MaLoaiHang = MatHang.MaLoaiHang
group by LoaiHang.MaLoaiHang,LoaiHang.TenLoaiHang
Having count(MatHang.MaHang) >= ALL (Select Count(MaHang)
									from MatHang
									Group By MaLoaiHang)
--
select nsx.MaNhaSX,MaLoaiHang,Count(MatHang.MaHang) as N'Số lượng'
from NhaSanXuat nsx
left  join MatHang on nsx.MaNhaSX = MatHang.MaNhaSX
group by nsx.MaNhaSX,MaLoaiHang
Having count(MatHang.MaHang) >= ALL (Select Count(MaHang)
									from MatHang
									Group By MaNhaSX)




