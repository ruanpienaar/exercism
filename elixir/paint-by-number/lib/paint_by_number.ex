defmodule PaintByNumber do
  @moduledoc """
    This module deals with bitstrings used for the binary pallet data
  """

  def palette_bit_size(color_count) do
    palette_bit_size(color_count, 0)
  end

  defp palette_bit_size(color_count, bit_size) do
    palette_bit_size(color_count, bit_size, color_count <= 2 ** bit_size)
  end

  defp palette_bit_size(_color_count, bit_size, true) do
    bit_size
  end

  defp palette_bit_size(color_count, bit_size, false) do
    palette_bit_size(color_count, bit_size + 1)
  end

  def empty_picture() do
    # Please implement the empty_picture/0 function
  end

  def test_picture() do
    # Please implement the test_picture/0 function
  end

  def prepend_pixel(picture, color_count, pixel_color_index) do
    # Please implement the prepend_pixel/3 function
  end

  def get_first_pixel(picture, color_count) do
    # Please implement the get_first_pixel/2 function
  end

  def drop_first_pixel(picture, color_count) do
    # Please implement the drop_first_pixel/2 function
  end

  def concat_pictures(picture1, picture2) do
    # Please implement the concat_pictures/2 function
  end
end
