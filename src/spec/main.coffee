describe 'Deck', ->
	it " should insert all the cards in the deck", ->
		deck = new Deck(
			"Pictionary\n
			==========\n
			Categorias:\n
			:Persona/Lugar/Animal, Objeto, Accion, Difícil, Todos Juegan\n
			Tarjetas:\n
			>Pinocho,Silla de ruedas, Cavar, Poco espacio, Juego informatico\n
			Pulpo, Pétalo, >Oir, >Lourdes, Pavimento\n
			>china, matorral, apoyar, >malo, quemadura del sol\n
			cabaña, >zanco, >aterrizar forzosamente, tridimensional, marcapagina\n
			>aquilibrista, altavoz, hacer garabatos, >directo, salida en falso\n
			>avispon, queso suizo, >sudar, equipo domestico, pierna fracturada\n
			teatro, >chocolate, >perseguir, flojo, silbato\n")
		expect(deck.cards.length).toBe 7

describe 'Card', ->
	it "should split the elements from the Card", ->
		card = new Card ">Pinocho,Silla de ruedas, > Cavar, Poco espacio, Juego informatico"
		expect(card.personal.content).toBe "Pinocho"
		expect(card.personal.playAll).toBe true
		expect(card.objeto.content).toBe "Silla de ruedas"
		expect(card.objeto.playAll).toBe false
		expect(card.accion.content).toBe "Cavar"
		expect(card.accion.playAll).toBe true
		expect(card.dificil.content).toBe "Poco espacio"
		expect(card.dificil.playAll).toBe false
		expect(card.todos.content).toBe "Juego informatico"
		expect(card.todos.playAll).toBe false