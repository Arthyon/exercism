module Test.Generated.Main exposing (main)

import Tests

import Test.Reporter.Reporter exposing (Report(..))
import Console.Text exposing (UseColor(..))
import Test.Runner.Node
import Test

main : Test.Runner.Node.TestProgram
main =
    Test.Runner.Node.run
        { runs = 100
        , report = ConsoleReport UseColor
        , seed = 298414113530313
        , processes = 12
        , globs =
            []
        , paths =
            [ "/home/christian/data/source/personal/exercism/elm/go/tests/Tests.elm"
            ]
        }
        [ ( "Tests"
          , [ Test.Runner.Node.check Tests.vanillaGame
            , Test.Runner.Node.check Tests.koRule
            , Test.Runner.Node.check Tests.libertyRule
            , Test.Runner.Node.check Tests.oneStonePerPointRule
            , Test.Runner.Node.check Tests.tests
            ]
          )
        ]