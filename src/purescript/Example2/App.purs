module Example2.App where

import Prelude
import React.Basic (JSX)
import React.Basic.DOM as R
import React.Basic.Events (handler_)
import React.Basic.Hooks (Render, UseState, useState, (/\))
import React.Basic.Hooks as React

jsApp :: forall a. Render a (UseState Boolean a) JSX
jsApp = React.do
  showPoo /\ setShowPoo <- useState false
  pure
    $ R.main
        { className: "big-emoji"
        , children:
          [ R.text (if showPoo then "💩" else "🔥") ]
        , onClick: handler_ (setShowPoo not)
        }
