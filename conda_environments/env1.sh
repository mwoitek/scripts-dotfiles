#!/bin/bash
conda config --append channels conda-forge
conda create --name env1 python
ac-py
conda install pip
conda install pytest
pip install pynvim
pip install neovim-remote
conda install notedown
conda install matplotlib
conda install numpy
conda install pandas
conda install xlrd
conda install scikit-learn
conda install jupyter
jupyter notebook --generate-config
# conda install jupytext
pip install tensorflow
# conda install pillow
# pip install pyspark
# conda install seaborn
# conda install unidecode
dc
