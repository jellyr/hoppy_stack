{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_hoppy_generator (
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
version = Version [0,4,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "C:\\Users\\secci\\AppData\\Roaming\\cabal\\bin"
libdir     = "C:\\Users\\secci\\AppData\\Roaming\\cabal\\x86_64-windows-ghc-8.2.2\\hoppy-generator-0.4.0-7l1qD6JUplbAiDcwLxhmnN"
dynlibdir  = "C:\\Users\\secci\\AppData\\Roaming\\cabal\\x86_64-windows-ghc-8.2.2"
datadir    = "C:\\Users\\secci\\AppData\\Roaming\\cabal\\x86_64-windows-ghc-8.2.2\\hoppy-generator-0.4.0"
libexecdir = "C:\\Users\\secci\\AppData\\Roaming\\cabal\\hoppy-generator-0.4.0-7l1qD6JUplbAiDcwLxhmnN\\x86_64-windows-ghc-8.2.2\\hoppy-generator-0.4.0"
sysconfdir = "C:\\Users\\secci\\AppData\\Roaming\\cabal\\etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "hoppy_generator_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "hoppy_generator_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "hoppy_generator_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "hoppy_generator_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "hoppy_generator_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "hoppy_generator_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
