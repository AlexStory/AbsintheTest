defmodule CommunityWeb.Schema do
  use Absinthe.Schema
  alias CommunityWeb.NewsResolver

  object :link do
    field :id, non_null(:id)
    field :url, non_null(:string)
    field :description, non_null(:string)
  end

  mutation do
    field :create_link, :link do
      arg :url, non_null(:string)
      arg :description, non_null(:string)

      resolve &NewsResolver.create_link/3
    end

    field :update_link, :link do
      arg :id, non_null(:id)
      arg :url, :string
      arg :description, :string

      resolve &NewsResolver.update_link/3
    end
  end

  query do
    field :all_links, non_null(list_of(non_null(:link))) do
      resolve &NewsResolver.all_links/3
    end
  end

end
