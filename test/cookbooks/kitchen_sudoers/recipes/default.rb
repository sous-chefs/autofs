# Work around for the kitchen Verifier requiring TTY for sudo
execute 'Set !require tty for kitchen user' do
  action :run
  command 'echo "Defaults!ALL !requiretty" >> /etc/sudoers.d/kitchen'
  not_if 'grep "Defaults!ALL !requiretty" /etc/sudoers.d/kitchen'
end
