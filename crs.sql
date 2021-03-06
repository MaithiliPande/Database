<?xml version="1.0" encoding="UTF-8"?>
<schemadesigner version="6.5">
<source>
<database charset="latin1" collation="latin1_swedish_ci">fwp-crs</database>
</source>
<canvas zoom="100">
<tables>
<table name="reservation" view="colnames">
<left>6</left>
<top>164</top>
<width>162</width>
<height>175</height>
<sql_create_table>CREATE TABLE `reservation` (
  `reservation_id` int(5) NOT NULL AUTO_INCREMENT,
  `customer_id` int(5) DEFAULT NULL,
  `category_id` int(5) DEFAULT NULL,
  `drop_off_location_id` int(5) DEFAULT NULL,
  `pick_up_location_id` int(5) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  PRIMARY KEY (`reservation_id`),
  KEY `customer_id` (`customer_id`),
  KEY `category_id` (`category_id`),
  KEY `drop_off_location_id` (`drop_off_location_id`),
  KEY `pick_up_location_id` (`pick_up_location_id`),
  CONSTRAINT `reservation_ibfk_3` FOREIGN KEY (`drop_off_location_id`) REFERENCES `location` (`location_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reservation_ibfk_4` FOREIGN KEY (`pick_up_location_id`) REFERENCES `location` (`location_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1</sql_create_table>
</table>
<table name="customer" view="colnames">
<left>274</left>
<top>8</top>
<width>138</width>
<height>158</height>
<sql_create_table>CREATE TABLE `customer` (
  `customer_id` int(5) NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(50) NOT NULL,
  `customer_age` int(2) NOT NULL,
  `license_no` varchar(15) DEFAULT NULL,
  `is_valid` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1</sql_create_table>
</table>
<table name="category" view="colnames">
<left>262</left>
<top>212</top>
<width>135</width>
<height>107</height>
<sql_create_table>CREATE TABLE `category` (
  `category_id` int(5) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1</sql_create_table>
</table>
<table name="location" view="colnames">
<left>264</left>
<top>354</top>
<width>129</width>
<height>124</height>
<sql_create_table>CREATE TABLE `location` (
  `location_id` int(5) NOT NULL AUTO_INCREMENT,
  `location_name` varchar(50) NOT NULL,
  `city_id` int(5) DEFAULT NULL,
  PRIMARY KEY (`location_id`),
  KEY `city_id` (`city_id`),
  CONSTRAINT `location_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1</sql_create_table>
</table>
<table name="city" view="colnames">
<left>487</left>
<top>395</top>
<width>105</width>
<height>107</height>
<sql_create_table>CREATE TABLE `city` (
  `city_id` int(5) NOT NULL AUTO_INCREMENT,
  `city_name` varchar(50) NOT NULL,
  PRIMARY KEY (`city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1</sql_create_table>
</table>
<table name="car" view="colnames">
<left>662</left>
<top>319</top>
<width>139</width>
<height>194</height>
<sql_create_table>CREATE TABLE `car` (
  `car_id` int(5) NOT NULL AUTO_INCREMENT,
  `category_id` int(5) NOT NULL,
  `brand` varchar(20) NOT NULL,
  `model_name` varchar(10) NOT NULL,
  `production_year` year(4) DEFAULT NULL,
  `mileage` int(2) DEFAULT NULL,
  `color` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`car_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `car_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1</sql_create_table>
</table>
<table name="car_equipment" view="colnames">
<left>978</left>
<top>188</top>
<width>148</width>
<height>124</height>
<sql_create_table>CREATE TABLE `car_equipment` (
  `car_equipment_id` int(5) NOT NULL AUTO_INCREMENT,
  `car_id` int(5) DEFAULT NULL,
  `equipment_id` int(5) DEFAULT NULL,
  PRIMARY KEY (`car_equipment_id`),
  KEY `car_id` (`car_id`),
  KEY `equipment_id` (`equipment_id`),
  CONSTRAINT `car_equipment_ibfk_1` FOREIGN KEY (`car_id`) REFERENCES `car` (`car_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `car_equipment_ibfk_2` FOREIGN KEY (`equipment_id`) REFERENCES `equipment` (`equipment_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1</sql_create_table>
</table>
<table name="equipment" view="colnames">
<left>824</left>
<top>39</top>
<width>123</width>
<height>136</height>
<sql_create_table>CREATE TABLE `equipment` (
  `equipment_id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`equipment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1</sql_create_table>
</table>
<table name="equipment_rent" view="colnames">
<left>633</left>
<top>6</top>
<width>153</width>
<height>124</height>
<sql_create_table>CREATE TABLE `equipment_rent` (
  `equipment_rent_id` int(5) NOT NULL AUTO_INCREMENT,
  `equipment_id` int(5) DEFAULT NULL,
  `rent_id` int(5) DEFAULT NULL,
  PRIMARY KEY (`equipment_rent_id`),
  KEY `equipment_id` (`equipment_id`),
  KEY `rent_id` (`rent_id`),
  CONSTRAINT `equipment_rent_ibfk_1` FOREIGN KEY (`equipment_id`) REFERENCES `equipment` (`equipment_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `equipment_rent_ibfk_2` FOREIGN KEY (`rent_id`) REFERENCES `rent` (`rent_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1</sql_create_table>
</table>
<table name="rent" view="colnames">
<left>452</left>
<top>84</top>
<width>128</width>
<height>158</height>
<sql_create_table>CREATE TABLE `rent` (
  `rent_id` int(5) NOT NULL AUTO_INCREMENT,
  `car_id` int(5) DEFAULT NULL,
  `reservation_id` int(5) DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `price_id` int(5) DEFAULT NULL,
  PRIMARY KEY (`rent_id`),
  KEY `car_id` (`car_id`),
  KEY `reservation_id` (`reservation_id`),
  KEY `price_id` (`price_id`),
  CONSTRAINT `rent_ibfk_3` FOREIGN KEY (`price_id`) REFERENCES `price` (`price_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rent_ibfk_1` FOREIGN KEY (`car_id`) REFERENCES `car` (`car_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rent_ibfk_2` FOREIGN KEY (`reservation_id`) REFERENCES `reservation` (`reservation_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1</sql_create_table>
</table>
<table name="rent_insurance" view="colnames">
<left>658</left>
<top>164</top>
<width>148</width>
<height>124</height>
<sql_create_table>CREATE TABLE `rent_insurance` (
  `rent_insurance_id` int(5) NOT NULL AUTO_INCREMENT,
  `rent_id` int(5) DEFAULT NULL,
  `insurance_id` int(5) DEFAULT NULL,
  PRIMARY KEY (`rent_insurance_id`),
  KEY `rent_id` (`rent_id`),
  KEY `insurance_id` (`insurance_id`),
  CONSTRAINT `rent_insurance_ibfk_1` FOREIGN KEY (`rent_id`) REFERENCES `rent` (`rent_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rent_insurance_ibfk_2` FOREIGN KEY (`insurance_id`) REFERENCES `insurance` (`insurance_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1</sql_create_table>
</table>
</tables>
</canvas>
</schemadesigner>