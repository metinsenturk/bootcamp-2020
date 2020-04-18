SELECT sm.smemberid, sm.smembername, count(1) AS count1 
FROM staffmember sm 
JOIN cleaning cl ON
    sm.smemberid = cl.smemberid 
GROUP BY sm.smemberid, sm.smembername
HAVING count(1) > 6 
ORDER BY count(1)
DESC;


select cc.ccname client, rr.ccname referer 
from corpclient cc 
inner join corpclient rr 
    on rr.ccid = cc.ccidreferredby;


if exists(select 1 from sys.views where name='corpclientreferrals' and type='v')
drop view corpclientreferrals;
GO
create view corpclientreferrals as (
    select cc.ccname client, rr.ccname referer 
    from corpclient cc 
    inner join corpclient rr 
        on rr.ccid = cc.ccidreferredby
);
GO


select * from corpclientreferrals;