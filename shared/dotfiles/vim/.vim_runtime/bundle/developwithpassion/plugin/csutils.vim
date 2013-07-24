function s:Dotnet_compile()
  set makeprg=build.bat
  set errorformat=\ %#%f(%l\\\,%c):\ error\ CS%n:\ %m
endfunction

command DotNetCompile :call <SID>Dotnet_compile()
