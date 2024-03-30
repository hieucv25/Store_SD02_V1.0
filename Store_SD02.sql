Create DATABASE Store_SD02
GO

Use Store_SD02
GO

Create Table NhanVien(
    Id int IDENTITY PRIMARY KEY,
    MaNV varchar(12) unique,
    HoTen nvarchar(50),
    SDT varchar(50),
    NgaySinh date,
    TrangThai int,
    Email varchar(50) UNIQUE,
    MatKhau varchar(250),
    NgayTao DATETIME,
    AnhNhanVien varchar(100),
    IdChucVu int
)
Create Table ChucVu(
    Id int IDENTITY PRIMARY KEY,
    TenChucVu nvarchar(50)
)
Create Table KhachHang(
    Id int IDENTITY PRIMARY KEY,
    MaKH varchar(12) unique,
    HoTen nvarchar(50),
    SDT varchar(50),
    NgaySinh date,
    TrangThai int,
    Email varchar(50) UNIQUE,
    MatKhau varchar(250),
    NgayTao DATETIME,
    AnhKhachHang varchar(100),
    LoaiKhachHang int,
    GioiTinh bit,
)

Create Table DiaChi(
    Id int IDENTITY PRIMARY KEY,
    Tinh_ThanhPho nvarchar(50),
    Quan_Huyen nvarchar(50),
    Xa_Phuong nvarchar(50),
    DiaChiCuThe nvarchar(50),
    NgayTao DATETIME,
    IdKhachHang int
)

Create Table SanPham(
    Id int IDENTITY PRIMARY KEY,
    MaSP varchar(12) UNIQUE,
    TenSP nvarchar(50),
    LoaiSanPham bit, -- nam hoặc nữ
    SoLuong int,
    NgayTao DATETIME,
    DonGia money,
    MoTa nvarchar(250),
    TrangThai int,
    LinkAnh1 varchar(100),
    LinkAnh2 varchar(100),
    LinkAnh3 varchar(100),
    LinkAnh4 varchar(100),
    LinkAnh5 varchar(100),
    IdNhaCungCap int,
    MauSac nvarchar(50),
    Size int,
    DanhMuc bit, -- quần, áo, đồ bơi, v.v....
    IdTheLoai int, -- hiểu là dành cho môn thể thao nào 
    IdThuongHieu int
)

-- Bảng MoTaSanPham Dự Kiến Sẽ Sử Dụng Trong Thời Gian Sắp Tới
create Table MoTaSanPham(
    Id int IDENTITY PRIMARY KEY,
    IdSanPham int,
    NoiBat nvarchar(250),
    ChatLieu nvarchar(250),
    CongNghe nvarchar(250)
)

create table GioHang(
    Id int identity PRIMARY KEY,
    IdKhachHang int
)

create table GioHangChiTiet(
    Id int identity PRIMARY KEY,
    IdGioHang int,
    IdSanPham int,
    SoLuong int,
    NgayChinhSua DATETIME,
)

Create Table NhaCungCap(
    Id int identity PRIMARY KEY,
    TenNCC nvarchar(50),
    DiaChi nvarchar(250),
    MoTa NVARCHAR(250),
    SDT varchar(50) UNIQUE,
    Email VARCHAR(50) UNIQUE,
    ThongTinKhac NVARCHAR(250)
)

Create Table ThuongHieu(
    Id int identity PRIMARY KEY,
    TenTT nvarchar(50),
    MoTa nvarchar(250),
    Logo varchar(250),
    Email VARCHAR(50) UNIQUE,
    QuocGia varchar(50)
)

Create Table TheLoai(
    Id int identity PRIMARY KEY,
    Ten nvarchar(50),
    MoTa nvarchar(250),
    HinhAnh varchar(100)
)

Create Table SanPham_NhaCungCap(
    Id int IDENTITY PRIMARY KEY,
    IdSanPham int,
    IdNhaCungCap int
)
Create Table NhaCungCap_ThuongHieu(
    Id int IDENTITY PRIMARY KEY,
    IdNhaCungCap int,
    IdThuongHieu int
)

