# sivcam

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


flutter packages pub run build_runner build


# 🚀 Guía de Simulación - Centinel Backend

Esta guía contiene **todos los detalles técnicos** (Método, URL, Body) para que puedas probar la API manualmente en Postman o cualquier otro cliente.

## 0. Configuración Inicial: Roles

**¡IMPORTANTE!** Antes de crear usuarios, debes crear los roles en el sistema.

### 0.1. Crear Rol ADMIN
*   **Método**: `POST`
*   **URL**: `http://localhost:3000/roles`
*   **Body** (JSON):
```json
{
    "id": "ADMIN",
    "name": "Administrador",
    "image": "https://firebasestorage.googleapis.com/v0/b/rpiimage-b6062.appspot.com/o/admin.png?alt=media",
    "route": "/admin"
}
```

### 0.2. Crear Rol BOSS (Jefe)
*   **Método**: `POST`
*   **URL**: `http://localhost:3000/roles`
*   **Body** (JSON):
```json
{
    "id": "BOSS",
    "name": "Jefe",
    "image": "https://firebasestorage.googleapis.com/v0/b/rpiimage-b6062.appspot.com/o/boss.png?alt=media",
    "route": "/boss"
}
```

### 0.3. Crear Rol SECURITY (Seguridad)
*   **Método**: `POST`
*   **URL**: `http://localhost:3000/roles`
*   **Body** (JSON):
```json
{
    "id": "SECURITY",
    "name": "Seguridad",
    "image": "https://firebasestorage.googleapis.com/v0/b/rpiimage-b6062.appspot.com/o/security.png?alt=media",
    "route": "/security"
}
```

### 0.4. Crear Rol WORKER (Trabajador)
*   **Método**: `POST`
*   **URL**: `http://localhost:3000/roles`
*   **Body** (JSON):
```json
{
    "id": "WORKER",
    "name": "Trabajador",
    "image": "https://firebasestorage.googleapis.com/v0/b/rpiimage-b6062.appspot.com/o/worker.png?alt=media",
    "route": "/worker"
}
```

---

## 1. Autenticación

### 1.1. Registrar Superusuario
Crea el administrador del sistema.
*   **Método**: `POST`
*   **URL**: `http://localhost:3000/auth/register`
*   **Body** (JSON):
```json
{
  "name": "Super",
  "lastname": "Admin",
  "email": "admin@centinel.com",
  "password": "adminpassword",
  "phone": "999999999",
  "dni": "00000001",
  "rolesIds": ["ADMIN"]
}
```

### 1.2. Iniciar Sesión (Login)
Obtén el `access_token`. **Copia este token** para usarlo en los siguientes pasos (Header `Authorization: Bearer TU_TOKEN`).
*   **Método**: `POST`
*   **URL**: `http://localhost:3000/auth/login`
*   **Body** (JSON):
```json
{
  "dni": "00000001",
  "password": "adminpassword"
}
```

---

## 2. Configuración (Requiere Token)

### 2.1. Crear Contratista 1
*   **Método**: `POST`
*   **URL**: `http://localhost:3000/contractors`
*   **Body** (JSON):
```json
{
  "name": "Minera San Juan S.A.C.",
  "ruc": "20100000001",
  "address": "Av. Mineria 101",
  "phone": "900000001",
  "email": "contacto@sanjuan.com"
}
```

### 2.2. Crear Contratista 2
*   **Método**: `POST`
*   **URL**: `http://localhost:3000/contractors`
*   **Body** (JSON):
```json
{
  "name": "Servicios Generales del Sur",
  "ruc": "20200000002",
  "address": "Calle Industrias 202",
  "phone": "900000002",
  "email": "info@serviciossur.com"
}
```

### 2.3. Crear Turno Mañana
*   **Método**: `POST`
*   **URL**: `http://localhost:3000/shifts`
*   **Body** (JSON):
```json
{
  "name": "Turno Mañana",
  "start_time": "07:00",
  "end_time": "15:00",
  "days": ["MONDAY", "TUESDAY", "WEDNESDAY", "THURSDAY", "FRIDAY", "SATURDAY"]
}
```

### 2.4. Crear Turno Noche
*   **Método**: `POST`
*   **URL**: `http://localhost:3000/shifts`
*   **Body** (JSON):
```json
{
  "name": "Turno Noche",
  "start_time": "19:00",
  "end_time": "03:00",
  "days": ["MONDAY", "TUESDAY", "WEDNESDAY", "THURSDAY", "FRIDAY", "SATURDAY"]
}
```

---

## 3. Personal (Requiere Token)

### 3.1. Crear Jefe Contratista 1
*   **Método**: `POST`
*   **URL**: `http://localhost:3000/users`
*   **Body** (JSON):
```json
{
  "name": "Jefe",
  "lastname": "San Juan",
  "email": "jefe@sanjuan.com",
  "password": "password123",
  "phone": "911111111",
  "dni": "10000001",
  "role_ids": ["BOSS"],
  "contractor_id": 1
}
```

