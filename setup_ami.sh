# Update instance and get git and development tools
sudo yum -y update;
sudo yum -y install git;
sudo yum -y groupinstall "Development Tools";

# Install miniconda
wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh;
bash ./miniconda.sh -b -p $HOME/miniconda;
export PATH="$HOME/miniconda/bin:$PATH";
echo 'export PATH="$HOME/miniconda/bin:$PATH"' >> ~/.bashrc;
source ~/.bashrc;

# Install packages
conda update -q -y conda;
conda install -y numpy cython;
conda install -y scipy pandas numba scikit-image scikit-learn statsmodels bokeh tqdm matplotlib seaborn ipython xlrd jupyter jupyterlab black nodejs xarray netcdf4 ujson h5py hypothesis;

# Uncomment to install sphinx packages for building course
# pip install recommonmark commonmark nbsphinx sphinx-rtd-theme

conda install -y -c pyviz holoviz;
pip install awscli;
pip install watermark;
pip install anndata;
pip install arviz;
pip install bokeh-catplot;
pip install bebi103;
pip install blackcellmagic;
pip install cmdstanpy;
python -c "import cmdstanpy; cmdstanpy.install_cmdstan(version='2.21.0')";

# No pystan, since we're using cmdstanpy
# pip install pystan;

# Set up Jupyter
jupyter labextension install --no-build @ijmbarr/jupyterlab_spellchecker;
jupyter labextension install --no-build @pyviz/jupyterlab_pyviz;
jupyter lab build;

# Clone the updater
git clone https://github.com/justinbois/bebi103_update.git;

# Configure bash
echo 'export PS1="\[\e[1;32m\]\u\[\e[0m\]@\e[1;36m\]\h\[\e[0m\] [\w]\n% "' >> ~/.bashrc;
echo 'alias rm="rm -i"' >> ~/.bashrc;
echo 'alias mv="mv -i"' >> ~/.bashrc;
echo 'alias cp="cp -i"' >> ~/.bashrc;
echo 'alias ls="ls --color -FGh"' >> ~/.bashrc;
echo 'export LSCOLORS="gxfxcxdxCxegedabagacad"' >> ~/.bashrc;
echo 'alias bebi103_update="~/bebi103_update/bebi103_update.sh"' >> ~/.bashrc;

# Get the data sets
wget https://s3.amazonaws.com/bebi103.caltech.edu/2020b/data.tar;
tar -xvf data.tar;
rm -f ./data.tar;

# Clean up miniconda
rm -f miniconda.sh;

# Final updates
conda update -y --all;

