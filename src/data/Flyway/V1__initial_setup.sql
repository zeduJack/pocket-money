-- user
CREATE TABLE "Users" (
                        "Id" serial PRIMARY KEY,
                        "Created" TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
                        "Modified" TIMESTAMP WITH TIME ZONE NULL DEFAULT CURRENT_TIMESTAMP,

                        "Firstname" VARCHAR(45) NOT NULL,
                        "Lastname" VARCHAR(45) NOT NULL,
                        "Username" VARCHAR(45)
);

CREATE OR REPLACE FUNCTION trigger_set_timestamp()
    RETURNS TRIGGER AS $$
BEGIN
    NEW."Modified" = NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER set_timestamp
    BEFORE UPDATE ON "Users"
    FOR EACH ROW
EXECUTE PROCEDURE trigger_set_timestamp();