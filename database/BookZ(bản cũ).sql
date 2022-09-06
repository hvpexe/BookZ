-- chạy lần lượt 2 lệnh này
CREATE DATABASE BookZ
drop database 
DROP DATABASE BookZ
USE BookZ
-- Lệnh tạo table
CREATE TABLE Book (
  BookID         char(6) NOT NULL, 
  Title          nvarchar(120) NOT NULL, 
  Author         nvarchar(120) NULL, 
  Publisher      nvarchar(120) NULL, 
  Language       nvarchar(20) NULL, 
  Cover          varchar(255) NULL, 
  Description    ntext NULL, 
  NoDownload     int NOT NULL, 
  FilePDF        varchar(255) NULL, 
  FileEpub       varchar(255) NULL, 
  IsAccepted     bit NOT NULL, 
  DateUpload     date NOT NULL, 
  LastDateEdit   date NULL, 
  MemberUpload   char(5) NOT NULL, 
  MemberLastEdit char(5) NULL, 
  CategoryID     char(3) NULL, 
  PRIMARY KEY (BookID));
CREATE TABLE Category (
  CategoryID   char(3) NOT NULL, 
  CategoryName nvarchar(50) NOT NULL, 
  PRIMARY KEY (CategoryID));
CREATE TABLE Download (
  DateDownload date NOT NULL, 
  BookID       char(6) NOT NULL, 
  MemberID     char(5) NOT NULL);
CREATE TABLE Member (
  MemberID       char(5) NOT NULL, 
  Email          varchar(255) NOT NULL UNIQUE, 
  Password       varchar(255) NOT NULL, 
  Avatar         varchar(255) NULL, 
  Role           varchar(10) NOT NULL, 
  FirstName      nvarchar(20) NOT NULL, 
  LastName       nvarchar(50) NULL, 
  Birthday       date NOT NULL, 
  NoUploadedBook int NOT NULL, 
  Gender         varchar(10) NOT NULL, 
  PRIMARY KEY (MemberID));
CREATE TABLE Rating (
  RatingID     char(6) NOT NULL, 
  Star         int NOT NULL, 
  Comment      nvarchar(255) NULL, 
  DateRating   date NOT NULL, 
  LastDateEdit date NULL, 
  BookID       char(6) NOT NULL, 
  MemberID     char(5) NOT NULL, 
  PRIMARY KEY (RatingID));
CREATE TABLE ReportBook (
  DateReport    date NOT NULL, 
  Detail        nvarchar(255) NOT NULL, 
  BookID        char(6) NOT NULL, 
  MemberID      char(5) NOT NULL, 
  ReportStateID char(2) NOT NULL, 
  ReportTypeID  char(3) NOT NULL);
CREATE TABLE ReportRating (
  DateReport    date NOT NULL, 
  Detail        nvarchar(255) NOT NULL, 
  MemberID      char(5) NOT NULL, 
  RatingID      char(6) NOT NULL, 
  ReportStateID char(2) NOT NULL);
CREATE TABLE ReportState (
  ReportStateID char(2) NOT NULL, 
  ReportState   nvarchar(20) NOT NULL, 
  PRIMARY KEY (ReportStateID));
CREATE TABLE ReportType (
  ReportTypeID char(3) NOT NULL, 
  Type         nvarchar(255) NOT NULL, 
  PRIMARY KEY (ReportTypeID));
