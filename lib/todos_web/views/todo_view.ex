defmodule TodosWeb.TodoView do
  use TodosWeb, :view

  def checked(todo) do
    if (todo.completed), do: "checked"
  end

  def completed_class(todo) do
    if (todo.completed), do: "completed"
  end
end
