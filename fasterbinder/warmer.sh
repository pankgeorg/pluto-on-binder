#!/bin/bash

date

free

echo "== warmup start =="
# ! means that it is allowed to fail
! julia -e "import Pkg; Pkg.activate($(pwd)); Pkg.instantiate(); Pkg.API.precompile();"
echo $(pwd)
! julia --project=$(pwd) --trace-compile="precompile.jl" notebook.jl
echo "== warmup done =="
! wc -l precompile.jl
echo ""

free

julia <<__EOF__
import Pkg
Pkg.activate(mktempdir())
Pkg.add(Pkg.PackageSpec(name="PackageCompiler"))
using PackageCompiler
Pkg.activate(".")
proj = Pkg.API.project();
pkgs = Symbol.(keys(proj.dependencies))
proj.ispackage && push!(pkgs, Symbol(proj.name));
running = Ref(true)
@async while running[]
    @info "Still alive!"
    try run(Cmd(["date"])) catch end
    try rm(download("https://julialang.org/")) catch end
    sleep(10)
end
create_sysimage(pkgs, precompile_statements_file="precompile.jl"; sysimage_path="notebook_sysimage.so", cpu_target="x86_64")
running[] = false
__EOF__

ls -lha notebook_sysimage.so
