# Makefile. https://www.gnu.org/software/make/

git_current_branch ?= $$(git branch | grep '^*' | cut '-d*' -f2)

# Add Git remotes
.PHONY: git.add-remotes
git.add-remotes:
	git remote add github.com   git@github.com:joeljuca/skills.git         || true
	git remote add codeberg.org ssh://git@codeberg.org/joeljuca/skills.git || true

	for r in $$(git remote); do \
		echo git fetch $$r; \
	done

# Pushes current branch to all Git remotes
.PHONY: git.push
git.push:
	for r in $$(git remote); do git push $$r $(git_current_branch); done

# Pushes all tags to all Git remotes
.PHONY: git.push-tags
git.push-tags:
	for t in $$(git tag); do for r in $$(git remote); do git push $$r $$t; done; done
