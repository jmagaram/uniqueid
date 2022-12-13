open Belt

module type T = {
  type t
  type error
  type domain
  let makeUnsafe: domain => t
  let make: domain => result<t, error>
  let makeOpt: domain => option<t>
  @genType
  let value: t => domain
}

module type Configuration = {
  type domain
  type error
  let validate: (. domain) => Result.t<domain, error>
}

module type MakeType = (P: Configuration) =>
(T with type domain := P.domain and type error = P.error)

module Make: MakeType = (P: Configuration) => {
  type t = P.domain
  type error = P.error
  let make = P.validate(. _)
  let makeOpt = i =>
    switch P.validate(. i) {
    | Ok(v) => Some(v)
    | Error(_) => None
    }
  external makeUnsafe: P.domain => t = "%identity"
  external value: t => P.domain = "%identity"
}
