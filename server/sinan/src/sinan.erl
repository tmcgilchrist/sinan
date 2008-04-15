%% -*- mode: Erlang; fill-column: 132; comment-column: 118; -*-
%%%-------------------------------------------------------------------
%%% Copyright (c) 2007 Erlware
%%%
%%% Permission is hereby granted, free of charge, to any
%%% person obtaining a copy of this software and associated
%%% documentation files (the "Software"), to deal in the
%%% Software without restriction, including without limitation
%%% the rights to use, copy, modify, merge, publish, distribute,
%%% sublicense, and/or sell copies of the Software, and to permit
%%% persons to whom the Software is furnished to do so, subject to
%%% the following conditions:
%%%
%%% The above copyright notice and this permission notice shall
%%% be included in all copies or substantial portions of the Software.
%%%
%%% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
%%% EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
%%% OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
%%% NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
%%% HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
%%% WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
%%% OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
%%% OTHER DEALINGS IN THE SOFTWARE.
%%%---------------------------------------------------------------------------
%%% @author Eric Merritt <cyberlync@gmail.com>
%%% @doc
%%%  The module provides a simple api for the sinan system.
%%%  Two possible arguments may be passed in. The start dir that should
%%%  be somewhere inside a project and a list of args for the system.
%%%
%%%  @type buildref() = string(). A globally unique id for the build
%%%  @type startdir() = string(). A dir that is somewhere in a project
%%%  @type args() = {[{TaskName, args}]}
%%%    TaskName = string(). The name of the task the args apply too.
%%% @end
%%% @copyright (C) 2007, Erlware
%%% Created :  8 Dec 2007 by Eric Merritt <cyberlync@gmail.com>
%%%-------------------------------------------------------------------
-module(sinan).

%% API
-export([gen_build_ref/0,
         build/2, build/3,
         analyze/3, analyze/2,
         doc/3, doc/2,
         shell/2, shell/3,
         gen/3, gen/2,
         clean/2, clean/3,
         help/2, help/3,
         depends/2, depends/3,
         test/2, test/3,
         release/2, release/3,
         dist/2, dist/3,
         do_task/4,
         do_task/5,
         start/0]).

%%====================================================================
%% API
%%====================================================================
%%--------------------------------------------------------------------
%% @doc
%%  Run the build task. {@link sin_erl_builder}
%% @spec build(BuildRef::buildRef(), StartDir::startdir()) -> ok
%% @end
%%--------------------------------------------------------------------
build(BuildRef, StartDir) ->
    build(BuildRef, StartDir, []).

%%--------------------------------------------------------------------
%% @doc
%%  Run the build with the specified args. {@link sin_erl_builder}
%% @spec build(BuildRef::buildRef(), StartDir::startdir(), Args::args()) -> ok
%% @end
%%--------------------------------------------------------------------
build(BuildRef, StartDir, Args) ->
    do_task(build, BuildRef, StartDir, Args).

%%--------------------------------------------------------------------
%% @doc
%%  Run the analyze task. {@link sin_analyze}
%% @spec analyze(BuildRef::buildRef(), StartDir::startdir()) -> ok
%% @end
%%--------------------------------------------------------------------
analyze(BuildRef, StartDir) ->
    analyze(BuildRef, StartDir, []).

%%--------------------------------------------------------------------
%% @doc
%%  Run the analyze task. {@link sin_analyze}
%% @spec analyze(BuildRef::buildRef(), StartDir::startdir(), Args::args()) -> ok
%% @end
%%--------------------------------------------------------------------
analyze(BuildRef, StartDir, Args) ->
    do_task(analyze, BuildRef, StartDir, Args).

%%--------------------------------------------------------------------
%% @doc
%%  run the doc task. {@link sin_edoc}
%% @spec doc(BuildRef::buildRef(), StartDir::startdir()) -> ok
%% @end
%%--------------------------------------------------------------------
doc(BuildRef, StartDir) ->
    doc(BuildRef, StartDir, []).