### 3.2. Crear Jefe Contratista 2
*   **Método**: `POST`
*   **URL**: `http://localhost:3000/users`
*   **Body** (JSON):
```json
{
  "name": "Jefe",
  "lastname": "Sur",
  "email": "jefe@sur.com",
  "password": "password123",
  "phone": "911111112",
  "dni": "10000002",
  "role_ids": ["BOSS"],
  "contractor_id": 2
}
```

### 3.3. Crear Seguridad 1
*   **Método**: `POST`
*   **URL**: `http://localhost:3000/users`
*   **Body** (JSON):
```json
{
  "name": "Guardia",
  "lastname": "Uno",
  "email": "guardia1@centinel.com",
  "password": "password123",
  "phone": "922222221",
  "dni": "20000001",
  "role_ids": ["SECURITY"]
}
```

### 3.4. Crear Seguridad 2
*   **Método**: `POST`
*   **URL**: `http://localhost:3000/users`
*   **Body** (JSON):
```json
{
  "name": "Guardia",
  "lastname": "Dos",
  "email": "guardia2@centinel.com",
  "password": "password123",
  "phone": "922222222",
  "dni": "20000002",
  "role_ids": ["SECURITY"]
}
```

### 3.5. Crear Trabajador (Ejemplo)
*Repite esto 5 veces por contratista cambiando DNI, Email y Teléfono.*
*   **Método**: `POST`
*   **URL**: `http://localhost:3000/users`
*   **Body** (JSON):
```json
{
  "name": "ObreroSJ",
  "lastname": "1",
  "email": "obrerosj1@sanjuan.com",
  "password": "password123",
  "phone": "930000001",
  "dni": "30000001",
  "role_ids": ["WORKER"],
  "contractor_id": 1,
  "shift_id": 1
}
```

---

## 4. Asistencia (Requiere Token)

### 4.1. Registrar Entrada (Check-in)
*   **Método**: `POST`
*   **URL**: `http://localhost:3000/attendance/check-in`
*   **Body** (JSON):
```json
{
  "user_id": 6,
  "latitude": -12.046374,
  "longitude": -77.042793
}
```

### 4.2. Registrar Salida (Check-out)
*   **Método**: `POST`
*   **URL**: `http://localhost:3000/attendance/check-out`
*   **Body** (JSON):
```json
{
  "user_id": 6,
  "latitude": -12.046374,
  "longitude": -77.042793
}
```

---

## 5. Reportes (Requiere Token)

### 5.1. Listar Asistencia (Filtrada)
*   **Método**: `GET`
*   **URL**: `http://localhost:3000/attendance?startDate=2024-01-01&endDate=2024-12-31`
*   **Body**: (Vacío)

---

## 6. Extras / Correcciones

### 6.1. Cambiar Rol de Usuario (Corregir a ADMIN)
Si creaste un usuario y olvidaste asignarle el rol, usa esto para corregirlo.
*   **Método**: `PUT`
*   **URL**: `http://localhost:3000/users/1/roles`
*   *(Reemplaza `1` por el ID del usuario que quieres corregir)*
*   **Body** (JSON):
```json
{
  "rolesIds": ["ADMIN"]
}
```
*Nota: Necesitas permisos de ADMIN para ejecutar esto.*

### 6.2. Listar Trabajadores por Contratista
*   **Método**: `GET`
*   **URL**: `http://localhost:3000/users?contractor_id=1`
*   *(Reemplaza `1` por el ID de la contratista)*

### 6.3. Listar Contratistas
*   **Método**: `GET`
*   **URL**: `http://localhost:3000/contractors`

### 6.4. Filtrar Asistencia por Tipo
*   **Método**: `GET`
*   **URL**: `http://localhost:3000/attendance?type=CHECK_IN`
*   *Opciones para `type`: `CHECK_IN` (activos), `CHECK_OUT` (finalizados)*

### 6.5. Eliminar Rol
*   **Método**: `DELETE`
*   **URL**: `http://localhost:3000/roles/ID_DEL_ROL`

### 6.6. Actualizar Usuario (Parcial)
*   **Método**: `PATCH`
*   **URL**: `http://localhost:3000/users/ID_DEL_USUARIO`
*   **Body** (JSON) - *Envía solo lo que quieras cambiar*:
```json
{
  "name": "Nuevo Nombre"
}
```


PATCH

ADMIN, BOSS

http://localhost:3000/users/5

{
  "name": "Nuevo Nombre",
  "lastname": "Nuevo Apellido",
  "phone": "999888777",
  "contractor_id": 1,
  "shift_id": 2,
  "is_active": true
}


Otras APIs de actualización específicas
El sistema tiene endpoints separados para casos especiales:

Actualizar con Imagen (Foto de Perfil):

Método: PUT
URL: http://localhost:3000/users/upload/:id
Tipo: multipart/form-data (campo file para la imagen y campos de texto para datos adicionales).
Actualizar Contraseña:

Método: PUT
URL: http://localhost:3000/users/:id/password
Body: {"newPassword": "..."}
Actualizar Roles (Solo Admin):

Método: PUT
URL: http://localhost:3000/users/:id/roles
Body: {"rolesIds": ["ADMIN", "WORKER"]}