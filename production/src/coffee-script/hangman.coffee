Hangman = () ->
  word = ""
  wordList = []
  wrongs = 0
  corrects = []
  max_guess = 3 
  unrevealed_word = []
  {
    get_word: () -> word
    set_word: (_word) -> 
      word = _word
      wordList = word.split('')
      unrevealed_word = new Array(wordList.length + 1).join('_').split('')
      return
    get_wrong: () -> wrongs
    get_max_guess: () -> max_guess
    get_unrevealed_word: () -> 
      unrevealed_word.join('')
    isFinished: () -> wrongs > max_guess or not _.any unrevealed_word, (w) -> w is '_' 
    guess: (_word) ->
      console.log "---  GUESS WITH #{_word}"
      mm = _.map(wordList, (w, i) -> 
        if w is _word
          unrevealed_word[i] = w
          return w 
        else 
          return
      )
      common_char = _.intersection(mm, wordList)
      if _.isEmpty(common_char)
        corrects.push common_char
        wrongs += 1 
  }

