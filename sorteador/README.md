# App de Sorteio

## Instruções de Execução

### Preparação e Execução
1. Certifique-se de ter o Docker e Docker Compose instalados
2. Execute os seguintes comandos:

```bash
# Construir a imagem Docker
docker-compose build

# Iniciar o aplicativo
docker-compose up
```

### Para Acessar o Aplicativo

#### Dentro do Windows (Host)
Abra seu navegador e acesse:
```
http://localhost:8080
```

#### Se estiver usando WSL2
Se o Docker estiver rodando dentro do WSL2, você precisará do IP do WSL2:

1. Dentro do terminal WSL2, obtenha o IP:
   ```bash
   ip addr show eth0 | grep "inet\b" | awk '{print $2}' | cut -d/ -f1
   ```

2. No navegador do Windows, acesse:
   ```
   http://[IP-DO-WSL2]:8080
   ```
   Exemplo: `http://172.28.135.77:8080`

## Funcionalidade
- Adicione nomes na lista de "Não Sorteados"
- Transfira nomes entre as listas com um clique
- Interface responsiva que se adapta a diferentes tamanhos de tela