import { createClient } from "https://cdn.jsdelivr.net/npm/@supabase/supabase-js@2/+esm";


const supabaseUrl = "https://nmkxyncyhucsekvumatb.supabase.co";

const supabaseAnonKey =
  "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5ta3h5bmN5aHVjc2VrdnVtYXRiIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzE3OTY5MDMsImV4cCI6MjA4NzM3MjkwM30.yk22wIcLbGvraMC_Jfih131oxu-HmUOiD0usY9CdDnM";

export const supabase = createClient(
  supabaseUrl,
  supabaseAnonKey
);