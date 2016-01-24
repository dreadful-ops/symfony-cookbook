if node[:symfony][:zsh]
    include_recipe "zsh"
    include_recipe "git"

    # Get users using /bin/bash
    bash_users = `awk -F':' '{ print $1, $7}' /etc/passwd | grep /bin/bash | awk '{ print $1 }'`

    # For each user
    bash_users.split("\n").each do |user|
        # Home directory of the user
        homeDirectory = `getent passwd #{user} | cut -d: -f6`.delete("\n")

        # Install on-my-zsh
        git "#{homeDirectory}/.oh-my-zsh" do
          repository 'git://github.com/robbyrussell/oh-my-zsh.git'
          revision 'master'
          action :sync
        end

        # Add the template
        file "#{homeDirectory}/.zshrc" do
          owner "#{user}"
          group 'root'
          mode 0755
          content lazy { ::File.open("#{homeDirectory}/.oh-my-zsh/templates/zshrc.zsh-template").read }
          action :create
        end

        # Set the shell
        bash "Set #{user} shell to zsh" do
          code <<-EOT
            chsh -s /bin/zsh #{user}
          EOT
        end
    end
end