Create Table PhuongThucThanhToan(
    Id int IDENTITY PRIMARY KEY,
    Ten nvarchar(50)
)

Create Table ThongBao(
    Id int identity PRIMARY KEY,
    IdDonHang int,
    TrangThaiDonHang int,
    NoiDung nvarchar(max),
    NgayGui DATETIME,
)

Create Table ThongBao_KhachHang(
    Id int identity PRIMARY KEY,
    IdKhachHang int,
    IdThongBao int
)

Create Table KhuyenMai(
    Id int identity(1,1) PRIMARY KEY,
    TenKhuyenMai nvarchar(250),
    NgayBatDau date,
    NgayKetThuc date,
    TrangThai nvarchar(250),
    Banner varchar(200),
    LoaiKhuyenMai bit, -- Giảm % or giá tiền
    GiaTriGiam FLOAT,
    NgayTao datetime,
)

Create Table DonHang(
    Id int identity(1,1) PRIMARY KEY,
    MaDonHang varchar(12) UNIQUE,
    TrangThai int,
    IdKhachHang int,
    IdNhanVien int,
    IdPhuongThucThanhToan int,
    PhiVanChuyen money,
    TongTien money,-- Tổng tiền là giá của sản phẩm + phí giao hàng
    TienPhaiTra money,-- Là số tiền phải trả sau khi áp voucher hoặc mua hàng vào dịp khuyến mãi
    NgayTao DATETIME,
    GhiChu nvarchar(50),
    IdThongTinVanChuyen int
)

Create Table ChiTietDonHang(
    Id int identity PRIMARY KEY,
    IdDonHang int,
    IdSanPham int,
    SoLuong int,
    NgayTao DATETIME,
    IdKhuyenMai int,
    GiaGoc money,
    GiaThoiDiemMua money, -- Giá Gốc Và Giá Thời Điểm Mua Là Giả Của 1 Sản Phẩm Hay Có Thể Hiểu Là Đơn Giá
    TongTien money, -- Tổng Tiền Là Giá Tại Thời Điểm Mua * Số Lượng
)

Create Table DonViVanChuyen(
    Id int IDENTITY PRIMARY KEY,
    TenDonVi nvarchar(50),
    Email nvarchar(50) unique
)

Create Table ThongTinVanChuyen(
    Id int IDENTITY PRIMARY KEY,
    SDT_NguoiNhan varchar(50),
    TenNguoiNhan nvarchar(50),
    Tinh_ThanhPho nvarchar(50),
    Quan_Huyen nvarchar(50),
    Xa_Phuong nvarchar(50),
    DiaChiCuThe nvarchar(50),
    IdDonViVanChuyen int
)

Create Table SanPham_KhuyenMai(
    Id int identity primary key,
    IdSanPham int,
    IdKhuyenMai int
)

Create Table TroChuyen(
    Id int identity PRIMARY KEY,
    IdKhachHang int,
    IdNhanVien int,
    NoiDung nvarchar(250),
    ThoiGianGui Datetime,
)

Create Table DanhSachYeuThich(
	Id int identity Primary Key,
	IdKhachHang int,
	IdSanPham int,
	NgayTao datetime
)



-- Tạo khoá ngoại cho các bảng

-- Tạo khoá ngoại cho bảng nhân viên

alter table NhanVien ADD Constraint FK_NhanVien_ChucVu FOREIGN KEY(IdChucVu) REFERENCES ChucVu(Id)

-- Tạo khoá ngoại cho bảng địa chỉ

alter table DiaChi ADD Constraint FK_DiaChi_KhachHang FOREIGN KEY(IdKhachHang) references KhachHang(Id)

-- Tạo khoá ngoại cho bảng Sản Phẩm

alter table SanPham ADD CONSTRAINT FK_SanPham_NhaCungCap FOREIGN KEY(IdNhaCungCap) REFERENCES NhaCungCap(Id)

