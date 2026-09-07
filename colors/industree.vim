" -----------------------------------------------------------------------------
" Name:         industree
" Description:  A dark color scheme for Vim and Neovim, with teal and green
"               accents
" Author:       swield
" Website:      https://github.com/swield/industree
" License:      MIT
" -----------------------------------------------------------------------------

" -----------------------------------------------------------------------------
" Setup
set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "industree"

" -----------------------------------------------------------------------------
" Base Colors
hi Normal           cterm=NONE    gui=NONE    ctermfg=153 ctermbg=234  guifg=#c8e7f7 guibg=#0e1b21

" -----------------------------------------------------------------------------
" General Syntax Highlighting
hi Comment          cterm=italic  gui=italic  ctermfg=66  ctermbg=NONE guifg=#678493 guibg=NONE
hi Constant         cterm=NONE    gui=NONE    ctermfg=44  ctermbg=NONE guifg=#0ddfe0 guibg=NONE
hi Identifier       cterm=NONE    gui=NONE    ctermfg=153 ctermbg=NONE guifg=#c8e7f7 guibg=NONE
hi Function         cterm=NONE    gui=NONE    ctermfg=50  ctermbg=NONE guifg=#00ffd7 guibg=NONE
hi Statement        cterm=NONE    gui=NONE    ctermfg=159 ctermbg=NONE guifg=#a7edec guibg=NONE
hi PreProc          cterm=NONE    gui=NONE    ctermfg=30  ctermbg=NONE guifg=#238b8a guibg=NONE
hi Type             cterm=NONE    gui=NONE    ctermfg=49  ctermbg=NONE guifg=#00ffaf guibg=NONE
hi Special          cterm=NONE    gui=NONE    ctermfg=73  ctermbg=NONE guifg=#74b9b8 guibg=NONE
hi Delimiter        cterm=NONE    gui=NONE    ctermfg=110 ctermbg=NONE guifg=#85a3b2 guibg=NONE

" -----------------------------------------------------------------------------
" Literals, Operators And Diff Words
hi String           cterm=NONE    gui=NONE    ctermfg=194 ctermbg=NONE guifg=#caf3dd guibg=NONE
hi Character        cterm=NONE    gui=NONE    ctermfg=224 ctermbg=NONE guifg=#edc7c0 guibg=NONE
hi Number           cterm=NONE    gui=NONE    ctermfg=44  ctermbg=NONE guifg=#0ddfe0 guibg=NONE
hi Boolean          cterm=NONE    gui=NONE    ctermfg=44  ctermbg=NONE guifg=#0ddfe0 guibg=NONE
hi Float            cterm=NONE    gui=NONE    ctermfg=44  ctermbg=NONE guifg=#0ddfe0 guibg=NONE
hi Operator         cterm=NONE    gui=NONE    ctermfg=109 ctermbg=NONE guifg=#a2bebd guibg=NONE

hi Added            cterm=NONE    gui=NONE    ctermfg=49  ctermbg=NONE guifg=#00ffaf guibg=NONE
hi Changed          cterm=NONE    gui=NONE    ctermfg=75  ctermbg=NONE guifg=#49a9ff guibg=NONE
hi Removed          cterm=NONE    gui=NONE    ctermfg=203 ctermbg=NONE guifg=#ff223a guibg=NONE

" -----------------------------------------------------------------------------
" Language Specific (C/C++)
hi cCustomMemVar    cterm=NONE    gui=NONE    ctermfg=117 ctermbg=NONE guifg=#bde9ff guibg=NONE
hi cCustomDot       cterm=NONE    gui=NONE    ctermfg=109 ctermbg=NONE guifg=#a2bebd guibg=NONE
hi cCustomPtr       cterm=NONE    gui=NONE    ctermfg=109 ctermbg=NONE guifg=#a2bebd guibg=NONE

" -----------------------------------------------------------------------------
" Informational And Feedback
hi Todo             cterm=bold    gui=bold    ctermfg=234  ctermbg=75   guifg=#0e1b21 guibg=#49a9ff
hi Error            cterm=NONE    gui=NONE    ctermfg=231 ctermbg=88   guifg=#ffffff guibg=#5a161c

