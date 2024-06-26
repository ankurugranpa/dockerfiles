# my docker files
プロジェクトに直接紐づけていないDokerfileとSingularityfileをおいておくリポジトリ

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
