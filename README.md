# Bug report repository

See https://gitlab.haskell.org/ghc/ghc/issues/15376

## Requirements

```bash
$ ghcup --version
0.0.7
$ cabal --version
cabal-install version 2.4.1.0
compiled using version 2.4.1.0 of the Cabal library
$ cabal new-update 'hackage.haskell.org,2019-03-09T11:18:34Z'
```

## What happend

```bash
$ ghcup set 8.6.3 && rm dist* && cabal new-build; ghcup set 8.6.4 && cabal new-build
...
Build profile: -w ghc-8.6.3 -O1
...
[1 of 1] Compiling TestSpace.PolyKinds ( src/TestSpace/PolyKinds.hs, ~/cannot-determine-with-derivingvia/dist-newstyle/build/x86_64-osx/ghc-8.6.3/maybreak-derivingvia-0.1.0.0/build/TestSpace/PolyKinds.o )

src/TestSpace/PolyKinds.hs:11:47: error:
    • Expected kind ‘* -> *’, but ‘m’ has kind ‘k -> *’
    • In the first argument of ‘Functor’, namely ‘m’
      In the stand-alone deriving instance for
        ‘Functor m => Functor (T m)’
   |
11 | deriving via (ReaderT Int m) instance Functor m => Functor (T m)
   |                                               ^
...
Build profile: -w ghc-8.6.4 -O1
...
[1 of 1] Compiling TestSpace.PolyKinds ( src/TestSpace/PolyKinds.hs, ~/cannot-determine-with-derivingvia/dist-newstyle/build/x86_64-osx/ghc-8.6.4/maybreak-derivingvia-0.1.0.0/build/TestSpace/PolyKinds.o )
```

## Other cases

```bash
$ cabal new-freeze
$ ghcup set 8.6.3 && rm dist* && cabal new-build; ghcup set 8.6.4 && cabal new-build
no error!
```
