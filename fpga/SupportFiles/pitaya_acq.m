% Input IP of your Red Pitaya...
host= '192.168.137.118';
port = 8000;

thld = 0.1;
MAXPAGESIZE = 16384*32;

%% Open connection with your Red Pitaya

con = pnet('tcpconnect', host, port);

if con==-1, error 'Bad IP or server down...'; end
disp(['Connected to: ' host]);

pnet(con,'setwritetimeout',1);
pnet(con,'setreadtimeout',10);



for aa = 1 : 20

% Read data from buffer
signal_str = (pnet(con,'read',MAXPAGESIZE));

% Convert values to numbers.
aa = uint8(mod(signal_str,256));
x = (typecast(uint8(aa), 'int16'));
signal_num = double(x)./8192;
b = find( signal_num > thld, 1 );
if (signal_num(b) - signal_num(b+1)) < 0
b = find( signal_num(b+2 : end) > thld, 1 );
end


figure(1)


plot(signal_num(b:b+4096))
grid on
ylabel('Voltage / V')
xlabel('samples')
end

pnet(con,'close');