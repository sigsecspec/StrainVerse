-- StrainVerse — extended strain seed (500+ additional cultivars)
-- Run after sql/seed-strains.sql in Supabase SQL Editor
-- Safe to re-run: upserts on name conflict

insert into "StrainVerse".strains
  (name, type, description, thc_min, thc_max, cbd_min, cbd_max, effects, flavors, genetics)
values
('Agent Orange', 'Exotic',
 'Community-sourced exotic cultivar known for diesel and earthy terpenes.',
 20, 28, 0, 1, '["sleepy", "relaxed", "hungry"]', '["diesel", "earthy", "pungent"]', 'Agent x Orange hybrid'),

('Alaskan Thunder Fuck', 'Indica',
 'Community-sourced indica cultivar known for citrus and pine terpenes.',
 17, 21, 0, 1, '["euphoric", "happy", "relaxed"]', '["citrus", "pine", "earthy"]', 'Alaskan x Fuck hybrid'),

('Alien OG', 'Hybrid',
 'Community-sourced hybrid cultivar known for citrus and pine terpenes.',
 20, 22, 0, 1, '["happy", "relaxed", "euphoric"]', '["citrus", "pine", "earthy"]', 'Alien x OG hybrid'),

('Allen Wrench', 'Indica',
 'Community-sourced indica cultivar known for diesel and earthy terpenes.',
 17, 20, 0, 1, '["euphoric", "happy", "relaxed"]', '["diesel", "earthy", "pungent"]', 'Allen x Wrench hybrid'),

('Alpha Blue', 'Exotic',
 'Community-sourced exotic cultivar known for lemon and citrus terpenes.',
 24, 34, 0, 1, '["energetic", "creative", "uplifted"]', '["lemon", "citrus", "sweet"]', 'Alpha x Blue hybrid'),

('Amnesia MAC 1', 'Hybrid',
 'Community-sourced hybrid cultivar known for cherry and sweet terpenes.',
 19, 22, 0, 1, '["energetic", "creative", "uplifted"]', '["cherry", "sweet", "earthy"]', 'Amnesia x 1 hybrid'),

('Animal Mints', 'Hybrid',
 'Community-sourced hybrid cultivar known for mint and sweet terpenes.',
 19, 24, 0, 1, '["energetic", "creative", "uplifted"]', '["mint", "sweet", "cream"]', 'Animal x Mints hybrid'),

('Apple Jack', 'Sativa',
 'Community-sourced sativa cultivar known for mint and sweet terpenes.',
 15, 25, 0, 1, '["happy", "relaxed", "euphoric"]', '["mint", "sweet", "cream"]', 'Apple x Jack hybrid'),

('Banana Kush', 'Hybrid',
 'Community-sourced hybrid cultivar known for citrus and pine terpenes.',
 19, 22, 0, 1, '["relaxed", "happy", "creative"]', '["citrus", "pine", "earthy"]', 'Banana x Kush hybrid'),

('Banana Punch Berry White', 'Hybrid',
 'Community-sourced hybrid cultivar known for mint and sweet terpenes.',
 17, 30, 0, 1, '["sleepy", "relaxed", "hungry"]', '["mint", "sweet", "cream"]', 'Banana x White hybrid'),

('Big Bud', 'Hybrid',
 'Community-sourced hybrid cultivar known for diesel and earthy terpenes.',
 18, 23, 0, 1, '["happy", "relaxed", "euphoric"]', '["diesel", "earthy", "pungent"]', 'Big x Bud hybrid'),

('Black Diamond', 'Hybrid',
 'Community-sourced hybrid cultivar known for cherry and sweet terpenes.',
 17, 25, 0, 1, '["happy", "relaxed", "euphoric"]', '["cherry", "sweet", "earthy"]', 'Black x Diamond hybrid'),

('Black Domina', 'Hybrid',
 'Community-sourced hybrid cultivar known for mint and sweet terpenes.',
 20, 27, 0, 1, '["energetic", "creative", "uplifted"]', '["mint", "sweet", "cream"]', 'Black x Domina hybrid'),

('Black Jack', 'Hybrid',
 'Community-sourced hybrid cultivar known for berry and sweet terpenes.',
 18, 26, 0, 1, '["happy", "relaxed", "euphoric"]', '["berry", "sweet", "grape"]', 'Black x Jack hybrid'),

('Black Mamba', 'Hybrid',
 'Community-sourced hybrid cultivar known for cherry and sweet terpenes.',
 18, 24, 0, 1, '["relaxed", "happy", "creative"]', '["cherry", "sweet", "earthy"]', 'Black x Mamba hybrid'),

('Blackwater', 'Hybrid',
 'Community-sourced hybrid cultivar known for diesel and earthy terpenes.',
 18, 27, 0, 1, '["happy", "relaxed", "euphoric"]', '["diesel", "earthy", "pungent"]', 'Unknown'),

('Blood Orange', 'Sativa',
 'Community-sourced sativa cultivar known for citrus and pine terpenes.',
 17, 25, 0, 1, '["sleepy", "relaxed", "hungry"]', '["citrus", "pine", "earthy"]', 'Blood x Orange hybrid'),

('Blue Cheese', 'Indica',
 'Community-sourced indica cultivar known for cherry and sweet terpenes.',
 18, 23, 0, 1, '["relaxed", "happy", "creative"]', '["cherry", "sweet", "earthy"]', 'Blue x Cheese hybrid'),

('Blue Cookies Blue Gelato', 'Exotic',
 'Community-sourced exotic cultivar known for berry and sweet terpenes.',
 23, 30, 0, 1, '["sleepy", "relaxed", "hungry"]', '["berry", "sweet", "grape"]', 'Blue x Gelato hybrid'),

('Blue Magoo', 'Indica',
 'Community-sourced indica cultivar known for cherry and sweet terpenes.',
 18, 26, 0, 1, '["euphoric", "happy", "relaxed"]', '["cherry", "sweet", "earthy"]', 'Blue x Magoo hybrid'),

('Blue Mystic', 'Hybrid',
 'Community-sourced hybrid cultivar known for lemon and citrus terpenes.',
 18, 24, 0, 1, '["euphoric", "happy", "relaxed"]', '["lemon", "citrus", "sweet"]', 'Blue x Mystic hybrid'),

('Blue OG', 'Sativa',
 'Community-sourced sativa cultivar known for berry and sweet terpenes.',
 15, 28, 0, 1, '["happy", "relaxed", "euphoric"]', '["berry", "sweet", "grape"]', 'Blue x OG hybrid'),

('Blue Sunset Sherbet', 'Exotic',
 'Community-sourced exotic cultivar known for citrus and pine terpenes.',
 21, 34, 0, 1, '["euphoric", "happy", "relaxed"]', '["citrus", "pine", "earthy"]', 'Blue x Sherbet hybrid'),

('Blue Widow', 'Hybrid',
 'Community-sourced hybrid cultivar known for tropical and sweet terpenes.',
 20, 29, 0, 1, '["euphoric", "happy", "relaxed"]', '["tropical", "sweet", "fruity"]', 'Blue x Widow hybrid'),

('Blueberry Haze', 'Hybrid',
 'Community-sourced hybrid cultivar known for tropical and sweet terpenes.',
 17, 23, 0, 1, '["euphoric", "happy", "relaxed"]', '["tropical", "sweet", "fruity"]', 'Blueberry x Haze hybrid'),

('Blueberry Kush', 'Exotic',
 'Community-sourced exotic cultivar known for cherry and sweet terpenes.',
 22, 29, 0, 1, '["sleepy", "relaxed", "hungry"]', '["cherry", "sweet", "earthy"]', 'Blueberry x Kush hybrid'),

('Blueberry Muffin', 'Indica',
 'Community-sourced indica cultivar known for berry and sweet terpenes.',
 19, 20, 0, 1, '["sleepy", "relaxed", "hungry"]', '["berry", "sweet", "grape"]', 'Blueberry x Muffin hybrid'),

('Bombsicle Brainstorm Haze', 'Hybrid',
 'Community-sourced hybrid cultivar known for diesel and earthy terpenes.',
 17, 26, 0, 1, '["euphoric", "happy", "relaxed"]', '["diesel", "earthy", "pungent"]', 'Bombsicle x Haze hybrid'),

('Bubba Island Kush', 'Indica',
 'Community-sourced indica cultivar known for sweet and earthy terpenes.',
 18, 22, 0, 1, '["euphoric", "happy", "relaxed"]', '["sweet", "earthy", "diesel"]', 'Bubba x Kush hybrid'),

('Bubble Bath', 'Hybrid',
 'Community-sourced hybrid cultivar known for citrus and pine terpenes.',
 19, 29, 0, 1, '["happy", "relaxed", "euphoric"]', '["citrus", "pine", "earthy"]', 'Bubble x Bath hybrid'),

('Bubble Gum', 'Hybrid',
 'Community-sourced hybrid cultivar known for diesel and earthy terpenes.',
 19, 25, 0, 1, '["happy", "relaxed", "euphoric"]', '["diesel", "earthy", "pungent"]', 'Bubble x Gum hybrid'),

('Cali Kush', 'Hybrid',
 'Community-sourced hybrid cultivar known for citrus and pine terpenes.',
 17, 23, 0, 1, '["relaxed", "happy", "creative"]', '["citrus", "pine", "earthy"]', 'Cali x Kush hybrid'),

('Candy Kush', 'Hybrid',
 'Community-sourced hybrid cultivar known for berry and sweet terpenes.',
 18, 24, 0, 1, '["relaxed", "happy", "creative"]', '["berry", "sweet", "grape"]', 'Candy x Kush hybrid'),

('Cannalope Haze', 'Hybrid',
 'Community-sourced hybrid cultivar known for diesel and earthy terpenes.',
 20, 25, 0, 1, '["euphoric", "happy", "relaxed"]', '["diesel", "earthy", "pungent"]', 'Cannalope x Haze hybrid'),

('Cannalope Kush', 'Exotic',
 'Community-sourced exotic cultivar known for lemon and citrus terpenes.',
 22, 34, 0, 1, '["sleepy", "relaxed", "hungry"]', '["lemon", "citrus", "sweet"]', 'Cannalope x Kush hybrid'),

('Capone', 'Hybrid',
 'Community-sourced hybrid cultivar known for diesel and earthy terpenes.',
 20, 23, 0, 1, '["energetic", "creative", "uplifted"]', '["diesel", "earthy", "pungent"]', 'Unknown'),

('Caramel Cream Cereal Bars', 'Sativa',
 'Community-sourced sativa cultivar known for diesel and earthy terpenes.',
 17, 22, 0, 1, '["euphoric", "happy", "relaxed"]', '["diesel", "earthy", "pungent"]', 'Caramel x Bars hybrid'),

('Champagne Kush', 'Hybrid',
 'Community-sourced hybrid cultivar known for sweet and earthy terpenes.',
 18, 22, 0, 1, '["happy", "relaxed", "euphoric"]', '["sweet", "earthy", "diesel"]', 'Champagne x Kush hybrid'),

('Cheesequake', 'Indica',
 'Community-sourced indica cultivar known for citrus and pine terpenes.',
 16, 20, 0, 1, '["sleepy", "relaxed", "hungry"]', '["citrus", "pine", "earthy"]', 'Unknown'),

('Chem Berry', 'Hybrid',
 'Community-sourced hybrid cultivar known for diesel and earthy terpenes.',
 18, 26, 0, 1, '["relaxed", "happy", "creative"]', '["diesel", "earthy", "pungent"]', 'Chem x Berry hybrid'),

('Chem Brulee', 'Hybrid',
 'Community-sourced hybrid cultivar known for lemon and citrus terpenes.',
 18, 29, 0, 1, '["energetic", "creative", "uplifted"]', '["lemon", "citrus", "sweet"]', 'Chem x Brulee hybrid'),

('Chem Chillz', 'Hybrid',
 'Community-sourced hybrid cultivar known for cherry and sweet terpenes.',
 18, 23, 0, 1, '["happy", "relaxed", "euphoric"]', '["cherry", "sweet", "earthy"]', 'Chem x Chillz hybrid'),

('Chem Cookies', 'Hybrid',
 'Community-sourced hybrid cultivar known for sweet and earthy terpenes.',
 20, 28, 0, 1, '["relaxed", "happy", "creative"]', '["sweet", "earthy", "diesel"]', 'Chem x Cookies hybrid'),

('Chem Dog', 'Exotic',
 'Community-sourced exotic cultivar known for mint and sweet terpenes.',
 20, 28, 0, 1, '["relaxed", "happy", "creative"]', '["mint", "sweet", "cream"]', 'Chem x Dog hybrid'),

('Chem Fuego', 'Sativa',
 'Community-sourced sativa cultivar known for lemon and citrus terpenes.',
 16, 23, 0, 1, '["energetic", "creative", "uplifted"]', '["lemon", "citrus", "sweet"]', 'Chem x Fuego hybrid'),

('Chem Pie Chem Scout', 'Indica',
 'Community-sourced indica cultivar known for lemon and citrus terpenes.',
 19, 22, 0, 1, '["sleepy", "relaxed", "hungry"]', '["lemon", "citrus", "sweet"]', 'Chem x Scout hybrid'),

('Chem Sis', 'Indica',
 'Community-sourced indica cultivar known for citrus and pine terpenes.',
 16, 27, 0, 1, '["euphoric", "happy", "relaxed"]', '["citrus", "pine", "earthy"]', 'Chem x Sis hybrid'),

('Chem Valley Kush', 'Sativa',
 'Community-sourced sativa cultivar known for citrus and pine terpenes.',
 20, 26, 0, 1, '["happy", "relaxed", "euphoric"]', '["citrus", "pine", "earthy"]', 'Chem x Kush hybrid'),

('Chernobyl', 'Indica',
 'Community-sourced indica cultivar known for lemon and citrus terpenes.',
 17, 26, 0, 1, '["relaxed", "happy", "creative"]', '["lemon", "citrus", "sweet"]', 'Unknown'),

('Cherry AK', 'Indica',
 'Community-sourced indica cultivar known for cherry and sweet terpenes.',
 19, 20, 0, 1, '["energetic", "creative", "uplifted"]', '["cherry", "sweet", "earthy"]', 'Cherry x AK hybrid'),

('Cherry Bomb', 'Sativa',
 'Community-sourced sativa cultivar known for tropical and sweet terpenes.',
 18, 24, 0, 1, '["relaxed", "happy", "creative"]', '["tropical", "sweet", "fruity"]', 'Cherry x Bomb hybrid'),

('Cherry Cola', 'Hybrid',
 'Community-sourced hybrid cultivar known for tropical and sweet terpenes.',
 20, 24, 0, 1, '["energetic", "creative", "uplifted"]', '["tropical", "sweet", "fruity"]', 'Cherry x Cola hybrid'),

('Cherry Cookies', 'Indica',
 'Community-sourced indica cultivar known for sweet and earthy terpenes.',
 16, 20, 0, 1, '["sleepy", "relaxed", "hungry"]', '["sweet", "earthy", "diesel"]', 'Cherry x Cookies hybrid'),

('Cherry Diesel', 'Sativa',
 'Community-sourced sativa cultivar known for berry and sweet terpenes.',
 19, 25, 0, 1, '["euphoric", "happy", "relaxed"]', '["berry", "sweet", "grape"]', 'Cherry x Diesel hybrid'),

('Cherry Gelato Cherry Limeade', 'Sativa',
 'Community-sourced sativa cultivar known for citrus and pine terpenes.',
 19, 22, 0, 1, '["energetic", "creative", "uplifted"]', '["citrus", "pine", "earthy"]', 'Cherry x Limeade hybrid'),

('Cherry OG', 'Hybrid',
 'Community-sourced hybrid cultivar known for citrus and pine terpenes.',
 17, 25, 0, 1, '["relaxed", "happy", "creative"]', '["citrus", "pine", "earthy"]', 'Cherry x OG hybrid'),

('Cherry Punch', 'Hybrid',
 'Community-sourced hybrid cultivar known for citrus and pine terpenes.',
 18, 22, 0, 1, '["euphoric", "happy", "relaxed"]', '["citrus", "pine", "earthy"]', 'Cherry x Punch hybrid'),

('Cherry Runtz', 'Hybrid',
 'Community-sourced hybrid cultivar known for mint and sweet terpenes.',
 19, 26, 0, 1, '["energetic", "creative", "uplifted"]', '["mint", "sweet", "cream"]', 'Cherry x Runtz hybrid'),

('Chocolate Chunk', 'Indica',
 'Community-sourced indica cultivar known for tropical and sweet terpenes.',
 18, 26, 0, 1, '["energetic", "creative", "uplifted"]', '["tropical", "sweet", "fruity"]', 'Chocolate x Chunk hybrid'),

('Chocolate Diesel', 'Hybrid',
 'Community-sourced hybrid cultivar known for lemon and citrus terpenes.',
 19, 23, 0, 1, '["happy", "relaxed", "euphoric"]', '["lemon", "citrus", "sweet"]', 'Chocolate x Diesel hybrid'),

('Chocolate Haze', 'Hybrid',
 'Community-sourced hybrid cultivar known for diesel and earthy terpenes.',
 17, 23, 0, 1, '["euphoric", "happy", "relaxed"]', '["diesel", "earthy", "pungent"]', 'Chocolate x Haze hybrid'),

('Chocolate Kush', 'Hybrid',
 'Community-sourced hybrid cultivar known for citrus and pine terpenes.',
 19, 24, 0, 1, '["sleepy", "relaxed", "hungry"]', '["citrus", "pine", "earthy"]', 'Chocolate x Kush hybrid'),

('Chocolate Thai', 'Indica',
 'Community-sourced indica cultivar known for lemon and citrus terpenes.',
 18, 24, 0, 1, '["energetic", "creative", "uplifted"]', '["lemon", "citrus", "sweet"]', 'Chocolate x Thai hybrid'),

('Chronic Church OG', 'Hybrid',
 'Community-sourced hybrid cultivar known for tropical and sweet terpenes.',
 19, 30, 0, 1, '["happy", "relaxed", "euphoric"]', '["tropical", "sweet", "fruity"]', 'Chronic x OG hybrid'),

