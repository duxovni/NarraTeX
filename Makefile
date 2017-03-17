prod: $(patsubst %.tex,%.pdf,$(wildcard Production/*.tex))

GAMECLASS=game

packets: Production/json-PRINT.json
	export $(GAMECLASS)=$(shell pwd) && \
	export TEXINPUTS=.:$(shell pwd)/LaTeX/: && \
	cd Production && \
	../Extras/makepackets.py .. all

charsheets: Production/json-PRINT.json
	export $(GAMECLASS)=$(shell pwd) && \
	export TEXINPUTS=.:$(shell pwd)/LaTeX/: && \
	cd Production && \
	../Extras/makepackets.py .. listchar

%.pdf: %.tex */*.tex LaTeX/*
	export $(GAMECLASS)=$(shell pwd) && \
	export TEXINPUTS=.:$(shell pwd)/LaTeX/: && \
	cd $(dir $<) && \
	pdflatex $(notdir $<)

Production/json-PRINT.json: Production/json-PRINT.tex */*.tex LaTeX/*
	export $(GAMECLASS)=$(shell pwd) && \
	export TEXINPUTS=.:$(shell pwd)/LaTeX/: && \
	cd $(dir $<) && \
	pdflatex $(notdir $<)