alter table SanPham ADD CONSTRAINT FK_SanPham_TheLoai FOREIGN KEY(IdTheLoai) REFERENCES TheLoai(Id)

alter table SanPham ADD CONSTRAINT FK_SanPham_ThuongHieu FOREIGN KEY(IdThuongHieu) REFERENCES ThuongHieu(Id)

-- Tạo khoá ngoại cho bảng giỏ hàng

alter table GioHang ADD Constraint FK_GioHang_KhachHang FOREIGN KEY(IdKhachHang) REFERENCES KhachHang(Id)

-- Tạo Khoá ngoại cho bảng chi tiết giỏ hàng

alter table GioHangChiTiet ADD CONSTRAINT FK_GioHangChiTiet_SanPham FOREIGN KEY(IdSanPham) REFERENCES SanPham(Id)

alter table GioHangChiTiet ADD Constraint FK_GioHangChiTiet_GioHang FOREIGN KEY(IdGioHang) REFERENCES GioHang(Id)

-- Tạo khoá ngoại cho bảng sản phẩm - nhà cung câp

alter table SanPham_NhaCungCap ADD CONSTRAINT FK_Sp_Ncc_1 FOREIGN KEY(IdSanPham) references SanPham(Id)

alter table SanPham_NhaCungCap ADD CONSTRAINT FK_Sp_Ncc_2 FOREIGN Key(IdNhaCungCap) REFERENCES NhaCungCap(Id)

-- Tạo khoá ngoại cho bảng nhà cung cấp - thương hiệu

alter table NhaCungCap_ThuongHieu ADD CONSTRAINT FK_NCC_TT_1 FOREIGN KEY(IdNhaCungCap) REFERENCES NhaCungCap(Id)

alter table NhaCungCap_ThuongHieu ADD CONSTRAINT FK_NCC_TT_2 FOREIGN KEY(IdThuongHieu) references ThuongHieu(Id)

-- Tạo khoá ngoại cho bảng thông báo

alter table ThongBao ADD CONSTRAINT FK_ThonBao FOREIGN KEY(IdDonHang) REFERENCES DonHang(Id)

-- Tạo khoá ngoại cho bảng thông báo - khách hàng

alter table ThongBao_KhachHang ADD CONSTRAINT FK_ThongBao_1 FOREIGN KEY(IdThongBao) references ThongBao(Id)

alter table ThongBao_KhachHang ADD Constraint FK_ThongBao_2 FOREIGN KEY(IdKhachHang) REFERENCES KhachHang(Id)

-- Tạo khoá ngoại cho bảng đơn hàng

alter table DonHang ADD CONSTRAINT FK_DonHang_KhachHang FOREIGN KEY(IdKhachHang) REFERENCES KhachHang(Id)

alter table DonHang ADD Constraint FK_DonHang_NhanVien FOREIGN KEY(IdNhanVien) REFERENCES NhanVien(Id)

alter table DonHang ADD Constraint FK_DonHang_PhuongThucThanhToan FOREIGN KEY(IdPhuongThucThanhToan) REFERENCES PhuongThucThanhToan(Id)

alter table DonHang ADD CONSTRAINT FK_DonHang_ThongTinVanChuyen FOREIGN KEY(IdThongTinVanChuyen) references ThongTinVanChuyen(Id)

-- Tạo khoá ngoại cho bảng chi tiết đơn hàng

alter table ChiTietDonHang ADD CONSTRAINT FK_CTDH_SanPham FOREIGN KEY(IdSanPham) References SanPham(Id)

alter table ChiTietDonHang ADD CONSTRAINT FK_CTDH_DonHang FOREIGN KEY(IdDonHang) References DonHang(Id)

alter table ChiTietDonHang ADD CONSTRAINT FK_CTDH_KhuyenMai Foreign Key (IdKhuyenMai) References KhuyenMai(Id)

-- Tạo Khoá ngoại cho bảng thông tin vận chuyển

alter table ThongTinVanChuyen ADD CONSTRAINT FK_ThongTinVanChuyen FOREIGN KEY(IdDonViVanChuyen) References DonViVanChuyen(Id)

