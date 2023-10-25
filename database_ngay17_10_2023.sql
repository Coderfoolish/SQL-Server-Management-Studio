
/* 1. Đây là câu lệnh truy vấn vào bảng -> cột 

select HONV as 'Họ', TENLOT as 'Tên lót', TENNV as 'Tên Nhân Viên'
select MANV , HONV + '' + TENLOT + ' ' + TENNV as ' Họ Tên'

*/

/* 2. đây là câu lệnh loại trừ sự giống nhau qua distinct

select distinct MLUONG
from NHANVIEN
where PHAI='Nam'
*/

/* 3. đây là thao tác với câu lệnh where 

select MANV ,TENNV , TENPHG , PHONG
from NHANVIEN , PHONGBAN
where PHONG= MAPHG and TENPHG = 'Nghieng cuu'

*/

/* 4. thao tác với kí tự  

select*
from NHANVIEN , PHONGBAN 
where PHONG= MAPHG and TENPHG = 'Nghieng cuu' and HONV like 'N%'

*/

/*
select*
from NHANVIEN 
where NGSINH between '1955-01-09' and '2023 - 12 -31 '

select *
from PHONGBAN
*/


select HONV , TENLOT , TENNV , NGSINH , DCHI, DA.MAPHG , MADA 
from DEAN DA , PHONGBAN PB , NHANVIEN NV
where DA.MAPHG = PB.MAPHG and DDIEM_DA = 'HANOI' and TRPHG =MANV


select distinct NV.MANV ,HONV , TENLOT , TENNV , NV.PHONG 
from DEAN DA ,NHANVIEN NV , PHANCONG PC
where NV.MANV = PC.MANV and PC.MADA = DA.MADA and TENDA like 'Tin hoc hoa%' and THOGIAN > 10 


select distinct NV1.MANV 'ID nhân viên', NV1.HONV +' '+ NV1.TENLOT +' '+ NV1.TENNV as 'Họ Tên Nv' , NV2.MANV 'ID NGQL' ,NV2.HONV +' '+ NV2.TENLOT +' '+ NV2.TENNV 'Họ tên NQL'
from NHANVIEN NV1 , NHANVIEN NV2 
where NV1.MANV = NV2.MA_NQL 

select NV1.MANV 'ID nhân viên', NV1.HONV +' '+ NV1.TENLOT +' '+ NV1.TENNV as 'Họ Tên Nv' , NV2.MANV 'ID NGQL' ,NV2.HONV +' '+ NV2.TENLOT +' '+ NV2.TENNV 'Họ tên NQL'
from NHANVIEN NV1 , NHANVIEN NV2 
where NV2.MANV = NV1.MA_NQL and NV2.HONV ='Nguyen' and NV2.TENLOT = 'Thanh' and NV2.TENNV = 'Tung'


select nv.MANV 'ID nhân viên',HONV +' '+ TENLOT +' '+TENNV as 'Họ Tên Nv', MADA , datediff(year, NGSINH , GETDATE()) as Age
from nhanvien nv , PHANCONG pc
where nv.MANV = pc.MANV
order by Age ,MADA desc