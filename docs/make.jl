using NumericalTraining
using Documenter

DocMeta.setdocmeta!(NumericalTraining, :DocTestSetup, :(using NumericalTraining); recursive=true)

makedocs(;
    modules=[NumericalTraining],
    authors="Yusheng Zhao <yushengzhao2020@outlook.com> and contributors",
    sitename="NumericalTraining.jl",
    format=Documenter.HTML(;
        canonical="https://exAClior.github.io/NumericalTraining.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/exAClior/NumericalTraining.jl",
    devbranch="main",
)
