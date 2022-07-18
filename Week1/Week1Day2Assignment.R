#1
avenger <- c("thor","falcon","captamerica","hulk")
supernatural <- c("yes","no","no","yes")
fly = c("yes","yes","no","no")
superhero <- data.frame(avenger,supernatural,fly)

superhero <-data.frame(
           avenger = c("thor","falcon","captamerica","hulk"),
           supernatural = c("yes","no","no","yes"),
           fly = c("yes","yes","no","no"))
superhero

#2
?sort
superhero <- superhero[order(superhero$avenger),]
superhero

#3
superhero$supernatural %<>% as.factor
superhero$supernatural
superhero$fly %<>% as.factor
superhero$fly
superhero

#4
str(superhero$avenger)
superhero[,1]

#5 
onlyfly <- superhero %>% filter(fly =="yes")
onlyfly

#6 
onlysuperandfly <- superhero %>% filter(supernatural =="yes" & fly =="yes")
onlysuperandfly


