# pluto-on-binder / make a fast pluto sysimage for a notebook

This repo includes some scripts to create a dockerfile with a precompiled sysimage
for a notebook.

## Basic usage

1. change `Manifest.toml` `Project.toml` and `notebook.jl` with yours


## Advanced usage

1. change `Manifest.toml` `Project.toml` and `notebook.jl` with yours
2. add extra steps in `postBuild`: that will be used when you build the image
3. customize the `runpluto.sh` file to adjust how pluto will be invoked

### When to change `postBuild`

- Use a different Pluto version
- Add more packages for Pluto
- Add sysimage creation for Pluto/change default sysimage

### When to change `runpluto.sh`

- When you want to change how julia is being invoked, e.g. 
  - remove `--optimize=0` - not suggested for binder)
  - add `-Jplutosysimage` for a sysimage you just created for Pluto
- When you want to customize Pluto.run arguments
  - Different notebook `sysimage` (default: `notebook_sysimage.so`)

Note: Host & Port are mostly managed by jupyter in this setting (we're starting this image from `jupyter/datascience-notebook`)

