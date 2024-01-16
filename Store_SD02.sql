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

create table TroChuyen(
    Id int identity PRIMARY KEY,
    IdKhachHang int,
    IdNhanVien int,
    NoiDung nvarchar(250),
    ThoiGianGui Datetime,
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