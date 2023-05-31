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
    elseif ispath(pwd()*"/src/Events/")
        pfad = filter(contains(r".jl$"), readdir(pwd()*"/src/Events/";join=true))
        include.(pfad)
    end
    
    #-- Funktionen einfügen
    pfad = filter(contains(r".jl$"), readdir(dir*"/Funktionen/";join=true))
    include.(pfad)

    #-- Knoten einfügen
    pfad = filter(contains(r".jl$"), readdir(dir*"/Komponenten/Knoten/";join=true))
    include.(pfad)
    if ispath(pwd()*"/Komponenten/Knoten/")
        pfad = filter(contains(r".jl$"), readdir(pwd()*"/Komponenten/Knoten/";join=true))
        include.(pfad)
    end

    #-- Kanten einfügen
    if ispath(pwd()*"/src/Komponenten/Kanten/")
        pfad = filter(contains(r".jl$"), readdir(dir*"/Komponenten/Kanten/";join=true))
        include.(pfad)
    end
    if ispath(pwd()*"/Komponenten/Kanten/")
        pfad = filter(contains(r".jl$"), readdir(pwd()*"/Komponenten/Kanten/";join=true))
        include.(pfad)
    end
    
    #=
    #-- Typenhierarchie anzeigen
    using AbstractTrees
	AbstractTrees.children(x::Type) = subtypes(x)
    print_tree(flexhyx)
    =#

    #-- Funktionen exportieren
    export solveNetzwerk
    export plotSol

    #idx_ele, sol, y = solveNetzwerk(dir)
    #plotSol(y,sol.t)
 end

#=
Aktuelle Bugs:
- Eventfunktion muss aktuell noch in solveNetzwerk Funktion oben includiert werden
- leichte unterschiede der Eventzeitpunkte von Matlab und JULIA mit Zeitreihe
=#