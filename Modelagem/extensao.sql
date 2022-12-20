CREATE TABLE "customers" (
	"id" SERIAL PRIMARY KEY,
	"fullName" VARCHAR(50) NOT NULL,
	"cpf" INTEGER NOT NULL,
	"email" VARCHAR(50) NOT NULL,
	"password" VARCHAR(20) NOT NULL
);

CREATE TABLE "customerPhones" (
	"id" SERIAL PRIMARY KEY,
	"number" NUMERIC NOT NULL,
	"type" VARCHAR(10) NOT NULL,
	"customerId" INTEGER NOT NULL
);

CREATE TABLE "customerAddresses" (
	"id" SERIAL PRIMARY KEY,
	"street" VARCHAR(50) NOT NULL,
	"number" NUMERIC NOT NULL,
	"complement" VARCHAR(20) NOT NULL,
	"postalCode" VARCHAR(20) NOT NULL,
	"cityId" INTEGER NOT NULL,
	"customerId" integer NOT NULL
);


CREATE TABLE "cities" (
	"id" SERIAL PRIMARY KEY,
	"name" VARCHAR(50) NOT NULL,
	"stateId" INTEGER NOT NULL
);

CREATE TABLE "states" (
	"id" SERIAL PRIMARY KEY,
	"name" VARCHAR(50) NOT NULL
);

CREATE TABLE "bankAccount" (
	"id" SERIAL PRIMARY KEY,
	"accountNumber" NUMERIC NOT NULL,
	"agency" NUMERIC NOT NULL,
	"openDate" DATE NOT NULL,
	"closeDate" DATE NOT NULL,
	"customerId" integer NOT NULL
);

CREATE TABLE "transactions" (
	"id" SERIAL PRIMARY KEY,
	"amount" NUMERIC NOT NULL,
	"type" VARCHAR(10) NOT NULL,
	"time" TIMESTAMP NOT NULL,
	"description" VARCHAR(50) NOT NULL,
	"cancelled" BOOLEAN DEFAULT FALSE,
	"bankAccountId" integer NOT NULL
);

CREATE TABLE "creditCards" (
	"id" SERIAL PRIMARY KEY,
	"name" VARCHAR(50) NOT NULL,
	"number" NUMERIC NOT NULL,
	"securityCode" NUMERIC NOT NULL, 
	"expirationMonth" NUMERIC NOT NULL,
	"expirationYear" NUMERIC NOT NULL,
	"password" VARCHAR(20) DEFAULT FALSE,
	"limit" NUMERIC NOT NULL,
	"bankAccountId" integer NOT NULL
);


ALTER TABLE "customerPhones" ADD CONSTRAINT "customerPhones_fk0" FOREIGN KEY ("customerId") REFERENCES "customer"("id");

ALTER TABLE "customerAddresses" ADD CONSTRAINT "addresses_fk0" FOREIGN KEY ("customerId") REFERENCES "customer"("id");
ALTER TABLE "customerAddresses" ADD CONSTRAINT "addresses_fk1" FOREIGN KEY ("cityId") REFERENCES "cities"("id");

ALTER TABLE "cities" ADD CONSTRAINT "cities_fk0" FOREIGN KEY ("stateId") REFERENCES "states"("id");

ALTER TABLE "bankAccount" ADD CONSTRAINT "bankAccount_fk0" FOREIGN KEY ("customerId") REFERENCES "customer"("id");

ALTER TABLE "transactions" ADD CONSTRAINT "transactions_fk0" FOREIGN KEY ("bankAccountId") REFERENCES "bankAccount"("id");

ALTER TABLE "creditCards" ADD CONSTRAINT "creditCards_fk0" FOREIGN KEY ("bankAccountId") REFERENCES "bankAccount"("id");