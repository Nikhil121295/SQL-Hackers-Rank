WITH CTE AS 
(
SELECT
    w.id,
    wp.age,
    w.coins_needed,
    w.power,
	row_number() over(partion by w.id,wp.age order by w.coins_needed as asc) as row_num
FROM
    Wands w inner join Wands_Property wp
    ON w.code = wp.code 
WHERE 
	wp.is_evil = 0 
)
select 
	id,age,coins_needed,power
from 
	CTE 
where row_num = 1
ORDER BY 
    w.power desc, wp.age desc