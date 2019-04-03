function [negLP,dLP,H] = computePosterior(w0,X,Y,fnlin,lfunc,Cinv)
%COMPUTEPOSTERIOR Summary of this function goes here
%   Detailed explanation goes here


% switch nargout
%     case 1  % evaluate function
%         negLP = LLfun(w0,X,Y,fnlin) + .5*w0'*Cinv*w0;
%     
%     case 2  % evaluate function and gradient
%         [negLP,dLP] = LLfun(w0,X,Y,fnlin);
%         negLP = negLP + .5*w0'*Cinv*w0;        
%         dLP = dLP + Cinv*w0;
% 
%     case 3  % evaluate function and gradient
%         [negLP,dLP,H] = LLfun(w0,X,Y,fnlin);
%         negLP = negLP + .5*w0'*Cinv*w0;        
%         dLP = dLP + Cinv*w0;
%         H = H + Cinv;
% end

nprs = size(Cinv,1); % number of parameters in C
preg = w0(1:nprs);  % parameters being regularized.

switch nargout

    case 1  % evaluate function
        negLP = lfunc(w0,X,Y,fnlin) + .5*preg'*Cinv*preg;
    
    case 2  % evaluate function and gradient
        [negLP,dLP] = lfunc(w0,X,Y,fnlin);
        negLP = negLP + .5*preg'*Cinv*preg;        
        dLP(1:nprs) = dLP(1:nprs) + Cinv*preg;

    case 3  % evaluate function and gradient
        [negLP,dLP,H] = lfunc(w0,X,Y,fnlin);
        negLP = negLP + .5*preg'*Cinv*preg;        
        dLP(1:nprs) = dLP(1:nprs) + Cinv*preg;
        H(1:nprs,1:nprs) = H(1:nprs,1:nprs) + Cinv;
end

end

