cask "plume" do
    version "0.6.0"

    on_arm do
      sha256 "6a1b36cac31246786ef13688c798538a7d96a8798eee76644de518cb0fac1660"
      url "https://github.com/Axiome-Apps/Plume/releases/download/v#{version}/Plume_#{version}_aarch64.dmg"
    end

    on_intel do
      sha256 "fc6675c9551a9fee08580c554026dce65fe08db8cd80ebfd931c38902637c292"
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
