import '../models/place_model.dart';
import '../models/hotel_model.dart';
import '../models/restaurant_model.dart';
import '../models/transport_model.dart';

class MockData {
  static List<HotelModel> hotels = [
    HotelModel(id: 'h1', name: 'فندق الشام', description: 'فندق فاخر وسط دمشق، يتميز بغرفه الأنيقة وخدماته الراقية. قريب من الأسواق والمطاعم الشهيرة، ويوفر تجربة إقامة مريحة للنزلاء.', images: ['assets/images/hotels/hotels1.WebP'], location: 'دمشق', rating: 4.5, pricePerNight: 100 , phoneNumber: '+963944123456', ),
    HotelModel(id: 'h2', name: 'فندق النخيل', description: 'إطلالة خلابة على البحر الأبيض المتوسط، مع شاطئ خاص ومرافق ترفيهية. مثالي لقضاء عطلة رومانسية أو عائلية.', images: ['assets/images/hotels/hotels2.WebP'], location: 'اللاذقية', rating: 4.3, pricePerNight: 120, phoneNumber: '+963993654321',),
    HotelModel(id: 'h3', name: 'فندق الياسمين', description: 'أجواء هادئة وخدمة ممتازة في قلب حمص. يتميز بتصميمه الكلاسيكي وحديقته الداخلية، ويوفر إفطارًا شهيًا يوميًا.', images: ['assets/images/hotels/hotels3.WebP'], location: 'حمص', rating: 4.2, pricePerNight: 90, phoneNumber: '+963945987654',),
    HotelModel(id: 'h4', name: 'فندق القلعة', description: 'قريب من المعالم التاريخية في حلب، ويجمع بين الطراز الشرقي والخدمة الحديثة. مناسب لمحبي الثقافة والتاريخ.', images: ['assets/images/hotels/hotels4.WebP'], location: 'حلب', rating: 4.6, pricePerNight: 110, phoneNumber: '+963941112233',),
    HotelModel(id: 'h5', name: 'فندق الزهراء', description: 'مناسب للعائلات والسياح، مع غرف واسعة ومرافق للأطفال. يقع في منطقة هادئة ويوفر خدمة نقل مجانية للشاطئ.', images: ['assets/images/hotels/hotels5.WebP'], location: 'طرطوس', rating: 4.1, pricePerNight: 80, phoneNumber: '+963996443322',),
    HotelModel(id: 'h6', name: 'فندق المرجان', description: 'خدمة خمس نجوم في قلب دير الزور، مع مطعم فاخر ومركز لياقة بدنية. مثالي لرجال الأعمال والمسافرين الباحثين عن الراحة.', images: ['assets/images/hotels/hotels6.WebP'], location: 'دير الزور', rating: 4.7, pricePerNight: 130, phoneNumber: '+963112345678',),
    HotelModel(id: 'h7', name: 'فندق الريف', description: 'إقامة ريفية مريحة وسط الطبيعة الخلابة في السويداء. يوفر جلسات خارجية وحديقة واسعة للاسترخاء.', images: ['assets/images/hotels/hotels7.WebP'], location: 'السويداء', rating: 4.0, pricePerNight: 70, phoneNumber: '+963943778899',),
    HotelModel(id: 'h8', name: 'فندق النور', description: 'موقع مركزي وخدمة سريعة في إدلب. قريب من الأسواق والمواصلات، ويتميز بنظافته وسعره المناسب.', images: ['assets/images/hotels/hotels8.WebP'], location: 'إدلب', rating: 4.4, pricePerNight: 95, phoneNumber: '+963992334455',),
    HotelModel(id: 'h9', name: 'فندق الفصول الأربعة', description: 'منتجع متكامل في الرقة، يضم مسابح ومرافق سبا. تجربة فاخرة لجميع الفصول، مع خدمة عملاء ممتازة.', images: ['assets/images/hotels/hotels9.WebP'], location: 'الرقة', rating: 4.8, pricePerNight: 150, phoneNumber: '+963995667788',),
    HotelModel(id: 'h10', name: 'فندق الهدى', description: 'هدوء وراحة للنزلاء في الحسكة، مع غرف عازلة للصوت ومرافق حديثة. مثالي للراحة بعد يوم طويل من السفر.', images: ['assets/images/hotels/hotels10.WebP'], location: 'الحسكة', rating: 4.2, pricePerNight: 85, phoneNumber: '+963944556677',),
  ];

