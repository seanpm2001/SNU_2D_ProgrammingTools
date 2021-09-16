function varargout = multiassign (data)
   for k=1:nargout
      varargout{k} = data(:,k);
   end
end
