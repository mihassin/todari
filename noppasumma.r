f = rep(0,18);
for (x in 1:6) {
    for (y in 1:6) {
    	for (z in 1:6) {
        	pxyz = 1/6**3
        	s = x+y+z
       		f[s] = f[s] + pxyz
    	}
    }
}
print(f)
plot(f,type="h")