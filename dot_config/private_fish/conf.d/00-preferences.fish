set --global fish_greeting

# Skip directories that are not installed on this machine.
fish_add_path --global \
    "$HOME/.local/share/bob/nvim-bin" \
    "$HOME/Library/Java/JavaVirtualMachines/ms-21.0.10/Contents/Home/bin" \
    /opt/homebrew/anaconda3/bin \
    /opt/homebrew/opt/llvm/bin \
    "$HOME/.local/share/bob/v0.9.5/bin" \
    "$HOME/.local/share/bob/v0.9.5" \
    "$HOME/.local/share/bob" \
    "$HOME/.cargo/bin" \
    "$HOME/.npm-global/bin" \
    /opt/homebrew/opt/ruby/bin \
    "$HOME/.local/bin" \
    "$HOME/.antigravity/antigravity/bin" \
    "$HOME/Library/Application Support/JetBrains/Toolbox/scripts"
