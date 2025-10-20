import Place from "../models/placeModel.js";

/**
 * Controller for hotels (CRUD)
 */

export const getHotels = async (req, res) => {
  try {
    const hotels = await Place.find({ category: "hotel" }).sort({ createdAt: -1 });
    res.json(hotels);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};

export const getHotelById = async (req, res) => {
  try {
    const hotel = await Place.findOne({ _id: req.params.id, category: "hotel" });
    if (!hotel) return res.status(404).json({ message: "Hotel not found" });
    res.json(hotel);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};

export const createHotel = async (req, res) => {
  try {
    const payload = { ...req.body, category: "hotel" };
    const hotel = await Place.create(payload);
    res.status(201).json(hotel);
  } catch (err) {
    res.status(400).json({ message: err.message });
  }
};

export const updateHotel = async (req, res) => {
  try {
    const updated = await Place.findOneAndUpdate(
      { _id: req.params.id, category: "hotel" },
      req.body,
      { new: true }
    );
    if (!updated) return res.status(404).json({ message: "Hotel not found" });
    res.json(updated);
  } catch (err) {
    res.status(400).json({ message: err.message });
  }
};

export const deleteHotel = async (req, res) => {
  try {
    const deleted = await Place.findOneAndDelete({ _id: req.params.id, category: "hotel" });
    if (!deleted) return res.status(404).json({ message: "Hotel not found" });
    res.json({ message: "Hotel deleted" });
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};
