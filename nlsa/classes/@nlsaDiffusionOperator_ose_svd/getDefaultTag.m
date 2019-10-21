function tag = getDefaultTag( obj )
% GETDEFAULTTAG  Get default tag of nlsaDiffusionOperator_ose_svd objects
%
% Modified 2018/06/15

tag = sprintf( 'alpha%1.2f_eps%1.2g_svd_nPhi%i', ...
                                               getAlpha( obj ), ...
                                               getEpsilon( obj ), ...
                                               getNEigenfunction( obj ) );