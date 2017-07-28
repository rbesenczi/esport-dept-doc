all:	clean validate_xmllint_esportdeptdoc_hu esportdeptdoc_hu.pdf

esportdeptdoc_hu.pdf: esportdeptdoc-hu.xml esportdeptdoc-hu.xls
	dblatex esportdeptdoc-hu.xml -p esportdeptdoc-hu.xls

porthu:	clean validate_xmllint_esportdeptdoc_hu esportdeptdoc-hu.pdf

.PHONY: validate_jing_esportdeptdoc_hu
validate_jing_esportdeptdoc_hu:
	xmllint --xinclude esportdeptdoc-hu.xml --output output.xml
	java -jar /home/nbatfai/Downloads/jing-trang-20131210/build/jing.jar -c http://docbook.org/xml/5.1/rng/docbookxi.rnc output.xml

.PHONY: validate_xmllint_esportdeptdoc_hu
validate_xmllint_esportdeptdoc_hu:
	xmllint --xinclude esportdeptdoc-hu.xml --output output.xml
	xmllint --relaxng http://docbook.org/xml/5.1/rng/docbookxi.rng output.xml --noout
	rm -f output.xml	
	
.PHONY: clean
clean:
	rm -vf esportdeptdoc-hu.pdf
