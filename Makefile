prod: $(patsubst %.tex,%.pdf,$(wildcard Production/*.tex))

packets: Production/json-PRINT.json
	export game=$(shell pwd) && \
	export TEXINPUTS=.:$(shell pwd)/LaTeX/: && \
	cd Production && \
	../Extras/makepackets.py .. all

charsheets: Production/json-PRINT.json
	export game=$(shell pwd) && \
	export TEXINPUTS=.:$(shell pwd)/LaTeX/: && \
	cd Production && \
	../Extras/makepackets.py .. listchar

%.pdf: %.tex */*.tex LaTeX/*
	export game=$(shell pwd) && \
	export TEXINPUTS=.:$(shell pwd)/LaTeX/: && \
	cd $(dir $<) && \
	pdflatex $(notdir $<)

Production/json-PRINT.json: Production/json-PRINT.tex */*.tex LaTeX/*
	export game=$(shell pwd) && \
	export TEXINPUTS=.:$(shell pwd)/LaTeX/: && \
	cd $(dir $<) && \
	pdflatex $(notdir $<)
