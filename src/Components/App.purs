module Components.App where

import Prelude

import Components.Form (form)
import Components.Header (header)
import React.Basic (Component, JSX, createComponent, makeStateless)
import React.Basic.DOM as R

component :: Component Unit
component = createComponent "App"

app :: JSX
app = unit # makeStateless component \_ ->
  R.div_
    [ header { title: "Hello from React Basic" }
    , form { }
    ]
