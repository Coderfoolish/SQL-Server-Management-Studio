﻿DROP DATABASE [QUANLYSINHVIEN];
CREATE DATABASE [QUANLYSINHVIEN];

DROP TABLE [KHOA];
CREATE TABLE [KHOA](
	MAKHOA NVARCHAR(4) PRIMARY KEY,
	TENKHOA NVARCHAR(100),
	NAMTHANHLAP INT
);

DROP TABLE [SVIEN];
CREATE TABLE [SVIEN](
	MASV NVARCHAR(8) PRIMARY KEY,
	MAKHOA NVARCHAR(4),
	TENSV NVARCHAR(100),
	NAM INT
);


DROP TABLE [KQUA];
CREATE TABLE [KQUA](
	MASV NVARCHAR(8),
	MAHP INT,
	DIEM DECIMAL(4,1),
	PRIMARY KEY (MASV, MAHP)
);

DROP TABLE [HPHAN];
CREATE TABLE [HPHAN](
	MAHP INT PRIMARY KEY,
	MAMH NVARCHAR(6),
	HOCKY INT,
	NAM INT,
	GV NVARCHAR(50)
);

DROP TABLE [DKIEN];
CREATE TABLE [DKIEN](
	MAMH NVARCHAR(6),
	MAMH_TRUOC NVARCHAR(6),
	PRIMARY KEY(MAMH, MAMH_TRUOC)
);

DROP TABLE [MHOC];
CREATE TABLE [MHOC](
	MAMH NVARCHAR(6) PRIMARY KEY,
	MAKHOA NVARCHAR(4),
	TENMH NVARCHAR(100),
	TINCHI INT
);

INSERT INTO [KHOA] (MAKHOA, TENKHOA, NAMTHANHLAP)
VALUES 
	(N'TOAN', N'Toán', 1976),
	(N'HOA', N'Hóa', 1980),
	(N'SINH', N'Sinh', 1981),
	(N'VLY', N'Vật lý', 1982);

INSERT INTO [DKIEN] (MAMH, MAMH_TRUOC)
VALUES	
	(N'TH0003', N'TO0001'),
	(N'TH0003', N'TH0002'),
	(N'TH0002', N'TH0001'),
	(N'TH0002', N'HH0001'),
	(N'VL0002', N'VL0001');

INSERT INTO [SVIEN] (MASV, TENSV, NAM, MAKHOA) 
VALUES	
	(N'K27.0017', N'Nguyễn Công Phú', 1, N'TOAN'),
	(N'K26.0008', N'Phan Anh Khanh', 2, N'TOAN'),
	(N'K25.0005', N'Lý Thành', 3, N'HOA'),
	(N'K27.0018', N'Hàn Quốc Việt', 2, N'VLY');

INSERT INTO [KQUA] (MASV, MAHP, DIEM)
VALUES 
	(N'K27.0017', 4, 9.5),
	(N'K26.0008', 1, 10),
	(N'K25.0005', 6, 6),
	(N'K27.0018', 2, 8),
	(N'K26.0008', 3, 9);

INSERT INTO [MHOC] (MAMH, TENMH, TINCHI, MAKHOA)
VALUES  
	(N'TH0001', N'Tin học đại cương A1', 4, N'TOAN'),
	(N'TH0002', N'Cấu trúc dữ liệu', 4, N'TOAN'),
	(N'TO0001', N'Toán rời rạc', 3, N'TOAN'),
	(N'HH0001', N'Hóa đại cương A1', 5, N'HOA'),
	(N'HH0002', N'Hóa đại cương A2', 5, N'HOA'),
	(N'VL0002', N'Vật lý đại cương A2', 4, N'VLY'),
	(N'TH0003', N'Cơ sở dữ liệu', 5, N'TOAN'),
	(N'VL0001', N'Vật lý đại cương A1', 5, N'VLY');

INSERT INTO [HPHAN] (MAHP, MAMH, HOCKY, NAM, GV)
VALUES  
	(1, N'TH0001', 1, 1996, N'N. D. Lâm'),
	(2, N'VL0001', 1, 1996, N'N. T. Dung'),
	(3, N'TH0002', 1, 1997, N'H. Tuấn'),
	(4, N'TH0001', 1, 1997, N'N. D. Lâm'),
	(5, N'TH0003', 2, 1997, N'N. C. Phú'),
	(6, N'HH0001', 1, 1996, N'L. T. Phúc'),
	(7, N'TH0002', 1, 1998, N'P. T. Như'),
	(8, N'TO0001', 1, 1996, N'N. C. Phú');	

ALTER TABLE [DKIEN] ADD 
CONSTRAINT [FK_DKIEN_MHOC1] FOREIGN KEY(MAMH) REFERENCES  MHOC(MAMH),
CONSTRAINT [FK_DKIEN_MHOC2] FOREIGN KEY(MAMH_TRUOC) REFERENCES  MHOC(MAMH);

ALTER TABLE [MHOC] ADD
CONSTRAINT [FK_MHOC_KHOA] FOREIGN KEY(MAKHOA) REFERENCES KHOA(MAKHOA);


ALTER TABLE [HPHAN] ADD
CONSTRAINT [FK_HPHAN_MHOC] FOREIGN KEY(MAMH) REFERENCES MHOC(MAMH);


ALTER TABLE [SVIEN] ADD
CONSTRAINT [FK_SVIEN_KHOA] FOREIGN KEY(MAKHOA) REFERENCES KHOA(MAKHOA);

ALTER TABLE [KQUA] ADD 
CONSTRAINT [FK_KQUA_HPHAN] FOREIGN KEY(MAHP) REFERENCES  HPHAN(MAHP);

ALTER TABLE [KQUA] ADD 
CONSTRAINT [FK_KQUA_SVIEN] FOREIGN KEY(MASV) REFERENCES  SVIEN(MASV);





