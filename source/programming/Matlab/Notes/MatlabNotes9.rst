============================================================
Matlab Notes 9
============================================================


Basic Commands: FFT
--------------------------

.. code-block:: matlab

	> clc			% clear command window
	> clear			% remove all variables in memory


.. code-block:: matlab

	% Fast Fourier Transform (FFT) (Hızlı Fourier Dönüşümü)

	> help fft
      FFT Discrete Fourier transform.
         FFT(X) is the discrete Fourier transform (DFT) of vector X.  For
         matrices, the FFT operation is applied to each column. For N-D
         arrays, the FFT operation operates on the first non-singleton
         dimension.
      
         FFT(X,N) is the N-point FFT, padded with zeros if X has less
         than N points and truncated if it has more.

         FFT(X,[],DIM) or FFT(X,N,DIM) applies the FFT operation across the
         dimension DIM.

         For length N input vector x, the DFT is a length N vector X,
         with elements
                        N
         X(k) =       sum  x(n)*exp(-j*2*pi*(k-1)*(n-1)/N), 1 <= k <= N.
                      n=1
      
         The inverse DFT (computed by IFFT) is given by
                        N
         x(n) = (1/N) sum  X(k)*exp( j*2*pi*(k-1)*(n-1)/N), 1 <= n <= N.
                      k=1

         See also fft2, fftn, fftshift, fftw, ifft, ifft2, ifftn.

         Overloaded functions or methods (ones with the same name in other directories)
            help uint8/fft.m
            help uint16/fft.m
            help gf/fft.m
            help qfft/fft.m
            help iddata/fft.m

         Reference page in Help browser
            doc fft


.. code-block:: matlab

	> t = 0: 0.001 :0.6;
	> x = sin(2*pi*50*t) + sin(2*pi*120*t);
	> y = x + 2 * randn(size(t));		% y = f(t,x)

	> plot(y(1:50))

	> Y = fft(y, 512);			% fft
	> f = 1000*(0:256)/512;

	> plot(f,2*abs(Y(1:512/2+1)))
	> PY = Y .* conj(Y) / 512;		% power spectral density
	> plot(f,PY(1:257))

	> semilogy(f, PY(1:257));
	> xlabel('Frequency (Hz)')
	> ylabel('Power')
	> title('FFT Results (of y data)')

