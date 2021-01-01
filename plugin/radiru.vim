let s:save_cpo = &cpo
set cpo&vim
if exists('g:loaded_radiru')
  finish
endif

command! -nargs=1 -complete=customlist,s:Stations RadiruPlay call g:radiru#play_radiru("<args>")
function! s:Stations(i, j, k)
  return ['R1', 'R2', 'FM']
endfunction

command! RadiruStop call g:radiru#stop_radiru()

let g:loaded_colorschemes_settings = 1
let &cpo = s:save_cpo
unlet s:save_cpo
