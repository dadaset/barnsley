#' The application server-side
#' 
#' @param input,output,session Internal parameters for {shiny}. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function( input, output, session ) {
  # Your application server logic
  
  # output$value <- renderPrint({ input$slider1 })
  
  output$value <- renderPrint(input$slider1)
  
  # fractal_fern2 <- function(x, p){
  #   if (p <= 0.01) {
  #     m <- matrix(c(.83, 0, 0, .16), 2, 2)
  #     f <- c(0, 0)
  #   } else if (p <= 0.86) {
  #     m <- matrix(c(.83, -.04, .04, .85), 2, 2)
  #     f <- c(0, 1.6)
  #   } else if (p <= 0.93) {
  #     m <- matrix(c(.2, .23, -.26, .22), 2, 2)
  #     f <- c(0, 1.6)
  #   } else {
  #     m <- matrix(c(-.15, .26, .28, .24), 2, 2)
  #     f <- c(0, .44)
  #   }
  #   m %*% x + f
  # }
  # 
  # # how many reps determines how detailed the fern will be
  # reps <- 10000
  # 
  # # create a vector with probability values, and a matrix to store coordinates
  # p <- runif(reps)
  # 
  # # initialise a point at the origin
  # coords <- c(0, 0)
  # 
  # # compute Fractal Coordinates
  # m <- Reduce(fractal_fern2, p, accumulate = T, init = coords)
  # m <- t(do.call(cbind, m))

  observeEvent (input$back_classy, {
    updateSliderInput(
      session, 
      "slider1", 
      value = .2
    )
    updateSliderInput(
      session, 
      "slider2", 
      value = .23
    )
    updateSliderInput(
      session, 
      "slider3", 
      value = -.26
    )})
    
  
  
  
  observeEvent (input$gen_random, {
    updateSliderInput(
      session, 
      "slider1", 
      value = runif (1, -1, 1)
    )
    updateSliderInput(
      session, 
      "slider2", 
      value = runif (1, -1, 1)
    )
    updateSliderInput(
      session, 
      "slider3", 
      value = runif (1, -1, 1)
    )
    updateSelectInput(
      session, 
      "select",  
      choices = sample(list("green",
                            "darkgreen",
                            "blue",
                            "blue4",
                            "deeppink2",
                            "darkorange1",
                            "black",
                            "chocolate4",
                            "aquamarine3",
                            "darkred"), 1)
  )
  })
  
  output$grafico <- renderPlot({
    
    
    fractal_fern2 <- function(x, p){
      if (p <= 0.01) {
        m <- matrix(c(0, 0, 0, .16), 2, 2)
        f <- c(0, 0)
      } else if (p <= 0.86) {
        m <- matrix(c(.85, -.04, .04, .85), 2, 2)
        f <- c(0, 1.6)
      } else if (p <= 0.93) {
        m <- matrix(c(input$slider1, input$slider2, input$slider3, .22), 2, 2)
        f <- c(0, 1.6)
      } else {
        m <- matrix(c(-.15, .26, .28, .24), 2, 2)
        f <- c(0, .44)
      }
      m %*% x + f
    }
    
    # how many reps determines how detailed the fern will be
    reps <- 10000
    
    # create a vector with probability values, and a matrix to store coordinates
    p <- runif(reps)
    
    # param1 <- input$slider1
    
    # initialise a point at the origin
    coords <- c(0, 0)
    
    # compute Fractal Coordinates
    m <- Reduce(fractal_fern2, p, accumulate = T, init = coords)
    m <- t(do.call(cbind, m))
    
    #aqui tem o a funcao plot que vai dentro do Render plot
    plot(m, type = "p", cex = 0.2, pch= 19, col = input$select,
         xlim = c(-4, 4), ylim = c(0, 10), 
         xlab = NA, ylab = NA, axes = FALSE)
    
    # plot(input$select ~ iris$Sepal.Width)
    # output$value <- renderPrint({ input$select })
  })
}



