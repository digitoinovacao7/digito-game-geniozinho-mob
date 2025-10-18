# Gêniozinho

![Status](https://img.shields.io/badge/status-active-brightgreen.svg) ![Flutter](https://img.shields.io/badge/framework-flutter-blue.svg) ![License](https://img.shields.io/badge/license-MISSING-lightgrey.svg)

## Descrição

Gêniozinho é um conjunto de jogos educativos focados no treino do raciocínio lógico, memória e agilidade mental. O projeto combina entretenimento e aprendizado para oferecer desafios divertidos e progressivos que ajudam usuários de todas as idades a desenvolverem suas habilidades matemáticas e cognitivas.

## Funcionalidades principais

- Quebra-cabeças matemáticos (cálculo + lógica)
- Jogos de memória (padrões e combinações)
- Desafios de lógica e raciocínio crítico
- Jogos rápidos de cálculo mental (soma, subtração, multiplicação, divisão)
- Múltiplos temas (aventura, exploração, etc.)

## Benefícios para o usuário

- Melhora do raciocínio lógico
- Aumento da concentração
- Desenvolvimento da agilidade mental
- Estímulo à criatividade
- Fortalecimento da memória

---

## Conteúdo deste repositório

Código-fonte do aplicativo Flutter para Android/iOS/web, assets (sons, imagens, fontes) e configurações de build.

---

## Pré-requisitos

- Flutter (stable) instalado e configurado: https://flutter.dev/docs/get-started/install
- Android SDK (para builds Android)
- (Opcional) Android Studio ou VS Code com extensões Flutter/Dart
- Um dispositivo/emulador Android ou iOS para testes

---

## Como rodar em desenvolvimento

1. Clone o repositório:

```bash
git clone <repo-url>
cd digito-game-geniozinho-mob
```

2. Instale dependências:

```bash
flutter pub get
```

3. Rode no dispositivo/emulador conectado:

```bash
flutter run
```

Observação: se for necessário, escolha o dispositivo com `flutter devices` e rode `flutter run -d <deviceId>`.

---

## Build de produção (Android App Bundle)

Gerar um AAB para publicação no Google Play:

1. Gere/posicione sua chave de assinatura (exemplo com keytool):

```bash
keytool -genkey -v -keystore geniozinho-key.jks -storetype JKS -keyalg RSA -keysize 2048 -validity 10000 -alias androidapps
```

2. Limpe, obtenha dependências e gere o bundle:

```bash
flutter clean
flutter pub get
flutter build appbundle --release
```

3. O arquivo `.aab` será gerado em `build/app/outputs/bundle/release/app-release.aab`.

Dica: configure `key.properties` e os blocos de `signingConfigs` no `android/app/build.gradle` para automatizar a assinatura.

---

## Notas sobre áudio e permissões

O projeto inclui assets de áudio (tick, wrong, right, etc.). Garanta que os arquivos estão listados corretamente em `pubspec.yaml` e que permissões necessárias (se houver) estão configuradas para cada plataforma.

---

## Testes e verificação rápida

- Rode `flutter analyze` para checar problemas estáticos.
- Rode `flutter test` se houver testes unitários no projeto.

---

## Contribuindo

Contribuições são bem-vindas. Sugestões:

- Abra issues descrevendo o bug ou a feature desejada.
- Envie PRs pequenas e bem documentadas.
- Mantenha o estilo de código e escreva testes quando possível.

Sugiro adicionar um `CONTRIBUTING.md` com diretrizes específicas de fluxo de trabalho (branching, PRs, commit messages).

---

## Licença

Este repositório ainda não tem uma licença explícita. Recomendo adicionar uma (por exemplo MIT) se você quiser permitir contribuições externas com clareza legal.

---

## Contato

Para questões e suporte, adicione seu e-mail ou site; por exemplo:

- Website: https://geniozinho.com.br/
- Contato: contato@geniozinho.com.br

---

## Próximos passos/ melhorias sugeridas

- Adicionar screenshots e GIFs na raiz (`/assets/screenshots`) e incluí-los no README
- Incluir badges reais (build, flutter version, license) integrados ao CI (GitHub Actions)
- Adicionar `CONTRIBUTING.md` e uma `LICENSE` (ex: MIT)
- Automatizar assinatura do APK/AAB via variáveis de ambiente/secretos no CI

---

© 2025 Gêniozinho
