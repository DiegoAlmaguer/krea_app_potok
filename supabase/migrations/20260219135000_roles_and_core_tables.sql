-- Fallback migration if source repo schema is missing these entities.
-- Validate against existing production schema before applying.

create table if not exists public.profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  email text,
  full_name text,
  role text not null default 'client' check (role in ('client','staff','admin')),
  created_at timestamptz default now()
);

create table if not exists public.projects (
  id uuid primary key default gen_random_uuid(),
  title text not null,
  description text,
  status text not null default 'new',
  client_id uuid references public.profiles(id),
  staff_id uuid references public.profiles(id),
  created_at timestamptz default now()
);

create table if not exists public.tasks (
  id uuid primary key default gen_random_uuid(),
  project_id uuid references public.projects(id) on delete cascade,
  title text not null,
  status text not null default 'todo',
  assignee_id uuid references public.profiles(id),
  due_date timestamptz
);

create table if not exists public.comments (
  id uuid primary key default gen_random_uuid(),
  project_id uuid references public.projects(id) on delete cascade,
  author_id uuid references public.profiles(id),
  content text not null,
  created_at timestamptz default now()
);