('Clementine', 'Exotic',
 'Community-sourced exotic cultivar known for citrus and pine terpenes.',
 20, 30, 0, 1, '["sleepy", "relaxed", "hungry"]', '["citrus", "pine", "earthy"]', 'Unknown'),

('Colombian Gold', 'Sativa',
 'Community-sourced sativa cultivar known for tropical and sweet terpenes.',
 20, 26, 0, 1, '["energetic", "creative", "uplifted"]', '["tropical", "sweet", "fruity"]', 'Colombian x Gold hybrid'),

('Cookie Dough', 'Hybrid',
 'Community-sourced hybrid cultivar known for tropical and sweet terpenes.',
 18, 27, 0, 1, '["energetic", "creative", "uplifted"]', '["tropical", "sweet", "fruity"]', 'Cookie x Dough hybrid'),

('Cookie Monster', 'Hybrid',
 'Community-sourced hybrid cultivar known for citrus and pine terpenes.',
 20, 26, 0, 1, '["happy", "relaxed", "euphoric"]', '["citrus", "pine", "earthy"]', 'Cookie x Monster hybrid'),

('Cookie Wreck', 'Exotic',
 'Community-sourced exotic cultivar known for sweet and earthy terpenes.',
 23, 32, 0, 1, '["happy", "relaxed", "euphoric"]', '["sweet", "earthy", "diesel"]', 'Cookie x Wreck hybrid'),

('Cookies And Cream', 'Hybrid',
 'Community-sourced hybrid cultivar known for lemon and citrus terpenes.',
 18, 26, 0, 1, '["energetic", "creative", "uplifted"]', '["lemon", "citrus", "sweet"]', 'Cookies x Cream hybrid'),

('Cosmic Charlie', 'Hybrid',
 'Community-sourced hybrid cultivar known for citrus and pine terpenes.',
 20, 30, 0, 1, '["happy", "relaxed", "euphoric"]', '["citrus", "pine", "earthy"]', 'Cosmic x Charlie hybrid'),

('Cotton Candy', 'Sativa',
 'Community-sourced sativa cultivar known for sweet and earthy terpenes.',
 20, 23, 0, 1, '["euphoric", "happy", "relaxed"]', '["sweet", "earthy", "diesel"]', 'Cotton x Candy hybrid'),

('Cotton Candy Kush Cream Pie', 'Hybrid',
 'Community-sourced hybrid cultivar known for sweet and earthy terpenes.',
 18, 28, 0, 1, '["energetic", "creative", "uplifted"]', '["sweet", "earthy", "diesel"]', 'Cotton x Pie hybrid'),

('Critical Kush', 'Hybrid',
 'Community-sourced hybrid cultivar known for diesel and earthy terpenes.',
 19, 22, 0, 1, '["sleepy", "relaxed", "hungry"]', '["diesel", "earthy", "pungent"]', 'Critical x Kush hybrid'),

('Critical Purple', 'Exotic',
 'Community-sourced exotic cultivar known for cherry and sweet terpenes.',
 21, 29, 0, 1, '["sleepy", "relaxed", "hungry"]', '["cherry", "sweet", "earthy"]', 'Critical x Purple hybrid'),

('Crystal', 'Hybrid',
 'Community-sourced hybrid cultivar known for berry and sweet terpenes.',
 18, 25, 0, 1, '["energetic", "creative", "uplifted"]', '["berry", "sweet", "grape"]', 'Unknown'),

('Dank Commander', 'Hybrid',
 'Community-sourced hybrid cultivar known for cherry and sweet terpenes.',
 17, 24, 0, 1, '["sleepy", "relaxed", "hungry"]', '["cherry", "sweet", "earthy"]', 'Dank x Commander hybrid'),

('Dark Star', 'Exotic',
 'Community-sourced exotic cultivar known for citrus and pine terpenes.',
 21, 32, 0, 1, '["energetic", "creative", "uplifted"]', '["citrus", "pine", "earthy"]', 'Dark x Star hybrid'),

('Daydream', 'Hybrid',
 'Community-sourced hybrid cultivar known for diesel and earthy terpenes.',
 17, 29, 0, 1, '["energetic", "creative", "uplifted"]', '["diesel", "earthy", "pungent"]', 'Unknown'),

('Deadhead OG', 'Hybrid',
 'Community-sourced hybrid cultivar known for diesel and earthy terpenes.',
 19, 26, 0, 1, '["energetic", "creative", "uplifted"]', '["diesel", "earthy", "pungent"]', 'Deadhead x OG hybrid'),

('Deep Purple', 'Sativa',
 'Community-sourced sativa cultivar known for mint and sweet terpenes.',
 20, 23, 0, 1, '["relaxed", "happy", "creative"]', '["mint", "sweet", "cream"]', 'Deep x Purple hybrid'),

('Devil Fruit Diamond OG', 'Hybrid',
 'Community-sourced hybrid cultivar known for cherry and sweet terpenes.',
 17, 26, 0, 1, '["sleepy", "relaxed", "hungry"]', '["cherry", "sweet", "earthy"]', 'Devil x OG hybrid'),

('Dolato', 'Exotic',
 'Community-sourced exotic cultivar known for citrus and pine terpenes.',
 24, 33, 0, 1, '["happy", "relaxed", "euphoric"]', '["citrus", "pine", "earthy"]', 'Unknown'),

('Donny Burger', 'Hybrid',
 'Community-sourced hybrid cultivar known for citrus and pine terpenes.',
 18, 26, 0, 1, '["happy", "relaxed", "euphoric"]', '["citrus", "pine", "earthy"]', 'Donny x Burger hybrid'),

('Dosilato', 'Hybrid',
 'Community-sourced hybrid cultivar known for cherry and sweet terpenes.',
 20, 27, 0, 1, '["sleepy", "relaxed", "hungry"]', '["cherry", "sweet", "earthy"]', 'Unknown'),

('Double Dream', 'Hybrid',
 'Community-sourced hybrid cultivar known for diesel and earthy terpenes.',
 17, 28, 0, 1, '["euphoric", "happy", "relaxed"]', '["diesel", "earthy", "pungent"]', 'Double x Dream hybrid'),

('Double OG', 'Hybrid',
 'Community-sourced hybrid cultivar known for diesel and earthy terpenes.',
 17, 28, 0, 1, '["happy", "relaxed", "euphoric"]', '["diesel", "earthy", "pungent"]', 'Double x OG hybrid'),

('Dr. Who', 'Hybrid',
 'Community-sourced hybrid cultivar known for mint and sweet terpenes.',
 20, 23, 0, 1, '["sleepy", "relaxed", "hungry"]', '["mint", "sweet", "cream"]', 'Dr. x Who hybrid'),

('Dream Queen', 'Exotic',
 'Community-sourced exotic cultivar known for tropical and sweet terpenes.',
 20, 32, 0, 1, '["euphoric", "happy", "relaxed"]', '["tropical", "sweet", "fruity"]', 'Dream x Queen hybrid'),

('Duct Tape', 'Exotic',
 'Community-sourced exotic cultivar known for tropical and sweet terpenes.',
 23, 33, 0, 1, '["relaxed", "happy", "creative"]', '["tropical", "sweet", "fruity"]', 'Duct x Tape hybrid'),

('Dulce De Uva Durban', 'Hybrid',
 'Community-sourced hybrid cultivar known for cherry and sweet terpenes.',
 18, 25, 0, 1, '["relaxed", "happy", "creative"]', '["cherry", "sweet", "earthy"]', 'Dulce x Durban hybrid'),

('Dutch Treat', 'Exotic',
 'Community-sourced exotic cultivar known for sweet and earthy terpenes.',
 21, 32, 0, 1, '["relaxed", "happy", "creative"]', '["sweet", "earthy", "diesel"]', 'Dutch x Treat hybrid'),

('Dutch Hawaiian', 'Hybrid',
 'Community-sourced hybrid cultivar known for mint and sweet terpenes.',
 19, 25, 0, 1, '["relaxed", "happy", "creative"]', '["mint", "sweet", "cream"]', 'Dutch x Hawaiian hybrid'),

('Dutch Haze', 'Hybrid',
 'Community-sourced hybrid cultivar known for lemon and citrus terpenes.',
 20, 29, 0, 1, '["energetic", "creative", "uplifted"]', '["lemon", "citrus", "sweet"]', 'Dutch x Haze hybrid'),

('Dynamite', 'Exotic',
 'Community-sourced exotic cultivar known for mint and sweet terpenes.',
 21, 29, 0, 1, '["sleepy", "relaxed", "hungry"]', '["mint", "sweet", "cream"]', 'Unknown'),

('Early Girl', 'Sativa',
 'Community-sourced sativa cultivar known for diesel and earthy terpenes.',
 16, 27, 0, 1, '["sleepy", "relaxed", "hungry"]', '["diesel", "earthy", "pungent"]', 'Early x Girl hybrid'),

('Early Skunk', 'Indica',
 'Community-sourced indica cultivar known for diesel and earthy terpenes.',
 17, 20, 0, 1, '["happy", "relaxed", "euphoric"]', '["diesel", "earthy", "pungent"]', 'Early x Skunk hybrid'),

('East Coast Sour Diesel', 'Hybrid',
 'Community-sourced hybrid cultivar known for diesel and earthy terpenes.',
 17, 29, 0, 1, '["relaxed", "happy", "creative"]', '["diesel", "earthy", "pungent"]', 'East x Diesel hybrid'),

('Ed Rosenthal Super Bud', 'Exotic',
 'Community-sourced exotic cultivar known for diesel and earthy terpenes.',
 23, 35, 0, 1, '["relaxed", "happy", "creative"]', '["diesel", "earthy", "pungent"]', 'Ed x Bud hybrid'),

('El Chapo OG Electric Lemonade', 'Indica',
 'Community-sourced indica cultivar known for diesel and earthy terpenes.',
 16, 21, 0, 1, '["relaxed", "happy", "creative"]', '["diesel", "earthy", "pungent"]', 'El x Lemonade hybrid'),

('Emerald Jack', 'Indica',
 'Community-sourced indica cultivar known for diesel and earthy terpenes.',
 19, 20, 0, 1, '["euphoric", "happy", "relaxed"]', '["diesel", "earthy", "pungent"]', 'Emerald x Jack hybrid'),

('Emerald OG', 'Sativa',
 'Community-sourced sativa cultivar known for mint and sweet terpenes.',
 18, 23, 0, 1, '["relaxed", "happy", "creative"]', '["mint", "sweet", "cream"]', 'Emerald x OG hybrid'),

('End Game', 'Hybrid',
 'Community-sourced hybrid cultivar known for berry and sweet terpenes.',
 20, 30, 0, 1, '["relaxed", "happy", "creative"]', '["berry", "sweet", "grape"]', 'End x Game hybrid'),

('Erez', 'Exotic',
 'Community-sourced exotic cultivar known for diesel and earthy terpenes.',
 23, 35, 0, 1, '["sleepy", "relaxed", "hungry"]', '["diesel", "earthy", "pungent"]', 'Unknown'),

('Euphoria', 'Exotic',
 'Community-sourced exotic cultivar known for tropical and sweet terpenes.',
 22, 35, 0, 1, '["energetic", "creative", "uplifted"]', '["tropical", "sweet", "fruity"]', 'Unknown'),

('Exodus Cheese', 'Hybrid',
 'Community-sourced hybrid cultivar known for tropical and sweet terpenes.',
 17, 26, 0, 1, '["energetic", "creative", "uplifted"]', '["tropical", "sweet", "fruity"]', 'Exodus x Cheese hybrid'),

('Face Off OG', 'Hybrid',
 'Community-sourced hybrid cultivar known for berry and sweet terpenes.',
 19, 30, 0, 1, '["happy", "relaxed", "euphoric"]', '["berry", "sweet", "grape"]', 'Face x OG hybrid'),

('Fat Banana Fire Alien Kush', 'Indica',
 'Community-sourced indica cultivar known for diesel and earthy terpenes.',
 17, 26, 0, 1, '["energetic", "creative", "uplifted"]', '["diesel", "earthy", "pungent"]', 'Fat x Kush hybrid'),

('Flo', 'Sativa',
 'Community-sourced sativa cultivar known for lemon and citrus terpenes.',
 18, 25, 0, 1, '["sleepy", "relaxed", "hungry"]', '["lemon", "citrus", "sweet"]', 'Unknown'),

('Florida OG', 'Hybrid',
 'Community-sourced hybrid cultivar known for cherry and sweet terpenes.',
 17, 25, 0, 1, '["relaxed", "happy", "creative"]', '["cherry", "sweet", "earthy"]', 'Florida x OG hybrid'),

('Forbidden Runtz', 'Hybrid',
 'Community-sourced hybrid cultivar known for sweet and earthy terpenes.',
 17, 28, 0, 1, '["relaxed", "happy", "creative"]', '["sweet", "earthy", "diesel"]', 'Forbidden x Runtz hybrid'),

('Fortune Cookies', 'Hybrid',
 'Community-sourced hybrid cultivar known for diesel and earthy terpenes.',
 19, 28, 0, 1, '["relaxed", "happy", "creative"]', '["diesel", "earthy", "pungent"]', 'Fortune x Cookies hybrid'),

('Frankenstein', 'Hybrid',
 'Community-sourced hybrid cultivar known for lemon and citrus terpenes.',
 18, 26, 0, 1, '["relaxed", "happy", "creative"]', '["lemon", "citrus", "sweet"]', 'Unknown'),

('Frisian Dew', 'Sativa',
 'Community-sourced sativa cultivar known for berry and sweet terpenes.',
 18, 24, 0, 1, '["relaxed", "happy", "creative"]', '["berry", "sweet", "grape"]', 'Frisian x Dew hybrid'),

('Frosted Flakes', 'Hybrid',
 'Community-sourced hybrid cultivar known for cherry and sweet terpenes.',
 18, 30, 0, 1, '["happy", "relaxed", "euphoric"]', '["cherry", "sweet", "earthy"]', 'Frosted x Flakes hybrid'),

('Frosted Fritter Fruit Punch', 'Hybrid',
 'Community-sourced hybrid cultivar known for berry and sweet terpenes.',
 17, 23, 0, 1, '["relaxed", "happy", "creative"]', '["berry", "sweet", "grape"]', 'Frosted x Punch hybrid'),

('Fucking Incredible', 'Hybrid',
 'Community-sourced hybrid cultivar known for cherry and sweet terpenes.',
 18, 22, 0, 1, '["sleepy", "relaxed", "hungry"]', '["cherry", "sweet", "earthy"]', 'Fucking x Incredible hybrid'),

('G13 Haze', 'Hybrid',
 'Community-sourced hybrid cultivar known for mint and sweet terpenes.',
 18, 29, 0, 1, '["sleepy", "relaxed", "hungry"]', '["mint", "sweet", "cream"]', 'G13 x Haze hybrid'),

('Galactic Jack', 'Hybrid',
 'Community-sourced hybrid cultivar known for citrus and pine terpenes.',
 19, 28, 0, 1, '["sleepy", "relaxed", "hungry"]', '["citrus", "pine", "earthy"]', 'Galactic x Jack hybrid'),

('Gelato 33', 'Hybrid',
 'Community-sourced hybrid cultivar known for mint and sweet terpenes.',
 17, 30, 0, 1, '["happy", "relaxed", "euphoric"]', '["mint", "sweet", "cream"]', 'Gelato x 33 hybrid'),

('Gelato 41', 'Indica',
 'Community-sourced indica cultivar known for diesel and earthy terpenes.',
 16, 20, 0, 1, '["happy", "relaxed", "euphoric"]', '["diesel", "earthy", "pungent"]', 'Gelato x 41 hybrid'),

('Gelato 45', 'Indica',
 'Community-sourced indica cultivar known for berry and sweet terpenes.',
 16, 22, 0, 1, '["energetic", "creative", "uplifted"]', '["berry", "sweet", "grape"]', 'Gelato x 45 hybrid'),

('Gelonade', 'Hybrid',
 'Community-sourced hybrid cultivar known for tropical and sweet terpenes.',
 17, 25, 0, 1, '["relaxed", "happy", "creative"]', '["tropical", "sweet", "fruity"]', 'Unknown'),

('Ghost OG Ghost Train Haze', 'Hybrid',
 'Community-sourced hybrid cultivar known for tropical and sweet terpenes.',
 18, 23, 0, 1, '["energetic", "creative", "uplifted"]', '["tropical", "sweet", "fruity"]', 'Ghost x Haze hybrid'),

('Gigabud', 'Sativa',
 'Community-sourced sativa cultivar known for cherry and sweet terpenes.',
 19, 22, 0, 1, '["sleepy", "relaxed", "hungry"]', '["cherry", "sweet", "earthy"]', 'Unknown'),

('Glookies', 'Hybrid',
 'Community-sourced hybrid cultivar known for diesel and earthy terpenes.',
 18, 23, 0, 1, '["euphoric", "happy", "relaxed"]', '["diesel", "earthy", "pungent"]', 'Unknown'),

('Gmo Sherbet', 'Sativa',
 'Community-sourced sativa cultivar known for citrus and pine terpenes.',
 20, 28, 0, 1, '["sleepy", "relaxed", "hungry"]', '["citrus", "pine", "earthy"]', 'Gmo x Sherbet hybrid'),

('God Bud', 'Hybrid',
 'Community-sourced hybrid cultivar known for cherry and sweet terpenes.',
 17, 27, 0, 1, '["euphoric", "happy", "relaxed"]', '["cherry", "sweet", "earthy"]', 'God x Bud hybrid'),

('God''s Gift', 'Exotic',
 'Community-sourced exotic cultivar known for mint and sweet terpenes.',
 22, 29, 0, 1, '["euphoric", "happy", "relaxed"]', '["mint", "sweet", "cream"]', 'God''s x Gift hybrid'),

('Godfather OG', 'Sativa',
 'Community-sourced sativa cultivar known for citrus and pine terpenes.',
 18, 28, 0, 1, '["relaxed", "happy", "creative"]', '["citrus", "pine", "earthy"]', 'Godfather x OG hybrid'),

('Golden Goat', 'Hybrid',
 'Community-sourced hybrid cultivar known for cherry and sweet terpenes.',
 19, 29, 0, 1, '["energetic", "creative", "uplifted"]', '["cherry", "sweet", "earthy"]', 'Golden x Goat hybrid'),

