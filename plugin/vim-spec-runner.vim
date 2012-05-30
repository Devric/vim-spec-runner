let s:current_path=expand("<sfile>:h")

fun! DebugAllTestsInScreen()
  echo system("screen -S spec_suite -p 0 -X stuff 'shopt -s globstar nullglob\n export PS1=\n cd " . getcwd() . "\nclear\n rake test debug=yes reporter=spec \n'")
endfun

fun! DebugLocalTestsInScreen()
  echo system("screen -S specs -p 0 -X stuff 'shopt -s globstar nullglob\n export PS1=\n cd " . getcwd() . "\nclear\n rake test debug=yes reporter=spec  " . expand("%:p:h") . "/*.spec.coffee " . expand("%:p:h") . "/*.spec*/**/*.spec.coffee\n'")
endfun

fun! DebugSpecificTestsInScreen()
  echo system("screen -S specs -p 0 -X stuff 'shopt -s globstar nullglob\n export PS1=\n cd " . getcwd() . "\nclear\n rake test debug=yes reporter=spec  " . expand("%:p") . "\n'")
endfun

fun! RunAllTestsInScreen()
  echo system("screen -S spec_suite -p 0 -X stuff 'shopt -s globstar nullglob\n export PS1=\n cd " . getcwd() . "\nclear\n rake test reporter=progress \n'")
endfun

fun! RunLocalTestsInScreen()
  echo system("screen -S specs -p 0 -X stuff 'shopt -s globstar nullglob\n export PS1=\n cd " . getcwd() . "\nclear\n rake test reporter=spec " . expand("%:p:h") . "/*.spec.coffee " . expand("%:p:h") . "/*.spec*/**/*.spec.coffee\n'")
endfun

fun! RunSpecificTestsInScreen()
  echo system("screen -S specs -p 0 -X stuff 'shopt -s globstar nullglob\n export PS1=\n cd " . getcwd() . "\nclear\n rake test reporter=spec " . expand("%:p") . "\n'")
endfun



fun! RunAllTestsInITerm()
  echo system("osascript ".s:current_path."/sendCommand.scpt specs_all \"shopt -s globstar nullglob\n export PS1=\n cd " . getcwd() . "\nclear\n rake test reporter=progress\n\"")
endfun

fun! RunLocalTestsInITerm()
  echo system("osascript ".s:current_path."/sendCommand.scpt specs_local \"shopt -s globstar nullglob\n export PS1=\n cd " . getcwd() . "\nclear\n rake test reporter=spec " . expand("%:p:h") . "/*.spec.js " . expand("%:p:h") . "/*/*.spec.js\n\"")
endfun

fun! RunSpecificTestsInITerm()
  echo system("osascript ".s:current_path."/sendCommand.scpt specs_local \"shopt -s globstar nullglob\n export PS1=\n cd " . getcwd() . "\nclear\n rake test reporter=spec " . expand("%:p") . "\n\"")
endfun

fun! DebugAllTestsInITerm()
  echo system("osascript ".s:current_path."/sendCommand.scpt specs_all \"shopt -s globstar nullglob\n export PS1=\n cd " . getcwd() . "\nclear\n rake test debug=true\n\" focus")
endfun

fun! DebugLocalTestsInITerm()
  echo system("osascript ".s:current_path."/sendCommand.scpt specs_local \"shopt -s globstar nullglob\n export PS1=\n cd " . getcwd() . "\nclear\n rake test debug=true " . expand("%:p:h") . "/*.spec.js " . expand("%:p:h") . "/*/*.spec.js\n\" focus")
endfun

fun! DebugSpecificTestsInITerm()
  echo system("osascript ".s:current_path."/sendCommand.scpt specs_local \"shopt -s globstar nullglob\n export PS1=\n cd " . getcwd() . "\nclear\n rake test debug=true " . expand("%:p") . "\n\" focus")
endfun


" Sample mappings using ITerm
"map <leader>T :call RunAllTestsInITerm()<CR>
"map <leader>t :call RunLocalTestsInITerm()<CR>
"map <leader>t. :call RunSpecificTestsInITerm()<CR>
"map <leader>D :call DebugAllTestsInITerm()<CR>
"map <leader>d :call DebugLocalTestsInITerm()<CR>
"map <leader>d. :call DebugSpecificTestsInITerm()<CR>

" Sample mappings using Screen
"map <leader>T :call RunAllTestsInScreen()<CR>
"map <leader>t :call RunLocalTestsInScreen()<CR>
"map <leader>t. :call RunSpecificTestsInScreen()<CR>
"map <leader>D :call DebugAllTestsInScreen()<CR>
"map <leader>d :call DebugLocalTestsInScreen()<CR>
"map <leader>d. :call DebugSpecificTestsInScreen()<CR>