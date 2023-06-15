function(input, output) { 
  
  output$infobox1 <- renderInfoBox({
    data1 <- salary %>%
      filter(work_year %in% input$input_year)
    
    infoBox(title = "Total Survey", 
            value = nrow(data1), 
            icon = icon("person"),
            color = "blue")
  })
  output$infobox2 <- renderInfoBox({
    data2 <- salary %>%
      filter(work_year %in% input$input_year)
    
    infoBox(title = "Total Employee Location ",
            value = length(unique(salary$employee_residence)), 
            icon = icon("earth-americas"),
            color = "green")
  })
  output$infobox3 <- renderInfoBox({
    data3 <- salary %>%
      filter(work_year %in% input$input_year)
    
    infoBox(title = "Total Job Title", 
            value = length(unique(salary$job_title)), 
            icon = icon("briefcase"),
            color = "light-blue")
  })
  
  
  output$pie1 <- renderEcharts4r({
    pie_chart <- salary  %>%
      filter(work_year %in% input$input_year) %>%
      group_by(get(input$variable1)) %>%
      summarise(n = n()) %>%
      rename(
        "Total Data" = n
      )
    
    pie1 <- pie_chart %>%
      e_charts(get(input$variable1)) %>%
      e_pie(`Total Data`, radius = c("50%", "70%")) %>%
      e_title(paste(str_to_title(str_replace(input$variable1, "_", " "),locale ='en'), "Composition"),left = "center") %>%
      e_tooltip() %>%
      e_labels(show = TRUE,
               formatter = "{b} \n {d}%" ,
               position = "outside",
               fontSize = 10
      ) %>%
      e_legend(orient = "vertical",
               left = "right",
               top = "50px")
    
  })
  
  output$bar1 <- renderEcharts4r({
    bar_chart <- salary  %>%
      filter(work_year %in% input$input_year) %>%
      group_by(get(input$variable2)) %>%
      summarise(n = n()) %>%
      rename(
        "total_data" = n
      ) %>%
      top_n(10, total_data) %>%
      arrange(total_data)
    
    bar1 <- bar_chart %>%
      e_charts(get(input$variable2)) %>%
      e_bar(total_data, 
            name = "Total Data", 
            legend = FALSE
      ) %>%
      e_labels(position = "right", 
               formatter = htmlwidgets::JS("
                        function (params) {
                          return (parseFloat(params.value[0]).toLocaleString('en-US'));
                        }
                      ")
      ) %>%
      e_tooltip() %>%
      e_title(paste("Top 10", str_to_title(str_replace(input$variable2, "_", " "),locale ='en'), "by Count"),
              left = "center") %>%
      e_flip_coords() %>%
      e_y_axis(splitLine = list(show = FALSE), axisLabel = list(interval=0)) %>%
      e_x_axis(show=FALSE) %>%
      e_color("#33FFF6") 

    
  })
  
  output$bar2 <- renderEcharts4r({
    bar2_chart  <- salary %>%
      filter(work_year %in% input$input_year) %>%
      group_by(job_title) %>%
      summarise(n = n()) %>%
      rename(
        "total_data" = n
      ) %>%
      top_n(5) %>%
      arrange(desc(total_data))
    
    bar2 <- bar2_chart %>%
      e_charts(job_title) %>%
      e_bar(total_data, 
            name = "Total Data", 
            legend = FALSE
      ) %>%
      e_labels(position = "top", formatter = htmlwidgets::JS('
          function (params) {
            return (parseFloat(params.value[1]).toLocaleString("en-US"));
          }')
      ) %>%
      e_y_axis(show = FALSE) %>%
      e_x_axis(axisTick = FALSE, fontSize = 6, axisLabel = list(interval=0)) %>%
      e_tooltip(formatter = e_tooltip_item_formatter(locale = 'en-US')) %>%
      e_color("#163ec2") %>%
      e_title(text = "Top 5 Most Popular Data Science Job Title",
              left = "center")
    
  })
  
  output$infobox4 <- renderInfoBox({
    data4 <- salary %>%
      filter(work_year %in% input$input_year)
    
    infoBox(title = "Average Salary in USD", 
            value = currency(prettyNum(round(mean(data4$salary_in_usd), 2),  big.mark = ","), symbol = "$",
                             digits = 2L), 
            icon = icon("gauge"),
            color = "blue")
  })
  output$infobox5 <- renderInfoBox({
    data5 <- salary %>%
      filter(work_year %in% input$input_year)
    
    infoBox(title = "Highest Salary in USD",
            value = currency(prettyNum(max(data5$salary_in_usd), big.mark = ","), symbol = '$', digits = 0L), 
            icon = icon("arrow-up"),
            color = "green")
  })
  output$infobox6 <- renderInfoBox({
    data6 <- salary %>%
      filter(work_year %in% input$input_year)
    
    infoBox(title = "Lowest Salary in USD", 
            value = currency(prettyNum(min(data6$salary_in_usd), big.mark = ","), symbol = '$', digits = 0L), 
            icon = icon("arrow-down"),
            color = "light-blue")
  })
  
  output$violin1 <- renderPlotly({
    violin_chart <- salary  %>%
      filter(work_year %in% input$input_year) %>%
      plot_ly(
        x = ~(get(input$variable3)),
        y = ~salary_in_usd,    
        split = ~(get(input$variable3)),
        type = 'violin',
        spanmode = "hard",
        box = list(
          visible = T
        ),
        meanline = list(
          visible = T
        )
      ) 
    
    violin1 <- violin_chart %>%
      layout(
        title = paste("<b>Salary in USD distribution by", str_to_title(str_replace(input$variable3, "_", " <b>"),locale ='en')),
        font = list(
          family = "sans-serif",
          size = 13,
          color = 'black'),
        separators = ", ",
        xaxis = list(
          title = ''),
        yaxis = list(
          title = "",
          zeroline = F,
          tickformat = ". ",
          tickprefix = "$"
        )
      )
    
  })
  
  output$salary_table <- renderDataTable({
    table1 <- salary  %>%
      filter(work_year %in% input$input_year) %>%
      group_by(job_title) %>%
      summarise(average_salary = round(mean(salary_in_usd),2)) %>%
      select(job_title, average_salary)  %>%
      filter(average_salary >= input$variable5[1] & average_salary <= input$variable5[2] ) %>%
      arrange(desc(average_salary)) %>%
      mutate(average_salary = dollar(average_salary))
    
    datatable(data = table1,
              options = list(scrollX = TRUE)
    )
  })
  
  output$bar3 <- renderEcharts4r({
    bar3_chart  <- salary %>%
      filter(work_year %in% input$input_year) %>%
      group_by(get(input$variable4)) %>%
      summarise(average_salary = round(mean(salary_in_usd),2)) %>%
      arrange(desc(average_salary)) 
    
    bar3 <- bar3_chart %>%
      e_charts(get(input$variable4)) %>%
      e_bar(average_salary, 
            name = "Average Salary", 
            legend = FALSE
      ) %>%
      e_labels(position = "top" , formatter = htmlwidgets::JS('
          function (params) {
            return (parseFloat(params.value[1]).toLocaleString("en-US", {style:"currency", currency:"USD"}));
          }')
      ) %>%
      e_y_axis(show = FALSE) %>%
      e_x_axis(axisTick = FALSE, fontSize = 6, axisLabel = list(interval=0)) %>%
      e_tooltip(formatter = e_tooltip_item_formatter(style = 'currency',locale = 'en-US', currency ='USD')) %>%
      e_color("#163ec2") %>%
      e_title(text = paste("Average Salary by", str_to_title(str_replace(input$variable4, "_", " "),locale ='en')),
              left = "center")
    

  }) 
  
  
  output$table_data <- renderDataTable({
    datatable(data = salary,
              options = list(scrollX = TRUE)
    )
  })
  
  
  output$heatmap1 <- renderEcharts4r({
    dummies <- dummyVars(~ ., data= salary %>% select(input$variable6, salary_in_usd))
    test <- predict(dummies, newdata = salary)
    data<-cor(test) 
    data1<-melt(data)
    data1$Var1 <- gsub(input$variable6,"",as.character(data1$Var1))
    data1$Var2 <- gsub(input$variable6,"",as.character(data1$Var2))
    data1$Var1 <- gsub("salary_in_usd","Salary in USD",as.character(data1$Var1))
    data1$Var2 <- gsub("salary_in_usd","Salary in USD",as.character(data1$Var2))
    data1$value <- round(data1$value,3)
    
    heatmap <- data1 %>%
      e_charts(Var1) %>%
      e_heatmap(Var2, value, itemStyle = list(emphasis = list(shadowBlur = 10))) %>%
      e_visual_map(value, left='center', orient='horizontal') %>%
      e_labels(position='inside') %>%
      e_tooltip() %>%
      e_y_axis(fontSize = 6, axisLabel = list(interval=0)) %>%
      e_x_axis(fontSize = 6, axisLabel = list(interval=0)) %>%
      e_grid(left=40, containLabel=TRUE) %>%
      e_title(text = paste("Salary in USD Correlation with", str_to_title(str_replace(input$variable6, "_", " "),locale ='en')),
              left = "center")
    

    
    
  }) 
  
  
}
