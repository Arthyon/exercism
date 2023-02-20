module TisburyTreasureHunt exposing (..)


type alias TreasureLocation =
    ( Int, Char )


type alias PlaceLocation =
    ( Char, Int )


type alias TreasureName =
    String


type alias PlaceName =
    String


placeLocationToTreasureLocation : PlaceLocation -> TreasureLocation
placeLocationToTreasureLocation ( c, i ) =
    ( i, c )


treasureLocationMatchesPlaceLocation : PlaceLocation -> TreasureLocation -> Bool
treasureLocationMatchesPlaceLocation ( c1, i1 ) ( i2, c2 ) =
    c1 == c2 && i1 == i2


countPlaceTreasures : ( PlaceName, PlaceLocation ) -> List ( TreasureName, TreasureLocation ) -> Int
countPlaceTreasures ( _, location ) treasures =
    treasures |> List.filter (\( _, coordinates ) -> treasureLocationMatchesPlaceLocation location coordinates) |> List.length


specialCaseSwapPossible : ( TreasureName, TreasureLocation ) -> ( PlaceName, PlaceLocation ) -> ( TreasureName, TreasureLocation ) -> Bool
specialCaseSwapPossible ( foundTreasure, _ ) ( place, _ ) ( desiredTreasure, _ ) =
    case ( foundTreasure, place, desiredTreasure ) of
        ( "Brass Spyglass", "Abandoned Lighthouse", _ ) ->
            True

        ( "Amethyst Octopus", "Stormy Breakwater", "Crystal Crab" ) ->
            True

        ( "Amethyst Octopus", "Stormy Breakwater", "Glass Starfish" ) ->
            True

        ( "Vintage Pirate Hat", "Harbor Managers Office", "Model Ship in Large Bottle" ) ->
            True

        ( "Vintage Pirate Hat", "Harbor Managers Office", "Antique Glass Fishnet Float" ) ->
            True

        _ ->
            False
