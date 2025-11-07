CREATE DATABASE veretinary

CREATE TABLE owners (
    ownerid INT PRIMARY KEY,
    ofirstname VARCHAR(50),
    olastname VARCHAR(50),
    address VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(100)
);

CREATE TABLE animals (
  animalid INT PRIMARY KEY,
  name VARCHAR(50),
  species VARCHAR(50),
  breed VARCHAR(50),
  dateofbirth DATE,
  gender VARCHAR(10),
  color VARCHAR(50),
  ownerid INT,
  FOREIGN KEY (ownerid) REFERENCES owners(ownerid)
);

CREATE TABLE appointments (
    appointid INT PRIMARY KEY,
    animalid INT,
    appointdate DATE,
    reason VARCHAR(255),
    FOREIGN KEY (animalid) REFERENCES animals(animalid)
);

CREATE TABLE doctors (
    doctorid INT PRIMARY KEY,
    dfirstname VARCHAR(50),
    dlastname VARCHAR(50),
    speciality VARCHAR(50),
    phone VARCHAR(15),
    email VARCHAR(100)
);

CREATE TABLE invoices (
    invoiceid INT PRIMARY KEY,
    appointid INT,
    totalamount DECIMAL(10,2),
    paymentdate TIME,
    FOREIGN KEY (appointid) REFERENCES appointments(appointid)
);

CREATE TABLE medicalrecords (
  recordid INT PRIMARY KEY,
  animalid INT,
  recorddate DATETIME,
  doctorid INT,
  diagnosis VARCHAR(255),
  prescription VARCHAR(255),
  notes TEXT,
  FOREIGN KEY (animalid) REFERENCES animals(animalid),
  FOREIGN KEY (doctorid) REFERENCES doctors(doctorid)
);

INSERT INTO owners (ownerid, ofirstname, olastname, address, phone, email) VALUES
(1, 'Maria', 'Garcia', '123 Elm St', '555-1234', 'maria@example.com'),
(2, 'Juan', 'Lopez', '456 Oak Ave', '555-5678', 'juan@example.com'),
(3, 'Ana', 'Martinez', '789 Pine Rd', '555-9012', 'ana@example.com'),
(4, 'Carlos', 'Rodriguez', '321 Maple Ln', '555-3456', 'carlos@example.com'),
(5, 'Sofia', 'Hernandez', '654 Birch Blvd', '555-7890', 'sofia@example.com'),
(6, 'Luis', 'Perez', '987 Cedar St', '555-2345', 'luis@example.com'),
(7, 'Elena', 'Torres', '147 Spruce Ave', '555-6789', 'elena@example.com'),
(8, 'Miguel', 'Ramirez', '258 Willow Rd', '555-0123', 'miguel@example.com'),
(9, 'Isabel', 'Flores', '369 Ash Ln', '555-4567', 'isabel@example.com'),
(10, 'Diego', 'Morales', '741 Poplar Blvd', '555-8901', 'diego@example.com');
