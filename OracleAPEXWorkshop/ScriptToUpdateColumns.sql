UPDATE
  (
    SELECT
      p.product_id  ,
      p.product_name,
      p.clothing    ,
      p.color       ,
      p.department  ,
      p.product_details
    FROM
      products p ) p
SET
  p.clothing = Substr(product_name, Instr(product_name, ' ',1,1)+1, Instr(product_name,' ',1, 2)+1 - Instr(product_name,' ',1,1)-2),
  p.color    =
  (
    SELECT
      c.color
    FROM
      json_table (p.product_details,'$' COLUMNS ( color VARCHAR(4000) path '$.colour') ) c),
      p.department =
      (
        SELECT
          g.department
        FROM
          json_table (p.product_details, '$' COLUMNS ( department VARCHAR2(4000) path '$.gender') ) g) 