" -----------------------------------------------------------------------------
" User Interface Highlighting
hi LineNr           cterm=NONE    gui=NONE    ctermfg=241  ctermbg=NONE guifg=#4b6775 guibg=NONE
hi SignColumn       cterm=NONE    gui=NONE    ctermfg=241 ctermbg=NONE guifg=#4b6775 guibg=NONE
hi Folded           cterm=NONE    gui=NONE    ctermfg=67  ctermbg=235   guifg=#7a98a7 guibg=#18252c
hi Search           cterm=bold    gui=bold    ctermfg=234  ctermbg=194  guifg=#0e1b21 guibg=#caf3dd
hi Visual           cterm=NONE    gui=NONE    ctermfg=NONE ctermbg=24   guifg=NONE    guibg=#004968

" -----------------------------------------------------------------------------
" Window Borders And Status Lines
hi VertSplit        cterm=NONE    gui=NONE    ctermfg=237  ctermbg=NONE guifg=#2f3e46 guibg=NONE
hi StatusLine       cterm=bold    gui=bold    ctermfg=50  ctermbg=236   guifg=#00ffd7 guibg=#18252c
hi StatusLineNC     cterm=NONE    gui=NONE    ctermfg=67  ctermbg=235   guifg=#7a98a7 guibg=#132026

hi StatusLineTerm   cterm=bold    gui=bold    ctermfg=50  ctermbg=236   guifg=#00ffd7 guibg=#18252c
hi StatusLineTermNC cterm=NONE    gui=NONE    ctermfg=67  ctermbg=235   guifg=#7a98a7 guibg=#132026

" -----------------------------------------------------------------------------
" Popup Menu And Cursor Feedback
hi Pmenu            cterm=NONE    gui=NONE    ctermfg=153 ctermbg=235   guifg=#c8e7f7 guibg=#18252c
hi PmenuSel         cterm=bold    gui=bold    ctermfg=234  ctermbg=50   guifg=#0e1b21 guibg=#00ffd7
hi PmenuSbar        cterm=NONE    gui=NONE    ctermfg=NONE ctermbg=235  guifg=NONE    guibg=#18252c
hi PmenuThumb       cterm=NONE    gui=NONE    ctermfg=NONE ctermbg=240 guifg=NONE    guibg=#3e5967
hi WildMenu         cterm=bold    gui=bold    ctermfg=234  ctermbg=50   guifg=#0e1b21 guibg=#00ffd7
hi MatchParen       cterm=NONE    gui=NONE    ctermfg=NONE ctermbg=237  guifg=NONE    guibg=#233c49
hi CursorLine       cterm=NONE    gui=NONE    ctermfg=NONE ctermbg=236  guifg=NONE    guibg=#1b292f
hi CursorLineNr     cterm=bold    gui=bold    ctermfg=50  ctermbg=NONE guifg=#00ffd7 guibg=NONE
hi ColorColumn      cterm=NONE    gui=NONE    ctermfg=NONE ctermbg=236  guifg=NONE    guibg=#1b292f

" -----------------------------------------------------------------------------
" Editor UI, Messages, Tabs And Spelling
hi Cursor           cterm=NONE    gui=NONE    ctermfg=234  ctermbg=50   guifg=#0e1b21 guibg=#00ffd7
hi CursorColumn     cterm=NONE    gui=NONE    ctermfg=NONE ctermbg=236  guifg=NONE    guibg=#1b292f
hi Conceal          cterm=NONE    gui=NONE    ctermfg=110 ctermbg=NONE guifg=#85a3b2 guibg=NONE
hi Directory        cterm=NONE    gui=NONE    ctermfg=49  ctermbg=NONE guifg=#00ffaf guibg=NONE
hi EndOfBuffer      cterm=NONE    gui=NONE    ctermfg=234  ctermbg=NONE guifg=#0e1b21 guibg=NONE
hi FoldColumn       cterm=NONE    gui=NONE    ctermfg=241  ctermbg=NONE guifg=#4b6775 guibg=NONE
hi Title            cterm=bold    gui=bold    ctermfg=50  ctermbg=NONE guifg=#00ffd7 guibg=NONE
hi NonText          cterm=NONE    gui=NONE    ctermfg=24  ctermbg=NONE guifg=#3e5967 guibg=NONE
hi SpecialKey       cterm=NONE    gui=NONE    ctermfg=24  ctermbg=NONE guifg=#3e5967 guibg=NONE
hi Whitespace       cterm=NONE    gui=NONE    ctermfg=24  ctermbg=NONE guifg=#3e5967 guibg=NONE
hi Underlined       cterm=underline gui=underline ctermfg=50 ctermbg=NONE guifg=#00ffd7 guibg=NONE

