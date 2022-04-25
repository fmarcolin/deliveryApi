defmodule DeliveryApi.Orders.ReportRunner do
  use GenServer

  require Logger

  alias DeliveryApi.Orders.Report

  # Client

  def start_link(_initial_state) do
    GenServer.start_link(__MODULE__, %{})
  end

  # Server

  @impl true
  def init(state) do
    Logger.info("Report runner started!")
    schedule_report_generation()
    {:ok, state}
  end

  @impl true
  def handle_info(:generate, state) do
    Logger.info("Generating report....")

    Report.create()
    schedule_report_generation()

    {:noreply, state}
  end

  def schedule_report_generation do
    time_twelve_hours = 1000 * 60 * 60 * 12
    Process.send_after(self(), :generate, time_twelve_hours)
  end
end
