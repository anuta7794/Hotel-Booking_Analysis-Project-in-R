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

**_-"head()"_**; 

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







