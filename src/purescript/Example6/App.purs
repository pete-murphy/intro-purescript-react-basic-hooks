module Example6.App where

import Prelude
import Affjax (get)
import Affjax.ResponseFormat (json)
import Data.Argonaut.Core (stringify)
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
          Left _ -> "Left"
          Right success -> stringify success.body
    pure do
      R.text ("Example 6: " <> state)
