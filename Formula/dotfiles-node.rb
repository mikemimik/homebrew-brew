class DotfilesNode < Formula
    desc "node.js dependency for dotfiles-cli"
    homepage "https://github.com/mikemimik/dotfiles"
    url "https://nodejs.org/dist/v14.15.4/node-v14.15.4-darwin-x64.tar.gz"
    sha256 "6b0e19e5c2601ef97510f7eb4f52cc8ee261ba14cb05f31eb1a41a5043b0304e"

    def install
      share.install buildpath/"node"
    end

    # def test
    #   system bin/"node", "version"
    # end
  end
