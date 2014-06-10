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


describe "Friend", ->
  it "should be available", ->
    friend = new Friend 'Aldo'
    expect(friend.name).toBe 'Aldo'
    friend = new Friend
    expect(friend.name).toBe 'invitado'
  it " can track awards", ->
    friend = new Friend 'Aldo'
    expect(friend.points).toBe 0
    friend.won 300, 80
    expect(friend.points).toBe 300
    expect(friend.wins).toBe 1
    expect(friend.bestTime).toBe 80
    friend.won 300,60
    expect(friend.points).toBe 600
    expect(friend.wins).toBe 2
    expect(friend.bestTime).toBe 80
    friend.won 900,160
    expect(friend.points).toBe 1500
    expect(friend.wins).toBe 3
    expect(friend.bestTime).toBe 160


describe 'Card', ->
  it "should accepts a string as a card", ->
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

  it "should accepts a 5 element array as a card", ->
    card = new Card ['Pulpo','Petalo','> Oir','Lourdes','Pavimento']
    expect(card.personal.content).toBe "Pulpo"
    expect(card.personal.playAll).toBe false
    expect(card.objeto.content).toBe "Petalo"
    expect(card.objeto.playAll).toBe false
    expect(card.accion.content).toBe "Oir"
    expect(card.accion.playAll).toBe true
    expect(card.dificil.content).toBe "Lourdes"
    expect(card.dificil.playAll).toBe false
    expect(card.todos.content).toBe "Pavimento"
    expect(card.todos.playAll).toBe false

  xit "should not insert an array with more or less elements", ->
    expect(new Card (['Pulpo','Petalo','> Oir','Lourdes'])).toThrow()
    expect(new Card (['Pulpo','Petalo','> Oir','Lourdes','Pavimento',''])).toThrow()

describe "Ajax",->
  it "should make get requests", ->
    aj = new Ajax()
    aj.get '../public/textDocToTest.txt',(data)=>
      expect(data).toBe 'hola'

