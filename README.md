# Build, test and upload

```
# Build it!
docker build -t my-elixir-image .

# Drop into Goo iex
docker run -it my-elixir-image 

# Get credentials from passveil or ask @cognivore to give them to you
docker login 

# Tag your build
docker tag my-elixir-image domadev/goo:lts

# Push it to the hub
docker push domadev/goo:lts
```
