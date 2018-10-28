
declare Cursor_Cust cursor scroll for 
	select a.serverid, a.custid, a.orgid, a.fundid, a.moneytype,
		a.fundseq, a.operway, a.fundkind, a.fundlevel, a.fundgroup, a.creditflag,
		a.secuid, b.market, b.trdid, b.stktype, b.bsflag
		from #trial_fundinfo a, #trial_tradeinfo b
        where a.moneytype = b.moneytype and a.market = b.market;
	open Cursor_Cust;

	fetch first from Cursor_Cust into @serverid, @custid, @orgid, @fundid, @moneytype, 
										@fundseq, @operway, @fundkind, @fundlevel, @fundgroup, @creditflag,
										@secuid, @market, @trdid, @stktype, @bsflag;

	while (@@FETCH_STATUS = 0)
	begin


		fetch next from Cursor_Cust into @serverid, @custid, @orgid, @fundid, @moneytype, 
										@fundseq, @operway, @fundkind, @fundlevel, @fundgroup, @creditflag,
										@secuid, @market, @trdid, @stktype, @bsflag;
	end

	close Cursor_Cust;

deallocate Cursor_Cust;
