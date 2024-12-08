# SELECT
#     YEAR(DIFFERENTIATION_DATE) AS YEAR,
#     ((
#         SELECT MAX(SIZE_OF_COLONY)
#         FROM ECOLI_DATA a
#         WHERE YEAR(a.DIFFERENTIATION_DATE) = YEAR(b.DIFFERENTIATION_DATE)
#     ) - b.SIZE_OF_COLONY) AS YEAR_DEV,
#     b.ID
# FROM ECOLI_DATA b
# ORDER BY YEAR, YEAR_DEV



SELECT YEAR(A.DIFFERENTIATION_DATE) AS YEAR, B.ASD - A.SIZE_OF_COLONY AS YEAR_DEV, A.ID
FROM ECOLI_DATA AS A
    JOIN (
        SELECT
            MAX(SIZE_OF_COLONY) AS ASD,
            YEAR(DIFFERENTIATION_DATE) as DIFFERENTIATION_DATE
        FROM ECOLI_DATA
        GROUP BY YEAR(DIFFERENTIATION_DATE)
    ) AS B
        ON YEAR(A.DIFFERENTIATION_DATE) = B.DIFFERENTIATION_DATE
ORDER BY YEAR, YEAR_DEV