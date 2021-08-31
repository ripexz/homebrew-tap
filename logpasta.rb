class Logpasta < Formula
  desc "Simple CLI for logpasta.com"
  homepage "https://www.logpasta.com/"
  url "https://github.com/ripexz/logpasta/archive/v0.3.3.tar.gz"
  sha256 "7269b67fc62a766145e9efc93d45dadbfd62a4b57d42ea476c48ca5a2a9a3aed"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath

    bin_path = buildpath/"src/github.com/ripexz/logpasta"

    # Copy all files from their current location (GOPATH root)
    # to $GOPATH/src/github.com/ripexz/logpasta
    bin_path.install Dir["*"]

    cd bin_path do
      system "go", "build", "-o", bin/"logpasta", "."
    end
  end

  test do
    assert_match "Logpasta CLI v0.3.3", shell_output("#{bin}/logpasta version 2>&1")
  end
end
