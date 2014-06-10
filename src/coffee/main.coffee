class Deck
  constructor: (@raw) ->
    @cards = []
    preCards = @raw.split '\n'
    for line in preCards when line.trim().charAt(0) isnt ':'
      @addCard line
  addCard:(line)->
    prospect = line.split ','
    if prospect.length is 5
      @cards.push new Card prospect


class Card
  constructor: (@raw) ->
    sp = {} # Inicializamos para poderle agregar datos despues
    # Sacamos los parametros que vamos a usar
    if typeof(@raw) is 'object' 
      if @raw.length is 5
        [sp.personal,sp.objeto,sp.accion,sp.dificil,sp.todos] = @raw
      else
        throw new Error "Card elements mismatch (#{@raw.length}) should be (5)"
    else
      [sp.personal,sp.objeto,sp.accion,sp.dificil,sp.todos] = @raw.split ','
    for k, v of sp
      @[k] = @parseElement v
  parseElement:(el)->
    el = el.trim()
    if el[0] is ">"
      return {
        content:(el.slice 1).trim()
        playAll:true
      }
    else
      return {
        content:el.trim()
        playAll:false
      }

class Friend
  constructor: (@name = 'invitado') ->
    @points = 0
    @wins = 0
    @bestTime = 0 # en segundos
  won:(points, time)->
    @points += points
    @wins++
    if time > @bestTime
      @bestTime = time
  

  
class Ajax
  constructor: () ->
    @
  get:(@url,onload,onerror)->
    console.log 'tengo el control'
    request = new XMLHttpRequest
    request.open 'GET', @url, true
    request.onload = ->
      console.log " tengo el estatus : #{request.status}"
      if 199 >= request.status >= 400
        console.log 'Dentro del IF'
        @resp = request.responseText
        console.log @resp
        onload(@resp)
    if onerror?
      request.onerror = onerror
    request.send()
    @
  json:(@url,onload,onerror)->
    request = new XMLHttpRequest
    request.open 'GET', @url, true
    request.onload = ->
      if 200 >= request.status >= 400
        @data = JSON.parse request.responseText
    if onerror?
      request.onerror = onerror

    request.send()
    @
  post:(@url,@data)->
    request = new XMLHttpRequest
    request.open "POST", @url, true
    request.setRequestHeader 'Content-Type', 'application/x-www-form-urlencoded; charset=UTF-8'
    request.send @data
    @



window.Friend = Friend  
window.Ajax = Ajax
window.Deck = Deck
window.Card = Card