# AirBnB Database Requirements
## All Entities and Their Attributes
### Here are the entities and their respective attributes as defined in the database specification:

**User** 
  * user_id: Primary Key, UUID, Indexed 
  * first_name: VARCHAR, NOT NULL 
  * last_name: VARCHAR, NOT NULL 
  * email: VARCHAR, UNIQUE, NOT NULL 
  * password_hash: VARCHAR, NOT NULL 
  * phone_number: VARCHAR, NULL 
  * role: ENUM (guest, host, admin), NOT NULL 
  * created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP 

 **Property**
  * property_id: Primary Key, UUID, Indexed 
  * host_id: Foreign Key, references User(user_id) 
  * name: VARCHAR, NOT NULL 
  * description: TEXT, NOT NULL 
  * location: VARCHAR, NOT NULL 
  * price per night: DECIMAL, NOT NULL 
  * created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP 
  * updated_at: TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP 

 **Booking** 
  * booking_id: Primary Key, UUID, Indexed 
  * property_id: Foreign Key, references Property(property_id) 
  * user_id: Foreign Key, references User(user_id) 
  * start_date: DATE, NOT NULL 
  * end_date: DATE, NOT NULL 
  * total_price: DECIMAL, NOT NULL 
  * status: ENUM (pending, confirmed, canceled), NOT NULL 
  * created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP 

 **Payment** 
  * payment_id: Primary Key, UUID, Indexed 
  * booking_id: Foreign Key, references Booking(booking_id) 
  * amount: DECIMAL, NOT NULL 
  * payment_date: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP 
  * payment_method: ENUM (credit_card, paypal, stripe), NOT NULL 

 **Review** 
  * review_id: Primary Key, UUID, Indexed 
  * property_id: Foreign Key, references Property(property_id) 
  * user_id: Foreign Key, references User(user_id) 
  * rating: INTEGER, CHECK: rating >= 1 AND rating <= 5, NOT NULL 
  * comment: TEXT, NOT NULL 
  * created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP 

 **Message** 
  * message_id: Primary Key, UUID, Indexed 
  * sender_id: Foreign Key, references User(user_id) 
  * recipient_id: Foreign Key, references User(user_id) 
  * message_body: TEXT, NOT NULL 
  * sent_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP 

 ## Relationships and Their Cardinalities
The relationships between entities are defined by Foreign Keys, indicating how tables are linked.

* **User to Property:**
  * **Relationship:** A User can be a host of multiple Property listings. Exactly one User hosts each Property.
  * **Cardinality:** One-to-Many (1:M)
  * **Description:** Property.host_id references User.user_id. This indicates that a user acts as a host for properties.

* **User to Booking:**
  * **Relationship:** A User can make multiple Bookings. Exactly one User makes each Booking.
  * **Cardinality:** One-to-Many (1:M)
  * **Description:** Booking.user_id references User.user_id. This links a booking to the user who made it.

* **Property to Booking:**
  * **Relationship: A Property can have multiple Bookings. Each Booking is for exactly one Property.
  * **Cardinality: One-to-Many (1:M)
  * ** Description: Booking.property_id references Property.property_id. This connects a booking to the specific property being reserved.

* **Booking to Payment:**
  * **Relationship:** A Booking can have one Payment associated with it. A Payment belongs to exactly one Booking.
  * **Cardinality: One-to-One (1:1)
  * **Description: Payment.booking_id references Booking.booking_id. This ensures each payment is tied to a specific booking.

* **User to Review:**
  * Relationship: A User can write multiple Reviews. Each Review is written by exactly one User.
  * **Cardinality: One-to-Many (1:M)
  * **Description: Review.user_id references User.user_id. This links a review to the user who authored it.

* **Property to Review:**
  * **Relationship: A Property can receive multiple Reviews. Each Review is for exactly one Property.
  * **Cardinality: One-to-Many (1:M)
  * **Description: Review.property_id references Property.property_id. This associates a review with the property it's evaluating.

* **User to Message (Sender):**
  * **Relationship: A User can send multiple Messages. Each Message is sent by exactly one User.
  * **Cardinality: One-to-Many (1:M)
  * **Description: Message.sender_id references User.user_id. This identifies the sender of a message.

* **User to Message (Recipient):**
  * **Relationship: A User can receive multiple Messages. Each Message is received by exactly one User.
  * **Cardinality: One-to-Many (1:M)
  * **Description: Message.recipient_id references User.user_id. This identifies the recipient of a message.
