-- MEDUCAL_HISTORIES TABLE --
CREATE TABLE medical_histories
(
    id          INT GENERATED ALWAYS AS IDENTITY               NOT NULL PRIMARY KEY,
    admitted_at TIMESTAMP                                      NOT NULL,
    patient_id  INT REFERENCES patients (id) ON DELETE CASCADE NOT NULL,
    status      VARCHAR(20)                                    NOT NULL

    id          INT GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
    admitted_at TIMESTAMP                        NOT NULL,
    patient_id  INT NOT NULL ,
    status      VARCHAR(20)                      NOT NULL,
    CONSTRAINT fk_patients FOREIGN KEY (patient_id) REFERENCES patients (id) ON DELETE CASCADE
);

-- treatments table --
@@ -41,14 +41,19 @@ CREATE TABLE invoices_items
    unit_price   DECIMAL,
    quantity     INT,
    total_price  DECIMAL,
    invoice_id   INT REFERENCES invoices (id) ON DELETE CASCADE,
    treatment_id INT REFERENCES treatments (id) ON DELETE CASCADE
    invoice_id   INT,
    treatment_id INT,
    CONSTRAINT fk_invoices FOREIGN KEY (invoice_id) REFERENCES invoices (id) ON DELETE CASCADE,
    CONSTRAINT fk_treatments FOREIGN KEY (treatment_id) REFERENCES treatments (id) ON DELETE CASCADE
);

-- TABLE MADE FROM A MANY TO MANY RELATIONSHIP OF MEDICAL_HISTORY & TREATMENTS"
CREATE TABLE medical_histories_treatments
(
    id                 INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY NOT NULL,
    medical_history_id INT REFERENCES medical_histories (id) ON DELETE CASCADE,
    treatment_id       INT REFERENCES treatments (id) ON DELETE CASCADE
    medical_history_id INT,
    treatment_id       INT,
    CONSTRAINT fk_medical_histories FOREIGN KEY (medical_history_id) REFERENCES medical_histories (id) ON DELETE CASCADE,
    CONSTRAINT fk_treatments FOREIGN KEY (treatment_id) REFERENCES treatments (id) ON DELETE CASCADE
)

