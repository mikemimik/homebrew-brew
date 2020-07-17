class BidNode < Formula
    desc "node.js dependency for bidvine-cli"
    homepage "https://cli.bdv.im"
    url "https://cli-assets.bdv.im/homebrew/node-12.16.1.tar.xz"
    sha256 "{{replace-with-checksum}}"
  
    def install
      share.install buildpath/"node"
    end
  
    # def test
    #   system bin/"node", "version"
    # end
  end