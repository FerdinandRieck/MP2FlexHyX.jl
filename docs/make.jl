using MP2FlexHyX
using Documenter

DocMeta.setdocmeta!(MP2FlexHyX, :DocTestSetup, :(using MP2FlexHyX); recursive=true)

makedocs(;
    modules=[MP2FlexHyX],
    authors="Ferdinand Rieck <ferdinand.rieck@smail.emt.h-brs.de>",
    repo="https://github.com/FerdinandRieck/MP2FlexHyX.jl/blob/{commit}{path}#{line}",
    sitename="MP2FlexHyX.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)
