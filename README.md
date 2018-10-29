# Hyperlinked C++ BNF Grammar

See the [hyperlinked BNF here](https://alx71hub.github.io/hcb/).

## Which files are contained in this package?
* README.md: this file
* bnf.xml: C++ grammar description in valid XML (according to bnf.xsd)
* bnf.xsd: XML Schema used to validate the grammar described in bnf.xml
* html.xsl: XSLT style sheet to render the hyperlinked grammar to HTML


## How do I contribute to this project?
From the technical perspective you should grasp the following concepts:
* XML
* XML Schema
* XSL Transformation

Given the knowledge above, you should be able to:
* update the XML representation of the BNF (bnf.xml)
* validate it using the provided XML Schema definition (bnf.xsd)
* transform it to HTML using the provided XSL Transformation to HTML (html.xsl)


## How do I validate bnf.xml?
On a Debian system you can validate bnf.xml using xmllint:
	xmllint --schema bnf.xsd bnf.xml --noout
If you plan to contribute to this project, it is assumed that you are able to
map the command above to any other operating system and platform.


## How do I generate the HTML rendition of this BNF?
On a Debian system you can transform bnf.xml to HTML using xsltproc:
	xsltproc -o bnf.html html.xsl bnf.xml
The command above generates the HTML rendition of this BNF in file bnf.html
If you plan to contribute to this project, it is assumed that you are able to
map the command above to any other operating system and platform.


## What is the format of the XML file?
See bnf.xsd and the comments therein.
