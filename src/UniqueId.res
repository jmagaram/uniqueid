type uuidError = InvalidFormat

module type T = {
  include Validated.T
  @genType
  let random: unit => t
}

module type MakeType = () => (T with type domain := string and type error = uuidError)

module Make: MakeType = () => {
  @genType.import("uuid")
  external _validate: string => bool = "validate"

  @genType.import("./uuid")
  external _random: unit => string = "create"

  include Validated.Make({
    type error = uuidError
    type domain = string
    let validate = (. s) => {
      let s = s->Js.String2.trim
      let len = s->Js.String2.length
      switch len < 5 {
      | true => Error(InvalidFormat)
      | false => Ok(s)
      }
    }
  })

  let random = () => ("uuid:" ++ Js.Math.random()->Belt.Float.toString)->makeUnsafe
}
