defmodule Syndyasmos do
  @ousiastika ~w{
    Νεράιδα
    νάνος
    καρχαρίας
    πεταλούδα
    χελώνα
    ιππότης
    δράκος
    φάντασμα
    κουνούπι
    πειρατής
    κρεβάτι
    ποτήρι
    τσάντα
    πινέλο
  }

  @rimata ~w{
    σφουγγαρίζει
    χτενίζει
    ονειρεύεται
    μαγειρεύει
    κολυμπάει
    νανουρίζει
    πετάει
    φοβάται
    νομίζει
    μπορεί
    σκουπίζει
    μπερδεύεται
    στεναχωριέται
    χαίρεται
  }

  @epitheta ~w{
    στρογγυλός
    ξύλινος
    κίτρινος
    ψηλός
    χάρτινος
    ευαίσθητος
    χνουδωτός
    νόστιμος
    δυνατός
    πολύχρωμος
    καινούριος
    μελωδικός
  }

  def combinations() do
    for ousiastiko <- @ousiastika, rima <- @rimata, epitheto <- @epitheta do
      [ousiastiko, rima, epitheto]
    end
  end

  def randomize(list) do
    l = length(list)

    1..l
    |> Enum.map(fn _ -> :rand.uniform(l) end)
    |> Enum.zip(list)
    |> Enum.sort_by(fn {n, _} -> n end)
    |> Enum.map(fn {n, list} -> list end)
  end

  def create(number \\ 3) do
    combinations()
    |> randomize()
    |> Enum.take(number)
  end
end
