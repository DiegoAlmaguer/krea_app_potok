# Roles and scenarios

## Client
- Views project list and statuses.
- Opens task progress and project comments.
- Uploads files to Supabase Storage bucket `project_files` (to implement in next iteration).

## Staff
- Sees assigned tasks/projects.
- Changes task status (`todo` → `in_progress` → `done`).
- Adds completion notes/comments.

## Admin
- Manages users and role values in `profiles.role`.
- Creates projects and assigns `staff_id`.
- Reviews simple chart-based analytics dashboard.
