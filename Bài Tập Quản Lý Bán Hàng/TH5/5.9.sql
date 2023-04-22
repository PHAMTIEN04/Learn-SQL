SELECT M.MaHang, M.TenHang, SUM(C1.SoLuong * C1.DonGia) AS 'Doanh thu'
FROM MatHang M
INNER JOIN ChiTietChungTu C1 ON M.MaHang = C1.MaHang
INNER JOIN ChungTuBanHang C ON C1.SoChungTu = C.SoChungTu
INNER JOIN NhaSanXuat N ON M.MaNhaSX = N.MaNhaSX
WHERE N.TenNhaSX = 'Hãng máy tính IBM'
GROUP BY M.MaHang, M.TenHang
