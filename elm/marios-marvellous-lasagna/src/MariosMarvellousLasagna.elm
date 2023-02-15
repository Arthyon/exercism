module MariosMarvellousLasagna exposing (remainingTimeInMinutes)


remainingTimeInMinutes : Int -> Int -> Int
remainingTimeInMinutes layers timeSinceStart =
    let
        expectedMinutesInOven =
            40

        preparationTimeInMinutes =
            layers * 2
    in
    expectedMinutesInOven + preparationTimeInMinutes - timeSinceStart
