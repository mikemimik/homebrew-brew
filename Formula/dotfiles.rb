class Dotfiles < Formula
    desc "Everything you need to get started with a new computer with dotfiles"
    homepage "https://github.com/mikemimik/dotfiles"
    url "https://github.com/mikemimik/dotfiles/releases/download/v0.1.5/dotfiles-v0.1.5-darwin-x64.tar.gz"
    sha256 "9d2fc96bd68cb0ae9f30ff8a468d703a6021851c47155abb34b4b9daeaf85686"
    depends_on "mikemimik/brew/dotfiles-node"

    def install
      inreplace "bin/dotfiles", /^CLIENT_HOME=/, "export MIKEMIMIK-CLI_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
      inreplace "bin/dotfiles", "\"$DIR/node\"", "#{Formula["dotfiles-node"].opt_share}/node"
      libexec.install Dir["*"]
      bin.install_symlink libexec/"bin/dotfiles"

    #   bash_completion.install "#{libexec}/node_modules/@heroku-cli/plugin-autocomplete/autocomplete/brew/bash"
    #   zsh_completion.install "#{libexec}/node_modules/@heroku-cli/plugin-autocomplete/autocomplete/brew/zsh/_bid"
    end

    def caveats; <<~EOS
      To use the bid CLI's autocomplete --
        Via homebrew's shell completion:
          1) Follow homebrew's install instructions https://docs.brew.sh/Shell-Completion
              NOTE: For zsh, as the instructions mention, be sure compinit is autoloaded
                    and called, either explicitly or via a framework like oh-my-zsh.
          2) Then run
            $ dotfiles autocomplete --refresh-cache
        OR
        Use our standalone setup:
          1) Run and follow the install steps:
            $ dotfiles autocomplete
    EOS
    end

    test do
      system bin/"dotfiles", "version"
    end
  end
