class Goo < Formula
  desc "GPU particle simulation where particles follow each other's trails"
  homepage "https://github.com/lczyk/pixel-goo"
  url "https://github.com/lczyk/pixel-goo/archive/refs/tags/v1.3.0.tar.gz"
  sha256 "2375bf79e90bd3022a65c66a2b85dbbf50f55b300a66e223299231d9d8e3c0b9"

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
