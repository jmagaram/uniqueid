## Installation

```sh
npm install
```

## Build

- Build & watch: `npm run res:start`

## Run the test script

```sh
node src/Test.bs.js --harmony
```

## The problem

This all seems to compile fine and there are no errors. Notice that `UniqueId.bs.js` references `UniqueId.gen` but no such file exists. If you change `UniqueId.res` to use the fake implementation, with NO `@gentype.import` statements, it all works.
