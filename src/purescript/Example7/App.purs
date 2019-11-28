module Example7.App where

import Prelude
import Affjax (get)
import Affjax.ResponseFormat (json)
import Data.Argonaut.Core (Json)
import Data.Argonaut.Decode (decodeJson)
import Data.Either (Either(..))
import Effect (Effect)
import Effect.Class (liftEffect)
import React.Basic (ReactComponent)
import React.Basic.DOM as R
import React.Basic.Hooks (component, useState, (/\))
import React.Basic.Hooks as React
import React.Basic.Hooks.Aff (useAff)

mkJsApp :: Effect (ReactComponent {})
mkJsApp = do
  component "App" \_ -> React.do
    state /\ setState <- useState ""
    useAff unit do
      response <- get json "https://swapi.co/api/people/1/"
      liftEffect do
        setState \_ -> case response of
          Left _ -> "Failed to fetch"
          Right success -> case (decodeJson :: Json -> Either String Character) success.body of
            Left str -> str
            Right { name } -> name
    pure do
      R.text ("Example 7: " <> state)

type Character
  = { name :: String }
