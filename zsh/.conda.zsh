# COMANDOS PARA USAR OS RECURSOS DO CONDA.

[ -f "${HOME}/miniconda3/etc/profile.d/conda.sh" ] && source "${HOME}/miniconda3/etc/profile.d/conda.sh" 2> /dev/null
[ -f /opt/conda/etc/profile.d/conda.sh ] && source /opt/conda/etc/profile.d/conda.sh 2> /dev/null

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
