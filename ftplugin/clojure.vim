if exists('g:loaded_vim_iced')
  finish
endif
let g:loaded_vim_iced = 1

let s:save_cpo = &cpo
set cpo&vim

scriptencoding utf-8

"" Commands {{{
command! -nargs=? IcedConnect           call iced#nrepl#connect(<q-args>)
command!          IcedDisconnect        call iced#nrepl#disconnect()
command!          IcedReconnect         call iced#nrepl#reconnect()
command!          IcedInterrupt         call iced#nrepl#interrupt()

command! -nargs=? -complete=custom,iced#nrepl#cljs#env_complete
    \ IcedStartCljsRepl    call iced#nrepl#cljs#repl(<q-args>)
command!          IcedQuitCljsRepl      call iced#nrepl#cljs#quit()

command! -nargs=1 IcedEval              call iced#nrepl#eval#code(<q-args>)
command! -nargs=1 IcedEvalRepl          call iced#nrepl#eval#repl(<q-args>)
command!          IcedRequire           call iced#nrepl#ns#require()
command!          IcedRequireAll        call iced#nrepl#ns#require_all()
command! -nargs=? IcedUndef             call iced#nrepl#eval#undef(<q-args>)
command!          IcedEvalOuterTopList  call iced#nrepl#eval#outer_top_list()
command!          IcedPrintLast         call iced#nrepl#eval#print_last()
command!          IcedMacroExpandOuterList  call iced#nrepl#macro#expand_outer_list()
command!          IcedMacroExpand1OuterList call iced#nrepl#macro#expand_1_outer_list()

command!          IcedTestNs            call iced#nrepl#test#ns()
command!          IcedTestAll           call iced#nrepl#test#all()
command!          IcedTestRedo          call iced#nrepl#test#redo()
command!          IcedTestUnderCursor   call iced#nrepl#test#under_cursor()
command!          IcedTestBufferOpen    call iced#buffer#error#open()

command!          IcedStdoutBufferOpen  call iced#buffer#stdout#open()
command!          IcedStdoutBufferClear call iced#buffer#stdout#clear()
command!          IcedStdoutBufferClose call iced#buffer#stdout#close()

command! -nargs=? IcedDefJump           call iced#nrepl#jump#jump(<q-args>)
command!          IcedDefBack           call iced#nrepl#jump#back()

command! -nargs=? IcedDocumentOpen      call iced#nrepl#document#open(<q-args>)
command!          IcedFormDocument      call iced#nrepl#document#current_form()
command!          IcedDocumentClose     call iced#buffer#document#close()
command! -nargs=? IcedSourceShow        call iced#nrepl#source#show(<q-args>)
command! -nargs=? IcedGrimoireOpen      call iced#grimoire#open(<q-args>)

command!          IcedSlurp             call iced#paredit#deep_slurp()
command!          IcedBarf              call iced#paredit#barf()
command!          IcedFormat            call iced#format#form()
command!          IcedToggleSrcAndTest  call iced#nrepl#ns#transition#toggle_src_and_test()
command! -nargs=? IcedGrep              call iced#grep#exe(<q-args>)

command!          IcedBrowseNamespace   call iced#nrepl#ns#transition#list()
command!          IcedBrowseFunction    call iced#nrepl#function#list()
command!          IcedBrowseSpec        call iced#nrepl#spec#list()
command!          IcedClearCtrlpCache   call ctrlp#iced#cache#clear()

command!          IcedCleanNs           call iced#nrepl#refactor#clean_ns()
command! -nargs=? IcedAddMissing        call iced#nrepl#refactor#add_missing(<q-args>)

command! -nargs=? IcedToggleTraceVar    call iced#nrepl#trace#toggle_var(<q-args>)
command! -nargs=? IcedToggleTraceNs     call iced#nrepl#trace#toggle_ns(<q-args>)

command!          IcedInReplNs          call iced#nrepl#ns#in_repl_session_ns()

command!          IcedLintCurrentFile   call iced#lint#current_file()
command!          IcedLintToggle        call iced#lint#toggle()
"" }}}

