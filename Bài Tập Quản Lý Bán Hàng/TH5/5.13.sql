SELECT C.SoChungTu, SUM(P.SoTien) AS 'Tổng số tiền đã thu'
FROM ChungTuBanHang C INNER JOIN PhieuThuTien P
ON C.SoChungTu = P.SoChungTu
GROUP BY C.SoChungTu
HAVING SUM(P.SoTien) > 1000000