SELECT TenTinh, COUNT(MaKhachHang) AS 'Số Lượng Khách Hàng'
FROM KhachHang K INNER JOIN TinhThanh T 
	ON K.MaTinh = T.MaTinh
GROUP BY TenTinh
