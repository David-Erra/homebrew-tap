cask "warp-launch" do
  version "1.0.4"
  sha256 "9954c48c4df8c25f3dd24a7a80524a82a46f7bb029c4efe10fb92f1fea865f66"

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