  static List<RestaurantModel> restaurants = [
    RestaurantModel(id: 'r1', name: 'مطعم السلطان', description: 'يقدم مطعم السلطان تجربة شرقية فاخرة تجمع بين المشاوي والمقبلات التقليدية في أجواء أنيقة وسط دمشق.', images: ['assets/images/restaurants/restaurants1.WebP'], location: 'دمشق', rating: 4.6, cuisineType: 'شرقي', phoneNumber: '+963946112358',),
    RestaurantModel(id: 'r2', name: 'مطعم البحر', description: 'مطعم البحر متخصص في تقديم الأسماك الطازجة والمأكولات البحرية مع إطلالة خلابة على ساحل اللاذقية.', images: ['assets/images/restaurants/restaurants2.WebP'], location: 'اللاذقية', rating: 4.5, cuisineType: 'بحري', phoneNumber: '+963942223344',),
    RestaurantModel(id: 'r3', name: 'مطعم الريف', description: 'مطعم الريف ينقلك إلى أجواء الريف السوري بأطباقه التقليدية المحضّرة من مكونات محلية وديكور خشبي بسيط.', images: ['assets/images/restaurants/restaurants3.WebP'], location: 'السويداء', rating: 4.3, cuisineType: 'ريفي', phoneNumber: '+963112345678',),
    RestaurantModel(id: 'r4', name: 'مطعم إيطاليا', description: 'مطعم إيطاليا يقدم بيتزا ومعكرونة أصلية بصلصات متنوعة في أجواء رومانسية مستوحاة من المطاعم الإيطالية.', images: ['assets/images/restaurants/restaurants4.WebP'], location: 'حمص', rating: 4.4, cuisineType: 'إيطالي', phoneNumber: '+963994889900',),
    RestaurantModel(id: 'r5', name: 'مطعم الهند', description: 'مطعم الهند يقدم نكهات حارة وتوابل قوية في أطباق هندية متنوعة تشمل الكاري والتندوري والخبز التقليدي.', images: ['assets/images/restaurants/restaurants5.WebP'], location: 'حلب', rating: 4.2, cuisineType: 'هندي', phoneNumber: '+963943147258',),
    RestaurantModel(id: 'r6', name: 'مطعم الصين', description: 'مطعم الصين يوفر تجربة آسيوية مميزة تشمل النودلز والسوشي والأرز المقلي في ديكور مستوحى من الثقافة الصينية.', images: ['assets/images/restaurants/restaurants6.WebP'], location: 'طرطوس', rating: 4.1, cuisineType: 'صيني', phoneNumber: '+963112345678',),
    RestaurantModel(id: 'r7', name: 'مطعم الزهراء', description: 'مطعم الزهراء يقدم مجموعة فاخرة من الحلويات الشرقية والمشروبات المنعشة في جلسات خارجية مريحة.', images: ['assets/images/restaurants/restaurants7.WebP'], location: 'دير الزور', rating: 4.0, cuisineType: 'حلويات', phoneNumber: '+963990112233',),
    RestaurantModel(id: 'r8', name: 'مطعم الشام', description: 'مطعم الشام يقدم أطباق شامية أصيلة مثل الكبة والمشاوي والتبولة في أجواء تراثية وخدمة ضيافة ممتازة.', images: ['assets/images/restaurants/restaurants8.WebP'], location: 'إدلب', rating: 4.7, cuisineType: 'شامي', phoneNumber: '+963944789456',),
    RestaurantModel(id: 'r9', name: 'مطعم باريس', description: 'مطعم باريس يقدم أطباق فرنسية راقية وحلويات فنية مميزة في أجواء أنيقة تناسب المناسبات الخاصة.', images: ['assets/images/restaurants/restaurants9.WebP'], location: 'الرقة', rating: 4.5, cuisineType: 'فرنسي', phoneNumber: '+963995321654',),
    RestaurantModel(id: 'r10', name: 'مطعم الأندلس', description: 'مطعم الأندلس يجمع بين الأجواء الأندلسية الساحرة والمأكولات المستوحاة من المطبخ الإسباني والعربي.', images: ['assets/images/restaurants/restaurants10.WebP'], location: 'الحسكة', rating: 4.6, cuisineType: 'أندلسي', phoneNumber: '+963942654987',),
  ];

