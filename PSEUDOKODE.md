Ved vores endpoints, connecter vi til app'en hogwarts.js, som deler kaldet ud til den tilhørende Router, som tjekker hvilken endpoint der er speciferet, som kalder functionen tilhørende i Controller.

I Controller prøver vi, med "try", at køre de tilhørende functioner som kaldes i Repository, hvis "try" lykkes, vil vi få en status 200, som siger at det lykkes, ellers køre vi vores "catch" som er vores error messages med den feedback som matcher error'en eg. 404 (item not found), det er også her vi kontroller hvilke variabler vi sender til databasen/hvilke variabler vores SQL queries kræver fra body, samt hvilken id vi for fra URL'en, via Params, for når vi anvender for at se specifike items.

I Repository køre vi vores SQL queries til at udføre vores ønsket funktionaliteter, som snakker til database via db.js som anvender infomationen i .env filen, til at kunne koble til vores lokaldatabase, mere specifikt hogwarts databasen i postgress.

//// HOUSES ENDPOINTS
GET "/houses"
Her henter vi alle infomationer under tabellen house

GET "/houses/:id"
Her henter vi alle tabellens rækker som har en id der matcher den id sendt i endpointet, ved at lave en liste af elementer der matcher med vores kriterie og da det er kun et elementer henter vi det ved rows[0] for at kun elementer og ikke en liste.

//// TEACHERS ENDPOINTS
GET "/teachers"
Her henter vi alle infomationer under tabellen teacher, men også hvilket hus læren tilhøre ved at anvende en id fundet i kolonnen house i lære tabellens, der holder et tal, som er linket til House id, som foreign key, så ved en LEFT JOIN, returner vi lære id, navn og hus fra house tabellen.

GET "/teachers/:id"
Gør det samme som for når vi henter alle lære, men vi henter for en speific lære ligende
/houses/:id

POST "/teachers"
Her laver vi en ny lære, hvor SQL forventer en body json, der indeholder variablerne med teacher_name som en string og house som et tal

PUT "/teachers/:id"
Her kan vi opdater en lære ud fra den givet id, og ligende POST så forventer den en json med teacher_name og house

//// STUDENTS ENDPOINTS
GET "/students"
Her henter vi alle infomationer under tabellen students, og ligende lære skal vi bruge en JOIN for at se hvilket hus de er under, foruden dette, ville jeg gerne se hvilke klasser eleven har og til det laver et json objekt med COALESCE som vi kalder courses, og ligende house, tjekker vi foreign keys, men i en junction table der indeholder id for elever og klasser, så vi køre en kæde af LEFT JOINTS fra student.id -> student_fk.id -> course_fk.id -> course.id -> course,
og vi kan så returner elevs id, navn, klasser, hus og starting år

GET "/students/:id"
ligende de forrige GET by ID endpoints

POST "/students"
ligende de forrige POST, nu med variablerne student_name, house, starting_year

PUT "/students/:id"
Ligende de forrige PUT, nu med variablerne student_name, house, starting_year

//// COURSES ENDPOINTS
GET "/courses"
For courses GET minder den om students, men rollen er byttet om, så vi går fra courses.id til student_name dennegang, og istedet for at hente et hus, henter vi en lære istedet

GET "/courses/:id"
ligende de forrige GET by ID endpoints

POST "/courses"
ligende de forrige POST, nu med variablerne course, teacher

PUT "/courses/:id"
For updating course have vi flere endpoints for det, så til den første forventer kun en variable af course, ud fra en givet id

PUT "/courses/teacher/:id"
Her har vi muligheden til at updatere hvilken lære klassen skal med variablen teacher.

POST "/courses/addStudents/:id"
Til sidste at opdatere student bruger POST og istedet for at POST til courses POST'er vi til junction tabellen courses_students_ft, hvor vi INSERT'er en ny række med variablerne student_fk som et tal af en student id og course_fk som et tal af en course id
