" Vim color file
" baycomb v1.7
" http://www.vim.org/scripts/script.php?script_id=1454
" 
" Maintainer:	Shawn Axsom <axs221@gmail.com>
"
"   * Place :colo baycomb in your VimRC/GVimRC file
"     * GvimRC if using GUI any
"
"   - Thanks to Desert and OceanDeep for their color scheme 
"     file layouts
"   - Thanks to Raimon Grau for his feedback

set background=dark
if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    if exists('syntax_on')
        syntax reset
    endif
endif

let g:colors_name='baycomb'

" functions {{{
" returns an approximate grey index for the given grey level
fun <SID>grey_number(x)
    if &t_Co == 88
        if a:x < 23
            return 0
        elseif a:x < 69
            return 1
        elseif a:x < 103
            return 2
        elseif a:x < 127
            return 3
        elseif a:x < 150
            return 4
        elseif a:x < 173
            return 5
        elseif a:x < 196
            return 6
        elseif a:x < 219
            return 7
        elseif a:x < 243
            return 8
        else
            return 9
        endif
    else
        if a:x < 14
            return 0
        else
            let l:n = (a:x - 8) / 10
            let l:m = (a:x - 8) % 10
            if l:m < 5
                return l:n
            else
                return l:n + 1
            endif
        endif
    endif
endfun

" returns the actual grey level represented by the grey index
fun <SID>grey_level(n)
    if &t_Co == 88
        if a:n == 0
            return 0
        elseif a:n == 1
            return 46
        elseif a:n == 2
            return 92
        elseif a:n == 3
            return 115
        elseif a:n == 4
            return 139
        elseif a:n == 5
            return 162
        elseif a:n == 6
            return 185
        elseif a:n == 7
            return 208
        elseif a:n == 8
            return 231
        else
            return 255
        endif
    else
        if a:n == 0
            return 0
        else
            return 8 + (a:n * 10)
        endif
    endif
endfun

" returns the palette index for the given grey index
fun <SID>grey_color(n)
    if &t_Co == 88
        if a:n == 0
            return 16
        elseif a:n == 9
            return 79
        else
            return 79 + a:n
        endif
    else
        if a:n == 0
            return 16
        elseif a:n == 25
            return 231
        else
            return 231 + a:n
        endif
    endif
endfun

" returns an approximate color index for the given color level
fun <SID>rgb_number(x)
    if &t_Co == 88
        if a:x < 69
            return 0
        elseif a:x < 172
            return 1
        elseif a:x < 230
            return 2
        else
            return 3
        endif
    else
        if a:x < 75
            return 0
        else
            let l:n = (a:x - 55) / 40
            let l:m = (a:x - 55) % 40
            if l:m < 20
                return l:n
            else
                return l:n + 1
            endif
        endif
    endif
endfun

" returns the actual color level for the given color index
fun <SID>rgb_level(n)
    if &t_Co == 88
        if a:n == 0
            return 0
        elseif a:n == 1
            return 139
        elseif a:n == 2
            return 205
        else
            return 255
        endif
    else
        if a:n == 0
            return 0
        else
            return 55 + (a:n * 40)
        endif
    endif
endfun

" returns the palette index for the given R/G/B color indices
fun <SID>rgb_color(x, y, z)
    if &t_Co == 88
        return 16 + (a:x * 16) + (a:y * 4) + a:z
    else
        return 16 + (a:x * 36) + (a:y * 6) + a:z
    endif
endfun

" returns the palette index to approximate the given R/G/B color levels
fun <SID>color(r, g, b)
    " get the closest grey
    let l:gx = <SID>grey_number(a:r)
    let l:gy = <SID>grey_number(a:g)
    let l:gz = <SID>grey_number(a:b)

    " get the closest color
    let l:x = <SID>rgb_number(a:r)
    let l:y = <SID>rgb_number(a:g)
    let l:z = <SID>rgb_number(a:b)

    if l:gx == l:gy && l:gy == l:gz
        " there are two possibilities
        let l:dgr = <SID>grey_level(l:gx) - a:r
        let l:dgg = <SID>grey_level(l:gy) - a:g
        let l:dgb = <SID>grey_level(l:gz) - a:b
        let l:dgrey = (l:dgr * l:dgr) + (l:dgg * l:dgg) + (l:dgb * l:dgb)
        let l:dr = <SID>rgb_level(l:gx) - a:r
        let l:dg = <SID>rgb_level(l:gy) - a:g
        let l:db = <SID>rgb_level(l:gz) - a:b
        let l:drgb = (l:dr * l:dr) + (l:dg * l:dg) + (l:db * l:db)
        if l:dgrey < l:drgb
            " use the grey
            return <SID>grey_color(l:gx)
        else
            " use the color
            return <SID>rgb_color(l:x, l:y, l:z)
        endif
    else
        " only one possibility
        return <SID>rgb_color(l:x, l:y, l:z)
    endif