ALTER TABLE Book ADD CONSTRAINT FKBook950482 FOREIGN KEY (MemberLastEdit) REFERENCES Member (MemberID);
ALTER TABLE Book ADD CONSTRAINT FKBook712907 FOREIGN KEY (CategoryID) REFERENCES Category (CategoryID);
ALTER TABLE ReportRating ADD CONSTRAINT FKReportRati846935 FOREIGN KEY (RatingID) REFERENCES Rating (RatingID);
ALTER TABLE Download ADD CONSTRAINT FKDownload466591 FOREIGN KEY (BookID) REFERENCES Book (BookID);
ALTER TABLE ReportBook ADD CONSTRAINT FKReportBook659826 FOREIGN KEY (BookID) REFERENCES Book (BookID);
ALTER TABLE Rating ADD CONSTRAINT FKRating736872 FOREIGN KEY (BookID) REFERENCES Book (BookID);
ALTER TABLE ReportBook ADD CONSTRAINT FKReportBook996857 FOREIGN KEY (ReportTypeID) REFERENCES ReportType (ReportTypeID);
ALTER TABLE ReportRating ADD CONSTRAINT FKReportRati870546 FOREIGN KEY (ReportStateID) REFERENCES ReportState (ReportStateID);
ALTER TABLE ReportBook ADD CONSTRAINT FKReportBook849915 FOREIGN KEY (ReportStateID) REFERENCES ReportState (ReportStateID);
ALTER TABLE Download ADD CONSTRAINT FKDownload32955 FOREIGN KEY (MemberID) REFERENCES Member (MemberID);
ALTER TABLE ReportRating ADD CONSTRAINT FKReportRati63346 FOREIGN KEY (MemberID) REFERENCES Member (MemberID);
ALTER TABLE ReportBook ADD CONSTRAINT FKReportBook812217 FOREIGN KEY (MemberID) REFERENCES Member (MemberID);
ALTER TABLE Rating ADD CONSTRAINT FKRating762673 FOREIGN KEY (MemberID) REFERENCES Member (MemberID);
ALTER TABLE Book ADD CONSTRAINT FKBook935807 FOREIGN KEY (MemberUpload) REFERENCES Member (MemberID);

INSERT INTO Category(CategoryID, CategoryName) VALUES 
('C00', N'Văn học'),
('C01', N'Tâm lý - Kỹ năng sống'),
('C02', N'Lịch sử - Địa lý'),
('C03', N'Tôn giáo - Triết học'),
('C04', N'Chính trị - Pháp luật'),
('C05', N'Khoa học kỹ thuật'),
('C06', N'Kinh tế'),
('C07', N'Sức khoẻ'),
('C08', N'Nhân vật - Sự kiện'),
('C09', N'Thiếu nhi'),
('C10', N'Ngoại ngữ'),
('C11', N'Giáo trình');

INSERT INTO ReportState(ReportStateID, ReportState) VALUES 
('S0', 'Processing'),
('S1', 'Completed'),
('S2', 'Denied');

INSERT INTO ReportType(ReportTypeID, Type) VALUES 
('T00', 'Remove the book (spam, inappropriate file)'),
('T01', 'Damaged File'),
('T02', 'Broken link'),
('T03', 'Wrong book information'),
('T04', 'Other problem');

INSERT INTO Member(MemberID, Email, Password, Avatar, Role, FirstName, LastName, Birthday, NoUploadedBook, Gender) VALUES 
('M0000', 'admin0@gmail.com', '123456789', 'admin0.jpg', 'admin', 'Phu', 'Huynh', '06-05-2002', 19, 'M'),
('M0001', 'admin1@gmail.com', '123456789', 'admin1.jpg', 'admin', 'Binh', 'Nguyen', '01-01-2002', 8, 'M'),
('M0002', 'admin2@gmail.com', '123456789', 'admin2.jpg', 'admin', 'Kiet', 'Chu', '01-02-2002', 3, 'M'),
('M0003', 'user3@gmail.com', '123456', NULL, 'user', 'Phuong', 'Tran', '01-02-2000', 1, 'F'),
('M0004', 'user4@gmail.com', '123456', NULL, 'user', 'Tram', 'Mai', '01-02-2000', 0, 'F'),
('M0005', 'user5@gmail.com', '123456', NULL, 'user', 'Hoa', 'Doan Nguyen Thanh Hoa', '01-02-1980', 0, 'M'),
('M0006', 'user6@gmail.com', '123456', NULL, 'user', 'Khanh', 'Kieu Trong', '01-02-1970', 0, 'M'),
('M0007', 'user7@gmail.com', '123456', NULL, 'user', 'Thanh', 'Pham Cong', '01-02-2000', 0, 'M'),
('M0008', 'user8@gmail.com', '123456', NULL, 'user', 'Hai', 'Quang', '01-02-2000', 0, 'O'),
('M0009', 'user9@gmail.com', '123456', NULL, 'user', 'Van', 'Than Thi Ngoc', '01-02-2000', 0, 'F'),
('M0010', 'user10@gmail.com', '123456', NULL, 'user', 'Su', 'Than Van', '01-02-2000', 0, 'M');

