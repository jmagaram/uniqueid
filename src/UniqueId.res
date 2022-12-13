type uuidError = InvalidFormat

module type T = {
  include Validated.T
  @genType
  let random: unit => t
}

module type MakeType = () => (T with type domain := string and type error = uuidError)

// =============================================
// STUBBED IMPLEMENTATION THAT FAKES UUID VALUES
// =============================================
module Make: MakeType = () => {
  include Validated.Make({
    type error = uuidError
    type domain = string
    let validate = (. s) =>
      switch s != "" {
      | true => Ok(s)
      | false => Error(InvalidFormat)
      }
  })
  let random = () => ("uuid:" ++ Js.Math.random()->Belt.Float.toString)->makeUnsafe
}

// ==============================================
// CORRECT IMPLEMENTATION USING REAL UUID PACKAGE
// ==============================================
// module Make: MakeType = () => {
//   @genType.import("uuid")
//   external _validate: string => bool = "validate"

//   @genType.import("./uuid")
//   external _random: unit => string = "create"

//   include Validated.Make({
//     type error = uuidError
//     type domain = string
//     let validate = (. s) =>
//       switch _validate(s) {
//       | true => Ok(s)
//       | false => Error(InvalidFormat)
//       }
//   })

//   let random = () => _random()->makeUnsafe
// }
