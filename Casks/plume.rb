cask "plume" do
    version "0.4.1"

    on_arm do
      sha256 "4cd9a134869a5d847a311ce73eb7735fdfc28729e89ac97a2f6cbe1d86844205"
      url "https://github.com/Axiome-Apps/Plume/releases/download/v#{version}/Plume_#{version}_aarch64.dmg"
    end

    on_intel do
      sha256 "ba65af0bf4967c92d27f7d6e74f55e9c2087f03eabda1f1f9895882fddc1dacb"
      url "https://github.com/Axiome-Apps/Plume/releases/download/v#{version}/Plume_#{version}_x64.dmg"
    end

    name "Plume"
    desc "Modern, fast, and intelligent image compression desktop app"
    homepage "https://github.com/Axiome-Apps/Plume"

    app "Plume.app"

    postflight do
      system_command "/usr/bin/xattr",
                     args: ["-dr", "com.apple.quarantine", "#{appdir}/Plume.app"],
                     sudo: false
    end

    zap trash: [
      "~/Library/Application Support/com.axiome.plume",
      "~/Library/Preferences/com.axiome.plume.plist",
      "~/Library/Caches/com.axiome.plume",
    ]
  end
