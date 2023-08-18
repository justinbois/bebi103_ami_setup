# Update instance and get git and development tools
sudo yum -y update;
sudo yum -y install git;
sudo yum -y groupinstall "Development Tools";
sudo yum -y install gcc64-c++ libcurl-devel;

# Make sure have up-to-date compiler (no longer relevant on AWS, commented out)
# export CXX=g++64
# export CC=gcc64

# Install miniconda
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh;
bash ./miniconda.sh -b -p $HOME/miniconda;
export PATH="$HOME/miniconda/bin:$PATH";
echo 'export PATH="$HOME/miniconda/bin:$PATH"' >> ~/.bashrc;
source ~/.bashrc;

# Install nodejs
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash;
. ~/.nvm/nvm.sh;
nvm install node;

# Install packages
conda update -q -y conda;
conda install -y numpy cython;
conda install -y scipy pandas numba scikit-image scikit-learn statsmodels bokeh tqdm matplotlib seaborn ipython xlrd jupyter jupyterlab black xarray netcdf4 ujson h5py hypothesis;
conda install -y colorcet dask datashader fastparquet holoviews hvplot panel param selenium;
conda install -c -y bokeh jupyter_bokeh

# Uncomment to install sphinx packages for building course
# pip install recommonmark commonmark nbsphinx sphinx-rtd-theme sphinx-copybutton sphinx-togglebutton

pip install awscli;
pip install watermark;
pip install anndata;
pip install jupyterlab-spellchecker;
pip install jupytext;

pip install arviz;
pip install iqplot;
pip install bebi103;
pip install black;
pip install blackcellmagic;
pip install multiprocess;
pip install cmdstanpy;
python -c "import cmdstanpy; cmdstanpy.install_cmdstan()";

# No pystan, since we're using cmdstanpy
# pip install pystan;

# Clone the updater
git clone https://github.com/justinbois/bebi103_update.git;

# Configure bash
echo 'export PS1="\[\e[1;32m\]\u\[\e[0m\]@\e[1;36m\]\h\[\e[0m\] [\w]\n% "' >> ~/.bashrc;
echo 'alias rm="rm -i"' >> ~/.bashrc;
echo 'alias mv="mv -i"' >> ~/.bashrc;
echo 'alias cp="cp -i"' >> ~/.bashrc;
echo 'alias ls="ls -FGh"' >> ~/.bashrc;

# No longer necessary to specify compilers
# echo 'export CXX=g++64' >> ~/.bashrc;
# echo 'export CC=gcc64' >> ~/.bashrc;

echo 'export LSCOLORS="gxfxcxdxCxegedabagacad"' >> ~/.bashrc;
echo 'alias bebi103_update="~/bebi103_update/bebi103_update.sh"' >> ~/.bashrc;
source ~/.bashrc;

# Get the data sets

# No data set for now
wget https://s3.amazonaws.com/bebi103.caltech.edu/data.tar;
tar -xvf data.tar;
rm -f ./data.tar;

# Clean up miniconda
rm -f miniconda.sh;
