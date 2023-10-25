--3122560066 _ ĐÀO PHÚ DUY TÂN 

--câu 1 

select MANV , HONV  ,TENLOT ,TENNV
from NHANVIEN 
where PHONG = 'NC' 

--câu 2 

select MANV , HONV  ,TENLOT ,TENNV , PHAI
from NHANVIEN 
where MLUONG > 3000000

--câu 3 

select MANV , HONV  ,TENLOT ,TENNV , PHAI
from NHANVIEN 
where MLUONG between 2000000 and 3000000 

-- câu 4

select  HONV +' '+ TENLOT +' '+TENNV as 'Họ và Tên' 
from NHANVIEN 
where DCHI like '%HCM'

--câu5

select NGSINH 'Ngày sinh' , DCHI 'Địa chỉ'
from NHANVIEN
where HONV ='Dinh' and TENLOT = 'Ba' and TENNV = 'Tien'

 --câu6 

select TENTN
from NHANVIEN NV , THANNHAN TN 
where NV.MANV = TN.MANV and ( year(GETDATE()) - year(TN.NGSINH) ) < 18 and NV.MA_NQL = 'NV001'

--câu 7 

select MANV, HONV +' '+TENLOT+' '+TENNV as 'Họ và tên'
from NHANVIEN
where PHAI = 'Nu' and ( year(GETDATE()) - year(NGSINH) ) >30 

--câu 8

select  TENPHG ,DIADIEM
from PHONGBAN PB , DIADIEM_PHG DD 
where PB.MAPHG = DD.MAPHG 

--câu 9
select MANV , HONV +' '+ TENLOT +' '+TENNV as 'Họ và Tên' , TENPHG
from PHONGBAN PB , NHANVIEN NV 
where NV.MANV = PB.TRPHG 
order by MANV

--câu 10
select TENDA, MADA,DDIEM_DA , DA.MAPHG , TENPHG ,PB.MAPHG , TRPHG , NGNC
from DEAN DA , PHONGBAN PB 
where DA.MAPHG = PB.MAPHG

--câu 11 
select HONV +' '+ TENLOT +' '+TENNV as 'Họ và Tên' , DCHI
from NHANVIEN NV , PHONGBAN PB 
where NV.PHONG = PB.MAPHG and TENPHG = 'Nghien cuu'

--câu 12

select distinct HONV +' '+ TENLOT +' '+TENNV as 'Họ và Tên'
from NHANVIEN NV  , THANNHAN TN 
where NV.MANV = TN.MANV and NV.PHAI = 'Nu'  

--câu13 
select NV.MANV , HONV +' '+ TENLOT +' '+TENNV as 'Họ và Tên' ,TENDA ,THOGIAN
from NHANVIEN NV, PHANCONG PC , DEAN DA , PHONGBAN PB
where PC.MANV = NV.MANV and pC.MADA = DA.MADA and PB.MAPHG = NV.PHONG 
		and PB.TENPHG = 'Nghien cuu' and da.TENDA like 'Tin hoc hoa%' and THOGIAN >20


--câu14
select distinct MADA, DA.MAPHG ,NV2.HONV ,NV2.TENLOT , NV2.TENNV , NV2.DCHI ,NV2.NGSINH
from DEAN DA ,NHANVIEN NV1 , NHANVIEN NV2
where DA.DDIEM_DA = 'HANOI' AND NV2.MANV = NV1.MA_NQL

--câu15

select distinct NV1.MANV 'ID nhân viên', NV1.HONV +' '+ NV1.TENLOT +' '+ NV1.TENNV as 'Họ Tên Nv' , NV2.MANV 'ID NGQL' ,NV2.HONV +' '+ NV2.TENLOT +' '+ NV2.TENNV 'Họ tên NQL'
from NHANVIEN NV1 , NHANVIEN NV2 
where NV2.MANV = NV1.MA_NQL 


--câu 16
select NV1.HONV +' '+ NV1.TENLOT +' '+ NV1.TENNV as 'Họ Tên Nv' ,NV2.MANV, NV2.HONV +' '+ NV2.TENLOT +' '+ NV2.TENNV as 'Họ Tên TP' , TENPHG
from NHANVIEN NV1  , PHONGBAN PB , NHANVIEN NV2
where NV2.MANV = PB.TRPHG and NV1.PHONG = PB.MAPHG

--câu17

select NV.MANV , HONV +' '+ TENLOT +' '+TENNV as 'Họ và Tên', TENDA
from NHANVIEN NV ,PHANCONG PC , DEAN DA 
where NV.MANV =PC.MANV and PC.MADA = DA.MADA 

--câu18  Với mỗi đề án, liệt kê tên đề án (TENDA) và tổng số giờ làm việc một tuần của tất cả các nhân viên tham 
--dự đề án đó

select distinct DA.TENDA, NV.MANV,suM(THOGIAN) 'Tổng thời gian' 
from DEAN da , PHANCONG pc, NHANVIEN nv
where da.mada= pc.MADA and pc.MANV =nv.MANV
group by DA.TENDA, NV.MANV,PC.THOGIAN 

--CÂU19 Với mỗi nhân viên, liệt kê họ và tên nhân viên và nhân viên đó có bao nhiêu thân nhân
SELECT DISTINCT HONV +' '+ TENLOT +' '+TENNV 'HỌ TÊN NV' , COUNT(MATN) 'SL_TN'
FROM NHANVIEN NV , THANHNHAN TN 
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