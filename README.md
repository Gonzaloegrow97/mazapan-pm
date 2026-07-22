# Masapan · Gestión de Proyectos

Aplicación de gestión y control de gestión para **Masapan** (panadería), pensada para el
Gerente General. Es una **app de un solo archivo** (`mazapan-pm.html`) que funciona en el
navegador, sin instalación ni servidor.

> ⚠️ **Repositorio privado.** Contiene datos reales del negocio (Estado de Resultado,
> ventas, márgenes). No lo hagas público ni actives GitHub Pages.

## Cómo usarla

1. Descargá o cloná el repositorio.
2. Abrí **`mazapan-pm.html`** con doble clic (se abre en tu navegador). Usala a pantalla
   completa.
3. Los datos que vas cargando (tareas, KPIs) se guardan en **tu navegador** (localStorage).

## Estructura de la app

- **Dirección:** Panel del Gerente · Cuadro de Mando Integral (Balanced Scorecard)
- **Áreas:** Comercial · Producción · Finanzas y Admin. · Recursos Humanos · Abastecimiento
  (cada área es un hub con su analítica, KPIs, tareas y reportes)
- **Gestión:** Pendientes (Kanban) · Calendario · Reportes · KPIs · Áreas y Datos

## Datos

- **Tareas / KPIs / reportes:** se guardan en el navegador de cada persona. Para
  compartirlos, usá **Áreas y Datos → Exportar/Importar respaldo (JSON)**.
- **Datos financieros y de ventas** (P&L, clientes, mermas): vienen incrustados en la app,
  procesados desde los Excel del negocio (OpenTPV / EERR).
- **Importar ventas:** en la vista *Ventas (ERP)* podés arrastrar el Excel de ventas y se
  actualizan los KPIs.

## Colaboración (estado actual)

Hoy la app se **comparte y versiona** por GitHub (el programa), pero los datos de trabajo son
locales de cada persona. Para tener **datos compartidos en vivo** (que todos vean lo mismo en
tiempo real) el siguiente paso es conectar un backend en la nube (ej. Supabase). Ver
`ROADMAP`.

## Roadmap

- [x] Estructura base + vistas de gestión
- [x] Estado de Resultado (P&L) con datos reales
- [x] Análisis de Cliente · Producción (mermas) · Cuadro de Mando Integral
- [x] Navegación organizada por áreas
- [ ] Presupuesto vs. Real (falta cargar archivo de presupuestos)
- [ ] Backend en la nube para datos compartidos en vivo
