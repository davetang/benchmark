# README

Get metadata using `ffq`.

```console
ffq GSE40419 > GSE40419.json
```

Create runs JSON.

```console
cat GSE40419.json| jq '.[].geo_samples[].samples[].experiments[].runs[].files.ftp[]' > GSE40419_runs.json
```

File size sum.

```console
cat GSE40419_runs.json | jq '.filesize' | perl -nle '$SUM += $_; END { print $SUM }'
```
```
1179997399254
```

Sample title to run accession lookup.

```console
cat GSE40419.json| jq '.[].geo_samples[].samples[] | {title: .title, run_accession: .experiments[].runs[].accession } ' | less > GSE40419_title.json
```

Select some runs.

```console
cat GSE40419_title.json | ./json_to_csv.pl | grep "C[123]$" | cut -f1 -d',' > runs.txt
```

Download.

```console
cat GSE40419_runs.json | ./json_to_csv.pl | grep -f runs.txt | cut -f7 -d',' | wget -i - -P fastq
```
