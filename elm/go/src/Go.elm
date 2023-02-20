module Go exposing (..)

import GoSupport exposing (..)


applyRules : Game -> Rule -> NonValidatingRule -> Rule -> Rule -> Game
applyRules game oneStonePerPointRule captureRule libertyRule koRule =
    let
        validation =
            oneStonePerPointRule game |> Result.andThen libertyRule |> Result.andThen koRule
    in
    case validation of
        Err s ->
            { game | error = s }

        Ok g ->
            g |> captureRule |> changePlayer
