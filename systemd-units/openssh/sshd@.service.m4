[Unit]
Description=OpenSSH Per-Connection Daemon
After=sshdgenkeys.service

[Service]
ExecStart=-__SSHD_PATH__ -i
StandardInput=socket
StandardError=syslog
