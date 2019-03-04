function [u,t] = lqr_performance_analysis(simout_u,simout_x)
    l = size(simout_u.time);
    u = 0;
    t = 0;
    for i=1:l
        x = simout_x.signals.values(:,:,i);
        if abs(x)>=0.1
            u = u + simout_u.signals.values(:,:,i);
            t = simout_u.time(i);
        else
            break
        end
    end
end