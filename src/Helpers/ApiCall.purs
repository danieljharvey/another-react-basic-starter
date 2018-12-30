module ApiCall where

import Prelude (($), (<>))
import Data.Maybe (Maybe)
import Data.Either (hush)

import Simple.JSON (readJSON)

type GithubUser = {
  login :: String,
  id :: Int,
  node_id :: String,
  avatar_url :: String,
  gravatar_id :: String,
  url :: String,
  html_url :: String,
  followers_url :: String,
  following_url :: String,
  gists_url :: String,
  starred_url :: String,
  subscriptions_url :: String,
  organizations_url :: String,
  repos_url :: String,
  events_url :: String,
  received_events_url :: String,
  type :: String,
  site_admin :: Boolean,
  name :: String,
  company :: Maybe String,
  blog :: String,
  location :: String,
  email :: Maybe String,
  hireable :: Maybe Boolean,
  bio :: Maybe String,
  public_repos :: Int,
  public_gists :: Int,
  followers :: Int,
  following :: Int,
  created_at :: String,
  updated_at :: String
}

type Username = String
type Url = String

createUrl :: Username -> Url
createUrl username = "https://api.github.com/users/" <> username

decodeUser :: String -> Maybe GithubUser
decodeUser s = hush $ readJSON s
