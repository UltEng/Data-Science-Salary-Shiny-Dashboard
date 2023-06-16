dashboardPage(title = 'Data Science Salary Analysis Dashboard',
              skin = "black",
              
              # ------ HEADER -------
              dashboardHeader(title = span(tagList(icon = icon("sack-dollar"),
                                                   "Data Science Salary Analysis"))),
              
              # ------ SIDE BAR -------
              dashboardSidebar(
                sidebarMenu(
                  menuItem(text = "Overview",
                           tabName = "page1",
                           icon = icon("magnifying-glass")),
                  menuItem(text = "Analysis",
                           icon = icon("chart-line"),
                           tabName = "page2",
                           badgeLabel = "new",
                           badgeColor = "green"),
                  menuItem(text = "Data Table",
                           tabName = "page3",
                           icon = icon("table-list")),
                  pickerInput(inputId = "input_year", 
                              label = "Choose year", 
                              choices = selectyear, 
                              options = list(`actions-box` = TRUE),
                              selected = "2020",
                              multiple = TRUE)
                )
              ),
              
              
              # ------ BODY -------
              dashboardBody(
                tabItems(
                  tabItem(tabName = "page1",
                          h2("Data Overview"),
                          br(),
                          fluidRow(
                            infoBoxOutput("infobox1"),
                            infoBoxOutput("infobox2"),
                            infoBoxOutput("infobox3")
                          ),
                          fluidRow(
                            box(width = 6,
                                selectInput(inputId = "variable1", 
                                        label = "Choose What to show with Pie Chart", 
                                        choices = selectpiechart,
                                        selected = "Experience Level")),
                            box(width = 6,
                                selectInput(inputId = "variable2", 
                                            label = "Choose What to show with HBar Chart", 
                                            choices = selectbarchart,
                                            selected = "employee_residence"))
                          ),
                          fluidRow(  
                             box(width = 6,
                                echarts4rOutput("pie1",height = 600)),
                             box(width = 6,
                                 echarts4rOutput("bar1",height = 600))
                          ),
                          fluidRow(
                            box(width = 12,
                                echarts4rOutput("bar2",height = 500))

                          )
                  ),
                  tabItem(tabName = "page2",
                          h2("Salary Analysis"),
                          br(),
                          fluidRow(
                            infoBoxOutput("infobox4"),
                            infoBoxOutput("infobox5"),
                            infoBoxOutput("infobox6")
                          ),
                          fluidRow(
                            box(width = 6,
                                selectInput(inputId = "variable3", 
                                            label = "Choose What to show with Violin Chart", 
                                            choices = selectpiechart,
                                            selected = "Experience Level")),
                            box(width = 6,
                                selectInput(inputId = "variable4", 
                                            label = "Choose What to show with Bar Chart", 
                                            choices = selectpiechart,
                                            selected = "Experience Level"))
                          ),
                          fluidRow(  
                            box(width = 6,
                                plotlyOutput("violin1",height = 600)),
                            box(width = 6,
                                echarts4rOutput("bar3",height = 600))
                          ),
                          fluidRow(  
                            box(width = 12,
                                selectInput(inputId = "variable6", 
                                            label = "Choose What correlation with salary in USD to show on heat map", 
                                            choices = selectpiechart,
                                            selected = "Experience Level"))
                          ),
                          fluidRow(  
                            box(width = 12, align='center',
                                echarts4rOutput("heatmap1",height = 800, width = 1600))
                          ),
                          fluidRow(  
                            box(width = 12,
                                sliderInput(inputId = "variable5", 
                                            label = "Choose Salary Range (USD)", 
                                            max = max(salary$salary_in_usd),
                                            min = min(salary$salary_in_usd),
                                            pre = '$',
                                            value = c(min(salary$salary_in_usd),max(salary$salary_in_usd))),textOutput("SliderText")
                            )
                          ),
                          fluidRow(  
                            box(width = 12,
                                title = "List of Job Title with Average Salary (USD) as Range picked",
                                dataTableOutput(outputId = "salary_table", height = 600))
                          )
                    ),
                    tabItem(tabName = "page3",
                            h2("Dataset Data Science Salaries"),
                            fluidRow(
                              box(width = 12,
                                  dataTableOutput(outputId = "table_data"))
                                  )
                            )
                  )
                )
              
)



