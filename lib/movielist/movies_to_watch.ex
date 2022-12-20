defmodule Movielist.MoviesToWatch do
  @moduledoc """
  The MoviesToWatch context.
  """

  import Ecto.Query, warn: false
  alias Movielist.Repo

  alias Movielist.MoviesToWatch.Genero

  @doc """
  Returns the list of generos.

  ## Examples

      iex> list_generos()
      [%Genero{}, ...]

  """
  def list_generos do
    Repo.all(Genero)
  end

  @doc """
  Gets a single genero.

  Raises `Ecto.NoResultsError` if the Genero does not exist.

  ## Examples

      iex> get_genero!(123)
      %Genero{}

      iex> get_genero!(456)
      ** (Ecto.NoResultsError)

  """
  def get_genero!(id), do: Repo.get!(Genero, id)

  @doc """
  Creates a genero.

  ## Examples

      iex> create_genero(%{field: value})
      {:ok, %Genero{}}

      iex> create_genero(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_genero(attrs \\ %{}) do
    %Genero{}
    |> Genero.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a genero.

  ## Examples

      iex> update_genero(genero, %{field: new_value})
      {:ok, %Genero{}}

      iex> update_genero(genero, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_genero(%Genero{} = genero, attrs) do
    genero
    |> Genero.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a genero.

  ## Examples

      iex> delete_genero(genero)
      {:ok, %Genero{}}

      iex> delete_genero(genero)
      {:error, %Ecto.Changeset{}}

  """
  def delete_genero(%Genero{} = genero) do
    Repo.delete(genero)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking genero changes.

  ## Examples

      iex> change_genero(genero)
      %Ecto.Changeset{data: %Genero{}}

  """
  def change_genero(%Genero{} = genero, attrs \\ %{}) do
    Genero.changeset(genero, attrs)
  end

  alias Movielist.MoviesToWatch.Assistido

  @doc """
  Returns the list of assistidos.

  ## Examples

      iex> list_assistidos()
      [%Assistido{}, ...]

  """
  def list_assistidos do
    Repo.all(Assistido)
  end

  @doc """
  Gets a single assistido.

  Raises `Ecto.NoResultsError` if the Assistido does not exist.

  ## Examples

      iex> get_assistido!(123)
      %Assistido{}

      iex> get_assistido!(456)
      ** (Ecto.NoResultsError)

  """
  def get_assistido!(id), do: Repo.get!(Assistido, id)

  @doc """
  Creates a assistido.

  ## Examples

      iex> create_assistido(%{field: value})
      {:ok, %Assistido{}}

      iex> create_assistido(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_assistido(attrs \\ %{}) do
    %Assistido{}
    |> Assistido.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a assistido.

  ## Examples

      iex> update_assistido(assistido, %{field: new_value})
      {:ok, %Assistido{}}

      iex> update_assistido(assistido, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_assistido(%Assistido{} = assistido, attrs) do
    assistido
    |> Assistido.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a assistido.

  ## Examples

      iex> delete_assistido(assistido)
      {:ok, %Assistido{}}

      iex> delete_assistido(assistido)
      {:error, %Ecto.Changeset{}}

  """
  def delete_assistido(%Assistido{} = assistido) do
    Repo.delete(assistido)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking assistido changes.

  ## Examples

      iex> change_assistido(assistido)
      %Ecto.Changeset{data: %Assistido{}}

  """
  def change_assistido(%Assistido{} = assistido, attrs \\ %{}) do
    Assistido.changeset(assistido, attrs)
  end

  alias Movielist.MoviesToWatch.Filme

  @doc """
  Returns the list of filmes.

  ## Examples

      iex> list_filmes()
      [%Filme{}, ...]

  """
  def list_filmes do
    Repo.all(Filme)
  end

  @doc """
  Gets a single filme.

  Raises `Ecto.NoResultsError` if the Filme does not exist.

  ## Examples

      iex> get_filme!(123)
      %Filme{}

      iex> get_filme!(456)
      ** (Ecto.NoResultsError)

  """
  def get_filme!(id), do: Repo.get!(Filme, id)

  @doc """
  Creates a filme.

  ## Examples

      iex> create_filme(%{field: value})
      {:ok, %Filme{}}

      iex> create_filme(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_filme(attrs \\ %{}) do
    %Filme{}
    |> Filme.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a filme.

  ## Examples

      iex> update_filme(filme, %{field: new_value})
      {:ok, %Filme{}}

      iex> update_filme(filme, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_filme(%Filme{} = filme, attrs) do
    filme
    |> Filme.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a filme.

  ## Examples

      iex> delete_filme(filme)
      {:ok, %Filme{}}

      iex> delete_filme(filme)
      {:error, %Ecto.Changeset{}}

  """
  def delete_filme(%Filme{} = filme) do
    Repo.delete(filme)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking filme changes.

  ## Examples

      iex> change_filme(filme)
      %Ecto.Changeset{data: %Filme{}}

  """
  def change_filme(%Filme{} = filme, attrs \\ %{}) do
    Filme.changeset(filme, attrs)
  end
end
