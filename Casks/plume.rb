cask "plume" do
    version "0.5.0"

    on_arm do
      sha256 "7eb42b2c4d70e974bb6d8b8e071912aa81e51530d1d43ee58ef65205dcd9e467"
      url "https://github.com/Axiome-Apps/Plume/releases/download/v#{version}/Plume_#{version}_aarch64.dmg"
    end

    on_intel do
      sha256 "db9932d2cb3e9dc12093151ca789ad00ba1974e1664ae17a959192a98df35dc2"
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
