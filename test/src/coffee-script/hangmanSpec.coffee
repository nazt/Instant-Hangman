describe "Hangman", ->
  unrevealed_word = ""
  wrong = ""
  finished = ""
  retrieve = () ->
    unrevealed_word = hangman.get_unrevealed_word()
    wrong = hangman.get_wrong()
    finished = hangman.isFinished()    
  beforeEach -> window.hangman = Hangman()
  it "should initialize properly", ->
     hangman.set_word "hello"
     expect(hangman.get_word null).toBe "hello"
     expect(hangman.get_wrong()).toBe 0
     expect(hangman.get_max_guess null).toBe 3 
     expect(hangman.get_unrevealed_word null).toEqual ["_", "_", "_", "_", "_"].join('')
     expect(hangman.isFinished null).toBeFalsy()
  describe "should guess all right", ->
    it "guess with word sequence", ->
       hangman.set_word "hello"

       hangman.guess 'h'
       do retrieve
       expect(wrong).toEqual 0
       expect(unrevealed_word).toEqual ["h", "_", "_", "_", "_"].join('')
       hangman.guess 'e'
       do retrieve
       expect(wrong).toEqual 0
       expect(unrevealed_word).toEqual ["h", "e", "_", "_", "_"].join('')
       hangman.guess 'l'
       do retrieve
       expect(wrong).toEqual 0
       expect(unrevealed_word).toEqual ["h", "e", "l", "l", "_"].join('')
       hangman.guess 'o'
       do retrieve
       expect(wrong).toEqual 0
       expect(unrevealed_word).toEqual ["h", "e", "l", "l", "o"].join('')
       expect(finished).toBeTruthy();

    it "guess with reverse guess order", ->
       hangman.set_word "hello"   
       hangman.guess 'o'       
       do retrieve
       expect(finished).toBeFalsy()
       expect(hangman.isFinished null).toBeFalsy();
       expect(wrong).toEqual 0
       expect(hangman.get_unrevealed_word null).toEqual ["_", "_", "_", "_", "o"].join('')
       hangman.guess 'l'
       do retrieve
       expect(wrong).toEqual 0
       expect(unrevealed_word).toEqual ["_", "_", "l", "l", "o"].join('')
       hangman.guess 'e'
       do retrieve
       expect(wrong).toEqual 0
       expect(finished).toBeFalsy()
       expect(unrevealed_word).toEqual ["_", "e", "l", "l", "o"].join('')
       hangman.guess 'h'
       do retrieve
       expect(wrong).toEqual 0
       expect(unrevealed_word).toEqual ["h", "e", "l", "l", "o"].join('')
       expect(finished).toBeTruthy()
  it "guest with all wrong", ->
    hangman.set_word "hello"   
    hangman.guess 'y'
    do retrieve
    expect(wrong).toEqual 1
    expect(finished).toBeFalsy()
    expect(unrevealed_word).toEqual ["_", "_", "_", "_", "_"].join('')
    hangman.guess 'a'
    do retrieve
    expect(wrong).toEqual 2
    expect(unrevealed_word).toEqual ["_", "_", "_", "_", "_"].join('')
    expect(finished).toBeFalsy()
    hangman.guess 'i'
    do retrieve
    expect(wrong).toEqual 3
    expect(unrevealed_word).toEqual ["_", "_", "_", "_", "_"].join('')
    expect(finished).toBeFalsy()
    hangman.guess 'x'
    do retrieve
    expect(wrong).toEqual 4
    expect(unrevealed_word).toEqual ["_", "_", "_", "_", "_"].join('')
    expect(finished).toBeTruthy()
  it "guest with correct and wrong then die", ->
    hangman.set_word "hello"   
    hangman.guess 'y'
    do retrieve
    expect(wrong).toEqual 1
    expect(finished).toBeFalsy()
    expect(unrevealed_word).toEqual ["_", "_", "_", "_", "_"].join('')
    hangman.guess 'h'
    do retrieve
    expect(wrong).toEqual 1
    expect(unrevealed_word).toEqual ["h", "_", "_", "_", "_"].join('')
    expect(finished).toBeFalsy()
    hangman.guess 'i'
    do retrieve
    expect(wrong).toEqual 2
    expect(unrevealed_word).toEqual ["h", "_", "_", "_", "_"].join('')
    expect(finished).toBeFalsy()
    hangman.guess 'l'
    do retrieve
    expect(wrong).toEqual 2
    expect(unrevealed_word).toEqual ["h", "_", "l", "l", "_"].join('')
    expect(finished).toBeFalsy()
    hangman.guess 'l'
    do retrieve
    expect(wrong).toEqual 2
    expect(unrevealed_word).toEqual ["h", "_", "l", "l", "_"].join('')
    expect(finished).toBeFalsy()
    hangman.guess 'l'
    do retrieve
    expect(wrong).toEqual 2
    expect(unrevealed_word).toEqual ["h", "_", "l", "l", "_"].join('')
    expect(finished).toBeFalsy()
    hangman.guess 'l'
    do retrieve
    expect(wrong).toEqual 2
    expect(unrevealed_word).toEqual ["h", "_", "l", "l", "_"].join('')
    expect(finished).toBeFalsy()
    hangman.guess 'y'
    do retrieve
    expect(wrong).toEqual 3
    expect(finished).toBeFalsy()