('Golden Panda', 'Indica',
 'Community-sourced indica cultivar known for cherry and sweet terpenes.',
 18, 27, 0, 1, '["relaxed", "happy", "creative"]', '["cherry", "sweet", "earthy"]', 'Golden x Panda hybrid'),

('Golden Pineapple Golden Ticket', 'Exotic',
 'Community-sourced exotic cultivar known for diesel and earthy terpenes.',
 24, 32, 0, 1, '["sleepy", "relaxed", "hungry"]', '["diesel", "earthy", "pungent"]', 'Golden x Ticket hybrid'),

('Gorilla Butter', 'Sativa',
 'Community-sourced sativa cultivar known for lemon and citrus terpenes.',
 17, 25, 0, 1, '["energetic", "creative", "uplifted"]', '["lemon", "citrus", "sweet"]', 'Gorilla x Butter hybrid'),

('Gorilla Cookies', 'Hybrid',
 'Community-sourced hybrid cultivar known for lemon and citrus terpenes.',
 20, 27, 0, 1, '["happy", "relaxed", "euphoric"]', '["lemon", "citrus", "sweet"]', 'Gorilla x Cookies hybrid'),

('Gorilla Diesel', 'Hybrid',
 'Community-sourced hybrid cultivar known for mint and sweet terpenes.',
 18, 29, 0, 1, '["energetic", "creative", "uplifted"]', '["mint", "sweet", "cream"]', 'Gorilla x Diesel hybrid'),

('Gorilla Pie', 'Hybrid',
 'Community-sourced hybrid cultivar known for tropical and sweet terpenes.',
 19, 26, 0, 1, '["euphoric", "happy", "relaxed"]', '["tropical", "sweet", "fruity"]', 'Gorilla x Pie hybrid'),

('Governmint Oasis', 'Hybrid',
 'Community-sourced hybrid cultivar known for citrus and pine terpenes.',
 17, 30, 0, 1, '["energetic", "creative", "uplifted"]', '["citrus", "pine", "earthy"]', 'Governmint x Oasis hybrid'),

('Grand Hindu', 'Indica',
 'Community-sourced indica cultivar known for diesel and earthy terpenes.',
 19, 27, 0, 1, '["euphoric", "happy", "relaxed"]', '["diesel", "earthy", "pungent"]', 'Grand x Hindu hybrid'),

('Grand Master Kush', 'Exotic',
 'Community-sourced exotic cultivar known for sweet and earthy terpenes.',
 23, 35, 0, 1, '["relaxed", "happy", "creative"]', '["sweet", "earthy", "diesel"]', 'Grand x Kush hybrid'),

('Grandma''s Cookies', 'Sativa',
 'Community-sourced sativa cultivar known for diesel and earthy terpenes.',
 17, 23, 0, 1, '["relaxed", "happy", "creative"]', '["diesel", "earthy", "pungent"]', 'Grandma''s x Cookies hybrid'),

('Grape Diamonds Grape Gas', 'Hybrid',
 'Community-sourced hybrid cultivar known for mint and sweet terpenes.',
 19, 29, 0, 1, '["euphoric", "happy", "relaxed"]', '["mint", "sweet", "cream"]', 'Grape x Gas hybrid'),

('Grape Krush', 'Hybrid',
 'Community-sourced hybrid cultivar known for tropical and sweet terpenes.',
 19, 27, 0, 1, '["relaxed", "happy", "creative"]', '["tropical", "sweet", "fruity"]', 'Grape x Krush hybrid'),

('Grape Pie', 'Hybrid',
 'Community-sourced hybrid cultivar known for diesel and earthy terpenes.',
 19, 25, 0, 1, '["happy", "relaxed", "euphoric"]', '["diesel", "earthy", "pungent"]', 'Grape x Pie hybrid'),

('Grape Stomper', 'Hybrid',
 'Community-sourced hybrid cultivar known for diesel and earthy terpenes.',
 17, 30, 0, 1, '["energetic", "creative", "uplifted"]', '["diesel", "earthy", "pungent"]', 'Grape x Stomper hybrid'),

('Grease Monkey', 'Indica',
 'Community-sourced indica cultivar known for tropical and sweet terpenes.',
 19, 24, 0, 1, '["euphoric", "happy", "relaxed"]', '["tropical", "sweet", "fruity"]', 'Grease x Monkey hybrid'),

('Green Candy', 'Sativa',
 'Community-sourced sativa cultivar known for mint and sweet terpenes.',
 16, 24, 0, 1, '["energetic", "creative", "uplifted"]', '["mint", "sweet", "cream"]', 'Green x Candy hybrid'),

('Green Gelato', 'Indica',
 'Community-sourced indica cultivar known for berry and sweet terpenes.',
 18, 20, 0, 1, '["euphoric", "happy", "relaxed"]', '["berry", "sweet", "grape"]', 'Green x Gelato hybrid'),

('Green Goblin', 'Hybrid',
 'Community-sourced hybrid cultivar known for tropical and sweet terpenes.',
 17, 22, 0, 1, '["euphoric", "happy", "relaxed"]', '["tropical", "sweet", "fruity"]', 'Green x Goblin hybrid'),

('Green Haze', 'Exotic',
 'Community-sourced exotic cultivar known for sweet and earthy terpenes.',
 21, 35, 0, 1, '["happy", "relaxed", "euphoric"]', '["sweet", "earthy", "diesel"]', 'Green x Haze hybrid'),

('Green Kush Green Ribbon', 'Hybrid',
 'Community-sourced hybrid cultivar known for lemon and citrus terpenes.',
 19, 29, 0, 1, '["relaxed", "happy", "creative"]', '["lemon", "citrus", "sweet"]', 'Green x Ribbon hybrid'),

('Gruntz', 'Hybrid',
 'Community-sourced hybrid cultivar known for lemon and citrus terpenes.',
 18, 22, 0, 1, '["sleepy", "relaxed", "hungry"]', '["lemon", "citrus", "sweet"]', 'Unknown'),

('Guava', 'Sativa',
 'Community-sourced sativa cultivar known for citrus and pine terpenes.',
 15, 25, 0, 1, '["relaxed", "happy", "creative"]', '["citrus", "pine", "earthy"]', 'Unknown'),

('Guava Gelato', 'Hybrid',
 'Community-sourced hybrid cultivar known for tropical and sweet terpenes.',
 17, 24, 0, 1, '["energetic", "creative", "uplifted"]', '["tropical", "sweet", "fruity"]', 'Guava x Gelato hybrid'),

('Gush Mints', 'Sativa',
 'Community-sourced sativa cultivar known for cherry and sweet terpenes.',
 16, 22, 0, 1, '["euphoric", "happy", "relaxed"]', '["cherry", "sweet", "earthy"]', 'Gush x Mints hybrid'),

('Han Solo Burger', 'Hybrid',
 'Community-sourced hybrid cultivar known for lemon and citrus terpenes.',
 18, 30, 0, 1, '["relaxed", "happy", "creative"]', '["lemon", "citrus", "sweet"]', 'Han x Burger hybrid'),

('Hawaiian Haze', 'Hybrid',
 'Community-sourced hybrid cultivar known for sweet and earthy terpenes.',
 19, 28, 0, 1, '["sleepy", "relaxed", "hungry"]', '["sweet", "earthy", "diesel"]', 'Hawaiian x Haze hybrid'),

('Hawaiian Snow', 'Hybrid',
 'Community-sourced hybrid cultivar known for tropical and sweet terpenes.',
 17, 25, 0, 1, '["energetic", "creative", "uplifted"]', '["tropical", "sweet", "fruity"]', 'Hawaiian x Snow hybrid'),

('Haze Berry', 'Exotic',
 'Community-sourced exotic cultivar known for berry and sweet terpenes.',
 20, 30, 0, 1, '["energetic", "creative", "uplifted"]', '["berry", "sweet", "grape"]', 'Haze x Berry hybrid'),

('Haze OG Hella Jelly', 'Hybrid',
 'Community-sourced hybrid cultivar known for cherry and sweet terpenes.',
 17, 24, 0, 1, '["happy", "relaxed", "euphoric"]', '["cherry", "sweet", "earthy"]', 'Haze x Jelly hybrid'),

('Herijuana', 'Hybrid',
 'Community-sourced hybrid cultivar known for diesel and earthy terpenes.',
 20, 26, 0, 1, '["happy", "relaxed", "euphoric"]', '["diesel", "earthy", "pungent"]', 'Unknown'),

('Hindu Skunk', 'Hybrid',
 'Community-sourced hybrid cultivar known for diesel and earthy terpenes.',
 19, 29, 0, 1, '["happy", "relaxed", "euphoric"]', '["diesel", "earthy", "pungent"]', 'Hindu x Skunk hybrid'),

('Holy Grail Kush', 'Hybrid',
 'Community-sourced hybrid cultivar known for diesel and earthy terpenes.',
 18, 28, 0, 1, '["happy", "relaxed", "euphoric"]', '["diesel", "earthy", "pungent"]', 'Holy x Kush hybrid'),

('Honey Bananas', 'Exotic',
 'Community-sourced exotic cultivar known for citrus and pine terpenes.',
 21, 32, 0, 1, '["energetic", "creative", "uplifted"]', '["citrus", "pine", "earthy"]', 'Honey x Bananas hybrid'),

('Honeycomb', 'Sativa',
 'Community-sourced sativa cultivar known for tropical and sweet terpenes.',
 16, 28, 0, 1, '["sleepy", "relaxed", "hungry"]', '["tropical", "sweet", "fruity"]', 'Unknown'),

('Horchata', 'Hybrid',
 'Community-sourced hybrid cultivar known for cherry and sweet terpenes.',
 17, 29, 0, 1, '["sleepy", "relaxed", "hungry"]', '["cherry", "sweet", "earthy"]', 'Unknown'),

('Huckleberry', 'Hybrid',
 'Community-sourced hybrid cultivar known for sweet and earthy terpenes.',
 20, 29, 0, 1, '["happy", "relaxed", "euphoric"]', '["sweet", "earthy", "diesel"]', 'Unknown'),

('Humboldt', 'Hybrid',
 'Community-sourced hybrid cultivar known for citrus and pine terpenes.',
 19, 26, 0, 1, '["happy", "relaxed", "euphoric"]', '["citrus", "pine", "earthy"]', 'Unknown'),

('Ice Queen Ingrid', 'Indica',
 'Community-sourced indica cultivar known for sweet and earthy terpenes.',
 16, 24, 0, 1, '["euphoric", "happy", "relaxed"]', '["sweet", "earthy", "diesel"]', 'Ice x Ingrid hybrid'),

('Irish Cream', 'Indica',
 'Community-sourced indica cultivar known for berry and sweet terpenes.',
 19, 27, 0, 1, '["sleepy", "relaxed", "hungry"]', '["berry", "sweet", "grape"]', 'Irish x Cream hybrid'),

('Island Sweet Skunk', 'Hybrid',
 'Community-sourced hybrid cultivar known for lemon and citrus terpenes.',
 20, 29, 0, 1, '["happy", "relaxed", "euphoric"]', '["lemon", "citrus", "sweet"]', 'Island x Skunk hybrid'),

('Italian Ice', 'Hybrid',
 'Community-sourced hybrid cultivar known for citrus and pine terpenes.',
 20, 27, 0, 1, '["sleepy", "relaxed", "hungry"]', '["citrus", "pine", "earthy"]', 'Italian x Ice hybrid'),

('Jager', 'Indica',
 'Community-sourced indica cultivar known for tropical and sweet terpenes.',
 18, 26, 0, 1, '["relaxed", "happy", "creative"]', '["tropical", "sweet", "fruity"]', 'Unknown'),

('Jelly Rancher', 'Exotic',
 'Community-sourced exotic cultivar known for citrus and pine terpenes.',
 23, 28, 0, 1, '["relaxed", "happy", "creative"]', '["citrus", "pine", "earthy"]', 'Jelly x Rancher hybrid'),

('Jesus OG', 'Hybrid',
 'Community-sourced hybrid cultivar known for cherry and sweet terpenes.',
 19, 27, 0, 1, '["happy", "relaxed", "euphoric"]', '["cherry", "sweet", "earthy"]', 'Jesus x OG hybrid'),

('Jet Fuel', 'Hybrid',
 'Community-sourced hybrid cultivar known for cherry and sweet terpenes.',
 17, 30, 0, 1, '["relaxed", "happy", "creative"]', '["cherry", "sweet", "earthy"]', 'Jet x Fuel hybrid'),

('Jet Fuel Gelato Jillybean', 'Sativa',
 'Community-sourced sativa cultivar known for lemon and citrus terpenes.',
 16, 26, 0, 1, '["sleepy", "relaxed", "hungry"]', '["lemon", "citrus", "sweet"]', 'Jet x Jillybean hybrid'),

('Jokerz', 'Exotic',
 'Community-sourced exotic cultivar known for tropical and sweet terpenes.',
 23, 28, 0, 1, '["energetic", "creative", "uplifted"]', '["tropical", "sweet", "fruity"]', 'Unknown'),

('Jungle Cake', 'Hybrid',
 'Community-sourced hybrid cultivar known for lemon and citrus terpenes.',
 18, 26, 0, 1, '["relaxed", "happy", "creative"]', '["lemon", "citrus", "sweet"]', 'Jungle x Cake hybrid'),

('Wedding Crasher', 'Sativa',
 'Community-sourced sativa cultivar known for diesel and earthy terpenes.',
 15, 27, 0, 1, '["euphoric", "happy", "relaxed"]', '["diesel", "earthy", "pungent"]', 'Wedding x Crasher hybrid'),

('Wedding Pie', 'Exotic',
 'Community-sourced exotic cultivar known for sweet and earthy terpenes.',
 21, 32, 0, 1, '["euphoric", "happy", "relaxed"]', '["sweet", "earthy", "diesel"]', 'Wedding x Pie hybrid'),

('Wedding Mintz', 'Hybrid',
 'Community-sourced hybrid cultivar known for citrus and pine terpenes.',
 20, 23, 0, 1, '["energetic", "creative", "uplifted"]', '["citrus", "pine", "earthy"]', 'Wedding x Mintz hybrid'),

('Pink Panty Dropper', 'Hybrid',
 'Community-sourced hybrid cultivar known for tropical and sweet terpenes.',
 17, 24, 0, 1, '["relaxed", "happy", "creative"]', '["tropical", "sweet", "fruity"]', 'Pink x Dropper hybrid'),

('Purple Panty Dropper', 'Hybrid',
 'Community-sourced hybrid cultivar known for lemon and citrus terpenes.',
 19, 28, 0, 1, '["relaxed", "happy", "creative"]', '["lemon", "citrus", "sweet"]', 'Purple x Dropper hybrid'),

('LA Kush Cake King Louis Xiii', 'Indica',
 'Community-sourced indica cultivar known for diesel and earthy terpenes.',
 19, 22, 0, 1, '["relaxed", "happy", "creative"]', '["diesel", "earthy", "pungent"]', 'LA x Xiii hybrid'),

('Master Yoda', 'Hybrid',
 'Community-sourced hybrid cultivar known for cherry and sweet terpenes.',
 18, 23, 0, 1, '["sleepy", "relaxed", "hungry"]', '["cherry", "sweet", "earthy"]', 'Master x Yoda hybrid'),

('Yoda OG', 'Hybrid',
 'Community-sourced hybrid cultivar known for tropical and sweet terpenes.',
 19, 22, 0, 1, '["sleepy", "relaxed", "hungry"]', '["tropical", "sweet", "fruity"]', 'Yoda x OG hybrid'),

('Pre-98 Bubba', 'Hybrid',
 'Community-sourced hybrid cultivar known for lemon and citrus terpenes.',
 20, 24, 0, 1, '["relaxed", "happy", "creative"]', '["lemon", "citrus", "sweet"]', 'Pre-98 x Bubba hybrid'),

('Kosher Kush', 'Hybrid',
 'Community-sourced hybrid cultivar known for cherry and sweet terpenes.',
 19, 30, 0, 1, '["euphoric", "happy", "relaxed"]', '["cherry", "sweet", "earthy"]', 'Kosher x Kush hybrid'),

('Bubba OG', 'Hybrid',
 'Community-sourced hybrid cultivar known for cherry and sweet terpenes.',
 19, 25, 0, 1, '["energetic", "creative", "uplifted"]', '["cherry", "sweet", "earthy"]', 'Bubba x OG hybrid'),

('Triangle Kush', 'Indica',
 'Community-sourced indica cultivar known for lemon and citrus terpenes.',
 19, 20, 0, 1, '["sleepy", "relaxed", "hungry"]', '["lemon", "citrus", "sweet"]', 'Triangle x Kush hybrid'),

('Triangle Mints Animal Face', 'Exotic',
 'Community-sourced exotic cultivar known for lemon and citrus terpenes.',
 23, 34, 0, 1, '["energetic", "creative", "uplifted"]', '["lemon", "citrus", "sweet"]', 'Triangle x Face hybrid'),

('Animal Star Cookies', 'Sativa',
 'Community-sourced sativa cultivar known for mint and sweet terpenes.',
 16, 26, 0, 1, '["euphoric", "happy", "relaxed"]', '["mint", "sweet", "cream"]', 'Animal x Cookies hybrid'),

('Bernie Hana Butter', 'Sativa',
 'Community-sourced sativa cultivar known for lemon and citrus terpenes.',
 18, 22, 0, 1, '["euphoric", "happy", "relaxed"]', '["lemon", "citrus", "sweet"]', 'Bernie x Butter hybrid'),

('Blue Slush', 'Sativa',
 'Community-sourced sativa cultivar known for berry and sweet terpenes.',
 20, 23, 0, 1, '["relaxed", "happy", "creative"]', '["berry", "sweet", "grape"]', 'Blue x Slush hybrid'),

('White Truffle', 'Sativa',
 'Community-sourced sativa cultivar known for mint and sweet terpenes.',
 18, 28, 0, 1, '["sleepy", "relaxed", "hungry"]', '["mint", "sweet", "cream"]', 'White x Truffle hybrid'),

('Black Truffle', 'Hybrid',
 'Community-sourced hybrid cultivar known for cherry and sweet terpenes.',
 20, 23, 0, 1, '["sleepy", "relaxed", "hungry"]', '["cherry", "sweet", "earthy"]', 'Black x Truffle hybrid'),

