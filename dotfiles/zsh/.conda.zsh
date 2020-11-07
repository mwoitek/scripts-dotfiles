# COMANDOS PARA USAR OS RECURSOS DO CONDA.

if [ -f "/home/woitek/miniconda3/etc/profile.d/conda.sh" ]; then
    . "/home/woitek/miniconda3/etc/profile.d/conda.sh"
fi
# __conda_setup="$('/home/woitek/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/home/woitek/miniconda3/etc/profile.d/conda.sh" ]; then
#         . "/home/woitek/miniconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/home/woitek/miniconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup

# Função para ativar um ambiente do conda:
aconda () {
    conda activate "$1"
    export CONDA_ACTIVE=" [%BCONDA --- $2 ($1)%b]"
}

# Função para desativar um ambiente do conda:
dconda () {
    conda deactivate
    export CONDA_ACTIVE=""
}
