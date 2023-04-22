select  
	TenHang,
	SUM(Gia) 
from MatHang
Group By TenHang
--"Group By" là một câu lệnh trong SQL được sử dụng để nhóm các bản ghi trong một bảng dữ liệu theo giá trị của một hoặc nhiều cột. Kết quả được trả về là một bảng mới chứa các bản ghi được nhóm lại thành các nhóm dựa trên các giá trị của cột được chỉ định trong "Group By".

--Khi sử dụng "Group By", các bản ghi có giá trị giống nhau trong cột được chỉ định sẽ được nhóm lại thành một nhóm duy nhất trong kết quả truy vấn. Sau đó, các hàm tổng hợp như SUM, COUNT, AVG,... có thể được sử dụng để tính toán các giá trị thống kê trên các nhóm này.

--Ví dụ, để tìm tổng số sản phẩm được bán cho mỗi nhà sản xuất trong bảng "Products", ta có thể sử dụng câu lệnh sau:

--sql
--Copy code
--SELECT Manufacturer, SUM(Quantity)
--FROM Products
--GROUP BY Manufacturer;
--Câu lệnh này sẽ nhóm các sản phẩm theo nhà sản xuất và tính tổng số lượng sản phẩm được bán cho mỗi nhà sản xuất. Kết quả truy vấn sẽ trả về một bảng mới với hai cột: "Manufacturer" và "SUM(Quantity)", với mỗi hàng đại diện cho một nhà sản xuất và tổng số lượng sản phẩm
