class Offering {
  const Offering(this.title, this.description);

  final String title;
  final String description;
}

class ServiceInfo {
  const ServiceInfo({
    required this.slug,
    required this.title,
    required this.eyebrow,
    required this.description,
    required this.image,
    required this.headline,
    required this.offerings,
    required this.process,
    this.faqs = const [],
  });

  final String slug;
  final String title;
  final String eyebrow;
  final String description;
  final String image;
  final String headline;
  final List<Offering> offerings;
  final List<Offering> process;
  final List<Offering> faqs;

  String get route => '/services/$slug';
  String get enquiry =>
      'Hello Hunters Group, I am interested in your $title. Please share more details.';
}

class MarketplaceInfo {
  const MarketplaceInfo({
    required this.slug,
    required this.name,
    required this.kind,
    required this.headline,
    required this.description,
    required this.services,
  });

  final String slug;
  final String name;
  final String kind;
  final String headline;
  final String description;
  final List<Offering> services;

  String get route => '/services/ecommerce/$slug';
}

const services = <ServiceInfo>[
  ServiceInfo(
    slug: 'ecommerce',
    title: 'E-Commerce Solutions',
    eyebrow: 'ONLINE BUSINESS SUPPORT',
    headline: 'Build a stronger online business.',
    description:
        'Practical e-commerce support to help businesses organise their online stores, manage operations and create better shopping experiences for their customers.',
    image: 'assets/images/services/ecommerce.png',
    offerings: [
      Offering(
        'Amazon Seller Services',
        'Seller account guidance, product research, listing optimisation and marketplace management.',
      ),
      Offering(
        'eBay Seller Services',
        'Organised listings, product optimisation and practical marketplace support.',
      ),
      Offering(
        'Etsy Shop Services',
        'Shop setup guidance, product listings, keyword research and shop optimisation.',
      ),
      Offering(
        'Shopify Store Services',
        'Professional store design, product organisation and essential integrations.',
      ),
      Offering(
        'Walmart Marketplace Services',
        'Seller setup guidance, product research, listing optimisation and performance support.',
      ),
      Offering(
        'TikTok Shop Services',
        'Shop setup, product listings, product presentation and social commerce operations.',
      ),
    ],
    process: [
      Offering('Understand your business', 'Tell us about your store, products and current challenges.'),
      Offering('Identify your requirements', 'Discuss the support and operational services you need.'),
      Offering('Plan the next steps', 'Review the scope, responsibilities and proposed workflow.'),
    ],
  ),
  ServiceInfo(
    slug: 'import',
    title: 'Import Services',
    eyebrow: 'INTERNATIONAL TRADE SUPPORT',
    headline: 'Import solutions for your growing business.',
    description:
        'Simplify your import journey with supplier sourcing, order coordination, shipping guidance and support throughout the process.',
    image: 'assets/images/services/import.png',
    offerings: [
      Offering('Supplier Sourcing', 'Find suitable international suppliers and explore products that match your business requirements.'),
      Offering('Product & Order Coordination', 'Coordinate product specifications, order details and supplier communication.'),
      Offering('International Shipping', 'Explore practical transportation options for imported goods.'),
      Offering('Import Documentation Support', 'Understand documentation and compliance requirements that may apply.'),
      Offering('Delivery Coordination', 'Plan the movement of goods from shipment arrival to the destination.'),
      Offering('Import Process Guidance', 'Discuss import planning, supplier coordination and international trade steps.'),
    ],
    process: [
      Offering('Share your requirements', 'Tell us which products you need, your target quantity and preferred sourcing location.'),
      Offering('Explore sourcing options', 'Discuss suitable suppliers, product details and available shipping options.'),
      Offering('Coordinate your order', 'Review requirements and coordinate next steps with the relevant parties.'),
      Offering('Plan shipment & delivery', 'Discuss shipping, documentation and delivery arrangements.'),
    ],
    faqs: [
      Offering('What products can I import through Hunters Group?', 'Share the product category and destination with our team so we can discuss your requirements.'),
      Offering('Can you help me find international suppliers?', 'Discuss your product and preferred sourcing market with our team.'),
      Offering('Do you provide shipping and documentation support?', 'We can discuss the shipping and documentation requirements for your shipment.'),
      Offering('How can I request an import quotation?', 'Send your product details and requirements to our team on WhatsApp.'),
    ],
  ),
  ServiceInfo(
    slug: 'export',
    title: 'Export Services',
    eyebrow: 'GLOBAL TRADE & EXPORT SUPPORT',
    headline: 'Take your products to global markets.',
    description:
        'Explore export opportunities with support for market research, order coordination, documentation guidance and international shipping planning.',
    image: 'assets/images/services/export.png',
    offerings: [
      Offering('Export Market Research', 'Explore potential international markets and requirements for taking products overseas.'),
      Offering('Product & Supplier Coordination', 'Organise product details, specifications and communication for export orders.'),
      Offering('Export Documentation Guidance', 'Understand the documents and regulatory requirements that may apply.'),
      Offering('International Shipping Coordination', 'Discuss suitable cargo and transportation options for your destination.'),
      Offering('Buyer & Order Coordination', 'Coordinate product enquiries, order requirements and business communication.'),
      Offering('Shipment & Delivery Planning', 'Plan the movement of goods and practical delivery arrangements.'),
    ],
    process: [
      Offering('Share your products', 'Tell us about your products, quantities, specifications and intended destination.'),
      Offering('Discuss market requirements', 'Explore the target market, buyer requirements and relevant considerations.'),
      Offering('Prepare your order', 'Coordinate order details and discuss documentation and shipping requirements.'),
      Offering('Plan shipment', 'Review transportation and delivery arrangements for your shipment.'),
    ],
    faqs: [
      Offering('Which products can I export?', 'Suitability depends on the product, destination regulations and applicable trade requirements.'),
      Offering('Can you help me explore international markets?', 'Enquire about market research and export planning for your product and target market.'),
      Offering('Can you assist with export documentation?', 'Requirements depend on the goods, destination and applicable regulations.'),
      Offering('How can I discuss an export order?', 'Contact us with your product details, estimated quantity and destination country.'),
    ],
  ),
  ServiceInfo(
    slug: 'logistics',
    title: 'Logistics & Shipping',
    eyebrow: 'LOGISTICS & SUPPLY CHAIN SUPPORT',
    headline: 'Move your goods with confidence.',
    description:
        'Explore logistics and shipping support for cargo transportation, shipment coordination and delivery planning.',
    image: 'assets/images/services/logistics.png',
    offerings: [
      Offering('International Shipping', 'Discuss shipping options based on destination, shipment size and business requirements.'),
      Offering('Cargo Transportation', 'Coordinate the movement of goods and practical transportation arrangements.'),
      Offering('Shipment Coordination', 'Organise shipment details, transport requirements and communication.'),
      Offering('Delivery Planning', 'Discuss destinations, handling needs and arrangements to move goods.'),
      Offering('Cargo Handling Support', 'Review packaging, cargo handling and shipment preparation requirements.'),
      Offering('Shipment Updates', 'Coordinate shipment information and relevant updates.'),
    ],
    process: [
      Offering('Tell us about your cargo', 'Share the cargo type, quantity, dimensions, collection point and destination.'),
      Offering('Discuss shipping options', 'Review possible transportation arrangements according to your requirements.'),
      Offering('Coordinate the shipment', 'Confirm details, responsibilities and arrangements before dispatch.'),
      Offering('Plan delivery', 'Discuss delivery coordination and shipment updates.'),
    ],
    faqs: [
      Offering('Do you handle domestic and international shipments?', 'Share your origin and destination so we can discuss the route.'),
      Offering('How can I request a shipping quotation?', 'Send the cargo type, approximate weight and dimensions, origin, destination and timeline.'),
      Offering('Which shipping method is suitable for my goods?', 'The suitable option depends on cargo dimensions, weight, destination, urgency and restrictions.'),
      Offering('Can I receive shipment updates?', 'Discuss available communication and tracking arrangements with our team.'),
    ],
  ),
  ServiceInfo(
    slug: 'buyer-sourcing',
    title: 'Buyer & Sourcing Support',
    eyebrow: 'GLOBAL SOURCING & PROCUREMENT',
    headline: 'Find the right products and sourcing options.',
    description:
        'Explore supplier discovery, product sourcing and buyer coordination support tailored to your business requirements.',
    image: 'assets/images/services/buyer-support.jpg',
    offerings: [
      Offering('Supplier Discovery', 'Explore potential suppliers based on product category, sourcing location and requirements.'),
      Offering('Product Sourcing', 'Discuss product specifications, quantities and sourcing options.'),
      Offering('Product Requirements', 'Organise product details, quality expectations, packaging and order specifications.'),
      Offering('Buyer & Supplier Coordination', 'Coordinate communication to clarify requirements and purchasing discussions.'),
      Offering('Supplier Information Review', 'Review available supplier information and discuss practical checks.'),
      Offering('Procurement Support', 'Discuss purchasing requirements, order coordination and sourcing arrangements.'),
    ],
    process: [
      Offering('Share your requirements', 'Tell us which product you need, quantity, specifications and target budget.'),
      Offering('Explore sourcing options', 'Discuss potential suppliers and product options.'),
      Offering('Review the details', 'Clarify product specifications, supplier information and order requirements.'),
      Offering('Coordinate next steps', 'Discuss purchasing, supplier communication and your order.'),
    ],
    faqs: [
      Offering('Can you help me find suppliers for my products?', 'Share your product category, preferred sourcing country and requirements.'),
      Offering('Can you source products internationally?', 'Feasibility depends on product availability, supplier requirements and destination regulations.'),
      Offering('Can you help me review supplier information?', 'Discuss available supplier information and possible review steps with the team.'),
      Offering('What information should I provide?', 'Share product specifications, estimated quantity, target price, preferred country and quality needs.'),
    ],
  ),
  ServiceInfo(
    slug: 'web-development',
    title: 'Web Development',
    eyebrow: 'WEB DEVELOPMENT SERVICES',
    headline: 'Websites that make your business stand out.',
    description:
        'We create modern, responsive and user-friendly websites that strengthen your brand, showcase your services and help your business grow online.',
    image: 'assets/images/services/web-development.png',
    offerings: [
      Offering('Business Websites', 'Professional websites that build trust and showcase your business online.'),
      Offering('Responsive Web Design', 'A smooth browsing experience across phones, tablets and desktops.'),
      Offering('Landing Pages', 'Focused landing pages designed to turn visitors into enquiries.'),
      Offering('Website Optimization', 'Improve website speed, usability and the overall user experience.'),
      Offering('SEO-Friendly Structure', 'Organised website pages that are easier for search engines to understand.'),
      Offering('E-Commerce Websites', 'Online stores that showcase products and make shopping easier.'),
    ],
    process: [
      Offering('Discovery', 'We understand your business, goals and requirements.'),
      Offering('Design', 'We plan a modern design that matches your brand.'),
      Offering('Development', 'We build a responsive and user-friendly website.'),
      Offering('Launch', 'We review your website and prepare it to go live.'),
    ],
  ),
];

