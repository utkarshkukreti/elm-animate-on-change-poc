module Main exposing (..)

import Html exposing (..)
import Html.Attributes
import Random
import Time


main =
    program { subscriptions = subscriptions, init = init, view = view, update = update }


subscriptions _ =
    Time.every (Time.second * 2) (always Tick)


init =
    ( List.repeat 20 0, Cmd.none )


type alias Model =
    List Int


type Msg
    = Update (List Int)
    | Tick


update msg model =
    case msg of
        Tick ->
            ( model, Random.generate Update (Random.list 20 (Random.int -1 1)) )

        Update increments ->
            ( List.map2 (\a b -> a + b) model increments, Cmd.none )


animateOnChange text =
    Html.node "animate-on-change" [ Html.Attributes.attribute "text" text ] []


view model =
    div [] (List.map (\x -> animateOnChange (toString x)) model)
