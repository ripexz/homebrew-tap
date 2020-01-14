# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Logpasta < Formula
    desc "Simple CLI for logpasta.com"
    homepage "https://www.logpasta.com/"
    url "https://github.com/ripexz/logpasta/archive/v0.3.2.tar.gz"
    sha256 "7659e00e3a2f57b572a57f6d4170b4ebd1829cca3ff1fd12b2a6c976668e8210"
  
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
      assert_match "Logpasta CLI v0.3.2", shell_output("#{bin}/logpasta version 2>&1")
    end
  end
  