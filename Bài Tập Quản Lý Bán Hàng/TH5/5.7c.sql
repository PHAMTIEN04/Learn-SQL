SElECT M.MaHang, TenHang, COUNT(SoLuong) AS 'Số Lượng Mặt Hàng'
FROM MatHang M JOIN ChiTietChungTu C
	ON M.MaHang = C.MaHang
GROUP BY M.MaHang, TenHang