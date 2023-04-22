SELECT T.MaTinh, T.TenTinh
FROM TinhThanh T
LEFT JOIN KhachHang K ON T.MaTinh = K.MaTinh
WHERE K.MaKhachHang IS NULL
