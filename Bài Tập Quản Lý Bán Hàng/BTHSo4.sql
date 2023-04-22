--4.1 : Hãy cho biết mã hàng, tên hàng, đơn vị tính, mã loại hàng, tên loại hàng, mã nhà sản xuất, tên mã nhà sản xuất, và giá của các mặt hàng có thời gian bảo hành lớn hơn hoặc bằng 24 tháng
-- Chú ý : Truy Xuất Dữ Liệu Nhiều Bảng
-- Để Truy xuất dữ liệu từ nhiều bảng có thể được thực hiện bằng cách sử dụng câu lệnh JOIN. Để truy cập dữ liệu từ nhiều bảng, chúng ta sử dụng các loại như INNER JOIN, LEFT JOIN, RIGHT JOIN
-- và FULL OUTER JOIN. Từ khóa ONthường được sử dụng để xác định lớp quan hệ giữa các bảng. Ví dụ, để truy xuất tên của sinh viên và ngôn ngữ chuyên môn của họ, như sau:
-- SELECT s.Name, cs.Language
-- FROM Students AS s
--INNER JOIN CourseSpeciality as cs ON s.CourseId = cs.CourseId
select MaHang, TenHang, DonViTinh,
		LoaiHang.MaLoaiHang, TenLoaiHang, NhaSanXuat.MaNhaSX,
		TenNhaSX,Gia
from MatHang
INNER JOIN LoaiHang ON MatHang.MaLoaiHang = LoaiHang.MaLoaiHang
INNER JOIN NhaSanXuat ON MatHang.MaNhaSX = NhaSanXuat.MaNhaSX 
where ThoiGianBaoHanh >= 24

--4.2 Hãy cho biết thông tin về các mặt hàng và phân loại của mặt hàng của những mặt hàng được cung cấp
-- bởi nhà sẳn xuất có tên là "Hãng máy tính IBM".
select 
	TenHang,
	TenVietTat,
	DonViTinh,
	MaLoaiHang, 
	NhaSanXuat.MaNhaSX,
	ThoiGianBaoHanh,
	DonViTinhBaoHanh,
	MoTaDacTinh,
	Gia,
	NhaSanXuat.TenNhaSX
from MatHang 
INNER JOIN NhaSanXuat On MatHang.MaNhaSX  = NhaSanXuat.MaNhaSX
where TenNhaSX = N'Hãng máy tính IBM'

--4.3 Loại hàng "Máy tính xác tay" hiện có những mặt hàng nào, do ai sản xuất
select TenHang, TenNhaSX, TenLoaiHang
from LoaiHang 
Inner join MatHang on LoaiHang.MaLoaiHang = MatHang.MaLoaiHang
Inner Join NhaSanXuat on MatHang.MaNhaSX = NhaSanXuat.MaNhaSX
where TenLoaiHang = N'Máy tính xách tay'

--4.4 Hãy cho biết mã, tên và địa chỉ liên hệ của những khách hàng ở "Quảng Trị" hoặc "Thừa Thiên Huế"
select MaKhachHang,TenKhachHang,DiaChiLienHe,TinhThanh.TenTinh
from KhachHang Inner Join TinhThanh on KhachHang.MaTinh = TinhThanh.MaTinh
where TenTinh = N'Quảng Trị' or TenTinh = N'Thừa Thiên Huế'

--4.5 Hãy cho biết mã, tên, địa chỉ và tên tỉnh của những khách hàng thuộc nhóm "Đối Tác Thường Xuyên"
select MaKhachHang,TenKhachHang,DiaChiLienHe,TinhThanh.TenTinh,NhomKhachHang.TenNhomKH
from KhachHang Inner join TinhThanh on KhachHang.MaTinh = TinhThanh.MaTinh
Inner join NhomKhachHang on KhachHang.MaNhomKH = NhomKhachHang.MaNhomKH
where TenNhomKH = N'Đối tác thường xuyên'

--4.6 Hãy cho biết thông tin về các khách hàng mà số điện thoại bắt đầu bởi 054 và kết thức bởi số 6 hoặc số 9
select *
from KhachHang
where DienThoai like '054%[6,9]'

