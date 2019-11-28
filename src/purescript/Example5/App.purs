module Example5.App where

import Prelude
import Affjax (get)
import Affjax.ResponseFormat (json)
import Data.Argonaut.Core (stringify)
import Data.Either (Either(..))
import Effect.Class (liftEffect)
import React.Basic (JSX)
import React.Basic.DOM as R
import React.Basic.Hooks (Render, UseState, useState, (/\))
import React.Basic.Hooks as React
import React.Basic.Hooks.Aff (UseAff, useAff)

jsApp :: forall a. Render a (UseAff Unit Unit (UseState String a)) JSX
jsApp = React.do
  state /\ setState <- useState ""
  useAff unit do
    response <- get json "https://swapi.co/api/people/1/"
    liftEffect do
      setState \_ -> case response of
        Left _ -> "Left"
        Right success -> stringify success.body
  pure do
    R.text ("Example 5: " <> state)
