#!/usr/bin/env ruby

pwd = File.expand_path(File.dirname(__FILE__))

[
  ['gemrc',          '~/.gemrc',          0644],
  ['irbrc',          '~/.irbrc',          0644],
  ['gitconfig',      '~/.gitconfig',      0644],
  ['tmux.conf',      '~/.tmux.conf',      0644],
  ['vim',            '~/.vim',            0755],
  ['vim/vimrc',      '~/.vimrc',          0600],
  ['zsh/zshrc',      '~/.zshrc',          0600],
  ['zsh/zprofile',   '~/.zprofile',       0600],
].each do |src, dest, chmod|
  src_path = "#{pwd}/#{src}"
  dest_path = File.expand_path(dest)

  if File.exists?(dest_path)
    File.unlink(dest_path)
  end

  puts "Linking #{src_path}..."
  File.symlink(src_path, dest_path)

  File.chmod(chmod, dest_path)
end