hi IncSearch        cterm=bold    gui=bold    ctermfg=234  ctermbg=195  guifg=#0e1b21 guibg=#dcede3
hi CurSearch        cterm=bold    gui=bold    ctermfg=234  ctermbg=195  guifg=#0e1b21 guibg=#dcede3
hi QuickFixLine     cterm=bold    gui=bold    ctermfg=NONE ctermbg=24   guifg=NONE    guibg=#004968

hi ErrorMsg         cterm=NONE    gui=NONE    ctermfg=203 ctermbg=NONE guifg=#ff223a guibg=NONE
hi WarningMsg       cterm=NONE    gui=NONE    ctermfg=220 ctermbg=NONE guifg=#ffca00 guibg=NONE
hi MoreMsg          cterm=NONE    gui=NONE    ctermfg=50  ctermbg=NONE guifg=#00ffd7 guibg=NONE
hi Question         cterm=NONE    gui=NONE    ctermfg=50  ctermbg=NONE guifg=#00ffd7 guibg=NONE
hi ModeMsg          cterm=bold    gui=bold    ctermfg=153 ctermbg=NONE guifg=#c8e7f7 guibg=NONE

hi TabLine          cterm=NONE    gui=NONE    ctermfg=67  ctermbg=235  guifg=#7a98a7 guibg=#132026
hi TabLineSel       cterm=bold    gui=bold    ctermfg=50  ctermbg=236  guifg=#00ffd7 guibg=#18252c
hi TabLineFill      cterm=NONE    gui=NONE    ctermfg=NONE ctermbg=235  guifg=NONE    guibg=#132026

hi SpellBad         cterm=underline gui=undercurl ctermfg=203 ctermbg=NONE guisp=#ff223a
hi SpellCap         cterm=underline gui=undercurl ctermfg=220 ctermbg=NONE guisp=#ffca00
hi SpellRare        cterm=underline gui=undercurl ctermfg=75  ctermbg=NONE guisp=#49a9ff
hi SpellLocal       cterm=underline gui=undercurl ctermfg=66  ctermbg=NONE guisp=#678493

" -----------------------------------------------------------------------------
" Diff Mode (vimdiff, :Gvdiffsplit)
hi DiffAdd          cterm=NONE    gui=NONE    ctermfg=NONE ctermbg=22  guifg=NONE    guibg=#0f2f1a
hi DiffChange       cterm=NONE    gui=NONE    ctermfg=NONE ctermbg=23  guifg=NONE    guibg=#002b37
hi DiffDelete       cterm=NONE    gui=NONE    ctermfg=24  ctermbg=52   guifg=#3e5967 guibg=#2f1216
hi DiffText         cterm=bold    gui=bold    ctermfg=NONE ctermbg=30  guifg=NONE    guibg=#12474a

" -----------------------------------------------------------------------------
" GitGutter Signs
hi GitGutterAdd          cterm=NONE gui=NONE ctermfg=49  ctermbg=NONE guifg=#00ffaf guibg=NONE
hi GitGutterChange       cterm=NONE gui=NONE ctermfg=75  ctermbg=NONE guifg=#49a9ff guibg=NONE
hi GitGutterDelete       cterm=NONE gui=NONE ctermfg=203 ctermbg=NONE guifg=#ff223a guibg=NONE
hi GitGutterChangeDelete cterm=bold gui=bold ctermfg=254 ctermbg=NONE guifg=#dcede3 guibg=NONE
hi GitGutterAddLineNr          cterm=bold gui=bold ctermfg=49  ctermbg=NONE guifg=#00ffaf guibg=NONE
hi GitGutterChangeLineNr       cterm=bold gui=bold ctermfg=75  ctermbg=NONE guifg=#49a9ff guibg=NONE
hi GitGutterDeleteLineNr       cterm=bold gui=bold ctermfg=203 ctermbg=NONE guifg=#ff223a guibg=NONE
hi GitGutterChangeDeleteLineNr cterm=bold gui=bold ctermfg=254 ctermbg=NONE guifg=#dcede3 guibg=NONE

