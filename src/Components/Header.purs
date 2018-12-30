module Components.Header where

import Prelude

import React.Basic (Component, JSX, StateUpdate(..), createComponent, make)
import React.Basic.DOM as R

type HeaderProps =
  { title :: String
  }

component :: Component HeaderProps
component = createComponent "Header"

header :: HeaderProps -> JSX
header = make component { initialState, update, render }
  where
    initialState = unit

    update self = case _ of
      _ -> Update self.state

    render self = 
        R.div { className: "header"
              , children: [ R.div { className: "purs-logo" }
                          , R.h1_ [ R. text self.props.title ] 
                          ]
              }
