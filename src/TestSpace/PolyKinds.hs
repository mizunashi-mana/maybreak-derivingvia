{-# LANGUAGE PolyKinds #-}
{-# LANGUAGE DerivingVia #-}
{-# LANGUAGE StandaloneDeriving #-}

module TestSpace.PolyKinds where

import Control.Monad.Trans.Reader

newtype T m a = T (Int -> m a)

deriving via (ReaderT Int m) instance Functor m => Functor (T m)