('Truffle Cake', 'Hybrid',
 'Community-sourced hybrid cultivar known for citrus and pine terpenes.',
 20, 30, 0, 1, '["happy", "relaxed", "euphoric"]', '["citrus", "pine", "earthy"]', 'Truffle x Cake hybrid'),

('Pink Certz', 'Indica',
 'Community-sourced indica cultivar known for cherry and sweet terpenes.',
 18, 23, 0, 1, '["happy", "relaxed", "euphoric"]', '["cherry", "sweet", "earthy"]', 'Pink x Certz hybrid'),

('Pink Rozay', 'Sativa',
 'Community-sourced sativa cultivar known for lemon and citrus terpenes.',
 20, 27, 0, 1, '["happy", "relaxed", "euphoric"]', '["lemon", "citrus", "sweet"]', 'Pink x Rozay hybrid'),

('Pink Acai Lemonatti', 'Indica',
 'Community-sourced indica cultivar known for mint and sweet terpenes.',
 18, 20, 0, 1, '["happy", "relaxed", "euphoric"]', '["mint", "sweet", "cream"]', 'Pink x Lemonatti hybrid'),

('Blue Lobster', 'Sativa',
 'Community-sourced sativa cultivar known for cherry and sweet terpenes.',
 17, 24, 0, 1, '["sleepy", "relaxed", "hungry"]', '["cherry", "sweet", "earthy"]', 'Blue x Lobster hybrid'),

('Lobster Butter', 'Indica',
 'Community-sourced indica cultivar known for berry and sweet terpenes.',
 17, 26, 0, 1, '["euphoric", "happy", "relaxed"]', '["berry", "sweet", "grape"]', 'Lobster x Butter hybrid'),

('Gelato 47', 'Indica',
 'Community-sourced indica cultivar known for cherry and sweet terpenes.',
 17, 21, 0, 1, '["euphoric", "happy", "relaxed"]', '["cherry", "sweet", "earthy"]', 'Gelato x 47 hybrid'),

('Gelato 49', 'Hybrid',
 'Community-sourced hybrid cultivar known for berry and sweet terpenes.',
 18, 29, 0, 1, '["euphoric", "happy", "relaxed"]', '["berry", "sweet", "grape"]', 'Gelato x 49 hybrid'),

('Bacio Gelato', 'Indica',
 'Community-sourced indica cultivar known for tropical and sweet terpenes.',
 19, 24, 0, 1, '["relaxed", "happy", "creative"]', '["tropical", "sweet", "fruity"]', 'Bacio x Gelato hybrid'),

('Mochi Gelato', 'Exotic',
 'Community-sourced exotic cultivar known for berry and sweet terpenes.',
 20, 35, 0, 1, '["sleepy", "relaxed", "hungry"]', '["berry", "sweet", "grape"]', 'Mochi x Gelato hybrid'),

('Froyo Gelato', 'Sativa',
 'Community-sourced sativa cultivar known for tropical and sweet terpenes.',
 18, 24, 0, 1, '["euphoric", "happy", "relaxed"]', '["tropical", "sweet", "fruity"]', 'Froyo x Gelato hybrid'),

('Gelato Sundae', 'Exotic',
 'Community-sourced exotic cultivar known for tropical and sweet terpenes.',
 23, 32, 0, 1, '["relaxed", "happy", "creative"]', '["tropical", "sweet", "fruity"]', 'Gelato x Sundae hybrid'),

('Sherb Cream Pie Sherbanger', 'Indica',
 'Community-sourced indica cultivar known for diesel and earthy terpenes.',
 19, 27, 0, 1, '["happy", "relaxed", "euphoric"]', '["diesel", "earthy", "pungent"]', 'Sherb x Sherbanger hybrid'),

('Purple Push Pop', 'Hybrid',
 'Community-sourced hybrid cultivar known for sweet and earthy terpenes.',
 19, 26, 0, 1, '["sleepy", "relaxed", "hungry"]', '["sweet", "earthy", "diesel"]', 'Purple x Pop hybrid'),

('Falcon 9', 'Exotic',
 'Community-sourced exotic cultivar known for sweet and earthy terpenes.',
 23, 32, 0, 1, '["happy", "relaxed", "euphoric"]', '["sweet", "earthy", "diesel"]', 'Falcon x 9 hybrid'),

('Zkittlez Cake', 'Hybrid',
 'Community-sourced hybrid cultivar known for mint and sweet terpenes.',
 20, 26, 0, 1, '["energetic", "creative", "uplifted"]', '["mint", "sweet", "cream"]', 'Zkittlez x Cake hybrid'),

('Zkittlez Pie', 'Indica',
 'Community-sourced indica cultivar known for citrus and pine terpenes.',
 17, 24, 0, 1, '["energetic", "creative", "uplifted"]', '["citrus", "pine", "earthy"]', 'Zkittlez x Pie hybrid'),

('Rainbow Chip', 'Exotic',
 'Community-sourced exotic cultivar known for sweet and earthy terpenes.',
 20, 32, 0, 1, '["relaxed", "happy", "creative"]', '["sweet", "earthy", "diesel"]', 'Rainbow x Chip hybrid'),

('Rainbow Road', 'Hybrid',
 'Community-sourced hybrid cultivar known for tropical and sweet terpenes.',
 19, 24, 0, 1, '["happy", "relaxed", "euphoric"]', '["tropical", "sweet", "fruity"]', 'Rainbow x Road hybrid'),

('Fruit Loops Fruity Pebbles', 'Hybrid',
 'Community-sourced hybrid cultivar known for berry and sweet terpenes.',
 20, 24, 0, 1, '["energetic", "creative", "uplifted"]', '["berry", "sweet", "grape"]', 'Fruit x Pebbles hybrid'),

('Pebbles OG', 'Hybrid',
 'Community-sourced hybrid cultivar known for tropical and sweet terpenes.',
 19, 30, 0, 1, '["euphoric", "happy", "relaxed"]', '["tropical", "sweet", "fruity"]', 'Pebbles x OG hybrid'),

('Captain Crunch', 'Indica',
 'Community-sourced indica cultivar known for mint and sweet terpenes.',
 18, 27, 0, 1, '["sleepy", "relaxed", "hungry"]', '["mint", "sweet", "cream"]', 'Captain x Crunch hybrid'),

('Maple Leaf', 'Sativa',
 'Community-sourced sativa cultivar known for diesel and earthy terpenes.',
 18, 22, 0, 1, '["energetic", "creative", "uplifted"]', '["diesel", "earthy", "pungent"]', 'Maple x Leaf hybrid'),

('BC Big Bud', 'Exotic',
 'Community-sourced exotic cultivar known for cherry and sweet terpenes.',
 23, 33, 0, 1, '["happy", "relaxed", "euphoric"]', '["cherry", "sweet", "earthy"]', 'BC x Bud hybrid'),

('BC God Bud', 'Sativa',
 'Community-sourced sativa cultivar known for lemon and citrus terpenes.',
 17, 26, 0, 1, '["happy", "relaxed", "euphoric"]', '["lemon", "citrus", "sweet"]', 'BC x Bud hybrid'),

('Quebec Gold Mango Kush', 'Hybrid',
 'Community-sourced hybrid cultivar known for citrus and pine terpenes.',
 19, 28, 0, 1, '["sleepy", "relaxed", "hungry"]', '["citrus", "pine", "earthy"]', 'Quebec x Kush hybrid'),

('Mango Haze', 'Exotic',
 'Community-sourced exotic cultivar known for mint and sweet terpenes.',
 21, 35, 0, 1, '["happy", "relaxed", "euphoric"]', '["mint", "sweet", "cream"]', 'Mango x Haze hybrid'),

('Mango Tango', 'Hybrid',
 'Community-sourced hybrid cultivar known for tropical and sweet terpenes.',
 18, 23, 0, 1, '["relaxed", "happy", "creative"]', '["tropical", "sweet", "fruity"]', 'Mango x Tango hybrid'),

('Mango Dream', 'Exotic',
 'Community-sourced exotic cultivar known for sweet and earthy terpenes.',
 23, 29, 0, 1, '["energetic", "creative", "uplifted"]', '["sweet", "earthy", "diesel"]', 'Mango x Dream hybrid'),

('Mango Widow', 'Sativa',
 'Community-sourced sativa cultivar known for citrus and pine terpenes.',
 17, 25, 0, 1, '["happy", "relaxed", "euphoric"]', '["citrus", "pine", "earthy"]', 'Mango x Widow hybrid'),

('Mango Sapphire', 'Indica',
 'Community-sourced indica cultivar known for mint and sweet terpenes.',
 17, 26, 0, 1, '["relaxed", "happy", "creative"]', '["mint", "sweet", "cream"]', 'Mango x Sapphire hybrid'),

('Mango Lassi', 'Exotic',
 'Community-sourced exotic cultivar known for berry and sweet terpenes.',
 24, 34, 0, 1, '["euphoric", "happy", "relaxed"]', '["berry", "sweet", "grape"]', 'Mango x Lassi hybrid'),

('Papaya Punch', 'Hybrid',
 'Community-sourced hybrid cultivar known for cherry and sweet terpenes.',
 17, 29, 0, 1, '["euphoric", "happy", "relaxed"]', '["cherry", "sweet", "earthy"]', 'Papaya x Punch hybrid'),

('Papaya Cake', 'Hybrid',
 'Community-sourced hybrid cultivar known for lemon and citrus terpenes.',
 17, 27, 0, 1, '["energetic", "creative", "uplifted"]', '["lemon", "citrus", "sweet"]', 'Papaya x Cake hybrid'),

('Papaya Melons Papaya Runtz', 'Hybrid',
 'Community-sourced hybrid cultivar known for mint and sweet terpenes.',
 18, 27, 0, 1, '["happy", "relaxed", "euphoric"]', '["mint", "sweet", "cream"]', 'Papaya x Runtz hybrid'),

('Strawberry Diesel', 'Hybrid',
 'Community-sourced hybrid cultivar known for tropical and sweet terpenes.',
 19, 22, 0, 1, '["relaxed", "happy", "creative"]', '["tropical", "sweet", "fruity"]', 'Strawberry x Diesel hybrid'),

('Strawberry Guava', 'Indica',
 'Community-sourced indica cultivar known for diesel and earthy terpenes.',
 16, 27, 0, 1, '["happy", "relaxed", "euphoric"]', '["diesel", "earthy", "pungent"]', 'Strawberry x Guava hybrid'),

('Strawberry Lemonade', 'Exotic',
 'Community-sourced exotic cultivar known for mint and sweet terpenes.',
 24, 28, 0, 1, '["happy", "relaxed", "euphoric"]', '["mint", "sweet", "cream"]', 'Strawberry x Lemonade hybrid'),

('Strawberry Milkshake', 'Indica',
 'Community-sourced indica cultivar known for diesel and earthy terpenes.',
 17, 23, 0, 1, '["happy", "relaxed", "euphoric"]', '["diesel", "earthy", "pungent"]', 'Strawberry x Milkshake hybrid'),

('Strawberry Shortcake', 'Hybrid',
 'Community-sourced hybrid cultivar known for berry and sweet terpenes.',
 18, 25, 0, 1, '["sleepy", "relaxed", "hungry"]', '["berry", "sweet", "grape"]', 'Strawberry x Shortcake hybrid'),

('Watermelon Zkittlez', 'Hybrid',
 'Community-sourced hybrid cultivar known for berry and sweet terpenes.',
 17, 26, 0, 1, '["energetic", "creative", "uplifted"]', '["berry", "sweet", "grape"]', 'Watermelon x Zkittlez hybrid'),

('Watermelon Gelato', 'Hybrid',
 'Community-sourced hybrid cultivar known for sweet and earthy terpenes.',
 19, 24, 0, 1, '["happy", "relaxed", "euphoric"]', '["sweet", "earthy", "diesel"]', 'Watermelon x Gelato hybrid'),

('Watermelon Runtz', 'Indica',
 'Community-sourced indica cultivar known for mint and sweet terpenes.',
 16, 25, 0, 1, '["energetic", "creative", "uplifted"]', '["mint", "sweet", "cream"]', 'Watermelon x Runtz hybrid'),

('Watermelon Sorbet Watermelon Mimosa', 'Sativa',
 'Community-sourced sativa cultivar known for berry and sweet terpenes.',
 16, 24, 0, 1, '["happy", "relaxed", "euphoric"]', '["berry", "sweet", "grape"]', 'Watermelon x Mimosa hybrid'),

('Blue Satellite', 'Exotic',
 'Community-sourced exotic cultivar known for lemon and citrus terpenes.',
 23, 29, 0, 1, '["happy", "relaxed", "euphoric"]', '["lemon", "citrus", "sweet"]', 'Blue x Satellite hybrid'),

('Blue Venom', 'Hybrid',
 'Community-sourced hybrid cultivar known for citrus and pine terpenes.',
 19, 30, 0, 1, '["euphoric", "happy", "relaxed"]', '["citrus", "pine", "earthy"]', 'Blue x Venom hybrid'),

('Blue Knight', 'Hybrid',
 'Community-sourced hybrid cultivar known for tropical and sweet terpenes.',
 18, 22, 0, 1, '["euphoric", "happy", "relaxed"]', '["tropical", "sweet", "fruity"]', 'Blue x Knight hybrid'),

('Blue Rhino', 'Hybrid',
 'Community-sourced hybrid cultivar known for cherry and sweet terpenes.',
 17, 22, 0, 1, '["relaxed", "happy", "creative"]', '["cherry", "sweet", "earthy"]', 'Blue x Rhino hybrid'),

('Purple Urkle', 'Hybrid',
 'Community-sourced hybrid cultivar known for citrus and pine terpenes.',
 17, 29, 0, 1, '["relaxed", "happy", "creative"]', '["citrus", "pine", "earthy"]', 'Purple x Urkle hybrid'),

('Purple Trainwreck', 'Sativa',
 'Community-sourced sativa cultivar known for citrus and pine terpenes.',
 17, 26, 0, 1, '["energetic", "creative", "uplifted"]', '["citrus", "pine", "earthy"]', 'Purple x Trainwreck hybrid'),

('Purple Candy', 'Indica',
 'Community-sourced indica cultivar known for tropical and sweet terpenes.',
 18, 25, 0, 1, '["relaxed", "happy", "creative"]', '["tropical", "sweet", "fruity"]', 'Purple x Candy hybrid'),

('Purple Afghani', 'Hybrid',
 'Community-sourced hybrid cultivar known for diesel and earthy terpenes.',
 20, 23, 0, 1, '["happy", "relaxed", "euphoric"]', '["diesel", "earthy", "pungent"]', 'Purple x Afghani hybrid'),

('Purple Skunk Purple Diesel', 'Hybrid',
 'Community-sourced hybrid cultivar known for mint and sweet terpenes.',
 20, 25, 0, 1, '["relaxed", "happy", "creative"]', '["mint", "sweet", "cream"]', 'Purple x Diesel hybrid'),

('Purple OG', 'Hybrid',
 'Community-sourced hybrid cultivar known for mint and sweet terpenes.',
 20, 28, 0, 1, '["happy", "relaxed", "euphoric"]', '["mint", "sweet", "cream"]', 'Purple x OG hybrid'),

('Purple Space Cookies', 'Hybrid',
 'Community-sourced hybrid cultivar known for berry and sweet terpenes.',
 19, 26, 0, 1, '["sleepy", "relaxed", "hungry"]', '["berry", "sweet", "grape"]', 'Purple x Cookies hybrid'),

('Purple Sunset', 'Exotic',
 'Community-sourced exotic cultivar known for citrus and pine terpenes.',
 23, 29, 0, 1, '["happy", "relaxed", "euphoric"]', '["citrus", "pine", "earthy"]', 'Purple x Sunset hybrid'),

('Purple Lemonade', 'Sativa',
 'Community-sourced sativa cultivar known for berry and sweet terpenes.',
 18, 22, 0, 1, '["sleepy", "relaxed", "hungry"]', '["berry", "sweet", "grape"]', 'Purple x Lemonade hybrid'),

('Orange Bud', 'Hybrid',
 'Community-sourced hybrid cultivar known for mint and sweet terpenes.',
 17, 30, 0, 1, '["euphoric", "happy", "relaxed"]', '["mint", "sweet", "cream"]', 'Orange x Bud hybrid'),

('Orange Crush', 'Exotic',
 'Community-sourced exotic cultivar known for cherry and sweet terpenes.',
 20, 34, 0, 1, '["sleepy", "relaxed", "hungry"]', '["cherry", "sweet", "earthy"]', 'Orange x Crush hybrid'),

('Orange Cookies', 'Exotic',
 'Community-sourced exotic cultivar known for tropical and sweet terpenes.',
 20, 32, 0, 1, '["euphoric", "happy", "relaxed"]', '["tropical", "sweet", "fruity"]', 'Orange x Cookies hybrid'),

('Orange Creamsicle', 'Hybrid',
 'Community-sourced hybrid cultivar known for berry and sweet terpenes.',
 17, 30, 0, 1, '["energetic", "creative", "uplifted"]', '["berry", "sweet", "grape"]', 'Orange x Creamsicle hybrid'),

('Orange Daiquiri Orange Julius', 'Exotic',
 'Community-sourced exotic cultivar known for mint and sweet terpenes.',
 23, 31, 0, 1, '["happy", "relaxed", "euphoric"]', '["mint", "sweet", "cream"]', 'Orange x Julius hybrid'),

('Lemon Tree', 'Hybrid',
 'Community-sourced hybrid cultivar known for diesel and earthy terpenes.',
 19, 23, 0, 1, '["sleepy", "relaxed", "hungry"]', '["diesel", "earthy", "pungent"]', 'Lemon x Tree hybrid'),

('Lemon OG', 'Hybrid',
 'Community-sourced hybrid cultivar known for berry and sweet terpenes.',
 17, 26, 0, 1, '["happy", "relaxed", "euphoric"]', '["berry", "sweet", "grape"]', 'Lemon x OG hybrid'),

('Lemon Kush', 'Hybrid',
 'Community-sourced hybrid cultivar known for sweet and earthy terpenes.',
 19, 27, 0, 1, '["sleepy", "relaxed", "hungry"]', '["sweet", "earthy", "diesel"]', 'Lemon x Kush hybrid'),

