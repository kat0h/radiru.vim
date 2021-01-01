let s:save_cpo = &cpo
set cpo&vim
if exists('g:loaded_radiru')
  finish
endif

command! RadiruPlay call g:radiru#play_radiru()
command! RadiruStop call g:radiru#stop_radiru()

let g:loaded_colorschemes_settings = 1
let &cpo = s:save_cpo
unlet s:save_cpo
