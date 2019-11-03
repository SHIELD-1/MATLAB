function [ edge ] = PrewittOperator( pic )
    edge = uint8(zeros(size(pic))); % ��uint8�����洢��ȡ��ı���Ե����

    h = size(pic, 1); % ��
    w = size(pic, 2); % ��

    gx = [-1, -1, -1; 0, 0, 0; 1, 1, 1]; %ˮƽ��Ե���Sobel���ӣ�����ˣ� gx
    gy = gx';                            %ˮƽ��Ե���Sobel���ӣ�����ˣ� gy

    for i = 2 : h - 1
        for j = 2 : w - 1
            sub = double(pic(i - 1 : i + 1, j - 1 : j + 1)); % 3*3��������
            g1 = abs(sum(sum(sub .* gx))); % ˮƽ�ݶ� Gx
            g2 = abs(sum(sum(sub .* gy))); % ��ֱ�ݶ� Gy
            if g1 > g2          %ѡȡ�߽����������Եķ���
                edge(i, j) = uint8(g1); %ת������
            else
                edge(i, j) = uint8(g2);
            end
        end
    end
end
