# mmorpg-android-godot

Projeto inicial de um MMORPG 2D para Android, feito em Godot 4 e GDScript. O protótipo funciona localmente e inclui um mapa com colisões, um personagem e controles em oito direções. Rede, servidor e contas ficam para etapas futuras.

## Como executar

1. Instale o Godot 4.2 ou posterior.
2. No Gerenciador de Projetos, escolha **Importar** e selecione o arquivo `project.godot` na raiz do repositório.
3. Abra o projeto e pressione **F5** para executar a cena principal.

No computador, mova-se com **WASD** ou com as **setas**. Combine duas teclas para andar na diagonal. Também é possível clicar e arrastar no direcional para simular um toque. No Android, toque e arraste no direcional no canto inferior esquerdo. Solte para parar.

## Android

No editor, instale os modelos de exportação da mesma versão do Godot em **Editor → Gerenciar modelos de exportação**. Configure o JDK e o Android SDK nos ajustes do editor e adicione um perfil Android em **Projeto → Exportar**. Exporte um APK de depuração e instale-o em um dispositivo Android ou emulador. A orientação padrão é paisagem.

## Validação sem interface

Na raiz do projeto, execute os comandos abaixo. Se o executável local se chamar `godot4`, use esse nome no lugar de `godot`.

```sh
godot --headless --path . --editor --import
godot --headless --path . --quit-after 120
```

## Estrutura

- `scenes/` contém as cenas principal e do personagem.
- `scripts/` contém a lógica e os desenhos do mapa e do personagem.
- `assets/` contém os recursos Godot, como a forma de colisão do personagem.
- `ui/` contém a lógica e o desenho do direcional virtual.

Os gráficos são desenhados pelo próprio Godot e dispensam imagens externas.
