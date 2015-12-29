.PHONY: all clean html

all: html lb4vII.html

lb4vII.asciidoc: preface.asciidoc bash.asciidoc ssh.asciidoc source.asciidoc web.asciidoc file.asciidoc email.asciidoc iptable.asciidoc appendix.asciidoc
	cat preface.asciidoc bash.asciidoc ssh.asciidoc source.asciidoc web.asciidoc file.asciidoc email.asciidoc iptable.asciidoc appendix.asciidoc > lb4vII.asciidoc

lb4vII.html: lb4vII.xml
	xmlto html-nochunks lb4vII.xml

html: lb4vII.xml
	xmlto html lb4vII.xml -o html

lb4vII.pdf: lb4vII.fo
	fop -c fop.xconf -fo lb4vII.fo -pdf lb4vII.pdf

lb4vII.epub: lb4vII.xml
	xmlto epub lb4vII.xml

lb4vII.fo: lb4vII.xml
	xsltproc fop.xsl lb4vII.xml > lb4vII.fo

lb4vII.xml: lb4vII.asciidoc
	asciidoc -a lang=vi -d book -b docbook lb4vII.asciidoc

clean:
	@rm -rfv lb4vII* *.html *.epub *.fo *.pdf *.xml html

