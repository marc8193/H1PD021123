CREATE TABLE locations (roomNumber CHAR(5),
                        hasWhiteBoard INTEGER CHECK(hasWhiteBoard >= 0  and hasWhiteBoard <= 1),
                        hasProjektor INTEGER CHECK(hasProjektor >= 0  and hasProjektor <= 1),
                        seats INTEGER CHECK(seats > 0  and seats <= 1000),
                        maxApproved INTEGER CHECK(maxApproved > 0  and maxApproved <= 2000))