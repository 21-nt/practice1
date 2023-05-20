.PHONY:	git-all

git-all:
	@git add .
	@if [ -n "$$(git status --porcelain)" ]; then \
        read -p "Type (feat, fix, docs, refactor, chore, style, test, perf, revert, WIP): " type; \
        read -p "Summary: " summary; \
        read -p "Description: " description; \
        read -p "Relevant ticket number or reference: " references; \
        \
        echo "$$type: $$summary\n\n$$description" > commit_message.txt; \
		if [ -n $$references ]; then \
			echo "\nRelevant ticket number or reference: $$references" >> commit_message.txt; \
		fi;\
        while !(git commit -F commit_message.txt || \
		git mergetool); do :; done;\
		git push;\
        rm commit_message.txt; \
    else \
        echo "No changes."; \
    fi
