SELECT C.SoChungTu, SUM(C1.SoLuong * C1.DonGia) AS 'Tổng số tiền'
FROM ChungTuBanHang C 
INNER JOIN ChiTietChungTu C1 ON C.SoChungTu = C1.SoChungTu
GROUP BY C.SoChungTu
