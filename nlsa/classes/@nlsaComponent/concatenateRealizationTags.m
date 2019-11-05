function tag = concatenateRealizationTags( obj )
% CONCATENATEREALIZATIONTAGS Concatenate realization tags of a matrix of 
% nlsaComponent objects
%
% Modified 2019/11/05

nR = size( obj, 2 );
tag  = cell( 1, nR );
for iR = 1 : nR
    tag{ iR } = getRealizationTag( obj( 1, iR ) );
end
tag = strjoin_e( tag, '_' );
