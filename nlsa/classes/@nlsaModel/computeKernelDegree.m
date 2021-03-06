function computeKernelDegree( obj, iProc, nProc, varargin )
% COMPUTEKERNELDEGREE Compute kernel degree of nlsaModel objects  
% 
% Modified 2014/06/24


if nargin == 1
    iProc = 1;
    nProc = 1;
end

sDistance = getSymmetricDistance( obj );
diffOp    = getDiffusionOperator( obj );
nB        = getNTotalBatch( getPartition( diffOp ) );

pPartition = nlsaPartition( 'nSample', nB, ...
                            'nBatch',  nProc );
iBLim      = getBatchLimit( pPartition, iProc );

logFile = sprintf( 'dataD_%i-%i.log', iProc, nProc );

computeDegree( diffOp, sDistance, ...
               'batch',   iBLim( 1 ) : iBLim( 2 ), ...
               'logPath', getDegreePath( diffOp ), ...
               'logFile', logFile, ...
               varargin{ : } );
