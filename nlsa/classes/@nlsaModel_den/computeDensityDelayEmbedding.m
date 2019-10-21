function computeDensityDelayEmbedding( obj, iProcCD, nProcCD, iProcR, nProcR )
% COMPUTEDENSITYDELAYEMBEDDING Lag-embed the density in an nlsaModel_den object
%
% Modified 2015/12/15

if nargin == 1
    iProcCD = 1;
    nProcCD = 1;
    iProcR = 1;
    nProcR = 1;
end

cmp = getDensityKernel( obj );
emb = getEmbDensity( obj );
[ nCD, nR ] = size( emb );

pPartitionCD = nlsaPartition( 'nSample', nCD, 'nBatch', nProcCD );
pPartitionR = nlsaPartition( 'nSample', nR, 'nBatch', nProcR );
iCDLim = getBatchLimit( pPartitionCD, iProcCD );
iRLim = getBatchLimit( pPartitionR, iProcR );

for iR = iRLim( 1 ) : iRLim( 2 )
    for iC = iCDLim( 1 ) : iCDLim( 2 )
        computeData( emb( iC, iR ), cmp( iC ) )
    end
end