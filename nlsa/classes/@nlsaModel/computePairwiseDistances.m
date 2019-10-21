function computePairwiseDistances( obj, iProc, nProc, varargin )
% COMPUTEPAIRWISEDISTANCES Compute pairwise distances of nlsaModel
% 
% Modified 2015/11/17

if nargin == 1
    iProc = 1;
    nProc = 1;
end

dData     = nlsaLocalDistanceData( 'component', getEmbComponent( obj ) ); 
pDistance = getPairwiseDistance( obj );
nB = getNTotalBatch( pDistance );

pPartition = nlsaPartition( 'nSample', nB, ...
                            'nBatch',  nProc );
iBLim      = getBatchLimit( pPartition, iProc );

logFile = sprintf( 'dataY_%i-%i.log', iProc, nProc );


computePairwiseDistances( pDistance, dData, ...
                          'batch',   iBLim( 1 ) : iBLim( 2 ), ...
                          'logPath', getDistancePath( pDistance ), ...
                          'logFile', logFile, ...
                          varargin{ : } );