# Guia de Publicação

Este guia descreve os passos simples para construir e publicar o projeto no Firebase.

## 1. Construir o Projeto (Build)

Para gerar a versão de produção do projeto, execute o seguinte comando:

```bash
npm run build
```

Isso criará a pasta `dist` com os arquivos otimizados para produção.

## 2. Publicar no Firebase (Deploy)

Após finalizar o build, você pode publicar o projeto no Firebase com o comando:

```bash
firebase deploy --only hosting:prod
```

Isso enviará os arquivos da pasta `dist` para a hospedagem do Firebase.

> Certifique-se de estar autenticado no Firebase (`firebase login`) e de ter as permissões necessárias no projeto.
