# Add `~/bin` to the `$PATH`
export PATH="$PATH:$HOME/bin";

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don't want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

umask 002;

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Add tab completion for many Bash commands
if which brew &> /dev/null && [ -f "$(brew --prefix)/etc/bash_completion" ]; then
	source "$(brew --prefix)/etc/bash_completion";
elif [ -f /etc/bash_completion ]; then
	source /etc/bash_completion;
fi;

# Add grunt bash-completion
eval "$(grunt --completion=bash)"

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
# [ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

# Enable usage of ssh keys
[ "$(find $HOME/.ssh \! -name 'config' \! -name 'known_hosts' -mindepth 1)" ] && eval "$(ssh-agent -s | grep -v '^echo .*')"

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
# complete -W "NSGlobalDomain" defaults;

# Add `killall` tab completion for common apps
# complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall;

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
	# Set config variables first
	GIT_PROMPT_ONLY_IN_REPO=1

	GIT_PROMPT_FETCH_REMOTE_STATUS=0   # uncomment to avoid fetching remote status
	GIT_PROMPT_IGNORE_SUBMODULES=1 # uncomment to avoid searching for changed files in submodules

	# GIT_PROMPT_SHOW_UPSTREAM=1 # uncomment to show upstream tracking branch
	GIT_PROMPT_SHOW_UNTRACKED_FILES=no # can be no, normal or all; determines counting of untracked files

	GIT_PROMPT_SHOW_CHANGED_FILES_COUNT=0 # uncomment to avoid printing the number of changed files

	# GIT_PROMPT_STATUS_COMMAND=gitstatus_pre-1.7.10.sh # uncomment to support Git older than 1.7.10

	GIT_PROMPT_START='${DOCKER_MACHINE_STATUS}\[\033[${userStyle}\]\u: \[\033[0;93m\]\w\[\033[0m\]'
	GIT_PROMPT_END_USER="\[\033[0;37m\] \$ \[\033[0m\]"
	GIT_PROMPT_END_ROOT="\[\033[${userStyle}\] # \[\033[0m\]"

	__GIT_PROMPT_DIR="$(brew --prefix)/opt/bash-git-prompt/share"
	source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi
# Needs to run after nvm.sh
export PATH="$PATH:$NVM_DIR/stable/bin:$HOME/.composer/vendor/bin:$(gem env | grep 'USER INSTALLATION DIRECTORY' | sed -E 's#^.*: (/.*)$#\1/bin#')";
