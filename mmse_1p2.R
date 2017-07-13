# two-way mutation 
# McElreath and Boyd, MMSE, chapter 1 problem 2

time <- 15 # timesteps are generations
t <- seq(1,time+1)

# two alleles
m12 <- 0.1 # chance of allele 1 mutating to allele 2 
m21 <- 0.3 # chance of allele 2 mutating to allele 1 

equilibrium <- m21 / (m12 + m21) # McElreath and Boyd, page 33

eq <- rep(equilibrium, time+1)

freq1 <- NULL
freq1[1] <- 0.01 # frequency of A

for(i in 1:time){
    p <- freq1[i]
    
    freq1[i+1] <- p - (m12 * p) + (m21 * (1-p)) # McElreath page 33 
}
# plot frequencu of allele 1
plot(t, freq1, type="p", ylim=c(0,1))

# draw red line for equilibrium frequency p_hat
lines(t, eq, type="l", col="red")
