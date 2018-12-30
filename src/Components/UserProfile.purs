module UserProfile where

import Prelude (($))
import Data.Maybe (fromMaybe)
import ApiCall (GithubUser)
import React.Basic (JSX)
import React.Basic.DOM (css, CSS)
import React.Basic.DOM as R

styledText :: CSS -> String -> JSX
styledText styles s = R.span { style: styles, children: [ R.text s ] }

regularText :: String -> JSX
regularText = styledText $ css { }

boldText :: String -> JSX
boldText = styledText $ css { "font-weight": 800, color: "lightgrey" }

avatar :: String -> JSX
avatar s = R.img { style: css { width: "200px", height: "200px" }, src: s }

link :: String -> JSX
link s = R.a { href: s, children: [ R.text s ] }

row :: Array JSX -> JSX
row as = R.div { style: css { padding: "10px", width: "100%" }, children: as }

renderUserProfile :: GithubUser -> JSX
renderUserProfile user =
  R.div { className: "userProfile"
        , children: [ row [ avatar user.avatar_url ]
                    , row [ boldText "Username: ", regularText user.login ]
                    , row [ boldText "Name: ", regularText user.name ]
                    , row [ boldText "Bio: ", regularText $ fromMaybe "None found" user.bio ]
                    , row [ boldText "Blog: ", link user.blog ]
                    ]
        }
