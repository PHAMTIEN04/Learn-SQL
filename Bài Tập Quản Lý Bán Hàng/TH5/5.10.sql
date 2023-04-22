SELECT M.MaHang, M.TenHang, C.NgayLapChungTu, SUM(C1.SoLuong * C1.DonGia) AS 'Doanh thu'
FROM MatHang M
INNER JOIN ChiTietChungTu C1 ON M.MaHang = C1.MaHang
INNER JOIN ChungTuBanHang C ON C1.SoChungTu = C.SoChungTu
WHERE YEAR(C.NgayLapChungTu) = 2010
GROUP BY M.MaHang, M.TenHang, C.NgayLapChungTu
HAVING SUM(C1.SoLuong * C1.DonGia) > 10000000