const marketplaces = <MarketplaceInfo>[
  MarketplaceInfo(
    slug: 'amazon',
    name: 'Amazon',
    kind: 'Seller Services',
    headline: 'Build and grow your Amazon business.',
    description:
        'Explore practical Amazon seller support, from product research and listing optimization to advertising and store operations.',
    services: [
      Offering('Seller Account Support', 'Get guidance on seller account setup, store requirements and account organization.'),
      Offering('Product Research', 'Explore product opportunities using market research, competition analysis and demand indicators.'),
      Offering('Listing Optimization', 'Improve product titles, bullet points, descriptions and keyword relevance.'),
      Offering('Amazon PPC Support', 'Plan and optimize advertising campaigns around your products and business goals.'),
      Offering('FBA & FBM Assistance', 'Get operational guidance for Fulfillment by Amazon and seller-fulfilled orders.'),
      Offering('Store Performance Support', 'Review store performance and identify practical opportunities for improvement.'),
    ],
  ),
  MarketplaceInfo(
    slug: 'ebay',
    name: 'eBay',
    kind: 'Seller Services',
    headline: 'Grow your eBay business.',
    description:
        'Explore practical eBay support for product research, listing creation, keyword optimization and store operations.',
    services: [
      Offering('Seller Account Support', 'Get guidance on seller account setup, store organization and essential selling requirements.'),
      Offering('Product Research', 'Research product opportunities, market demand, competition and relevant selling categories.'),
      Offering('Listing Creation & Optimization', 'Improve product titles, item specifics, descriptions, images and listing presentation.'),
      Offering('eBay SEO & Keywords', 'Identify relevant search terms and improve listing structure for discoverability.'),
      Offering('Order Management Support', 'Organize order workflows, product availability and customer communication processes.'),
      Offering('Store Performance Support', 'Review store performance and identify practical opportunities to improve your selling workflow.'),
    ],
  ),
  MarketplaceInfo(
    slug: 'etsy',
    name: 'Etsy',
    kind: 'Shop Services',
    headline: 'Build a stronger Etsy shop.',
    description:
        'Explore practical Etsy support for shop setup, product listings, keyword research, search optimization and product presentation.',
    services: [
      Offering('Etsy Shop Setup', 'Get guidance on shop setup, shop organization and preparing essential details for selling.'),
      Offering('Product Listing Creation', 'Organize product titles, descriptions, images, variations and listing details.'),
      Offering('Product & Market Research', 'Explore relevant product ideas, customer interests, competing listings and market opportunities.'),
      Offering('Tags & Keyword Research', 'Identify relevant search phrases and tags to improve listing discoverability.'),
      Offering('Etsy SEO', "Improve listing titles, tags, descriptions and other elements of your shop's search presence."),
      Offering('Product Presentation', 'Improve product image presentation, listing consistency and the overall appearance of your shop.'),
    ],
  ),
  MarketplaceInfo(
    slug: 'shopify',
    name: 'Shopify',
    kind: 'Store Services',
    headline: 'Build your Shopify store.',
    description:
        'From store setup and theme customization to product organization and SEO, explore support for a professional online shopping experience.',
    services: [
      Offering('Shopify Store Setup', 'Get guidance setting up your store, organizing essential settings and preparing your storefront.'),
      Offering('Store Design & Customization', 'Create a professional storefront with theme customization, responsive layouts and consistent branding.'),
      Offering('Product Upload & Organization', 'Organize product titles, descriptions, images, collections, variants and inventory information.'),
      Offering('Apps & Integrations', 'Discuss suitable apps and integrations for payments, shipping, support and store operations.'),
      Offering('Shopify SEO', 'Improve product and collection page structure, metadata, URLs and on-page search optimization.'),
      Offering('Store Optimization', 'Review mobile usability, navigation, product presentation and the customer shopping journey.'),
    ],
  ),
  MarketplaceInfo(
    slug: 'walmart',
    name: 'Walmart',
    kind: 'Marketplace Services',
    headline: 'Grow your Walmart business.',
    description:
        'Explore practical marketplace support for product research, listing optimization, catalog organization and store operations.',
    services: [
      Offering('Seller Account Guidance', 'Understand seller onboarding requirements and organize information for your marketplace application.'),
      Offering('Product Research', 'Explore product opportunities, market demand, competition and relevant categories.'),
      Offering('Product Listing Optimization', 'Improve product titles, descriptions, attributes, images and listing presentation.'),
      Offering('Catalog Organization', 'Organize product information, variants, categories and catalog details for store management.'),
      Offering('Marketplace SEO', 'Review product content and relevant search terms to improve listing relevance and discoverability.'),
      Offering('Performance Support', 'Review store operations and identify practical opportunities to improve workflows.'),
    ],
  ),
  MarketplaceInfo(
    slug: 'tiktok-shop',
    name: 'TikTok Shop',
    kind: 'Shop Services',
    headline: 'Build your TikTok Shop.',
    description:
        'Explore TikTok Shop support for product listings, content planning, product research and shop operations.',
    services: [
      Offering('TikTok Shop Setup', 'Get guidance on shop onboarding requirements, account organization and preparing your shop for selling.'),
      Offering('Product Listing Support', 'Organize product titles, descriptions, images, pricing details and product variations.'),
      Offering('Product Content Planning', 'Plan product-focused video ideas and content concepts that present products clearly.'),
      Offering('Product Research', 'Explore product opportunities, customer interests, competition and relevant market trends.'),
      Offering('Catalog Organization', 'Organize product information, categories, variations and inventory details for shop management.'),
      Offering('Shop Optimization', 'Review product presentation, shop organization and customer shopping workflows.'),
    ],
  ),
];

