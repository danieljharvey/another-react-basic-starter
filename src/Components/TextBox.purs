module Components.Textbox where


import React.Basic (Component, JSX, StateUpdate(..), capture_, createComponent, make)
import React.Basic.DOM as R
import React.Basic.Events (EventHandler)

type TextboxProps =
  { label :: String
  , placeholder :: String
  , onChange :: EventHandler
  }

type TextboxState =
  { hasBlurred :: Boolean
  , hasChanged :: Boolean
  , hasFocused :: Boolean
  }

data Action =
  OnBlur | OnFocus

component :: Component TextboxProps
component = createComponent "Textbox"

calcStyleClass :: TextboxState -> String
calcStyleClass state = "great"

textbox :: TextboxProps -> JSX
textbox = make component { initialState, update, render }
  where
    initialState = { hasBlurred: false, hasChanged: false, hasFocused: false }

    update self = case _ of
      OnBlur -> Update self.state { hasBlurred = true }
      OnFocus -> Update self.state { hasFocused = true }

    render self = R.div { className: calcStyleClass self.state
                        , children: [ R.label_ [ R.text self.props.label ]
                                    , R.input { type: "text"
                                              , onChange: self.props.onChange
                                              , onBlur: capture_ self OnBlur
                                              , onFocus: capture_ self OnFocus
                                              , placeholder: self.props.placeholder
                                              }
                                    ]
                        }
