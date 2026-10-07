-- WashRAMS account tables. Run once in Supabase: SQL Editor > New query > paste > Run.

create table if not exists public.profiles (
  user_id    uuid primary key default auth.uid() references auth.users on delete cascade,
  company    jsonb not null default '{}'::jsonb,
  defaults   jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);

create table if not exists public.jobs (
  id         uuid primary key,
  user_id    uuid not null default auth.uid() references auth.users on delete cascade,
  ref        text,
  client     text,
  site       text,
  data       jsonb not null,
  updated_at timestamptz not null default now()
);
create index if not exists jobs_user_updated_idx on public.jobs (user_id, updated_at desc);

-- Each person can only see and change their own rows.
alter table public.profiles enable row level security;
alter table public.jobs     enable row level security;

drop policy if exists "own profile" on public.profiles;
create policy "own profile" on public.profiles for all to authenticated
  using (user_id = (select auth.uid())) with check (user_id = (select auth.uid()));

drop policy if exists "own jobs" on public.jobs;
create policy "own jobs" on public.jobs for all to authenticated
  using (user_id = (select auth.uid())) with check (user_id = (select auth.uid()));
