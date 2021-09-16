function s = plus (varargin)
   if (nargin==0)
      s = 0;
   else
      s = varargin{1} + plus (varargin{2:nargin});
   end
end

