import subprocess
from datetime import datetime

LOG_FILE = "pipeline.log"

print("=" * 50)
print("SUPPLY CHAIN PIPELINE")
print("=" * 50)

with open(LOG_FILE, "w") as log:

    log.write("Supply Chain Monitoring Platform\n")
    log.write("=" * 50 + "\n")
    log.write(f"Started : {datetime.now()}\n\n")

    try:

        result = subprocess.run(
            ["python", "week2_capstone.py"],
            capture_output=True,
            text=True
        )

        log.write(result.stdout)
        log.write("\n")

        if result.returncode == 0:

            log.write("Status : SUCCESS\n")
            print("Pipeline executed successfully.")

        else:

            log.write(result.stderr)
            log.write("\nStatus : FAILED\n")
            print("Pipeline Failed")

    except Exception as e:

        log.write(str(e))
        log.write("\nStatus : FAILED\n")

    log.write(f"\nFinished : {datetime.now()}\n")

print("Pipeline log generated successfully.")