%%--------------------------------------------------------------------
%% @doc
%%  run the doc task. {@link sin_edoc}
%% @spec doc(BuildRef::buildRef(), StartDir::startdir(), Args::args()) -> ok
%% @end
%%--------------------------------------------------------------------
doc(BuildRef, StartDir, Args) ->
    do_task(doc, BuildRef, StartDir, Args).

%%--------------------------------------------------------------------
%% @doc
%%  run the shell task. {@link sin_shell}
%% @spec shell(BuildRef::buildRef(), StartDir::startdir()) -> ok
%% @end
%%--------------------------------------------------------------------
shell(BuildRef, StartDir) ->
    shell(BuildRef, StartDir, []).

%%--------------------------------------------------------------------
%% @doc
%%  run the shell task. {@link sin_shell}
%% @spec shell(BuildRef::buildRef(), StartDir::startdir(), Args::args()) -> ok
%% @end
%%--------------------------------------------------------------------
shell(BuildRef, StartDir, Args) ->
   do_task(shell, BuildRef,  StartDir, Args).

%%--------------------------------------------------------------------
%% @doc
%%  Run the gen task. {@link sin_gen}
%% @spec gen(BuildRef::buildRef(), StartDir::startdir()) -> ok
%% @end
%%--------------------------------------------------------------------
gen(BuildRef, StartDir) ->
    gen(BuildRef StartDir, []).

%%--------------------------------------------------------------------
%% @doc
%%  Run the gen task. {@link sin_gen}
%% @spec gen(BuildRef::buildRef(), StartDir::startdir(), Args::args()) -> ok
%% @end
%%--------------------------------------------------------------------
gen(BuildRef, StartDir, Args) ->
    do_task(singen, gen, BuildRef, StartDir, Args).


%%--------------------------------------------------------------------
%% @doc
%%  run the clean task. {@link sin_clean}
%% @spec clean(BuildRef::buildRef(), StartDir::startdir()) -> ok
%% @end
%%--------------------------------------------------------------------
clean(BuildRef, StartDir) ->
    clean(BuildRef, StartDir, []).

%%--------------------------------------------------------------------
%% @doc
%%  run the clean task. {@link sin_clean}
%% @spec clean(BuildRef::buildRef(), StartDir::startdir(), Args::args()) -> ok
%% @end
%%--------------------------------------------------------------------
clean(BuildRef, StartDir, Args) ->
    do_task(clean, BuildRef, StartDir, Args).

%%--------------------------------------------------------------------
%% @doc
%%  run the help task. {@link sin_help}
%% @spec help(BuildRef::buildRef(), StartDir::startdir()) -> ok
%% @end
%%--------------------------------------------------------------------
help(BuildRef, StartDir) ->
    help(BuildRef, StartDir, []).

%%--------------------------------------------------------------------
%% @doc
%%  run the help task. {@link sin_help}
%% @spec help(BuildRef::buildRef(), StartDir::startdir(), Args::args()) -> ok
%% @end
%%--------------------------------------------------------------------
help(BuildRef, StartDir, Args) ->
    do_task(sinhelp, help, BuildRef, StartDir, Args).

%%--------------------------------------------------------------------
%% @doc
%%  run the depends task. {@link sin_depends}
%% @spec depends(BuildRef::buildRef(), StartDir::startdir()) -> ok
%% @end
%%--------------------------------------------------------------------
depends(BuildRef, StartDir) ->
    depends(BuildRef, StartDir, []).

%%--------------------------------------------------------------------
%% @doc
%%  run the depends task. {@link sin_depends}
%% @spec depends(BuildRef::buildRef(), StartDir::startdir(), Args::args()) -> ok
%% @end
%%--------------------------------------------------------------------
depends(BuildRef, StartDir, Args) ->
    do_task(depends, BuildRef, StartDir, Args).


%%--------------------------------------------------------------------
%% @doc
%%  run the test task. {@link sin_test}
%% @spec test(BuildRef::buildRef(), StartDir::startdir()) -> ok
%% @end
%%--------------------------------------------------------------------
test(BuildRef, StartDir) ->
    test(BuildRef, StartDir, []).

