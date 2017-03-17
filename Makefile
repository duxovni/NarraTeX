all: $(patsubst %.tex,%.pdf,$(wildcard Production/*.tex))

%.pdf: %.tex */*.tex LaTeX/*
	export game=$(shell pwd) && \
	export TEXINPUTS=.:$(shell pwd)/LaTeX/: && \
	cd $(dir $<) && \
	pdflatex $(notdir $<)
