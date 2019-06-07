##Variable for DynamoDB Table

variable "name" {
  type        = "string"
  description = "Tne name of the table, this needs to be unique within a region"
  default     = ""
}

variable "billing_mode" {
  type        = "string"
  description = "Crontrols how you are charged for read and writhe throughput and how you manage capacity. The valid values are PROVISIONED and PAY_PER_REQUEST. Default to PROVISIONED."
  default     = "PROVISIONED"
}

variable "hash_key" {
  type        = "string"
  description = "The attribute to use as the hash (partition) key. Must also be defined as an attribute (Required, Forces new resource)"
  default     = ""
}

variable "range_key" {
  type        = "string"
  description = "The attribute to use as the range (sort) key. Must also be defined as an attribute(Optional, Force new resource)"
  default     = ""
}

variable "write_capacity" {
  type       = "string"
  description = "The number of the write units for thes table. If the billing_mode is PROVISIONED, this field is required"
  default    = ""
}

variable "read_capacity" {
  type        = "string"
  description = "The number of the read units for this table. If the billing_mode is PROVISIONED, this field is required"
  default     = ""
}

variable "attribute" {
  type        = "list"
  description = "List of nested attribute definitions. Only required for hash_key and range_key attributes. Each attribute has two properties"
  default     = []
}

variable "attribute_name" {
  type        = "string"
  description = "The name of attribute"
  default     = ""
}

variable "type" {
  type        = "string"
  description = "Attribute type, which must be a scalar type: S(string), N(number) or B(binary data)"
  default     = ""
}

variable "ttl" {
  type        = "string"
  description = "Defines ttl, has two properties, and can only be specified once:"
  default     = ""
}

variable "ttl_enable" {
  type        = "string"
  description = "Indicates whether ttl is enabled (true) or disable (false)"
  default     = "false"
}

variable "ttl_attribute_name" {
  type        = "string"
  description = "The name of the table attribute to store the TTL timestamp in"
  default     = ""
}

variable "local_secondary_index" {
  type        = "string"
  description = "Describe an LSI on the table; these can only be allocated at creation so you cannot change this definition after you created the resource (Optional, Forces new resource)"
  default     = ""
}

variable "global_secondary_index" {
  type        = "string"
  description = "Describe a GSI for the table; subject to the normal limits on the number of GSIs, projected attributes, etc"
  default     = ""
}

variable "has_global_secondary_index" {
  type        = "string"
  description = "TRUE or FALSE"
  default     = "false"
}

variable "has_local_secondary_index" {
  type        = "string"
  description = "TRUE or FALSE"
  default     = "false"
}

variable "stream_enabled" {
  type        = "string"
  description = "Indicates whether Streams are to be enabled (true) or disabled (false)"
  default     = ""
}

variable "stream_view_type" {
  type        = "string"
  description = "When an item in the table is modified, Tream_View_Type determines what information is writtem to the table's stream. Valid values are KEYS_ONLY, NEW_IMAGE, OLD_IMAGE, NEW_AND_OLD_IMAGES"
  default     = ""
}

variable "server_side_encryption" {
  type        = "string"
  description = "Encryption at reset options. AWS DynamoDB tables are automatically encrypted at reset whit an AWS owned Customer Master KEy if this argument isn't specified"
  default     = ""
}

variable "tags" {
  type        = "map"
  description = "A map of tags to populate on the created table. Name, Environment"
  default     = {}
}

variable "point_in_time_recovery" {
  type        = "string"
  description = "Point-in-time recovery options"
  default     = ""
}

##Timeouts
  ##The timeouts block allows you to specify timeouts for certain action

variable "create" {
  type        = "string"
  description = "Used when creating the table (defaults to 10 mins)"
  default     = "10"
}

variable "update" {
  type        = "string"
  description = "Used when updating the table configuration and reset for each individual Global Secondary Index update (Defaults to 60 mins)"
  default     = "60"
}

variable "delete" {
  type        = "string"
  description = "Used when deleting the table (defaults to 10 mins)"
  default     = "10"
}

##Nested field
  ##Variables for local_secondary_index

variable "index_name" {
  type        = "string"
  description = "The name of the index"
  default     = ""
}

variable "index_hash_key" {
  type        = "string"
  description = "The name of the hash key; must be defined"
  default     = ""
}

variable "index_range_key" {
  type        = "string"
  description = "The name of the range key; must be defined"
  default     = ""
}

variable "projection_type" {
  type        = "string"
  description = "One of ALL, INCLUDE or KEYS_ONLY where ALL projects every attribute into the index, KEYS_ONLY projects just the hash and range key into the index, an INCLUDE projects only the keys specified the non_key_attributes parameter"
  default     = ""
}

variable "non_key_attributes" {
  type        = "list"
  description = "Only required with INCLUDE as a projection type; a list of attributes to project into the index. These do not need to be defined as attributes on the table"
  default     = []
}

##Variable for global_secondary_index

variable "global_index_name" {
  type        = "string"
  description = "The name of the index"
  default     = ""
}

variable "global_index_write_capacity" {
  type        = "string"
  description = "The number of write units for this index. Must be set if billing+mode is set to PROVISIONED"
  default     = "10"
}

variable "global_index_read_capacity" {
  type        = "string"
  description = "The number of read units for this index. Must be set if billing_mode is set to PROVISIONED"
  default     = "10"
}

variable "global_index_hash_key" {
  type        = "string"
  description = "The name of the hash key in the index; must be defined as an attribute in the resource"
  default     = ""
}

variable "global_index_range_key" {
  type        = "string"
  description = "The name of the range key; must be defined"
  default     = ""
}

variable "global_index_projection_type" {
  type        = "string"
  description = "One of ALL, INCLUDE or KEYS_ONLY where ALL projects every attribute into the index, KEYS_ONLY project just the hash and range key into the index, and ICLUDE projects only the keys specified in the non_key_attributes parameter"
  default     = ""
}

variable "global_index_non_key_attributes" {
  type        = "list"
  description = "Only required with INCLUDE as a projection type; a list of attributes to project into the index. Thes do not need to be defined as attributes on the table"
  default     = []
}

##Variable for server_side_encryption

variable "encryption_enabled" {
  type        = "string"
  description = "Whether or not to enable encryption at rest using a AWS managed Customer Master Key. If enable is false then server is true the server-side encryption is set to aws managed CMK (shoen as KMS in the AWS console). The AWS KMS cocumentation explains the diference bettwen AWS owned an AWS managed CMKs"
  default     = "false" 
}

##Variable for point_in_time_recovery

variable "time_recovery_enable" {
  type        = "string"
  description = "Whether to enable point-in-time-recovery-note that it can take up to 10 minutes to enable for new tables. If the point_in_time_recovery block is not provided then this default to false "
  default     = "false"
}
