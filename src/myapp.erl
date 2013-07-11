-module(myapp).

-export([start/0]).
-export([stop/0]).

start() ->
    application:start(myapp).

stop() ->
    application:stop(myapp).
