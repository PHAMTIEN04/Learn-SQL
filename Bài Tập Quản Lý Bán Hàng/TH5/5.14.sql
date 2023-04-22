SELECT M.MaHang, M.TenHang, L.TenLoaiHang, SUM(C1.SoLuong * C1.DonGia) AS 'Doanh thu'
FROM MatHang M
INNER JOIN LoaiHang L ON M.MaLoaiHang = L.MaLoaiHang
INNER JOIN ChiTietChungTu C1 ON M.MaHang = C1.MaHang
INNER JOIN ChungTuBanHang C ON C1.SoChungTu = C.SoChungTu
INNER JOIN PhieuThuTien P ON C.SoChungTu = P.SoChungTu
GROUP BY M.MaHang, M.TenHang, L.TenLoaiHang
HAVING SUM(C1.SoLuong * C1.DonGia) > 20000000
