defmodule Commuter.Station.StationTest do
  use ExUnit.Case, async: true
  alias Commuter.Station

  @tooting "940GZZLUTBC"
  @northern "northern"
  @direction "inbound"

  @process_id :"940GZZLUTBC_northern"

  test "returns a struct with two lists of trains" do
    result = Station.get_arrivals(@process_id)
    %Station{inbound: inbound_list, outbound: outbound_list} = result
    assert is_list(inbound_list) && is_list(outbound_list)
  end

  test "the trains are all assigned to the correct direction's list" do
    result = Station.get_arrivals(@process_id)
    Enum.each(result.inbound, fn %Commuter.Train{direction: direction} ->
      assert direction == "inbound" end)
    Enum.each(result.outbound, fn %Commuter.Train{direction: direction} ->
      assert direction == "outbound" end)
  end

end