('Lemon Diesel', 'Indica',
 'Community-sourced indica cultivar known for berry and sweet terpenes.',
 17, 26, 0, 1, '["happy", "relaxed", "euphoric"]', '["berry", "sweet", "grape"]', 'Lemon x Diesel hybrid'),

('Lemon Drop', 'Exotic',
 'Community-sourced exotic cultivar known for diesel and earthy terpenes.',
 20, 29, 0, 1, '["euphoric", "happy", "relaxed"]', '["diesel", "earthy", "pungent"]', 'Lemon x Drop hybrid'),

('Lemon Meringue', 'Hybrid',
 'Community-sourced hybrid cultivar known for berry and sweet terpenes.',
 20, 29, 0, 1, '["sleepy", "relaxed", "hungry"]', '["berry", "sweet", "grape"]', 'Lemon x Meringue hybrid'),

('Lime Skunk', 'Hybrid',
 'Community-sourced hybrid cultivar known for citrus and pine terpenes.',
 19, 27, 0, 1, '["euphoric", "happy", "relaxed"]', '["citrus", "pine", "earthy"]', 'Lime x Skunk hybrid'),

('Lime Sorbet', 'Sativa',
 'Community-sourced sativa cultivar known for sweet and earthy terpenes.',
 16, 23, 0, 1, '["euphoric", "happy", "relaxed"]', '["sweet", "earthy", "diesel"]', 'Lime x Sorbet hybrid'),

('Key Lime Pie Lime OG', 'Exotic',
 'Community-sourced exotic cultivar known for cherry and sweet terpenes.',
 20, 32, 0, 1, '["relaxed", "happy", "creative"]', '["cherry", "sweet", "earthy"]', 'Key x OG hybrid'),

('Lime Haze', 'Hybrid',
 'Community-sourced hybrid cultivar known for diesel and earthy terpenes.',
 20, 28, 0, 1, '["sleepy", "relaxed", "hungry"]', '["diesel", "earthy", "pungent"]', 'Lime x Haze hybrid'),

('Lime Purple', 'Hybrid',
 'Community-sourced hybrid cultivar known for citrus and pine terpenes.',
 17, 27, 0, 1, '["relaxed", "happy", "creative"]', '["citrus", "pine", "earthy"]', 'Lime x Purple hybrid'),

('Grapefruit Haze', 'Hybrid',
 'Community-sourced hybrid cultivar known for sweet and earthy terpenes.',
 20, 30, 0, 1, '["sleepy", "relaxed", "hungry"]', '["sweet", "earthy", "diesel"]', 'Grapefruit x Haze hybrid'),

('Grapefruit Kush', 'Indica',
 'Community-sourced indica cultivar known for diesel and earthy terpenes.',
 19, 20, 0, 1, '["happy", "relaxed", "euphoric"]', '["diesel", "earthy", "pungent"]', 'Grapefruit x Kush hybrid'),

('Grapefruit Diesel', 'Hybrid',
 'Community-sourced hybrid cultivar known for tropical and sweet terpenes.',
 18, 24, 0, 1, '["sleepy", "relaxed", "hungry"]', '["tropical", "sweet", "fruity"]', 'Grapefruit x Diesel hybrid'),

('Grapefruit Tangie', 'Hybrid',
 'Community-sourced hybrid cultivar known for cherry and sweet terpenes.',
 17, 22, 0, 1, '["relaxed", "happy", "creative"]', '["cherry", "sweet", "earthy"]', 'Grapefruit x Tangie hybrid'),

('Grapefruit Romulan', 'Indica',
 'Community-sourced indica cultivar known for diesel and earthy terpenes.',
 17, 26, 0, 1, '["euphoric", "happy", "relaxed"]', '["diesel", "earthy", "pungent"]', 'Grapefruit x Romulan hybrid'),

('Pineapple Kush', 'Hybrid',
 'Community-sourced hybrid cultivar known for sweet and earthy terpenes.',
 19, 23, 0, 1, '["relaxed", "happy", "creative"]', '["sweet", "earthy", "diesel"]', 'Pineapple x Kush hybrid'),

('Pineapple Chunk Pineapple Haze', 'Hybrid',
 'Community-sourced hybrid cultivar known for mint and sweet terpenes.',
 17, 29, 0, 1, '["happy", "relaxed", "euphoric"]', '["mint", "sweet", "cream"]', 'Pineapple x Haze hybrid'),

('Pineapple Jack', 'Hybrid',
 'Community-sourced hybrid cultivar known for tropical and sweet terpenes.',
 20, 28, 0, 1, '["relaxed", "happy", "creative"]', '["tropical", "sweet", "fruity"]', 'Pineapple x Jack hybrid'),

('Pineapple Fruz', 'Sativa',
 'Community-sourced sativa cultivar known for berry and sweet terpenes.',
 18, 22, 0, 1, '["sleepy", "relaxed", "hungry"]', '["berry", "sweet", "grape"]', 'Pineapple x Fruz hybrid'),

('Pineapple Mimosa', 'Hybrid',
 'Community-sourced hybrid cultivar known for cherry and sweet terpenes.',
 20, 27, 0, 1, '["happy", "relaxed", "euphoric"]', '["cherry", "sweet", "earthy"]', 'Pineapple x Mimosa hybrid'),

('Banana Cream', 'Sativa',
 'Community-sourced sativa cultivar known for cherry and sweet terpenes.',
 16, 25, 0, 1, '["euphoric", "happy", "relaxed"]', '["cherry", "sweet", "earthy"]', 'Banana x Cream hybrid'),

('Banana Hammock', 'Hybrid',
 'Community-sourced hybrid cultivar known for mint and sweet terpenes.',
 17, 28, 0, 1, '["sleepy", "relaxed", "hungry"]', '["mint", "sweet", "cream"]', 'Banana x Hammock hybrid'),

('Banana MAC', 'Indica',
 'Community-sourced indica cultivar known for citrus and pine terpenes.',
 18, 22, 0, 1, '["happy", "relaxed", "euphoric"]', '["citrus", "pine", "earthy"]', 'Banana x MAC hybrid'),

('Banana Split', 'Hybrid',
 'Community-sourced hybrid cultivar known for berry and sweet terpenes.',
 18, 27, 0, 1, '["sleepy", "relaxed", "hungry"]', '["berry", "sweet", "grape"]', 'Banana x Split hybrid'),

('Banana Foster', 'Indica',
 'Community-sourced indica cultivar known for diesel and earthy terpenes.',
 16, 22, 0, 1, '["sleepy", "relaxed", "hungry"]', '["diesel", "earthy", "pungent"]', 'Banana x Foster hybrid'),

('Cherry Wine Cherry Abacus', 'Indica',
 'Community-sourced indica cultivar known for lemon and citrus terpenes.',
 17, 21, 0, 1, '["energetic", "creative", "uplifted"]', '["lemon", "citrus", "sweet"]', 'Cherry x Abacus hybrid'),

('Cherry Blossom', 'Hybrid',
 'Community-sourced hybrid cultivar known for berry and sweet terpenes.',
 20, 27, 0, 1, '["sleepy", "relaxed", "hungry"]', '["berry", "sweet", "grape"]', 'Cherry x Blossom hybrid'),

('Cherry MAC', 'Hybrid',
 'Community-sourced hybrid cultivar known for tropical and sweet terpenes.',
 17, 29, 0, 1, '["relaxed", "happy", "creative"]', '["tropical", "sweet", "fruity"]', 'Cherry x MAC hybrid'),

('Cherry Meringue', 'Hybrid',
 'Community-sourced hybrid cultivar known for citrus and pine terpenes.',
 17, 27, 0, 1, '["euphoric", "happy", "relaxed"]', '["citrus", "pine", "earthy"]', 'Cherry x Meringue hybrid'),

('Cherry Sherbet', 'Hybrid',
 'Community-sourced hybrid cultivar known for sweet and earthy terpenes.',
 20, 29, 0, 1, '["happy", "relaxed", "euphoric"]', '["sweet", "earthy", "diesel"]', 'Cherry x Sherbet hybrid'),

('Cherry Stomper', 'Hybrid',
 'Community-sourced hybrid cultivar known for cherry and sweet terpenes.',
 19, 23, 0, 1, '["happy", "relaxed", "euphoric"]', '["cherry", "sweet", "earthy"]', 'Cherry x Stomper hybrid'),

('Cherry Tart', 'Hybrid',
 'Community-sourced hybrid cultivar known for diesel and earthy terpenes.',
 17, 29, 0, 1, '["euphoric", "happy", "relaxed"]', '["diesel", "earthy", "pungent"]', 'Cherry x Tart hybrid'),

('Cherry Zest', 'Hybrid',
 'Community-sourced hybrid cultivar known for sweet and earthy terpenes.',
 20, 30, 0, 1, '["energetic", "creative", "uplifted"]', '["sweet", "earthy", "diesel"]', 'Cherry x Zest hybrid'),

('Cookie Gelato', 'Hybrid',
 'Community-sourced hybrid cultivar known for berry and sweet terpenes.',
 17, 27, 0, 1, '["happy", "relaxed", "euphoric"]', '["berry", "sweet", "grape"]', 'Cookie x Gelato hybrid'),

('Cookie Runtz Cookie Blizzard', 'Sativa',
 'Community-sourced sativa cultivar known for lemon and citrus terpenes.',
 16, 27, 0, 1, '["relaxed", "happy", "creative"]', '["lemon", "citrus", "sweet"]', 'Cookie x Blizzard hybrid'),

('Cookies Kush Mint', 'Hybrid',
 'Community-sourced hybrid cultivar known for tropical and sweet terpenes.',
 18, 27, 0, 1, '["sleepy", "relaxed", "hungry"]', '["tropical", "sweet", "fruity"]', 'Cookies x Mint hybrid'),

('Gas Face', 'Hybrid',
 'Community-sourced hybrid cultivar known for sweet and earthy terpenes.',
 20, 27, 0, 1, '["euphoric", "happy", "relaxed"]', '["sweet", "earthy", "diesel"]', 'Gas x Face hybrid'),

('Gas Truffle', 'Exotic',
 'Community-sourced exotic cultivar known for citrus and pine terpenes.',
 22, 29, 0, 1, '["sleepy", "relaxed", "hungry"]', '["citrus", "pine", "earthy"]', 'Gas x Truffle hybrid'),

('Gas Monkey', 'Hybrid',
 'Community-sourced hybrid cultivar known for berry and sweet terpenes.',
 20, 26, 0, 1, '["sleepy", "relaxed", "hungry"]', '["berry", "sweet", "grape"]', 'Gas x Monkey hybrid'),

('Gas Basket', 'Hybrid',
 'Community-sourced hybrid cultivar known for tropical and sweet terpenes.',
 17, 24, 0, 1, '["sleepy", "relaxed", "hungry"]', '["tropical", "sweet", "fruity"]', 'Gas x Basket hybrid'),

('Gelato Cake', 'Exotic',
 'Community-sourced exotic cultivar known for citrus and pine terpenes.',
 23, 30, 0, 1, '["euphoric", "happy", "relaxed"]', '["citrus", "pine", "earthy"]', 'Gelato x Cake hybrid'),

('Gelato Kush', 'Hybrid',
 'Community-sourced hybrid cultivar known for citrus and pine terpenes.',
 20, 27, 0, 1, '["energetic", "creative", "uplifted"]', '["citrus", "pine", "earthy"]', 'Gelato x Kush hybrid'),

('Meat Breath Meat Pie', 'Exotic',
 'Community-sourced exotic cultivar known for mint and sweet terpenes.',
 23, 33, 0, 1, '["happy", "relaxed", "euphoric"]', '["mint", "sweet", "cream"]', 'Meat x Pie hybrid'),

('Motorhead OG', 'Hybrid',
 'Community-sourced hybrid cultivar known for lemon and citrus terpenes.',
 18, 25, 0, 1, '["sleepy", "relaxed", "hungry"]', '["lemon", "citrus", "sweet"]', 'Motorhead x OG hybrid'),

('Motor Oil', 'Indica',
 'Community-sourced indica cultivar known for citrus and pine terpenes.',
 17, 22, 0, 1, '["energetic", "creative", "uplifted"]', '["citrus", "pine", "earthy"]', 'Motor x Oil hybrid'),

('Motor City Kush', 'Hybrid',
 'Community-sourced hybrid cultivar known for sweet and earthy terpenes.',
 17, 30, 0, 1, '["euphoric", "happy", "relaxed"]', '["sweet", "earthy", "diesel"]', 'Motor x Kush hybrid'),

('OG 18', 'Exotic',
 'Community-sourced exotic cultivar known for cherry and sweet terpenes.',
 22, 30, 0, 1, '["euphoric", "happy", "relaxed"]', '["cherry", "sweet", "earthy"]', 'OG x 18 hybrid'),

('OG 41', 'Indica',
 'Community-sourced indica cultivar known for berry and sweet terpenes.',
 17, 22, 0, 1, '["euphoric", "happy", "relaxed"]', '["berry", "sweet", "grape"]', 'OG x 41 hybrid'),

('Sour Apple', 'Exotic',
 'Community-sourced exotic cultivar known for mint and sweet terpenes.',
 23, 28, 0, 1, '["relaxed", "happy", "creative"]', '["mint", "sweet", "cream"]', 'Sour x Apple hybrid'),

('Sour Banana', 'Exotic',
 'Community-sourced exotic cultivar known for tropical and sweet terpenes.',
 21, 35, 0, 1, '["euphoric", "happy", "relaxed"]', '["tropical", "sweet", "fruity"]', 'Sour x Banana hybrid'),

('Sour Blue Sour Cookies', 'Exotic',
 'Community-sourced exotic cultivar known for diesel and earthy terpenes.',
 23, 31, 0, 1, '["euphoric", "happy", "relaxed"]', '["diesel", "earthy", "pungent"]', 'Sour x Cookies hybrid'),

('Sour Dubb', 'Hybrid',
 'Community-sourced hybrid cultivar known for lemon and citrus terpenes.',
 20, 25, 0, 1, '["sleepy", "relaxed", "hungry"]', '["lemon", "citrus", "sweet"]', 'Sour x Dubb hybrid'),

('Sour Gelato', 'Hybrid',
 'Community-sourced hybrid cultivar known for cherry and sweet terpenes.',
 19, 28, 0, 1, '["euphoric", "happy", "relaxed"]', '["cherry", "sweet", "earthy"]', 'Sour x Gelato hybrid'),

('Sour Grapes', 'Indica',
 'Community-sourced indica cultivar known for sweet and earthy terpenes.',
 17, 22, 0, 1, '["sleepy", "relaxed", "hungry"]', '["sweet", "earthy", "diesel"]', 'Sour x Grapes hybrid'),

('Sour Jack', 'Exotic',
 'Community-sourced exotic cultivar known for citrus and pine terpenes.',
 23, 33, 0, 1, '["euphoric", "happy", "relaxed"]', '["citrus", "pine", "earthy"]', 'Sour x Jack hybrid'),

('Sour Lemon', 'Exotic',
 'Community-sourced exotic cultivar known for citrus and pine terpenes.',
 24, 29, 0, 1, '["sleepy", "relaxed", "hungry"]', '["citrus", "pine", "earthy"]', 'Sour x Lemon hybrid'),

('Sour Mango', 'Indica',
 'Community-sourced indica cultivar known for berry and sweet terpenes.',
 18, 27, 0, 1, '["euphoric", "happy", "relaxed"]', '["berry", "sweet", "grape"]', 'Sour x Mango hybrid'),

('Sour OG', 'Hybrid',
 'Community-sourced hybrid cultivar known for mint and sweet terpenes.',
 17, 25, 0, 1, '["relaxed", "happy", "creative"]', '["mint", "sweet", "cream"]', 'Sour x OG hybrid'),

('Sour Patch', 'Sativa',
 'Community-sourced sativa cultivar known for mint and sweet terpenes.',
 18, 22, 0, 1, '["relaxed", "happy", "creative"]', '["mint", "sweet", "cream"]', 'Sour x Patch hybrid'),

('Sour Pebbles Sour Power', 'Indica',
 'Community-sourced indica cultivar known for diesel and earthy terpenes.',
 19, 21, 0, 1, '["sleepy", "relaxed", "hungry"]', '["diesel", "earthy", "pungent"]', 'Sour x Power hybrid'),

('Sour Runtz', 'Sativa',
 'Community-sourced sativa cultivar known for berry and sweet terpenes.',
 17, 22, 0, 1, '["sleepy", "relaxed", "hungry"]', '["berry", "sweet", "grape"]', 'Sour x Runtz hybrid'),

('Sour Sherbet', 'Indica',
 'Community-sourced indica cultivar known for berry and sweet terpenes.',
 16, 24, 0, 1, '["relaxed", "happy", "creative"]', '["berry", "sweet", "grape"]', 'Sour x Sherbet hybrid'),

('Sour Skunk', 'Exotic',
 'Community-sourced exotic cultivar known for sweet and earthy terpenes.',
 23, 35, 0, 1, '["euphoric", "happy", "relaxed"]', '["sweet", "earthy", "diesel"]', 'Sour x Skunk hybrid'),

('Sour Strawberry', 'Sativa',
 'Community-sourced sativa cultivar known for berry and sweet terpenes.',
 15, 24, 0, 1, '["energetic", "creative", "uplifted"]', '["berry", "sweet", "grape"]', 'Sour x Strawberry hybrid'),

('Sour Tsunami', 'Hybrid',
 'Community-sourced hybrid cultivar known for diesel and earthy terpenes.',
 20, 23, 0, 1, '["sleepy", "relaxed", "hungry"]', '["diesel", "earthy", "pungent"]', 'Sour x Tsunami hybrid'),

('Tahoe Alien', 'Hybrid',
 'Community-sourced hybrid cultivar known for cherry and sweet terpenes.',
 17, 22, 0, 1, '["energetic", "creative", "uplifted"]', '["cherry", "sweet", "earthy"]', 'Tahoe x Alien hybrid'),

('Tahoe Hydro OG', 'Exotic',
 'Community-sourced exotic cultivar known for citrus and pine terpenes.',
 24, 35, 0, 1, '["happy", "relaxed", "euphoric"]', '["citrus", "pine", "earthy"]', 'Tahoe x OG hybrid'),

