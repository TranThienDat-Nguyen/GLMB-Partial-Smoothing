function m_s = erts_smooth_estimate(model,w,m,P,w_s_p,m_s_p)
% Only pick the maximum components to smooth (since I only smooth the estimate)
[~,ii] = max(w) ; 
[~,jj] = max(w_s_p) ;
% Prediction
m_predict = gen_newstate_fn(model,m(:,ii),'noiseless');
[F_ekf,G_ekf]= ekf_predict_mat(model,m(:,ii));
P_predict = F_ekf * P(:,:,ii) * F_ekf + G_ekf*model.Q*G_ekf' ;
% Linear smoothing
D = P(:,:,ii) * F_ekf' / P_predict ;  
m_s = m(:,ii) + D*(m_s_p(:,jj) - m_predict) ; 