"" Key mappings {{{
nnoremap <silent> <Plug>(iced_connect)             :<C-u>IcedConnect<CR>
nnoremap <silent> <Plug>(iced_disconnect)          :<C-u>IcedDisconnect<CR>
nnoremap <silent> <Plug>(iced_reconnect)           :<C-u>IcedReconnect<CR>
nnoremap <silent> <Plug>(iced_interrupt)           :<C-u>IcedInterrupt<CR>

nnoremap <silent> <Plug>(iced_start_cljs_repl)     :<C-u>IcedStartCljsRepl<CR>
nnoremap <silent> <Plug>(iced_quit_cljs_repl)      :<C-u>IcedQuitCljsRepl<CR>

nnoremap <silent> <Plug>(iced_eval)                :<C-u>set opfunc=iced#operation#eval<CR>g@
nnoremap <silent> <Plug>(iced_eval_repl)           :<C-u>set opfunc=iced#operation#eval_repl<CR>g@
nnoremap <silent> <Plug>(iced_macroexpand)         :<C-u>set opfunc=iced#operation#macroexpand<CR>g@
nnoremap <silent> <Plug>(iced_macroexpand_1)       :<C-u>set opfunc=iced#operation#macroexpand_1<CR>g@
nnoremap <silent> <Plug>(iced_require)             :<C-u>IcedRequire<CR>
nnoremap <silent> <Plug>(iced_require_all)         :<C-u>IcedRequireAll<CR>
nnoremap <silent> <Plug>(iced_undef)               :<C-u>IcedUndef<CR>
nnoremap <silent> <Plug>(iced_eval_outer_top_list) :<C-u>IcedEvalOuterTopList<CR>
nnoremap <silent> <Plug>(iced_print_last)          :<C-u>IcedPrintLast<CR>
nnoremap <silent> <Plug>(iced_macroexpand_outer_list)   :<C-u>IcedMacroExpandOuterList<CR>
nnoremap <silent> <Plug>(iced_macroexpand_1_outer_list) :<C-u>IcedMacroExpand1OuterList<CR>

nnoremap <silent> <Plug>(iced_test_ns)             :<C-u>IcedTestNs<CR>
nnoremap <silent> <Plug>(iced_test_all)            :<C-u>IcedTestAll<CR>
nnoremap <silent> <Plug>(iced_test_redo)           :<C-u>IcedTestRedo<CR>
nnoremap <silent> <Plug>(iced_test_under_cursor)   :<C-u>IcedTestUnderCursor<CR>
nnoremap <silent> <Plug>(iced_test_buffer_open)    :<C-u>IcedTestBufferOpen<CR>

nnoremap <silent> <Plug>(iced_stdout_buffer_open)  :<C-u>IcedStdoutBufferOpen<CR>
nnoremap <silent> <Plug>(iced_stdout_buffer_clear) :<C-u>IcedStdoutBufferClear<CR>
nnoremap <silent> <Plug>(iced_stdout_buffer_close) :<C-u>IcedStdoutBufferClose<CR>

nnoremap <silent> <Plug>(iced_def_jump)            :<C-u>IcedDefJump<CR>
nnoremap <silent> <Plug>(iced_def_back)            :<C-u>IcedDefBack<CR>

nnoremap <silent> <Plug>(iced_document_open)       :<C-u>IcedDocumentOpen<CR>
nnoremap <silent> <Plug>(iced_form_document)       :<C-u>IcedFormDocument<CR>
nnoremap <silent> <Plug>(iced_document_close)      :<C-u>IcedDocumentClose<CR>
nnoremap <silent> <Plug>(iced_source_show)         :<C-u>IcedSourceShow<CR>
nnoremap <silent> <Plug>(iced_grimoire_open)       :<C-u>IcedGrimoireOpen<CR>

nnoremap <silent> <Plug>(iced_slurp)               :<C-u>IcedSlurp<CR>
nnoremap <silent> <Plug>(iced_barf)                :<C-u>IcedBarf<CR>
nnoremap <silent> <Plug>(iced_format)              :<C-u>IcedFormat<CR>
nnoremap <silent> <Plug>(iced_toggle_src_and_test) :<C-u>IcedToggleSrcAndTest<CR>
nnoremap <silent> <Plug>(iced_grep)                :<C-u>IcedGrep<CR>

nnoremap <silent> <Plug>(iced_browse_namespace)    :<C-u>IcedBrowseNamespace<CR>
nnoremap <silent> <Plug>(iced_browse_function)     :<C-u>IcedBrowseFunction<CR>
nnoremap <silent> <Plug>(iced_browse_spec)         :<C-u>IcedBrowseSpec<CR>
nnoremap <silent> <Plug>(iced_clear_ctrlp_cache)   :<C-u>IcedClearCtrlpCache<CR>

nnoremap <silent> <Plug>(iced_clean_ns)            :<C-u>IcedCleanNs<CR>
nnoremap <silent> <Plug>(iced_add_missing)         :<C-u>IcedAddMissing<CR>

nnoremap <silent> <Plug>(iced_toggle_trace_ns)     :<C-u>IcedToggleTraceNs<CR>
nnoremap <silent> <Plug>(iced_toggle_trace_var)    :<C-u>IcedToggleTraceVar<CR>

nnoremap <silent> <Plug>(iced_in_repl_ns)          :<C-u>IcedInReplNs<CR>

nnoremap <silent> <Plug>(iced_lint_current_file)   :<C-u>IcedLintCurrentFile<CR>
nnoremap <silent> <Plug>(iced_lint_toggle)         :<C-u>IcedLintToggle<CR>
"" }}}

