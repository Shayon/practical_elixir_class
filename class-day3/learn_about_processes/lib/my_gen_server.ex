defmodule MyGenServer do
  def start_link(module, atom_list, keyword_list) do
    if(not is_atom(keyword_list))
    raise ArgumentError, message: "expected :name to be an atom"
  end
end
