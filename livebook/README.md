Recipies on livebook/elixir format

To run elixir/livebook I use...

    nix-shell -I nixpkgs=channel:nixpkgs-unstable -p elixir
    livebook server
