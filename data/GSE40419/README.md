# README

Get metadata using `ffq`.

```console
ffq GSE40419 > GSE40419.json
```

Create runs JSON.

```console
cat GSE40419.json| jq '.[].geo_samples[].samples[].experiments[].runs[].files.ftp[]' > GSE40419_runs.json
```

File size sum

```console
cat GSE40419_runs.json | jq '.filesize' | perl -nle '$SUM += $_; END { print $SUM }'
```
```
1179997399254
```
