[Unit]
Description=OpenSSH Daemon
Wants=sshdgenkeys.service
After=sshdgenkeys.service
After=network.target

[Service]
ExecStart=__SSHD_PATH__ -D
ExecReload=/bin/kill -HUP $MAINPID
KillMode=process
Restart=always

[Install]
WantedBy=multi-user.target

# This service file runs an SSH daemon that forks for each incoming connection.
# If you prefer to spawn on-demand daemons, use sshd.socket and sshd@.service.
