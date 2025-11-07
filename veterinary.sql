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

INSERT INTO animals (animalid, name, species, breed, dateofbirth, gender, color, ownerid) VALUES
(1, 'Buddy', 'Dog', 'Golden Retriever', '2020-01-01', 'Male', 'Golden', 1),
(2, 'Whiskers', 'Cat', 'Siamese', '2019-05-15', 'Female', 'Cream', 2),
-- Add 8 more rows similarly...
(10, 'Simba', 'Cat', 'Persian', '2021-03-10', 'Male', 'White', 10);

INSERT INTO appointments (appointid, animalid, appointdate, reason) VALUES
(1, 1, '2023-01-10', 'Checkup'),
(2, 2, '2023-01-15', 'Vaccination'),
(3, 3, '2023-02-05', 'Injury'),
(4, 4, '2023-02-20', 'Dental'),
(5, 5, '2023-03-10', 'Surgery'),
(6, 6, '2023-03-15', 'Eye exam'),
(7, 7, '2023-04-01', 'Checkup'),
(8, 2, '2023-04-10', 'Follow-up'),
(9, 1, '2023-05-05', 'Vaccination'),
(10, 2, '2023-05-20', 'Checkup');

INSERT INTO doctors(doctorid, dfirstname, dlastname, speciality, phone, email) VALUES
(1, 'Dr.Maria', 'Santos', 'General Veterinarian', '987-654-3210', 'maria@example.com'),
(2, 'Dr.Antonio', 'Gonzales', 'Feline Specialist', '555-123-4567', 'antonio@example.com'),
(3, 'Dr.Felipe', 'Luna', 'Orthopedic Specialist', '111-222-3333', 'felipe@example.com'),
(4, 'Dr.Sofia', 'Reyes', 'Dermatology Specialist', '999-888-7777', 'sofia@xample.com'),
(5, 'Dr.Luis', 'Torres', 'Surgery Specialist', '123-555-7777', 'luis@example.com'),
(6, 'Dr.Carmen', 'Fernandez', 'Opthalmology Specialist', '333-222-1111', ' carmen@example.com '),
(7, 'Dr.Juan', 'Perez', 'Cardiology Specialist', '444-555-6666', 'juan@example.com'),
(8, 'Dr.Ana', 'Lopez', 'Dentistry Specialist', '777-888-9999', 'ana@example.com'),
(9, 'Dr.Pablo', 'Martinez', 'Neurology Specialist', '000-111-2222', 'pablo@example.com'),
(10, 'Dr.Lucia', 'Rodriguez', 'Oncology Specialist', '333-444-5555', 'lucia@example.com');

INSERT INTO invoices (invoiceid, appointid, totalamount, paymentdate) VALUES
(1, 1, 50.00, '09:30:00'),
(2, 2, 75.00, '14:15:00'),
(3, 3, 100.00, '11:00:00'),
(4, 4, 200.00, '13:45:00'),
(5, 5, 80.00, '10:30:00'),
(6, 6, 30.00, '15:00:00'),
(7, 7, 75.00, '09:15:00'),
(8, 8, 150.00, '16:30:00'),
(9, 9, 60.00, '14:45:00'),
(10, 10, 40.00, '11:30:00');

INSERT INTO medicalrecords (recordid, animalid, recorddate, doctorid, diagnosis, prescription, notes) VALUES 
(1, 1, '2023-01-05 00:00:00', 1, 'Health check', 'N/A', 'Regular checkup, no issue detected'),
(2, 2, '2023-01-10 00:00:00', 1, 'Vaccination', 'Vaccine X', 'Administered vaccination X as per schedule'),
(3, 3, '2023-02-02 00:00:00', 3, 'Sprained leg', 'Pain Medication', 'Rest recommended for two weeks'),
(4, 4, '2023-02-15 00:00:00', 1, 'Dental cleaning', 'N/A', 'Completed dental cleaning procedure'),
(5, 5, '2023-03-10 00:00:00', 4, 'Skin infection', 'Antibiotics', 'Prescribed antibiotics for skin infection'),
(6, 6, '2023-03-10 00:00:00', 2, 'Flea infestation', 'Flea Treatment', 'Administered flea treatment'),
(7, 7, '2023-04-12 00:00:00', 1, 'Vaccination', 'Vaccine Y', 'Administered vaccination Y as per schedule'),
(8, 8, '2023-04-18 00:00:00', 5, 'Spaying', 'N/A', 'Successfully performed spaying surgery'),
(9, 9, '2023-05-02 00:00:00', 4, 'Allergic reaction', 'Antihistamines', 'Allergic reaction due to food prescribed antihistamine'),
(10, 10, '2023-05-20 00:00:00', 6, 'Conjunctivitis', 'Eye drops', 'Prescribed eye drops for conjunctivitis');

ALTER TABLE owners ADD registereddate DATE;
ALTER TABLE invoices RENAME COLUMN paymentdate TO paymenttime;
DELETE FROM appointments WHERE animalid = (SELECT animalid FROM animals WHERE name = 'Simba' AND species = 'Cat');
UPDATE doctors SET dlastname = 'Reyes-Gonzales' WHERE dfirstname = 'Dr.Sofia';
SELECT DISTINCT species FROM animals;
SELECT SUM(totalamount) AS total_sales FROM invoices;