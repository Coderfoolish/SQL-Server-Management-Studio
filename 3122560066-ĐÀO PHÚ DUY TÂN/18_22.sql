--3122560066 đào phú duy tân


--câu18  Với mỗi đề án, liệt kê tên đề án (TENDA) và tổng số giờ làm việc một tuần của tất cả các nhân viên tham 
--dự đề án đó

select distinct DA.TENDA, NV.MANV,suM(THOGIAN) 'Tổng thời gian' 
from DEAN da , PHANCONG pc, NHANVIEN nv
where da.mada= pc.MADA and pc.MANV =nv.MANV
group by DA.TENDA, NV.MANV,PC.THOGIAN 

--CÂU19 Với mỗi nhân viên, liệt kê họ và tên nhân viên và nhân viên đó có bao nhiêu thân nhân
SELECT DISTINCT HONV +' '+ TENLOT +' '+TENNV 'HỌ TÊN NV' , COUNT(MATN) 'SL_TN'
FROM NHANVIEN NV , THANNHAN TN 
WHERE NV.MANV = TN.MANV
GROUP BY NV.HONV , NV.TENLOT ,NV.TENNV ,TN.MATN

--CÂU20 Với mỗi phòng ban, liệt kê tên phòng ban (TENPHG) và lương trung bình của những nhân viên làm việc cho 
--phòng ban đó
SELECT distinct PB.TENPHG ,AVG(MLUONG) as 'Mưc lương tb của nv'
FROM PHONGBAN PB , NHANVIEN NV 
WHERE NV.PHONG = PB.MAPHG
GROUP BY NV.MLUONG , PB.TENPHG

--câu21  Cho biết lương trung bình của tất cả các nữ nhân viên

select TENNV,avg(mluong) as 'Lương trung bình của nữ'
from NHANVIEN 
where phai = 'Nu'
group by tennv

--câu22 . Với các phòng ban có mức lương trung bình trên 30,000, liệt kê tên phòng ban và số lượng nhân viên của 
--phòng ban đó

select pb.TENPHG , count(manv) as 'Sl_nv' , avg(mluong) as 'Luong_trung_binh'
from PHONGBAN pb , NHANVIEN nv 
where nv.PHONG =pb.MAPHG
group by  pb.TENPHG 
having avg(mluong) > 30000