--3122560066 ĐÀO PHÚ DUY TÂN
-- CÂU 1 :Liệt kê tên các sinh viên thuộc khoa “Toán” (MAKHOA = “TOAN”)
select TENSV , MAKHOA
from SVIEN
where MAKHOA = 'TOAN' 

--CÂU 2: Liệt kê tên các môn học và số tín chỉ
select TENMH , TINCHI
from MHOC

--CÂU3 :Liệt kê kết quả học tập của sinh viên có mã số ‘K26.008’ (MASV)
select DIEM
from KQUA
WHERE MASV = 'K26.0008'

--CÂU4 : Liệt kê tên sinh viên và mã môn học mà sinh viên 
--đó đăng ký học với kết quả cuối khoá trên 7 điểm
SELECT distinct SV.TENSV 
FROM KQUA KQ , SVIEN SV 
WHERE SV.MASV = KQ.MASV AND kq.DIEM > 7 

--CÂU5: Liệt kê tên sinh viên thuộc về khoa có phụ trách môn học "Toán rời rạc".
select distinct sv.TENSV
from SVIEN SV , MHOC MH
WHERE SV.MAKHOA = MH.MAKHOA AND MH.MAKHOA = 'TOAN'

--CÂU6: Liệt kê tên sinh viên, tên môn học, 
--và điểm số của sinh viên ở học kì 1, năm 1996
select SV.TENSV , MH.TENMH ,DIEM
from SVIEN SV , MHOC MH , KQUA KQ , HPHAN HP
where SV.MASV = KQ.MASV AND HP.MAHP = KQ.MAHP AND MH.MAMH = HP.MAMH AND HOCKY =1 AND HP.NAM = 1996

--CÂU7: Liệt kê tên các môn học phải học ngay trước môn "Cơ sở dữ liệu"
select MAMH_TRUOC , TENMH
from DKIEN DK , MHOC MH
where DK.MAMH = 'TH0003' AND DK.MAMH_TRUOC = MH.MAMH

--CÂU8: Liệt kê tên các môn học phải học ngay sau môn "Cơ sở dữ liệu"
select DK.MAMH , TENMH
from DKIEN DK , MHOC MH
where DK.MAMH_TRUOC = 'TH0003' AND DK.MAMH = MH.MAMH


--CÂU9: Liệt kê tên môn học trước, tên môn học của môn học 
--có số tính chỉ nhỏ hơn bằng 4
select  MH.TENMH 'Tên mh trước', MH1.TENMH 'Tên mh' , mh.TINCHI
from DKIEN DK , MHOC MH , MHOC MH1
where MH.TINCHI <=4 AND  DK.MAMH_TRUOC = MH.MAMH AND DK.MAMH = MH1.MAMH

--CÂU10:*Liệt kê danh sách sinh viên, điểm của môn “Cơ sở dữ liệu” ở học kì 1,
--năm học 1996 được sắp theo thứ tự điểm giảm dần, trùng điểm số thì sắp theo tên tăng dần.
select SV.MASV , TENSV ,HOCKY, HP.NAM 
from SVIEN SV , KQUA KQ, HPHAN HP , MHOC MH
WHERE SV.MASV =KQ.MASV AND KQ.MAHP = HP.MAHP 
and HP.MAMH = MH.MAMH AND HOCKY=1 AND HP.NAM=1996 and TENMH = 'Cơ sở dữ liệu'

--CÂU11  Liệt kê mã học phần và số lượng sinh viên đăng ký theo từng học phần

		SELECT HP.MAMH,COUNT(SV.MASV) AS SoLuongSV 
		FROM HPHAN HP JOIN MHOC MH ON HP.MAMH = MH.MAMH
               JOIN Khoa K ON MH.MAKHOA = K.MAKHOA  
               JOIN SVIEN SV ON K.MAKHOA = SV.MAKHOA
		GROUP BY HP.MAMH

--câu 12 . Liệt kê tên sinh viên và điểm trung bình của sinh viên đó trong từng học kỳ của từng niên học
SELECT SV.TENSV, HP.HOCKY, HP.NAM, round(AVG(KQ.DIEM ),2) AS DTB
FROM SVIEN SV 
JOIN KQUA KQ ON SV.MASV = KQ.MASV
JOIN HPHAN HP ON KQ.MAHP = HP.MAHP
JOIN MHOC MH ON HP.MAMH = MH.MAMH  
JOIN Khoa K ON MH.MAKHOA = K.MAKHOA
GROUP BY SV.TENSV, HP.HOCKY, HP.NAM

--câu13 

SELECT SV.TENSV , kq.DIEM 'Điểm cao nhất rồi'
FROM SVIEN SV
INNER JOIN KQUA KQ ON SV.MASV = KQ.MASV
GROUP BY SV.TENSV , kq.DIEM
HAVING MAX(KQ.DIEM) = (SELECT MAX(DIEM) FROM KQUA)
--câu 14
SELECT SV.TENSV
FROM SVIEN SV
JOIN KQUA KQ ON SV.MASV = KQ.MASV
JOIN HPHAN HP ON KQ.MAHP = HP.MAHP
JOIN MHOC MH ON HP.MAMH = MH.MAMH
WHERE MH.TENMH = 'Cơ sở dữ liệu' AND HP.HOCKY = 1 AND HP.NAM = 1996
GROUP BY SV.TENSV, HP.HOCKY, HP.NAM
HAVING MAX(KQ.DIEM) = (SELECT MAX(DIEM) FROM KQUA)

--CÂU15 
chịu khó quá =))
