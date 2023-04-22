SELECT T.TenTinh, COUNT(K.MaKhachHang) AS 'SoLuongKhachHang'
FROM TinhThanh T LEFT JOIN KhachHang K ON T.MaTinh = K.MaTinh
GROUP BY T.TenTinh
HAVING COUNT(K.MaKhachHang) <= 1
