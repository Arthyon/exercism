module TopScorers exposing (..)

import Dict exposing (Dict)
import TopScorersSupport exposing (PlayerName)


updateGoalCountForPlayer : PlayerName -> Dict PlayerName Int -> Dict PlayerName Int
updateGoalCountForPlayer playerName playerGoalCounts =
    Dict.update playerName
        (\l ->
            case l of
                Nothing ->
                    Just 1

                Just score ->
                    Just (score + 1)
        )
        playerGoalCounts


aggregateScorers : List PlayerName -> Dict PlayerName Int
aggregateScorers playerNames =
    List.foldl updateGoalCountForPlayer Dict.empty playerNames


removeInsignificantPlayers : Int -> Dict PlayerName Int -> Dict PlayerName Int
removeInsignificantPlayers goalThreshold playerGoalCounts =
    Dict.filter (\_ goals -> goals >= goalThreshold) playerGoalCounts


resetPlayerGoalCount : PlayerName -> Dict PlayerName Int -> Dict PlayerName Int
resetPlayerGoalCount playerName playerGoalCounts =
    Dict.insert playerName 0 playerGoalCounts


formatPlayer : PlayerName -> Dict PlayerName Int -> String
formatPlayer playerName playerGoalCounts =
    let
        goals =
            Dict.get playerName playerGoalCounts |> Maybe.withDefault 0
    in
    playerName ++ ": " ++ String.fromInt goals


formatPlayers : Dict PlayerName Int -> String
formatPlayers players =
    players |> Dict.toList |> List.map (\( p, _ ) -> formatPlayer p players) |> String.join ", "


combineGames : Dict PlayerName Int -> Dict PlayerName Int -> Dict PlayerName Int
combineGames game1 game2 =
    let
        onlyOne name count =
            Dict.insert name count

        both name leftCount rightCount =
            Dict.insert name (leftCount + rightCount)
    in
    Dict.merge
        onlyOne
        both
        onlyOne
        game1
        game2
        Dict.empty