--4.7 Hãy cho biết số chứng tử, diễn giải, ngày lập chứng tử, ngày giao hàng của các chứng từ bán hàng của khách hàng có tên là "Trần Nguyên Phong"
select ct.SoChungTu, ct.DienGiai, ct.NgayLapChungTu, ct.NgayGiaoHang, kh.TenKhachHang
from ChungTuBanHang as ct 
Inner Join KhachHang as kh On ct.MaKhachHang = kh.MaKhachHang
Where TenKhachHang = N'Trần Nguyên Phong'

--4.8 Hãy cho biết chứng tứ số "X1-002" là của khách hàng nào? Khách ở tỉnh nào ? 
select  ct.SoChungTu, kh.TenKhachHang, tt.TenTinh
from ChungTuBanHang as ct
Inner Join KhachHang as kh on ct.MaKhachHang  = kh.MaKhachHang
Inner Join TinhThanh as tt on kh.MaTinh = tt.MaTinh
Where ct.SoChungTu = 'X1-002'

--4.9 Hãy cho biết mã hàng, tên hàng, tên nhà sản xuất, số lượng bán, (giá bán) và số tiền phải trả của các mặt hàng được bán trong (chứng từ) số "X1-002"
--(Số Tiền Phải Trả = Số Lượng Bán * Giá Bán )
select 
	mh.MaHang, 
	mh.TenHang, 
	nsx.TenNhaSX, 
	cttt.SoLuong, 
	cttt.DonGia,
	(cttt.SoLuong * cttt.DonGia) as SoTienPhaiTra
from MatHang as mh
	Inner Join NhaSanXuat as nsx on mh.MaNhaSX = nsx.MaNhaSX
	Inner Join ChiTietChungTu as cttt on mh.MaHang = cttt.MaHang
where cttt.SoChungTu = 'X1-002'

--4.10 Hãy cho biết Mã Hàng, Tên Hàng, Tên Loại Hàng, Tên Nhà Sản Xuất của các mặt hàng 
-- mà khách hàng "Nguyễn Hoàng Hà" đã từng mua
select mh.MaHang, mh.TenHang, lh.TenLoaiHang, nsx.TenNhaSX
from MatHang as mh
	inner join LoaiHang as lh on mh.MaLoaiHang = lh.MaLoaiHang
	inner join NhaSanXuat as nsx on mh.MaNhaSX = nsx.MaNhaSX
	inner join ChiTietChungTu as cttt on mh.MaHang = cttt.MaHang
	inner join ChungTuBanHang as ctbh on cttt.SoChungTu =ctbh.SoChungTu
	inner join KhachHang as kh on ctbh.MaKhachHang = kh.MaKhachHang
where kh.TenKhachHang = N'Nguyễn Hoàng Hà'

--4.11 Hãy cho biết thông tin về các mặt hàng mà các khách hàng ở tỉnh "Thừa Thiên Huế" đã từng mua
select mh.TenHang
      ,mh.TenVietTat
      ,mh.DonViTinh
      ,mh.MaLoaiHang
      ,mh.MaNhaSX
      ,mh.ThoiGianBaoHanh
      ,mh.DonViTinhBaoHanh
      ,mh.MoTaDacTinh
      ,mh.Gia
from MatHang as mh
	inner join ChiTietChungTu as cttt on mh.MaHang = cttt.MaHang
	inner join ChungTuBanHang as ctbh on cttt.SoChungTu =ctbh.SoChungTu
	inner join KhachHang as kh on ctbh.MaKhachHang = kh.MaKhachHang
	inner join TinhThanh as tt on kh.MaTinh = tt.MaTinh
where tt.TenTinh = N'Thừa Thiên Huế'

--4.12 Hãy cho biết tên, địa chỉ, số điện thoại của các khách hàng có chứng từ bán hàng phải giao hàng trong tháng 11 năm 2010
select kh.TenKhachHang, kh.DiaChiLienHe, kh.DienThoai, tt.TenTinh
from KhachHang as kh
	inner join TinhThanh as tt on kh.MaTinh = tt.MaTinh
	inner join ChungTuBanHang as ctbh on kh.MakhachHang = ctbh.MaKhachHang
where Year(ctbh.NgayGiaoHang) = 2010 And MONTH(ctbh.NgayGiaoHang) =
