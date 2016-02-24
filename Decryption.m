ultimate_cipher_image = imread('pic/peppers_c_1.bmp');
N = 256; M = 256;


%% Encode ultimate cipher image %%
encoded_cipher_image_1 = zeros(N, M*4);

% CHECK x
x = md5_checksum;
%CHECK u
u = 3.99999999;
x = u * x * (1 - x);

for i = 1:N
    RULE = floor(7*x) + 1;
    x = u * x * (1 - x);
    
    switch RULE
    case 1
        %CHECK 
        encoded_cipher_image_1(i, :) = encode_by_row(1, ultimate_cipher_image(i, :));
    case 2
        encoded_cipher_image_1(i, :) = encode_by_row(2, ultimate_cipher_image(i, :));
    case 3
        encoded_cipher_image_1(i, :) = encode_by_row(3, ultimate_cipher_image(i, :));
    case 4
        encoded_cipher_image_1(i, :) = encode_by_row(4, ultimate_cipher_image(i, :));
    case 5
        encoded_cipher_image_1(i, :) = encode_by_row(5, ultimate_cipher_image(i, :));
    case 6
        encoded_cipher_image_1(i, :) = encode_by_row(6, ultimate_cipher_image(i, :));
    case 7
        encoded_cipher_image_1(i, :) = encode_by_row(7, ultimate_cipher_image(i, :));
    case 8
        encoded_cipher_image_1(i, :) = encode_by_row(8, ultimate_cipher_image(i, :));
    end;
end;
%% End of Encode ultimate cipher image %%


%% TEST

% "encoded_cipher_image_1" is CORRECT;

%%

%% Generate key image and Encode key image
encoded_key_image = zeros(N, M*4);
key_image = zeros(M, N);
key_image = generate_key_image(md5_checksum);
encoded_key_image = encode_plain_image_by_row(key_image);
%% End of Generate key image and Encode key image





%% Inverse operation to encoded key image and encoded ultimate cipher image
% USE inverse edition !
cipher_and_encoded_image = operate_key_image_and_encoded_plain_image_inverse_edition(encoded_key_image, encoded_cipher_image_1);
%% End of Inverse ~

%% TEST

temp_check_d = cipher_and_encoded_image;

%%


%% Decode the encoded image generated by operation to obtain the intermediate cipher image 1
cipher_image_1 = zeros(N, M);
cipher_image_1 = decode_encoded_cipher_image_by_row(cipher_and_encoded_image);
%% End of Decode ~

%% Rotate cipher image 1 by 90 degrees clockwise.
cipher_image_2 = imrotate(cipher_image_1, -90);
% cipher_image_2 = uint8(cipher_image_2);
% imshow(cipher_image_2);pause;
%% End of Rotate ~




% %% test
% cipher_image_2 = uint8(cipher_image_2);
% imwrite(cipher_image_2, 'pic/peppers_temp_d.bmp', 'bmp');
% %% test







%% ------------------------------------------------------------------------------------------







%% Encode cipher image 2 %%
encoded_cipher_image_2 = zeros(N, M*4);
x = md5_checksum;
u = 3.99999999;
x = u * x * (1 - x);
for i = 1:N
    RULE = floor(7*x) + 1;
    x = u * x * (1 - x);
    
    switch RULE
    case 1
        encoded_cipher_image_2(i, :) = encode_by_row(1, cipher_image_2(i, :));
    case 2
        encoded_cipher_image_2(i, :) = encode_by_row(2, cipher_image_2(i, :));
    case 3
        encoded_cipher_image_2(i, :) = encode_by_row(3, cipher_image_2(i, :));
    case 4
        encoded_cipher_image_2(i, :) = encode_by_row(4, cipher_image_2(i, :));
    case 5
        encoded_cipher_image_2(i, :) = encode_by_row(5, cipher_image_2(i, :));
    case 6
        encoded_cipher_image_2(i, :) = encode_by_row(6, cipher_image_2(i, :));
    case 7
        encoded_cipher_image_2(i, :) = encode_by_row(7, cipher_image_2(i, :));
    case 8
        encoded_cipher_image_2(i, :) = encode_by_row(8, cipher_image_2(i, :));
    end;
end;
%% End of Encode cipher image 2 %%


%% Inverse operation
% USE inverse edition
cipher_and_encoded_image_2 = operate_key_image_and_encoded_plain_image_inverse_edition(encoded_key_image, encoded_cipher_image_2);
%% End of Inverse operation ~

%% Decode the encoded image generated by operation to obtain the plain image
plain_image = zeros(N, M);
plain_image = decode_encoded_cipher_image_by_row(cipher_and_encoded_image_2);
%% End of Decode ~

plain_image = uint8(plain_image);
imshow(plain_image);
%imwrite(plain_image, 'pic/peppers_plain.bmp', 'bmp');


