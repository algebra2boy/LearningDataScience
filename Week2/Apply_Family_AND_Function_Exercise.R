# Exercise 1
x <- c(27, 72, 66, 50, 61, NA, 7, 76, 53, 50, 
       98, 68, 68, 85, 61, 100, 72, 69, 40, 22, 
       14, 51, NA, 68, 84, 55, 5, 1, 86, 54, 7, 
       93, 25, 25, 31, 62, 99, 63, 77, 50, 48, 
       60, 72, 99, 58, 94, 44, 18, 94, NA)

y <- c(419, 210, 795, 720, 11, 569, 895, 562, 985, 308, 
       580, 225, 689, NA, 196, 819, 307, 475, 469, 933, 
       258, 507, 353, 112, 88, 233, 722, 474, NA, NA, 
       726, 120, 575, 783, NA, 235, 359, 718, 518, 13, 
       938, 13, 692, 149, 240, 14, 987, 394, 243, 987)

z <- c(12.282, 10.174, 8.890, 1.848, 12.375, 12.763, 3.938, 5.403, 3.929, 10.453, 
       7.829, 11.231, 7.039, 0.619, 5.398, 17.120, 5.960, 7.882, 13.696, 7.477, 
       16.825, 13.638, 17.214, 4.910, 15.185, 10.148, 8.729, 2.848, 14.937, 6.588, 
       9.287, 14.485, 17.756, 11.299, 2.889, 1.174, 3.753, 17.054, 16.225, 13.798, 
       13.680, 1.227, 7.766, 10.687, 6.047, 17.515, 14.185, 1.487, 7.824, 14.867)

df <- data.frame(x = x, y = y, z = z)


mean_function <- function(x,remove_na)
{
   compute = sum(x,na.rm = remove_na) / (length(x)-sum(is.na(x)))
}

# to calculate the mean of the column y
ColumnYmean = mean_function(df$y,TRUE)
ColumnYmean 

# use apply to calculate the row means using mean_function
df$rowMeans <- apply(df,1,mean_function,TRUE)

# use sapply to calculate the column means using mean_function
sapply(df,mean_function,TRUE)

