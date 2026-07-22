# Cómo trabajar con este repositorio

Guía simple para colaborar en la app de Masapan sin pisarse. Pensada para Pablo (y cualquier
colaborador).

---

## ✅ Antes de empezar (una sola vez)

1. **Ser colaborador del repo.** Gonzalo te invita desde GitHub
   (*repo → Settings → Collaborators → Add people*). Aceptás la invitación por email o en
   github.com/notifications. Sin esto **no vas a poder subir cambios**.
2. **Iniciar sesión con tu cuenta de GitHub** (en GitHub Desktop, o con tu token en Terminal).
3. **Clonar el repo** a tu computador:
   - GitHub Desktop: *File → Clone repository → mazapan-pm*.
   - O Terminal: `git clone https://github.com/Gonzaloegrow97/mazapan-pm.git`

Para **usar** la app: abrí `mazapan-pm.html` con doble clic (se abre en el navegador).

---

## 🔑 La regla de oro

**Siempre traé lo último ANTES de empezar y ANTES de subir** (`Pull` / `Fetch origin`).
Así los dos trabajan sobre la última versión y se evitan conflictos.

Flujo mental: **Pull → cambios → Commit → Push**.

---

## 🖱️ Opción 1 — GitHub Desktop (la más fácil, con botones)

1. Abrí GitHub Desktop → apretá **"Fetch origin" / "Pull origin"** (traer lo último).
2. Hacé tus cambios (editando el archivo o pidiéndoselos a Claude Code).
3. Abajo a la izquierda, escribí un resumen corto del cambio → **"Commit to main"**.
4. Arriba, apretá **"Push origin"**. ✅ Listo, quedó en GitHub.

Cuando el otro quiera tus cambios, hace **"Pull origin"**.

---

## 🤖 Opción 2 — Desde Claude Code (con palabras normales)

Como vas a usar Claude Code, es aún más simple. Le decís:

- Al empezar: **"hacé pull para traer lo último"**
- Al terminar: **"commiteá y subí los cambios a GitHub"**

Claude Code corre los comandos por vos. La primera vez quizás te pida iniciar sesión en
GitHub → lo hacés con tu cuenta.

---

## ⌨️ Opción 3 — Terminal (si preferís comandos)

```bash
cd mazapan-pm
git pull            # traer lo último ANTES de empezar
# ...hacés tus cambios...
git add -A
git commit -m "descripción corta del cambio"
git push            # subir a GitHub
```

---

## ⚠️ Importante: qué se comparte y qué no

- **La app (el código, `mazapan-pm.html`)** → SÍ se comparte por GitHub. Todo cambio que
  subas, el otro lo baja con `Pull`.
- **Los datos de tareas/KPIs que cargás en el navegador** → NO se comparten solos (viven en
  el localStorage de cada navegador). Para pasarlos, usá *Áreas y Datos → Exportar/Importar
  respaldo (JSON)*.
- Para que los datos se compartan **en vivo** entre todos, el próximo paso es conectar un
  backend en la nube (Supabase).

## 🔒 Reglas
- El repo es **privado** (tiene datos financieros reales). No lo hagas público.
- No actives **GitHub Pages** (publicaría los financieros).
