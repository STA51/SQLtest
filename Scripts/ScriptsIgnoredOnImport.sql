﻿
--구문 오류: / 근처의 구문이 잘못되었습니다.
---- 중복 카운트
--SELECT id, 이름, COUNT(*)  FROM Jangsu  GROUP BY id, 이름  HAVING COUNT(*) > 1;
--
---- 중복 데이터 확인
--select 성, 이름,핸드폰 from naver group by 성, 이름,핸드폰	having count(*) > 1;
--
---- 중복 데이터 조회
--SELECT *
--  FROM (
--          SELECT 성,이름,핸드폰
--               , dup_idx = ROW_NUMBER() OVER (
--                           PARTITION BY 성,이름,핸드폰 ORDER BY 성,이름,핸드폰 )
--            FROM naver (NOLOCK)
--       ) tb_dup
-- WHERE tb_dup.dup_idx > 1;
--
--
--
---- 중복 데이터 모두 조회
--SELECT naver.*
--  FROM (
--          SELECT 성,이름,핸드폰
--               , dup_idx = ROW_NUMBER() OVER (
--                           PARTITION BY 성,이름,핸드폰 ORDER BY 성,이름, 핸드폰 )
--            FROM naver (NOLOCK)
--       ) tb_dup INNER JOIN naver (NOLOCK)
--                        ON naver.이름 = tb_dup.이름 and NAVER.성 = tb_dup.성 and NAVER.핸드폰 = tb_dup.핸드폰
-- WHERE tb_dup.dup_idx > 1;
--
--
-- select * from NAVER;
--
--
---- 중복 데이터 삭제
--DELETE tb_dup
--  FROM (
--          SELECT 성, 이름
--               , dup_idx = ROW_NUMBER() OVER (
--                           PARTITION BY 성, 이름 
--                           ORDER BY 성, 이름 )
--            FROM 연락처
--       ) tb_dup
-- WHERE tb_dup.dup_idx > 1;
--
--
--출처: https://zenomis.tistory.com/entry/MSSQL-중복-데이터-삭제 [꿈꾸는 별나라]



GO