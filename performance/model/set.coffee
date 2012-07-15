performance '/model.set'

  before: ->
    @age = @user().age
    @ref = @user().job().company

    @user_data =
      age: 129
      name: 'Bilbo'
      surname: 'Baggins'
      company: 'Microsoft'



performance 'no_access'

  'primitive': -> @age.set(129)

  'reference': -> @ref.set("Microsoft")

  'complex':   -> @user.set(@user_data)



performance 'with_access'
  
  'primitive': -> @age(); @age.set(129)

  'reference': -> @ref(); @ref.set("Microsoft")

  # Concat accs_ into prev_ - tablica sie robi coooraz wieksza!
  'complex':   -> @user(); @user.set(@user_data)
