(defun parse-args (flag)
  "Given one or more command-line arguments, extract the passed values.

  For example, if the following was passed via the command line:

    $ erl -my-flag my-value-1 -my-flag my-value-2

  One could then extract it in an LFE program by calling this function:

    (let ((args (parse-args 'my-flag)))
      ...
      )
  In this example, the value assigned to the arg variable would be a list
  containing the values my-value-1 and my-value-2."
  (let ((`#(ok ,data) (init:get_argument flag)))
    (lists:merge data)))

(defun get-pages ()
  "With no argument, assume 'url parameter was passed via command line."
  (let ((urls (parse-args 'url)))
    (get-pages urls)))

(defun get-pages (urls)
  "Start inets and make (potentially many) HTTP requests."
  (inets:start)
  (plists:map
    (lambda (x)
      (get-page x)) urls))

(defun get-page (url)
  "Make a single HTTP request."
  (let* ((method 'get)
         (headers '())
         (request-data `#(,url ,headers))
         (http-options ())
         (request-options '(#(sync false))))
    (httpc:request method request-data http-options request-options)
    (receive
      (`#(http #(,request-id #(error ,reason)))
       (io:format "Error: ~p~n" `(,reason)))
      (`#(http #(,request-id ,result))
       (io:format "Result: ~p~n" `(,result))))))
