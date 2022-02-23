#' The application User-Interface
#' 
#' @param request Internal parameter for `{shiny}`. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # Your application UI logic 
    fluidPage(
      h3("Abstract Generator"),
      h5("This app plots images using Barnsley Fern (1988) algorithms's structure.
         You can change function's parameters using the sliders or click 'Gen Random' to generate random parameters."),
      sidebarLayout(
        sidebarPanel
        (
          actionButton("gen_random", label = "Gen random"
          ),
          h4(),
          actionButton("back_classy", label = "Back to classics"
          ),
          sliderInput(
            "slider3",
            label = h5("Param 1"),
            min = -1,
            max = 1,
            value = 0,
            step = .05
          ),
          sliderInput(
            "slider1",
            label = h5("Param 2"),
            min = -1,
            max = 1,
            value = 0,
            step = .05
          ),
          sliderInput(
            "slider2",
            label = h5("Param 3"),
            min = -1,
            max = 1,
            value = 0,
            step = .05
          ), selectInput("select", label = h4("Colorize it!"), 
                         choices = list("Green" =     "green"           ,
                                        "Dark green"= "darkgreen"       ,
                                        "Blue" =      "blue"            ,
                                        "Dark blue" = "blue4"           ,
                                        "Pink"   =    "deeppink2"       ,
                                        "Orange" =    "darkorange1"     ,
                                        "Black"  =    "black"           ,
                                        "Brown" =     "chocolate4"      ,
                                        "Aquamarine"= "aquamarine3"     ,
                                        "Dark Red" =  "darkred")        ,
                         selected = "darkgreen")
          
        ),mainPanel(
        plotOutput("grafico")
        #output é o objeto e "grafico", que são definidos no server 
      )
      )
      
      ),
    
    
  #     
  #     
  #     
  #     
  #     
  #   )
  )
}

#' Add external Resources to the Application
#' 
#' This function is internally used to add external 
#' resources inside the Shiny application. 
#' 
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function(){
  
  add_resource_path(
    'www', app_sys('app/www')
  )
 
  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys('app/www'),
      app_title = 'beta'
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert() 
  )
}

