defmodule Todos.TodoListTest do
  use Todos.DataCase

  alias Todos.TodoList

  describe "todos" do
    alias Todos.TodoList.Todo

    @valid_attrs %{completed: true, title: "some title"}
    @update_attrs %{completed: false, title: "some updated title"}
    @invalid_attrs %{completed: nil, title: nil}

    def todo_fixture(attrs \\ %{}) do
      {:ok, todo} =
        attrs
        |> Enum.into(@valid_attrs)
        |> TodoList.create_todo()

      todo
    end

    test "list_todos/0 returns all todos" do
      todo = todo_fixture()
      assert TodoList.list_todos() == [todo]
    end

    test "get_todo!/1 returns the todo with given id" do
      todo = todo_fixture()
      assert TodoList.get_todo!(todo.id) == todo
    end

    test "create_todo/1 with valid data creates a todo" do
      assert {:ok, %Todo{} = todo} = TodoList.create_todo(@valid_attrs)
      assert todo.completed == true
      assert todo.title == "some title"
    end

    test "create_todo/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = TodoList.create_todo(@invalid_attrs)
    end

    test "update_todo/2 with valid data updates the todo" do
      todo = todo_fixture()
      assert {:ok, %Todo{} = todo} = TodoList.update_todo(todo, @update_attrs)
      assert todo.completed == false
      assert todo.title == "some updated title"
    end

    test "update_todo/2 with invalid data returns error changeset" do
      todo = todo_fixture()
      assert {:error, %Ecto.Changeset{}} = TodoList.update_todo(todo, @invalid_attrs)
      assert todo == TodoList.get_todo!(todo.id)
    end

    test "delete_todo/1 deletes the todo" do
      todo = todo_fixture()
      assert {:ok, %Todo{}} = TodoList.delete_todo(todo)
      assert_raise Ecto.NoResultsError, fn -> TodoList.get_todo!(todo.id) end
    end

    test "change_todo/1 returns a todo changeset" do
      todo = todo_fixture()
      assert %Ecto.Changeset{} = TodoList.change_todo(todo)
    end
  end
end
