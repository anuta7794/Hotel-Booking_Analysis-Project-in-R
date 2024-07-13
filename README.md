# **Hotel Booking Analysis Project in R**

## **Dataset**
The data in this project is originally from the article [Hotel Booking Demand Datasets](https://www.sciencedirect.com/science/article/pii/S2352340918315191). To learn more about the dataset click [here](https://www.kaggle.com/jessemostipak/hotel-booking-demand).

## **Scenario**

In this scenario, I am a junior data analyst working for a hotel booking company. I have been asked to clean a .csv file that was created after querying a database to combine two different tables from different hotels. In order to learn more about this data, I am going to need to use functions to preview the data's structure, including its columns and rows. I will also need to use basic cleaning functions to prepare this data for analysis, and then create visualizations that highlight different aspects of the data to present to my stakeholder.

## **Steps**

### **1. Load Packages**

For this project, I used the following packages and libraries:

**_- "tidyverse"_**

**_- "skimr"_**

**_- "janitor"_**

**_- "rmarkdown"_**

**_- "readr"_**

**_-"dplyr"_**

**_-"tidyr"_**

**_-"ggplot2"_**

### **Step 2: Import Data**

I imported the data with **_read_csv()_** function.

### Step 3: Get to Know Data

Before I started cleaning my data, I took some time to explore it. I used several functions, including:

**_"head()"_**; 

to summarize and preview the data: **_"str()"_** and **_"glimpse()"_**;

to check the names of the columns in my data set: **_"colnames()"_**;

to provide a detailed summary of the data: **_"skim_without_charts()"_**.

### Step 4: Clean Data

1) Based on my notes, I am primarily interested in the following variables: *hotel*, *is_canceled*, *lead_time*. I used **_"select()"_** function and created a new data frame with just those columns, calling it _trimmed_df_.

2) I renamed the variable *'hotel'* to be named *'hotel_type'* to be crystal clear on what the data is about.

3) The next task was to combine the arrival month and year into one column using the **_"unite()"_** function.

4) I also needed to create a new column that would sum up all the adults, children, and babies on a reservation for the total number of people. I used the **_"mutate()"_** function to make changes to my columns.

5) For the summary statistics, I calculated the total number of canceled bookings and the average lead time for booking using **_"summarize()"_** function.

### Step 5: Manipulate Data

1) The stakeholder wants to focus on bookings that were made far in advance. The **_"arrange()"_** function in descending order was applied to arrange the data by most lead time to least lead time.

2) I created a new data frame named *'bookings_df_v2'* that had those changes saved.

3) I want to know what the average lead time for booking is because I need to find out how early the stakeholder should run promotions for hotel rooms. I used the **_"mean()"_** function to answer that question.

4) The next task was to see what the average lead time before booking is for just city hotels. My first step was creating a new data set that only contains data about city hotels. I did that using the **_"filter()"_** function, and named my new data frame *'bookings_df_city'*. Then, I needed to know some more information about city hotels, including the maximum and minimum lead time. I was also interested in how they are different from resort hotels. I used the **_"group_by()"_**, **_"summarize()"_** functions, and the **_pipe operator_** to make my code easier to follow. I stored the new data set in a data frame named *'hotel_summary'*.

### Step 6: Aesthetics and Visualization with ggplot2

I used **_"ggplot2"_** to determine:

- if people with children book hotel rooms in advance;
  
- what group of guests book the most weekend nights in order to target that group in a new marketing campaign;
  
- how many of the transactions are occurring for each different distribution type developing promotions based on different booking distributions;
  
- if the number of bookings for each distribution type is different depending on whether or not there was a deposit or what market segment they represent;

/assets/images/Hotel_Booking_Market_Segments_Chart.png  
  
### Step 7: Create Facets

The next task was to create separate charts for each deposit type and market segment using **_"ggplot2"_** to help the stakeholder understand the differences more clearly. I used the **_"facet_grid"_** function to include plots even if they were empty.

### Step 8: Apply Filters

After considering all the data, my stakeholder decides to send the promotion to families that make online bookings for city hotels. The online segment is the fastest growing segment, and families tend to spend more at city hotels than other types of guests. I used **_"filter"_** function and created a plot that shows the relationship between lead time and guests traveling with children for online bookings at city hotels.

### Step 9: Add Annotations

I leveraged annotations in **_"ggplot2_"** to make it clear where the data is from, what the main takeaway is.


























