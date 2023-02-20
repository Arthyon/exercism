module TreasureChest exposing (..)


type TreasureChest treasuretype
    = TreasureChest String treasuretype


getTreasure : String -> TreasureChest treasuretype -> Maybe treasuretype
getTreasure passwordAttempt (TreasureChest password treasure) =
    if passwordAttempt == password then
        Just treasure

    else
        Nothing


multiplyTreasure : (a -> List a) -> TreasureChest a -> TreasureChest (List a)
multiplyTreasure multiplier (TreasureChest password treasure) =
    let
        newTreasure =
            multiplier treasure
    in
    TreasureChest password newTreasure