('Tahoe Snow', 'Hybrid',
 'Community-sourced hybrid cultivar known for diesel and earthy terpenes.',
 17, 30, 0, 1, '["euphoric", "happy", "relaxed"]', '["diesel", "earthy", "pungent"]', 'Tahoe x Snow hybrid'),

('Tahoe Cake Tahoe Brunch', 'Exotic',
 'Community-sourced exotic cultivar known for sweet and earthy terpenes.',
 21, 32, 0, 1, '["relaxed", "happy", "creative"]', '["sweet", "earthy", "diesel"]', 'Tahoe x Brunch hybrid'),

('Trainwreck Haze', 'Hybrid',
 'Community-sourced hybrid cultivar known for cherry and sweet terpenes.',
 19, 25, 0, 1, '["euphoric", "happy", "relaxed"]', '["cherry", "sweet", "earthy"]', 'Trainwreck x Haze hybrid'),

('Trainwreck OG', 'Indica',
 'Community-sourced indica cultivar known for sweet and earthy terpenes.',
 16, 25, 0, 1, '["happy", "relaxed", "euphoric"]', '["sweet", "earthy", "diesel"]', 'Trainwreck x OG hybrid'),

('Trainwreck Diesel', 'Hybrid',
 'Community-sourced hybrid cultivar known for mint and sweet terpenes.',
 20, 22, 0, 1, '["relaxed", "happy", "creative"]', '["mint", "sweet", "cream"]', 'Trainwreck x Diesel hybrid'),

('UK Cheese', 'Hybrid',
 'Community-sourced hybrid cultivar known for mint and sweet terpenes.',
 17, 27, 0, 1, '["happy", "relaxed", "euphoric"]', '["mint", "sweet", "cream"]', 'UK x Cheese hybrid'),

('Vanilla Frosting', 'Indica',
 'Community-sourced indica cultivar known for sweet and earthy terpenes.',
 16, 25, 0, 1, '["energetic", "creative", "uplifted"]', '["sweet", "earthy", "diesel"]', 'Vanilla x Frosting hybrid'),

('Vanilla Bean', 'Hybrid',
 'Community-sourced hybrid cultivar known for lemon and citrus terpenes.',
 19, 24, 0, 1, '["relaxed", "happy", "creative"]', '["lemon", "citrus", "sweet"]', 'Vanilla x Bean hybrid'),

('Vanilla Kush', 'Exotic',
 'Community-sourced exotic cultivar known for lemon and citrus terpenes.',
 21, 30, 0, 1, '["happy", "relaxed", "euphoric"]', '["lemon", "citrus", "sweet"]', 'Vanilla x Kush hybrid'),

('Vanilla Latte', 'Sativa',
 'Community-sourced sativa cultivar known for diesel and earthy terpenes.',
 17, 23, 0, 1, '["happy", "relaxed", "euphoric"]', '["diesel", "earthy", "pungent"]', 'Vanilla x Latte hybrid'),

('Vanilla Cake Vanilla Gorilla', 'Sativa',
 'Community-sourced sativa cultivar known for cherry and sweet terpenes.',
 17, 24, 0, 1, '["euphoric", "happy", "relaxed"]', '["cherry", "sweet", "earthy"]', 'Vanilla x Gorilla hybrid'),

('White Fire OG', 'Hybrid',
 'Community-sourced hybrid cultivar known for diesel and earthy terpenes.',
 20, 26, 0, 1, '["happy", "relaxed", "euphoric"]', '["diesel", "earthy", "pungent"]', 'White x OG hybrid'),

('WIFI OG', 'Hybrid',
 'Community-sourced hybrid cultivar known for tropical and sweet terpenes.',
 19, 22, 0, 1, '["sleepy", "relaxed", "hungry"]', '["tropical", "sweet", "fruity"]', 'WIFI x OG hybrid'),

('White Tahoe Cookies', 'Sativa',
 'Community-sourced sativa cultivar known for lemon and citrus terpenes.',
 17, 25, 0, 1, '["relaxed", "happy", "creative"]', '["lemon", "citrus", "sweet"]', 'White x Cookies hybrid'),

('White Cherry Gelato', 'Hybrid',
 'Community-sourced hybrid cultivar known for lemon and citrus terpenes.',
 19, 24, 0, 1, '["relaxed", "happy", "creative"]', '["lemon", "citrus", "sweet"]', 'White x Gelato hybrid'),

('White Gushers', 'Hybrid',
 'Community-sourced hybrid cultivar known for citrus and pine terpenes.',
 19, 23, 0, 1, '["relaxed", "happy", "creative"]', '["citrus", "pine", "earthy"]', 'White x Gushers hybrid'),

('White Rainbow', 'Hybrid',
 'Community-sourced hybrid cultivar known for mint and sweet terpenes.',
 18, 30, 0, 1, '["sleepy", "relaxed", "hungry"]', '["mint", "sweet", "cream"]', 'White x Rainbow hybrid'),

('White Rhino', 'Sativa',
 'Community-sourced sativa cultivar known for tropical and sweet terpenes.',
 15, 24, 0, 1, '["sleepy", "relaxed", "hungry"]', '["tropical", "sweet", "fruity"]', 'White x Rhino hybrid'),

('White Smurf', 'Hybrid',
 'Community-sourced hybrid cultivar known for mint and sweet terpenes.',
 20, 24, 0, 1, '["relaxed", "happy", "creative"]', '["mint", "sweet", "cream"]', 'White x Smurf hybrid'),

('White Walker OG Xj-13', 'Hybrid',
 'Community-sourced hybrid cultivar known for cherry and sweet terpenes.',
 17, 27, 0, 1, '["euphoric", "happy", "relaxed"]', '["cherry", "sweet", "earthy"]', 'White x Xj-13 hybrid'),

('Pure Kush', 'Hybrid',
 'Community-sourced hybrid cultivar known for mint and sweet terpenes.',
 17, 23, 0, 1, '["relaxed", "happy", "creative"]', '["mint", "sweet", "cream"]', 'Pure x Kush hybrid'),

('Pure Michigan', 'Hybrid',
 'Community-sourced hybrid cultivar known for lemon and citrus terpenes.',
 18, 22, 0, 1, '["energetic", "creative", "uplifted"]', '["lemon", "citrus", "sweet"]', 'Pure x Michigan hybrid'),

('Zkittlez OG', 'Sativa',
 'Community-sourced sativa cultivar known for mint and sweet terpenes.',
 16, 22, 0, 1, '["energetic", "creative", "uplifted"]', '["mint", "sweet", "cream"]', 'Zkittlez x OG hybrid'),

('Zkittlez Punch', 'Hybrid',
 'Community-sourced hybrid cultivar known for berry and sweet terpenes.',
 20, 22, 0, 1, '["euphoric", "happy", "relaxed"]', '["berry", "sweet", "grape"]', 'Zkittlez x Punch hybrid'),

('Abusive OG', 'Exotic',
 'Community-sourced exotic cultivar known for lemon and citrus terpenes.',
 23, 33, 0, 1, '["sleepy", "relaxed", "hungry"]', '["lemon", "citrus", "sweet"]', 'Abusive x OG hybrid'),

('Ace Of Spades', 'Sativa',
 'Community-sourced sativa cultivar known for mint and sweet terpenes.',
 19, 23, 0, 1, '["euphoric", "happy", "relaxed"]', '["mint", "sweet", "cream"]', 'Ace x Spades hybrid'),

('Afghani Bullrider Agent Tangie', 'Hybrid',
 'Community-sourced hybrid cultivar known for citrus and pine terpenes.',
 19, 26, 0, 1, '["energetic", "creative", "uplifted"]', '["citrus", "pine", "earthy"]', 'Afghani x Tangie hybrid'),

('Alaskan Ice', 'Sativa',
 'Community-sourced sativa cultivar known for cherry and sweet terpenes.',
 20, 23, 0, 1, '["relaxed", "happy", "creative"]', '["cherry", "sweet", "earthy"]', 'Alaskan x Ice hybrid'),

('Alien Abduction', 'Hybrid',
 'Community-sourced hybrid cultivar known for lemon and citrus terpenes.',
 17, 26, 0, 1, '["sleepy", "relaxed", "hungry"]', '["lemon", "citrus", "sweet"]', 'Alien x Abduction hybrid'),

('Alien Blues', 'Indica',
 'Community-sourced indica cultivar known for citrus and pine terpenes.',
 18, 27, 0, 1, '["energetic", "creative", "uplifted"]', '["citrus", "pine", "earthy"]', 'Alien x Blues hybrid'),

('Alien Breath', 'Indica',
 'Community-sourced indica cultivar known for lemon and citrus terpenes.',
 16, 27, 0, 1, '["energetic", "creative", "uplifted"]', '["lemon", "citrus", "sweet"]', 'Alien x Breath hybrid'),

('Alien Rock Candy', 'Sativa',
 'Community-sourced sativa cultivar known for mint and sweet terpenes.',
 20, 28, 0, 1, '["sleepy", "relaxed", "hungry"]', '["mint", "sweet", "cream"]', 'Alien x Candy hybrid'),

('Alien Technology', 'Exotic',
 'Community-sourced exotic cultivar known for berry and sweet terpenes.',
 20, 32, 0, 1, '["sleepy", "relaxed", "hungry"]', '["berry", "sweet", "grape"]', 'Alien x Technology hybrid'),

('Alien Dawg', 'Exotic',
 'Community-sourced exotic cultivar known for diesel and earthy terpenes.',
 21, 33, 0, 1, '["euphoric", "happy", "relaxed"]', '["diesel", "earthy", "pungent"]', 'Alien x Dawg hybrid'),

('Alien Kush', 'Sativa',
 'Community-sourced sativa cultivar known for diesel and earthy terpenes.',
 16, 28, 0, 1, '["energetic", "creative", "uplifted"]', '["diesel", "earthy", "pungent"]', 'Alien x Kush hybrid'),

('Amherst Sour Diesel Amnesia Bilbo', 'Hybrid',
 'Community-sourced hybrid cultivar known for mint and sweet terpenes.',
 17, 27, 0, 1, '["euphoric", "happy", "relaxed"]', '["mint", "sweet", "cream"]', 'Amherst x Bilbo hybrid'),

('Amnesia Fast', 'Hybrid',
 'Community-sourced hybrid cultivar known for tropical and sweet terpenes.',
 18, 23, 0, 1, '["happy", "relaxed", "euphoric"]', '["tropical", "sweet", "fruity"]', 'Amnesia x Fast hybrid'),

('Amnesia Lemon', 'Hybrid',
 'Community-sourced hybrid cultivar known for cherry and sweet terpenes.',
 20, 30, 0, 1, '["relaxed", "happy", "creative"]', '["cherry", "sweet", "earthy"]', 'Amnesia x Lemon hybrid'),

('Amsterdam Mist', 'Hybrid',
 'Community-sourced hybrid cultivar known for citrus and pine terpenes.',
 17, 24, 0, 1, '["sleepy", "relaxed", "hungry"]', '["citrus", "pine", "earthy"]', 'Amsterdam x Mist hybrid'),

('Apple MAC', 'Hybrid',
 'Community-sourced hybrid cultivar known for berry and sweet terpenes.',
 20, 30, 0, 1, '["sleepy", "relaxed", "hungry"]', '["berry", "sweet", "grape"]', 'Apple x MAC hybrid'),

('Apple Tartz', 'Hybrid',
 'Community-sourced hybrid cultivar known for sweet and earthy terpenes.',
 18, 24, 0, 1, '["relaxed", "happy", "creative"]', '["sweet", "earthy", "diesel"]', 'Apple x Tartz hybrid'),

('Apples And Bananas', 'Sativa',
 'Community-sourced sativa cultivar known for berry and sweet terpenes.',
 19, 23, 0, 1, '["sleepy", "relaxed", "hungry"]', '["berry", "sweet", "grape"]', 'Apples x Bananas hybrid'),

('Afternoon Delight Air Jordan OG', 'Indica',
 'Community-sourced indica cultivar known for tropical and sweet terpenes.',
 18, 23, 0, 1, '["sleepy", "relaxed", "hungry"]', '["tropical", "sweet", "fruity"]', 'Afternoon x OG hybrid'),

('Alaskan Thunder Grape', 'Sativa',
 'Community-sourced sativa cultivar known for tropical and sweet terpenes.',
 17, 23, 0, 1, '["euphoric", "happy", "relaxed"]', '["tropical", "sweet", "fruity"]', 'Alaskan x Grape hybrid'),

('Alien Cookies', 'Indica',
 'Community-sourced indica cultivar known for berry and sweet terpenes.',
 18, 21, 0, 1, '["euphoric", "happy", "relaxed"]', '["berry", "sweet", "grape"]', 'Alien x Cookies hybrid'),

('Alpine Star', 'Hybrid',
 'Community-sourced hybrid cultivar known for mint and sweet terpenes.',
 18, 24, 0, 1, '["euphoric", "happy", "relaxed"]', '["mint", "sweet", "cream"]', 'Alpine x Star hybrid'),

('American Beauty', 'Hybrid',
 'Community-sourced hybrid cultivar known for sweet and earthy terpenes.',
 17, 22, 0, 1, '["happy", "relaxed", "euphoric"]', '["sweet", "earthy", "diesel"]', 'American x Beauty hybrid'),

('American Pie', 'Exotic',
 'Community-sourced exotic cultivar known for cherry and sweet terpenes.',
 24, 32, 0, 1, '["energetic", "creative", "uplifted"]', '["cherry", "sweet", "earthy"]', 'American x Pie hybrid'),

('Apollo 11', 'Hybrid',
 'Community-sourced hybrid cultivar known for tropical and sweet terpenes.',
 17, 29, 0, 1, '["euphoric", "happy", "relaxed"]', '["tropical", "sweet", "fruity"]', 'Apollo x 11 hybrid'),

('Apollo 13', 'Exotic',
 'Community-sourced exotic cultivar known for cherry and sweet terpenes.',
 22, 35, 0, 1, '["energetic", "creative", "uplifted"]', '["cherry", "sweet", "earthy"]', 'Apollo x 13 hybrid'),

('Apollo Haze', 'Hybrid',
 'Community-sourced hybrid cultivar known for berry and sweet terpenes.',
 20, 23, 0, 1, '["happy", "relaxed", "euphoric"]', '["berry", "sweet", "grape"]', 'Apollo x Haze hybrid'),

('Apple Betty Apple Sundae', 'Hybrid',
 'Community-sourced hybrid cultivar known for diesel and earthy terpenes.',
 20, 29, 0, 1, '["relaxed", "happy", "creative"]', '["diesel", "earthy", "pungent"]', 'Apple x Sundae hybrid'),

('Asia Blue', 'Hybrid',
 'Community-sourced hybrid cultivar known for mint and sweet terpenes.',
 18, 27, 0, 1, '["sleepy", "relaxed", "hungry"]', '["mint", "sweet", "cream"]', 'Asia x Blue hybrid'),

('Asian Fantasy', 'Hybrid',
 'Community-sourced hybrid cultivar known for citrus and pine terpenes.',
 18, 27, 0, 1, '["euphoric", "happy", "relaxed"]', '["citrus", "pine", "earthy"]', 'Asian x Fantasy hybrid'),

('Atomic Bomb', 'Hybrid',
 'Community-sourced hybrid cultivar known for tropical and sweet terpenes.',
 18, 29, 0, 1, '["happy", "relaxed", "euphoric"]', '["tropical", "sweet", "fruity"]', 'Atomic x Bomb hybrid'),

('Atomic Northern Lights', 'Hybrid',
 'Community-sourced hybrid cultivar known for sweet and earthy terpenes.',
 18, 24, 0, 1, '["happy", "relaxed", "euphoric"]', '["sweet", "earthy", "diesel"]', 'Atomic x Lights hybrid'),

('Aurora Borealis', 'Hybrid',
 'Community-sourced hybrid cultivar known for berry and sweet terpenes.',
 20, 28, 0, 1, '["energetic", "creative", "uplifted"]', '["berry", "sweet", "grape"]', 'Aurora x Borealis hybrid'),

('Aurora Indica', 'Hybrid',
 'Community-sourced hybrid cultivar known for lemon and citrus terpenes.',
 19, 25, 0, 1, '["energetic", "creative", "uplifted"]', '["lemon", "citrus", "sweet"]', 'Aurora x Indica hybrid'),

('Aussie Blue', 'Hybrid',
 'Community-sourced hybrid cultivar known for lemon and citrus terpenes.',
 20, 29, 0, 1, '["sleepy", "relaxed", "hungry"]', '["lemon", "citrus", "sweet"]', 'Aussie x Blue hybrid'),

('Baby Yoda', 'Sativa',
 'Community-sourced sativa cultivar known for lemon and citrus terpenes.',
 15, 25, 0, 1, '["euphoric", "happy", "relaxed"]', '["lemon", "citrus", "sweet"]', 'Baby x Yoda hybrid'),

('Bahama Mama Bahama Breeze', 'Indica',
 'Community-sourced indica cultivar known for sweet and earthy terpenes.',
 17, 25, 0, 1, '["happy", "relaxed", "euphoric"]', '["sweet", "earthy", "diesel"]', 'Bahama x Breeze hybrid'),

('Baker''s Dozen', 'Hybrid',
 'Community-sourced hybrid cultivar known for sweet and earthy terpenes.',
 20, 29, 0, 1, '["sleepy", "relaxed", "hungry"]', '["sweet", "earthy", "diesel"]', 'Baker''s x Dozen hybrid'),

('Bali Kush', 'Sativa',
 'Community-sourced sativa cultivar known for mint and sweet terpenes.',
 18, 23, 0, 1, '["sleepy", "relaxed", "hungry"]', '["mint", "sweet", "cream"]', 'Bali x Kush hybrid'),

('Banana Berry', 'Hybrid',
 'Community-sourced hybrid cultivar known for sweet and earthy terpenes.',
 19, 22, 0, 1, '["relaxed", "happy", "creative"]', '["sweet", "earthy", "diesel"]', 'Banana x Berry hybrid'),