endfun

" returns the palette index to approximate the 'rrggbb' hex string
fun <SID>rgb(rgb)
    let l:r = ('0x' . strpart(a:rgb, 0, 2)) + 0
    let l:g = ('0x' . strpart(a:rgb, 2, 2)) + 0
    let l:b = ('0x' . strpart(a:rgb, 4, 2)) + 0

    return <SID>color(l:r, l:g, l:b)
endfun

" sets the highlighting for the given group
fun <SID>X(group, fg, bg, attr)
    if a:fg != ''
        exec 'hi ' . a:group . ' guifg=#' . a:fg . ' ctermfg=' . <SID>rgb(a:fg)
    endif
    if a:bg != ''
        exec 'hi ' . a:group . ' guibg=#' . a:bg . ' ctermbg=' . <SID>rgb(a:bg)
    endif
    if a:attr != ''
        exec 'hi ' . a:group . ' gui=' . a:attr . ' cterm=' . a:attr
    endif
endfun
" }}}


call <SID>X('Normal', 'ABCAFA', '13111C', '')
call <SID>X('NonText', '382920', '1D1B25', '')

" set comments to grey on non-Windows OS's to make sure it is readable
" if &term == 'builtin_gui' || &term == 'win32'
"     <SID>X('Comment', 'A9A9A9', '232850', '')
" else
"     <SID>X('Comment', 'BEBEBE', '232850', '')
" endif
call <SID>X('Comment', '008B8B', '', '')


call <SID>X('Directory', 'BBD0DF', '', '')
call <SID>X('ErrorMsg', '', 'FF4545', '')
call <SID>X('Cursor', '05293D', 'CAD5C0', '')
call <SID>X('Folded', 'BBDDCC', '222038', '')
call <SID>X('FoldColumn', 'DBCAA5', '202033', '')
call <SID>X('LineNr', '8095D5', '22202D', '')
call <SID>X('StatusLine', '107AC5', '303045', 'NONE')
call <SID>X('StatusLineNC', '5B7098', '2D2D3F', 'NONE')
call <SID>X('VertSplit', '223355', '22253D', 'NONE')
call <SID>X('tablinesel', '50AAE5', '515A71', 'NONE')
call <SID>X('tabline', '5B7098', '4D4D5F', 'NONE')
call <SID>X('tablinefill', 'AAAAAA', '2D2D3F', 'NONE')
call <SID>X('Title', 'F5F5C0', '', 'NONE')
call <SID>X('Underlined', 'EAC5DA', '', 'NONE')
call <SID>X('Statement', 'FF7D70', '', 'NONE')
call <SID>X('Type', '309CE5', '', 'NONE')
call <SID>X('Constant', '5060DD', '', '')
call <SID>X('PreProc', '9A65FF', '', '')
call <SID>X('Special', '85D0C5', '', '')
call <SID>X('Todo', 'FF4500', 'EEEE00', '')
call <SID>X('Function', '90AA9A', '', 'NONE')
call <SID>X('Identifier', 'B09A80', '', '')
call <SID>X('Ignore', '666666', '', '')
call <SID>X('Error', '', 'B03452', '')
call <SID>X('Number', '0D65CA', '', '')
call <SID>X('Conditional', 'D5305A', '', 'NONE')
call <SID>X('Repeat', 'E02D5A', '', 'NONE')
call <SID>X('Operator', 'DACA65', '', 'NONE')
call <SID>X('Keyword', 'BEBEBE', '', 'BOLD')
call <SID>X('Exception', 'EA5460', '', 'NONE')
call <SID>X('Search', '3A4520', '808373', '')
call <SID>X('IncSearch', 'BABEAA', '3A4520', '')

call <SID>X('ModeMsg', '00AACC', '', '')
call <SID>X('MoreMsg', '2E8B57', '', '')
call <SID>X('Question', 'AABBCC', '', '')
call <SID>X('SpecialKey', '90DCB0', '', '')
call <SID>X('Visual', '1A1A30', '43D5FF', '')
call <SID>X('VisualNOS', '201A30', 'A3A5FF', '')
call <SID>X('WarningMsg', 'FA8072', '', '')

" new Vim 7.0 items
call <SID>X('Pmenu', '9AADD5', '3A6595', '')
call <SID>X('PmenuSel', 'B0D0F0', '4A85BA', '')

" delete functions {{{
delf <SID>X
delf <SID>rgb
delf <SID>color
delf <SID>rgb_color
delf <SID>rgb_level
delf <SID>rgb_number
delf <SID>grey_color
delf <SID>grey_level
delf <SID>grey_number
" }}}

" vim: sw=4 sts=4 et fdm=marker fdl=0:
