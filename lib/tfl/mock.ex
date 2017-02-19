defmodule Commuter.Tfl.Mock do
  @moduledoc """
  Provides a mock TFL server to allow tests to get quick data without calling
  the real life TFL api.
  """
  @behaviour Commuter.Tfl

  @doc """
  A smoke screen - this will always return true because we don't need to
  test the failure of a mock api call... Let it crash!!
  """
  def successful_response?(_response), do: true

  @doc """
  This doesn't do anything. Just a smoke screen.
  """
  def take_body(list), do: list

  @doc """
  Returns four stations:
  - Clapham Junction
  - Waterloo
  - Tooting Bec
  - Victoria

  Returns a list of objects.
  """
  def retrieve_all_stations(_url \\ "fake") do
    IO.puts "Using Mock TFL to get station list..."
    [
      %{
        "commonName" => "Waterloo", "modes" => ["tube", "bus"],
        "naptanId" => "940GZZLUWLO",
        "lineModeGroups" => [%{"modeName" => "tube",
                              "lineIdentifier" => [ "northern", "jubilee",
                                                    "bakerloo", "waterloo-city"]},
                            %{"modeName" => "bus",
                              "lineIdentifier" => ["10"]}]
      },
      %{
        "commonName" => "Tooting Bec", "modes" => ["tube"],
        "naptanId" => "940GZZLUTBC",
        "lineModeGroups" => [%{"modeName" => "tube",
                              "lineIdentifier" => [ "northern"]},
                            %{"modeName" => "bus",
                              "lineIdentifier" => ["130"]}]
      },
      %{
        "commonName" => "Victoria", "modes" => ["tube", "bus", "rail"],
        "naptanId" => "940GZZLUVIC",
        "lineModeGroups" => [%{"modeName" => "tube",
                              "lineIdentifier" => [ "circle", "district",
                                                    "victoria"]},
                            %{"modeName" => "bus",
                              "lineIdentifier" => ["N130"]}]
      },
      %{
        "commonName" => "Clapham Junction", "modes" => ["rail", "bus"],
        "naptanId" => "940GZZLUCLA",
        "lineModeGroups" => [%{"modeName" => "bus",
                              "lineIdentifier" => [ "N133", "100"]}]
      }
    ]
  end

  # fake one to avoid having to mention specifics in tests...
  def line_arrivals(:test), do: line_arrivals("940GZZLUTBC", "northern")

  @doc """
  Returns a JSON string full of train objects as if it was from TFL.
  """
  def line_arrivals("940GZZLUTBC", "northern") do
    "[{\"$type\":\"Tfl.Api.Presentation.Entities.Prediction, Tfl.Api.Presentation.Entities\",\"id\":\"-2040671041\",\"operationType\":1,\"vehicleId\":\"002\",\"naptanId\":\"940GZZLUTBC\",\"stationName\":\"Tooting Bec Underground Station\",\"lineId\":\"northern\",\"lineName\":\"Northern\",\"platformName\":\"Northbound - Platform 1\",\"direction\":\"outbound\",\"bearing\":\"\",\"destinationNaptanId\":\"940GZZLUEGW\",\"destinationName\":\"Edgware Underground Station\",\"timestamp\":\"2017-02-14T08:43:46Z\",\"timeToStation\":17,\"currentLocation\":\"Approaching Tooting Bec\",\"towards\":\"Edgware via Bank\",\"expectedArrival\":\"2017-02-14T08:44:03Z\",\"timeToLive\":\"2017-02-14T08:44:03Z\",\"modeName\":\"tube\",\"timing\":{\"$type\":\"Tfl.Api.Presentation.Entities.PredictionTiming, Tfl.Api.Presentation.Entities\",\"countdownServerAdjustment\":\"00:00:00\",\"source\":\"0001-01-01T00:00:00\",\"insert\":\"0001-01-01T00:00:00\",\"read\":\"2017-02-14T08:43:44.129Z\",\"sent\":\"2017-02-14T08:43:46Z\",\"received\":\"0001-01-01T00:00:00\"}},{\"$type\":\"Tfl.Api.Presentation.Entities.Prediction, Tfl.Api.Presentation.Entities\",\"id\":\"-436854748\",\"operationType\":1,\"vehicleId\":\"003\",\"naptanId\":\"940GZZLUTBC\",\"stationName\":\"Tooting Bec Underground Station\",\"lineId\":\"northern\",\"lineName\":\"Northern\",\"platformName\":\"Northbound - Platform 1\",\"direction\":\"outbound\",\"bearing\":\"\",\"destinationNaptanId\":\"940GZZLUEGW\",\"destinationName\":\"Edgware Underground Station\",\"timestamp\":\"2017-02-14T08:43:46Z\",\"timeToStation\":467,\"currentLocation\":\"Between Morden and South Wimbledon\",\"towards\":\"Edgware via Bank\",\"expectedArrival\":\"2017-02-14T08:51:33Z\",\"timeToLive\":\"2017-02-14T08:51:33Z\",\"modeName\":\"tube\",\"timing\":{\"$type\":\"Tfl.Api.Presentation.Entities.PredictionTiming, Tfl.Api.Presentation.Entities\",\"countdownServerAdjustment\":\"00:00:00\",\"source\":\"0001-01-01T00:00:00\",\"insert\":\"0001-01-01T00:00:00\",\"read\":\"2017-02-14T08:43:44.161Z\",\"sent\":\"2017-02-14T08:43:46Z\",\"received\":\"0001-01-01T00:00:00\"}},{\"$type\":\"Tfl.Api.Presentation.Entities.Prediction, Tfl.Api.Presentation.Entities\",\"id\":\"-33585645\",\"operationType\":1,\"vehicleId\":\"006\",\"naptanId\":\"940GZZLUTBC\",\"stationName\":\"Tooting Bec Underground Station\",\"lineId\":\"northern\",\"lineName\":\"Northern\",\"platformName\":\"Southbound - Platform 2\",\"direction\":\"inbound\",\"bearing\":\"\",\"destinationNaptanId\":\"940GZZLUMDN\",\"destinationName\":\"Morden Underground Station\",\"timestamp\":\"2017-02-14T08:43:46Z\",\"timeToStation\":167,\"currentLocation\":\"Between Clapham South and Balham\",\"towards\":\"Morden via Bank\",\"expectedArrival\":\"2017-02-14T08:46:33Z\",\"timeToLive\":\"2017-02-14T08:46:33Z\",\"modeName\":\"tube\",\"timing\":{\"$type\":\"Tfl.Api.Presentation.Entities.PredictionTiming, Tfl.Api.Presentation.Entities\",\"countdownServerAdjustment\":\"00:00:00\",\"source\":\"0001-01-01T00:00:00\",\"insert\":\"0001-01-01T00:00:00\",\"read\":\"2017-02-14T08:43:44.176Z\",\"sent\":\"2017-02-14T08:43:46Z\",\"received\":\"0001-01-01T00:00:00\"}},{\"$type\":\"Tfl.Api.Presentation.Entities.Prediction, Tfl.Api.Presentation.Entities\",\"id\":\"1394086840\",\"operationType\":1,\"vehicleId\":\"007\",\"naptanId\":\"940GZZLUTBC\",\"stationName\":\"Tooting Bec Underground Station\",\"lineId\":\"northern\",\"lineName\":\"Northern\",\"platformName\":\"Southbound - Platform 2\",\"direction\":\"inbound\",\"bearing\":\"\",\"destinationNaptanId\":\"940GZZLUMDN\",\"destinationName\":\"Morden Underground Station\",\"timestamp\":\"2017-02-14T08:43:46Z\",\"timeToStation\":527,\"currentLocation\":\"At Clapham North Platform 2\",\"towards\":\"Morden via CX\",\"expectedArrival\":\"2017-02-14T08:52:33Z\",\"timeToLive\":\"2017-02-14T08:52:33Z\",\"modeName\":\"tube\",\"timing\":{\"$type\":\"Tfl.Api.Presentation.Entities.PredictionTiming, Tfl.Api.Presentation.Entities\",\"countdownServerAdjustment\":\"00:00:00\",\"source\":\"0001-01-01T00:00:00\",\"insert\":\"0001-01-01T00:00:00\",\"read\":\"2017-02-14T08:43:44.192Z\",\"sent\":\"2017-02-14T08:43:46Z\",\"received\":\"0001-01-01T00:00:00\"}},{\"$type\":\"Tfl.Api.Presentation.Entities.Prediction, Tfl.Api.Presentation.Entities\",\"id\":\"-846347275\",\"operationType\":1,\"vehicleId\":\"010\",\"naptanId\":\"940GZZLUTBC\",\"stationName\":\"Tooting Bec Underground Station\",\"lineId\":\"northern\",\"lineName\":\"Northern\",\"platformName\":\"Southbound - Platform 2\",\"direction\":\"inbound\",\"bearing\":\"\",\"destinationNaptanId\":\"940GZZLUMDN\",\"destinationName\":\"Morden Underground Station\",\"timestamp\":\"2017-02-14T08:43:46Z\",\"timeToStation\":887,\"currentLocation\":\"Approaching Kennington Platform 2\",\"towards\":\"Morden via CX\",\"expectedArrival\":\"2017-02-14T08:58:33Z\",\"timeToLive\":\"2017-02-14T08:58:33Z\",\"modeName\":\"tube\",\"timing\":{\"$type\":\"Tfl.Api.Presentation.Entities.PredictionTiming, Tfl.Api.Presentation.Entities\",\"countdownServerAdjustment\":\"00:00:00\",\"source\":\"0001-01-01T00:00:00\",\"insert\":\"0001-01-01T00:00:00\",\"read\":\"2017-02-14T08:43:44.223Z\",\"sent\":\"2017-02-14T08:43:46Z\",\"received\":\"0001-01-01T00:00:00\"}},{\"$type\":\"Tfl.Api.Presentation.Entities.Prediction, Tfl.Api.Presentation.Entities\",\"id\":\"589717274\",\"operationType\":1,\"vehicleId\":\"011\",\"naptanId\":\"940GZZLUTBC\",\"stationName\":\"Tooting Bec Underground Station\",\"lineId\":\"northern\",\"lineName\":\"Northern\",\"platformName\":\"Southbound - Platform 2\",\"direction\":\"inbound\",\"bearing\":\"\",\"destinationNaptanId\":\"940GZZLUMDN\",\"destinationName\":\"Morden Underground Station\",\"timestamp\":\"2017-02-14T08:43:46Z\",\"timeToStation\":1247,\"currentLocation\":\"Between Bank and London Bridge\",\"towards\":\"Morden via Bank\",\"expectedArrival\":\"2017-02-14T09:04:33Z\",\"timeToLive\":\"2017-02-14T09:04:33Z\",\"modeName\":\"tube\",\"timing\":{\"$type\":\"Tfl.Api.Presentation.Entities.PredictionTiming, Tfl.Api.Presentation.Entities\",\"countdownServerAdjustment\":\"00:00:00\",\"source\":\"0001-01-01T00:00:00\",\"insert\":\"0001-01-01T00:00:00\",\"read\":\"2017-02-14T08:43:44.239Z\",\"sent\":\"2017-02-14T08:43:46Z\",\"received\":\"0001-01-01T00:00:00\"}},{\"$type\":\"Tfl.Api.Presentation.Entities.Prediction, Tfl.Api.Presentation.Entities\",\"id\":\"-2040605505\",\"operationType\":1,\"vehicleId\":\"012\",\"naptanId\":\"940GZZLUTBC\",\"stationName\":\"Tooting Bec Underground Station\",\"lineId\":\"northern\",\"lineName\":\"Northern\",\"platformName\":\"Southbound - Platform 2\",\"direction\":\"inbound\",\"bearing\":\"\",\"destinationNaptanId\":\"940GZZLUMDN\",\"destinationName\":\"Morden Underground Station\",\"timestamp\":\"2017-02-14T08:43:46Z\",\"timeToStation\":1667,\"currentLocation\":\"At Angel platform\",\"towards\":\"Morden via Bank\",\"expectedArrival\":\"2017-02-14T09:11:33Z\",\"timeToLive\":\"2017-02-14T09:11:33Z\",\"modeName\":\"tube\",\"timing\":{\"$type\":\"Tfl.Api.Presentation.Entities.PredictionTiming, Tfl.Api.Presentation.Entities\",\"countdownServerAdjustment\":\"00:00:00\",\"source\":\"0001-01-01T00:00:00\",\"insert\":\"0001-01-01T00:00:00\",\"read\":\"2017-02-14T08:43:44.27Z\",\"sent\":\"2017-02-14T08:43:46Z\",\"received\":\"0001-01-01T00:00:00\"}},{\"$type\":\"Tfl.Api.Presentation.Entities.Prediction, Tfl.Api.Presentation.Entities\",\"id\":\"991149385\",\"operationType\":1,\"vehicleId\":\"054\",\"naptanId\":\"940GZZLUTBC\",\"stationName\":\"Tooting Bec Underground Station\",\"lineId\":\"northern\",\"lineName\":\"Northern\",\"platformName\":\"Southbound - Platform 2\",\"direction\":\"inbound\",\"bearing\":\"\",\"destinationNaptanId\":\"940GZZLUMDN\",\"destinationName\":\"Morden Underground Station\",\"timestamp\":\"2017-02-14T08:43:46Z\",\"timeToStation\":407,\"currentLocation\":\"Approaching Clapham Common\",\"towards\":\"Morden via Bank\",\"expectedArrival\":\"2017-02-14T08:50:33Z\",\"timeToLive\":\"2017-02-14T08:50:33Z\",\"modeName\":\"tube\",\"timing\":{\"$type\":\"Tfl.Api.Presentation.Entities.PredictionTiming, Tfl.Api.Presentation.Entities\",\"countdownServerAdjustment\":\"00:00:00\",\"source\":\"0001-01-01T00:00:00\",\"insert\":\"0001-01-01T00:00:00\",\"read\":\"2017-02-14T08:43:44.176Z\",\"sent\":\"2017-02-14T08:43:46Z\",\"received\":\"0001-01-01T00:00:00\"}},{\"$type\":\"Tfl.Api.Presentation.Entities.Prediction, Tfl.Api.Presentation.Entities\",\"id\":\"-1639183634\",\"operationType\":1,\"vehicleId\":\"055\",\"naptanId\":\"940GZZLUTBC\",\"stationName\":\"Tooting Bec Underground Station\",\"lineId\":\"northern\",\"lineName\":\"Northern\",\"platformName\":\"Southbound - Platform 2\",\"direction\":\"inbound\",\"bearing\":\"\",\"destinationNaptanId\":\"940GZZLUMDN\",\"destinationName\":\"Morden Underground Station\",\"timestamp\":\"2017-02-14T08:43:46Z\",\"timeToStation\":827,\"currentLocation\":\"Approaching Oval Platform 2\",\"towards\":\"Morden via Bank\",\"expectedArrival\":\"2017-02-14T08:57:33Z\",\"timeToLive\":\"2017-02-14T08:57:33Z\",\"modeName\":\"tube\",\"timing\":{\"$type\":\"Tfl.Api.Presentation.Entities.PredictionTiming, Tfl.Api.Presentation.Entities\",\"countdownServerAdjustment\":\"00:00:00\",\"source\":\"0001-01-01T00:00:00\",\"insert\":\"0001-01-01T00:00:00\",\"read\":\"2017-02-14T08:43:44.207Z\",\"sent\":\"2017-02-14T08:43:46Z\",\"received\":\"0001-01-01T00:00:00\"}},{\"$type\":\"Tfl.Api.Presentation.Entities.Prediction, Tfl.Api.Presentation.Entities\",\"id\":\"-35355117\",\"operationType\":1,\"vehicleId\":\"056\",\"naptanId\":\"940GZZLUTBC\",\"stationName\":\"Tooting Bec Underground Station\",\"lineId\":\"northern\",\"lineName\":\"Northern\",\"platformName\":\"Southbound - Platform 2\",\"direction\":\"inbound\",\"bearing\":\"\",\"destinationNaptanId\":\"940GZZLUMDN\",\"destinationName\":\"Morden Underground Station\",\"timestamp\":\"2017-02-14T08:43:46Z\",\"timeToStation\":1127,\"currentLocation\":\"Between London Bridge and Borough\",\"towards\":\"Morden via Bank\",\"expectedArrival\":\"2017-02-14T09:02:33Z\",\"timeToLive\":\"2017-02-14T09:02:33Z\",\"modeName\":\"tube\",\"timing\":{\"$type\":\"Tfl.Api.Presentation.Entities.PredictionTiming, Tfl.Api.Presentation.Entities\",\"countdownServerAdjustment\":\"00:00:00\",\"source\":\"0001-01-01T00:00:00\",\"insert\":\"0001-01-01T00:00:00\",\"read\":\"2017-02-14T08:43:44.239Z\",\"sent\":\"2017-02-14T08:43:46Z\",\"received\":\"0001-01-01T00:00:00\"}},{\"$type\":\"Tfl.Api.Presentation.Entities.Prediction, Tfl.Api.Presentation.Entities\",\"id\":\"1394414520\",\"operationType\":1,\"vehicleId\":\"057\",\"naptanId\":\"940GZZLUTBC\",\"stationName\":\"Tooting Bec Underground Station\",\"lineId\":\"northern\",\"lineName\":\"Northern\",\"platformName\":\"Southbound - Platform 2\",\"direction\":\"inbound\",\"bearing\":\"\",\"destinationNaptanId\":\"940GZZLUMDN\",\"destinationName\":\"Morden Underground Station\",\"timestamp\":\"2017-02-14T08:43:46Z\",\"timeToStation\":1367,\"currentLocation\":\"At Moorgate Platform 8\",\"towards\":\"Morden via Bank\",\"expectedArrival\":\"2017-02-14T09:06:33Z\",\"timeToLive\":\"2017-02-14T09:06:33Z\",\"modeName\":\"tube\",\"timing\":{\"$type\":\"Tfl.Api.Presentation.Entities.PredictionTiming, Tfl.Api.Presentation.Entities\",\"countdownServerAdjustment\":\"00:00:00\",\"source\":\"0001-01-01T00:00:00\",\"insert\":\"0001-01-01T00:00:00\",\"read\":\"2017-02-14T08:43:44.254Z\",\"sent\":\"2017-02-14T08:43:46Z\",\"received\":\"0001-01-01T00:00:00\"}},{\"$type\":\"Tfl.Api.Presentation.Entities.Prediction, Tfl.Api.Presentation.Entities\",\"id\":\"-436461532\",\"operationType\":1,\"vehicleId\":\"063\",\"naptanId\":\"940GZZLUTBC\",\"stationName\":\"Tooting Bec Underground Station\",\"lineId\":\"northern\",\"lineName\":\"Northern\",\"platformName\":\"Southbound - Platform 2\",\"direction\":\"inbound\",\"bearing\":\"\",\"destinationNaptanId\":\"940GZZLUMDN\",\"destinationName\":\"Morden Underground Station\",\"timestamp\":\"2017-02-14T08:43:46Z\",\"timeToStation\":707,\"currentLocation\":\"At Oval Platform 2\",\"towards\":\"Morden via Bank\",\"expectedArrival\":\"2017-02-14T08:55:33Z\",\"timeToLive\":\"2017-02-14T08:55:33Z\",\"modeName\":\"tube\",\"timing\":{\"$type\":\"Tfl.Api.Presentation.Entities.PredictionTiming, Tfl.Api.Presentation.Entities\",\"countdownServerAdjustment\":\"00:00:00\",\"source\":\"0001-01-01T00:00:00\",\"insert\":\"0001-01-01T00:00:00\",\"read\":\"2017-02-14T08:43:44.207Z\",\"sent\":\"2017-02-14T08:43:46Z\",\"received\":\"0001-01-01T00:00:00\"}},{\"$type\":\"Tfl.Api.Presentation.Entities.Prediction, Tfl.Api.Presentation.Entities\",\"id\":\"991214921\",\"operationType\":1,\"vehicleId\":\"064\",\"naptanId\":\"940GZZLUTBC\",\"stationName\":\"Tooting Bec Underground Station\",\"lineId\":\"northern\",\"lineName\":\"Northern\",\"platformName\":\"Southbound - Platform 2\",\"direction\":\"inbound\",\"bearing\":\"\",\"destinationNaptanId\":\"940GZZLUMDN\",\"destinationName\":\"Morden Underground Station\",\"timestamp\":\"2017-02-14T08:43:46Z\",\"timeToStation\":1487,\"currentLocation\":\"At Old Street Platform 2\",\"towards\":\"Morden via Bank\",\"expectedArrival\":\"2017-02-14T09:08:33Z\",\"timeToLive\":\"2017-02-14T09:08:33Z\",\"modeName\":\"tube\",\"timing\":{\"$type\":\"Tfl.Api.Presentation.Entities.PredictionTiming, Tfl.Api.Presentation.Entities\",\"countdownServerAdjustment\":\"00:00:00\",\"source\":\"0001-01-01T00:00:00\",\"insert\":\"0001-01-01T00:00:00\",\"read\":\"2017-02-14T08:43:44.254Z\",\"sent\":\"2017-02-14T08:43:46Z\",\"received\":\"0001-01-01T00:00:00\"}},{\"$type\":\"Tfl.Api.Presentation.Entities.Prediction, Tfl.Api.Presentation.Entities\",\"id\":\"589651739\",\"operationType\":1,\"vehicleId\":\"101\",\"naptanId\":\"940GZZLUTBC\",\"stationName\":\"Tooting Bec Underground Station\",\"lineId\":\"northern\",\"lineName\":\"Northern\",\"platformName\":\"Northbound - Platform 1\",\"direction\":\"outbound\",\"bearing\":\"\",\"destinationNaptanId\":\"940GZZLUMHL\",\"destinationName\":\"Mill Hill East Underground Station\",\"timestamp\":\"2017-02-14T08:43:46Z\",\"timeToStation\":407,\"currentLocation\":\"Approaching South Wimbledon\",\"towards\":\"Mill Hill East via CX\",\"expectedArrival\":\"2017-02-14T08:50:33Z\",\"timeToLive\":\"2017-02-14T08:50:33Z\",\"modeName\":\"tube\",\"timing\":{\"$type\":\"Tfl.Api.Presentation.Entities.PredictionTiming, Tfl.Api.Presentation.Entities\",\"countdownServerAdjustment\":\"00:00:00\",\"source\":\"0001-01-01T00:00:00\",\"insert\":\"0001-01-01T00:00:00\",\"read\":\"2017-02-14T08:43:44.161Z\",\"sent\":\"2017-02-14T08:43:46Z\",\"received\":\"0001-01-01T00:00:00\"}},{\"$type\":\"Tfl.Api.Presentation.Entities.Prediction, Tfl.Api.Presentation.Entities\",\"id\":\"-846347274\",\"operationType\":1,\"vehicleId\":\"110\",\"naptanId\":\"940GZZLUTBC\",\"stationName\":\"Tooting Bec Underground Station\",\"lineId\":\"northern\",\"lineName\":\"Northern\",\"platformName\":\"Southbound - Platform 2\",\"direction\":\"inbound\",\"bearing\":\"\",\"destinationNaptanId\":\"940GZZLUMDN\",\"destinationName\":\"Morden Underground Station\",\"timestamp\":\"2017-02-14T08:43:46Z\",\"timeToStation\":947,\"currentLocation\":\"At Elephant and Castle Platform 2\",\"towards\":\"Morden via Bank\",\"expectedArrival\":\"2017-02-14T08:59:33Z\",\"timeToLive\":\"2017-02-14T08:59:33Z\",\"modeName\":\"tube\",\"timing\":{\"$type\":\"Tfl.Api.Presentation.Entities.PredictionTiming, Tfl.Api.Presentation.Entities\",\"countdownServerAdjustment\":\"00:00:00\",\"source\":\"0001-01-01T00:00:00\",\"insert\":\"0001-01-01T00:00:00\",\"read\":\"2017-02-14T08:43:44.223Z\",\"sent\":\"2017-02-14T08:43:46Z\",\"received\":\"0001-01-01T00:00:00\"}},{\"$type\":\"Tfl.Api.Presentation.Entities.Prediction, Tfl.Api.Presentation.Entities\",\"id\":\"-436723675\",\"operationType\":1,\"vehicleId\":\"123\",\"naptanId\":\"940GZZLUTBC\",\"stationName\":\"Tooting Bec Underground Station\",\"lineId\":\"northern\",\"lineName\":\"Northern\",\"platformName\":\"Northbound - Platform 1\",\"direction\":\"outbound\",\"bearing\":\"\",\"destinationNaptanId\":\"940GZZLUHBT\",\"destinationName\":\"High Barnet Underground Station\",\"timestamp\":\"2017-02-14T08:43:46Z\",\"timeToStation\":137,\"currentLocation\":\"At Tooting Broadway Platform 1\",\"towards\":\"High Barnet via Bank\",\"expectedArrival\":\"2017-02-14T08:46:03Z\",\"timeToLive\":\"2017-02-14T08:46:03Z\",\"modeName\":\"tube\",\"timing\":{\"$type\":\"Tfl.Api.Presentation.Entities.PredictionTiming, Tfl.Api.Presentation.Entities\",\"countdownServerAdjustment\":\"00:00:00\",\"source\":\"0001-01-01T00:00:00\",\"insert\":\"0001-01-01T00:00:00\",\"read\":\"2017-02-14T08:43:44.145Z\",\"sent\":\"2017-02-14T08:43:46Z\",\"received\":\"0001-01-01T00:00:00\"}},{\"$type\":\"Tfl.Api.Presentation.Entities.Prediction, Tfl.Api.Presentation.Entities\",\"id\":\"-2042506112\",\"operationType\":1,\"vehicleId\":\"142\",\"naptanId\":\"940GZZLUTBC\",\"stationName\":\"Tooting Bec Underground Station\",\"lineId\":\"northern\",\"lineName\":\"Northern\",\"platformName\":\"Northbound - Platform 1\",\"direction\":\"outbound\",\"bearing\":\"\",\"destinationNaptanId\":\"940GZZLUEGW\",\"destinationName\":\"Edgware Underground Station\",\"timestamp\":\"2017-02-14T08:43:46Z\",\"timeToStation\":347,\"currentLocation\":\"Departed South Wimbledon\",\"towards\":\"Edgware via Bank\",\"expectedArrival\":\"2017-02-14T08:49:33Z\",\"timeToLive\":\"2017-02-14T08:49:33Z\",\"modeName\":\"tube\",\"timing\":{\"$type\":\"Tfl.Api.Presentation.Entities.PredictionTiming, Tfl.Api.Presentation.Entities\",\"countdownServerAdjustment\":\"00:00:00\",\"source\":\"0001-01-01T00:00:00\",\"insert\":\"0001-01-01T00:00:00\",\"read\":\"2017-02-14T08:43:44.145Z\",\"sent\":\"2017-02-14T08:43:46Z\",\"received\":\"0001-01-01T00:00:00\"}},{\"$type\":\"Tfl.Api.Presentation.Entities.Prediction, Tfl.Api.Presentation.Entities\",\"id\":\"-839728138\",\"operationType\":1,\"vehicleId\":\"160\",\"naptanId\":\"940GZZLUTBC\",\"stationName\":\"Tooting Bec Underground Station\",\"lineId\":\"northern\",\"lineName\":\"Northern\",\"platformName\":\"Southbound - Platform 2\",\"direction\":\"inbound\",\"bearing\":\"\",\"destinationNaptanId\":\"940GZZLUMDN\",\"destinationName\":\"Morden Underground Station\",\"timestamp\":\"2017-02-14T08:43:46Z\",\"timeToStation\":587,\"currentLocation\":\"At Stockwell Platform 3\",\"towards\":\"Morden via Bank\",\"expectedArrival\":\"2017-02-14T08:53:33Z\",\"timeToLive\":\"2017-02-14T08:53:33Z\",\"modeName\":\"tube\",\"timing\":{\"$type\":\"Tfl.Api.Presentation.Entities.PredictionTiming, Tfl.Api.Presentation.Entities\",\"countdownServerAdjustment\":\"00:00:00\",\"source\":\"0001-01-01T00:00:00\",\"insert\":\"0001-01-01T00:00:00\",\"read\":\"2017-02-14T08:43:44.192Z\",\"sent\":\"2017-02-14T08:43:46Z\",\"received\":\"0001-01-01T00:00:00\"}},{\"$type\":\"Tfl.Api.Presentation.Entities.Prediction, Tfl.Api.Presentation.Entities\",\"id\":\"590044955\",\"operationType\":1,\"vehicleId\":\"161\",\"naptanId\":\"940GZZLUTBC\",\"stationName\":\"Tooting Bec Underground Station\",\"lineId\":\"northern\",\"lineName\":\"Northern\",\"platformName\":\"Southbound - Platform 2\",\"direction\":\"inbound\",\"bearing\":\"\",\"destinationNaptanId\":\"940GZZLUMDN\",\"destinationName\":\"Morden Underground Station\",\"timestamp\":\"2017-02-14T08:43:46Z\",\"timeToStation\":1547,\"currentLocation\":\"At Warren Street Platform 2\",\"towards\":\"Morden via CX\",\"expectedArrival\":\"2017-02-14T09:09:33Z\",\"timeToLive\":\"2017-02-14T09:09:33Z\",\"modeName\":\"tube\",\"timing\":{\"$type\":\"Tfl.Api.Presentation.Entities.PredictionTiming, Tfl.Api.Presentation.Entities\",\"countdownServerAdjustment\":\"00:00:00\",\"source\":\"0001-01-01T00:00:00\",\"insert\":\"0001-01-01T00:00:00\",\"read\":\"2017-02-14T08:43:44.27Z\",\"sent\":\"2017-02-14T08:43:46Z\",\"received\":\"0001-01-01T00:00:00\"}}]"
  end


  # Journey Data

  def get_possible_stops("940GZZLUTBC", "northern") do
    "[{\"$type\":\"Tfl.Api.Presentation.Entities.Identifier, Tfl.Api.Presentation.Entities\",\"id\":\"940GZZLUACY\",\"name\":\"Archway Underground Station\",\"uri\":\"/StopPoint/940GZZLUACY\",\"type\":\"StopPoint\"},{\"$type\":\"Tfl.Api.Presentation.Entities.Identifier, Tfl.Api.Presentation.Entities\",\"id\":\"940GZZLUAGL\",\"name\":\"Angel Underground Station\",\"uri\":\"/StopPoint/940GZZLUAGL\",\"type\":\"StopPoint\"},{\"$type\":\"Tfl.Api.Presentation.Entities.Identifier, Tfl.Api.Presentation.Entities\",\"id\":\"940GZZLUBLM\",\"name\":\"Balham Underground Station\",\"uri\":\"/StopPoint/940GZZLUBLM\",\"type\":\"StopPoint\"},{\"$type\":\"Tfl.Api.Presentation.Entities.Identifier, Tfl.Api.Presentation.Entities\",\"id\":\"940GZZLUBNK\",\"name\":\"Bank Underground Station\",\"uri\":\"/StopPoint/940GZZLUBNK\",\"type\":\"StopPoint\"}]"
  end

  def get_possible_stops(_bad_station, _bad_line) do
    "[]"
  end

  def get_direction(originatorId, destinationId, lineId) do
    # return the canonical direction between the two
  end


  @doc """
  Converts timestamp strings to DateTime objects.
  """
  def to_datetime(timestamp) do
    timestamp
    |> remove_ms
    |> add_timezone
    |> Timex.parse!("{ISO:Extended}")
  end

  defp remove_ms(timestamp) do
    case String.split(timestamp, ".") do
      [time, _ms] ->
        time
      [_time] ->
        timestamp
    end
  end

  defp add_timezone(string), do: "#{string}Z"

end
