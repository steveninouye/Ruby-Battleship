module Memory_Cleanup
  def garbage_collect
    # system "clear"
    [:@sym, :@name, :@size, :@operator, :@start_pos, :@direction, :@col].each {|e| remove_instance_variable(e)}
  end
end
