-- =====================================================================
-- Masapan · Gestión de Proyectos — Esquema inicial (versión nube)
-- Pegar y ejecutar en: Supabase → SQL Editor → New query → Run
-- =====================================================================

-- ---------- Tablas ----------
create table if not exists areas (
  id text primary key,
  nombre text,
  color text,
  responsable text,
  subareas jsonb default '[]'::jsonb
);

create table if not exists tareas (
  id uuid primary key default gen_random_uuid(),
  titulo text not null,
  descripcion text,
  area text,
  subarea text,
  responsable text,
  entregable text,
  prioridad text default 'media',
  estado text default 'pendiente',
  fecha_inicio date,
  fecha_vencimiento date,
  kpi_id text,
  notas text,
  created_at timestamptz default now(),
  updated_at timestamptz default now()
);

create table if not exists kpis (
  id text primary key,
  nombre text,
  area text,
  meta numeric,
  valor_actual numeric,
  unidad text,
  periodo text,
  direccion text default 'mayor',
  tendencia text default 'flat'
);

create table if not exists reportes (
  id uuid primary key default gen_random_uuid(),
  nombre text,
  area text,
  responsable text,
  frecuencia text default 'semanal',
  proxima_entrega date,
  ultima_entrega date,
  estado text default 'pendiente'
);

create table if not exists ventas (
  id uuid primary key default gen_random_uuid(),
  periodo_label text,
  total_venta numeric,
  neto numeric,
  costo numeric,
  ganancia numeric,
  margen_pct numeric,
  unidades numeric,
  por_categoria jsonb,
  top_productos jsonb,
  fuente text,
  importado_por text,
  importado_el timestamptz default now()
);

create table if not exists profiles (
  id uuid primary key references auth.users on delete cascade,
  nombre text,
  rol text default 'empleado'
);

-- ---------- Seguridad (RLS) ----------
alter table areas    enable row level security;
alter table tareas   enable row level security;
alter table kpis     enable row level security;
alter table reportes enable row level security;
alter table ventas   enable row level security;
alter table profiles enable row level security;

-- MVP: cualquier usuario logueado puede leer y escribir.
-- (Los permisos por rol los afinamos en la Etapa 3.)
create policy "auth full areas"    on areas    for all to authenticated using (true) with check (true);
create policy "auth full tareas"   on tareas   for all to authenticated using (true) with check (true);
create policy "auth full kpis"     on kpis     for all to authenticated using (true) with check (true);
create policy "auth full reportes" on reportes for all to authenticated using (true) with check (true);
create policy "auth full ventas"   on ventas   for all to authenticated using (true) with check (true);
create policy "auth read profiles" on profiles for select to authenticated using (true);
create policy "auth self profile"  on profiles for all to authenticated using (auth.uid() = id) with check (auth.uid() = id);

-- ---------- Realtime (para que se actualice en vivo) ----------
alter publication supabase_realtime add table tareas;
alter publication supabase_realtime add table kpis;
alter publication supabase_realtime add table reportes;
alter publication supabase_realtime add table ventas;
