# Syntro — Inicio con Docker

## Requisitos
- Docker Desktop con Docker Compose habilitado.

## Archivos
Mantén esta estructura para que las rutas de `docker-compose.yml` funcionen:

- `docker-compose.yml`
- `.env.example`
- `backend/Dockerfile.dev`
- `frontend/Dockerfile`

Este Compose usa `backend/Dockerfile.dev` para la API y `frontend/Dockerfile` para el frontend.

## Levantar el proyecto
Desde la carpeta que contiene `docker-compose.yml`, crea el archivo de configuración y levanta los servicios:

```bash
cp .env.example .env
```

En Windows PowerShell, si `cp` no está disponible:

```powershell
Copy-Item .env.example .env
```

Antes de un despliegue real, cambia `ADMIN_PASSWORD` y `NETWORK_TELEMETRY_INGEST_API_KEY` en `.env`. Luego ejecuta:

```bash
docker compose up -d --build
```

- Frontend: http://localhost:8081
- API: http://localhost:5001
- Panel de administración: http://localhost:5001/dashboard

Para detener los servicios:

```bash
docker compose down
```
