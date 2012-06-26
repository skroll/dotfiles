#!/usr/bin/env ruby

pwd = File.expand_path(File.dirname(__FILE__))

[
  ['mairixrc',       '~/.mairixrc'],
  ['mpoprc',         '~/.mpoprc'],
  ['msmtprc',        '~/.msmtprc'],
  ['offlineimap.py', '~/.offlineimap.py'],
  ['offlineimaprc',  '~/.offlineimaprc'],
  ['procmailrc',     '~/.procmailrc'],
  ['tmux.conf',      '~/.tmux.conf'],
  ['zeesh',          '~/.zeesh'],
  ['mutt',           '~/.mutt'],
  ['mutt/muttrc',    '~/.muttrc'],
  ['vim',            '~/.vim'],
  ['vim/vimrc',      '~/.vimrc'],
  ['zsh/zshrc',      '~/.zshrc'],
  ['zsh/zprofile',   '~/.zprofile'],
].each do |src, dest|
  src_path = "#{pwd}/#{src}"
  dest_path = File.expand_path(dest)

  if not File.exists?(dest_path)
    puts "Linking #{src_path}..."
    File.symlink(src_path, dest_path)
  else
    puts "Skipping #{src_path}..."
  end
end
