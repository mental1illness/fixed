local run = run_on_thread or run_on_actor
local grabactors = getactorthreads or getactor

run(grabactors()[1], game:HttpGet("https://raw.githubusercontent.com/mental1illness/fixed/refs/heads/main/roxy-win-fixed/source.lua"))
