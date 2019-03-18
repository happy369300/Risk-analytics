#day3
select * from application where sk_id_curr=215354;
use credit;

select * from application limit 100;
describe application;

desc bureau;
select count(*) from application;
select count(distinct sk_id_curr) from bureau;
select count(distinct sk_id_curr) from application;
select count(sk_id_curr) from application;
select credit_type, count(sk_id_curr) from bureau group by CREDIT_TYPE;
select credit_type, count(distinct sk_id_curr) from bureau group by CREDIT_TYPE;
select sk_bureau_id, credit_ACTIVE, credit_currency,days_credit,amt_credit_sum from bureau;
select * from application;
select AMT_CREDIT from application;
#Day4
select AMT_CREDIT, count(*) from application group by 1;
select target, count(*) from application group by 1;
select NAME_CONTRACT_TYPE, 
count(*) from application group by 1;
select target, NAME_FAMILY_STATUS,  count(NAME_FAMILY_STATUS) from application group by 1,2;
select target, occupation_type, count(*) from application group by 1,2;
#######
select organization_type, avg(amt_income_total)
from application group by 1;
#######
select a.*, amt_credit/amt_annuity as new_credit_to_annuity,
amt_credit/amt_goods_price as new_credit_to_goods_ratio,
own_car_age/days_birth as new_car_to_birth_ratio,
own_car_age/days_employed as new_car_to_employ_ratio,
amt_credit/amt_income_total as new_credit_to_income_ratio, #1 of most important variables DTI
amt_annuity/amt_income_total as new_annuity_to_income_ratio,
b.New_avg_inc_by_org
from application as a 
join
(select organization_type, avg(amt_income_total) as New_avg_inc_by_org
from application group by 1) as b
on a.Organization_type=b.organization_type;
#####################################################################
select * from bureau;
select SK_ID_CURR, CREDIT_ACTIVE,
    
min(DAYS_CREDIT),
max(DAYS_CREDIT),
AVG(days_credit),
MIN(DAYS_CREDIT_ENDDATE),
MAX(DAYS_CREDIT_ENDDATE),
AVG(DAYS_CREDIT_ENDDATE),
MAX(CREDIT_DAY_OVERDUE),
AVG(CREDIT_DAY_OVERDUE),
AVG(AMT_CREDIT_MAX_OVERDUE),

AVG(AMT_CREDIT_SUM),
SUM(AMT_CREDIT_SUM),

AVG(AMT_CREDIT_SUM_DEBT), 
SUM(AMT_CREDIT_SUM_DEBT),

AVG(AMT_CREDIT_SUM_OVERDUE),
SUM(AMT_CREDIT_SUM_OVERDUE),

AVG(AMT_CREDIT_SUM_LIMIT),
SUM(AMT_CREDIT_SUM_LIMIT),

AVG(AMT_ANNUITY),
SUM(AMT_ANNUITY)

from bureau group by 1,2;

