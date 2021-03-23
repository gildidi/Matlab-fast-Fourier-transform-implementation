function[FourierCoeff] = FourierCoeffGen(signal)
   N=length(signal);                       % Calculate lenght of the time period .
   w_0=(2*pi)/N;                           % Calculate the basic frequency.
   k=(linspace(0,N-1,N));                  % initialize the function index. (and use it later as time index)
   if (size(k) ~= size(signal))         % Check if a transpose operation is needed
       signal=transpose(signal);
   end
   Harmonics(k+1)=(exp((-1j)*w_0*k));      % craeting the harmonic functions
   FourierCoeff=(zeros(1,N));              % Initialize the coeeficients vector. 
    for n=1:N                              % 'for' loop, calculating the K Fourier Coefficients
       FourierCoeff(n)=(1/N) * sum(signal .* (Harmonics .^ (n-1)));
    end
end

