cask "plume" do
    version "0.3.0"

    on_arm do
      sha256 "64767f9cb9c6a60f0faa67b9c2aec031d75566367c8cea6137e8e154d15ae0e8"
      url "https://github.com/Axiome-Apps/Plume/releases/download/v#{version}/Plume_#{version}_aarch64.dmg"
    end

    on_intel do
      sha256 "b4ecc394fe8d4b0ee17d2a874f45e5af93ab9c7989af9ff7e5be02b42c5e53b6"
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
