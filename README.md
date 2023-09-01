## Usage

```hcl
module "disk_snapshots" {
    source     = "git::https://github.com/muralisathenapally/tfm.git?ref=gce-vm-backups"
    name       = "my-snapshot-policy"
    project    = "my-project-id"
    region     = "us-central1"
    disks      = ["disk2"]
    disks_zone = "us-central1-c"
    snapshot_retention_policy = {
        max_retention_days    = 10
        on_source_disk_delete = "KEEP_AUTO_SNAPSHOTS"
    }
    snapshot_schedule = {
        daily_schedule = {
        days_in_cycle = 1
        start_time    = "08:00" #specify in UTC"
        }
        hourly_schedule = null
        weekly_schedule = null
    }
    snapshot_properties = {
    guest_flush       = false
    storage_locations = ["US"]
    labels            = null
    }
}
```