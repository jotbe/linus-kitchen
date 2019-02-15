
vscode_version = '1.31.1-1549938243'

vscode_plugins = {
  'bbenoist.vagrant' => '0.5.0',
  'dhoeric.ansible-vault' => '0.1.3',
  'donjayamanne.githistory' => '0.4.6',
  'eamodio.gitlens' => '9.5.1',
  'felipecaputo.git-project-manager' => '1.7.1',
  'mde.select-highlight-minimap' => '0.0.8',
  'ms-python.python' => '2019.1.0',
  'ms-vscode.sublime-keybindings' => '4.0.0',
  'Pendrica.chef' => '0.7.1',
  'PeterJausovec.vscode-docker' => '0.5.2',
  'vscoss.vscode-ansible' => '0.5.2',
  'yzhang.markdown-all-in-one' => '2.0.1',
  'zikalino.azure-rest-for-ansible' => '0.0.18',
}

apt_repository 'vscode' do
  uri          'https://packages.microsoft.com/repos/vscode/'
  arch         'amd64'
  distribution 'stable'
  components   ['main']
  key          'https://packages.microsoft.com/keys/microsoft.asc'
end

# # ensure we have the required gui packages for starting vscode in docker / Circle CI
# if docker?
#  package ['libxss-dev', 'gconf2', 'libgtk2.0-0', 'libnotify4', 'gvfs-bin', 'xdg-utils']
# end

package 'code' do
  version vscode_version
  action :install
end

# install vscode plugins
vscode_plugins.each do |name, version|
  install_vscode_plugin(name, version)
end
