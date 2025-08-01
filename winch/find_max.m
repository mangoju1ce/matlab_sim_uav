arr = out.T_hook.Data;
magnitudes = sqrt(sum(arr.^2, 2));
[max_val, idx] = max(magnitudes);
max_vector = arr(idx, :);

fprintf('最大模长为 %.4f，对应向量为 [%.2f, %.2f], 角度是%.2f度\n', max_val, max_vector ...
        ,atan2d(max_vector(2),max_vector(1) ) );
