%By utilizing this script to save in a .txt format the points of your
%constellation as well as the Voronoi diagram of your constellation
%AWGN CHANNEL
Es = 1;
M = 64;
gamma=4;

% symbols_per_ring = [4 8 20];
% radii = [0.3 0.7 1.2];
% modOrder = sum(symbols_per_ring);
% x = 0:modOrder-1;

%create CONSTELLATIONS e.g Hexagonal - QAM, Regular APSK, Iregular APSK.
%You can design any constellation you want the following are just examples
%s = apskmod(x,symbols_per_ring,radii);
s = hqam(M);
%s = regular_apsk(M,Es,gamma);
iq1 = real(s);
iq2 = imag(s);
iq = cat(2,iq1.', iq2.');
f1 = sprintf('data/s-iq.txt');
save(f1,'iq','-ascii')

figure(1);
scatter(iq(:,1),iq(:,2));


[vx, vy] = voronoi(iq(:,1), iq(:,2));
f3 = sprintf('data/s-voronoi.txt');
fid = fopen(f3, 'w');
fprintf(fid, '%f %f\n%f %f\n\n', [vx(:), vy(:)]');

figure(2);
h=voronoi(iq(:,1),iq(:,2));hold on;
scatter(iq(:,1),iq(:,2));



