class Goo < Formula
  desc "GPU particle simulation where particles follow each other's trails"
  homepage "https://github.com/lczyk/pixel-goo"
  url "https://github.com/lczyk/pixel-goo/archive/refs/tags/v1.4.1.tar.gz"
  sha256 "e52fc80d1d1f14015b6ef45cf9e47bdd6b3553f15500d3cfa616c9dcead50d34"

  # linux (linuxbrew): the windowed binary links X11/Xrandr/GL and dlopens Xcursor/Xi.
  # macos needs nothing extra -- Cocoa/OpenGL are system frameworks.
  on_linux do
    depends_on "libx11"
    depends_on "libxcursor"
    depends_on "libxi"
    depends_on "libxrandr"
    depends_on "mesa"
  end

  def install
    # bake the version so `goo --version` works (nob reads GOO_VERSION at build time).
    ENV["GOO_VERSION"] = "v#{version}"
    system "sh", "nob.c", "build"
    bin.install "bin/goo"
    if OS.mac?
      # the macos desktop-wallpaper binary
      system "sh", "nob.c", "build-macwp"
      bin.install "bin/goo-macwp"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/goo --version")
  end
end
