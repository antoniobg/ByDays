== By Days

Live demo: [http://booking-system-abg.herokuapp.com/](http://booking-system-abg.herokuapp.com/)

Room Booking Application.

Framework: Ruby on Rails

Database: PostgreSQL

ORM: ActiveRecord

Other libraries: Twitter Bootstrap, jQuery


Models:

* Hotel
  * id
  * name
  * address
  * description

* Room Type
  * id
  * hotel_id
  * name
  * price

* Room
  * id
  * room_type

* Booking
  * id
  * room_id
  * start_date
  * end_date
  * total_price
  

