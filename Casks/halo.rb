cask "halo" do
  version "0.1.0"
  sha256 "c42bb1b019773fbc9b89743dbde08e5410f467c1a6ceb4fbcca7fdbece95181d"

  url "https://github.com/likhithrajuuu/halo/releases/download/v#{version}/Halo_#{version}_universal.dmg"
  name "Halo"
  desc "Calm focus timer with a menu bar countdown, tasks and statistics"
  homepage "https://halo.likhithraju.tech/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :big_sur"

  app "Halo.app"

  # Halo is not yet notarized by Apple, so clear the download quarantine flag
  # to let it open without the one-time Gatekeeper prompt.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Halo.app"],
                   must_succeed: false
  end

  zap trash: [
    "~/Library/Application Support/com.likhithrajup.halo-timer",
    "~/Library/Caches/com.likhithrajup.halo-timer",
    "~/Library/WebKit/com.likhithrajup.halo-timer",
    "~/Library/Saved Application State/com.likhithrajup.halo-timer.savedState",
  ]
end