-- Tạo khoá ngoại cho bảng trò chuyện

alter table TroChuyen ADD Constraint FK_Chat_1 Foreign Key(IdKhachHang) REFERENCES KhachHang(Id)

alter table TroChuyen ADD CONSTRAINT FK_Chat_2 FOREIGN KEY(idNhanVien) REFERENCES NhanVien(Id)

-- Tạo khoá ngoại cho bảng sản phẩm - khuyễn mãi

alter table SanPham_KhuyenMai ADD Constraint FK_SanPham_KhuyenMai_1 Foreign Key(IdSanPham) References SanPham(Id)

alter table SanPham_KhuyenMai Add Constraint FK_SanPham_KhuyenMai_2 Foreign Key(IdKhuyenMai) References KhuyenMai(Id)

-- Tạo khoá ngoại cho bảng danh sách yêu thích

alter table DanhSachYeuThich ADD Constraint FK_DanhSachYeuThich_SanPham Foreign key(IdSanPham) References SanPham(Id)

alter table DanhSachYeuThich ADD Constraint FK_DanhSachYeuThich_KhachHang Foreign Key(IdKhachHang) References KhachHang(Id)

-- Thêm thuộc tính mật khẩu mã hoá cho Nhân Viên và Khách Hàng

alter table NhanVien add MatKhauMaHoa varchar(250)

alter table KhachHang add MatKhauMaHoa varchar(250)

-- Sửa kiểu dữ liệu của thuộc tính danh mục trong bảng sản phẩm bit -> int

alter table SanPham alter COLUMN DanhMuc int

-- Xoá Bảng Sản Phẩm - Nhà Cung Cấp

alter table SanPham_NhaCungCap drop Constraint FK_Sp_Ncc_1

alter table SanPham_NhaCungCap drop Constraint FK_Sp_Ncc_2

Drop TABLE SanPham_NhaCungCap
 

 -- Xoá các thuộc tính Tinh_ThanhPho,Quan_Huyen,Xa_Phuong,DiaChiCuThe của bảng thông tin vận chuyển
 -- Thay thế bằng Id DiaChi
 alter table ThongTinVanChuyen drop column Tinh_ThanhPho
 alter table ThongTinVanChuyen drop column Quan_Huyen
 alter table ThongTinVanChuyen drop column Xa_Phuong
 alter table ThongTinVanChuyen drop column DiaChiCuThe

 alter table ThongTinVanChuyen add idDiaChi int

 alter table ThongTinVanChuyen add Constraint FK_DiaChi Foreign Key(idDiaChi) references DiaChi(id)

-- Cập Nhật Bảng TroChuyen

alter table TroChuyen drop column NoiDung
alter table TroChuyen drop column ThoiGianGui
alter table TroChuyen add NgayTao datetime
alter table TroChuyen add TrangThai int

-- Tạo Bảng TroChuyenChiTiet

create table TroChuyenChiTiet(
	Id int identity primary key,
	NguoiGui bit, -- nhân viên hoặc khách hàng
	IdNguoiGui int,
	NoiDung nvarchar(250),
	ThoiGianGui datetime,
	LoaiTinNhan int,-- hình ảnh, văn bản hoặc file
	idTroChuyen int,
)

alter table TroChuyenChiTiet add Constraint FK_TroChuyen Foreign Key(idTroChuyen) references TroChuyen(id)
alter table TroChuyenChiTiet add LinkFile varchar(max) default null -- link ảnh hoặc tệp tin nếu có

select * from TroChuyen

insert into ChucVu(TenChucVu) values
('STAFF'),
('ADMIN')


