#!/bin/bash

function configure_git {
  git config --global user.email zhjwpku@gmail.com
  git config --global user.name "Zhao Junwang"
  git config --global core.editor vim

  # alias
  git config --global alias.br "branch -vv"
  git config --global alias.ci "commit -s"
  git config --global alias.co checkout
  git config --global alias.cob "checkout -b"
  git config --global alias.cp cherry-pick
  git config --global alias.dh "diff --no-prefix HEAD"
  git config --global alias.ps push
  git config --global alias.st status
  git config --global alias.lg "log --graph --format='%C(auto)%h%C(reset) %C(dim white)%an%C(reset) %C(green)%ai%C(reset) %C(auto)%d%C(reset)%n   %s'"
  git config --global alias.lg10 "log --graph --pretty=format:'%C(yellow)%h%C(auto)%d%Creset %s %C(white)- %an, %ar%Creset' -10"
  git config --global alias.lg20 "log --graph --pretty=format:'%C(yellow)%h%C(auto)%d%Creset %s %C(white)- %an, %ar%Creset' -20"
  git config --global alias.lg30 "log --graph --pretty=format:'%C(yellow)%h%C(auto)%d%Creset %s %C(white)- %an, %ar%Creset' -30"
  git config --global alias.fp "format-patch --stdout --no-prefix"

  git config --global core.excludesfile ~/.gitignore_global
  echo "build" >> ~/.gitignore_global
  echo ".vscode" >> ~/.gitignore_global
  echo ".devcontainer" >> ~/.gitignore_global
  echo ".DS_Store" >> ~/.gitignore_global
}

function configure_vscode {
  mkdir -p .vscode
  cat <<EOL > ".vscode/c_cpp_properties.json"
{
    "configurations": [
        {
            "name": "Postgres Development Configuration",
            "includePath": [
                "\${workspaceFolder}/**",
                "\${workspaceFolder}/src/include/",
                "\${workspaceFolder}/../build/src/include/"
            ],
            "cStandard": "c99",
            "configurationProvider": "ms-vscode.makefile-tools"
        }
    ],
    "version": 4
}
EOL

  cp .devcontainer/launch.json .vscode/
  cp .devcontainer/tasks.json .vscode/
}

function configure_env {
  echo "export PATH=/usr/local/pgsql/bin:$PATH" >> ~/.bashrc
}

function main {
  configure_git
  configure_vscode
  configure_env
}

main $@
