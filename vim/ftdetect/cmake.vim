augroup filetype
	au! BufNewFile,BufRead *.cmake set filetype=cmake
	au! BufNewFile,BufRead *.toolchain set filetype=cmake
	au! BufNewFile,BufRead CMakeLists.txt set filetype=cmake
	au! BufNewFile,BufRead CMake*.txt set filetype=cmake
augroup END

