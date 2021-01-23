repo = home/runner/work/ply_sphinx_docs_github_pages/ply_sphinx_docs_github_pages


# using the makefile inside the docs folder
# clean the current build then
# test build docs in local environment and 
# start python http.server
live_docs:
	@cp -a ./README.rst ./docsource/README.rst
	make -C ./docsource html && python3 -m http.server 8000 --bind 127.0.0.1 --directory ./docsource/_build/html  

# build docs
github_docs:
	rm -rf docs
	mkdir ./docs && touch ./docs/.nojekyll
	@cp -a ./README.rst ./docsource/README.rst
	@make -C ./docsource html
	@cp -a ./docsource/_build/html/. ./docs

github_action_docs2:
	rm -rf docs
	mkdir ./docs && touch ./docs/.nojekyll
	@cp -a ./README.rst ./docsource/README.rst
	rm -rf ./docsource/_build && mkdir ./docsource/_build 
	rm -rf ./docsource/_autosummary
	pipx run poetry run sphinx-build -b html /$(repo)/.docsource /$(repo)/.docsource/_build
	@cp -a ./docsource/_build/html/. ./docs

github_action_docs:
	ls docsource -a
	cat docsource/conf.py
	find conf.py