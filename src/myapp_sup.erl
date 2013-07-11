
-module(myapp_sup).

-behaviour(supervisor).

%% API
-export([start_link/0]).
-export([start_child/0]).
-export([stop_child/1]).

%% Supervisor callbacks
-export([init/1]).

%% Helper macro for declaring children of supervisor
-define(CHILD(I, Type), {I, {I, start_link, []}, permanent, 5000, Type, [I]}).

%% ===================================================================
%% API functions
%% ===================================================================

start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

%% ===================================================================
%% Supervisor callbacks
%% ===================================================================

init([]) ->
    ChildSup = {child, {child, start_link, []},
               transient, 10000, worker, [child]},
    {ok, { {simple_one_for_one, 3, 10}, [ChildSup]} }.

start_child() ->
    supervisor:start_child(?MODULE, []).

stop_child(ChildPid) ->
    supervisor:terminate_child(?MODULE, ChildPid).
