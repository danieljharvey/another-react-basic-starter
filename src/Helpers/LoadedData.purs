module LoadedData where

import Data.Maybe
import Data.Eq (class Eq)

{-
here is a nice example of the Purescript type system allowing us to describe
the state of some data we are loading from a server in a much nicer and more
descriptive manner than just Maybe a or a loading flag
-}

data FetchData a = NotLoaded | Loading | Ready a | LoadError | DecodeError

derive instance eqFetchData :: Eq a => Eq (FetchData a)

fromDecoding :: forall a. Maybe a -> FetchData a
fromDecoding (Just a) = Ready a
fromDecoding _        = DecodeError
