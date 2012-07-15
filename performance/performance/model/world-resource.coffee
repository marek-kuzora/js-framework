#
# @require:
#   ref:   fierry/model/utils.ref
#   model: fierry/model/utils.model
#   world: fierry/model/utils.world
#
#   Array: fierry/model/array
#



# Company description.
model class Company

  constructor: (def, _) ->
    @name = def String, _.name
    @year = def Number, _.year
    @ceo = def User, _.ceo
    @numbers = def Array(Number), [1,2,3,4,5]



# Microsoft company.
microsoft = world Company,
  name: 'Microsoft'
  year: 1975
  ceo:
    age: 56
    name: 'Steve'
    surname: 'Ballmer'
    company: 'Microsoft'



# Google company.
google = world Company,
  name: "Google"
  year: 1998
  ceo:
    age: 39
    name: 'Larry'
    surname: 'Page'
    company: 'Google'


# User description.
model class User

  constructor: (def, _, @acc_) ->
    @age     = def Number, _.age
    @name    = def String, _.name
    @surname = def String, _.surname

    @job     = def Job, _.company
    @status  = def Status


  login: ->
    @status().type.set("ADMIN")
    @status().logged.set(true)

    @status().enable_credentials()


  logout: ->
    @status().type.set("GUEST")
    @status().logged.set(false)

    @status().disable_credentials()


  logged: ->
    return @status().logged()



# User status, account type.
model class Status

  constructor: (def, _) ->
    @type   = def String, "GUEST"
    @logged = def Boolean, false

    @credentials = def Credentials


  enable_credentials: ->
    @credentials().admin.set(true)
    @credentials().create.set(true)
    @credentials().delete.set(true)


  disable_credentials: ->
    @credentials().admin.set(false)
    @credentials().create.set(false)
    @credentials().delete.set(false)



# User credentials.
model class Credentials

  constructor: (def, _) ->
    @admin  = def Boolean, false
    @create = def Boolean, false
    @delete = def Boolean, false



# Reference to a proper company.
CompanyR = ref (name) ->
  return microsoft if name is "Microsoft"
  return google



# Job description.
model class Job

  constructor: (def, _, acc) ->
    @city    = def String
    @salary  = def Number
    @company = def CompanyR

    @change(_)


  change: (name) ->
    return @set_microsoft_() if name is 'Microsoft'
    return @set_google_()


  set_microsoft_: ->
    @salary.set(95000)
    @city.set("Redmond")
    @company.set("Microsoft")


  set_google_: ->
    @salary.set(105000)
    @city.set("Kirkland")
    @company.set("Google")



# Biblo Baggins user :)
return world User,
  age: 129
  name: 'Bilbo'
  surname: 'Baggins'
  company: 'Microsoft'
