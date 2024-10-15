# Instalação do Linux (Ubunto) com WSL

Essa parte é essencial para ter um subsistema linux em seu sistema operacional windows

## Passo a Passo

### 1. Instalação do WSL

Abra o PowerShell como adminstrador e rode o seguinte comando
```
wsl --install
```
### 2. Instalação do sistema Linux

### Método 1: Via Microsoft Store
1. Pesquise por Ubuntu (ou outra distro de seu interesse)
2. Clique na versão que deseja instalar e selecione Obter ou Instalar.
3. Após a instalação, clique em Iniciar para abrir o Ubuntu.

### Método 2: Via PowerShell
1. Com o PowerShell aberto, use o comando
```
wsl --list --online
```
2. Escolha uma Distro que aparecer na lista e digite 
```
wsl --install -d <Distro mostrada na lista>
```

#### Após ambos os métodos é necessário que você reinicie o computador para aplicar as mudanças

Com tudo pronto, basta digitar `wsl` dentro do PowerShell que seu linux irá iniciar


# Monitoramento de Serviço Nginx no Linux

Este projeto implementa um monitoramento simples do serviço Nginx em um sistema Linux. O script verifica se o Nginx está rodando e gera logs separadamente para os casos em que o serviço está **online** ou **offline**. Além disso, o script é configurado para ser executado automaticamente a cada 5 minutos via `cron`.

## Requisitos

- Sistema Linux com acesso ao `cron`
- Servidor Nginx instalado
- Git instalado (para versionamento)

## Passo a Passo

### 1. Instalação do Nginx

Instale o Nginx com o comando:

```bash
sudo apt update
sudo apt install nginx
```

### 2. Criação do Script de Validação
Criei um script chamado `validacao_nginx.sh` no diretório `/home/vini-compass/atividade-linux` onde é validado se o serviço `Nginx` está **ONLINE** ou **OFFLINE**.

### 3. Permissões do Script
Certifique-se de que o script tem permissões de execução:
```
chmod +x /home/vini-compass/atividade-linux/validacao_nginx.sh
```

### 4. Configuração do Cron
Para automatizar a execução do script a cada 5 minutos, edite o arquivo de configuração do cron:

```
crontab -e
```
Com o crontab aberto, adicione a seguinte linha de comando:

```
*/5 * * * * /bin/bash /home/vini-compass/atividade-linux/validacao_nginx.sh >> /home/vini-compass/atividade-linux/cron_log.txt 2>&1
```

Isso garante que o `validacao_nginx.sh` seja executado a cada 5 minutos.

### 5. Teste do Funcionamento
**Testar o Log de ONLINE**

Se o serviço Nginx estiver rodando, o script irá gerar logs no arquivo `nginx_online.log` com a seguinte estrutura:
```
2024-10-14 12:30:00 - NGINX - ONLINE - Serviço funcionando corretamente
```
**Testar o Log de OFFLINE**

Para simular o Nginx offline, pare o serviço:
```
sudo systemctl stop nginx
```

O script irá registrar o seguinte no arquivo `nginx_offline.log`:

```
2024-10-14 12:35:00 - NGINX - OFFLINE - Serviço está parado
```
### 6. Versionamento no GitHub
```
git init
git add .
git commit -m "Arquivo/Atualização"
git branch -M master
git remote add origin https://github.com/Kat4r/ProjetoLinuxCompass.git
git push -u origin master
```

## Conclusão
Este projeto configura um monitoramento básico do serviço Nginx utilizando scripts Bash e cron para automação. Ele pode ser expandido para monitorar outros serviços ou incluir mais funcionalidades conforme necessário.


 
