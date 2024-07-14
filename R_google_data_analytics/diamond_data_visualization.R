# create a bar chart
ggplot(data=diamonds) + 
  geom_bar(mapping=aes(x=cut))

# adding colors in each cut
ggplot(data=diamonds) + 
  geom_bar(mapping=aes(x=cut, color=cut))

# fill the colors inside the bar
ggplot(data=diamonds) + 
  geom_bar(mapping=aes(x=cut, fill=cut))

# separate clarity with different colors
ggplot(data=diamonds) + 
  geom_bar(mapping=aes(x=cut, fill=clarity))

# separate clarity to different charts
ggplot(data=diamonds) + 
  geom_bar(mapping=aes(x=cut, fill=clarity)) + 
  facet_wrap(~clarity)


