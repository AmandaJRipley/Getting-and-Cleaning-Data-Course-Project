
title: "Codebook"
author: "Amanda Ripley"
date: "April 25th, 2020"
---

## Project Description
For this project we used the provided raw data to create a tidy dataset containing only the observations for mean and standard deviation. 

## Raw Data 
The raw data used was downloaded here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Collection of Raw Data
The collectors of the original data set (Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.) describe the data collection process below.
"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data." 

"The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain."

## Creating the tidy datafile
Code and steps for creating the tidy dataset are availbale in the run_analysis.R file.

## Description of the variables in the tidydata.txt file

  -This data set includes 180 observations of 68 variables.

### subject
This variable contains an integer that identifies each participant of the study.

### activity
This variable contains one of 6 factors that describes the activity that the participant was doing at the time of observation.
These factors are:
1 WALKING,
2 WALKING_UPSTAIRS,
3 WALKING_DOWNSTAIRS,
4 SITTING,
5 STANDING,
6 LAYING,

### Factors
The other 66 variables are the measurements taken during the activities being preformed. 
All of the time measurements are in radians per second.
All of the frequency measurements are in Hertz.
