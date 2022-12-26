{ name = "tracker"
, dependencies =
    [ "effect"
    , "prelude"
    , "presto"
    , "arrays"
    , "debug"
    , "foldable-traversable"
    , "foreign"
    , "foreign-generic"
    , "foreign-object"
    , "maybe"
    , "strings"
    ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs" ]
}
