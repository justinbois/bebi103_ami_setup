sudo yum -y update;
sudo yum -y install git;
sudo yum -y groupinstall "Development Tools";
wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh;
bash ./miniconda.sh -b -p $HOME/miniconda;
export PATH="$HOME/miniconda/bin:$PATH";
echo 'export PATH="$HOME/miniconda/bin:$PATH"' >> ~/.bashrc;
source ~/.bashrc;
conda update -q -y conda;
conda install -y numpy cython;
conda config --add channels conda-forge;
conda config --add channels defaults;
conda install -y scipy pandas numba scikit-image scikit-learn statsmodels bokeh altair arviz watermark tqdm matplotlib seaborn ipython jupyter jupyterlab nodejs xarray netcdf4 awscli;
conda install -y -c pyviz holoviews datashader;
pip install pystan;
pip install altair-catplot;
pip install bebi103;
jupyter labextension install --no-build jupyterlab_bokeh;
jupyter labextension install --no-build @ijmbarr/jupyterlab_spellchecker;
jupyter labextension install --no-build @jupyter-widgets/jupyterlab-manager;
jupyter labextension install --no-build @pyviz/jupyterlab_pyviz;
jupyter lab build;
echo 'export PS1="\[\e[1;32m\]\u\[\e[0m\]@\e[1;36m\]\h\[\e[0m\] [\w]\n% "' >> ~/.bashrc;
echo 'alias rm="rm -i"' >> ~/.bashrc;
echo 'alias mv="mv -i"' >> ~/.bashrc;
echo 'alias cp="cp -i"' >> ~/.bashrc;
echo 'alias ls="ls -FGh"' >> ~/.bashrc;
echo 'export LSCOLORS="gxfxcxdxCxegedabagacad"' >> ~/.bashrc;
# wget https://s3.amazonaws.com/bebi103.caltech.edu/2018/data/data.tar;
# tar -xvf data.tar;
# rm ./data.tar;