const teamMembers = <({String name, String role, String detail, String image})>[
  (
    name: 'Dr Salam Ahmad Raza',
    role: 'CEO',
    detail:
        "Leads Hunters Group's vision, strategy, and business direction. Focused on sustainable growth, strong partnerships, and global opportunities.",
    image: 'assets/images/team/team-salam.jpg',
  ),
  (
    name: 'M Huzaifa Attari',
    role: 'Founder',
    detail:
        'Founded Hunters Group in 2021 with a vision to connect businesses and create new opportunities.',
    image: 'assets/images/team/team-huzaifa.jpg',
  ),
  (
    name: 'M Matiullah Sultani',
    role: 'Co-Founder',
    detail:
        'Shares the vision of growing Hunters Group through partnership, teamwork, and business development.',
    image: 'assets/images/team/team-matiullah.jpg',
  ),
  (
    name: 'Zhang Yun (张云)',
    role: 'Head of Import & Export',
    detail:
        'Leads import and export operations, focusing on international trade and cross-border coordination.',
    image: 'assets/images/team/team-zhang-yun.jpg',
  ),
  (
    name: 'Mirza Kashan Ali',
    role: 'Head of IT',
    detail:
        'Leads technology and digital development, focusing on website experience and technical solutions.',
    image: 'assets/images/team/team-kashan.jpg',
  ),
];

