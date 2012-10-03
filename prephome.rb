#!/usr/bin/env ruby

pwd = File.expand_path(File.dirname(__FILE__))

[
  ['gemrc',          '~/.gemrc',          0644],
  ['irbrc',          '~/.irbrc',          0644],
  ['gitconfig',      '~/.gitconfig',      0644],
  ['mairixrc',       '~/.mairixrc',       0644],
  ['mpoprc',         '~/.mpoprc',         0600],
  ['msmtprc',        '~/.msmtprc',        0600],
  ['offlineimap.py', '~/.offlineimap.py', 0644],
  ['offlineimaprc',  '~/.offlineimaprc',  0644],
  ['procmailrc',     '~/.procmailrc',     0644],
  ['tmux.conf',      '~/.tmux.conf',      0644],
  ['lbdbrc',         '~/.lbdbrc',         0644],
  ['zeesh',          '~/.zeesh',          0755],
  ['mutt',           '~/.mutt',           0755],
  ['mutt/muttrc',    '~/.muttrc',         0600],
  ['vim',            '~/.vim',            0755],
  ['vim/vimrc',      '~/.vimrc',          0600],
  ['zsh/zshrc',      '~/.zshrc',          0600],
  ['zsh/zprofile',   '~/.zprofile',       0600],
].each do |src, dest, chmod|
  src_path = "#{pwd}/#{src}"
  dest_path = File.expand_path(dest)

  if not File.exists?(dest_path)
    puts "Linking #{src_path}..."
    File.symlink(src_path, dest_path)
  else
    puts "Skipping #{src_path}..."
  end

  File.chmod(chmod, dest_path)
end

[
  '~/.mail',
  '~/.offlineimap',
  '~/.procmail',
].each do |dest|
  dest_path = File.expand_path(dest)

  if not File.exists?(dest_path)
    puts "Making #{dest_path}..."
    Dir.mkdir(dest_path)
  else
    puts "Skipping #{dest_path}..."
  end
end
