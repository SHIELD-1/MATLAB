function [edge] = RobertsOperator(pic)
% edge��ͼ���Ե��pic��ͼ�����
edge = uint8(zeros(size(pic))); % ��uint8���;���洢��ȡ��ı�Ե����

    h = size(pic, 1); % ��
    w = size(pic, 2); % ��

    for i = 1 : h-1
        for j = 1 : w-1
            %Roberts���� G[F(x,y)]
            edge(i, j) = uint8(abs(pic(i, j) - pic(i + 1, j + 1)) + abs(pic(i, j + 1) - pic(i + 1, j)));
        end
    end

end
