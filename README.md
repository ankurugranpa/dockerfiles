# my docker files
プロジェクトに直接紐づけていないDokerfileとSingularityfileをおいておくリポジトリ
[DockerHub](https://hub.docker.com/u/ankuru)

- docker build
```
// ls Dokerfile
docker build . -t container:tagname

```
- singularity build
```
// ls singularityfile
singularity build container.sif singularityfile

```
