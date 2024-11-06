SELECT '/home/grep/src/'||B.BOARD_ID||'/'||B.FILE_ID||FILE_NAME||FILE_EXT AS FILE_PATH
  FROM (SELECT *
        FROM (
      SELECT BOARD_ID 
      FROM USED_GOODS_BOARD 
      ORDER BY VIEWS DESC
      ) WHERE ROWNUM = 1
  ) A
  INNER JOIN USED_GOODS_FILE B
  ON A.BOARD_ID = B.BOARD_ID
  WHERE 1=1
  ORDER BY B.FILE_ID desc