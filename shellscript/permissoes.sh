#!/bin/bash
#Desafio Prático Integrado
#Cenário: A empresa precisa de uma pasta compartilhada chamada 
#/projetos/backend para a equipe de desenvolvimento.

#Instruções:
#Crie o grupo devs.
#Crie os usuários lucas e juliana, ambos pertencentes ao grupo devs.
#Crie o diretório /projetos/backend.
#Configure a pasta /projetos/backend para que:
#O dono seja o root e o grupo seja devs.
#Membros do grupo devs tenham acesso total (leitura, escrita e execução/navegação).
#Usuários fora do grupo devs não tenham nenhum acesso (nem leitura, nem navegação).
#Qualquer arquivo criado dentro da pasta por lucas ou juliana pertença automaticamente ao grupo devs (dica: SGID).

echo "Criando o grupo devs"
groupadd devs > /dev/null 2>&1
echo "Criando o usuário lucas"
useradd -M lucas -g devs -p "lucas" -e "2026-08-31" -c "Lucas de Souza" > /dev/null 2>&1
echo "Criando o usuário juliana"
useradd -M juliana -g devs -p "juliana" -e "2026-08-31" -c "Juliana Silva" > /dev/null 2>&1
echo "Criando o diretório do projeto /projetos/backend"
mkdir -p /projetos/backend
echo "Alterando o proprietário do projeto backend para root:devs"
chown -R root:devs /projetos/backend
echo "Permitindo acesso total ao grupo devs para o projeto backend"
chmod -R g+rwx /projetos/backend
chmod g+s /projetos/backend
echo "Bloqueio total a usuários que não pertencem ao grupo devs"
chmod -R o-rwx /projetos/backend
