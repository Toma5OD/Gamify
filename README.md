
# Documentation for Gamify App

## Overview
**App Name:** GAMIFY

### Repositories
1. **Frontend Repo:** [Gamify](https://github.com/Toma5OD/Gamify)
2. **Backend Repo:** [GamifyBackend](https://github.com/Toma5OD/GamifyBackend)

### Technology Stack
- **Frontend:** Swift
- **Backend:** Node.js
- **Database:** PostgreSQL
- **Map API:** Google Maps
- **Business Information API:** Google Places API
- **Security:** OAuth
- **Source Control:** GitHub
- **CI/CD:** Github Actions
- **Testing:** XCTest for Swift, Jest for backend

## Database Setup and Access
### PostgreSQL Connection
- **Command to Connect:** `psql -U postgres`
- **Password Prompt:** Enter the password for the user 'postgres'.
- **Listing Databases:** Type `\l` to list all databases.

### Connecting to Gamify Database
1. **Connect to Database:** `\c gamify`
2. **List Database Relations:** Type `\dt` to list all relations (tables).

### Gamify Database Structure
- **Schemas:**
  - `public`
- **Tables:**
  - `check_ins`
  - `users`

## Repository Structure: GamifyBackend
```
GamifyBackend/
│   ├── index.js
│   ├── .gitignore
│   ├── package-lock.json
│   ├── package.json
│   ├── .env
│   ├── models/
│   │   ├── users.js
│   │   ├── index.js
│   ├── db/
│   │   ├── db.js
│   ├── controllers/
│   │   ├── index.js
│   │   ├── authController.js
│   ├── routes/
│   │   ├── users.js
│   │   ├── index.js
```

## Step-by-Step Guides
### Database Connection
1. Open the terminal.
2. Run `psql -U postgres` and enter the password.
3. Connect to the Gamify database with `\c gamify`.
4. Use `\dt` to view the database tables.

### Setting up the Backend
1. Navigate to the `GamifyBackend` directory.
2. Install dependencies with `npm install`.
3. Start the server with `npm start`.

### Running Tests
- **Swift:** Use XCTest.
- **Node.js:** Use Jest.

## Additional Notes
- Remember to update `.env` with necessary environment variables.
- Regularly push changes to GitHub for version control.
- Utilize GitHub Actions for continuous integration and deployment.
