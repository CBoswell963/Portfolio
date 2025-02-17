# Pokemon Team Builder API Design Document

## 1. Introduction
The Pokemon Team Builder API allows users to:
- Authenticate (register, log in, log out).
- Create, view, edit, and delete Pokemon teams.
- Analyze Pokemon team type coverage.
- Retrieve Pokemon information from PokeAPI.

## 2. Authentication
Authentication is handled using **JWT (JSON Web Tokens)**.
- Users must include their JWT in the `Authorization` header:
    ```
    Authorization: Bearer YOUR_TOKEN
    ```
- Token expires after **24 hours**.

## 3. Endpoints
### 3.1 User Authentication
| Method | Endpoint         | Description              | Auth Required |
|--------|------------------|--------------------------|---------------|
| POST   | `/auth/register` | Register a new user      | ❌ No         |
| POST   | `/auth/login`    | Authenticate and get JWT | ❌ No         |
| POST   | `/auth/logout`   | Log out the current user | ✅ Yes        |
| GET    | `/auth/me`       | Get user info            | ✅ Yes        |

### 3.2 Pokemon Data
| Method | Endpoint                | Description                        | Auth Required |
|--------|-------------------------|------------------------------------|---------------|
| GET    | `/pokemon/{id}`         | Get Pokemon by ID (via PokeAPI)   | ❌ No         |
| GET    | `/pokemon/search?name=` | Search Pokemon by name or type    | ❌ No         |

### 3.3 Team Management
| Method | Endpoint            | Description                | Auth Required |
|--------|---------------------|----------------------------|---------------|
| POST   | `/teams`            | Create a new Pokemon team  | ✅ Yes        |
| GET    | `/teams`            | Retrieve all user’s teams  | ✅ Yes        |
| GET    | `/teams/{teamId}`   | Retrieve a specific team   | ✅ Yes        |
| PUT    | `/teams/{teamId}`   | Update an existing team    | ✅ Yes        |
| DELETE | `/teams/{teamId}`   | Delete a Pokemon team      | ✅ Yes        |

### 3.4 Type Coverage Analysis
| Method | Endpoint                   | Description                         | Auth Required |
|--------|----------------------------|-------------------------------------|---------------|
| GET    | `/teams/{teamId}/coverage` | Get type coverage analysis for team | ✅ Yes        |

## 4. Request & Response Examples
### Register User (`POST /auth/register`)
**Request:**
```json
{
  "username": "trainerAsh",
  "password": "pikachu123"
}
```
**Response:**
```json
{
  "message": "User registered successfully",
  "userId": 42
}
```

### Create Team (`POST /teams`)
**Request:**
```json
{
  "teamName": "Electric Masters",
  "pokemon": [25, 135, 462]
}
```
**Response:**
```json
{
  "teamId": 7,
  "teamName": "Electric Masters",
  "pokemon": [
    { "id": 25, "name": "Pikachu", "type": ["Electric"] },
    { "id": 135, "name": "Jolteon", "type": ["Electric"] },
    { "id": 462, "name": "Magnezone", "type": ["Electric", "Steel"] }
  ]
}
```

## 5. Error Handling
| Status Code | Description                       |
|-------------|-----------------------------------|
| `400`       | Bad Request (Invalid input)       |
| `401`       | Unauthorized (Missing/Invalid JWT)|
| `404`       | Not Found (Invalid resource)      |
| `500`       | Internal Server Error             |

### Example Error Response (`404` Not Found)
```json
{
  "error": "Pokemon not found",
  "status": 404
}
```

## 6. Rate Limiting
- **Authenticated users**: 100 requests/minute
- **Unauthenticated users**: 30 requests/minute

## 7. Versioning
All API endpoints follow a versioning scheme:
```
/api/v1/teams
```
Future updates will be introduced as `/v2/teams` to prevent breaking changes.

## 8. Security Considerations
1. **Use HTTPS**: All endpoints require encrypted communication.
2. **Password Hashing**: Store passwords using **bcrypt**.
3. **Input Validation**: Ensure user inputs are sanitized.
4. **JWT Expiration**: Tokens expire after **24 hours**.

## 9. Tools & Documentation
- **Postman** for API testing.
- **GitHub** for version control and collaboration.

