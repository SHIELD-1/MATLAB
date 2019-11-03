function [edge] = RobertsOperator(pic)
% edge：图像边缘，pic：图像矩阵
edge = uint8(zeros(size(pic))); % 用uint8类型矩阵存储提取后的边缘数据

    h = size(pic, 1); % 高
    w = size(pic, 2); % 宽

    for i = 1 : h-1
        for j = 1 : w-1
            %Roberts算子 G[F(x,y)]
            edge(i, j) = uint8(abs(pic(i, j) - pic(i + 1, j + 1)) + abs(pic(i, j + 1) - pic(i + 1, j)));
        end
    end

end
