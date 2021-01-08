# pluto-on-binder binder consumer branch

This looks like a cryptic binder repo but it's not!!!
Following [these instructions](https://discourse.jupyter.org/t/how-to-reduce-mybinder-org-repository-startup-time/4956), we just implement the first step of the dockerfile here!!

## This sounds sketchy, can you say more?

- This [workflow](https://github.com/pankgeorg/pluto-on-binder/blob/static-to-live-3-binder/.github/workflows/workflow.yaml) creates and pushes a docker image having pluto-on-binder as a starting point
- The same workflow creates this cryptic `FROM` statement in this branch, to have the latest build (without the `latest` tag!!)

## Why are you doing this?

- To make pluto-on-binder launch faster
- To use this image as a FROM base to add more steps (that are also notebook-specific) and create a second Dockerfile for fast loads specialized for a notebook!!


still not clear? mail me:

pankgeorg@gmail.com
