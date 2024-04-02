library(shiny)
library(shinythemes)

shinyUI(
        navbarPage("Shiny App", theme = shinytheme("cerulean"),
                   tabPanel("Analytics",
                            fluidPage(
                                    titlePanel("Fertility Prediction using Swiss Dataset",
                                               hr()
                                               ),
                                    sidebarLayout(
                                            sidebarPanel(
                                                    selectInput("variable", "Variable:",
                                                                c("Agriculture" = "Agriculture",
                                                                  "Examination" = "Examination",
                                                                  "Education" = "Education",
                                                                  "Catholic" = "Catholic",
                                                                  "Infant Mortality" = "Infant.Mortality"
                                                                )),
                                                    
                                                    submitButton("Submit")
                                            ),
                                            
                                            mainPanel(
                                                    h3(textOutput("caption")),
                                                    
                                                    tabsetPanel(type = "tabs", 
                                                                tabPanel("Regression Summary", verbatimTextOutput("fit")),
                                                                tabPanel("Regression model Plot", plotOutput("swissPlot"),
                                                                )
                                                    )
                                            )
                                    )
                            )
                   ),
                   tabPanel("About the Swiss Data Set",
                            
                            h3("Swiss Fertility and Socioeconomic Indicators (1888) Data"),
                            hr(),
                            helpText("Standardized fertility measure and socio-economic indicators for each of 47 French-speaking provinces of Switzerland at about 1888.",
                                     "The socioeconomic factors used for predicting Fertility are Agriculture, Examination, Education, Catholic and Infant Mortality"),
                            h3("Format"),
                            p("The Swiss dataset used for this project has 47 observations on 6 variables."),
                            
                            h3("Note"),
                            
                            p("Files for all 182 districts in 1888 and other years have been available at"),
                            a("https://opr.princeton.edu/archive/pefp/switz.aspx")
                   ),
                   tabPanel("More Dataset Details",
                            
                            h3("Description"),
                            hr(),
                            helpText("The data collected are for 47 French-speaking “provinces” at about 1888.",
                                     " Switzerland, in 1888, was entering a period known as the demographic transition;",
                                     " i.e., its fertility was beginning to fall from the high level typical of underdeveloped countries.."),
                            h3("Format"),
                            p("A data frame with 47 observations on 6 variables."),
                            
                            p("  [, 1]   Fertility:                     Ig, common standardized fertility measure"),
                            p("  [, 2]	 Agriculture:	                % of males involved in agriculture as occupation"),
                            p("  [, 3]	 Examination:	                % draftees receiving highest mark on army examination"),
                            p("  [, 4]	 Education:     	        % education beyond primary school for draftees."),
                            p("  [, 5]	 Catholic:	                % ‘catholic’ (as opposed to ‘protestant’)"),
                            p("  [, 6]	 Infant.Mortality:	        live births who live less than 1 year."),
                           
                            h3("Source"),
                            
                            p("Mosteller, F. and Tukey, J. W. (1977) Data Analysis and Regression: A Second Course in Statistics. Addison-Wesley, Reading Mass, Project 16P5, pages 549-551"),
                            
                            
                            h3("References"),
                            
                            p("Becker, R. A., Chambers, J. M. and Wilks, A. R. (1988) The New S Language. Wadsworth & Brooks/Cole.")
                   ),
                   tabPanel("How to use App",
                            h3("Steps"),
                            hr(),
                            p("Step 1 - Click on the Analytics tab on the blue rail at the top of the App"),
                            p("Step 2 - Click on dropdown on your left to select variable to be used in predicting Fertility"),
                            p("Step 3 - Click on the Submit button"),
                            p("Step 4 - Click on the 'Regression Summary tab' to view the summary statistics"),
                            p("Step 5 - Click on the 'Regression Model Plot tab' to view the Plot"),
                            p("Step 6 - Click on any of the About the 'Swiss Dataset tab' and 'More Dataset Details tab' for details on the Dataset"),
                            )

        )
)
