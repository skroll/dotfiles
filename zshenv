# basic configuration -----------------------------------------------------{{{

# variables {{{

export EDITOR="vim" # of course

cellar_root="/usr/local/Cellar"
eyed3_version="0.6.17"
ruby_version="1.9.3-p0"

# }}}
# aliases {{{

alias tm="tmux -u2"

# }}}
# path {{{
 
[[ -d /usr/local/bin ]]          && path=(/usr/local/bin $path)
[[ -d /usr/local/sbin ]]         && path=(/usr/local/sbin $path)
[[ -d /usr/local/share/python ]] && path=(/usr/local/share/python $path)
[[ -d ~/.local/bin ]]            && path=(~/.local/bin $path)
[[ -d $cellar_root/ruby/$ruby_version/bin ]] \
	&& path=($cellar_root/ruby/$ruby_version/bin $path)
# }}}
 
# }}}
# application specific -----------------------------------------------------{{{
# haste {{{

export HASTE_SERVER="http://192.168.1.156:7777" # make work-life easier

# }}}
# maven {{{
 
export MAVEN_OPTS="-Xmx1024m" # we build big up in heah

# }}}
# python {{{

[[ -d $cellar_root/eye-d3/$eyed3_version/libexec ]] \
	&& pythonpath=($cellar_root/eye-d3/$eyed3_version/libexec $pythonpath)
[[ -d ~/.local/lib/python ]] \
	&& pythonpath=(~/.local/lib/python $pythonpath)

export PYTHONPATH="${(j":")pythonpath}"
unset pythonpath

# }}}

# node {{{
 
[[ -d /usr/local/lib/node_modules ]] \
	&& node_path=(/usr/local/lib/node_modules $node_path)

export NODE_PATH="${(j":")node_path}"
unset node_path

# }}}

# mail {{{

export MAIL=
setopt mail_warning
mailpath=(~/.mail/gmail/INBOX'?You have new mail in gmail'
	~/.mail/infogation/inbox'?You have new mail in infogation'
	~/.mail/kevadiya/INBOX'?You have new mail in kevadiya')

# }}}

# }}}