  static List<PlaceModel> attractions = [
    PlaceModel(id: 'p1', name: 'قلعة حلب', description: 'معلم أثري ضخم يعود للعصور الوسطى، يتميز بجدرانه المحصنة وتصميمه الدفاعي ويُعد من أبرز رموز التاريخ السوري القديم.', images: ['assets/images/attractions/attractions1.WebP','assets/images/attractions/attractions2.WebP' ], location: 'حلب', rating: 4.8),
    PlaceModel(id: 'p2', name: 'الجامع الأموي', description: 'تحفة معمارية إسلامية فريدة من نوعها، تجمع بين الزخارف الدقيقة والمآذن الشاهقة وتُعد من أقدم دور العبادة في العالم الإسلامي.', images: ['assets/images/attractions/attractions2.WebP'], location: 'دمشق', rating: 4.9),
    PlaceModel(id: 'p3', name: 'النافورة الملونة', description: 'موقع سياحي عصري ينبض بالحيوية، حيث تتراقص المياه الملونة على أنغام الموسيقى في عرض ليلي ساحر يجذب العائلات والزوار.', images: ['assets/images/attractions/attractions3.WebP'], location: 'حمص', rating: 4.4),
    PlaceModel(id: 'p4', name: 'شاطئ طرطوس', description: 'سوق شعبي تاريخي يقع في قلب المدينة القديمة، يضم محلات تقليدية وممرات حجرية ويعكس روح التجارة الدمشقية الأصيلة.', images: ['assets/images/attractions/attractions4.WebP'], location: 'طرطوس', rating: 4.5),
    PlaceModel(id: 'p5', name: 'سوق الحميدية', description: 'شاطئ رملي واسع يمتد على طول الساحل، يتميز بمياهه النقية وأجوائه الهادئة ويُعد وجهة مثالية لمحبي السباحة والاسترخاء.', images: ['assets/images/attractions/attractions5.WebP'], location: 'دمشق', rating: 4.6),
    PlaceModel(id: 'p6', name: 'جبل قاسيون', description: 'جبل مرتفع يطل على المدينة بمنظر بانورامي خلاب، يُعد نقطة جذب مفضلة لمشاهدة غروب الشمس والتقاط الصور التذكارية.', images: ['assets/images/attractions/attractions6.WebP'], location: 'دمشق', rating: 4.7),
    PlaceModel(id: 'p7', name: 'حديقة تشرين', description: 'حديقة عامة ضخمة تحتوي على مساحات خضراء وممرات للمشي ومناطق لعب للأطفال، وتُعد متنفسًا طبيعيًا لسكان المدينة.', images: ['assets/images/attractions/attractions7.WebP'], location: 'دمشق', rating: 4.3),
    PlaceModel(id: 'p8', name: 'متحف حلب الوطني', description: 'متحف أثري يضم مقتنيات نادرة من حضارات سوريا القديمة، ويشكل وجهة تعليمية وثقافية لعشاق التاريخ والتراث الإنساني.', images: ['assets/images/attractions/attractions8.WebP'], location: 'حلب', rating: 4.6),
    PlaceModel(id: 'p9', name: 'سوق الذهب', description: 'مركز تسوق فاخر للمجوهرات، يضم محلات متخصصة في الذهب والمجوهرات بتصاميم متنوعة تناسب جميع الأذواق والمناسبات.', images: ['assets/images/attractions/attractions9.WebP'], location: 'حمص', rating: 4.2),
    PlaceModel(id: 'p10', name: 'المدينة القديمة', description: 'منطقة تراثية في قلب المدينة القديمة، تتميز بشوارعها الضيقة ومنازلها الحجرية وتمنح الزائر تجربة غنية بعبق التاريخ.', images: ['assets/images/attractions/attractionss.WebP'], location: 'دمشق', rating: 4.8),
  ];
  static List<TransportModel> transports = [
    TransportModel(id: 't4', name: 'خدمة VIP', description: 'نقل فاخر بسيارات خاصة.', images: ['assets/images/transport/transport1.WebP'], location: 'طرطوس', rating: 4.5, type: 'فاخر', fare: 50.0),
    TransportModel(id: 't5', name: 'ميني فان عائلي', description: 'مناسب للعائلات والمجموعات.', images: ['assets/images/transport/transport2.WebP'], location: 'حمص', rating: 4.3, type: 'ميني فان', fare: 35.0),
    TransportModel(id: 't6', name: 'دراجات هوائية', description: 'تنقل بيئي داخل المدينة.', images: ['assets/images/transport/transport3.WebP'], location: 'دمشق', rating: 4.1, type: 'دراجة', fare: 10.0),
    TransportModel(id: 't7', name: 'خدمة التوصيل السريع', description: 'توصيل مستعجل للطرود.', images: ['assets/images/transport/transport4.WebP'], location: 'حلب', rating: 4.4, type: 'توصيل', fare: 20.0),
    TransportModel(id: 't8', name: 'سيارات أجرة كهربائية', description: 'نقل صديق للبيئة.', images: ['assets/images/transport/transport5.WebP'], location: 'اللاذقية', rating: 4.6, type: 'تاكسي كهربائي', fare: 6.0),
    TransportModel(id: 't9', name: 'باص سياحي', description: 'جولات سياحية منظمة.', images: ['assets/images/transport/transport6.WebP'], location: 'دمشق', rating: 4.7, type: 'باص سياحي', fare: 15.0),
    TransportModel(id: 't10', name: 'تأجير سكوتر كهربائي', description: 'تنقل فردي سريع.', images: ['assets/images/transport/transport7.WebP'], location: 'حمص', rating: 4.2, type: 'سكوتر', fare: 12.0),
  ];
}
