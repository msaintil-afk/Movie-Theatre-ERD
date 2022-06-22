CREATE TABLE "movies" (
  "movie_id" SERIAL,
  "amount" NUMERIC(5,2),
  "movie_name" VARCHAR(45),
  "movie_show_time" VARCHAR(50),
  PRIMARY KEY ("movie_id")
);

CREATE TABLE "customers" (
  "customer_id" SERIAL,
  "first_name" VARCHAR(45),
  "last_name" VARCHAR(45),
  "email" VARCHAR(100),
  "age" INTEGER,
  PRIMARY KEY ("customer_id")
);

CREATE TABLE "concessions" (
  "order_id" SERIAL,
  "order_date" DATE(current Date),
  "sub_total" NUMERIC(8,2),
  "total" NUMERIC(10,2),
  "customer_id" INTEGER,
  PRIMARY KEY ("order_id"),
  CONSTRAINT "FK_concessions.customer_id"
    FOREIGN KEY ("customer_id")
      REFERENCES "customers"("customer_id")
);

CREATE TABLE "tickets" (
  "ticket_id" SERIAL,
  "quantity" INTEGER,
  "order_id" INTEGER,
  PRIMARY KEY ("ticket_id"),
  CONSTRAINT "FK_tickets.order_id"
    FOREIGN KEY ("order_id")
      REFERENCES "concessions"("order_id"),
  CONSTRAINT "FK_tickets.quantity"
    FOREIGN KEY ("quantity")
      REFERENCES "movies"("movie_id")
);


