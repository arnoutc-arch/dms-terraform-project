# AWS DMS performs a full load followed by ongoing Change Data Capture (CDC) replication

resource "aws_dms_replication_task" "cdc" {
    replication_task_id = "dvdrental-cdc"
    migration_type = "full-load-and-cdc"
    replication_instance_arn = aws_dms_replication_instance.main.replication_instance_arn
    source_endpoint_arn = aws_dms_endpoint.source.endpoint_arn
    target_endpoint_arn = aws_dms_endpoint.target.endpoint_arn
    table_mappings = jsonencode({
      rules = [
        {
          rule_type = "selection"
          rule_id   = "1"
          rule_name = "1"
          
          object-locator = {
            schema-name = "public"
            table-name  = "%"
          }

          rule-action = "include"  
        }
      ]
    })
}