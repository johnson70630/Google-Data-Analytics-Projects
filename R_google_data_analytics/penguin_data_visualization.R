install.packages('ggplot2')
install.packages('palmerpenguins')

library(ggplot2)
library(palmerpenguins)

data(penguins)
View(penguins)

# search for the syntax of geom_point
?geom_point

# visualize data with flipper_length_mm in x-axis and body_mass_g in y-axis
ggplot(data=penguins) + 
  geom_point(mapping=aes(x=flipper_length_mm, y=body_mass_g))

# another available syntax
ggplot(data = penguins, mapping = aes(x = flipper_length_mm, y = body_mass_g)) +  
  geom_point()

# separate species to different colors and shapes
ggplot(data=penguins) + 
  geom_point(mapping=aes(x=flipper_length_mm, y=body_mass_g, 
                         color=species, shape=species))

# change all dots to purple
ggplot(data=penguins) + 
  geom_point(mapping=aes(x=flipper_length_mm, y=body_mass_g
                         , shape=species), color='purple')

# turn to a smooth line chart
ggplot(data=penguins) + 
  geom_smooth(mapping=aes(x=flipper_length_mm, y=body_mass_g))

# separate species in line chart
ggplot(data=penguins) + 
  geom_smooth(mapping=aes(x=flipper_length_mm, y=body_mass_g,
                          linetype=species))

# Visualize Both line and dots
ggplot(data=penguins) + 
  geom_smooth(mapping=aes(x=flipper_length_mm, y=body_mass_g)) +
  geom_point(mapping=aes(x=flipper_length_mm, y=body_mass_g))

# Deal with over-plotting with jitter
ggplot(data=penguins) + 
  geom_jitter(mapping=aes(x=flipper_length_mm, y=body_mass_g))

# separate each species to different plot
ggplot(data=penguins, aes(x=flipper_length_mm, y=body_mass_g)) + 
  geom_point(aes(color=species)) +
  facet_wrap(~species)

# separate sex further
ggplot(data=penguins, aes(x=flipper_length_mm, y=body_mass_g)) + 
  geom_point(aes(color=species)) +
  facet_grid(sex~species)

# only separate sex
ggplot(data=penguins, aes(x=flipper_length_mm, y=body_mass_g)) + 
  geom_point(aes(color=species)) +
  facet_grid(~sex)

# add labels
ggplot(data=penguins, aes(x=flipper_length_mm, y=body_mass_g)) + 
  geom_point(aes(color=species)) +
  labs(title='Palmer Penguins: Body Mass vs. Flipper Length',
       subtitle='Sample of Three Penguins Species',
       caption='Data collected by Dr. Kristen Gorman') +
  annotate('text', x=220, y=3500, label='The Gentoos are the largest', 
            color='purple', fontface='bold', size=4.5, angle=25)

# save the plot
ggsave('Three Penguin Species.png')

