class Ddev < Formula
  desc "ddev: a local development environment management system"
  homepage "https://ddev.readthedocs.io/en/latest/"
  url "https://github.com/drud/ddev/releases/download/v1.1.0/ddev_macos.v1.1.0.tar.gz"
  sha256 "8b0e6cd2556a8cec352cc697febdeb132c706c34c4bf272c1478a291e3ff17af"

  # Dependencies don't currently seem to be useful since people likely will not have
  # used brew to install docker.
  # depends_on "docker" => :run
  # depends_on "docker-compose" => :run

  def install
    system "mkdir", "-p", "#{bin}"
    system "cp", "ddev", "#{bin}/ddev"
    bash_completion.install "ddev_bash_completion.sh" => "ddev"
  end

  def caveats
  <<~EOS
ddev requires docker and docker-compose.
You can install them with "brew cask install docker"
or from the docker.com website.
  EOS
  end

  test do
    system "#{bin}/ddev", "version"
  end
end