insert into NhanVien(MaNV,HoTen,SDT,NgaySinh,TrangThai,Email,MatKhau,NgayTao,IdChucVu,MatKhauMaHoa) values 
('NV1','Chu Văn Hiếu','0359693203','2003/08/20',0,'chuhieu05@gmail.com','12345',GETDATE(),2,'$2a$12$LXiqdQLcMVOAp5cuo1ejne8GhjhdkjKFQqVSo1lxHANeZTJ/uxhIW'),
('NV2','Nguyễn Văn Nam','0379693203','1998/06/10',0,'nguyennam44@gmail.com','123456',GETDATE(),1,'$2a$12$TdaMnaaCU3/B1Ao7sw8DGuuJFob99.JwBA2vcGoT5ulfN3sYIDqYm')


insert into KhachHang(MaKH,HoTen,SDT,NgaySinh,TrangThai,Email,MatKhau,NgayTao,LoaiKhachHang,GioiTinh,MatKhauMaHoa) values
('KH1','Nguyen Van Tu','037289994','1997/12/01',0,'tunv@gmail.com','abcdef',GETDATE(),0,0,'$2a$12$DM64cbiaRINgeAz1u5hsFOOHXyp2kqXHwFv7sZ9rBEoDeYc/AxopO'),
('KH2','Le Ngoc Anh','097289994','1999/12/09',0,'anhnl22@gmail.com','abcdef',GETDATE(),0,0,'$2a$12$DM64cbiaRINgeAz1u5hsFOOHXyp2kqXHwFv7sZ9rBEoDeYc/AxopO')


-- xoá thuộc tính size + màu sắc tại sản phẩm 
alter table SanPham drop column size
alter table SanPham drop Column MauSac
-- tạo thêm 1 bảng sản phẩm chi tiết
Create Table SanPhamChiTiet(
	id int identity Primary Key,
	idSanPham int,
	MauSac nvarchar(250),
	Size int
)
Alter table SanPhamChiTiet Add Constraint FK_SPTT Foreign Key (idSanPham) references SanPham(Id)
-- Xoá bảng thông báo - Khách Hàng
Alter Table ThongBao_KhachHang drop Constraint FK_ThongBao_1
Alter Table ThongBao_KhachHang drop Constraint FK_ThongBao_2
Drop Table ThongBao_KhachHang
-- Thêm Khoá Ngoại Id Khách Hàng vào bảng thông báo
Alter Table ThongBao add IdKhachHang int
Alter Table ThongBao add Constraint FK_ThongBao_KhachHang Foreign Key(IdKhachHang) references KhachHang(id)
-- Xoá Thuộc tính ảnh của sản phẩm, Thêm bảng AnhSanPham
Alter Table SanPham drop column LinkAnh1
Alter Table SanPham drop column LinkAnh2
Alter Table SanPham drop column LinkAnh3
Alter Table SanPham drop column LinkAnh4
Alter Table SanPham drop column LinkAnh5

Create Table AnhSanPham(
  Id int identity Primary Key,
  IdSanPham int,
  LinkAnh varchar(250),
)
ALter table AnhSanPham add Constraint FK_Anh_SanPham Foreign Key (IdSanPham) references SanPham (Id)
-- update some field data in table SanPhamChiTiet
alter table SanPhamChiTiet alter column Size varchar(5)
alter table SanPhamChiTiet add ngayTao datetime
-- Tạo thêm bảng màu sắc

create table MauSac(
	id int Identity primary key,
	ten nvarchar(250),
)
-- cập nhật khoá ngoại
alter table SanPhamChiTiet drop column MauSac
alter table SanPhamChiTiet add MauSac int
alter table SanPhamChiTiet add constraint FK_MauSac foreign key (MauSac) references MauSac(id)
alter table SanPhamChiTiet add SoLuong int

