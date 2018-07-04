all:	clean fdl cc

fdl:	clean validate_napsugar_fdl_hu napsugar_fdl.pdf

cc:	clean validate_napsugar_cc_hu napsugar_cc.pdf
	
napsugar_fdl.pdf: napsugar-fdl.xml napsugar.xls
	dblatex napsugar-fdl.xml -p napsugar.xls

napsugar_cc.pdf: napsugar-cc.xml napsugar.xls
	dblatex napsugar-cc.xml -p napsugar.xls

	
.PHONY: validate_napsugar_fdl_hu
validate_napsugar_fdl_hu:
	xmllint --xinclude napsugar-fdl.xml --output output.xml
	xmllint --relaxng http://docbook.org/xml/5.0/rng/docbookxi.rng output.xml --noout
	rm -f output.xml	

.PHONY: validate_napsugar_cc_hu
validate_napsugar_cc_hu:
	xmllint --xinclude napsugar-cc.xml --output output.xml
	xmllint --relaxng http://docbook.org/xml/5.0/rng/docbookxi.rng output.xml --noout
	rm -f output.xml	
	
.PHONY: clean
clean:
	rm -f napsugar-fdl.pdf
	rm -f napsugar-cc.pdf