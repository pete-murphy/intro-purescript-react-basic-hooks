all:
		@npm install
		@npx spago build
		@ln -s $(shell pwd)/output $(shell pwd)/src

.PHONY: all