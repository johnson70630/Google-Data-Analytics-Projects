hotel_bookings = read.csv("hotel_bookings.csv")

head(hotel_bookings)
str(hotel_bookings)
colnames(hotel_bookings)
glimpse(hotel_bookings)
View(hotel_bookings)

install.packages('ggplot2')
library(ggplot2)

# scatter plot
ggplot(data=hotel_bookings) + 
  geom_point(mapping=aes(x=lead_time, y=children))

ggplot(data = hotel_bookings) +
  geom_point(mapping=aes(x=stays_in_weekend_nights , y=children))

# bar chart
ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = distribution_channel))

# separate market_segment with colors
ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = distribution_channel, fill=market_segment))

# separate market_segment with charts
ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = distribution_channel)) +
  facet_wrap(~market_segment)

# rotate the text
ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = distribution_channel)) +
  facet_wrap(~market_segment) +
  theme(axis.text.x = element_text(angle = 45))

# separate deposit_type with colors
ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = distribution_channel, fill=deposit_type))

# separate deposit_type with charts
ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = distribution_channel)) +
  facet_wrap(~deposit_type)

# rotate the text
ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = distribution_channel)) +
  facet_wrap(~deposit_type) +
  theme(axis.text.x = element_text(angle = 45))

# use facet_grid
ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = distribution_channel)) +
  facet_grid(~deposit_type) +
  theme(axis.text.x = element_text(angle = 45))

# separate deposit_type and market_segment with charts
ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = distribution_channel)) +
  facet_wrap(~deposit_type~market_segment) +
  theme(axis.text.x = element_text(angle = 45))

# change x-axis to hotel
ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = hotel)) +
  facet_wrap(~market_segment)

install.packages('tidyverse')
library(tidyverse)

# filter data
onlineta_city_hotels <- filter(hotel_bookings, hotel=='City Hotel'
                                & hotel_bookings$market_segment=='Online TA')
View(onlineta_city_hotels)

# another way to filter data
onlineta_city_hotels_v2 <- hotel_bookings %>% 
  filter(hotel=='City Hotel') %>% 
  filter(market_segment=='Online TA')
View(onlineta_city_hotels_v2)

# visualize with the scatterplot
ggplot(data = onlineta_city_hotels_v2) +
  geom_point(mapping = aes(x = lead_time, y = children))

# change x-axis to market_segment
ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = market_segment)) +
  facet_wrap(~hotel)

# add labels
ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = market_segment)) +
  facet_wrap(~hotel) +
  labs(title='Comparison of market segments by hotel type for hotel bookings')

mindate <- min(hotel_bookings$arrival_date_year)
maxdate <- max(hotel_bookings$arrival_date_year)

# print variables in the label
ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = market_segment)) +
  facet_wrap(~hotel) +
  theme(axis.text.x = element_text(angle = 45)) +
  labs(title="Comparison of market segments by hotel type for hotel bookings",
       subtitle=paste0("Data from: ", mindate, " to ", maxdate))

# put date to caption
ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = market_segment)) +
  facet_wrap(~hotel) +
  theme(axis.text.x = element_text(angle = 45)) +
  labs(title="Comparison of market segments by hotel type for hotel bookings",
       caption=paste0("Data from: ", mindate, " to ", maxdate))

# add labels for both axis
ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = market_segment)) +
  facet_wrap(~hotel) +
  theme(axis.text.x = element_text(angle = 45)) +
  labs(title="Comparison of market segments by hotel type for hotel bookings",
       caption=paste0("Data from: ", mindate, " to ", maxdate),
       x="Market Segment",
       y="Number of Bookings")

#save the chart
ggsave('hotel_booking_chart.png', width=7, height=7)
# bigger image
ggsave('hotel_booking_chart.png', width=16, height=8)
