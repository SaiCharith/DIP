function im = myLinearContrastStretching(M)
mn = min(M(:));
mx = max(M(:));

im = 255 * ((M - mn)/(mx- mn));