const registrationNames = [
  'State Administration for Market Regulation',
  'Administration for Market Regulation',
  'Ministry of Commerce',
  'Lahore Chamber of Commerce & Industry',
  'Federal Board of Revenue',
  'Pakistan Single Window',
  'Trade Development Authority of Pakistan',
];

const registrationImages = [
  'assets/images/registrations/samr.png',
  'assets/images/registrations/amr.png',
  'assets/images/registrations/mofcom.png',
  'assets/images/registrations/lcci.png',
  'assets/images/registrations/fbr.png',
  'assets/images/registrations/psw.png',
  'assets/images/registrations/tdap.png',
];

class CompanyEvent {
  const CompanyEvent({
    required this.title,
    required this.category,
    required this.description,
    required this.images,
    this.detail,
  });

  final String title;
  final String category;
  final String description;
  final List<String> images;
  final String? detail;
}

const companyEvents = <CompanyEvent>[
  CompanyEvent(
    title: 'Ideoversity Career Expo',
    category: 'Recruitment & Hiring',
    description:
        'Our team participated in the Ideoversity Expo to connect with talented candidates, conduct interviews and explore new opportunities.',
    images: [
      'assets/images/events/idoversity-1.jpg',
      'assets/images/events/idoversity-2.jpg',
      'assets/images/events/idoversity-3.jpg',
      'assets/images/events/idoversity-4.jpg',
    ],
  ),
  CompanyEvent(
    title: 'Young Entrepreneur Fest 2026',
    category: 'Career Expo & Recruitment',
    description:
        'Hunters Group set up its own stall at Expo Center to meet candidates, conduct interviews and discover new talent.',
    images: [
      'assets/images/events/expo-center-1.jpg',
      'assets/images/events/expo-center-2.jpg',
      'assets/images/events/expo-center-3.jpg',
      'assets/images/events/expo-center-4.jpg',
    ],
  ),
  CompanyEvent(
    title: 'Hunters Group Seminar — Skardu',
    category: 'Business Seminar',
    description:
        'Hunters Group hosted a seminar at Shangrila Resort, Skardu, bringing people together for business discussions and new opportunities.',
    detail: '25 October 2026 · Shangrila Resort, Skardu',
    images: [
      'assets/images/events/skardu-seminar-1.jpg',
      'assets/images/events/skardu-seminar-2.jpg',
      'assets/images/events/skardu-seminar-3.jpg',
      'assets/images/events/skardu-seminar-4.jpg',
      'assets/images/events/skardu-seminar-5.jpg',
      'assets/images/events/skardu-seminar-6.jpg',
      'assets/images/events/skardu-seminar-7.jpg',
    ],
  ),
];
