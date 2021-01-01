let s:save_cpo = &cpo
set cpo&vim

function! g:radiru#play_radiru()
  if !exists('s:job')
    let s:job =  job_start('ffplay -i https://nhkradioakr1-i.akamaihd.net/hls/live/511633/1-r1/1-r1-01.m3u8 -nodisp -v quiet')
  else
    echo 'すでにラジオは再生中です'
  endif
endfunction

function! g:radiru#stop_radiru()
  if exists('s:job')
    call job_stop(s:job)
    unlet s:job
  else
    echo '再生中のラジオはありません'
  endif
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo

