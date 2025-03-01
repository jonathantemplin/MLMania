% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/totalRSquaredinator.R
\name{totalRSquaredinator}
\alias{totalRSquaredinator}
\title{Provides marginal R squared for comparing a model with an empty model}
\usage{
totalRSquaredinator(model, dvName, data)
}
\arguments{
\item{model}{A model (from \code{lme4::lmer}) that all predictors from \code{largerModel}}

\item{dvName}{A character variable containing the name of the outcome variable from \code{data}}

\item{data}{A data frame containing numeric variables and a unit ID variable}
}
\value{
A list with all calculated values along with a display of these values to the console window
}
\description{
Provides marginal R squared for comparing a model with an empty model
}
\examples{

# load data for example 3a
data(example3aData)

# remove all NA values from langpost and
newData = example3aData[complete.cases(example3aData[,c("langpost", "homework")]),]

# add school-level homework variable as predictor
hwModel = lmer(formula = langpost ~ 1 + homework + (1|schoolID), data = newData, REML = TRUE)
summary(hwModel)

# calculate total (marginal) R squared using this function
hwVSemptyTotalR2 = totalRSquaredinator(model = hwModel, dvName = "langpost", data = newData)

# OUTPUT
# Total R2 Estimate
# Total R2: 0.00126

}
