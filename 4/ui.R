library("shiny")

shinyUI(fluidPage(
	titlePanel("Stat Coach 4"),

	sidebarLayout(
		sidebarPanel(
			textInput("data", label = h4("Daten hier eingeben")),
			textInput("althypo", label = h4("Alternativhypothese")),
			textInput("alpha1", label = h4("Alpha"), value='0.01'),
			br(),
			textInput("nulhypo", label = h4("Nullhypothese")),
			textInput("alpha2", label = h4("Alpha"), value='0.05')
		),
		mainPanel(
			h4("Stichprobenwerte"),
			strong("Mittelwert"),
			textOutput("mean"),
			strong("Varianz"),
			textOutput("var"),
			strong("Standardabweichung"),
			textOutput("sd"),
			strong("Freiheitsgrade"),
			textOutput("df"),
			h4("Lokationstest"),
			strong("Teststatistik t"),
			textOutput("tValue"),
			strong("kritischen Wert cu"),
			textOutput("lok_cu"),
			strong("kritischen Wert co"),
			textOutput("lok_co"),
			br(),
			h4("Test der Varianz"),
			strong("Teststatistik t"),
			textOutput("tValueVar"),
			strong("kritischen Wert cu"),
			textOutput("var_cu"),
			strong("kritischen Wert co"),
			textOutput("var_co"),
			br(),
			br(),
			strong("Angabe:"),
			p("Im Rahmen eines Kälbermastversuches wurden die täglichen Tageszunahmen (in kg) von 16 Kälbern gemessen. 
1.34 1.45 1.59 1.28 1.38 1.16 1.64 1.15 1.43 1.72 1.68 1.35 1.75 1.74 1.83 1.40 
Testen Sie zum Signifikanzniveau α = 0.01 ob die mittlere Tageszunahme größer 1.2 kg ist (Alternativhypothese). Prüfen Sie zum Signifikanzniveau α = 0.05 ob die Standardabw. der Tageszunahmen gleich 0.1 kg ist (Nullhypothese).")
		)
	)
))

