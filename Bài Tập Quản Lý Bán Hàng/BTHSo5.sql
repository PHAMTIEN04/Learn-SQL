--5.1 Thống Kê Số Lượng Mặt Hàng Theo Từng Loại Hàng
select lh.MaLoaiHang, COUNT(*) as 'Số Lượng Mặt Hàng'
from MatHang as mh 
inner join LoaiHang as lh on mh.MaLoaiHang = lh.MaLoaiHang
Group by lh.MaLoaiHang

--5.2 Thống Kê Số Lượng Mặt Hàng Theo Từng Nhà Sản Xuất
select nsx.MaNhaSX, COUNT(*) as 'Số Lượng Mặt Hàng'
from MatHang as mh 
inner join NhaSanXuat as nsx on mh.MaNhaSX = nsx.MaNhaSX
Group by nsx.MaNhaSX

--5.3 Thống Kê Số Lượng Khách Hàng Theo Từng Tỉnh
select tt.TenTinh, COUNT(*) as 'Số Lượng Khách Hàng'
from KhachHang as kh 
inner join TinhThanh tt on kh.MaTinh = tt.MaTinh
Group by tt.TenTinh

--5.4 Thống Kê Số Lượng Khách Hàng Theo Nhóm Khách Hàng
select nkh.MaNhomKH,nkh.TenNhomKH, COUNT(*) as 'Số Lượng Khách Hàng'
from KhachHang as kh
inner join NhomKhachHang as nkh on kh.MaNhomKH = nkh.MaNhomKH
Group By nkh.MaNhomKH,nkh.TenNhomKH

--5.5 Hãy Cho Biết Tổng Số Tiền Mà Khách Hàng Phải Thanh Toán Cho Mỗi Đơn Hàng là Bao Nhiêu
SELECT cttt.SoChungTu, SUM(cttt.SoLuong * cttt.DonGia) as 'Tổng Số Tiền'
FROM ChiTietChungTu as cttt 
INNER JOIN ChungTuBanHang as ctbh ON cttt.SoChungTu = ctbh.SoChungTu
GROUP BY cttt.SoChungTu

--5.6 Tổng số tiền mà khách hàng phải trả cho các đơn hàng là bao nhiêu 
SELECT kh.MaKhachHang, SUM(cttt.SoLuong * cttt.DonGia) as 'Tổng Số Tiền'
FROM ChiTietChungTu as cttt 
INNER JOIN ChungTuBanHang as ctbh ON cttt.SoChungTu = ctbh.SoChungTu
Inner Join KhachHang as kh on ctbh.MaKhachHang = kh.MaKhachHang
GROUP BY kh.MaKhachHang

--5.7 Hãy Cho Biết Các Loại Mặt Hàng Có Số Lượng Mặt Hàng Lớn Hơn 2
SElECT TenLoaiHang, COUNT(MaHang) AS 'Số Lượng Mặt Hàng'
FROM LoaiHang lh 
inner join MatHang mh ON lh.MaLoaiHang = mh.MaLoaiHang
GROUP BY TenLoaiHang
Having COUNT(MaHang) > 2
-- 5.8 Hãy thống kê tổng số tiền thu được của mỗi đơn hàng
SELECT C.SoChungTu, SUM(P.SoTien) AS 'Tổng số tiền thu được'
FROM ChungTuBanHang C 
left JOIN PhieuThuTien P ON C.SoChungTu = P.SoChungTu
GROUP BY C.SoChungTu
-- 5.9 Thống kê doanh thu của các mặt hàng tên được sản xuất bởi "Hãng máy tính IBM"
-- Lưu ý : Doanh Thu của mỗi mặt hàng trong mỗi chứng từ được tính theo công thức: số lượng * đơn giá 
Select mh.MaHang, 
	   mh.TenHang,
	   sum(SoLuong * DonGia) as N'Doanh Thu'
From MatHang mh 
inner join NhaSanXuat nsx on mh.MaNhaSX = nsx.MaNhaSX
inner join ChiTietChungTu cttt on mh.MaHang = cttt.MaHang
where nsx.TenNhaSX = N'Hãng máy tính IBM'
Group By mh.MaHang,mh.TenHang

-- 5.10 Trong năm 2010; những mặt hàng nào có tổng doanh thu lớn hơn 10 triệu đồng(thời gian dựa vào ngày lập chứng tử)
Select mh.MaHang, 
	   mh.TenHang,
	   sum(SoLuong * DonGia) as N'Doanh Thu'
From MatHang mh 
inner join ChiTietChungTu cttt on mh.MaHang = cttt.MaHang
inner join ChungTuBanHang ctbh on cttt.SoChungTu = ctbh.SoChungTu
where ctbh.NgayLapChungTu like '%2010%'
Group By mh.MaHang,mh.TenHang
Having sum(SoLuong * DonGia) > 10000000

-- Đọc Thêm TRUY VẤN CON

