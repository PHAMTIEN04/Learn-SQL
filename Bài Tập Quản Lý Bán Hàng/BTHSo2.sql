--2.1 : Hiển thị Mã Hàng, Tên Hàng, Đơn Vị Tính và Giá của các mặt hàng có thời gian bảo hành tối thiểu là 24 tháng 
Select MaHang,TenHang, DonViTinh, 
		Gia
From MatHang
Where ThoiGianBaoHanh >= 24

--2.2 : Hãy cho biết Mã Hàng, Tên Hàng và Giá của các mặt hàng có giá từ 400.000 đến 1.000.000
Select MaHang,TenHang, 
		Gia
From MatHang
Where Gia >= 400000 and Gia <= 1000000

--2.3 : Hiển thị những mặt hàng có thời gian bảo hành 24 tháng và không có tên viết tắt.
-- Thông tin hiển thị bao gồm : Mã Hàng, Tên Hàng, Giá, Thời Gian Bảo Hành, Tên Viết Tắt
Select MaHang, TenHang, Gia,ThoiGianBaoHanh,
		TenVietTat
From MatHang
Where ThoiGianBaoHanh = 24 and TenVietTat is NULL

--2.4 : Hãy cho biết ông "Nguyễn Thanh Bình" là người liên hệ của khách hàng nào? Địa chỉ ở đâu ?
Select TenKhachHang, NguoiLienHe, DiaChiLienHe
From KhachHang
Where NguoiLienHe = N'Nguyễn Thanh Bình'

--2.5 : Cho biết Mã Hàng, Tên Hàng, Thời Gian Bảo Hành và Giá của những những mặt hàng có mã hàng là "PC","LAPTOP" hoặc"NET"
-- Kết quả sắp xếp theo thứ tự giảm dần theo giá hàng. Cú pháp : oder by value desc
-- Kết quả sắp xếp theo thứ tự tăng dần theo giá hàng. Cú pháp : oder by value asc
Select MaHang, TenHang, ThoiGianBaoHanh, Gia
From MatHang
where MaLoaiHang = 'PC' or MaLoaiHang='LAPTOP' or MaLoaiHang = 'NET'
ORDER BY Gia Desc

--2.6 : Các Mặt Hàng đang sử dụng Đơn Vị Tính nào ?
Select distinct DonViTinh
From MatHang

--2.7 : Hiển thị danh sách các mặt hàng mà trong tên mặt hàng có chữ "HDD"
Select * 
From MatHang
Where TenHang Like ('%HDD%')

--2.8 : Hãy cho biết thong tin về các khách hàng có số điện thoại bắt đầu bởi 054 và kết thúc bởi 5 hoặc số 9
Select * 
From KhachHang
Where DienThoai Like ('054%[5,9]')

--2.9 :
Select TenKhachHang,DiaChiLienHe
From KhachHang
where DiaChiLienHe like (N'%Huế%')

--2.10: Giả sử tỷ giá USD hiện tại là 1USD = 25.600 VND
-- Hãy cho biết Mã Hàng, Tên Hàng, Đơn Vị Tính, Thời Gian Bảo Hành và Giá của các mặt hàng theo yêu cầu sau :
-- Thời gian bảo hành phải viết dưới dạng :
---- + X Days (Nếu đơn vị tính bảo hành là Ngày)
---- + X Weeks (Nếu đơn vị tính bảo hành là Tuần)
---- + X Moths (Nếu đơn vị tính bảo hành là Tháng)
---- + X Years (Nếu đơn vị tính bảo hành là Năm)
-- Giá của mặt hàng được hiển thị theo đơn vị tiền tệ là USD (tính theo tỷ giá đã cho ở trên)
Select MaHang, TenHang, DonViTinh, ThoiGianBaoHanh, 
		Case 
		When DonViTinhBaoHanh = 'Ngày' Then CONCAT(ThoiGianBaoHanh,' Day')
		When DonViTinhBaoHanh ='Tuần' Then CONCAT(ThoiGianBaoHanh,'Day')
		When DonViTinhBaoHanh = 'Tháng' Then CONCAT(ThoiGianBaoHanh,'Months')
		When DonViTinhBaoHanh ='Năm' Then  CONCAT(ThoiGianBaoHanh,'Years')
		
		END as DonViTinhBaoHanh,
		Gia / 25600 as GiaUSD
From MatHang
