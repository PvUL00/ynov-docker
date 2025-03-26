<?xml version="1.0" encoding="ISO-8859-1"?>
<!DOCTYPE xsl:stylesheet [
  <!ENTITY xxe "XXE_WAS_TRIGGGERED">
]>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="*">
  <html><body>
    <pre>OK STATIC PAYLOAD</pre>
  </body></html>
</xsl:template>
