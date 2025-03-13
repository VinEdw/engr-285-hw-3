SCRIPTS := $(wildcard scripts/*.py)
OUTPUT := $(SCRIPTS:scripts/%.py=output/%.output)

HW3_VE.pdf: HW3_VE.typ engr-conf.typ $(OUTPUT)
	typst compile $<

output/%.output: scripts/%.py
	python $< > $@

.PHONY: clean
clean: 
	rm output/*.output
