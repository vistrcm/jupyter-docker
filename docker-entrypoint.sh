#!/bin/bash
jupyter notebook --no-browser --ip=0.0.0.0 --NotebookApp.password=${NOTEBOOK_PASSWORD}