INSERT INTO Book(BookID, Title, Author, Publisher, Language, Cover, Description, NoDownload, FilePDF, FileEpub, IsAccepted, DateUpload, LastDateEdit, MemberUpload, MemberLastEdit, CategoryID) VALUES 
('B00000', N'Sapiens: Lược Sử Loài Người', N'Yuval Noah Harari', N'Nhà Xuất Bản Tri Thức', 'Vietnamese', 'B00000.jpg', N'Sapiens: Lược sử loài người là một cuốn sách của Yuval Noah Harari xuất bản lần đầu bằng tiếng Do Thái ở Israel năm 2011, và bằng tiếng Anh vào năm 2014. Cuốn sách nói bao quát về lịch sử tiến hóa của loài người từ thời cổ xưa trong thời kỳ đồ đá cho đến thế kỷ XXI, tập trung vào loài Homo sapiens.', '2216', 'B00000.pdf', 'B00000.epub', 1, '06-05-2022', NULL, 'M0000', NULL, 'C02'),
('B00001', N'Tư Duy Phản Biện', N'Zoe McKey', N'NXB Thế Giới', 'Vietnamese', 'B00001.jpg', N'Tư duy phản biện là chìa khóa để bạn thoát khỏi những lối mòn trong suy nghĩ, giúp bạn giải quyết các vấn đề khó khăn một cách sáng tạo và hiệu quả hơn.', '1716', 'B00001.pdf', 'B00001.epub', 1, '06-05-2022', NULL, 'M0000', NULL, 'C01'),
('B00002', N'Đắc nhân tâm', N'Dale Carnegie', N'NXB Tổng Hợp TPHCM', 'Vietnamese', 'B00002.jpg', N'Đắc nhân tâm, tên tiếng Anh là How to Win Friends and Influence People là một quyển sách nhằm tự giúp bản thân bán chạy nhất từ trước đến nay. Quyển sách này do Dale Carnegie viết và đã được xuất bản lần đầu vào năm 1936, nó đã được bán 15 triệu bản trên khắp thế giới.', '2131', 'B00002.pdf', 'B00002.epub', 1, '06-05-2022', NULL, 'M0000', NULL, 'C01'),
('B00003', N'Lối Sống Tối Giản Của Người Nhật', N'Sasaki Fumio', N'NXB Lao động', 'Vietnamese', 'B00003.jpg', N'Lối sống tối giản à cách sống cắt giảm vật dụng xuống còn mức tối thiểu. Và cùng với cuộc sống ít đồ đạc, ta có thể để tâm nhiều hơn tới hạnh phúc, đó chính là chủ đề của cuốn sách này.', '435', 'B00003.pdf', 'B00003.epub', 1, '06-05-2022', NULL, 'M0000', NULL, 'C01'),
('B00004', N'Muôn Kiếp Nhân Sinh', N'Nguyên Phong', N'NXB Tổng Hợp TPHCM', 'Vietnamese', 'B00004.jpg', N'', '1035', 'B00004.pdf', 'B00004.epub', 1, '06-05-2022', NULL, 'M0000', NULL, 'C02'),
('B00005', N'Mindset - Tâm Lý Học Thành Công', N'Carol S Dweck', N'NXB Thanh Niên', 'Vietnamese', 'B00005.jpg', N'', '123', 'B00005.pdf', 'B00005.epub', 1, '06-05-2022', NULL, 'M0000', NULL, 'C02'),
('B00006', N'Tâm Lý Học - Phác Họa Chân Dung Kẻ Phạm Tội', N'Diệp Hồng Vũ', N'NXB Lao động', 'Vietnamese', 'B00006.jpg', N'', '225', 'B00006.pdf', null, 1, '06-05-2022', NULL, 'M0000', NULL, 'C02'),
('B00007', N'Sự Trỗi Dậy Và Suy Tàn Của Đế Chế Thứ Ba - Lịch Sử Đức Quốc Xã', N'William L Shirer', N'NXB Thông tin và Truyền thông', 'Vietnamese', 'B00007.jpg', N'', '423', 'B00007.pdf', NULL, 1, '06-05-2022', NULL, 'M0000', NULL, 'C02'),
('B00008', N'Blockchain - Bản Chất Của Blockchain, Bitcoin, Tiền Điện Tử, Hợp Đồng Thông Minh Và Tương Lai Của Tiền Tệ', N'Mark Gates', N'NXB Lao động', 'Vietnamese', 'B00008.jpg', N'', '35', 'B00008.pdf', NULL, 1, '06-05-2022', NULL, 'M0000', NULL, 'C06'),
('B00009', N'Lolita', N'Vladimir Nabokov', N'NXB Hội Nhà Văn', 'Vietnamese', 'B00009.jpg', N'', '785', 'B00009.pdf', 'B00009.epub', 1, '06-05-2022', NULL, 'M0000', NULL, 'C00'),
('B00010', N'Lược sử thời gian', N'Stephen Hawking', N'NXB Trẻ', 'Vietnamese', 'B00010.jpg', N'', '616', 'B00010.pdf', 'B00010.epub', 1, '06-05-2022', NULL, 'M0000', NULL, 'C05'),
('B00011', N'Chủ Nghĩa Khắc Kỷ - Phong Cách Sống Bản Lĩnh Và Bình Thản', N'William B. Irvine', N'Nhà Xuất Bản Công Thương', 'Vietnamese', 'B00011.jpg', N'', '66', 'B00011.pdf', 'B00011.epub', 1, '06-05-2022', NULL, 'M0000', NULL, 'C01'),
('B00012', N'Đồi Gió Hú', N'Emily Bronte', N'NXB Văn học', 'Vietnamese', 'B00012.jpg', N'', '456', 'B00012.pdf', 'B00012.epub', 1, '06-05-2022', NULL, 'M0000', NULL, 'C00'),
('B00013', N'Homo Deus: Lược Sử Tương Lai', N'Yuval Noah Harari', N'Nhà Xuất Bản Tri Thức', 'Vietnamese', 'B00013.jpg', N'', '616', 'B00013.pdf', 'B00013.epub', 1, '06-06-2022', NULL, 'M0000', NULL, 'C02'),
('B00014', N'21 Bài Học Cho Thế Kỷ 21', N'Yuval Noah Harari', N'Nhà Xuất Bản Tri Thức', 'Vietnamese', 'B00014.jpg', N'', '616', 'B00014.pdf', 'B00014.epub', 1, '07-05-2022', NULL, 'M0000', NULL, 'C02'),
('B00015', N'Cuốn theo chiều gió', N'Margaret Mitchell', N'NXB Văn Học', 'Vietnamese', 'B00015.jpg', N'', '564', 'B00015.pdf', 'B00015.epub', 1, '07-05-2022', NULL, 'M0000', NULL, 'C00'),
('B00016', N'Adolf Hitler - Chân Dung Một Trùm Phát Xít', N'John Toland', N'NXB Khoa học xã hội', 'Vietnamese', 'B00016.jpg', N'', '51', 'B00016.pdf', 'B00016.epub', 1, '07-06-2022', NULL, 'M0000', NULL, 'C08'),
('B00017', N'300 bài code thiếu nhi', N'Phạm Huy Hoàng', N'unknown', 'Vietnamese', 'B00017.jpg', N'', '9999', 'B00017.pdf', NULL, 1,'07-05-2022', NULL, 'M0000', NULL, 'C11'),
('B00018', N'5 Centimet Trên Giây', N'Shinkai Makoto', N'unknown', 'Vietnamese', 'B00018.jpg', N'', '239', 'B00018.pdf', 'B00018.epub', 1, '07-05-2022', NULL, 'M0000', NULL, 'C00'),
('B00019', N'Computer Organization and Architecture Designing for Performance (9th Edition)', N'William Stallings', N'Pearson', 'English', 'B00019.jpg', N'', '235', 'B00019.pdf', NULL, 1, '07-05-2022', NULL, 'M0001', NULL, 'C11'),
('B00020', N'Foundations of Computer Science', N'Behrouz Forouzan', N'Cengage', 'English', 'B00020.jpg', N'', '679', 'B00020.pdf', NULL, 1,'07-05-2022', NULL, 'M0001', NULL, 'C11'),
('B00021', N'Discrete Mathematics and Its Applications', N'Kenneth Rosen', N'McGraw-Hill Higher Education', 'English', 'B00021.jpeg', N'', '646', 'B00021.pdf', NULL, 1,'07-05-2022', NULL, 'M0001', NULL, 'C11'),
('B00022', N'Modern Operating Systems', N'Andrew S. Tanenbaum', N'Pearson Prentice Hall', 'English', 'B00022.jpg', N'', '863', 'B00022.pdf', NULL, 1,'07-05-2022', NULL, 'M0001', NULL, 'C11'),
('B00023', N'Giáo trình Triết học Mác - Lênin', N'Bộ Giáo dục và Đào tạo', N'Nhà Xuất Bản Chính Trị Quốc Gia Sự Thật', 'Vietnamese', 'B00023.jpg', N'', '236', 'B00023.pdf', NULL, 1,'07-05-2022', NULL, 'M0001', NULL, 'C03'),
('B00024', N'Súng, Vi Trùng Và Thép: Định Mệnh Của Các Xã Hội Loài Người', N'Jared Diamond', N'Nhà Xuất Bản Thế Giới', 'Vietnamese', 'B00024.jpg', N'', '944', 'B00024.pdf', 'B00024.jpg', 1,'07-05-2022', NULL, 'M0001', NULL, 'C02'),
('B00025', N'Thuyết Tương Đối Cho Mọi Người', N'Martin Gardner', N'Nhà xuất bản Đại học Quốc gia Hà Nội', 'Vietnamese', 'B00025.jpg', N'B00024.pdf', '877', NULL, NULL, 1,'07-05-2022', NULL, 'M0001', NULL, 'C05'),
('B00026', N'Nhập Môn Lập Trình Không Code', N'Phạm Huy Hoàng', N'unknown', 'Vietnamese', 'B00026.png', N'', '789', 'B00026.pdf', NULL, 1,'07-05-2022', NULL, 'M0001', NULL, 'C05'),
('B00027', N'Code Dạo Ký Sự – Lập Trình Viên Đâu Phải Chỉ Biết Code', N'Phạm Huy Hoàng', N'unknown', 'Vietnamese', 'B00027.png', N'', '3242', 'B00027.pdf', NULL, 1,'07-05-2022', NULL, 'M0002', NULL, 'C05'),
('B00028', N'Minna no Nihongo Sơ Cấp 1 – Bản dịch tiếng Việt', N'unknown', N'スリーエーネットワーク – 2008', 'Vietnamese', 'B00028.jpg', N'', '345', 'B00028.pdf', NULL, 1,'07-05-2022', NULL, 'M0002', NULL, 'C10'),
('B00029', N'Minna no Nihongo Sơ Cấp 1 – Honsatsu (Sách Giáo Khoa)', N'unknown', N'unknown', 'Vietnamese', 'B00029.jpg', N'', '258', 'B00029.pdf', NULL, 1,'07-05-2022', NULL, 'M0002', NULL, 'C10'),
('B00030', N'Nghệ Thuật Sống', N'Epictetus', N'unknown', 'Vietnamese', 'B00030.jpg', N'', '738', NULL, 'B00030.epub', 1,'07-05-2022', NULL, 'M0003', NULL, 'C01');

