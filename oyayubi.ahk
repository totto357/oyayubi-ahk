#Include IME.ahk

/**
 Esc でIMEをOFFにする

 - IMEがONで変換候補が**でてる**ときは、なにもしない
 - IMEがONで変換候補が**でてない**ときは、もう一度Escが押されるのを400ms待機
   - 400ms以内に一度Escが**押された**ときは、EscをSendしIMEをOFF
   - 400ms以内にEscが**押されなかった**ときはなにもしない
     - これは親指シフトでEscを使っているための処置
 - IMEがOFFのときはそのままEscをSend
 */
$Esc::
  if (IME_GET(_mhwnd())) {
    if (!IME_GetConverting(_mhwnd())) {
      KeyWait, Esc
      if (A_PriorHotkey == A_ThisHotkey) && (400 > A_TimeSincePriorHotkey) {
        Send, {Esc}
        IME_SET(0,_mhwnd())
      }
    }
  } else {
    Send, {Esc}
  }
  Return

/**
 Ctrl + RShift でEnter
 */
$^RShift::Send, {Enter}

/**
 Ctrl + : でBackSpace
 */
$^vkBA::Send, {BS}

/**
 Ctrl + hjkl でカーソル移動
*/
$^h::Send, {Left}
$^j::Send, {Down}
$^k::Send, {Up}
$^l::Send, {Right}

/**
 Ctrl + Esc でIME切り替え
*/
$^Esc::Send,{vkF3}

/**
 Tab + Escでアプリケーション切り替え
 */
Esc & Tab::AltTab

/**
 Shift + Escで親指シフト切り替え
 */
$+Esc::
  USE_OYAYUBI_SHIFT := USE_OYAYUBI_SHIFT = "true" ? "false" : "true"
  Return

/**
 IMEがONかつ親指シフトフラグが"true"のときに親指シフトが有効
 */
IS_OYAYUBI_ON() {
  global
  return IME_GET(_mhwnd()) && USE_OYAYUBI_SHIFT == "true"
}

/**
 親指シフトのマッピング
 */
#IF IS_OYAYUBI_ON()
$q::Send, .
$w::Send, ka
$e::Send, ta
$r::Send, ko
$t::Send, sa
$y::Send, ra
$u::Send, ti
$i::Send, ku
$o::Send, tu
$p::Send, ,
$a::Send, u
$s::Send, si
$d::Send, te
$f::Send, ke
$g::Send, se
$h::Send, ha
$j::Send, to
$k::Send, ki
$l::Send, i
$;::Send, nn
$z::Send, ？
$x::Send, hi
$c::Send, su
$v::Send, hu
$b::Send, he
$n::Send, me
$m::Send, so
$vkBC::Send, ne
$.::Send, ho
$/::Send, /
Esc & q::Send, xa
Esc & w::Send, e
RShift & w::Send, ga
Esc & e::Send, ri
RShift & e::Send, da
Esc & r::Send, xya
RShift & r::Send, go
Esc & t::Send, re
RShift & t::Send, za
Esc & y::Send, pa
RShift & y::Send, yo
RShift & u::Send, ni
Esc & u::Send, di
RShift & i::Send, ru
Esc & i::Send, gu
RShift & o::Send, ma
Esc & o::Send, du
RShift & p::Send, xe
Esc & p::Send, pi
Esc & a::Send, wo
RShift & a::Send, u
Esc & s::Send, a
RShift & s::Send, ji
Esc & d::Send, na
RShift & d::Send, de
Esc & f::Send, xyu
RShift & f::Send, ge
Esc & g::Send, mo
RShift & g::Send, ze
Esc & h::Send, ba
RShift & h::Send, mi
Esc & j::Send, do
RShift & j::Send, o
Esc & k::Send, gi
RShift & k::Send, no
Esc & l::Send, po
RShift & l::Send, xyo
RShift & vkBB::Send, xtu
Esc & z::Send, xu
RShift & z::Send, ！
Esc & x::Send, -
RShift & x::Send, bi
Esc & c::Send, ro
RShift & c::Send, zu
Esc & v::Send, ya
RShift & v::Send, bu
Esc & b::Send, xi
RShift & b::Send, be
Esc & n::Send, pu
RShift & n::Send, nu
Esc & m::Send, zo
RShift & m::Send, yu
Esc & vkBC::Send, pe
RShift & vkBC::Send, mu
RShift & .::Send, wa
Esc & .::Send, bo
RShift & /::Send, xo
#IF
