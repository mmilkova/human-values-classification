
bigd <- read.csv("data_classified_by_values.csv", sep = "|")
bigd$Self.Direction <- bigd$Self.direction
ten.values = c("Security", "Conformity", "Tradition", "Benevolence", "Universalism", 
              "Self.Direction", "Stimulation", "Hedonism", "Achievement", "Power"
)

# MDS ######
# Mair, P., Borg, I., & Rusch, T. (2016). Goodness-of-fit assessment in multidimensional scaling and unfolding. Multivariate behavioral research, 51(6), 772-789.
cv <- cor(bigd[bigd$If_political==0,17:26])
library(smacof)
diss <- sim2diss(cv, method = "corr")
fit1 <- mds(diss, type = "interval")
plot(fit1, plot.type = "Shepard")
plot(fit1, plot.type = "stress")
fit1$stress
summary(fit1)
plot(fit1)
plot(sapply(1:9, function(x) mds(diss, type = "interval", x)$stress))
p.test.mds = permtest(fit1, nrep = 500) 


# Congruence with Schwartz circle #####

degrees = seq(0, 360, by = 360/10)[-11]
radius = .5
perf.circle = data.frame(#degrees = degrees,
  X = radius*cos(degrees*pi/180),
  Y = radius*sin(degrees*pi/180),
  row.names = ten.values)

fit.proc <- Procrustes(perf.circle[ten.values,1:2],
                       fit1$conf[ten.values,]) 

all.coords = rbind(data.frame(fit.proc$Yhat[ten.values,], type = "Empirical") %>% mutate(label = row.names(.)),
      data.frame(fit.proc$X[ten.values,], type = "Theoretical")  %>% 
        set_colnames(c("D1", "D2", "type")) %>% mutate(label = row.names(.))
)
ggplot(all.coords, aes(D1, D2, color = type))+geom_point()+
  geom_text_repel(aes(label = label)) +
  scale_color_viridis_d(end = .7)+
  coord_equal()+theme_void()+labs(color = "")+facet_wrap(~type)
#ggsave("paper1/figures/MDS_Schwartz_circle.png", width = 6, height = 6)

# congruence coefficient
congruence.w.schwartz= sapply(dat.dyn, function(x) {
  
  rot.dyn = Procrustes(
    perf.circle[ten.values,1:2],
    as.matrix(x[ten.values,1:2]) 
  ) 
  rot.dyn$congcoef
})

summary(congruence.w.schwartz, 3)

# Kendall correlations between dimensions
all.coords.wide = all.coords %>% 
  melt(id.vars = c("label", "type")) %>%
  dcast(label ~ variable + type)

cor(all.coords.wide$D1_Empirical,
    all.coords.wide$D1_Theoretical, method = "kendall")

cor(all.coords.wide$D2_Empirical,
    all.coords.wide$D2_Theoretical, method = "kendall")


ggplot(all.coords.wide, aes(D1_Theoretical, D1_Empirical))+
  geom_point()+
  geom_text_repel(aes(label = label))+
  geom_abline(slope = 1, intercept = 0, color = "red")

ggplot(all.coords.wide, aes(D2_Theoretical, D2_Empirical))+
  geom_point()+
  geom_text_repel(aes(label = label))+
  geom_abline(slope = 1, intercept = 0, color = "red")