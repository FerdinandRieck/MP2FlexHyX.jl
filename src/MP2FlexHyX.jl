module MP2FlexHyX
    using DifferentialEquations, NLsolve, Plots
    using TerminalLoggers
    using Dates
    using LinearAlgebra
    using SparseArrays
    import JSON

    dir = dirname(@__FILE__)

    #-- Event-Funktion einfügen
    if ispath(pwd()*"/Events/")
        pfad = filter(contains(r".jl$"), readdir(pwd()*"/Events/";join=true))
        include.(pfad)
    end
    
    #-- Funktionen einfügen
    pfad = filter(contains(r".jl$"), readdir(dir*"/Funktionen/";join=true))
    include.(pfad)

    #-- Knoten einfügen
    pfad = filter(contains(r".jl$"), readdir(dir*"/Komponenten/Knoten/";join=true))
    include.(pfad)

    #-- Kanten einfügen
    pfad = filter(contains(r".jl$"), readdir(dir*"/Komponenten/Kanten/";join=true))
    include.(pfad)
    
    #=
    #-- Typenhierarchie anzeigen
    using AbstractTrees
	AbstractTrees.children(x::Type) = subtypes(x)
    print_tree(flexhyx)
    =#

    #-- Funktionen exportieren
    export solveNetzwerk
    export plotSol
 end

#=
Aktuelle Bugs:
- Eventfunktion muss aktuell noch in solveNetzwerk Funktion oben includiert werden
- leichte unterschiede der Eventzeitpunkte von Matlab und JULIA mit Zeitreihe
=#