.DEFAULT_GOAL := help

## Run build
.PHONY : build
build :
	mdbook build

## Run test
.PHONY : test
test :
	mdbook test

## Run clean
.PHONY : clean
clean :
	mdbook clean

## Run serve with pueue
.PHONY : serve
serve :
	pueue add -- "mdbook serve"

## Show help
.PHONY : help
help :
	@make2help $(MAKEFILE_LIST)
