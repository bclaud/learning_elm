module Types exposing (fullName, toFullName)


toFullName : { a | firstName : String, lastName : String } -> String
toFullName person =
    person.firstName ++ " " ++ person.lastName


fullName : String
fullName =
    toFullName { firstName = "Hermann", lastName = "Hesse" }
