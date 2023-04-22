SELECT TenNhomKH, COUNT(MaKhachHang) AS 'Số Lượng Khách Hàng'
FROM KhachHang K INNER JOIN NhomKhachHang N 
	ON K.MaNhomKH = N.MaNhomKH
GROUP BY TenNhomKH