%%--------------------------------------------------------------------
%% @doc
%%  run the test task. {@link sin_test}
%% @spec test(BuildRef::buildRef(), StartDir::startdir(), Args::args()) -> ok
%% @end
%%--------------------------------------------------------------------
test(BuildRef, StartDir, Args) ->
    do_task(test, BuildRef, StartDir, Args).

%%--------------------------------------------------------------------
%% @doc
%%  run the release task. {@link sin_release_builder}
%% @spec release(BuildRef::buildRef(), StartDir::startdir()) -> ok
%% @end
%%--------------------------------------------------------------------
release(BuildRef, StartDir) ->
    release(BuildRef, StartDir, []).

%%--------------------------------------------------------------------
%% @doc
%%  run the release task. {@link sin_release_builder}
%% @spec release(BuildRef::buildRef(), StartDir::startdir(), Args::args()) -> ok
%% @end
%%--------------------------------------------------------------------
release(BuildRef, StartDir, Args) ->
    do_task(release, BuildRef, StartDir, Args).

%%--------------------------------------------------------------------
%% @doc
%%  run the dist task. {@link sin_dist_builder}
%% @spec dist(BuildRef::buildRef(), StartDir::startdir()) -> ok
%% @end
%%--------------------------------------------------------------------
dist(BuildRef, StartDir) ->
    dist(BuildRef, StartDir, []).

%%--------------------------------------------------------------------
%% @doc
%%  run the dist task. {@link sin_dist_builder}
%% @spec dist(BuildRef::buildRef(), StartDir::startdir(), Args::args()) -> ok
%% @end
%%--------------------------------------------------------------------
dist(BuildRef, StartDir, Args) ->
    do_task(dist, BuildRef, StartDir, Args).


%%--------------------------------------------------------------------
%% @doc
%%  run the specified task, with the default chain
%% @spec do_task(Task, BuildRef::buildRef(),
%%   StartDir::startdir(), Args::args()) -> ok
%% @end
%%--------------------------------------------------------------------
do_task(Task, BuildRef, StartDir, Args) when is_atom(Task) ->
    do_task(sinan, BuildRef, StartDir, Task, Args).

%%--------------------------------------------------------------------
%% @doc
%%  run the specified task
%% @spec do_task(Chain, Task, BuildRef::buildRef(),
%%   Startdir::startdir(), Args::args()) -> ok
%% @end
%%--------------------------------------------------------------------
do_task(Chain, Task, BuildRef, StartDir, Args) when is_atom(Task) ->
    fconf:start_config(BuildRef,
                       fun sin_parse_handle:parse_config_file/1),
    fconf:store(BuildRef, "build.args", Args),
    fconf:store(BuildRef, "build.start_dir", StartDir),
    eta_engine:run(Chain, Task, BuildRef),
    fconf:stop_config(BuildRef).

%%--------------------------------------------------------------------
%% @doc
%% Generate a new unique build ref for a run. This allows the
%% use to setup task handlers for the system.
%%
%% @spec get_build_ref() -> GeneratedBuildRef::string()
%% @end
%%--------------------------------------------------------------------
gen_build_ref() ->
    eta_engine:make_run_id().

%%--------------------------------------------------------------------
%% @doc
%%  Allows sinan to be easily started from the shell. This is a
%%  helper function thats mostly just useful in development.
%% @spec start() -> ok
%% @end
%%--------------------------------------------------------------------
start() ->
    application:start(tools),
    application:start(compiler),
    application:start(syntax_tools),
    application:start(edoc),
    application:start(sasl),
    application:start(ibrowse),
    application:start(eunit),
    application:start(ktuo),
    application:start(fconf),
    application:start(ewlib),
    application:start(ewrepo),
    application:start(gs),
    application:start(hipe),
    application:start(xmerl),
    application:start(mnesia),
    application:start(dialyzer),
    application:start(etask),
    application:start(sinan).


%%====================================================================
%% Internal functions
%%====================================================================