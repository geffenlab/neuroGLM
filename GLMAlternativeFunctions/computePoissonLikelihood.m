function [logli,dL,H] = computePoissonLikelihood(w0,X,Y,fnlin)
%COMPUTEPOISSONLIKELIHOOD Summary of this function goes here
%   Detailed explanation goes here


y_lin = X * w0;
y_hat = fnlin(y_lin);
bsps = Y > 0;

Trm1 = sum(y_hat);  % non-spike term
Trm2 = -sum(y_lin(bsps)); % spike term
logli = Trm1 + Trm2;


if nargout > 1
    dL = -X' * (bsps - y_hat);
end

if nargout > 2
    H =  X' * spdiags(y_hat,0,length(y_hat),length(y_hat)) * X;
end

end

