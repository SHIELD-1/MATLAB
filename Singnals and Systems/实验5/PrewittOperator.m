function [ edge ] = PrewittOperator( pic )
    edge = uint8(zeros(size(pic))); % 用uint8类矩阵存储提取后的边型缘数据

    h = size(pic, 1); % 高
    w = size(pic, 2); % 宽

    gx = [-1, -1, -1; 0, 0, 0; 1, 1, 1]; %水平边缘检测Sobel算子（卷积核） gx
    gy = gx';                            %水平边缘检测Sobel算子（卷积核） gy

    for i = 2 : h - 1
        for j = 2 : w - 1
            sub = double(pic(i - 1 : i + 1, j - 1 : j + 1)); % 3*3像素区域
            g1 = abs(sum(sum(sub .* gx))); % 水平梯度 Gx
            g2 = abs(sum(sum(sub .* gy))); % 垂直梯度 Gy
            if g1 > g2          %选取边界轮廓更明显的方向
                edge(i, j) = uint8(g1); %转换类型
            else
                edge(i, j) = uint8(g2);
            end
        end
    end
end
