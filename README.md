# jupyter-docker
Set of different tools around jupyter to run notebooks in docker.

## installed software
* python3.
* [jupyter](http://jupyter.org) to run notebooks.

## run
To start notebook simply run:
```
docker run -it -p 8888:8888 vistrcm/jupyter-docker
```
## working directory
/notebooks is default working directory

## Notebook password
Notebook password set in `NOTEBOOK_PASSWORD` environment variable. This is hashed value.

To generate hash for notebook, you can use next python code :
```
from notebook.auth import passwd; passwd()
```

Default password is D0N0tUseThIsPa$$w0rd.
