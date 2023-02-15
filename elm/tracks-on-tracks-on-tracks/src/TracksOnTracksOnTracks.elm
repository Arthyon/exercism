module TracksOnTracksOnTracks exposing (..)


newList : List String
newList =
    []


existingList : List String
existingList =
    [ "Elm", "Clojure", "Haskell" ]


addLanguage : String -> List String -> List String
addLanguage language languages =
    language :: languages


countLanguages : List String -> Int
countLanguages languages =
    languages |> List.length


reverseList : List String -> List String
reverseList languages =
    languages |> List.reverse


excitingList : List String -> Bool
excitingList languages =
    case languages of
        [ _, "Elm", _ ] ->
            True

        [ _, "Elm" ] ->
            True

        "Elm" :: _ ->
            True

        _ ->
            False
