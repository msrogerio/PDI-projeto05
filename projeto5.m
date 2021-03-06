%% Projeto 04
% *Autor:* Marlon da Silva Rogério

%% Referências
% *GONZALEZ, R. C.*, WOODS, R. E. Processamento de Imagens Digitais. 
% Editora Edgard Blucher, ISBN São Paulo, 2000.
% *Support MathWorks*, 2021. Disponível em: <https://www.mathworks.com/help/>.
% Acesso em: 31 de maio. de 2021.

close all; clear; clc;

%% 1 Redimensionamento e Reconstrução (Proposição)
% 1.1 Ler a imagem I = im2double(imread('Fig0507(a)(ckt-board-orig).tif'));
% 1.2 Reescalar com escala K | *imresize(I , k)*; 
% 1.3 Aplicar ruido imnoise | *( f , 'salt & pepper' , 0.5 )*;
% 1.4 Aplicar o filtro mediana utilizando matriz de [3 3], [5 5], [7 7] e 
%     [9 9] e outros | *medfilt2  ( g , matriz , 'symmetric' )*;
% 1.5 Aplicar o filtro mediana adaptativa (tamanho 9 ou outro) | adpmedian
% ( g , 9);
% 1.5.1 Visualizar e comentar o resultado da restauração do filtro mediana e
% filtro mediana adaptativa.

%% 2 Redimencionamento (Aplicação)
I = im2double(imread('Fig0507(a)(ckt-board-orig).tif'));
figure; 
subplot(1,2,1);
imshow(I,[]); 
title('Imagem Original');
subplot(1,2,2);
imhist(I);
title('Histograma da Img Original');
%%
for K=1:4
   img_reescalada = imresize(I , K);
   figure;
   imshow(img_reescalada);
   title(size(img_reescalada));
end

%% 3 Salt & Pepper (Aplicação)
sal_pimenta = imnoise(I, 'salt & pepper' , 0.5);
figure; 
subplot(2,2,1);
imshow(I,[]); 
title('Imagem Original');
subplot(2,2,2);
imhist(I);
title('Histograma da Img Original');
subplot(2,2,3);
imshow(sal_pimenta); 
title('Imagem Sal e Pimenta');
subplot(2,2,4);
imhist(sal_pimenta);
title('Histograma da Img Sal e Pimenta');


%% 3 Mediana (Aplicação)
% Considerar as matrizes [3 3], [5 5], [7 7] e [9 9]

for matriz = 3:2:9
    mediana = medfilt2(sal_pimenta, [matriz matriz],'symmetric');
    figure;
    imshow(mediana, []);
    title([matriz matriz]);
end

%% 3.1 Mediana (Aplicação) | Img 50% menor
i_menor = imresize(I, 0.5);
i_sal_pimenta = imnoise(i_menor, 'salt & pepper' , 0.5);

figure;
subplot(1,2,1);
imshow(i_menor);
subplot(1,2,2);
imshow(i_sal_pimenta);

for matriz = 3:2:9
    mediana = medfilt2(sal_pimenta, [matriz matriz],'symmetric');
    figure;
    imshow(mediana, []);
    title([matriz matriz]);
end

%% 4 Mediana Adaptativa (Aplicação)
mediana_adp = adpmedian(sal_pimenta, 9);
figure; 
subplot(2,2,1);
imshow(sal_pimenta,[]); 
title('Imagem Sal e Pimenta');
subplot(2,2,2);
imhist(sal_pimenta);
title('Histograma da Img Sal e Pimenta');
subplot(2,2,3);
imshow(mediana_adp); 
title('Imagem Mendiana Adaptativa');
subplot(2,2,4);
imhist(mediana_adp);
title('Histograma da Mendiana Adaptativa');


figure; 
subplot(2,2,1);
imshow(I,[]); 
title('Imagem Original');
subplot(2,2,2);
imhist(I);
title('Histograma da Original');
subplot(2,2,3);
imshow(mediana_adp); 
title('Imagem Mendiana Adaptativa');
subplot(2,2,4);
imhist(mediana_adp);
title('Histograma da Mendiana Adaptativa');

