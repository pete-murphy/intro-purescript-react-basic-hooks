module Example1.App where

import Prelude
import Effect (Effect)
import React.Basic (JSX)
import React.Basic.DOM as R

jsApp :: Effect JSX
jsApp =
  pure
    ( R.main_
        [ R.text "👍" ]
    )
