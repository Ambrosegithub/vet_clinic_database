-- MEDUCAL_HISTORIES TABLE --

CREATE DATABASE clinic

CREATE TABLE medical_histories
(
    id INT GENERATED ALWAYS AS IDENTITY  NOT NULL PRIMARY KEY,
    admitted_at TIMESTAMP NOT NULL,
    patient_id INT REFERENCES patients (id) ON DELETE CASCADE NOT NULL,
    status VARCHAR(20) NOT NULL,
    CONSTRAINT fk_patients FOREIGN KEY (patient_id) REFERENCES patients (id) ON DELETE CASCADE
    PRIMARY KEY (id)
);

-- treatments table --
@@ -41,14 +41,19 @@ CREATE TABLE invoices_items (
     id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
    unit_price DECIMAL NOT NULL,
    quantity INT NOT NULL,
    total_price DECIMAL NOT NULL,
    invoice_id INT REFERENCES invoices (id) ON DELETE CASCADE,
    treatment_id INT REFERENCES treatments (id) ON DELETE CASCADE,
    CONSTRAINT fk_invoices FOREIGN KEY (invoice_id) REFERENCES invoices (id) ON DELETE CASCADE,
    CONSTRAINT fk_treatments FOREIGN KEY (treatment_id) REFERENCES treatments (id) ON DELETE CASCADE
    PRIMARY KEY (id)
);

CREATE TABLE patients (
id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
name varchar(250),
date_of_birth DATE,
PRIMARY KEY (id)
)

CREATE TABLE invoices (
id INT NOT NULL,
total_amount DECIMAL NOT NULL,
generated_at TIMESTAMP,
payed_at TIMESTAMP,
medical_histories_id INT,
PRIMARY KEY (id),
FOREIGN KEY (medical_histories_id) REFERENCES medical_histories(id) ON DELETE CASCADE
)

CREATE TABLE treatments (
id INT NOT NULL GENERATED ALWAYS AS IDENTITY, 
type VARCHAR(230),
name VARCHAR(250)
);

CREATE TABLE medical_histories_treatments (
medical_histories_id INT NOT NULL,
treatments_id INT NOT NULL,
FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id) ON DELETE CASCADE,
FOREIGN KEY (treatments_id) REFERENCES treatments(id) ON DELETE CASCADE
);
