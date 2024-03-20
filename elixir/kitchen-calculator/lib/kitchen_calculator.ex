defmodule KitchenCalculator do
  @cup_ml 240
  @fluid_ounce 30
  @teaspoon 5
  @tablespoon 15

  def get_volume({_unit, volume}) do
    volume
  end

  def to_milliliter(volume_pair = {:milliliter, _milliliter}) do
    volume_pair
  end
  def to_milliliter({:cup, cups}) do
    {:milliliter, cups * @cup_ml}
  end
  def to_milliliter({:fluid_ounce, fluid_ounce}) do
    {:milliliter, fluid_ounce * @fluid_ounce}
  end
  def to_milliliter({:teaspoon, teaspoon}) do
    {:milliliter, teaspoon * @teaspoon}
  end
  def to_milliliter({:tablespoon, tablespoon}) do
    {:milliliter, tablespoon * @tablespoon}
  end

  def from_milliliter({:milliliter, ml}, us_measurement_type = :cup) do
    {us_measurement_type, ml / @cup_ml}
  end
  def from_milliliter({:milliliter, ml}, us_measurement_type = :fluid_ounce) do
    {us_measurement_type, ml / @fluid_ounce}
  end
  def from_milliliter({:milliliter, ml}, us_measurement_type = :teaspoon) do
    {us_measurement_type, ml / @teaspoon}
  end
  def from_milliliter({:milliliter, ml}, us_measurement_type = :tablespoon) do
    {us_measurement_type, ml / @tablespoon}
  end
  def from_milliliter({:milliliter, ml}, _us_measurement_type = :milliliter) do
    {:milliliter, ml}
  end

  def convert(volume_pair, unit) do
    from_milliliter(to_milliliter(volume_pair), unit)
  end
end
