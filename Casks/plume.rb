cask "plume" do
    version "0.1.0"

    on_arm do
      sha256 "d8f7bd74e47fe3d614c3d59711730f9fd99d00b2639bff836307dd291a4f03b4"
      url "https://github.com/Axiome-Apps/Plume/releases/download/v#{version}/Plume_#{version}_aarch64.dmg"
    end

    on_intel do
      sha256 "74e74d1a19ab1fbb120036624c5046818f5e96b609f6797827025b22c7e48274"
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
