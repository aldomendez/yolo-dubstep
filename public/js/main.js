(function() {
  var Card, Deck, Friend;

  Deck = (function() {
    function Deck(raw) {
      var line, preCards, _i, _len;
      this.raw = raw;
      this.cards = [];
      preCards = this.raw.split('\n');
      for (_i = 0, _len = preCards.length; _i < _len; _i++) {
        line = preCards[_i];
        if (line.trim().charAt(0) !== ':') {
          this.addCard(line);
        }
      }
    }

    Deck.prototype.addCard = function(line) {
      var prospect;
      prospect = line.split(',');
      if (prospect.length === 5) {
        return this.cards.push(new Card(prospect));
      }
    };

    return Deck;

  })();

  Card = (function() {
    function Card(raw) {
      var k, sp, v, _ref, _ref1;
      this.raw = raw;
      sp = {};
      if (typeof this.raw === 'object') {
        if (this.raw.length === 5) {
          _ref = this.raw, sp.personal = _ref[0], sp.objeto = _ref[1], sp.accion = _ref[2], sp.dificil = _ref[3], sp.todos = _ref[4];
        } else {
          throw new Error("Card elements mismatch (" + this.raw.length + ") should be (5)");
        }
      } else {
        _ref1 = this.raw.split(','), sp.personal = _ref1[0], sp.objeto = _ref1[1], sp.accion = _ref1[2], sp.dificil = _ref1[3], sp.todos = _ref1[4];
      }
      for (k in sp) {
        v = sp[k];
        this[k] = this.parseElement(v);
      }
    }

    Card.prototype.parseElement = function(el) {
      el = el.trim();
      if (el[0] === ">") {
        return {
          content: (el.slice(1)).trim(),
          playAll: true
        };
      } else {
        return {
          content: el.trim(),
          playAll: false
        };
      }
    };

    return Card;

  })();

  Friend = (function() {
    function Friend(name) {
      this.name = name != null ? name : 'invitado';
      this.points = 0;
      this.wins = 0;
      this.bestTime = 0;
    }

    Friend.prototype.won = function(points, time) {
      this.points += points;
      this.wins++;
      if (time > this.bestTime) {
        return this.bestTime = time;
      }
    };

    return Friend;

  })();

  window.Friend = Friend;

  window.Deck = Deck;

  window.Card = Card;

}).call(this);