INSERT INTO Rating(RatingID, Star, Comment, DateRating, LastDateEdit, BookID, MemberID) VALUES 
('R00000', 5, N'Cảm ơn bạn, nghe nói cuốn sách này khá hay', '6-6-2022', NULL, 'B00000', 'M0003'),
('R00001', 5, N'Sách rất hay', '6-6-2022', NULL, 'B00000', 'M0004'),
('R00002', 5, N'hayyyyy lắm mn oi', '6-7-2022', NULL, 'B00000', 'M0005'),
('R00003', 4, N'Cx đc', '6-8-2022', NULL, 'B00000', 'M0006'),
('R00004', 5, N'Xuất sắc', '6-9-2022', NULL, 'B00000', 'M0007'),
('R00005', 5, N'CƠ HỘI TỚI - KINH DOANH PHƠI PHỚI 💥💥💥
TUYỂN SỈ TẬN GỐC NEM NƯỚNG NHA TRANG, NEM LỤI + GÀ Ủ MUỐI HOA TIÊU HÙNG VIỆT TOÀN QUỐC
💌 Ib em ngayyyy
Nếu ib fb Cao Phương Nem em chưa rep hãy ☎️📞 0359 029 677 Cao Phương', '6-9-2022', NULL, 'B00000', 'M0007'),
('R00006', 5, N'Tuyệt zời', '6-10-2022', NULL, 'B00000', 'M0008');

INSERT INTO ReportBook(DateReport, Detail, BookID, MemberID, ReportStateID, ReportTypeID) VALUES 
('7-10-2022', N'Thiếu tên NXB', 'B00030', 'M0003', 'S0', 'T03'),
('7-10-2022', N'Thiếu file EPUB', 'B00017', 'M0003', 'S0', 'T03'),
('7-1-2022', N'Không tải được file ', 'B00027', 'M0004', 'S1', 'T01'),
('6-20-2022', N'Sách không hay', 'B00017', 'M0003', 'S2', 'T00'),
('7-10-2022', N'Spam', 'B00017', 'M0005', 'S0', 'T00');