-- xoá khoá ngoại id sản phẩm của bảng chi tiết đơn hàng thay bằng id chi tiết sản phẩm
Alter table ChiTietDonHang  drop Constraint FK_CTDH_SanPham 
Alter table ChiTietDonHang drop column idSanPham
Alter table ChiTietDonHang add idSanPhamChiTiet int
Alter table ChiTietDonHang Add Constraint FK_CTDH_SanPham  Foreign Key (idSanPhamChiTiet) references SanPhamChiTiet(Id)
-- tương tự như chỉnh sửa ở trên
alter table GioHangChiTiet drop CONSTRAINT FK_GioHangChiTiet_SanPham
alter table GioHangChiTiet drop column IdSanPham
alter table GioHangChiTiet add IdSanPhamChiTiet int
alter table GioHangChiTiet ADD CONSTRAINT FK_GioHangChiTiet_SanPhamChiTiet FOREIGN KEY(IdSanPhamChiTiet) REFERENCES SanPhamChiTiet(Id)
-- chỉnh sửa khoá ngoại cho bảng Ảnh Sản Phẩm
alter table AnhSanPham drop constraint FK_Anh_SanPham
alter table AnhSanPham drop column IdSanPham
alter table AnhSanPham add IdSanPhamChiTiet int
alter table AnhSanPham add constraint FK_Anh_ChiTietSanPham foreign key (IdSanPhamChiTiet) references SanPhamChiTiet(id)
-- thêm thuộc tính tiền khách trả vào đơn hàng 
alter table DonHang add tienKhachTra money
-- thêm sdt vào địa chỉ
alter table DiaChi add sdt nvarchar(10)
-- data insert thể loại
INSERT INTO TheLoai(ten, MoTa) VALUES
('Bóng Đá', 'Môn thể thao vua được yêu thích trên toàn thế giới với sự cạnh tranh gay gắt và đam mê mãnh liệt.'),
('Bóng Bàn', 'Môn thể thao nhanh nhẹn và kỹ thuật, được đánh giá cao về sự tập trung và phản xạ.'),
('Bóng Rổ', 'Môn thể thao đội hình đồng đội năng động và hấp dẫn, thu hút sự quan tâm của hàng triệu người hâm mộ.'),
('Bóng Chuyền', 'Môn thể thao đội hình kỹ thuật và linh hoạt, đòi hỏi sự phối hợp và tinh thần đồng đội cao.'),
('Bóng Chày', 'Môn thể thao đội hình cổ điển của nước Mỹ, nổi tiếng với sự mạnh mẽ và kỹ thuật.'),
('Cầu Lông', 'Môn thể thao nhanh nhẹn và tinh tế, yêu cầu sự linh hoạt và kỹ thuật.'),
('Tennis', 'Môn thể thao cá nhân đòi hỏi sự lanh lợi và kỹ thuật, phổ biến trên toàn thế giới.'),
('Bóng Bàn', 'Môn thể thao nhanh nhẹn và kỹ thuật, được đánh giá cao về sự tập trung và phản xạ.'),
('Gym', 'Hoạt động thể chất để cải thiện sức khỏe và vóc dáng, phổ biến trong cả giới nam và nữ.'),
('Golf', 'Môn thể thao lịch sự và tĩnh lặng, yêu cầu sự kiên nhẫn và kỹ thuật.'),
('Bơi Lội', 'Môn thể thao nước phổ biến, giúp cải thiện sức khỏe toàn diện và tăng cường sức bền.')
-- thêm thuộc tính deafault vào bảng địa chỉ
alter table DiaChi add deafault bit
sp_rename 'DiaChi.deafault', 'IsDefault','COLUMN';
-- Xoá Khoá Ngoại Id Địa Chỉ Của Bảng Thông Tin Vận Chuyển
alter table ThongTinVanChuyen drop constraint FK_DiaChi

alter table ThongTinVanChuyen add Tinh_ThanhPho nvarchar(100)
alter table ThongTinVanChuyen add Quan_Huyen nvarchar(100)
alter table ThongTinVanChuyen add Xa_Phuong nvarchar(100)
alter table ThongTinVanChuyen add DiaChiCuThe nvarchar(255)

-- xoá bảng sản phẩm _ khuyễn mãi
drop table SanPham_KhuyenMai
-- Thêm Khoá Ngoại Bảng Thông Báo
alter table ThongBao add IdNhanVien int
alter table ThongBao add constraint NhanVien_ThongBao FOREIGN KEY(IdNhanVien) REFERENCES NhanVien(Id)
