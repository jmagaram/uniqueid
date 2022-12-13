let validId = "a47614ed-c26f-415f-91f4-c21c3bad370c"

let bobId = PersonId.random()
let bobValue = bobId->PersonId.value
Js.log("Bob's id is " ++ bobValue)
