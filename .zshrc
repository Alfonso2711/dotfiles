# 1. Ayudante de Ubuntu (Te avisa cómo instalar programas si te faltan)
if [ -f /etc/zsh_command_not_found ]; then
    source /etc/zsh_command_not_found
fi

# 2. Inicializar el prompt Starship
eval "$(starship init zsh)"

# 3. Autocompletado y colores de Zsh
autoload -Uz compinit && compinit
export CLICOLOR=1

# 4. Sugerencias predictivas (En gris claro)
if [ -f ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# 5. Atajos de sistema seguros
alias ls="ls --color=auto"
alias c="clear"
alias update="sudo apt update && sudo apt upgrade -y"

# 6. Alias para Python (Vitales para tus simulaciones y scripts)
alias py="python3"
alias venv="python3 -m venv venv && source venv/bin/activate"

# 7. Alias para Docker (Descoméntalos cuando instales el motor)
# alias dco="docker compose"
# alias dps="docker ps --format 'table {{.Names}}\t{{.Status}}\t{{.Ports}}'"

# --- 3. Resaltado de sintaxis (Verde = Bien, Rojo = Mal) ---
# IMPORTANTE: Este siempre debe ser la ÚLTIMA línea de tu archivo .zshrc
if [ -f ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
export PATH="$HOME/.local/bin:$PATH"
export JUPYTER_RUNTIME_DIR=$HOME/.local/share/jupyter/runtime

eval "$(starship init zsh)"
#fastfetch
# --- Fastfetch solo en el primer inicio ---
if [[ ! -f /tmp/fastfetch_displayed ]]; then
    fastfetch
    touch /tmp/fastfetch_displayed
fi
