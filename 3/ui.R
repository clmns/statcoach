library("shiny")

shinyUI(fluidPage(
	titlePanel("Stat Coach 3"),

	sidebarLayout(
		sidebarPanel(
			textInput("data", label = h4("Daten hier eingeben")),
			textInput("alpha", label = h4("Alpha"), value='0.01')
		),
		mainPanel(
			strong("Mittelwert"),
			textOutput("mean"),
			strong("Varianz"),
			textOutput("var"),
			strong("Freiheitsgrade"),
			textOutput("df"),
			strong("kritischer t- Wert"),
			textOutput("tValue"),
			strong("kritisches χ2 für untere Grenze"),
			textOutput("lowerChiBound"),
			strong("kritisches χ2 für obere Grenze"),
			textOutput("upperChiBound"),
			br(),
			textOutput("lowerMBound"),
			strong("≤ μ ≤"),
			textOutput("upperMBound"),
			br(),
			textOutput("lowerSigmaBound"),
			strong("≤ σ2 ≤"),
			textOutput("upperSigmaBound"),
			br(),
			br(),
			h4("Erklärung:"),
			h5("chi und T Werte:"),
			p("Einfach in der Tabelle nachschauen mit 1-alpha und der Anzahl der Freiheitsgrade(n-1)"),
			h5("Grenzen für μ: Skript Seite 85 Tabelle 5.1"),
			p("Für mich hat gepasst: Mittelwert+T Wert(1-alpha,Freiheitsgrade) * (Standardabweichung / Wurzel(n (Anzahl der Beobachtungen))"),
			h5("Grenzen für σ: Skript Seite 87 Tabelle 5.3"),
			p("Für mich hat gepasst: Freiheitsgrade * Varianz / (chi Quadrat Wert(1-alpha,Freiheitsgrade)")
		)
	)
))

