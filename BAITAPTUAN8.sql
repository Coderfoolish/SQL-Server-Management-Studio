
--Cho biết số lượng nhân viên của từng phòng ban
select PHONG , count(*) as SL_NV
from NHANVIEN
group by PHONG

select TENPHG ,count(*) as SL_NV
from NHANVIEN , PHONGBAN 
where PHONG = MAPHG
group by TENPHG 

 
select nv.MANV , HONV +' '+ TENLOT +' '+ TENNV as 'Họ tên ' , COUNT(MADA) as SL_DA ,SUM(THOGIAN) as Total_time
from NHANVIEN nv , PHANCONG pb
where nv.MANV = pb.MANV 
group by nv.MANV , HONV ,TENLOT ,TENNV
HAVING COUNT(MADA) >= 2


select TENPHG ,count(TENPHG) as SL_phong,  AVG(MLUONG) Luong_TB , count(MANV ) as 'Tong NV'
from NHANVIEN nv,PHONGBAN pb
where phong = MAPHG 
group by TENPHG , MAPHG
having avg(MLUONG) > 20000

select TENPHG ,  AVG(MLUONG) Luong_TB 
from NHANVIEN nv,PHONGBAN pb
where phong = MAPHG 
group by TENPHG
having avg(MLUONG) >= ALL(select AVG(MLUONG) from NHANVIEN nv,PHONGBAN pb where phong = MAPHG  group by TENPHG)

select nv.MANV, TENNV 
from NHANVIEN nv, PHANCONG pc 
where nv.MANV = pc.MANV 
group by 


