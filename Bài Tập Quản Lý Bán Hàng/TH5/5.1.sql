SELECT L.MaLoaiHang, COUNT(*) AS 'Số Lượng Mặt Hàng'
FROM MatHang M 
INNER JOIN LoaiHang L on M.MaLoaiHang = L.MaLoaiHang
Group by L.MaLoaiHang