--1 Hãy cho biết thông tin về các ngành đào tạo và đơn vị quản lý nghành đó
select 
	ndt.MaNganh,
	ndt.TenNganh,
	ndt.MaDonVi,
	dv.TenDonVi,
	dv.DienThoai,
	dv.MaDonViCapTren
from NganhDaoTao ndt 
inner join DonVi dv on ndt.MaDonVi = dv.MaDonVi

--2 Hiển thị danh sách các học phần do 'Khoa Tiếng Anh chuyên ngành' phụ trách
--select TenLopHocPhan
--from LopHocPhan
--where TenLopHocPhan = N'Khoa Tiếng Anh chuyên ngành'

--3 Hãy cho biết danh sách các ngành đào tạo được tuyển sinh trong khoảng thời gian từ năm 2010 
-- đến năm 2014
-- DISTINCT để chỉ hiển thị mỗi tên ngành duy nhất một lần.
SELECT DISTINCT ndt.TenNganh
FROM NganhDaoTao ndt
INNER JOIN KhoaHoc_NganhDaoTao khndt ON ndt.MaNganh = khndt.MaNganh
INNER JOIN KhoaHoc kh ON khndt.MaKhoaHoc = kh.MaKhoaHoc
WHERE kh.NamTuyenSinh BETWEEN 2010 AND 2014;

--4 
SELECT sv.MaSinhVien, sv.HoDem, sv.Ten, sv.GioiTinh, sv.NgaySinh, sv.NoiSinh, ndt.MaNganh
FROM SinhVien sv
INNER JOIN KhoaHoc_NganhDaoTao khndt ON sv.MaNganh = khndt.MaNganh
INNER JOIN KhoaHoc kh ON khndt.MaKhoaHoc = kh.MaKhoaHoc
INNER JOIN NganhDaoTao ndt ON khndt.MaNganh = ndt.MaNganh
WHERE ndt.TenNganh = N'Tiếng Anh' AND kh.NamTuyenSinh = 2013
ORDER BY sv.Ten, sv.HoDem;

