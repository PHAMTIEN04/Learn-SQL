SELECT C.SoChungTu, SUM(P.SoTien) AS 'Tổng số tiền thu được'
FROM ChungTuBanHang C 
INNER JOIN PhieuThuTien P ON C.SoChungTu = P.SoChungTu
GROUP BY C.SoChungTu
