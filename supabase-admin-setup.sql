-- Run this after the main Supabase schema has been installed and after your account has signed up.
-- 1) Allow the admin account to view the registered users list in the app.
drop policy if exists "Admins can read all profiles" on public.profiles;
create policy "Admins can read all profiles"
  on public.profiles for select to authenticated
  using (public.is_expense_tracker_admin());

-- 2) After creating your own account in the app, replace the email below and run this statement.
-- This is executed from the Supabase SQL Editor as project owner.
-- update public.profiles set is_admin = true where lower(email) = lower('YOUR_EMAIL@example.com');
