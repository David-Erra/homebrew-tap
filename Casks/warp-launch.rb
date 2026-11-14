cask "warp-launch" do
  version "1.0.0"
  sha256 "4394ae5ca2267326c909f9f93cf9900bd0095bd6b9d711726db29b0d754b71e4"

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
