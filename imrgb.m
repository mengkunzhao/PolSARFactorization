function [P,Tr,Tg,Tb] = imrgb(R,G,B,Tr,Tg,Tb)
%
%   plot pauli sar image
%
R = 10*log10(squeeze(R));
G = 10*log10(squeeze(G));
B = 10*log10(squeeze(B));

R = uint16((R-max(R(:))+80)/80*65535);
G = uint16((G-max(G(:))+80)/80*65535);
B = uint16((B-max(B(:))+80)/80*65535);

if nargin == 6
    R = Tr(fix(255*double(R)/65535)+1)*65535;
    G = Tg(fix(255*double(G)/65535)+1)*65535;
    B = Tb(fix(255*double(B)/65535)+1)*65535;
else
    [R, Tr] = histeq(R,256);
    [G, Tg] = histeq(G,256);
    [B, Tb] = histeq(B,256);
end

P(:,:,1) = uint8( R/256 );
P(:,:,2) = uint8( G/256 );
P(:,:,3) = uint8( B/256 );

% figure;
imshow(P)