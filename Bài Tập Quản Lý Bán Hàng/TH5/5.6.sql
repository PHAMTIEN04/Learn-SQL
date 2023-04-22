SELECT K.MaKhachHang, K.TenKhachHang, SUM(C1.SoLuong * C1.DonGia) AS 'Tổng số tiền'
FROM KhachHang K
INNER JOIN ChungTuBanHang C ON K.MaKhachHang = C.MaKhachHang
INNER JOIN ChiTietChungTu C1 ON C.SoChungTu = C1.SoChungTu
GROUP BY K.MaKhachHang, K.TenKhachHang
