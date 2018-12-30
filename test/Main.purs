module Test.Main where

import Prelude
import Data.Maybe
import Effect (Effect)
import Effect.Console (log)
import Test.Unit (suite, test)
import Test.Unit.Main (runTest)
import Test.Unit.Assert as Assert
import ApiCall

main :: Effect Unit
main = runTest do
    suite "Parsing github user" do
      test "Parses it all" do
        Assert.equal (Just expected) (decodeUser testJson)


expected :: GithubUser
expected =
  { login : "d"
  , id : 440892
  , node_id : "MDQ6VXNlcjQ0MDg5Mg=="
  , avatar_url : "https://avatars2.githubusercontent.com/u/440892?v=4"
  , gravatar_id :""
  , url :"https://api.github.com/users/d"
  , html_url : "https://github.com/d"
  , followers_url: "https://api.github.com/users/d/followers"
  , following_url: "https://api.github.com/users/d/following{/other_user}"
  , gists_url : "https://api.github.com/users/d/gists{/gist_id}"
  , starred_url: "https://api.github.com/users/d/starred{/owner}{/repo}"
  , subscriptions_url: "https://api.github.com/users/d/subscriptions"
  , organizations_url: "https://api.github.com/users/d/orgs"
  , repos_url: "https://api.github.com/users/d/repos"
  , events_url: "https://api.github.com/users/d/events{/privacy}"
  , received_events_url: "https://api.github.com/users/d/received_events"
  , "type": "User"
  , site_admin: false
  , name: "Jesse Zhang"
  , company: "Pivotal"
  , blog: "cloudfoundry.org"
  , location: "San Francisco"
  , email: Nothing
  , hireable: Nothing
  , bio: Nothing
  , public_repos: 88
  , public_gists: 28
  , followers: 81
  , following: 8
  , created_at: "2010-10-15T14:54:40Z"
  , updated_at: "2018-12-11T04:53:04Z"
}

testJson :: String
testJson = "{\"login\":\"d\",\"id\":440892,\"node_id\":\"MDQ6VXNlcjQ0MDg5Mg==\",\"avatar_url\":\"https://avatars2.githubusercontent.com/u/440892?v=4\",\"gravatar_id\":\"\",\"url\":\"https://api.github.com/users/d\",\"html_url\":\"https://github.com/d\",\"followers_url\":\"https://api.github.com/users/d/followers\",\"following_url\":\"https://api.github.com/users/d/following{/other_user}\",\"gists_url\":\"https://api.github.com/users/d/gists{/gist_id}\",\"starred_url\":\"https://api.github.com/users/d/starred{/owner}{/repo}\",\"subscriptions_url\":\"https://api.github.com/users/d/subscriptions\",\"organizations_url\":\"https://api.github.com/users/d/orgs\",\"repos_url\":\"https://api.github.com/users/d/repos\",\"events_url\":\"https://api.github.com/users/d/events{/privacy}\",\"received_events_url\":\"https://api.github.com/users/d/received_events\",\"type\":\"User\",\"site_admin\":false,\"name\":\"Jesse Zhang\",\"company\":\"Pivotal\",\"blog\":\"cloudfoundry.org\",\"location\":\"San Francisco\",\"email\":null,\"hireable\":null,\"bio\":null,\"public_repos\":88,\"public_gists\":28,\"followers\":81,\"following\":8,\"created_at\":\"2010-10-15T14:54:40Z\",\"updated_at\":\"2018-12-11T04:53:04Z\"}"
