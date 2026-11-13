cask "warp-launch" do
  version "0.99.0"
  sha256 "707126724f79be9b850b085a74bd0d8d8c3281dc1a0c8d554455fe4d8d2586e1"

  url "https://github.com/David-Erra/warp-launch/releases/download/v#{version}/WarpLaunch-#{version}.zip"
  name "Warp Launch"
  desc "Reobre les finestres de Warp, cada pestanya amb la seva sessió de Claude Code"
  homepage "https://github.com/David-Erra/warp-launch"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "Warp Launch.app"

  # L'app encara no és notaritzada: sense això, macOS no la deixaria obrir. Quan ho sigui, es treu.
  postflight_steps do
    run "/usr/bin/xattr",
        args:         ["-dr", "com.apple.quarantine", "{{appdir}}/Warp Launch.app"],
        must_succeed: false
  end

  uninstall quit: "cat.davide.warp-launch"

  # No hi ha ~/.config/warp-launch: és la configuració de l'usuari.
  zap trash: [
    "~/Library/Caches/cat.davide.warp-launch",
    "~/Library/HTTPStorages/cat.davide.warp-launch",
    "~/Library/Preferences/cat.davide.warp-launch.plist",
    "~/Library/Saved Application State/cat.davide.warp-launch.savedState",
  ]

  caveats <<~EOS
    Abans de desinstal·lar-la, a l'app: Configuració (⌘,) › General › «Restaura Warp i surt…».
    Així l'ajust de restauració de sessió de Warp torna com era.
  EOS
end
