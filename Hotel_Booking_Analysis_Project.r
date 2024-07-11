#Step 1: Load packages

install.packages("tidyverse")
install.packages("skimr")
install.packages("janitor")
install.packages("rmarkdown")
install.packages("readr")

library(tidyverse)
library(skimr)
library(janitor)
library(rmarkdown)
library(readr)

#Step 2: Import Data

bookings_df <- read_csv("C:/Users/denni/Documents/hotel_bookings.csv.csv")

#Step 3: Getting to know the data

head(bookings_df)

str(bookings_df)

glimpse(bookings_df)

colnames(bookings_df)

skim_without_charts(bookings_df)

new_df <- select(bookings_df, `adr`, adults)

mutate(new_df, total = `adr` / adults)

#Step 4: Clean Data

trimmed_df <- bookings_df %>% 
  select(hotel, is_canceled, lead_time)

trimmed_df %>% 
  select(hotel, is_canceled, lead_time) %>% 
  rename(hotel_type = hotel)

arrival_df <- bookings_df %>%
  select(arrival_date_year, arrival_date_month) %>% 
  unite(arrival_month_year, c("arrival_date_month", "arrival_date_year"), sep = " ")

guests_df <- bookings_df %>%
  mutate(guests = adults + children + babies)

head(guests_df)

canceled_bookings_df <- bookings_df %>%
  summarize(number_canceled = sum(is_canceled),
            average_lead_time = mean(lead_time))

head(canceled_bookings_df)


#Step 5: Manipulate Data

arrange(bookings_df, lead_time)

arrange(bookings_df, desc(lead_time))

bookings_df_v2 <-
  arrange(bookings_df, desc(lead_time))

head(bookings_df_v2)

max(bookings_df$lead_time)

min(bookings_df$lead_time)

mean(bookings_df$lead_time)

mean(bookings_df_v2$lead_time)

bookings_df_city <- 
  filter(bookings_df, bookings_df$hotel=="City Hotel")

head(bookings_df_city)

mean(bookings_df_city$lead_time)

hotel_summary <- 
  bookings_df %>%
  group_by(hotel) %>%
  summarise(average_lead_time=mean(lead_time),
            min_lead_time=min(lead_time),
            max_lead_time=max(lead_time))

head(hotel_summary)

#Step 6: Aesthetics and Visualizations with ggplot2

install.packages('ggplot2')

library(ggplot2)

ggplot(data = bookings_df) +
  geom_point(mapping = aes(x = lead_time, y = children))

ggplot(data = bookings_df) +
  geom_point(mapping = aes(x = stays_in_weekend_nights, y = children))

ggplot(data = bookings_df) +
  geom_bar(mapping = aes(x = distribution_channel))

ggplot(data = bookings_df) +
  geom_bar(mapping = aes(x = distribution_channel, fill=deposit_type))

ggplot(data = bookings_df) +
  geom_bar(mapping = aes(x = distribution_channel, fill=market_segment))

#Step 7: Create Facets

ggplot(data = bookings_df) +
  geom_bar(mapping = aes(x = distribution_channel)) +
  facet_wrap(~deposit_type)

ggplot(data = bookings_df) +
  geom_bar(mapping = aes(x = distribution_channel)) +
  facet_wrap(~market_segment)

ggplot(data = bookings_df) +
  geom_bar(mapping = aes(x = distribution_channel)) +
  facet_grid(~deposit_type)

ggplot(data = bookings_df) +
  geom_bar(mapping = aes(x = distribution_channel)) +
  facet_wrap(~deposit_type~market_segment)

# step 8: Filters

onlineta_city_hotels <- filter(bookings_df, 
                               (hotel=="City Hotel" & 
                                  bookings_df$market_segment=="Online TA"))

View(onlineta_city_hotels)

onlineta_city_hotels_v2 <- bookings_df %>%
  filter(hotel=="City Hotel") %>%
  filter(market_segment=="Online TA")

ggplot(data = onlineta_city_hotels) +
  geom_point(mapping = aes(x = lead_time, y = children))

#Step 9: Add Annotations

ggplot(data = bookings_df) +
  geom_bar(mapping = aes(x = market_segment)) +
  facet_wrap(~hotel) +
  labs(title="Comparison of Market Segments by Hotel Type for Hotel Bookings")

min(bookings_df$arrival_date_year)

max(bookings_df$arrival_date_year)

mindate <- min(bookings_df$arrival_date_year)
maxdate <- max(bookings_df$arrival_date_year)

ggplot(data = bookings_df) +
  geom_bar(mapping = aes(x = market_segment)) +
  facet_wrap(~hotel) +
  labs(title="Comparison of market segments by hotel type for hotel bookings",
       subtitle=paste0("Data from: ", mindate, " to ", maxdate))

ggplot(data = bookings_df) +
  geom_bar(mapping = aes(x = market_segment)) +
  facet_wrap(~hotel) +
  labs(title="Comparison of market segments by hotel type for hotel bookings",
       caption=paste0("Data from: ", mindate, " to ", maxdate))

ggplot(data = bookings_df) +
  geom_bar(mapping = aes(x = market_segment)) +
  facet_wrap(~hotel) +
  labs(title="Comparison of Market Segments by Hotel Type for Hotel Bookings",
       caption=paste0("Data from: ", mindate, " to ", maxdate),
       x="Market Segment",
       y="Number of Bookings")

#Step 10: Save the Plot

ggsave('hotel_bookings_chart.png')

ggsave('hotel_booking_chart.png',
       width=16,
       height=8)












