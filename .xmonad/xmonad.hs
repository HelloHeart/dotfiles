import XMonad
import XMonad.Config.Xfce
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks

main :: IO ()

main = xmonad $ docks $ ewmh $ xfceConfig
  { handleEventHook = handleEventHook def <+> fullscreenEventHook
  , terminal    = "xfce4-terminal"
  , modMask     = mod4Mask
  -- https://hackage.haskell.org/package/xmonad-contrib-0.16/docs/XMonad-Hooks-ManageDocks.html
  }
-- main = xmonad xfceConfig
--     { terminal    = "xfce4-terminal"
--     , modMask     = mod4Mask
--     }
