# bypass it on POST
```
  location ~ ^/api/request/([a-z0-9-]*)/status$ {
    if ($request_method != POST) {
      set $backend_request $PCE_API_HOST;
      proxy_pass $backend_request/api/request/$1/status$is_args$args;
    }

    # default: use api itself instead of pce_backend 
    try_files $uri /index.php$is_args$args;
  }
```
