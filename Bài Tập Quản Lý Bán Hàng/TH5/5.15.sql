SELECT N.MaNhaSX, N.TenNhaSX, COUNT(M.MaHang) AS 'So mat hang'
FROM NhaSanXuat N
LEFT JOIN MatHang M ON N.MaNhaSX = M.MaNhaSX
GROUP BY N.MaNhaSX, N.TenNhaSX
HAVING COUNT(M.MaHang) = 0;
