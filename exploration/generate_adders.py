from pptrees.AdderForest import AdderForest as forest

width = 8
f = forest(width, alias = "ripple-carry")
f.hdl("adder8_ripple.v")

f = forest(width, alias = "sklansky")
f.hdl("adder8_sklansky.v")

f = forest(width, alias = "kogge-stone")
f.hdl("adder8_koggestone.v")

f = forest(width, alias = "brent-kung")
f.hdl("adder8_brentkung.v")

