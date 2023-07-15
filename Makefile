IMAGE="dotfiles"

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' Makefile | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

all-diff: ## Show diff between repository and installed files in $HOME
	@FILE=.bash_aliases make -s diff
	@FILE=.system_aliases make -s diff
	@FILE=.ssh_aliases make -s diff
	@FILE=.git_aliases make -s diff
	@FILE=.git_prompt_aliases make -s diff
	@FILE=.tmux_aliases make -s diff
	@FILE=.jbang_aliases make -s diff

diff: check ## Show diff between repository and installed file in $HOME
	echo "Diffing $(FILE)"
	@diff --normal $(FILE) ${HOME}/$(basename $(FILE))

all-install: ## Install all dotfiles in $HOME
	FILE=.bash_aliases make -s install
	FILE=.system_aliases make -s install
	FILE=.ssh_aliases make -s install
	FILE=.git_aliases make -s install
	FILE=.git_prompt_aliases make -s install
	FILE=.tmux_aliases make -s install
	FILE=.jbang_aliases make -s install

install: check ## Install one dotfile in $HOME
	cp --verbose --update --interactive $(FILE) ${HOME}

check:
	@test -n '$(FILE)' || { echo "You need to specify a file to install, for example 'make install FILE=.git_aliases'"; exit 1; }

build-image: ## Build Docker image
	DOCKER_BUILDKIT=1 docker build -t $(IMAGE) .

run-image: build-image ## Run Docker image
	docker run -it $(IMAGE)
