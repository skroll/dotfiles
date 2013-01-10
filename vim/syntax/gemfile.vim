if version < 600
	syntax clear
endif

runtime syntax/ruby.vim
syntax case match
syntax keyword gemfileKeywords gem source bundle_path group path git gemspec
syntax keyword gemfileDeprecated only except disable_rubygems disable_system_gems clear_sources bundle_path bin_path
highlight link gemfileKeywords Define
highlight link gemfileDeprecated Error

