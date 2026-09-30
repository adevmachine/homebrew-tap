cask "devmachine-app" do
  version "0.1.3"
  sha256 "324b9bbda39e0cf1fe2aee00162be7b188cbbc3335f22382edd0a705a2c7873a"

  url "https://github.com/mydevmachine/app-releases/releases/download/v#{version}/Devmachine-#{version}.dmg"
  name "Devmachine"
  desc "Native macOS app for operating a devmachine VPS"
  homepage "https://mydevmachine.sh/app/"

  depends_on macos: :sonoma

  app "Devmachine.app"

  zap trash: [
    "~/Library/Application Support/Devmachine",
    "~/Library/Preferences/app.devmachine.mac.plist",
    "~/Library/Saved Application State/app.devmachine.mac.savedState",
  ]

  caveats <<~EOS
    Devmachine needs the devmachine CLI to operate a machine:
      brew install mydevmachine/tap/devmachine
  EOS
end
