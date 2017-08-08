all:	clean fdl cc

fdl:	clean validate_xmllint_esportdeptdoc_fdl_hu esportdeptdoc_fdl_hu.pdf

cc:	clean validate_xmllint_esportdeptdoc_cc_hu esportdeptdoc_cc_hu.pdf
	
esportdeptdoc_fdl_hu.pdf: esportdeptdoc-fdl-hu.xml esportdeptdoc-hu.xls
	dblatex esportdeptdoc-fdl-hu.xml -p esportdeptdoc-hu.xls

esportdeptdoc_cc_hu.pdf: esportdeptdoc-cc-hu.xml esportdeptdoc-hu.xls
	dblatex esportdeptdoc-cc-hu.xml -p esportdeptdoc-hu.xls
	
.PHONY: validate_jing_esportdeptdoc_fdl_hu
validate_jing_esportdeptdoc_fdl_hu:
	xmllint --xinclude esportdeptdoc-fdl-hu.xml --output output.xml
	java -jar /home/nbatfai/Downloads/jing-trang-20131210/build/jing.jar -c http://docbook.org/xml/5.1/rng/docbookxi.rnc output.xml

.PHONY: validate_jing_esportdeptdoc_cc_hu
validate_jing_esportdeptdoc_cc_hu:
	xmllint --xinclude esportdeptdoc-cc-hu.xml --output output.xml
	java -jar /home/nbatfai/Downloads/jing-trang-20131210/build/jing.jar -c http://docbook.org/xml/5.1/rng/docbookxi.rnc output.xml


.PHONY: validate_xmllint_esportdeptdoc_fdl_hu
validate_xmllint_esportdeptdoc_fdl_hu:
	xmllint --xinclude esportdeptdoc-fdl-hu.xml --output output.xml
	xmllint --relaxng http://docbook.org/xml/5.1/rng/docbookxi.rng output.xml --noout
	rm -f output.xml	

.PHONY: validate_xmllint_esportdeptdoc_cc_hu
validate_xmllint_esportdeptdoc_cc_hu:
	xmllint --xinclude esportdeptdoc-cc-hu.xml --output output.xml
	xmllint --relaxng http://docbook.org/xml/5.1/rng/docbookxi.rng output.xml --noout
	rm -f output.xml	

	
.PHONY: clean
clean:
	rm -vf esportdeptdoc-fdl-hu.pdf
	rm -vf esportdeptdoc-cc-hu.pdf
