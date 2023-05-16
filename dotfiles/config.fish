export PATH="$PATH:/home/gfaster/.cargo/bin"

starship init fish | source

function ls
	exa $argv
end

function l
	ls -a $argv
end

function ll
	ls -lah $argv
end

function tree
	exa -T $argv
end

function cs
	cd $argv
	ls
end

function py
	python3 $argv
end

function pip
	pip3 $argv
end

function nb
	newsboat $argv
end

function gc
	git commit -m $argv
end

function ga
	git add $argv
end

function gat
	git add $argv
	git status
end

function gt
	git status
end

function gl
	git log --oneline -n 16 $argv
end

function glg
	git log --oneline --graph -n 16 $argv
end

function dc
	cd ~/Documents
end

function dn
	cd ~/Downloads
end

function slp
	command systemctl suspend
end

