# Mazapán · Gestión de Proyectos — Guía para Claude Code

Contexto del proyecto para que Claude Code trabaje bien en este repo desde el primer momento.

## Qué es
Aplicación de gestión y control de gestión para **Mazapán** (panadería), para el Gerente
General. Es una **app de un solo archivo**: `mazapan-pm.html`.

- Vanilla JS + CSS **inline**, sin build, sin dependencias externas.
- El lector de Excel (SheetJS) está **incrustado inline** → funciona **offline**.
- Persistencia en el navegador vía **localStorage** (clave `mazapan_pm_v1`).
- Para verla: abrir `mazapan-pm.html` en el navegador (doble clic), a pantalla completa.

## El negocio
Panadería con **2 tiendas**: **L.E** (Las Encinas) y **P.F** (Panadería Francesa).
**2 entidades**: *Comercial el Cacique* y *Waeger SPA*. Punto de venta: **OpenTPV**.

## Navegación (3 grupos)
- **Dirección:** Panel del Gerente · Cuadro de Mando Integral (Balanced Scorecard)
- **Áreas:** Comercial · Producción · Finanzas y Admin. · Recursos Humanos · Abastecimiento
  (cada área es un *hub* con su analítica, KPIs, tareas y reportes filtrados)
- **Gestión:** Pendientes (Kanban) · Calendario · Reportes · KPIs · Áreas y Datos

## Modelo de datos
- **localStorage:** `areas[]`, `tareas[]`, `kpis[]`, `reportes[]` (editables por el usuario).
- **Constantes con datos reales incrustados en el HTML:**
  - `PNL_DATA` → Estado de Resultado mensual por entidad (Ene–Jun 2026)
  - `CLIENTES_DATA` → ticket promedio, tráfico, conversión, boletas por tienda
  - `PROD_DATA` → merma valorizada por categoría/semana
- Los datos reales se procesan desde los Excel del ERP (carpeta `datos/`, **gitignored**)
  con Python (openpyxl) y se incrustan como constantes JS. La vista *Ventas (ERP)* además
  importa el Excel de OpenTPV directo en el navegador.

## Convenciones
- Mantener **un solo archivo HTML**, todo inline y offline (no agregar CDNs ni build).
- **Español** en toda la interfaz.
- Cada vista se agrega con: botón en `#nav`, entrada en `TITLES`, en el dispatch de
  `render()`, y una función `renderX(c)`.

## Importante (seguridad)
- El repo debe seguir **privado**: contiene P&L y ventas reales.
- **No** activar GitHub Pages (publicaría los datos financieros).
- La carpeta `datos/` (Excel crudos) está en `.gitignore` — no subir datos sensibles.

## Roadmap
- [x] Estructura + vistas de gestión + tableros con datos reales + navegación por áreas
- [ ] Presupuesto vs. Real (falta cargar archivo de presupuestos en `datos/`)
- [ ] Backend en la nube (Supabase) para datos compartidos en vivo entre colaboradores
