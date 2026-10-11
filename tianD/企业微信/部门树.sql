

-- 部门树（含层级、路径），排除已删除
WITH RECURSIVE dept_tree AS (
    -- 根部门
    SELECT
        d.dept_id,
        d.name,
        d.parent_dept_id,
        d.sort_no,
        d.corp_id,
        1 AS lvl,
        CAST(d.name AS CHAR(1000)) AS path_name,
        CAST(LPAD(IFNULL(d.sort_no, 0), 10, '0') AS CHAR(1000)) AS path_sort
    FROM order_admin.t_qywx_dept d
    WHERE d.is_deleted = 0
      AND d.parent_dept_id = 0
     AND d.corp_id = 'ww3535c85e83b16e9e'   -- 按企业替换

#      AND d.corp_id = 'wwabde3c4d34901b0a'   -- 按企业替换-- 生产环境在用
#     AND d.corp_id = 'ww55e0813967cbaf30'   -- 按企业替换

    UNION ALL

    -- 子部门
    SELECT
        c.dept_id,
        c.name,
        c.parent_dept_id,
        c.sort_no,
        c.corp_id,
        t.lvl + 1,
        CONCAT(t.path_name, ' / ', c.name),
        CONCAT(t.path_sort, '-', LPAD(IFNULL(c.sort_no, 0), 10, '0'))
    FROM order_admin.t_qywx_dept c
    INNER JOIN dept_tree t ON c.parent_dept_id = t.dept_id
    WHERE c.is_deleted = 0
      AND c.corp_id = t.corp_id
)
SELECT
    dept_id,
    name,
    parent_dept_id,
    lvl,
    path_name
FROM dept_tree
ORDER BY path_sort;