"" Auto commands {{{
aug vim_iced_initial_setting
  au!
  au FileType clojure setl omnifunc=iced#complete#omni
  au BufNewFile *.clj,*.cljs,*.cljc call iced#skeleton#new()
  au VimLeave * call iced#nrepl#disconnect()
aug END

if exists('g:iced_enable_auto_linting')
    \ && g:iced_enable_auto_linting
  aug iced_auto_linting
    au!
    au BufWritePost *.clj,*.cljc call iced#lint#current_file()
    au CursorMoved *.clj,*.cljc call iced#lint#echo_message()
  aug END
endif
"" }}}

"" Default mappings {{{
function! s:default_key_mappings() abort
  if !hasmapto('<Plug>(iced_connect)')
    silent! nmap <buffer> <Leader>' <Plug>(iced_connect)
  endif

  if !hasmapto('<Plug>(iced_interrupt)')
    silent! nmap <buffer> <Leader>eq <Plug>(iced_interrupt)
  endif

  if !hasmapto('<Plug>(iced_eval)')
    silent! nmap <buffer> <Leader>ei <Plug>(iced_eval)<Plug>(sexp_inner_element)``
    silent! nmap <buffer> <Leader>ee <Plug>(iced_eval)<Plug>(sexp_outer_list)``
    silent! nmap <buffer> <Leader>et <Plug>(iced_eval_outer_top_list)
  endif

  if !hasmapto('<Plug>(iced_eval_repl)')
    silent! nmap <buffer> <Leader>er <Plug>(iced_eval_repl)<Plug>(sexp_outer_top_list)``
  endif

  if !hasmapto('<Plug>(iced_print_last)')
    silent! nmap <buffer> <Leader>ep <Plug>(iced_print_last)
  endif

  if !hasmapto('<Plug>(iced_require)')
    silent! nmap <buffer> <Leader>eb <Plug>(iced_require)
  endif

  if !hasmapto('<Plug>(iced_require_all)')
    silent! nmap <buffer> <Leader>eB <Plug>(iced_require_all)
  endif

  if !hasmapto('<Plug>(iced_undef)')
    silent! nmap <buffer> <Leader>eu <Plug>(iced_undef)
  endif

  if !hasmapto('<Plug>(iced_macroexpand_outer_list)')
    silent! nmap <buffer> <Leader>eM <Plug>(iced_macroexpand_outer_list)
  endif

  if !hasmapto('<Plug>(iced_macroexpand_1_outer_list)')
    silent! nmap <buffer> <Leader>em <Plug>(iced_macroexpand_1_outer_list)
  endif

  if !hasmapto('<Plug>(iced_test_under_cursor)')
    silent! nmap <buffer> <Leader>tt <Plug>(iced_test_under_cursor)
  endif

  if !hasmapto('<Plug>(iced_test_buffer_open)')
    silent! nmap <buffer> <Leader>to <Plug>(iced_test_buffer_open)
  endif

  if !hasmapto('<Plug>(iced_test_ns)')
    silent! nmap <buffer> <Leader>tn <Plug>(iced_test_ns)
  endif

  if !hasmapto('<Plug>(iced_test_all)')
    silent! nmap <buffer> <Leader>tp <Plug>(iced_test_all)
  endif

  if !hasmapto('<Plug>(iced_test_redo)')
    silent! nmap <buffer> <Leader>tr <Plug>(iced_test_redo)
  endif

  if !hasmapto('<Plug>(iced_stdout_buffer_open)')
    silent! nmap <buffer> <Leader>ss <Plug>(iced_stdout_buffer_open)
  endif

  if !hasmapto('<Plug>(iced_stdout_buffer_clear)')
    silent! nmap <buffer> <Leader>sl <Plug>(iced_stdout_buffer_clear)
  endif

  if !hasmapto('<Plug>(iced_stdout_buffer_close)')
    silent! nmap <buffer> <Leader>sq <Plug>(iced_stdout_buffer_close)
  endif

  if !hasmapto('<Plug>(iced_def_jump)')
    silent! nmap <buffer> <C-]> <Plug>(iced_def_jump)
  endif

  if !hasmapto('<Plug>(iced_def_back)')
    silent! nmap <buffer> <C-t> <Plug>(iced_def_back)
  endif

  if !hasmapto('<Plug>(iced_clean_ns)')
    silent! nmap <buffer> <Leader>rcn <Plug>(iced_clean_ns)
  endif

  if !hasmapto('<Plug>(iced_add_missing)')
    silent! nmap <buffer> <Leader>ram <Plug>(iced_add_missing)
  endif

  if !hasmapto('<Plug>(iced_format)')
    silent! nmap <buffer> == <Plug>(iced_format)
  endif

  if !hasmapto('<Plug>(iced_grep)')
    silent! nmap <buffer> <Leader>* <Plug>(iced_grep)
    silent! nmap <buffer> <Leader>/ :<C-u>IcedGrep<Space>
  endif

  if !hasmapto('<Plug>(iced_document_open)')
    silent! nmap <buffer> K <Plug>(iced_document_open)
  endif

  if !hasmapto('<Plug>(iced_document_close)')
    silent! nmap <buffer> <Leader>hq <Plug>(iced_document_close)
  endif

  if !hasmapto('<Plug>(iced_source_show)')
    silent! nmap <buffer> <Leader>hs <Plug>(iced_source_show)
  endif

  if !hasmapto('<Plug>(iced_grimoire_open)')
    silent! nmap <buffer> <Leader>hg <Plug>(iced_grimoire_open)
  endif

  if !hasmapto('<Plug>(iced_browse_namespace)')
    silent! nmap <buffer> <Leader>bn <Plug>(iced_browse_namespace)
  endif

  if !hasmapto('<Plug>(iced_browse_function)')
    silent! nmap <buffer> <Leader>bf <Plug>(iced_browse_function)
  endif

  if !hasmapto('<Plug>(iced_browse_spec)')
    silent! nmap <buffer> <Leader>bs <Plug>(iced_browse_spec)
  endif
endfunction

if exists('g:iced_enable_default_key_mappings')
    \ && g:iced_enable_default_key_mappings
  silent! call s:default_key_mappings()
  aug iced_default_key_mappings
    au!
    au FileType clojure call s:default_key_mappings()
  aug END
endif
"" }}}

"" Signs {{{
sign define iced_err text=🔥 texthl=ErrorMsg
sign define iced_trace text=👁 texthl=Search
sign define iced_lint text=💔 texthl=WarningMsg
"" }}}

let &cpo = s:save_cpo
unlet s:save_cpo

