module Example3.App where

import Prelude
import React.Basic (JSX)
import React.Basic.DOM as R
import React.Basic.Events (handler_)
import React.Basic.Hooks (Render, UseState, useState, (/\))
import React.Basic.Hooks as React

jsApp ::
  forall a.
  Render a
    (UseState Int (UseState Boolean a))
    JSX
jsApp = React.do
  showPoo /\ setShowPoo <- useState false
  count /\ setCount <- useState 0
  pure
    $ R.main
        { className: "big-emoji overlap-spans"
        , children:
          [ R.span_
              [ R.text $ if showPoo then "💩" else "🔥"
              ]
          , R.span_ [ R.text $ show count ]
          ]
        , onClick: handler_ (setShowPoo not *> setCount (_ + 1))
        }
