# nongenetic replication (content bias) MMSE section 1.6
# aim to understand McElreath page 31 by plotting

VA <- 0.7 # survival with allele A
VB <- 0.4 # survival with allele B
time <- 170 # timesteps are generations

# beta is how strongly learning is biased by payoff difference (content bias)
# also scales payoff difference between 0 and 1
beta <- 0.1 # McElreath page 29

p <- NULL; pdash <- NULL; 
delta_p <- NULL
    
# time index 0 would be more approriate but R doesnt permit
p[1] <- 0.01 # frequency of A

for(i in 1:time){
    # when variance of "alleles" higher, then selection is faster
    variance <- p[i] * (1-p[i])

    delta_p[i] <- variance * 2 * beta * (VA - VB)
    
    p[i+1] <- p[i] + delta_p[i]
}
plot(p) 
