defmodule CommunityWeb.NewsResolver do
  alias Community.News

  def all_links(_root, _args, _info) do
    links = News.list_links
    {:ok, links}
  end

  def create_link(_root, args, _info) do
    case News.create_link(args) do
      {:ok, link} -> {:ok, link}
      _error -> {:error, "could not create link"}
    end
  end

  def update_link(root, args, _info) do
    IO.inspect(args)
    IO.puts("-----------")
    IO.inspect(root)
    case News.update_link(News.get_link!(args.id), args) do
      {:ok, link} -> {:ok, link}
      _error -> {:error, "could not update link"}
    end
  end
end
