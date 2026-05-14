# Makefile. https://www.gnu.org/software/make/

git_current_branch ?= $$(git branch | grep '^*' | cut '-d*' -f2)

# Pushes current branch to all Git remotes
.PHONY: git.push
git.push:
	for r in $$(git remote); do git push $$r $(git_current_branch); done

# Pushes all tags to all Git remotes
.PHONY: git.push-tags
git.push-tags:
	for t in $$(git tag); do for r in $$(git remote); do git push $$r $$t; done; done
