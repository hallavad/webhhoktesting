module Main where

import qualified Data.ByteString.Lazy as B
import           Network.HTTP
import           Network.HTTP.Listen

listener :: Listener B.ByteString IO
listener request = print request >> return Nothing

main :: IO
main = run 6660 listener
