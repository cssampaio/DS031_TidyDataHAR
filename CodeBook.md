# Code Book
## Description of variables, data, and transformations in tydedata.txt

The data set source presented in README.md was used to produce a tidy data

### Transformation steps

* Data merge, resulting in data frame with 10299 observations x 563 variables (1 subject + 1 activity labels + 561 features.)

* Data extraction of mean() and std() features, resulting in data frame with 10299 observations x 68 (1 subject + 1 activity + 33 mean() features + 33 std() features)

* Data manipulation 
	** replace activity labels by activity names
	** more descriptive variable names.
		from <- c("-", "\\(\\)", "Acc", "Gyro", "BodyBody", "Mag")
		to <- c("", "", "Acceleration", "AngularVelocity", "Body", "Magnitude")

* Data tidy, resulting in data frame with 180 observations x 68 variables
	Number of Observations (rows) = 30 subjects x 6 activities
	Reduced by grouping the subject and activity and averaging the mean and std features.

### Tidy data

	180 observation: 30 subjects x 6 activities
	68 variables: 1 subject + 1 activity + 33 mean() features + 33 std() features

### Dimensions and units

	t*Acceleration*: [length/time^2], m/s^2
	t*Jerk*: [length/time^3], m/s^3
	t*Gyroscope*: [angle/time], , radians/s
	t*GyroscopeJerk*: [angle/time^3], , radians/s^3
	
### List of features

tBodyAccelerationmeanX
tBodyAccelerationmeanY
tBodyAccelerationmeanZ
tBodyAccelerationstdX
tBodyAccelerationstdY
tBodyAccelerationstdZ
tGravityAccelerationmeanX
tGravityAccelerationmeanY
tGravityAccelerationmeanZ
tGravityAccelerationstdX
tGravityAccelerationstdY
tGravityAccelerationstdZ
tBodyAccelerationJerkmeanX
tBodyAccelerationJerkmeanY
tBodyAccelerationJerkmeanZ
tBodyAccelerationJerkstdX
tBodyAccelerationJerkstdY
tBodyAccelerationJerkstdZ
tBodyAngularVelocitymeanX
tBodyAngularVelocitymeanY
tBodyAngularVelocitymeanZ
tBodyAngularVelocitystdX
tBodyAngularVelocitystdY
tBodyAngularVelocitystdZ
tBodyAngularVelocityJerkmeanX
tBodyAngularVelocityJerkmeanY
tBodyAngularVelocityJerkmeanZ
tBodyAngularVelocityJerkstdX
tBodyAngularVelocityJerkstdY
tBodyAngularVelocityJerkstdZ
tBodyAccelerationMagnitudemean
tBodyAccelerationMagnitudestd
tGravityAccelerationMagnitudemean
tGravityAccelerationMagnitudestd
tBodyAccelerationJerkMagnitudemean
tBodyAccelerationJerkMagnitudestd
tBodyAngularVelocityMagnitudemean
tBodyAngularVelocityMagnitudestd
tBodyAngularVelocityJerkMagnitudemean
tBodyAngularVelocityJerkMagnitudestd
fBodyAccelerationmeanX
fBodyAccelerationmeanY
fBodyAccelerationmeanZ
fBodyAccelerationstdX
fBodyAccelerationstdY
fBodyAccelerationstdZ
fBodyAccelerationJerkmeanX
fBodyAccelerationJerkmeanY
fBodyAccelerationJerkmeanZ
fBodyAccelerationJerkstdX
fBodyAccelerationJerkstdY
fBodyAccelerationJerkstdZ
fBodyAngularVelocitymeanX
fBodyAngularVelocitymeanY
fBodyAngularVelocitymeanZ
fBodyAngularVelocitystdX
fBodyAngularVelocitystdY
fBodyAngularVelocitystdZ
fBodyAccelerationMagnitudemean
fBodyAccelerationMagnitudestd
fBodyAccelerationJerkMagnitudemean
fBodyAccelerationJerkMagnitudestd
fBodyAngularVelocityMagnitudemean
fBodyAngularVelocityMagnitudestd
fBodyAngularVelocityJerkMagnitudemean
fBodyAngularVelocityJerkMagnitudestd
