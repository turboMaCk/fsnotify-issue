{-# LANGUAGE OverloadedStrings #-}

module Main where

import System.FSNotify
import Control.Concurrent (threadDelay)
import Control.Monad (forever)


main :: IO ()
main = withManagerConf defaultConfig { confDebounce = Debounce 9999999999999 } $ \mgr -> do
  watchDir mgr "./data" (const True) print
  forever $ threadDelay 1000000
