# Introduction to Machine Learning

1. Build a docker image
	```
	docker build -t introduction-into-machine-learning .
	```
1. Start a Jupyter server
    ```
    docker run --rm -p 8888:8888 -v "$PWD":/home/jovyan/work introduction-into-machine-learning:latest
    ```
1. Open Jupyter by following the last link from the logs
    ```
    To access the notebook, open this file in a browser:
            file:///home/jovyan/.local/share/jupyter/runtime/nbserver-6-open.html
        Or copy and paste one of these URLs:
            http://df29e6f4fe60:8888/?token=<random-string>
         or http://127.0.0.1:8888/?token=<random-string>
    ```
1. In Jupyter open `work/presentation.ipynb` notebook
1. Choose `Run All Cells` from the `Run` menu to render all outputs