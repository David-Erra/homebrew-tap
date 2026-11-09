# homebrew-tap

Receptes de Homebrew de David Erra.

## Warp Launch

Reobre les finestres i les pestanyes de Warp, cadascuna amb la seva sessió de Claude Code.
El codi és a [David-Erra/warp-launch](https://github.com/David-Erra/warp-launch).

Cal un Mac amb Apple Silicon, macOS 26 o posterior, [Warp](https://www.warp.dev) Stable i
[Claude Code](https://docs.claude.com/claude-code).

```bash
brew install --cask david-erra/tap/warp-launch   # instal·lar
brew upgrade --cask warp-launch                  # actualitzar
```

En actualitzar, Homebrew tanca l'app, hi posa la versió nova i la torna a obrir.

L'app encara no és notaritzada per Apple: la recepta li treu la marca de quarantena perquè macOS la deixi obrir.

### Desinstal·lar

1. A l'app, Configuració (⌘,) › General › «Restaura Warp i surt…», perquè l'ajust de restauració de sessió de Warp torni com era.
2. `brew uninstall --cask warp-launch`

La configuració de l'app (`~/.config/warp-launch/`) no s'esborra.
