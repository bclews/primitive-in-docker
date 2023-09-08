This Docker image has been made to encapsulate [primitive](https://github.com/fogleman/primitive), a command-line application designed to reproduce images with geometric primitives.

## Build the Docker Image

To build the Docker image, navigate to the directory containing the Dockerfile and execute the following command:

```bash
docker build -t primitive-docker .
```

This command builds a Docker image using the Dockerfile in the current directory and tags it as `primitive-docker`.

## Interact with the Application

You can interact with the `primitive` application as you would normally. Refer to the `primitive` [GitHub page](https://github.com/fogleman/primitive) for details on how to use the application.

For example, to view help:

```bash
➜  docker run docker-primitive:latest --help                                                                                                                                    

Usage of primitive:
  -a int
        alpha value (default 128)
  -bg string
        background color (hex)
  -i string
        input image path
  -j int
        number of parallel workers (default uses all cores)
  -m int
        0=combo 1=triangle 2=rect 3=ellipse 4=circle 5=rotatedrect 6=beziers 7=rotatedellipse 8=polygon (default 1)
  -n value
        number of primitives
  -nth int
        save every Nth frame (put "%d" in path) (default 1)
  -o value
        output image path
  -r int
        resize large input images to this size (default 256)
  -rep int
        add N extra shapes per iteration with reduced search
  -s int
        output image size (default 1024)
  -v    verbose
  -vv
        very verbose
```

To process an image with 1000 triangles with a verbsose output:
```bash
docker run -v $(pwd)/primitive:/primitive docker-primitive:latest -i app/input/lemur.jpg -o app/output/lemur.jpg -n 1000 -m 1 -v
```

## Contact
Please note that this Docker image is a containerised version of the [primitive](https://github.com/fogleman/primitive) application. For issues related to the application itself, please refer to the [primitive](https://github.com/fogleman/primitive) GitHub page.

## Acknowledgements:
- [Primitive](https://github.com/fogleman/primitive) created by [@fogleman](https://github.com/fogleman).
- [Lemur](app/input/lemur.jpg) photo by <a href="https://unsplash.com/@edgar_infocus?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Edgar.infocus</a> on <a href="https://unsplash.com/photos/a-close-up-of-a-small-animal-with-orange-eyes-R1nQaXqYMus?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Unsplash</a>.
  
