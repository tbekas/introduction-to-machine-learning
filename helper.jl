using PyPlot, Reactive, Interact

range0 = -300:10:300
range1 = -3:0.1:3
len0 = length(range0)
len1 = length(range1)

function gen_samples(m)
    X = collect(linspace(50,200,m))
    Y = 1.5 * X + 100 + (rand(m) - 0.5) * 50
    (round(X), round(Y))
end

function plot_samples(X, Y)
    f = figure()
    
    @manipulate for  θ0=range0, θ1=range1; withfig(f) do
            plot(X, Y, "rx")
            plot([25,225], θ0 + θ1 * [25,225])
            axis([25, 225, 150, 500])
            xlabel("House size in m^2")
            ylabel("House price in 1000\$")
        end
    end
end

function plot_cost(J)
    AllJ = Matrix(len0, len1)
    for i=1:len0, j=1:len1
        AllJ[i,j] = J([range0[i], range1[j]])
    end

    contourf(range1, range0, AllJ, locator=matplotlib[:ticker][:LogLocator](base=e));
    xlabel("θ0")
    ylabel("θ1")
end