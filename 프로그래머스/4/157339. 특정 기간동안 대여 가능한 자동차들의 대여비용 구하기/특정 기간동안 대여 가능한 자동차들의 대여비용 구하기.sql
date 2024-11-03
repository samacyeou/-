-- 코드를 입력하세요
SELECT 
    DISTINCT C.CAR_ID,
    C.CAR_TYPE,
    ROUND(C.DAILY_FEE * 30 * (100 - D.DISCOUNT_RATE) / 100,0) AS FEE
FROM CAR_RENTAL_COMPANY_CAR AS C
    LEFT JOIN (
        SELECT *
        FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
        WHERE
            START_DATE <= '2022-11-30' AND
            END_DATE >= '2022-11-01'
        GROUP BY CAR_ID
    ) AS H
        ON C.CAR_ID = H.CAR_ID
    JOIN (
        SELECT CAR_TYPE, DISCOUNT_RATE
        FROM CAR_RENTAL_COMPANY_DISCOUNT_PLAN
        WHERE CAR_TYPE IN ('세단', 'SUV') AND DURATION_TYPE LIKE '%30%'
    ) AS D
        ON C.CAR_TYPE = D.CAR_TYPE
WHERE
    C.CAR_TYPE IN ('세단', 'SUV') AND
    30 * C.DAILY_FEE BETWEEN 500000 AND 2000000 AND
    H.CAR_ID IS NULL
GROUP BY C.CAR_ID
ORDER BY FEE DESC, C.CAR_TYPE ASC, C.CAR_ID DESC





# SELECT A.CAR_ID, C.CAR_TYPE,
#        CASE WHEN CAR_TYPE = '세단' THEN ROUND((DAILY_FEE + (DAILY_FEE * 0.1)) * 30)
#             WHEN CAR_TYPE = 'SUV' THEN ROUND((DAILY_FEE + (DAILY_FEE * 0.08)) * 30)
#        ELSE NULL
#        END AS FEE
# FROM CAR_RENTAL_COMPANY_CAR A
# JOIN CAR_RENTAL_COMPANY_RENTAL_HISTORY B USING(CAR_ID)
# JOIN CAR_RENTAL_COMPANY_DISCOUNT_PLAN C USING(CAR_TYPE)
# WHERE (C.CAR_TYPE = '세단' OR C.CAR_TYPE = 'SUV') AND
#       (C.DURATION_TYPE = '30일 이상') AND
#       A.CAR_ID NOT IN (
#       SELECT CAR_ID
#       FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
#       WHERE END_DATE >= '2022-11-01' AND START_DATE <= '2022-11-30')
# GROUP BY 1
# HAVING FEE >= 500000 AND FEE < 2000000
# ORDER BY 3 DESC, 2, 1 DESC;