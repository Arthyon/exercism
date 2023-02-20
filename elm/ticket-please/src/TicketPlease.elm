module TicketPlease exposing (..)

import TicketPleaseSupport exposing (Status(..), Ticket(..), User(..))


emptyComment : ( User, String ) -> Bool
emptyComment ( _, comment ) =
    String.isEmpty comment


numberOfCreatorComments : Ticket -> Int
numberOfCreatorComments (Ticket { createdBy, comments }) =
    let
        ( name, _ ) =
            createdBy
    in
    comments |> List.filter (\( user, _ ) -> user == name) |> List.length


assignedToDevTeam : Ticket -> Bool
assignedToDevTeam (Ticket { assignedTo }) =
    case assignedTo of
        Just (User "Alice") ->
            True

        Just (User "Bob") ->
            True

        Just (User "Charlie") ->
            True

        _ ->
            False


assignTicketTo : User -> Ticket -> Ticket
assignTicketTo user (Ticket ({ status } as ticket)) =
    case status of
        Archived ->
            Ticket ticket

        New ->
            Ticket { ticket | status = InProgress, assignedTo = Just user }

        _ ->
            Ticket { ticket | assignedTo = Just user }
