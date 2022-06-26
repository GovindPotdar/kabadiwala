# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# createing adminUser

User.create({full_name:"Admin",
  mobile_number:6265328168,
  email:"admin@kabadiwala.com",
  password:"admin@kabadiwala",
  password_confirmation:"admin@kabadiwala",
  role:1}
)

Scrap.create([
  {id:1,name:'Paper',description:'Newspappers, cartons, books, etc.',icon_class:'fa-regular fa-newspaper'},
  {id:2,name:'Plastic',description:'Oil container, Hand/soft, etc.',icon_class:'fa-solid fa-sheet-plastic'},
  {id:3,name:'Metals',description:'Utensils, coolers, drums, etc.',icon_class:'fa-solid fa-lines-leaning'},
  {id:4,name:'E-Waste',description:'Computers, Keyboards, etc.',icon_class:'fa-solid fa-computer'},
  {id:5,name:'Other items',description:'Beer bottles, machines, etc.',icon_class:'fa-solid fa-prescription-bottle'}
])

Unit.create([
  {id:1,name:'Kg'},
  {id:2,name:'piece'}
])

City.create({id:5753,name:'Dewas',service:0})

Item.create([
  {id:1,name:'Newspaper',scrap_id:1,price:15.0,unit_id:1},
  {id:2,name:'Carton',scrap_id:1,price:13.0,unit_id:1},
  {id:3,name:'Carton (Commercial)',scrap_id:1,price:13.0,unit_id:1},
  {id:4,name:'Books',scrap_id:1,price:12.0,unit_id:1},
  {id:5,name:'Copy',scrap_id:1,price:8.0,unit_id:1},
  {id:6,name:'White Papers',scrap_id:1,price:7.0,unit_id:1},
  {id:7,name:'Record Paper',scrap_id:1,price:7.0,unit_id:1},
  {id:8,name:'Plain Paper',scrap_id:1,price:7.0,unit_id:1},
  {id:9,name:'Rough Paper',scrap_id:1,price:7.0,unit_id:1},
  {id:10,name:'Magazines',scrap_id:1,price:6.0,unit_id:1},
  {id:11,name:'Grey Board',scrap_id:1,price:1.0,unit_id:1},
  {id:12,name:'Polythene',scrap_id:2,price:15.0,unit_id:1},
  {id:13,name:'Plastic Jar (15ltr)',scrap_id:2,price:8.0,unit_id:2},
  {id:14,name:'Soft plastic',scrap_id:2,price:6.0,unit_id:1},
  {id:15,name:'Fibre',scrap_id:2,price:6.0,unit_id:1},
  {id:16,name:'Water/Oil Covers',scrap_id:2,price:5.0,unit_id:1},
  {id:17,name:'Polythene (Mix)',scrap_id:2,price:5.0,unit_id:1},
  {id:18,name:'Plastic (Mix)',scrap_id:2,price:4.0,unit_id:1},
  {id:19,name:'Milk Covers',scrap_id:2,price:2.0,unit_id:1},
  {id:20,name:'Plastic jar (5ltr)',scrap_id:2,price:2.0,unit_id:2},
  {id:21,name:'Plastic Bori',scrap_id:2,price:2.0,unit_id:1},
  {id:22,name:'Hard Plastic',scrap_id:2,price:1.0,unit_id:1},
  {id:23,name:'Copper',scrap_id:3,price:300.0,unit_id:1},
  {id:24,name:'Brass',scrap_id:3,price:180.0,unit_id:1},
  {id:25,name:'Aluminium',scrap_id:3,price:60.0,unit_id:1},
  {id:26,name:'Casting Aluminium',scrap_id:3,price:40.0,unit_id:1},
  {id:27,name:'Steel',scrap_id:3,price:28.0,unit_id:1},
  {id:28,name:'Iron',scrap_id:3,price:25.0,unit_id:1},
  {id:29,name:'Tin',scrap_id:3,price:15.0,unit_id:1},
  {id:30,name:'Oil Tin 15 Ltr (Fresh)',scrap_id:3,price:5.0,unit_id:2},
  {id:31,name:'Oil Tin 15 Ltr (Scrap)',scrap_id:3,price:5.0,unit_id:2},
  {id:32,name:'Clutch Wire',scrap_id:3,price:5.0,unit_id:1},
  {id:33,name:'Oil Tin 15 Ltr',scrap_id:3,price:2.0,unit_id:2},
  {id:34,name:'E-waste',scrap_id:4,price:10.0,unit_id:1},
  {id:35,name:'Battery',scrap_id:5,price:60.0,unit_id:1},
  {id:36,name:'Tyre',scrap_id:5,price:3.0,unit_id:1},
  {id:37,name:'Mix-Waste',scrap_id:5,price:2.0,unit_id:1},
  {id:38,name:'Beer Bottles',scrap_id:5,price:0.5,unit_id:2}
])