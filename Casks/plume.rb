cask "plume" do
    version "0.1.0"

    on_arm do
      sha256 "099d5ada630b603af76b7aec4635a17d9dd030777d89b1bd75bdbbf02b72bf6b"
      url "https://github.com/Axiome-Apps/Plume/releases/download/main/Plume_#{version}_aarch64.dmg"
    end

    on_intel do
      sha256 "1fe6569d8588966bbbd867fafdd1f52d18763b93f63b1de5467e33aa70d1d5d4"
      url "https://github.com/Axiome-Apps/Plume/releases/download/main/Plume_#{version}_x64.dmg"
    end

    name "Plume"
    desc "Modern, fast, and intelligent image compression desktop app"
    homepage "https://github.com/Axiome-Apps/Plume"

    app "Plume.app"

    zap trash: [
      "~/Library/Application Support/com.axiome.plume",
      "~/Library/Preferences/com.axiome.plume.plist",
      "~/Library/Caches/com.axiome.plume",
    ]
  end
