// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Curry from "../node_modules/rescript/lib/es6/curry.js";
import * as Validated from "./Validated.bs.js";
import * as UniqueIdGen from "./UniqueId.gen";

function Make($star) {
  var validate = function (s) {
    if (UniqueIdGen.validate(s)) {
      return {
              TAG: /* Ok */0,
              _0: s
            };
    } else {
      return {
              TAG: /* Error */1,
              _0: /* InvalidFormat */0
            };
    }
  };
  var include = Validated.Make({
        validate: validate
      });
  var makeUnsafe = include.makeUnsafe;
  var random = function (param) {
    return Curry._1(makeUnsafe, UniqueIdGen.create());
  };
  return {
          makeUnsafe: makeUnsafe,
          make: include.make,
          makeOpt: include.makeOpt,
          value: include.value,
          random: random
        };
}

export {
  Make ,
}
/* ./UniqueId.gen Not a pure module */
