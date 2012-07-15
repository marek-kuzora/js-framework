# Accessing model.
performance '/model.access'



performance 'standard'

  ' 1 length': -> @user()

  ' 2 length': -> @user().name()

  ' 3 length': -> @user().status().logged()

  ' 4 length': -> @user().job().company().name()

  ' 5 length': -> @user().job().company().ceo().name()

  '10 length': ->
    @user().job().company().ceo().job().company().ceo().job().company().name()



performance 'first_time'

  '1 length': ->
    @user().acc_.model_ = undefined
    @user().acc_.accs_  = []
    @user()

  '2 length': ->
    @user().acc_.model_ = undefined
    @user().acc_.accs_  = []
    @user().name()

  '3 length': ->
    @user().acc_.model_ = undefined
    @user().acc_.accs_  = []
    @user().status().logged()

  '4 length': ->
    @user().acc_.model_ = undefined
    @user().acc_.accs_  = []
    @user().job().company().name()