" -----------------------------------------------------------------------------
" Diff And Patch Files
hi diffAdded        cterm=NONE    gui=NONE    ctermfg=49  ctermbg=NONE guifg=#00ffaf guibg=NONE
hi diffChanged      cterm=NONE    gui=NONE    ctermfg=75  ctermbg=NONE guifg=#49a9ff guibg=NONE
hi diffRemoved      cterm=NONE    gui=NONE    ctermfg=203 ctermbg=NONE guifg=#ff223a guibg=NONE

hi diffFile         cterm=NONE    gui=NONE    ctermfg=75  ctermbg=NONE guifg=#49a9ff guibg=NONE
hi diffOldFile      cterm=NONE    gui=NONE    ctermfg=203 ctermbg=NONE guifg=#ff223a guibg=NONE
hi diffNewFile      cterm=NONE    gui=NONE    ctermfg=49  ctermbg=NONE guifg=#00ffaf guibg=NONE

hi diffLine         cterm=NONE    gui=NONE    ctermfg=50  ctermbg=NONE guifg=#00ffd7 guibg=NONE
hi diffSubname      cterm=NONE    gui=NONE    ctermfg=67  ctermbg=NONE guifg=#7a98a7 guibg=NONE
hi diffIndexLine    cterm=NONE    gui=NONE    ctermfg=67  ctermbg=NONE guifg=#7a98a7 guibg=NONE

" -----------------------------------------------------------------------------
" Markup Highlights
hi htmlH1           cterm=bold    gui=bold    ctermfg=195 ctermbg=NONE guifg=#d9fdff guibg=NONE
hi htmlH2           cterm=bold    gui=bold    ctermfg=50  ctermbg=NONE guifg=#00ffd7 guibg=NONE
hi htmlH3           cterm=bold    gui=bold    ctermfg=49  ctermbg=NONE guifg=#00ffaf guibg=NONE
hi htmlH4           cterm=bold    gui=bold    ctermfg=159 ctermbg=NONE guifg=#a7edec guibg=NONE
hi htmlH5           cterm=bold    gui=bold    ctermfg=73  ctermbg=NONE guifg=#74b9b8 guibg=NONE
hi htmlH6           cterm=bold    gui=bold    ctermfg=30  ctermbg=NONE guifg=#238b8a guibg=NONE

hi htmlBold         cterm=bold    gui=bold    ctermfg=NONE ctermbg=NONE guifg=NONE    guibg=NONE
hi htmlItalic       cterm=italic  gui=italic  ctermfg=NONE ctermbg=NONE guifg=NONE    guibg=NONE
hi htmlBoldItalic   cterm=bold,italic gui=bold,italic ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE
hi htmlTagName      cterm=NONE    gui=NONE    ctermfg=73  ctermbg=NONE guifg=#74b9b8 guibg=NONE
hi htmlLink         cterm=underline gui=underline ctermfg=49 ctermbg=NONE guifg=#00ffaf guibg=NONE

hi markdownCode     cterm=NONE    gui=NONE    ctermfg=50  ctermbg=NONE guifg=#00ffd7 guibg=NONE
hi markdownCodeBlock cterm=NONE   gui=NONE    ctermfg=50  ctermbg=NONE guifg=#00ffd7 guibg=NONE

hi link htmlTag    Delimiter
hi link htmlEndTag Delimiter

hi link markdownError Normal
hi link htmlError Normal

" -----------------------------------------------------------------------------
" Italic Comments
if exists('g:industree_italic_comment') && !g:industree_italic_comment
    hi Comment            cterm=NONE gui=NONE
endif

" -----------------------------------------------------------------------------
" Terminal Colors
let g:terminal_ansi_colors = [
      \ '#1b292f', '#9e001b', '#07b57b', '#b38d03',
      \ '#006bb4', '#9e3699', '#07b699', '#89a7b6',
      \ '#4b6775', '#ff223a', '#00ffaf', '#ffca00',
      \ '#49a9ff', '#da6fd3', '#00ffd7', '#c8e7f7']

" -----------------------------------------------------------------------------
" Neovim Extension
if has('nvim')
  lua require('industree').apply()
endif
