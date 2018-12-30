module Components.Form where

import Prelude

import React.Basic (Component, JSX, StateUpdate(..), capture, capture_, createComponent, make, send)
import React.Basic.DOM as R
import React.Basic.DOM.Events (preventDefault, targetValue)
import Data.Maybe (Maybe(..), fromMaybe)
import Data.Either (hush)
import Data.Argonaut.Core as J
import Affjax as AX
import Affjax.ResponseFormat as ResponseFormat
import Effect.Aff (launchAff_)
import ApiCall (createUrl, decodeUser, GithubUser)
import Effect.Class (liftEffect)
import Components.Textbox (textbox)
import UserProfile (renderUserProfile)
import LoadedData (FetchData(..), fromDecoding)

type FormState =
  { text :: String
  , githubUser :: FetchData GithubUser
}

type FormProps =
  {
  }

data FormAction = OnChange (Maybe String) | Request | OnReceive (Maybe String)

component :: Component FormProps
component = createComponent "Form"

showGithub :: FetchData GithubUser -> JSX
showGithub NotLoaded = R.p_ [ R.text "-" ]
showGithub Loading =  R.p_ [ R.text "loading..." ]
showGithub LoadError = R.p_ [ R.text "No user found" ]
showGithub DecodeError = R.p_ [ R.text "Error decoding payload" ]
showGithub (Ready user) = renderUserProfile user

form :: FormProps -> JSX
form = make component { initialState, update, render }
  where
    initialState = { text: "", githubUser: NotLoaded }

    update self = case _ of
      Request -> UpdateAndSideEffects self.state { githubUser = Loading }
                        (\s -> launchAff_ $ do
                          res1 <- (AX.get ResponseFormat.json $ createUrl self.state.text)
                          let maybeStr = hush $ map J.stringify res1.body
                          liftEffect $ send self $ OnReceive maybeStr
                          pure unit
                        )
      OnChange str -> Update self.state { text = fromMaybe "" str }
      OnReceive (Just a) -> Update self.state { githubUser = fromDecoding $ decodeUser a }
      OnReceive Nothing -> Update self.state { githubUser = LoadError }

    render self =
        R.div { className: "form"
              , children: [ textbox { label: "Github username"
                                    , placeholder: "internetuser"
                                    , onChange: capture self (preventDefault >>> targetValue) OnChange
                                    }
                          , showGithub self.state.githubUser
                          , R.button
                              { onClick: capture_ self Request, children: [ R.text "fetch" ] }
                          ]
              }
