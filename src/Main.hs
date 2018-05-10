module Main where

import qualified Data.ByteString.Lazy as B
import           Network.HTTP
import           Network.HTTP.Listen

listener :: Listener B.ByteString IO
listener request@Request{rqBody=a} = print request >> print a >> return Nothing

main :: IO ()
main = print "Funkar nu" >> run 6660 listener
