***Fractional Regression Models**

drop if y < 0 | y > 1

frm y x1 x2 x3 x4, m(1P) linkf(logit)
estimates store a1Pl

outreg2 using Linkf_Logit1P.xls, replace

frm y x1 x2 x3 x4, m(1P) linkf(probit)
estimates store a1Pp

outreg2 using Linkf_probit1P.xls, replace

frm y x1 x2 x3 x4, m(1P) linkf(loglog)
estimates store a1Plog

outreg2 using Linkf_loglog1P.xls, replace

frm y x1 x2 x3 x4, m(1P) linkf(cloglog)
estimates store a1Pclog

outreg2 using Linkf_cloglog1P.xls, replace

frm y x1 x2 x3 x4, m(2Pbin) linkb(logit) inf(1)
estimates store a2PBl

outreg2 using Linkb_logit2P.xls, replace

frm y x1 x2 x3 x4, m(2Pbin) linkb(probit) inf(1)
estimates store a2PBp

outreg2 using Linkb_probit2P.xls, replace

frm y x1 x2 x3 x4, m(2Pbin) linkb(loglog) inf(1)
estimates store a2PBlog

outreg2 using Linkb_loglog.xls, replace

frm y x1 x2 x3 x4, m(2Pbin) linkb(cloglog) inf(1)
estimates store a2PBclog

outreg2 using Linkb_cloglog.xls, replace

frm y x1 x2 x3 x4, m(2Pfrac) linkf(logit) inf(1)
estimates store a2PFl

outreg2 using Linkf_logit.xls, replace

frm y x1 x2 x3 x4, m(2Pfrac) linkf(probit) inf(1)
estimates store a2PFp

outreg2 using Linkf_probit.xls, replace

frm y x1 x2 x3 x4, m(2Pfrac) linkf(loglog) inf(1)
estimates store a2PFlog

outreg2 using Linkf_loglog.xls, replace

frm y x1 x2 x3 x4, m(2Pfrac) linkf(cloglog) inf(1)
estimates store a2PFclog

outreg2 using Linkf_cloglog.xls, replace



********************************************************************************************************

* Table 1

frm_reset a1Pl, l(2)
frm_reset a1Pp, l(2)
frm_reset a1Plog, l(2)
frm_reset a1Pclog, l(2)

frm_ggoff a1Pl
frm_ggoff a1Pp
frm_ggoff a1Plog
frm_ggoff a1Pclog

frm_ptest, mod1(a1Pl) mod2(a1Pp) lm
frm_ptest, mod1(a1Pl) mod2(a1Plog) lm
frm_ptest, mod1(a1Pl) mod2(a1Pclog) lm
frm_ptest, mod1(a1Pp) mod2(a1Plog) lm
frm_ptest, mod1(a1Pp) mod2(a1Pclog) lm
frm_ptest, mod1(a1Plog) mod2(a1Pclog) lm

* Table 2

frm_reset a2PBl, l(2)
frm_reset a2PBp, l(2)
frm_reset a2PBlog, l(2)
frm_reset a2PBclog, l(2)

frm_ggoff a2PBl
frm_ggoff a2PBp
frm_ggoff a2PBlog
frm_ggoff a2PBclog

frm_ptest, mod1(a2PBl) mod2(a2PBp) lm
frm_ptest, mod1(a2PBl) mod2(a2PBlog) lm
frm_ptest, mod1(a2PBl) mod2(a2PBclog) lm
frm_ptest, mod1(a2PBp) mod2(a2PBlog) lm
frm_ptest, mod1(a2PBp) mod2(a2PBclog) lm
frm_ptest, mod1(a2PBlog) mod2(a2PBclog) lm

* Table 3

frm_reset a2PFl, l(2)
frm_reset a2PFp, l(2)
frm_reset a2PFlog, l(2)
frm_reset a2PFclog, l(2)

frm_ggoff a2PFl
frm_ggoff a2PFp
frm_ggoff a2PFlog
frm_ggoff a2PFclog

frm_ptest, mod1(a2PFl) mod2(a2PFp) lm
frm_ptest, mod1(a2PFl) mod2(a2PFlog) lm
frm_ptest, mod1(a2PFl) mod2(a2PFclog) lm
frm_ptest, mod1(a2PFp) mod2(a2PFlog) lm
frm_ptest, mod1(a2PFp) mod2(a2PFclog) lm
frm_ptest, mod1(a2PFlog) mod2(a2PFclog) lm


* Table 5

frm_pe a1Pl, ape(x1 x2 x3 x4)
frm_pe a1Pclog, ape(x1 x2 x3 x4)
frm_pe a2PBl a2PFl, ape(x1 x2 x3 x4)
frm_pe a2PBl a2PFp, ape(x1 x2 x3 x4)
frm_pe a2PBl a2PFlog, ape(x1 x2 x3 x4)
frm_pe a2PBl a2PFclog, ape(x1 x2 x3 x4)
frm_pe a2PBclog a2PFl, ape(x1 x2 x3 x4)
frm_pe a2PBclog a2PFp, ape(x1 x2 x3 x4)
frm_pe a2PBclog a2PFlog, ape(x1 x2 x3 x4)
frm_pe a2PBclog a2PFclog, ape(x1 x2 x3 x4)



*Quantile Regression 

 
qreg y x1 x2 x3 x4, vce(robust)

outreg2 using qreg.xls, replace

bsqreg y x1 x2 x3 x4

outreg2 using bsqreg.xls, replace

sqreg y x1 x2 x3 x4,q(.25 .5 .75 .90) reps(500)

outreg2 using sqregquantis500.xls, replace
 
tobit y x1 x2 x3 x4

outreg2 using tobit.xls, replace
  
xttobit y x1 x2 x3 x4

outreg2 using xttobit.xls, replace

metobit y x1 x2 x3 x4

outreg2 using metobit.xls, replace
 
xtqreg y x1 x2 x3 x4,q(.25 .5 .75 .90)
 
outreg2 using ztqregquantis.xls, replace
 

*Correlation Matrix

xtset id year

xtsum y x1 x2 x3 x4
pwcorr y x1 x2 x3 x4, sig star(.01)
asdoc pwcorr y x1 x2 x3 x4, star(all) replace
