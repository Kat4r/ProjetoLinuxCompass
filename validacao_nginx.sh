#!/bin/bash

# Diretório para salvar os arquivos de saída
LOG_DIR="/home/vini-compass/atividade-linux"
ONLINE_FILE="$LOG_DIR/nginx_online.log"
OFFLINE_FILE="$LOG_DIR/nginx_offline.log"

# Verifica se o diretório existe, se não, cria-o
[ ! -d "$LOG_DIR" ] && mkdir -p "$LOG_DIR"

# Obtém a data e a hora
DATE=$(date '+%Y-%m-%d %H:%M:%S')

# Verifica o status do serviço Nginx
if systemctl is-active --quiet nginx; then
    STATUS="ONLINE"
    MESSAGE="o serviço NGINX está operacional e funcionando!"
    echo "$DATE - Nginx - Status: $STATUS - $MESSAGE" >> "$ONLINE_FILE"
else
    STATUS="OFFLINE"
    MESSAGE="o serviço NGINX não está em plena operação"
    echo "$DATE - Nginx - Status: $STATUS - $MESSAGE" >> "$OFFLINE_FILE"
fi
