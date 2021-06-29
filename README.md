## File Descriptors in Elastic APM with EventMachine

1. Build Docker image

```bash
> docker build . -t fd_leak
```

2. Run a Docker container for the image

```bash
> docker run -v /YOUR_REPOSITORY_DIRECTORY/file_descriptors_leak:/app -i -t fd_leak /bin/bash
```

3. Install dependencies

```bash
> bundle install
```

4. Run the app

```bash
> ruby main.rb
```

5. Get process PID

```bash
> ps aux | grep ruby
root       928 11.5  1.7 508064 36208 pts/1    Sl+  18:04   0:00 ruby main.rb
```

6. Watch file descriptors to grow

```bash
> ls /proc/928/fd | wc -l
19
> ls /proc/928/fd | wc -l
22
```
