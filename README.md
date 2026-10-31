//// HOUSES ENDPOINTS

For at få alle huse anvend endpoint
"/houses"

For et enkelt hus
"/houses/:id"

//// TEACHERS ENDPOINTS
For at få alle lærere anvend endpoint
GET "/teachers"

For en enkelt lære
GET "/teachers/:id"

Tilføj lære
POST "/teachers"

Updatere lære
PUT "/teachers/:id"

Fjern en lære med (Virker ikke da der er op sat Foreign Keys og ved ikke hvor jeg ville skulle starte uden at gå i dybden med AI, dette går for alle DELETE endpoints)
DELETE "/teachers/:id"

//// STUDENTS ENDPOINTS
For at få alle elever anvend endpoint
GET "/students"

For en enkelt elev
GET "/students/:id"

Tilføj elev
POST "/students"

Updatere elev
PUT "/students/:id"

Fjern en elev med
DELETE "/students/:id"

//// COURSES ENDPOINTS
For at få alle klasser anvend endpoint
GET "/courses"

For en enkelt klasse
GET "/courses/:id"

Tilføj klasse
POST "/courses"

Updatere klasse navn
PUT "/courses/:id"

Updatere klasse lære
PUT "/courses/teacher/:id"

Tilføj elev til klasse
POST "/courses/addStudents/:id"

Fjern en klasse med
DELETE "/courses/:id"
