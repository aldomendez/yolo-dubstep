(function() {
  describe('Deck', function() {
    return it(" should insert all the cards in the deck", function() {
      var deck;
      deck = new Deck("Pictionary\n ==========\n Categorias:\n :Persona/Lugar/Animal, Objeto, Accion, Difícil, Todos Juegan\n Tarjetas:\n >Pinocho,Silla de ruedas, Cavar, Poco espacio, Juego informatico\n Pulpo, Pétalo, >Oir, >Lourdes, Pavimento\n >china, matorral, apoyar, >malo, quemadura del sol\n cabaña, >zanco, >aterrizar forzosamente, tridimensional, marcapagina\n >aquilibrista, altavoz, hacer garabatos, >directo, salida en falso\n >avispon, queso suizo, >sudar, equipo domestico, pierna fracturada\n teatro, >chocolate, >perseguir, flojo, silbato\n");
      return expect(deck.cards.length).toBe(7);
    });
  });

  describe("Friend", function() {
    it("should be available", function() {
      var friend;
      friend = new Friend('Aldo');
      expect(friend.name).toBe('Aldo');
      friend = new Friend;
      return expect(friend.name).toBe('invitado');
    });
    return it(" can track awards", function() {
      var friend;
      friend = new Friend('Aldo');
      expect(friend.points).toBe(0);
      friend.won(300, 80);
      expect(friend.points).toBe(300);
      expect(friend.wins).toBe(1);
      expect(friend.bestTime).toBe(80);
      friend.won(300, 60);
      expect(friend.points).toBe(600);
      expect(friend.wins).toBe(2);
      expect(friend.bestTime).toBe(80);
      friend.won(900, 160);
      expect(friend.points).toBe(1500);
      expect(friend.wins).toBe(3);
      return expect(friend.bestTime).toBe(160);
    });
  });

  describe('Card', function() {
    it("should accepts a string as a card", function() {
      var card;
      card = new Card(">Pinocho,Silla de ruedas, > Cavar, Poco espacio, Juego informatico");
      expect(card.personal.content).toBe("Pinocho");
      expect(card.personal.playAll).toBe(true);
      expect(card.objeto.content).toBe("Silla de ruedas");
      expect(card.objeto.playAll).toBe(false);
      expect(card.accion.content).toBe("Cavar");
      expect(card.accion.playAll).toBe(true);
      expect(card.dificil.content).toBe("Poco espacio");
      expect(card.dificil.playAll).toBe(false);
      expect(card.todos.content).toBe("Juego informatico");
      return expect(card.todos.playAll).toBe(false);
    });
    it("should accepts a 5 element array as a card", function() {
      var card;
      card = new Card(['Pulpo', 'Petalo', '> Oir', 'Lourdes', 'Pavimento']);
      expect(card.personal.content).toBe("Pulpo");
      expect(card.personal.playAll).toBe(false);
      expect(card.objeto.content).toBe("Petalo");
      expect(card.objeto.playAll).toBe(false);
      expect(card.accion.content).toBe("Oir");
      expect(card.accion.playAll).toBe(true);
      expect(card.dificil.content).toBe("Lourdes");
      expect(card.dificil.playAll).toBe(false);
      expect(card.todos.content).toBe("Pavimento");
      return expect(card.todos.playAll).toBe(false);
    });
    return xit("should not insert an array with more or less elements", function() {
      expect(new Card(['Pulpo', 'Petalo', '> Oir', 'Lourdes'])).toThrow();
      return expect(new Card(['Pulpo', 'Petalo', '> Oir', 'Lourdes', 'Pavimento', ''])).toThrow();
    });
  });

  describe("Ajax", function() {
    return it("should make get requests", function() {
      var aj;
      aj = new Ajax();
      return aj.get('../public/textDocToTest.txt', (function(_this) {
        return function(data) {
          return expect(data).toBe('hola');
        };
      })(this));
    });
  });

}).call(this);
