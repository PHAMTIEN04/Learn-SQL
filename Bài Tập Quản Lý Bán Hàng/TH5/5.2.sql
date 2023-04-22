SELECT N.MaNhaSX, COUNT(*) AS 'Số Lượng Mặt Hàng'
FROM MatHang M 
INNER JOIN NhaSanXuat N ON M.MaNhaSX = N.MaNhaSX
Group by N.MaNhaSX