// scripts/seed.js
import mongoose from "mongoose";
import dotenv from "dotenv";
import Hotel from "./models/hotelModel.js";
import Restaurant from "./models/restaurantModel.js";
import Place from "./models/placeModel.js";
import Transport from "./models/transportModel.js";

dotenv.config();
await mongoose.connect(process.env.MONGO_URI);

// 🏨 الفنادق
await Hotel.deleteMany();
await Hotel.insertMany([
  {
    id: "h1",
    name: "فندق الشام",
    description: "فندق فاخر وسط دمشق، يتميز بغرفه الأنيقة وخدماته الراقية...",
    images: ["assets/images/hotels/hotels1.WebP"],
    location: "دمشق",
    rating: 4.5,
    pricePerNight: 100,
    phoneNumber: "+963944123456",
  },
  {
    id: "h2",
    name: "فندق النخيل",
    description: "إطلالة خلابة على البحر الأبيض المتوسط...",
    images: ["assets/images/hotels/hotels2.WebP"],
    location: "اللاذقية",
    rating: 4.3,
    pricePerNight: 120,
    phoneNumber: "+963993654321",
  },
  // أكمل باقي الفنادق بنفس النمط...
]);

// 🍽️ المطاعم
await Restaurant.deleteMany();
await Restaurant.insertMany([
  {
    id: "r1",
    name: "مطعم السلطان",
    description: "مطعم شرقي فاخر...",
    images: ["assets/images/restaurants/restaurants1.WebP"],
    location: "دمشق",
    rating: 4.6,
    cuisineType: "شرقي",
    phoneNumber: "+963946112358",
  },
  {
    id: "r2",
    name: "مطعم البحر",
    description: "مطعم بحري بإطلالة ساحلية...",
    images: ["assets/images/restaurants/restaurants2.WebP"],
    location: "اللاذقية",
    rating: 4.5,
    cuisineType: "بحري",
    phoneNumber: "+963942223344",
  },
  // أكمل باقي المطاعم بنفس النمط...
]);

// 🏞️ الأماكن السياحية
await Place.deleteMany();
await Place.insertMany([
  {
    id: "p1",
    name: "قلعة حلب",
    description: "معلم أثري ضخم يعود للعصور الوسطى...",
    images: ["assets/images/attractions/attractions1.WebP", "assets/images/attractions/attractions2.WebP"],
    location: "حلب",
    rating: 4.8,
    category: "attraction",
  },
  {
    id: "p2",
    name: "الجامع الأموي",
    description: "تحفة معمارية إسلامية فريدة...",
    images: ["assets/images/attractions/attractions2.WebP"],
    location: "دمشق",
    rating: 4.9,
    category: "attraction",
  },
  // أكمل باقي الأماكن بنفس النمط...
]);

// 🚗 وسائل النقل
await Transport.deleteMany();
await Transport.insertMany([
  {
    id: "t4",
    name: "خدمة VIP",
    description: "نقل فاخر بسيارات خاصة.",
    images: ["assets/images/transport/transport1.WebP"],
    location: "طرطوس",
    rating: 4.5,
    type: "فاخر",
    fare: 50.0,
  },
  {
    id: "t5",
    name: "ميني فان عائلي",
    description: "مناسب للعائلات والمجموعات.",
    images: ["assets/images/transport/transport2.WebP"],
    location: "حمص",
    rating: 4.3,
    type: "ميني فان",
    fare: 35.0,
  },
  // أكمل باقي وسائل النقل بنفس النمط...
]);

console.log("✅ تم إدخال جميع البيانات بنجاح");
process.exit();
