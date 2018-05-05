{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_webhooktests (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/thekrouk/www/webhooks/webhooktesting/.stack-work/install/x86_64-linux/lts-11.7/8.2.2/bin"
libdir     = "/home/thekrouk/www/webhooks/webhooktesting/.stack-work/install/x86_64-linux/lts-11.7/8.2.2/lib/x86_64-linux-ghc-8.2.2/webhooktests-0.1.0.0-3C4DHWlXOVS2ZUknVH2SlA-webhooktests"
dynlibdir  = "/home/thekrouk/www/webhooks/webhooktesting/.stack-work/install/x86_64-linux/lts-11.7/8.2.2/lib/x86_64-linux-ghc-8.2.2"
datadir    = "/home/thekrouk/www/webhooks/webhooktesting/.stack-work/install/x86_64-linux/lts-11.7/8.2.2/share/x86_64-linux-ghc-8.2.2/webhooktests-0.1.0.0"
libexecdir = "/home/thekrouk/www/webhooks/webhooktesting/.stack-work/install/x86_64-linux/lts-11.7/8.2.2/libexec/x86_64-linux-ghc-8.2.2/webhooktests-0.1.0.0"
sysconfdir = "/home/thekrouk/www/webhooks/webhooktesting/.stack-work/install/x86_64-linux/lts-11.7/8.2.2/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "webhooktests_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "webhooktests_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "webhooktests_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "webhooktests_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "webhooktests_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "webhooktests_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
