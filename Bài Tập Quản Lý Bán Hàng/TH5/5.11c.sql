SELECT K.MaKhachHang, K.TenKhachHang, COUNT(*) AS 'Số lần mua hàng'
FROM KhachHang K INNER JOIN ChungTuBanHang C 
	ON K.MaKhachHang = C.MaKhachHang
GROUP BY K.MaKhachHang, K.TenKhachHang
HAVING COUNT(*) > 1
