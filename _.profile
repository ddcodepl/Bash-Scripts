export PATH=${PATH}:/usr/local/mysql/bin:/usr/local/lib/node_modules

# System
alias rmf="rm -rf"
alias up="uptime"
alias ..="cd .."
alias ll="ls -lah"
alias srm="sudo rm"
alias ...="cd ../../"
alias srmr="sudo rm -R"
alias sites="cd ~/Sites"
alias desktop="cd ~/Desktop"

# CHMOD
alias 644="sudo chmod -R 644"
alias 755="sudo chmod -R 755"
alias 777="sudo chmod -R 777"

# Apache
alias apache="sudo /usr/sbin/apachectl"
alias apachestop="sudo /usr/sbin/apachectl stop"
alias apachestart="sudo /usr/sbin/apachectl start"
alias apacherestart="sudo /usr/sbin/apachectl restart"
alias apachetest="sudo /usr/sbin/apachectl configtest"

# Custom
alias speed="speedtest-cli"
alias addsite="sudo sh ~/Dev/bash-scripts/add_site.sh"
alias addsitewordpress="sudo sh ~/Dev/bash-scripts/add_site_wordpress.sh"
alias addsitelaravel="sudo sh ~/Dev/bash-scripts/add_site_laravel.sh"
alias addsitelumen="sudo sh ~/Dev/bash-scripts/add_site_lumen.sh"

# MySQL
alias mysql="mysql -u root -ppassword"
alias mysqld="mysqldump -u root -ppassword"

# Laravel Aliases
alias artisan="php artisan"
alias serve="php artisan serve"
alias cupdate="composer update"
alias tinker="php artisan tinker"
alias migrate="php arisan migrate"
alias cdump="composer dump-autoload"
alias cclear="php artisan cache:clear"
alias cmigrate="php artisan make:migration"
alias rollback="php artisan migrate:rollback"
alias mreset="php artisan migrate:refresh --seed"

# GIT
alias gadd="git add"
alias pull="git pull"
alias push="git push"
alias clone="git clone"
alias fetch="git fetch"
alias branch="git branch"
alias checkout="git checkout"
alias branches="git branch -a"
alias commit="git commit -m"
alias commitall="git commit -am"
alias ucommit="git commit --amend --no-edit"
alias greset="git reset --hard"
alias gstatus="git status"
alias gall="~/Dev/bash-scripts/gitall.sh"
alias gme="~/Dev/bash-scripts/gitme.sh"
alias merge="git merge" 

# Vagrant
alias vup="vagrant up"
alias vstop="vagrant halt"
alias vhalt="vagrant halt"
alias vssh="vagrant ssh"
alias vinit="vagrant init"

# Apps
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
alias chrome-canary="/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary"

#Docker
alias portainer-start="docker run -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer"
