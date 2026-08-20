" jpscore简谱语法数高亮匹配

sy clear

if exists("b:current_syntax")
  finish
endif
let b:current_syntax = "jpscore"

sy match jpsSignature "\<.=.*\>"
hi default link jpsSignature Tag

sy match jspSlash "/"
hi default link jspSlash Added

sy match jpsSection "|"
hi default link jpsSection Number