('Banana Bread', 'Hybrid',
 'Community-sourced hybrid cultivar known for tropical and sweet terpenes.',
 18, 27, 0, 1, '["euphoric", "happy", "relaxed"]', '["tropical", "sweet", "fruity"]', 'Banana x Bread hybrid'),

('Banana Candy', 'Sativa',
 'Community-sourced sativa cultivar known for tropical and sweet terpenes.',
 18, 26, 0, 1, '["relaxed", "happy", "creative"]', '["tropical", "sweet", "fruity"]', 'Banana x Candy hybrid'),

('Banana Cream OG', 'Hybrid',
 'Community-sourced hybrid cultivar known for cherry and sweet terpenes.',
 17, 24, 0, 1, '["happy", "relaxed", "euphoric"]', '["cherry", "sweet", "earthy"]', 'Banana x OG hybrid'),

('Banana Daddy', 'Hybrid',
 'Community-sourced hybrid cultivar known for berry and sweet terpenes.',
 19, 30, 0, 1, '["sleepy", "relaxed", "hungry"]', '["berry", "sweet", "grape"]', 'Banana x Daddy hybrid'),

('Banana Diesel', 'Indica',
 'Community-sourced indica cultivar known for sweet and earthy terpenes.',
 19, 20, 0, 1, '["happy", "relaxed", "euphoric"]', '["sweet", "earthy", "diesel"]', 'Banana x Diesel hybrid'),

('Banana Gelato Banana Grape', 'Indica',
 'Community-sourced indica cultivar known for lemon and citrus terpenes.',
 18, 27, 0, 1, '["euphoric", "happy", "relaxed"]', '["lemon", "citrus", "sweet"]', 'Banana x Grape hybrid'),

('Banana Haze', 'Indica',
 'Community-sourced indica cultivar known for mint and sweet terpenes.',
 17, 25, 0, 1, '["euphoric", "happy", "relaxed"]', '["mint", "sweet", "cream"]', 'Banana x Haze hybrid'),

('Banana Mango', 'Indica',
 'Community-sourced indica cultivar known for mint and sweet terpenes.',
 19, 24, 0, 1, '["euphoric", "happy", "relaxed"]', '["mint", "sweet", "cream"]', 'Banana x Mango hybrid'),

('Banana Mimosa', 'Hybrid',
 'Community-sourced hybrid cultivar known for sweet and earthy terpenes.',
 20, 26, 0, 1, '["relaxed", "happy", "creative"]', '["sweet", "earthy", "diesel"]', 'Banana x Mimosa hybrid'),

('Banana Peel', 'Hybrid',
 'Community-sourced hybrid cultivar known for tropical and sweet terpenes.',
 19, 23, 0, 1, '["relaxed", "happy", "creative"]', '["tropical", "sweet", "fruity"]', 'Banana x Peel hybrid'),

('Banana Puddin', 'Exotic',
 'Community-sourced exotic cultivar known for diesel and earthy terpenes.',
 20, 35, 0, 1, '["sleepy", "relaxed", "hungry"]', '["diesel", "earthy", "pungent"]', 'Banana x Puddin hybrid'),

('Banana Runtz', 'Exotic',
 'Community-sourced exotic cultivar known for cherry and sweet terpenes.',
 20, 35, 0, 1, '["energetic", "creative", "uplifted"]', '["cherry", "sweet", "earthy"]', 'Banana x Runtz hybrid'),

('Banana Wreck', 'Indica',
 'Community-sourced indica cultivar known for citrus and pine terpenes.',
 17, 20, 0, 1, '["euphoric", "happy", "relaxed"]', '["citrus", "pine", "earthy"]', 'Banana x Wreck hybrid'),

('Bandana Berry', 'Indica',
 'Community-sourced indica cultivar known for cherry and sweet terpenes.',
 16, 27, 0, 1, '["sleepy", "relaxed", "hungry"]', '["cherry", "sweet", "earthy"]', 'Bandana x Berry hybrid'),

('Barnes OG Bay 11', 'Indica',
 'Community-sourced indica cultivar known for lemon and citrus terpenes.',
 19, 23, 0, 1, '["relaxed", "happy", "creative"]', '["lemon", "citrus", "sweet"]', 'Barnes x 11 hybrid'),

('Bay Dream', 'Exotic',
 'Community-sourced exotic cultivar known for diesel and earthy terpenes.',
 20, 30, 0, 1, '["euphoric", "happy", "relaxed"]', '["diesel", "earthy", "pungent"]', 'Bay x Dream hybrid'),

('Beach Grapes', 'Hybrid',
 'Community-sourced hybrid cultivar known for cherry and sweet terpenes.',
 19, 29, 0, 1, '["euphoric", "happy", "relaxed"]', '["cherry", "sweet", "earthy"]', 'Beach x Grapes hybrid'),

('Beach Wedding', 'Hybrid',
 'Community-sourced hybrid cultivar known for mint and sweet terpenes.',
 18, 29, 0, 1, '["euphoric", "happy", "relaxed"]', '["mint", "sweet", "cream"]', 'Beach x Wedding hybrid'),

('Belgian Waffle', 'Hybrid',
 'Community-sourced hybrid cultivar known for lemon and citrus terpenes.',
 19, 26, 0, 1, '["euphoric", "happy", "relaxed"]', '["lemon", "citrus", "sweet"]', 'Belgian x Waffle hybrid'),

('Berry Bonds', 'Indica',
 'Community-sourced indica cultivar known for tropical and sweet terpenes.',
 17, 24, 0, 1, '["euphoric", "happy", "relaxed"]', '["tropical", "sweet", "fruity"]', 'Berry x Bonds hybrid'),

('Berry Gelato', 'Indica',
 'Community-sourced indica cultivar known for lemon and citrus terpenes.',
 18, 24, 0, 1, '["energetic", "creative", "uplifted"]', '["lemon", "citrus", "sweet"]', 'Berry x Gelato hybrid'),

('Big Bang', 'Hybrid',
 'Community-sourced hybrid cultivar known for tropical and sweet terpenes.',
 20, 27, 0, 1, '["euphoric", "happy", "relaxed"]', '["tropical", "sweet", "fruity"]', 'Big x Bang hybrid'),

('Big Blue Big Buddha Cheese', 'Hybrid',
 'Community-sourced hybrid cultivar known for cherry and sweet terpenes.',
 17, 30, 0, 1, '["relaxed", "happy", "creative"]', '["cherry", "sweet", "earthy"]', 'Big x Cheese hybrid'),

('Big Smooth', 'Hybrid',
 'Community-sourced hybrid cultivar known for tropical and sweet terpenes.',
 18, 26, 0, 1, '["happy", "relaxed", "euphoric"]', '["tropical", "sweet", "fruity"]', 'Big x Smooth hybrid'),

('Big Sur Holy Weed', 'Exotic',
 'Community-sourced exotic cultivar known for tropical and sweet terpenes.',
 20, 33, 0, 1, '["relaxed", "happy", "creative"]', '["tropical", "sweet", "fruity"]', 'Big x Weed hybrid'),

('Biker Kush', 'Exotic',
 'Community-sourced exotic cultivar known for tropical and sweet terpenes.',
 23, 31, 0, 1, '["energetic", "creative", "uplifted"]', '["tropical", "sweet", "fruity"]', 'Biker x Kush hybrid'),

('Bio Jesus', 'Hybrid',
 'Community-sourced hybrid cultivar known for diesel and earthy terpenes.',
 19, 24, 0, 1, '["happy", "relaxed", "euphoric"]', '["diesel", "earthy", "pungent"]', 'Bio x Jesus hybrid'),

('Bio Diesel', 'Indica',
 'Community-sourced indica cultivar known for sweet and earthy terpenes.',
 16, 23, 0, 1, '["energetic", "creative", "uplifted"]', '["sweet", "earthy", "diesel"]', 'Bio x Diesel hybrid'),

('Birthday Cake', 'Sativa',
 'Community-sourced sativa cultivar known for citrus and pine terpenes.',
 18, 24, 0, 1, '["relaxed", "happy", "creative"]', '["citrus", "pine", "earthy"]', 'Birthday x Cake hybrid'),

('Birthday Cake Kush', 'Exotic',
 'Community-sourced exotic cultivar known for berry and sweet terpenes.',
 21, 28, 0, 1, '["euphoric", "happy", "relaxed"]', '["berry", "sweet", "grape"]', 'Birthday x Kush hybrid'),

('Biscotti Pie', 'Hybrid',
 'Community-sourced hybrid cultivar known for tropical and sweet terpenes.',
 20, 29, 0, 1, '["energetic", "creative", "uplifted"]', '["tropical", "sweet", "fruity"]', 'Biscotti x Pie hybrid'),

('Biscotti Mintz Bitch Slap', 'Hybrid',
 'Community-sourced hybrid cultivar known for diesel and earthy terpenes.',
 19, 22, 0, 1, '["happy", "relaxed", "euphoric"]', '["diesel", "earthy", "pungent"]', 'Biscotti x Slap hybrid'),

('Black Afghan', 'Hybrid',
 'Community-sourced hybrid cultivar known for berry and sweet terpenes.',
 17, 24, 0, 1, '["relaxed", "happy", "creative"]', '["berry", "sweet", "grape"]', 'Black x Afghan hybrid'),

('Black Amber', 'Sativa',
 'Community-sourced sativa cultivar known for berry and sweet terpenes.',
 18, 28, 0, 1, '["relaxed", "happy", "creative"]', '["berry", "sweet", "grape"]', 'Black x Amber hybrid'),

('Black Banana', 'Exotic',
 'Community-sourced exotic cultivar known for tropical and sweet terpenes.',
 22, 28, 0, 1, '["happy", "relaxed", "euphoric"]', '["tropical", "sweet", "fruity"]', 'Black x Banana hybrid'),

('Black Cherry Punch', 'Hybrid',
 'Community-sourced hybrid cultivar known for lemon and citrus terpenes.',
 17, 27, 0, 1, '["sleepy", "relaxed", "hungry"]', '["lemon", "citrus", "sweet"]', 'Black x Punch hybrid'),

('Black Cherry Soda', 'Exotic',
 'Community-sourced exotic cultivar known for lemon and citrus terpenes.',
 24, 35, 0, 1, '["energetic", "creative", "uplifted"]', '["lemon", "citrus", "sweet"]', 'Black x Soda hybrid'),

('Black Diamond OG', 'Hybrid',
 'Community-sourced hybrid cultivar known for berry and sweet terpenes.',
 18, 23, 0, 1, '["sleepy", "relaxed", "hungry"]', '["berry", "sweet", "grape"]', 'Black x OG hybrid'),

('Black Fire', 'Exotic',
 'Community-sourced exotic cultivar known for sweet and earthy terpenes.',
 23, 32, 0, 1, '["energetic", "creative", "uplifted"]', '["sweet", "earthy", "diesel"]', 'Black x Fire hybrid'),

('Black Haze', 'Exotic',
 'Community-sourced exotic cultivar known for diesel and earthy terpenes.',
 22, 32, 0, 1, '["euphoric", "happy", "relaxed"]', '["diesel", "earthy", "pungent"]', 'Black x Haze hybrid'),

('Black Ice Black Label Kush', 'Indica',
 'Community-sourced indica cultivar known for mint and sweet terpenes.',
 19, 26, 0, 1, '["euphoric", "happy", "relaxed"]', '["mint", "sweet", "cream"]', 'Black x Kush hybrid'),

('Black Licorice', 'Sativa',
 'Community-sourced sativa cultivar known for berry and sweet terpenes.',
 18, 27, 0, 1, '["happy", "relaxed", "euphoric"]', '["berry", "sweet", "grape"]', 'Black x Licorice hybrid'),

('Black Lime', 'Indica',
 'Community-sourced indica cultivar known for sweet and earthy terpenes.',
 19, 25, 0, 1, '["energetic", "creative", "uplifted"]', '["sweet", "earthy", "diesel"]', 'Black x Lime hybrid'),

('Black Magic', 'Hybrid',
 'Community-sourced hybrid cultivar known for tropical and sweet terpenes.',
 20, 25, 0, 1, '["relaxed", "happy", "creative"]', '["tropical", "sweet", "fruity"]', 'Black x Magic hybrid'),

('Black Maple', 'Hybrid',
 'Community-sourced hybrid cultivar known for mint and sweet terpenes.',
 19, 22, 0, 1, '["sleepy", "relaxed", "hungry"]', '["mint", "sweet", "cream"]', 'Black x Maple hybrid'),

('Black Russian', 'Exotic',
 'Community-sourced exotic cultivar known for lemon and citrus terpenes.',
 21, 28, 0, 1, '["happy", "relaxed", "euphoric"]', '["lemon", "citrus", "sweet"]', 'Black x Russian hybrid'),

('Black Triangle', 'Hybrid',
 'Community-sourced hybrid cultivar known for tropical and sweet terpenes.',
 18, 28, 0, 1, '["euphoric", "happy", "relaxed"]', '["tropical", "sweet", "fruity"]', 'Black x Triangle hybrid'),

('Black Velvet', 'Exotic',
 'Community-sourced exotic cultivar known for diesel and earthy terpenes.',
 20, 32, 0, 1, '["sleepy", "relaxed", "hungry"]', '["diesel", "earthy", "pungent"]', 'Black x Velvet hybrid'),

('Blackberry Cobbler', 'Indica',
 'Community-sourced indica cultivar known for lemon and citrus terpenes.',
 17, 27, 0, 1, '["energetic", "creative", "uplifted"]', '["lemon", "citrus", "sweet"]', 'Blackberry x Cobbler hybrid'),

('Blackberry Dream Blackberry Fire', 'Exotic',
 'Community-sourced exotic cultivar known for lemon and citrus terpenes.',
 24, 33, 0, 1, '["relaxed", "happy", "creative"]', '["lemon", "citrus", "sweet"]', 'Blackberry x Fire hybrid'),

('Blackberry Haze', 'Hybrid',
 'Community-sourced hybrid cultivar known for citrus and pine terpenes.',
 18, 25, 0, 1, '["euphoric", "happy", "relaxed"]', '["citrus", "pine", "earthy"]', 'Blackberry x Haze hybrid'),

('Blackberry Pie', 'Hybrid',
 'Community-sourced hybrid cultivar known for citrus and pine terpenes.',
 20, 30, 0, 1, '["sleepy", "relaxed", "hungry"]', '["citrus", "pine", "earthy"]', 'Blackberry x Pie hybrid'),

('Blackberry Rhino', 'Hybrid',
 'Community-sourced hybrid cultivar known for diesel and earthy terpenes.',
 17, 22, 0, 1, '["euphoric", "happy", "relaxed"]', '["diesel", "earthy", "pungent"]', 'Blackberry x Rhino hybrid'),

('Blanco Berry', 'Hybrid',
 'Community-sourced hybrid cultivar known for lemon and citrus terpenes.',
 18, 24, 0, 1, '["sleepy", "relaxed", "hungry"]', '["lemon", "citrus", "sweet"]', 'Blanco x Berry hybrid'),

('Blood Walker', 'Sativa',
 'Community-sourced sativa cultivar known for lemon and citrus terpenes.',
 20, 23, 0, 1, '["euphoric", "happy", "relaxed"]', '["lemon", "citrus", "sweet"]', 'Blood x Walker hybrid'),

('Bloody Skunk', 'Sativa',
 'Community-sourced sativa cultivar known for lemon and citrus terpenes.',
 19, 25, 0, 1, '["happy", "relaxed", "euphoric"]', '["lemon", "citrus", "sweet"]', 'Bloody x Skunk hybrid'),

('Blue Amnesia', 'Indica',
 'Community-sourced indica cultivar known for sweet and earthy terpenes.',
 19, 27, 0, 1, '["euphoric", "happy", "relaxed"]', '["sweet", "earthy", "diesel"]', 'Blue x Amnesia hybrid'),

('Blue Bastard', 'Hybrid',
 'Community-sourced hybrid cultivar known for cherry and sweet terpenes.',
 20, 26, 0, 1, '["happy", "relaxed", "euphoric"]', '["cherry", "sweet", "earthy"]', 'Blue x Bastard hybrid'),

('Blue Blood Blue Chem', 'Hybrid',
 'Community-sourced hybrid cultivar known for citrus and pine terpenes.',
 17, 25, 0, 1, '["euphoric", "happy", "relaxed"]', '["citrus", "pine", "earthy"]', 'Blue x Chem hybrid'),

('Blue City Diesel', 'Sativa',
 'Community-sourced sativa cultivar known for sweet and earthy terpenes.',
 18, 24, 0, 1, '["happy", "relaxed", "euphoric"]', '["sweet", "earthy", "diesel"]', 'Blue x Diesel hybrid'),

('Blue Coma', 'Sativa',
 'Community-sourced sativa cultivar known for cherry and sweet terpenes.',
 18, 22, 0, 1, '["sleepy", "relaxed", "hungry"]', '["cherry", "sweet", "earthy"]', 'Blue x Coma hybrid'),

('Blue Dragon', 'Indica',
 'Community-sourced indica cultivar known for cherry and sweet terpenes.',
 17, 26, 0, 1, '["sleepy", "relaxed", "hungry"]', '["cherry", "sweet", "earthy"]', 'Blue x Dragon hybrid'),

('Blue Dynamite', 'Hybrid',
 'Community-sourced hybrid cultivar known for berry and sweet terpenes.',
 20, 28, 0, 1, '["happy", "relaxed", "euphoric"]', '["berry", "sweet", "grape"]', 'Blue x Dynamite hybrid'),

('Blue Fire', 'Exotic',
 'Community-sourced exotic cultivar known for cherry and sweet terpenes.',
 22, 29, 0, 1, '["energetic", "creative", "uplifted"]', '["cherry", "sweet", "earthy"]', 'Blue x Fire hybrid'),

('Blue Frost', 'Hybrid',
 'Community-sourced hybrid cultivar known for sweet and earthy terpenes.',
 18, 25, 0, 1, '["happy", "relaxed", "euphoric"]', '["sweet", "earthy", "diesel"]', 'Blue x Frost hybrid'),

('Blue Galaxy', 'Hybrid',
 'Community-sourced hybrid cultivar known for cherry and sweet terpenes.',
 20, 30, 0, 1, '["relaxed", "happy", "creative"]', '["cherry", "sweet", "earthy"]', 'Blue x Galaxy hybrid'),

