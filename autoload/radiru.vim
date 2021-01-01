let s:save_cpo = &cpo
set cpo&vim

let s:station_name = ''

function! g:radiru#playing_station()
  if s:station_name != ''
    return 'NHK ' .. s:station_name
  else
    return ''
  endif
endfunction

function! g:radiru#play_radiru(station) abort
  if !exists('s:job')
    let s:job = s:play_station(a:station)
    let s:station_name = a:station
  elseif a:station != s:station_name
    call s:stop_station(s:job)
    unlet s:job
    let s:job = s:play_station(a:station)
    let s:station_name = a:station
  else
    echo 'すでにラジオは再生中です'
  endif
endfunction

function! g:radiru#stop_radiru() abort
  if exists('s:job')
    call job_stop(s:job)
    unlet s:job
    let s:station_name = ''
  else
    echo '再生中のラジオはありません'
  endif
endfunction

function! s:play_station(station) abort
  let l:stations = {
        \ 'R1': 'https://nhkradioakr1-i.akamaihd.net/hls/live/511633/1-r1/1-r1-01.m3u8',
        \ 'R2': 'https://nhkradioakr2-i.akamaihd.net/hls/live/511929/1-r2/1-r2-01.m3u8',
        \ 'FM': 'https://nhkradioakfm-i.akamaihd.net/hls/live/512290/1-fm/1-fm-01.m3u8',
        \}
  let l:cmd = 'ffplay -i ' .. l:stations[a:station] .. ' -nodisp -v quiet'
  return job_start(l:cmd)
endfunction

function! s:stop_station(job) abort
  call job_stop(a:job)
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo

