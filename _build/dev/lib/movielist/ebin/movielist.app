{application,movielist,
    [{compile_env,[{movielist,['Elixir.MovielistWeb.Gettext'],error}]},
     {applications,
         [kernel,stdlib,elixir,logger,runtime_tools,phoenix,phoenix_ecto,
          ecto_sql,postgrex,phoenix_html,phoenix_live_reload,
          phoenix_live_view,phoenix_live_dashboard,esbuild,swoosh,
          telemetry_metrics,telemetry_poller,gettext,jason,plug_cowboy]},
     {description,"movielist"},
     {modules,
         ['Elixir.Movielist','Elixir.Movielist.Application',
          'Elixir.Movielist.Mailer','Elixir.Movielist.MoviesToWatch',
          'Elixir.Movielist.MoviesToWatch.Assistido',
          'Elixir.Movielist.MoviesToWatch.Filme',
          'Elixir.Movielist.MoviesToWatch.Genero','Elixir.Movielist.Repo',
          'Elixir.MovielistWeb','Elixir.MovielistWeb.AssistidoController',
          'Elixir.MovielistWeb.AssistidoView','Elixir.MovielistWeb.Endpoint',
          'Elixir.MovielistWeb.ErrorHelpers','Elixir.MovielistWeb.ErrorView',
          'Elixir.MovielistWeb.FilmeController',
          'Elixir.MovielistWeb.FilmeView',
          'Elixir.MovielistWeb.GeneroController',
          'Elixir.MovielistWeb.GeneroView','Elixir.MovielistWeb.Gettext',
          'Elixir.MovielistWeb.LayoutView',
          'Elixir.MovielistWeb.PageController','Elixir.MovielistWeb.PageView',
          'Elixir.MovielistWeb.Router','Elixir.MovielistWeb.Router.Helpers',
          'Elixir.MovielistWeb.Telemetry']},
     {registered,[]},
     {vsn,"0.1.0"},
     {mod,{'Elixir.Movielist.Application',[]}}]}.