('Blue Glue', 'Indica',
 'Community-sourced indica cultivar known for berry and sweet terpenes.',
 17, 27, 0, 1, '["sleepy", "relaxed", "hungry"]', '["berry", "sweet", "grape"]', 'Blue x Glue hybrid'),

('Blue Goo Blue Heaven', 'Hybrid',
 'Community-sourced hybrid cultivar known for cherry and sweet terpenes.',
 18, 23, 0, 1, '["happy", "relaxed", "euphoric"]', '["cherry", "sweet", "earthy"]', 'Blue x Heaven hybrid'),

('Blue Heron', 'Hybrid',
 'Community-sourced hybrid cultivar known for citrus and pine terpenes.',
 17, 25, 0, 1, '["energetic", "creative", "uplifted"]', '["citrus", "pine", "earthy"]', 'Blue x Heron hybrid'),

('Blue Ivy', 'Sativa',
 'Community-sourced sativa cultivar known for sweet and earthy terpenes.',
 19, 22, 0, 1, '["relaxed", "happy", "creative"]', '["sweet", "earthy", "diesel"]', 'Blue x Ivy hybrid'),

('Blue Lights', 'Indica',
 'Community-sourced indica cultivar known for diesel and earthy terpenes.',
 16, 26, 0, 1, '["relaxed", "happy", "creative"]', '["diesel", "earthy", "pungent"]', 'Blue x Lights hybrid'),

('Blue Magic', 'Hybrid',
 'Community-sourced hybrid cultivar known for tropical and sweet terpenes.',
 18, 22, 0, 1, '["energetic", "creative", "uplifted"]', '["tropical", "sweet", "fruity"]', 'Blue x Magic hybrid'),

('Blue Monster', 'Indica',
 'Community-sourced indica cultivar known for tropical and sweet terpenes.',
 18, 25, 0, 1, '["energetic", "creative", "uplifted"]', '["tropical", "sweet", "fruity"]', 'Blue x Monster hybrid'),

('Blue Moonshine', 'Indica',
 'Community-sourced indica cultivar known for tropical and sweet terpenes.',
 17, 26, 0, 1, '["sleepy", "relaxed", "hungry"]', '["tropical", "sweet", "fruity"]', 'Blue x Moonshine hybrid'),

('Blue Nebula', 'Sativa',
 'Community-sourced sativa cultivar known for cherry and sweet terpenes.',
 19, 26, 0, 1, '["energetic", "creative", "uplifted"]', '["cherry", "sweet", "earthy"]', 'Blue x Nebula hybrid'),

('Blue Nightmare', 'Hybrid',
 'Community-sourced hybrid cultivar known for cherry and sweet terpenes.',
 20, 22, 0, 1, '["sleepy", "relaxed", "hungry"]', '["cherry", "sweet", "earthy"]', 'Blue x Nightmare hybrid'),

('Blue Ox Blue Pearl', 'Hybrid',
 'Community-sourced hybrid cultivar known for berry and sweet terpenes.',
 19, 28, 0, 1, '["relaxed", "happy", "creative"]', '["berry", "sweet", "grape"]', 'Blue x Pearl hybrid'),

('Blue Power', 'Hybrid',
 'Community-sourced hybrid cultivar known for lemon and citrus terpenes.',
 20, 24, 0, 1, '["euphoric", "happy", "relaxed"]', '["lemon", "citrus", "sweet"]', 'Blue x Power hybrid'),

('Blue Shark', 'Indica',
 'Community-sourced indica cultivar known for lemon and citrus terpenes.',
 17, 24, 0, 1, '["energetic", "creative", "uplifted"]', '["lemon", "citrus", "sweet"]', 'Blue x Shark hybrid'),

('Blue Sherbert', 'Sativa',
 'Community-sourced sativa cultivar known for berry and sweet terpenes.',
 19, 25, 0, 1, '["relaxed", "happy", "creative"]', '["berry", "sweet", "grape"]', 'Blue x Sherbert hybrid'),

('Blue Steel', 'Hybrid',
 'Community-sourced hybrid cultivar known for mint and sweet terpenes.',
 18, 26, 0, 1, '["energetic", "creative", "uplifted"]', '["mint", "sweet", "cream"]', 'Blue x Steel hybrid'),

('Blue Sunset', 'Exotic',
 'Community-sourced exotic cultivar known for citrus and pine terpenes.',
 20, 35, 0, 1, '["sleepy", "relaxed", "hungry"]', '["citrus", "pine", "earthy"]', 'Blue x Sunset hybrid'),

('Blue Thai', 'Hybrid',
 'Community-sourced hybrid cultivar known for cherry and sweet terpenes.',
 18, 22, 0, 1, '["sleepy", "relaxed", "hungry"]', '["cherry", "sweet", "earthy"]', 'Blue x Thai hybrid'),

('Blue Thunder', 'Exotic',
 'Community-sourced exotic cultivar known for diesel and earthy terpenes.',
 24, 28, 0, 1, '["happy", "relaxed", "euphoric"]', '["diesel", "earthy", "pungent"]', 'Blue x Thunder hybrid'),

('Blue Waffle', 'Hybrid',
 'Community-sourced hybrid cultivar known for mint and sweet terpenes.',
 18, 29, 0, 1, '["energetic", "creative", "uplifted"]', '["mint", "sweet", "cream"]', 'Blue x Waffle hybrid'),

('Blueberry Blast Blueberry Cheesecake', 'Hybrid',
 'Community-sourced hybrid cultivar known for citrus and pine terpenes.',
 17, 25, 0, 1, '["energetic", "creative", "uplifted"]', '["citrus", "pine", "earthy"]', 'Blueberry x Cheesecake hybrid'),

('Blueberry Clementine', 'Exotic',
 'Community-sourced exotic cultivar known for diesel and earthy terpenes.',
 23, 31, 0, 1, '["euphoric", "happy", "relaxed"]', '["diesel", "earthy", "pungent"]', 'Blueberry x Clementine hybrid'),

('Blueberry Cruffin', 'Hybrid',
 'Community-sourced hybrid cultivar known for tropical and sweet terpenes.',
 18, 30, 0, 1, '["sleepy", "relaxed", "hungry"]', '["tropical", "sweet", "fruity"]', 'Blueberry x Cruffin hybrid'),

('Blueberry Frost', 'Hybrid',
 'Community-sourced hybrid cultivar known for tropical and sweet terpenes.',
 20, 30, 0, 1, '["sleepy", "relaxed", "hungry"]', '["tropical", "sweet", "fruity"]', 'Blueberry x Frost hybrid'),

('Blueberry Headband', 'Hybrid',
 'Community-sourced hybrid cultivar known for lemon and citrus terpenes.',
 19, 30, 0, 1, '["relaxed", "happy", "creative"]', '["lemon", "citrus", "sweet"]', 'Blueberry x Headband hybrid'),

('Blueberry Hill', 'Sativa',
 'Community-sourced sativa cultivar known for diesel and earthy terpenes.',
 20, 25, 0, 1, '["sleepy", "relaxed", "hungry"]', '["diesel", "earthy", "pungent"]', 'Blueberry x Hill hybrid'),

('Blueberry Lemonade', 'Hybrid',
 'Community-sourced hybrid cultivar known for diesel and earthy terpenes.',
 19, 28, 0, 1, '["happy", "relaxed", "euphoric"]', '["diesel", "earthy", "pungent"]', 'Blueberry x Lemonade hybrid'),

('Blueberry Pancakes', 'Exotic',
 'Community-sourced exotic cultivar known for cherry and sweet terpenes.',
 21, 28, 0, 1, '["sleepy", "relaxed", "hungry"]', '["cherry", "sweet", "earthy"]', 'Blueberry x Pancakes hybrid'),

('Blueberry Silvertip', 'Hybrid',
 'Community-sourced hybrid cultivar known for diesel and earthy terpenes.',
 18, 25, 0, 1, '["sleepy", "relaxed", "hungry"]', '["diesel", "earthy", "pungent"]', 'Blueberry x Silvertip hybrid'),

('Blueberry Skunk Blueberry Yum Yum', 'Hybrid',
 'Community-sourced hybrid cultivar known for mint and sweet terpenes.',
 18, 29, 0, 1, '["euphoric", "happy", "relaxed"]', '["mint", "sweet", "cream"]', 'Blueberry x Yum hybrid'),

('Blurple Berry', 'Hybrid',
 'Community-sourced hybrid cultivar known for berry and sweet terpenes.',
 20, 29, 0, 1, '["relaxed", "happy", "creative"]', '["berry", "sweet", "grape"]', 'Blurple x Berry hybrid'),

('Bob Saget', 'Exotic',
 'Community-sourced exotic cultivar known for lemon and citrus terpenes.',
 22, 30, 0, 1, '["energetic", "creative", "uplifted"]', '["lemon", "citrus", "sweet"]', 'Bob x Saget hybrid'),

('Bobby Brown', 'Indica',
 'Community-sourced indica cultivar known for sweet and earthy terpenes.',
 16, 20, 0, 1, '["happy", "relaxed", "euphoric"]', '["sweet", "earthy", "diesel"]', 'Bobby x Brown hybrid'),

('Body Bag', 'Sativa',
 'Community-sourced sativa cultivar known for citrus and pine terpenes.',
 18, 23, 0, 1, '["energetic", "creative", "uplifted"]', '["citrus", "pine", "earthy"]', 'Body x Bag hybrid'),

('Bomb Pop', 'Exotic',
 'Community-sourced exotic cultivar known for lemon and citrus terpenes.',
 21, 28, 0, 1, '["energetic", "creative", "uplifted"]', '["lemon", "citrus", "sweet"]', 'Bomb x Pop hybrid'),

('Bone Collector', 'Hybrid',
 'Community-sourced hybrid cultivar known for sweet and earthy terpenes.',
 17, 29, 0, 1, '["relaxed", "happy", "creative"]', '["sweet", "earthy", "diesel"]', 'Bone x Collector hybrid'),

('Boogie Board Boonta Berry', 'Sativa',
 'Community-sourced sativa cultivar known for sweet and earthy terpenes.',
 19, 26, 0, 1, '["relaxed", "happy", "creative"]', '["sweet", "earthy", "diesel"]', 'Boogie x Berry hybrid'),

('Boss OG', 'Sativa',
 'Community-sourced sativa cultivar known for tropical and sweet terpenes.',
 19, 27, 0, 1, '["sleepy", "relaxed", "hungry"]', '["tropical", "sweet", "fruity"]', 'Boss x OG hybrid'),

('Brain Damage', 'Sativa',
 'Community-sourced sativa cultivar known for berry and sweet terpenes.',
 19, 28, 0, 1, '["relaxed", "happy", "creative"]', '["berry", "sweet", "grape"]', 'Brain x Damage hybrid'),

('Brain Killer', 'Sativa',
 'Community-sourced sativa cultivar known for diesel and earthy terpenes.',
 15, 26, 0, 1, '["energetic", "creative", "uplifted"]', '["diesel", "earthy", "pungent"]', 'Brain x Killer hybrid'),

('Brain OG', 'Indica',
 'Community-sourced indica cultivar known for cherry and sweet terpenes.',
 18, 25, 0, 1, '["sleepy", "relaxed", "hungry"]', '["cherry", "sweet", "earthy"]', 'Brain x OG hybrid'),

('Brand X', 'Sativa',
 'Community-sourced sativa cultivar known for diesel and earthy terpenes.',
 17, 25, 0, 1, '["relaxed", "happy", "creative"]', '["diesel", "earthy", "pungent"]', 'Brand x X hybrid'),

('Brazil Amazonia', 'Exotic',
 'Community-sourced exotic cultivar known for sweet and earthy terpenes.',
 21, 32, 0, 1, '["happy", "relaxed", "euphoric"]', '["sweet", "earthy", "diesel"]', 'Brazil x Amazonia hybrid'),

('Bridezilla Bright Fire', 'Sativa',
 'Community-sourced sativa cultivar known for lemon and citrus terpenes.',
 18, 25, 0, 1, '["relaxed", "happy", "creative"]', '["lemon", "citrus", "sweet"]', 'Bridezilla x Fire hybrid'),

('Bright Moments', 'Sativa',
 'Community-sourced sativa cultivar known for citrus and pine terpenes.',
 20, 22, 0, 1, '["energetic", "creative", "uplifted"]', '["citrus", "pine", "earthy"]', 'Bright x Moments hybrid'),

('Bruce Banner 2', 'Hybrid',
 'Community-sourced hybrid cultivar known for citrus and pine terpenes.',
 20, 27, 0, 1, '["euphoric", "happy", "relaxed"]', '["citrus", "pine", "earthy"]', 'Bruce x 2 hybrid'),

('Bruce Banner 3', 'Hybrid',
 'Community-sourced hybrid cultivar known for lemon and citrus terpenes.',
 17, 25, 0, 1, '["energetic", "creative", "uplifted"]', '["lemon", "citrus", "sweet"]', 'Bruce x 3 hybrid'),

('Bubble Berry', 'Hybrid',
 'Community-sourced hybrid cultivar known for sweet and earthy terpenes.',
 17, 23, 0, 1, '["sleepy", "relaxed", "hungry"]', '["sweet", "earthy", "diesel"]', 'Bubble x Berry hybrid'),

('Bubble Bomb', 'Indica',
 'Community-sourced indica cultivar known for berry and sweet terpenes.',
 18, 20, 0, 1, '["energetic", "creative", "uplifted"]', '["berry", "sweet", "grape"]', 'Bubble x Bomb hybrid'),

('Bubble Butt', 'Exotic',
 'Community-sourced exotic cultivar known for berry and sweet terpenes.',
 23, 29, 0, 1, '["sleepy", "relaxed", "hungry"]', '["berry", "sweet", "grape"]', 'Bubble x Butt hybrid'),

('Bubble Guts', 'Hybrid',
 'Community-sourced hybrid cultivar known for mint and sweet terpenes.',
 18, 28, 0, 1, '["euphoric", "happy", "relaxed"]', '["mint", "sweet", "cream"]', 'Bubble x Guts hybrid'),

('Bubble Gum Breath Bubble Gum Diesel', 'Hybrid',
 'Community-sourced hybrid cultivar known for mint and sweet terpenes.',
 18, 23, 0, 1, '["euphoric", "happy", "relaxed"]', '["mint", "sweet", "cream"]', 'Bubble x Diesel hybrid'),

('Bubble Gum Kush', 'Sativa',
 'Community-sourced sativa cultivar known for citrus and pine terpenes.',
 15, 25, 0, 1, '["energetic", "creative", "uplifted"]', '["citrus", "pine", "earthy"]', 'Bubble x Kush hybrid'),

('Bubble Gum OG', 'Hybrid',
 'Community-sourced hybrid cultivar known for tropical and sweet terpenes.',
 20, 27, 0, 1, '["happy", "relaxed", "euphoric"]', '["tropical", "sweet", "fruity"]', 'Bubble x OG hybrid'),

('Bubble Jack', 'Hybrid',
 'Community-sourced hybrid cultivar known for cherry and sweet terpenes.',
 20, 25, 0, 1, '["sleepy", "relaxed", "hungry"]', '["cherry", "sweet", "earthy"]', 'Bubble x Jack hybrid'),

('Bubble Kush', 'Hybrid',
 'Community-sourced hybrid cultivar known for tropical and sweet terpenes.',
 18, 28, 0, 1, '["happy", "relaxed", "euphoric"]', '["tropical", "sweet", "fruity"]', 'Bubble x Kush hybrid'),

('Bubble Yum', 'Indica',
 'Community-sourced indica cultivar known for berry and sweet terpenes.',
 16, 21, 0, 1, '["sleepy", "relaxed", "hungry"]', '["berry", "sweet", "grape"]', 'Bubble x Yum hybrid'),

('Bubba 76', 'Hybrid',
 'Community-sourced hybrid cultivar known for mint and sweet terpenes.',
 18, 28, 0, 1, '["sleepy", "relaxed", "hungry"]', '["mint", "sweet", "cream"]', 'Bubba x 76 hybrid'),

('Bubba Diagonal', 'Sativa',
 'Community-sourced sativa cultivar known for lemon and citrus terpenes.',
 15, 22, 0, 1, '["sleepy", "relaxed", "hungry"]', '["lemon", "citrus", "sweet"]', 'Bubba x Diagonal hybrid'),

('Bubba Dough', 'Hybrid',
 'Community-sourced hybrid cultivar known for citrus and pine terpenes.',
 19, 23, 0, 1, '["energetic", "creative", "uplifted"]', '["citrus", "pine", "earthy"]', 'Bubba x Dough hybrid'),

('Bubba Fett Bubba Fresh', 'Indica',
 'Community-sourced indica cultivar known for cherry and sweet terpenes.',
 19, 27, 0, 1, '["euphoric", "happy", "relaxed"]', '["cherry", "sweet", "earthy"]', 'Bubba x Fresh hybrid'),

('Bubba God', 'Sativa',
 'Community-sourced sativa cultivar known for citrus and pine terpenes.',
 15, 22, 0, 1, '["sleepy", "relaxed", "hungry"]', '["citrus", "pine", "earthy"]', 'Bubba x God hybrid'),

('Bubba Hashplant', 'Hybrid',
 'Community-sourced hybrid cultivar known for tropical and sweet terpenes.',
 19, 28, 0, 1, '["happy", "relaxed", "euphoric"]', '["tropical", "sweet", "fruity"]', 'Bubba x Hashplant hybrid'),

('Bubba King', 'Hybrid',
 'Community-sourced hybrid cultivar known for diesel and earthy terpenes.',
 20, 23, 0, 1, '["euphoric", "happy", "relaxed"]', '["diesel", "earthy", "pungent"]', 'Bubba x King hybrid')

on conflict (name) do update set
  type = excluded.type,
  description = excluded.description,
  thc_min = excluded.thc_min,
  thc_max = excluded.thc_max,
  cbd_min = excluded.cbd_min,
  cbd_max = excluded.cbd_max,
  effects = excluded.effects,
  flavors = excluded.flavors,
  genetics = excluded.genetics;

select type, count(*) as count from "StrainVerse".strains group by type order by type;
select count(*) as total_strains from "StrainVerse".strains;
